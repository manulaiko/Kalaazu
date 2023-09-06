package mx.geom
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.AdvancedLayoutFeatures;
   import mx.core.mx_internal;
   
   public class TransformOffsets extends EventDispatcher
   {
      
      private static const IS_3D:uint = 512;
      
      private static const M3D_FLAGS_VALID:uint = 1024;
      
      private static const EPSILON:Number = 0.001;
       
      
      private var _rotationX:Number = 0;
      
      private var _rotationY:Number = 0;
      
      private var _rotationZ:Number = 0;
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      private var _scaleZ:Number = 1;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _z:Number = 0;
      
      private var _flags:uint = 0;
      
      mx_internal var owner:AdvancedLayoutFeatures;
      
      public function TransformOffsets()
      {
         super();
      }
      
      public function set x(param1:Number) : void
      {
         if(param1 == this._x)
         {
            return;
         }
         this._x = param1;
         this.invalidate(false);
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set y(param1:Number) : void
      {
         if(param1 == this._y)
         {
            return;
         }
         this._y = param1;
         this.invalidate(false);
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set z(param1:Number) : void
      {
         if(param1 == this._z)
         {
            return;
         }
         this._z = param1;
         this.invalidate(true);
      }
      
      public function get z() : Number
      {
         return this._z;
      }
      
      public function set rotationX(param1:Number) : void
      {
         if(param1 == this._rotationX)
         {
            return;
         }
         this._rotationX = param1;
         this.invalidate(true);
      }
      
      public function get rotationX() : Number
      {
         return this._rotationX;
      }
      
      public function set rotationY(param1:Number) : void
      {
         if(param1 == this._rotationY)
         {
            return;
         }
         this._rotationY = param1;
         this.invalidate(true);
      }
      
      public function get rotationY() : Number
      {
         return this._rotationY;
      }
      
      public function set rotationZ(param1:Number) : void
      {
         if(param1 == this._rotationZ)
         {
            return;
         }
         this._rotationZ = param1;
         this.invalidate(false);
      }
      
      public function get rotationZ() : Number
      {
         return this._rotationZ;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(param1 == this._scaleX)
         {
            return;
         }
         this._scaleX = param1;
         this.invalidate(false);
      }
      
      public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(param1 == this._scaleY)
         {
            return;
         }
         this._scaleY = param1;
         this.invalidate(false);
      }
      
      public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function set scaleZ(param1:Number) : void
      {
         if(param1 == this._scaleZ)
         {
            return;
         }
         this._scaleZ = param1;
         this.invalidate(true);
      }
      
      public function get scaleZ() : Number
      {
         return this._scaleZ;
      }
      
      mx_internal function get is3D() : Boolean
      {
         if((this._flags & M3D_FLAGS_VALID) == 0)
         {
            this.update3DFlags();
         }
         return (this._flags & IS_3D) != 0;
      }
      
      private function invalidate(param1:Boolean, param2:Boolean = true) : void
      {
         if(param1)
         {
            this._flags &= ~M3D_FLAGS_VALID;
         }
         if(param2)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function update3DFlags() : void
      {
         var _loc1_:Boolean = false;
         if((this._flags & M3D_FLAGS_VALID) == 0)
         {
            _loc1_ = Math.abs(this._scaleZ - 1) > EPSILON || (Math.abs(this._rotationX) + EPSILON) % 360 > 2 * EPSILON || (Math.abs(this._rotationY) + EPSILON) % 360 > 2 * EPSILON || Math.abs(this._z) > EPSILON;
            if(_loc1_)
            {
               this._flags |= IS_3D;
            }
            else
            {
               this._flags &= ~IS_3D;
            }
            this._flags |= M3D_FLAGS_VALID;
         }
      }
   }
}
