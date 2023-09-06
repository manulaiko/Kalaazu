package net.bigpoint.darkorbit.mvc.display
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Image;
   import starling.display.MovieClip;
   import starling.display.Sprite;
   import starling.events.Event;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   
   public class class_1207 extends Sprite implements IDisplayObject
   {
      
      public static const const_2369:int = 2048;
       
      
      private var _mouseX:Number;
      
      private var _mouseY:Number;
      
      public function class_1207(param1:Boolean = false)
      {
         super();
         if(param1)
         {
            addEventListener(TouchEvent.TOUCH,this.method_3075);
         }
      }
      
      private function method_3075(param1:TouchEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Vector.<Touch> = param1.getTouches(this);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.phase == TouchPhase.HOVER)
            {
               _loc4_ = _loc3_.getLocation(this);
               this._mouseX = _loc4_.x;
               this._mouseY = _loc4_.y;
            }
         }
      }
      
      public function addUntypedChild(param1:Object) : void
      {
         if(this.method_266(param1))
         {
            addChild(param1 as DisplayObject);
         }
      }
      
      public function removeUntypedChild(param1:Object, param2:Boolean = true) : Object
      {
         if(param1 is DisplayObject)
         {
            removeChild(param1 as DisplayObject,param2);
         }
         return null;
      }
      
      public function method_33(param1:int, param2:Boolean = true) : Object
      {
         removeChildAt(param1,param2);
         return null;
      }
      
      public function method_3151(param1:Object) : Boolean
      {
         if(this.method_266(param1))
         {
            return contains(param1 as DisplayObject);
         }
         return false;
      }
      
      public function set mouseEnabled(param1:Boolean) : void
      {
         touchable = param1;
      }
      
      public function set mouseChildren(param1:Boolean) : void
      {
         touchable = param1;
      }
      
      public function method_1032(param1:Object) : Boolean
      {
         if(this.method_6346(param1))
         {
            dispatchEvent(param1 as Event);
         }
         return true;
      }
      
      public function method_266(param1:Object) : Boolean
      {
         if(param1 is DisplayObject)
         {
            return true;
         }
         throw new Error("child is not starling.display.DisplayObject");
      }
      
      public function method_6346(param1:Object) : Boolean
      {
         if(param1 is Event)
         {
            return true;
         }
         throw new Error("event is not starling.events.Event");
      }
      
      public function get mouseX() : Number
      {
         return this._mouseX;
      }
      
      public function get mouseY() : Number
      {
         return this._mouseY;
      }
      
      public function set buttonMode(param1:Boolean) : void
      {
         useHandCursor = param1;
      }
      
      public function set doubleClickEnabled(param1:Boolean) : void
      {
      }
      
      public function method_1532(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         addEventListener(param1,param2);
      }
      
      public function method_1899(param1:String, param2:Function, param3:Boolean = false) : void
      {
         removeEventListener(param1,param2);
      }
      
      public function get method_1052() : Object
      {
         return parent;
      }
      
      public function method_2392(param1:Object, param2:Rectangle = null) : Rectangle
      {
         if(this.method_266(param1))
         {
            return getBounds(param1 as DisplayObject,param2);
         }
         return null;
      }
      
      public function get method_4142() : Number
      {
         return Number(rotation) * 180 / 0;
      }
      
      public function set method_4142(param1:Number) : void
      {
         rotation = param1 * 0 / 180;
      }
      
      public function method_2394(param1:Object = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         param1 = param1 || true;
         if(this.method_266(param1))
         {
            _loc2_ = param1 as DisplayObjectContainer;
            if(_loc2_)
            {
               while(_loc2_.numChildren)
               {
                  _loc3_ = _loc2_.getChildAt(0);
                  this.method_2394(_loc3_);
                  _loc3_.removeFromParent(true);
                  _loc3_ = null;
               }
               _loc2_.dispose();
            }
            else if(_loc2_ is Image)
            {
               this.method_3997(_loc2_);
            }
            else if(_loc2_ is MovieClip)
            {
               Starling.juggler.remove(_loc2_ as MovieClip);
               _loc2_.dispose();
            }
         }
      }
      
      private function method_3997(param1:DisplayObject) : void
      {
         var _loc2_:Image = param1 as Image;
         if(_loc2_)
         {
            _loc2_.dispose();
            if(_loc2_.texture)
            {
               _loc2_.texture.dispose();
               _loc2_.texture = null;
            }
         }
      }
      
      public function get method_2826() : Object
      {
         return root;
      }
      
      public function method_990(param1:Point) : Point
      {
         return localToGlobal(param1);
      }
      
      public function get method_5539() : Object
      {
         return stage;
      }
      
      public function method_4347(param1:Point) : Point
      {
         return globalToLocal(param1);
      }
   }
}
