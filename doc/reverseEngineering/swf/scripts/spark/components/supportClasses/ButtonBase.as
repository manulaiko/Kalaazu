package spark.components.supportClasses
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.core.IVisualElement;
   import mx.core.InteractionMode;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.SandboxMouseEvent;
   import mx.events.TouchInteractionEvent;
   import mx.managers.IFocusManagerComponent;
   import spark.core.IDisplayText;
   import spark.primitives.BitmapImage;
   
   public class ButtonBase extends SkinnableComponent implements IFocusManagerComponent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      private var _downEventFired:Boolean = false;
      
      private var checkForButtonDownConditions:Boolean = false;
      
      private var autoRepeatTimer:Timer;
      
      private var mouseDownSelectTimer:Timer;
      
      private var mouseUpDeselectTimer:Timer;
      
      private var rollOutWhileFakingDownState:Boolean = false;
      
      mx_internal var disableMinimumDownStateTime:Boolean = false;
      
      [SkinPart(required="false")]
      public var iconDisplay:BitmapImage;
      
      [SkinPart(required="false")]
      public var labelDisplay:IDisplayText;
      
      private var _explicitToolTip:Boolean = false;
      
      private var _autoRepeat:Boolean;
      
      private var _content;
      
      private var _hovered:Boolean = false;
      
      private var _keepDown:Boolean = false;
      
      private var _keyboardPressed:Boolean = false;
      
      private var _mouseCaptured:Boolean = false;
      
      private var _stickyHighlighting:Boolean = false;
      
      public function ButtonBase()
      {
         super();
         mouseChildren = false;
         this.addHandlers();
      }
      
      override public function get baselinePosition() : Number
      {
         return getBaselinePositionForPart(this.labelDisplay as IVisualElement);
      }
      
      override public function set toolTip(param1:String) : void
      {
         super.toolTip = param1;
         this._explicitToolTip = param1 != null;
      }
      
      public function get autoRepeat() : Boolean
      {
         return this._autoRepeat;
      }
      
      public function set autoRepeat(param1:Boolean) : void
      {
         if(param1 == this._autoRepeat)
         {
            return;
         }
         this._autoRepeat = param1;
         this.checkAutoRepeatTimerConditions(this.isDown());
      }
      
      [Bindable("contentChange")]
      public function get content() : Object
      {
         return this._content;
      }
      
      public function set content(param1:Object) : void
      {
         this._content = param1;
         if(this.labelDisplay)
         {
            this.labelDisplay.text = this.label;
         }
         dispatchEvent(new Event("contentChange"));
      }
      
      protected function get hovered() : Boolean
      {
         return this._hovered;
      }
      
      protected function set hovered(param1:Boolean) : void
      {
         if(param1 == this._hovered)
         {
            return;
         }
         this._hovered = param1;
         this.invalidateButtonState();
      }
      
      mx_internal function keepDown(param1:Boolean, param2:Boolean = true) : void
      {
         if(this._keepDown == param1)
         {
            return;
         }
         this._keepDown = param1;
         if(!param2)
         {
            this._downEventFired = true;
         }
         if(this._keepDown)
         {
            invalidateSkinState();
         }
         else
         {
            this.invalidateButtonState();
         }
      }
      
      protected function get keyboardPressed() : Boolean
      {
         return this._keyboardPressed;
      }
      
      protected function set keyboardPressed(param1:Boolean) : void
      {
         if(param1 == this._keyboardPressed)
         {
            return;
         }
         this._keyboardPressed = param1;
         this.invalidateButtonState();
      }
      
      [Bindable("contentChange")]
      public function set label(param1:String) : void
      {
         this.content = param1;
      }
      
      public function get label() : String
      {
         return this.content != null ? this.content.toString() : "";
      }
      
      protected function get mouseCaptured() : Boolean
      {
         return this._mouseCaptured;
      }
      
      protected function set mouseCaptured(param1:Boolean) : void
      {
         if(param1 == this._mouseCaptured)
         {
            return;
         }
         this._mouseCaptured = param1;
         this.invalidateButtonState();
         if(!param1)
         {
            this.removeSystemMouseHandlers();
         }
      }
      
      public function get stickyHighlighting() : Boolean
      {
         return this._stickyHighlighting;
      }
      
      public function set stickyHighlighting(param1:Boolean) : void
      {
         if(param1 == this._stickyHighlighting)
         {
            return;
         }
         this._stickyHighlighting = param1;
         this.invalidateButtonState();
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            ButtonBase.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.checkForButtonDownConditions)
         {
            this.dispatchButtonEvents();
            this.checkForButtonDownConditions = false;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this.labelDisplay.addEventListener("isTruncatedChanged",this.labelDisplay_isTruncatedChangedHandler);
            if(this._content !== undefined)
            {
               this.labelDisplay.text = this.label;
            }
         }
         else if(param2 == this.iconDisplay)
         {
            this.iconDisplay.source = getStyle("icon");
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this.labelDisplay.removeEventListener("isTruncatedChanged",this.labelDisplay_isTruncatedChangedHandler);
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(!enabled)
         {
            return "disabled";
         }
         if(this.isDown() || this._keepDown)
         {
            return "down";
         }
         if(getStyle("interactionMode") == InteractionMode.MOUSE && (this.hovered || this.mouseCaptured))
         {
            return "over";
         }
         return "up";
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(!param1 || param1 == "styleName" || param1 == "icon")
         {
            if(this.iconDisplay)
            {
               this.iconDisplay.source = getStyle("icon");
            }
         }
         super.styleChanged(param1);
      }
      
      protected function addHandlers() : void
      {
         addEventListener(MouseEvent.ROLL_OVER,this.mouseEventHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.mouseEventHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseEventHandler);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseEventHandler);
         addEventListener(MouseEvent.CLICK,this.mouseEventHandler);
         addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_START,this.touchInteractionStartHandler);
      }
      
      private function addSystemMouseHandlers() : void
      {
         systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseUpHandler);
      }
      
      private function removeSystemMouseHandlers() : void
      {
         systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseUpHandler);
      }
      
      private function isDown() : Boolean
      {
         if(!enabled)
         {
            return false;
         }
         if(this.keyboardPressed)
         {
            return true;
         }
         if(this.mouseCaptured && (this.hovered || this.stickyHighlighting))
         {
            return true;
         }
         return false;
      }
      
      private function invalidateButtonState() : void
      {
         this.checkForButtonDownConditions = true;
         invalidateProperties();
         invalidateSkinState();
      }
      
      private function checkAutoRepeatTimerConditions(param1:Boolean) : void
      {
         var _loc2_:Boolean = this.autoRepeat && param1;
         var _loc3_:* = this.autoRepeatTimer != null;
         if(_loc2_ == _loc3_)
         {
            return;
         }
         if(_loc2_)
         {
            this.startAutoRepeatTimer();
         }
         else
         {
            this.stopAutoRepeatTimer();
         }
      }
      
      private function startAutoRepeatTimer() : void
      {
         this.autoRepeatTimer = new Timer(1);
         this.autoRepeatTimer.delay = getStyle("repeatDelay");
         this.autoRepeatTimer.addEventListener(TimerEvent.TIMER,this.autoRepeat_timerDelayHandler);
         this.autoRepeatTimer.start();
      }
      
      private function stopAutoRepeatTimer() : void
      {
         this.autoRepeatTimer.stop();
         this.autoRepeatTimer = null;
      }
      
      private function startSelectButtonAfterDelayTimer() : void
      {
         var _loc1_:Number = getStyle("touchDelay");
         if(_loc1_ > 0)
         {
            this.mouseDownSelectTimer = new Timer(_loc1_,1);
            this.mouseDownSelectTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.mouseDownSelectTimer_timerCompleteHandler);
            this.mouseDownSelectTimer.start();
         }
         else
         {
            this.mouseDownSelectTimer_timerCompleteHandler();
         }
      }
      
      private function stopSelectButtonAfterDelayTimer() : void
      {
         if(this.mouseDownSelectTimer)
         {
            this.mouseDownSelectTimer.stop();
            this.mouseDownSelectTimer = null;
         }
      }
      
      private function startDeselectButtonAfterDelayTimer() : void
      {
         var _loc1_:Number = this.mx_internal::disableMinimumDownStateTime ? 0 : getStyle("touchDelay");
         if(_loc1_ > 0)
         {
            this.mouseUpDeselectTimer = new Timer(_loc1_,1);
            this.mouseUpDeselectTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.mouseUpDeselectTimer_timerCompleteHandler);
            this.mouseUpDeselectTimer.start();
         }
         else
         {
            this.dispatchButtonEvents();
            this.mouseUpDeselectTimer_timerCompleteHandler();
         }
      }
      
      private function stopDeselectButtonAfterDelayTimer() : void
      {
         if(this.mouseUpDeselectTimer)
         {
            this.mouseUpDeselectTimer.stop();
            this.mouseUpDeselectTimer = null;
         }
      }
      
      private function dispatchButtonEvents() : void
      {
         var _loc1_:Boolean = this.isDown();
         if(this._downEventFired != _loc1_)
         {
            if(_loc1_ && hasEventListener(FlexEvent.BUTTON_DOWN))
            {
               dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
            }
            this._downEventFired = _loc1_;
            this.checkAutoRepeatTimerConditions(_loc1_);
         }
      }
      
      protected function buttonReleased() : void
      {
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(!(this.mouseUpDeselectTimer && this.mouseUpDeselectTimer.running))
         {
            this.mouseCaptured = false;
         }
         this.keyboardPressed = false;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.SPACE && !(getStyle("interactionMode") == InteractionMode.TOUCH && param1.keyCode == Keyboard.ENTER))
         {
            return;
         }
         this.keyboardPressed = true;
         param1.updateAfterEvent();
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.SPACE && !(getStyle("interactionMode") == InteractionMode.TOUCH && param1.keyCode == Keyboard.ENTER))
         {
            return;
         }
         if(enabled && this.keyboardPressed)
         {
            this.buttonReleased();
            this.keyboardPressed = false;
            dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
         param1.updateAfterEvent();
      }
      
      private function touchInteractionStartHandler(param1:TouchInteractionEvent) : void
      {
         this.stopSelectButtonAfterDelayTimer();
         this.hovered = false;
         this.mouseCaptured = false;
      }
      
      protected function mouseEventHandler(param1:Event) : void
      {
         var _loc2_:MouseEvent = param1 as MouseEvent;
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(_loc2_.buttonDown && !this.mouseCaptured)
               {
                  return;
               }
               this.hovered = true;
               this.rollOutWhileFakingDownState = false;
               break;
            case MouseEvent.ROLL_OUT:
               if(Boolean(this.mouseUpDeselectTimer) && this.mouseUpDeselectTimer.running)
               {
                  this.rollOutWhileFakingDownState = true;
                  break;
               }
               this.hovered = false;
               break;
            case MouseEvent.MOUSE_DOWN:
               if(param1.isDefaultPrevented())
               {
                  break;
               }
               this.stopDeselectButtonAfterDelayTimer();
               this.addSystemMouseHandlers();
               if(getStyle("interactionMode") == InteractionMode.TOUCH)
               {
                  this.startSelectButtonAfterDelayTimer();
                  break;
               }
               this.mouseCaptured = true;
               break;
            case MouseEvent.MOUSE_UP:
               if(param1.target == this)
               {
                  this.hovered = true;
                  if(Boolean(this.mouseDownSelectTimer) && this.mouseDownSelectTimer.running)
                  {
                     this.stopSelectButtonAfterDelayTimer();
                     this.mouseCaptured = true;
                     this.startDeselectButtonAfterDelayTimer();
                     break;
                  }
                  if(this.mouseCaptured)
                  {
                     this.buttonReleased();
                     this.mouseCaptured = false;
                     break;
                  }
                  break;
               }
               break;
            case MouseEvent.CLICK:
               if(!enabled)
               {
                  param1.stopImmediatePropagation();
               }
               else
               {
                  this.clickHandler(MouseEvent(param1));
               }
               return;
         }
         if(_loc2_)
         {
            _loc2_.updateAfterEvent();
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
      }
      
      private function systemManager_mouseUpHandler(param1:Event) : void
      {
         if(param1.target == this)
         {
            return;
         }
         if(!(this.mouseUpDeselectTimer && this.mouseUpDeselectTimer.running))
         {
            this.mouseCaptured = false;
         }
         if(Boolean(this.mouseDownSelectTimer) && this.mouseDownSelectTimer.running)
         {
            this.stopSelectButtonAfterDelayTimer();
         }
      }
      
      private function autoRepeat_timerDelayHandler(param1:TimerEvent) : void
      {
         this.autoRepeatTimer.reset();
         this.autoRepeatTimer.removeEventListener(TimerEvent.TIMER,this.autoRepeat_timerDelayHandler);
         this.autoRepeatTimer.delay = getStyle("repeatInterval");
         this.autoRepeatTimer.addEventListener(TimerEvent.TIMER,this.autoRepeat_timerHandler);
         this.autoRepeatTimer.start();
      }
      
      private function autoRepeat_timerHandler(param1:TimerEvent) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
      }
      
      private function mouseDownSelectTimer_timerCompleteHandler(param1:TimerEvent = null) : void
      {
         this.mouseCaptured = true;
      }
      
      private function mouseUpDeselectTimer_timerCompleteHandler(param1:TimerEvent = null) : void
      {
         this.buttonReleased();
         this.mouseCaptured = false;
         if(this.rollOutWhileFakingDownState)
         {
            this.rollOutWhileFakingDownState = false;
            this.hovered = false;
         }
      }
      
      private function labelDisplay_isTruncatedChangedHandler(param1:Event) : void
      {
         if(this._explicitToolTip)
         {
            return;
         }
         var _loc2_:Boolean = this.labelDisplay.isTruncated;
         super.toolTip = _loc2_ ? this.labelDisplay.text : null;
      }
   }
}
