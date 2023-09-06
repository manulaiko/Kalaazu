package package_364
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_294.class_2133;
   import package_371.class_2125;
   import package_372.class_2225;
   import package_372.class_2394;
   import package_383.class_2226;
   import package_383.class_2231;
   import package_429.DirectionalShadowMapper;
   import package_429.class_2393;
   
   public class DirectionalLight extends class_2102
   {
       
      
      private var _direction:Vector3D;
      
      private var var_175:Vector3D;
      
      private var var_4209:Vector3D;
      
      private var var_1546:Vector.<Number>;
      
      public function DirectionalLight(param1:Number = 0, param2:Number = -1, param3:Number = 1)
      {
         super();
         this.direction = new Vector3D(param1,param2,param3);
         this.var_4209 = new Vector3D();
      }
      
      override protected function method_1737() : class_2225
      {
         return new class_2394(this);
      }
      
      public function get sceneDirection() : Vector3D
      {
         if(var_4750)
         {
            this.method_1607();
         }
         return this.var_4209;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function set direction(param1:Vector3D) : void
      {
         this._direction = param1;
         if(!this.var_175)
         {
            this.var_175 = new Vector3D();
         }
         this.var_175.x = x + this._direction.x;
         this.var_175.y = y + this._direction.y;
         this.var_175.z = z + this._direction.z;
         method_1154(this.var_175);
      }
      
      override protected function method_1594() : class_2226
      {
         return new class_2231();
      }
      
      override protected function updateBounds() : void
      {
      }
      
      override protected function method_1607() : void
      {
         super.method_1607();
         var_2379.copyColumnTo(2,this.var_4209);
         this.var_4209.normalize();
      }
      
      override protected function method_970() : class_2393
      {
         return new DirectionalShadowMapper();
      }
      
      override arcane function method_3242(param1:class_2133, param2:Matrix3D = null) : Matrix3D
      {
         var _loc12_:Number = NaN;
         var _loc3_:Vector.<Number> = class_2125.const_2368;
         var _loc4_:class_2226 = param1.method_1409.bounds;
         var _loc5_:Matrix3D;
         (_loc5_ = new Matrix3D()).copyFrom(param1.sceneTransform);
         _loc5_.append(method_2908);
         if(!this.var_1546)
         {
            this.var_1546 = new Vector.<Number>();
         }
         _loc5_.transformVectors(_loc4_.method_4127,this.var_1546);
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc13_:int = 0;
         while(_loc13_ < 24)
         {
            if((_loc12_ = Number(this.var_1546[_loc13_++])) < _loc6_)
            {
               _loc6_ = _loc12_;
            }
            if(_loc12_ > _loc7_)
            {
               _loc7_ = _loc12_;
            }
            if((_loc12_ = Number(this.var_1546[_loc13_++])) < _loc8_)
            {
               _loc8_ = _loc12_;
            }
            if(_loc12_ > _loc9_)
            {
               _loc9_ = _loc12_;
            }
            if((_loc12_ = Number(this.var_1546[_loc13_++])) < _loc10_)
            {
               _loc10_ = _loc12_;
            }
            if(_loc12_ > _loc11_)
            {
               _loc11_ = _loc12_;
            }
         }
         var _loc14_:Number = 1 / (_loc7_ - _loc6_);
         var _loc15_:Number = 1 / (_loc9_ - _loc8_);
         var _loc16_:Number = 1 / (_loc11_ - _loc10_);
         _loc3_[0] = 2 * _loc14_;
         _loc3_[5] = 2 * _loc15_;
         _loc3_[10] = _loc16_;
         _loc3_[12] = -(_loc7_ + _loc6_) * _loc14_;
         _loc3_[13] = -(_loc9_ + _loc8_) * _loc15_;
         _loc3_[14] = -_loc10_ * _loc16_;
         _loc3_[1] = _loc3_[2] = _loc3_[3] = _loc3_[4] = _loc3_[6] = _loc3_[7] = _loc3_[8] = _loc3_[9] = _loc3_[11] = 0;
         _loc3_[15] = 1;
         param2 = param2 || new Matrix3D();
         param2.copyRawDataFrom(_loc3_);
         param2.prepend(_loc5_);
         return param2;
      }
   }
}
