package fl.controls
{
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.events.ComponentEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BaseButton extends UIComponent
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"Button_upSkin",
         "downSkin":"Button_downSkin",
         "overSkin":"Button_overSkin",
         "disabledSkin":"Button_disabledSkin",
         "selectedDisabledSkin":"Button_selectedDisabledSkin",
         "selectedUpSkin":"Button_selectedUpSkin",
         "selectedDownSkin":"Button_selectedDownSkin",
         "selectedOverSkin":"Button_selectedOverSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "repeatDelay":500,
         "repeatInterval":35
      };
       
      
      protected var background:DisplayObject;
      
      protected var mouseState:String;
      
      protected var _selected:Boolean = false;
      
      protected var _autoRepeat:Boolean = false;
      
      protected var pressTimer:Timer;
      
      private var _mouseStateLocked:Boolean = false;
      
      private var unlockedMouseState:String;
      
      public function BaseButton()
      {
         super();
         buttonMode = true;
         mouseChildren = false;
         useHandCursor = false;
         setupMouseEvents();
         setMouseState("up");
         pressTimer = new Timer(1,0);
         pressTimer.addEventListener(TimerEvent.TIMER,buttonDown,false,0,true);
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         mouseEnabled = param1;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(_selected == param1)
         {
            return;
         }
         _selected = param1;
         invalidate(InvalidationType.STATE);
      }
      
      public function get autoRepeat() : Boolean
      {
         return _autoRepeat;
      }
      
      public function set autoRepeat(param1:Boolean) : void
      {
         _autoRepeat = param1;
      }
      
      public function set mouseStateLocked(param1:Boolean) : void
      {
         _mouseStateLocked = param1;
         if(param1 == false)
         {
            setMouseState(unlockedMouseState);
         }
         else
         {
            unlockedMouseState = mouseState;
         }
      }
      
      public function setMouseState(param1:String) : void
      {
         if(_mouseStateLocked)
         {
            unlockedMouseState = param1;
            return;
         }
         if(mouseState == param1)
         {
            return;
         }
         mouseState = param1;
         invalidate(InvalidationType.STATE);
      }
      
      protected function setupMouseEvents() : void
      {
         addEventListener(MouseEvent.ROLL_OVER,mouseEventHandler,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,mouseEventHandler,false,0,true);
         addEventListener(MouseEvent.MOUSE_UP,mouseEventHandler,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,mouseEventHandler,false,0,true);
      }
      
      protected function mouseEventHandler(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            setMouseState("down");
            startPress();
         }
         else if(param1.type == MouseEvent.ROLL_OVER || param1.type == MouseEvent.MOUSE_UP)
         {
            setMouseState("over");
            endPress();
         }
         else if(param1.type == MouseEvent.ROLL_OUT)
         {
            setMouseState("up");
            endPress();
         }
      }
      
      protected function startPress() : void
      {
         if(_autoRepeat)
         {
            pressTimer.delay = Number(getStyleValue("repeatDelay"));
            pressTimer.start();
         }
         dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN,true));
      }
      
      protected function buttonDown(param1:TimerEvent) : void
      {
         if(!_autoRepeat)
         {
            endPress();
            return;
         }
         if(false)
         {
            pressTimer.delay = Number(getStyleValue("repeatInterval"));
         }
         dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN,true));
      }
      
      protected function endPress() : void
      {
         pressTimer.reset();
      }
      
      override protected function draw() : void
      {
         if(isInvalid(InvalidationType.STYLES,InvalidationType.STATE))
         {
            drawBackground();
            invalidate(InvalidationType.SIZE,false);
         }
         if(isInvalid(InvalidationType.SIZE))
         {
            drawLayout();
         }
         super.draw();
      }
      
      protected function drawBackground() : void
      {
         var _loc1_:* = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ += "Skin";
         var _loc2_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_loc1_));
         addChildAt(background,0);
         if(_loc2_ != null && _loc2_ != background)
         {
            removeChild(_loc2_);
         }
      }
      
      protected function drawLayout() : void
      {
         background.width = width;
         background.height = height;
      }
   }
}
