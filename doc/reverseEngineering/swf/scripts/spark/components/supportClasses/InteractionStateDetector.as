package spark.components.supportClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.InteractionMode;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.SandboxMouseEvent;
   import mx.events.TouchInteractionEvent;
   import mx.managers.ISystemManager;
   
   public class InteractionStateDetector extends EventDispatcher
   {
       
      
      private var component:UIComponent;
      
      private var mouseDownSelectTimer:Timer;
      
      private var mouseUpDeselectTimer:Timer;
      
      private var rollOutWhileFakingDownState:Boolean = false;
      
      mx_internal var playTransitions:Boolean = true;
      
      private var systemMouseHandlersAdded:Boolean = false;
      
      private var _hovered:Boolean = false;
      
      private var _mouseCaptured:Boolean = false;
      
      public function InteractionStateDetector(param1:UIComponent)
      {
         super();
         this.component = param1;
         this.addHandlers();
      }
      
      private function get hovered() : Boolean
      {
         return this._hovered;
      }
      
      private function set hovered(param1:Boolean) : void
      {
         if(param1 == this._hovered)
         {
            return;
         }
         this._hovered = param1;
         this.invalidateState();
      }
      
      private function get mouseCaptured() : Boolean
      {
         return this._mouseCaptured;
      }
      
      private function set mouseCaptured(param1:Boolean) : void
      {
         if(!param1)
         {
            this.removeSystemMouseHandlers();
         }
         if(param1 == this._mouseCaptured)
         {
            return;
         }
         this._mouseCaptured = param1;
         this.invalidateState();
      }
      
      [Bindable("change")]
      public function get state() : String
      {
         if(this.isDown())
         {
            return InteractionState.DOWN;
         }
         if(this.hovered && this.component.getStyle("interactionMode") == InteractionMode.MOUSE)
         {
            return InteractionState.OVER;
         }
         return InteractionState.UP;
      }
      
      private function isDown() : Boolean
      {
         return this.mouseCaptured && this._hovered;
      }
      
      private function invalidateState() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function addHandlers() : void
      {
         this.component.addEventListener(MouseEvent.ROLL_OVER,this.mouseEventHandler);
         this.component.addEventListener(MouseEvent.ROLL_OUT,this.mouseEventHandler);
         this.component.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseEventHandler);
         this.component.addEventListener(MouseEvent.MOUSE_UP,this.mouseEventHandler);
         this.component.addEventListener(MouseEvent.CLICK,this.mouseEventHandler);
         this.component.addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_START,this.touchInteractionStartHandler);
      }
      
      private function addSystemMouseHandlers() : void
      {
         var _loc1_:ISystemManager = this.component.systemManager;
         if(Boolean(_loc1_) && !this.systemMouseHandlersAdded)
         {
            _loc1_.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
            _loc1_.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseUpHandler);
            this.systemMouseHandlersAdded = true;
         }
      }
      
      private function removeSystemMouseHandlers() : void
      {
         var _loc1_:ISystemManager = this.component.systemManager;
         if(Boolean(_loc1_) && this.systemMouseHandlersAdded)
         {
            _loc1_.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
            _loc1_.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseUpHandler);
            this.systemMouseHandlersAdded = false;
         }
      }
      
      private function startSelectRendererAfterDelayTimer() : void
      {
         var _loc1_:Number = this.component.getStyle("touchDelay");
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
      
      private function stopSelectRendererAfterDelayTimer() : void
      {
         if(this.mouseDownSelectTimer)
         {
            this.mouseDownSelectTimer.stop();
            this.mouseDownSelectTimer = null;
         }
      }
      
      private function startDeselectRendererAfterDelayTimer() : void
      {
         var _loc1_:Number = this.component.getStyle("touchDelay");
         if(_loc1_ > 0)
         {
            this.mouseUpDeselectTimer = new Timer(_loc1_,1);
            this.mouseUpDeselectTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.mouseUpDeselectTimer_timerCompleteHandler);
            this.mouseUpDeselectTimer.start();
         }
         else
         {
            this.mouseUpDeselectTimer_timerCompleteHandler();
         }
      }
      
      private function stopDeselectRendererAfterDelayTimer() : void
      {
         if(this.mouseUpDeselectTimer)
         {
            this.mouseUpDeselectTimer.stop();
            this.mouseUpDeselectTimer = null;
         }
      }
      
      private function mouseEventHandler(param1:Event) : void
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
               this.stopDeselectRendererAfterDelayTimer();
               this.addSystemMouseHandlers();
               if(this.component.getStyle("interactionMode") == InteractionMode.TOUCH)
               {
                  this.startSelectRendererAfterDelayTimer();
                  break;
               }
               this.mouseCaptured = true;
               break;
            case MouseEvent.MOUSE_UP:
               this.hovered = true;
               if(Boolean(this.mouseDownSelectTimer) && this.mouseDownSelectTimer.running)
               {
                  this.stopSelectRendererAfterDelayTimer();
                  this.mouseCaptured = true;
                  this.startDeselectRendererAfterDelayTimer();
                  break;
               }
               if(this.mouseCaptured)
               {
                  this.mouseCaptured = false;
                  break;
               }
               break;
            case MouseEvent.CLICK:
               return;
         }
      }
      
      private function systemManager_mouseUpHandler(param1:Event) : void
      {
         if(param1.target == this.component || this.component.contains(param1.target as DisplayObject))
         {
            return;
         }
         if(!(this.mouseUpDeselectTimer && this.mouseUpDeselectTimer.running))
         {
            this.mouseCaptured = false;
         }
         if(Boolean(this.mouseDownSelectTimer) && this.mouseDownSelectTimer.running)
         {
            this.stopSelectRendererAfterDelayTimer();
         }
      }
      
      private function touchInteractionStartHandler(param1:TouchInteractionEvent) : void
      {
         this.stopSelectRendererAfterDelayTimer();
         this.mx_internal::playTransitions = false;
         this.hovered = false;
         this.mouseCaptured = false;
         this.mx_internal::playTransitions = true;
      }
      
      private function mouseDownSelectTimer_timerCompleteHandler(param1:TimerEvent = null) : void
      {
         this.mouseCaptured = true;
      }
      
      private function mouseUpDeselectTimer_timerCompleteHandler(param1:TimerEvent = null) : void
      {
         this.mouseCaptured = false;
         if(this.rollOutWhileFakingDownState)
         {
            this.rollOutWhileFakingDownState = false;
            this.hovered = false;
         }
      }
      
      private function anyButtonDown(param1:MouseEvent) : Boolean
      {
         var _loc2_:String = param1.type;
         return param1.buttonDown || _loc2_ == "middleMouseDown" || _loc2_ == "rightMouseDown";
      }
   }
}
