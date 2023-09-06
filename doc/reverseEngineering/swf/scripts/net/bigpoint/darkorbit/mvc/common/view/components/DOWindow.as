package net.bigpoint.darkorbit.mvc.common.view.components
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.core.UIComponent;
   import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_17.class_62;
   import package_9.class_50;
   import spark.components.TitleWindow;
   
   public class DOWindow extends TitleWindow
   {
      
      public static const CLOSE_WINDOW_CLICKED:String = "closeWindowClicked";
       
      
      private var windowPositionOnClick:Point;
      
      [SkinPart(required="false")]
      public var resizeHandle:UIComponent;
      
      private var prevWidth:Number;
      
      private var prevHeight:Number;
      
      private var clickOffset:Point;
      
      public var windowType:String;
      
      public var alignment:String;
      
      public function DOWindow()
      {
         super();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.resizeHandle)
         {
            this.resizeHandle.addEventListener(MouseEvent.MOUSE_DOWN,this.handleResizeMouseDown);
         }
         else if(param2 == closeButton)
         {
            this.addCloseListeners();
         }
      }
      
      private function stageKeyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.escapeKeyDownHandler();
         }
      }
      
      protected function addCloseListeners() : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.stageKeyDownHandler);
         closeButton.addEventListener(MouseEvent.CLICK,this.handleCloseButtonClick);
      }
      
      protected function removeCloseListeners() : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.stageKeyDownHandler);
         closeButton.removeEventListener(MouseEvent.CLICK,this.handleCloseButtonClick);
      }
      
      protected function escapeKeyDownHandler() : void
      {
         if(stage)
         {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.stageKeyDownHandler);
         }
         this.handleCloseButtonClick();
      }
      
      protected function handleCloseButtonClick(param1:MouseEvent = null) : void
      {
         this.closeWindow();
         dispatchEvent(new Event(CLOSE_WINDOW_CLICKED,true));
      }
      
      public function closeWindow() : void
      {
         class_62.getInstance().method_2407(GuiNotifications.CLOSE_WINDOW_BY_TYPE,this.windowType);
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         if(param2 == this.resizeHandle)
         {
            this.resizeHandle.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleResizeMouseDown);
         }
         else if(param2 == closeButton)
         {
            this.removeCloseListeners();
         }
         super.partRemoved(param1,param2);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.moveArea.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragging);
         this.moveArea.addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
      }
      
      private function stopDragging(param1:MouseEvent) : void
      {
         stopDrag();
      }
      
      protected function startDragging(param1:MouseEvent) : void
      {
         if(false)
         {
            startDrag(false);
         }
      }
      
      protected function handleResizeMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(enabled && this.skin.isPopUp && !this.clickOffset)
         {
            this.clickOffset = new Point(param1.stageX,param1.stageY);
            this.prevWidth = width;
            this.prevHeight = height;
            _loc2_ = systemManager.getSandboxRoot();
            _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.handleResizeMouseMove,true);
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.handleResizeMouseUp,true);
         }
      }
      
      protected function handleResizeMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         param1.stopImmediatePropagation();
         if(!this.clickOffset)
         {
            return;
         }
         if(width >= minWidth && this.prevWidth + (param1.stageX - this.clickOffset.x) > minWidth)
         {
            _loc2_ = this.prevWidth + (param1.stageX - this.clickOffset.x);
         }
         if(height >= minHeight && this.prevHeight + (param1.stageY - this.clickOffset.y) > minHeight)
         {
            _loc3_ = this.prevHeight + (param1.stageY - this.clickOffset.y);
         }
         this.checkAndSetWindowDimensions(_loc2_,_loc3_);
         param1.updateAfterEvent();
      }
      
      private function checkAndSetWindowDimensions(param1:Number, param2:Number) : void
      {
         if(param1 && param1 >= minWidth && param1 <= maxWidth)
         {
            width = param1;
         }
         if(param2 && param2 >= minHeight && param2 <= maxHeight)
         {
            height = param2;
         }
      }
      
      protected function handleResizeMouseUp(param1:Event) : void
      {
         if(this.x + this.width > class_50.method_6533() || this.y + this.height > class_50.method_1269())
         {
            TweenMax.to(this,0.3,{
               "width":this.prevWidth,
               "height":this.prevHeight,
               "onComplete":this.handleResizeMouseUpComplete
            });
         }
         else
         {
            this.handleResizeMouseUpComplete();
         }
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.handleResizeMouseMove,true);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.handleResizeMouseUp,true);
      }
      
      protected function handleResizeMouseUpComplete() : void
      {
         this.clickOffset = null;
         this.prevWidth = NaN;
         this.prevHeight = NaN;
      }
      
      override protected function moveArea_mouseDownHandler(param1:MouseEvent) : void
      {
         super.moveArea_mouseDownHandler(param1);
         this.windowPositionOnClick = new Point(this.x,this.y);
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUpAfterDrag,true);
      }
      
      private function handleMouseUpAfterDrag(param1:MouseEvent) : void
      {
         var _loc2_:class_73 = ScreenScaleUtils.correctOutsideViewportPosition(new Rectangle(x,y,width,height),class_50.getInstance().name_118);
         x = _loc2_.x;
         y = _loc2_.y;
         this.handleMouseUpAfterDragComplete();
         var _loc3_:DisplayObject = systemManager.getSandboxRoot();
         _loc3_.removeEventListener(MouseEvent.MOUSE_UP,this.handleMouseUpAfterDrag,true);
         this.windowPositionOnClick = null;
      }
      
      protected function handleMouseUpAfterDragComplete() : void
      {
      }
      
      override public function set title(param1:String) : void
      {
         if(super.title != param1)
         {
            super.title = param1;
            invalidateProperties();
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
   }
}
