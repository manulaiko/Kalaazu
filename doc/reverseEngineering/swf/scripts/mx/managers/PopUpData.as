package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.effects.Effect;
   
   public class PopUpData
   {
       
      
      public var owner:DisplayObject;
      
      public var parent:DisplayObject;
      
      public var topMost:Boolean;
      
      public var modalWindow:DisplayObject;
      
      public var _mouseDownOutsideHandler:Function;
      
      public var _mouseWheelOutsideHandler:Function;
      
      public var fade:Effect;
      
      public var blur:Effect;
      
      public var blurTarget:Object;
      
      public var systemManager:ISystemManager;
      
      public function PopUpData()
      {
         super();
      }
      
      public function mouseDownOutsideHandler(param1:MouseEvent) : void
      {
         this._mouseDownOutsideHandler(this.owner,param1);
      }
      
      public function mouseWheelOutsideHandler(param1:MouseEvent) : void
      {
         this._mouseWheelOutsideHandler(this.owner,param1);
      }
      
      public function resizeHandler(param1:Event) : void
      {
         var _loc2_:Rectangle = ISystemManager(param1.target).screen;
         if(Boolean(this.modalWindow) && this.owner.stage == DisplayObject(param1.target).stage)
         {
            this.modalWindow.width = _loc2_.width;
            this.modalWindow.height = _loc2_.height;
            this.modalWindow.x = _loc2_.x;
            this.modalWindow.y = _loc2_.y;
         }
      }
   }
}
