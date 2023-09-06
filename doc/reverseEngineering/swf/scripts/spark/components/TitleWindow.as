package spark.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.SandboxMouseEvent;
   import mx.utils.BitFlagUtil;
   import spark.events.TitleWindowBoundsEvent;
   
   public class TitleWindow extends Panel
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      private var addedHandlers:Boolean = false;
      
      private var active:Boolean = false;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var startBounds:Rectangle;
      
      [SkinPart(required="false")]
      public var closeButton:Button;
      
      [SkinPart(required="false")]
      public var moveArea:InteractiveObject;
      
      public function TitleWindow()
      {
         super();
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            TitleWindow.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(focusManager)
         {
            focusManager.removeEventListener(FlexEvent.FLEX_WINDOW_ACTIVATE,this.activateHandler);
            focusManager.removeEventListener(FlexEvent.FLEX_WINDOW_DEACTIVATE,this.deactivateHandler);
         }
         super.parentChanged(param1);
         if(focusManager)
         {
            this.addActivateHandlers();
         }
         else if(systemManager)
         {
            systemManager.getSandboxRoot().addEventListener(FlexEvent.ADD_FOCUS_MANAGER,this.addFocusManagerHandler,true,0,true);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.moveArea)
         {
            this.moveArea.addEventListener(MouseEvent.MOUSE_DOWN,this.moveArea_mouseDownHandler);
         }
         else if(param2 == this.closeButton)
         {
            this.closeButton.focusEnabled = false;
            this.closeButton.addEventListener(MouseEvent.CLICK,this.closeButton_clickHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.moveArea)
         {
            this.moveArea.removeEventListener(MouseEvent.MOUSE_DOWN,this.moveArea_mouseDownHandler);
         }
         else if(param2 == this.closeButton)
         {
            this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeButton_clickHandler);
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         var _loc1_:* = null;
         if(enabled && isPopUp && !this.active)
         {
            _loc1_ = "inactive";
            if(controlBarGroup)
            {
               if(BitFlagUtil.isSet(mx_internal::controlBarGroupProperties as uint,mx_internal::CONTROLBAR_PROPERTY_FLAG) && BitFlagUtil.isSet(mx_internal::controlBarGroupProperties as uint,mx_internal::VISIBLE_PROPERTY_FLAG))
               {
                  _loc1_ += "WithControlBar";
               }
            }
            else if(false && false)
            {
               _loc1_ += "WithControlBar";
            }
            return _loc1_;
         }
         return super.getCurrentSkinState();
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = new Rectangle(this.x,this.y,width,height);
         super.move(param1,param2);
         var _loc4_:Rectangle = new Rectangle(this.x,this.y,width,height);
         var _loc5_:TitleWindowBoundsEvent = new TitleWindowBoundsEvent(TitleWindowBoundsEvent.WINDOW_MOVE,false,false,_loc3_,_loc4_);
         dispatchEvent(_loc5_);
      }
      
      protected function closeButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
      }
      
      protected function moveArea_mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(enabled && isPopUp)
         {
            this.offsetX = param1.stageX - x;
            this.offsetY = param1.stageY - y;
            _loc2_ = systemManager.getSandboxRoot();
            _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.moveArea_mouseMoveHandler,true);
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.moveArea_mouseUpHandler,true);
            _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.moveArea_mouseUpHandler);
            systemManager.deployMouseShields(true);
         }
      }
      
      protected function moveArea_mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!this.startBounds)
         {
            this.startBounds = new Rectangle(x,y,width,height);
            _loc5_ = new TitleWindowBoundsEvent(TitleWindowBoundsEvent.WINDOW_MOVE_START,false,true,this.startBounds,null);
            dispatchEvent(_loc5_);
            if(_loc5_.isDefaultPrevented())
            {
               (_loc6_ = systemManager.getSandboxRoot()).removeEventListener(MouseEvent.MOUSE_MOVE,this.moveArea_mouseMoveHandler,true);
               _loc6_.removeEventListener(MouseEvent.MOUSE_UP,this.moveArea_mouseUpHandler,true);
               _loc6_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.moveArea_mouseUpHandler);
               systemManager.deployMouseShields(false);
               this.offsetX = NaN;
               this.offsetY = NaN;
               this.startBounds = null;
               return;
            }
         }
         var _loc2_:Rectangle = new Rectangle(x,y,width,height);
         var _loc3_:Rectangle = new Rectangle(Math.round(param1.stageX - this.offsetX),Math.round(param1.stageY - this.offsetY),width,height);
         var _loc4_:TitleWindowBoundsEvent = new TitleWindowBoundsEvent(TitleWindowBoundsEvent.WINDOW_MOVING,false,true,_loc2_,_loc3_);
         dispatchEvent(_loc4_);
         if(!_loc4_.isDefaultPrevented())
         {
            this.move(_loc3_.x,_loc3_.y);
         }
         param1.updateAfterEvent();
      }
      
      protected function moveArea_mouseUpHandler(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveArea_mouseMoveHandler,true);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.moveArea_mouseUpHandler,true);
         _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.moveArea_mouseUpHandler);
         systemManager.deployMouseShields(false);
         if(this.startBounds)
         {
            _loc3_ = new TitleWindowBoundsEvent(TitleWindowBoundsEvent.WINDOW_MOVE_END,false,false,this.startBounds,new Rectangle(x,y,width,height));
            dispatchEvent(_loc3_);
            this.startBounds = null;
         }
         this.offsetX = NaN;
         this.offsetY = NaN;
      }
      
      private function activateHandler(param1:Event) : void
      {
         this.active = true;
         invalidateSkinState();
      }
      
      private function deactivateHandler(param1:Event) : void
      {
         this.active = false;
         invalidateSkinState();
      }
      
      private function addActivateHandlers() : void
      {
         focusManager.addEventListener(FlexEvent.FLEX_WINDOW_ACTIVATE,this.activateHandler,false,0,true);
         focusManager.addEventListener(FlexEvent.FLEX_WINDOW_DEACTIVATE,this.deactivateHandler,false,0,true);
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         if(param1.target == this)
         {
            removeEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
            callLater(this.addActivateHandlers);
         }
      }
      
      private function addFocusManagerHandler(param1:Event) : void
      {
         if(focusManager == param1.target["focusManager"])
         {
            systemManager.getSandboxRoot().removeEventListener(FlexEvent.ADD_FOCUS_MANAGER,this.addFocusManagerHandler,true);
            this.addActivateHandlers();
         }
      }
   }
}
