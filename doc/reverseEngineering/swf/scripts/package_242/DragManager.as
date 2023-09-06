package package_242
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class DragManager extends EventDispatcher
   {
       
      
      private var _container:DisplayObjectContainer;
      
      private var var_340:Boolean;
      
      private var var_97:IDropable;
      
      private var var_808:class_1894;
      
      private var var_545:IDraggable;
      
      private var var_190:Point;
      
      private var var_421:Boolean;
      
      public function DragManager(param1:DisplayObjectContainer)
      {
         super();
         this._container = param1;
      }
      
      public function startDrag(param1:IDraggable, param2:Boolean = true, param3:Point = null) : void
      {
         this.var_545 = param1;
         this.var_421 = param2;
         this.var_190 = param3;
         if(this.var_340)
         {
            this.stopDrag();
         }
         if(this.var_421)
         {
            this.method_5730();
         }
         this.move(this._container.mouseX,this._container.mouseY);
         this.addListeners();
         dispatchEvent(new DragEvent(DragEvent.DRAG_START));
      }
      
      private function addListeners() : void
      {
         var _loc1_:Stage = this._container.stage;
         _loc1_.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         _loc1_.addEventListener(Event.MOUSE_LEAVE,this.mouseLeaveHandler);
      }
      
      private function method_25() : void
      {
         var _loc1_:Stage = this._container.stage;
         _loc1_.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         _loc1_.removeEventListener(Event.MOUSE_LEAVE,this.mouseLeaveHandler);
      }
      
      private function method_5730() : void
      {
         if(Boolean(this.var_808) && Boolean(this._container.contains(this.var_808.asDisplayObject)))
         {
            this.var_808.dispose();
            this._container.removeChild(this.var_808.asDisplayObject);
            this.var_808 = null;
         }
         this.var_808 = this.var_545.preview;
         this._container.addChild(this.var_808.asDisplayObject);
      }
      
      private function mouseLeaveHandler(param1:Event) : void
      {
         this.stopDrag(null);
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         this.stopDrag(param1.target as DisplayObject);
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         this.move(this._container.mouseX,this._container.mouseY);
         var _loc2_:IDropable = this.method_1360();
         if(_loc2_)
         {
            if(this.var_97)
            {
               this.var_97.hideAcceptableState(this.var_545);
            }
            this.var_97 = _loc2_;
            this.var_97.showAcceptableState(this.var_545);
         }
         else if(this.var_97)
         {
            this.var_97.hideAcceptableState(this.var_545);
         }
      }
      
      private function stopDrag(param1:DisplayObject = null) : void
      {
         var _loc3_:* = null;
         this.method_25();
         if(this.var_97)
         {
            this.var_97.hideAcceptableState(this.var_545);
         }
         var _loc2_:IDropable = !!param1 ? this.method_1360() : this.var_97;
         if(this.var_808)
         {
            if(_loc2_)
            {
               _loc2_.setAcceptedDragItem(this.var_545);
               _loc2_.hideAcceptableState(this.var_545);
               if(this.var_808.snapToDropTarget)
               {
                  this.method_4930(_loc2_);
               }
               this.var_808.dropAccept(this.method_3006);
               dispatchEvent(new DragEvent(DragEvent.const_190,this.var_545,_loc2_));
            }
            else
            {
               dispatchEvent(new DragEvent(DragEvent.const_2159,this.var_545));
               _loc3_ = !!this.var_190 ? this.method_4403.parent.globalToLocal(new Point(this.var_190.x,this.var_190.y)) : null;
               this.var_808.dropNotAccept(this.method_3006,_loc3_);
            }
         }
         dispatchEvent(new DragEvent(DragEvent.DRAG_OVER,this.var_545));
         this.var_340 = false;
         this.var_545 = null;
         this.var_97 = null;
      }
      
      private function move(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!this.var_421)
         {
            _loc3_ = this.method_4403.parent.globalToLocal(new Point(param1,param2));
            _loc4_ = this.var_545.dragOffset || new Point();
            this.method_4403.x = int(_loc3_.x + _loc4_.x);
            this.method_4403.y = int(_loc3_.y + _loc4_.y);
         }
         else
         {
            this.method_4403.x = int(param1);
            this.method_4403.y = int(param2);
         }
      }
      
      private function method_3006() : void
      {
         if(Boolean(this.var_808) && Boolean(this._container.contains(this.var_808.asDisplayObject)))
         {
            this.var_808.dispose();
            this._container.removeChild(this.var_808.asDisplayObject);
            this.var_808 = null;
         }
      }
      
      private function method_1360() : IDropable
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = this._container.getObjectsUnderPoint(new Point(this.method_4403.x,this.method_4403.y));
         for each(_loc2_ in _loc1_)
         {
            while(Boolean(_loc2_) && _loc2_.parent != _loc2_.stage)
            {
               _loc3_ = _loc2_ as IDropable;
               if(Boolean(_loc3_) && Boolean(_loc3_.isDraggingItemAcceptable(this.var_545)))
               {
                  return _loc3_;
               }
               _loc2_ = _loc2_.parent;
            }
         }
         return null;
      }
      
      private function method_4930(param1:IDropable) : void
      {
         var _loc2_:DisplayObject = this.method_4403.parent;
         var _loc3_:Point = param1.asDisplayObject.localToGlobal(new Point(_loc2_.x,_loc2_.y));
         var _loc4_:Point = this.var_808.dropOffset || new Point();
         this.var_808.x = _loc3_.x + _loc4_.x;
         this.var_808.y = _loc3_.y + _loc4_.y;
      }
      
      private function get method_4403() : DisplayObject
      {
         if(Boolean(this.var_421) && Boolean(this.var_808))
         {
            return this.var_808.asDisplayObject;
         }
         return this.var_545.asDisplayObject;
      }
      
      public function get method_3491() : Boolean
      {
         return this.var_340;
      }
   }
}
