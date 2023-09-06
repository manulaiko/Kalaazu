package package_364
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_294.class_2133;
   import package_371.class_2125;
   import package_372.class_2225;
   import package_372.class_2395;
   import package_383.class_2226;
   import package_383.class_2396;
   import package_429.CubeMapShadowMapper;
   import package_429.class_2393;
   
   public class PointLight extends class_2102
   {
       
      
      arcane var var_126:Number = 90000;
      
      arcane var _fallOff:Number = 100000;
      
      arcane var var_1269:Number;
      
      public function PointLight()
      {
         super();
         this.arcane::var_1269 = 1 / (Number(this.arcane::_fallOff) * Number(this.arcane::_fallOff) - Number(this.arcane::var_126) * Number(this.arcane::var_126));
      }
      
      override protected function method_970() : class_2393
      {
         return new CubeMapShadowMapper();
      }
      
      override protected function method_1737() : class_2225
      {
         return new class_2395(this);
      }
      
      public function get radius() : Number
      {
         return this.arcane::var_126;
      }
      
      public function set radius(param1:Number) : void
      {
         this.arcane::var_126 = param1;
         if(this.arcane::var_126 < 0)
         {
            this.arcane::var_126 = 0;
         }
         else if(this.arcane::var_126 > this.arcane::_fallOff)
         {
            this.arcane::_fallOff = this.arcane::var_126;
            method_1513();
         }
         this.arcane::var_1269 = 1 / (Number(this.arcane::_fallOff) * Number(this.arcane::_fallOff) - Number(this.arcane::var_126) * Number(this.arcane::var_126));
      }
      
      arcane function method_3042() : Number
      {
         return this.arcane::var_1269;
      }
      
      public function get fallOff() : Number
      {
         return this.arcane::_fallOff;
      }
      
      public function set fallOff(param1:Number) : void
      {
         this.arcane::_fallOff = param1;
         if(this.arcane::_fallOff < 0)
         {
            this.arcane::_fallOff = 0;
         }
         if(this.arcane::_fallOff < this.arcane::var_126)
         {
            this.arcane::var_126 = this.arcane::_fallOff;
         }
         this.arcane::var_1269 = 1 / (Number(this.arcane::_fallOff) * Number(this.arcane::_fallOff) - Number(this.arcane::var_126) * Number(this.arcane::var_126));
         method_1513();
      }
      
      override protected function updateBounds() : void
      {
         _bounds.method_5432(new Vector3D(),this.arcane::_fallOff);
         var_2006 = false;
      }
      
      override protected function method_1594() : class_2226
      {
         return new class_2396();
      }
      
      override arcane function method_3242(param1:class_2133, param2:Matrix3D = null) : Matrix3D
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:Vector.<Number> = class_2125.const_2368;
         var _loc4_:class_2226 = param1.method_1409.bounds;
         var _loc5_:Matrix3D;
         (_loc5_ = new Matrix3D()).copyFrom(param1.sceneTransform);
         _loc5_.append(_parent.method_2908);
         method_1154(_loc5_.position);
         _loc5_.copyFrom(param1.sceneTransform);
         _loc5_.append(method_2908);
         _loc5_.copyColumnTo(3,var_3880);
         var _loc6_:Vector3D = _loc5_.deltaTransformVector(_loc4_.min);
         var _loc7_:Vector3D = _loc5_.deltaTransformVector(_loc4_.max);
         var _loc8_:Number = 0;
         var _loc9_:Number = _loc6_.x * _loc6_.x + _loc6_.y * _loc6_.y + _loc6_.z * _loc6_.z;
         var _loc10_:Number = _loc7_.x * _loc7_.x + _loc7_.y * _loc7_.y + _loc7_.z * _loc7_.z;
         var _loc11_:Number = Math.sqrt(_loc9_ > _loc10_ ? _loc9_ : _loc10_);
         _loc12_ = _loc8_ - _loc11_;
         _loc13_ = _loc8_ + _loc11_;
         var _loc14_:* = _loc12_ / _loc11_;
         _loc3_[uint(0)] = _loc12_ / _loc11_;
         _loc3_[uint(5)] = _loc14_;
         _loc3_[uint(10)] = _loc13_ / (_loc13_ - _loc12_);
         _loc3_[uint(11)] = 1;
         _loc3_[uint(1)] = _loc3_[uint(2)] = _loc3_[uint(3)] = _loc3_[uint(4)] = _loc3_[uint(6)] = _loc3_[uint(7)] = _loc3_[uint(8)] = _loc3_[uint(9)] = _loc3_[uint(12)] = _loc3_[uint(13)] = _loc3_[uint(15)] = 0;
         _loc3_[uint(14)] = -_loc12_ * _loc3_[uint(10)];
         param2 = param2 || new Matrix3D();
         param2.copyRawDataFrom(_loc3_);
         param2.prepend(_loc5_);
         return param2;
      }
   }
}
