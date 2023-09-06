package package_305
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_199.class_2139;
   import package_199.class_2153;
   import package_293.class_2131;
   import package_299.class_1757;
   import package_299.class_1758;
   import package_304.class_1766;
   import package_371.class_2125;
   import package_371.class_2230;
   import package_372.class_2225;
   import package_372.class_2229;
   import package_383.class_2226;
   import package_383.class_2231;
   
   public class class_1767 extends class_1766
   {
       
      
      private var var_2067:Matrix3D;
      
      private var var_4087:Boolean = true;
      
      private var var_4129:class_1757;
      
      private var var_4549:Vector.<class_2230>;
      
      private var var_3439:Boolean = true;
      
      public function class_1767(param1:class_1757 = null)
      {
         this.var_2067 = new Matrix3D();
         super();
         this.var_4129 = param1 || new class_1758();
         this.var_4129.addEventListener(class_2139.const_2979,this.method_5817);
         this.var_4549 = new Vector.<class_2230>(6,true);
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            this.var_4549[_loc2_] = new class_2230();
            _loc2_++;
         }
         z = -1000;
      }
      
      override protected function method_1594() : class_2226
      {
         return new class_2231();
      }
      
      override public function get assetType() : String
      {
         return class_2131.CAMERA;
      }
      
      private function method_5817(param1:class_2139) : void
      {
         this.var_4087 = true;
         this.var_3439 = true;
         dispatchEvent(param1);
      }
      
      public function get method_5756() : Vector.<class_2230>
      {
         if(this.var_3439)
         {
            this.method_2182();
         }
         return this.var_4549;
      }
      
      private function method_2182() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc22_:Number = NaN;
         var _loc21_:Vector.<Number> = class_2125.const_2368;
         this.method_2785.copyRawDataTo(_loc21_);
         _loc4_ = _loc21_[uint(0)];
         _loc5_ = _loc21_[uint(4)];
         _loc6_ = _loc21_[uint(8)];
         _loc7_ = _loc21_[uint(12)];
         _loc8_ = _loc21_[uint(1)];
         _loc9_ = _loc21_[uint(5)];
         _loc10_ = _loc21_[uint(9)];
         _loc11_ = _loc21_[uint(13)];
         _loc12_ = _loc21_[uint(2)];
         _loc13_ = _loc21_[uint(6)];
         _loc14_ = _loc21_[uint(10)];
         _loc15_ = _loc21_[uint(14)];
         _loc16_ = _loc21_[uint(3)];
         _loc17_ = _loc21_[uint(7)];
         _loc18_ = _loc21_[uint(11)];
         _loc19_ = _loc21_[uint(15)];
         _loc20_ = this.var_4549[0];
         _loc1_ = _loc16_ + _loc4_;
         _loc2_ = _loc17_ + _loc5_;
         _loc3_ = _loc18_ + _loc6_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = -(_loc19_ + _loc7_) * _loc22_;
         _loc20_ = this.var_4549[1];
         _loc1_ = _loc16_ - _loc4_;
         _loc2_ = _loc17_ - _loc5_;
         _loc3_ = _loc18_ - _loc6_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = (_loc7_ - _loc19_) * _loc22_;
         _loc20_ = this.var_4549[2];
         _loc1_ = _loc16_ + _loc8_;
         _loc2_ = _loc17_ + _loc9_;
         _loc3_ = _loc18_ + _loc10_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = -(_loc19_ + _loc11_) * _loc22_;
         _loc20_ = this.var_4549[3];
         _loc1_ = _loc16_ - _loc8_;
         _loc2_ = _loc17_ - _loc9_;
         _loc3_ = _loc18_ - _loc10_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = (_loc11_ - _loc19_) * _loc22_;
         _loc20_ = this.var_4549[4];
         _loc1_ = _loc12_;
         _loc2_ = _loc13_;
         _loc3_ = _loc14_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = -_loc15_ * _loc22_;
         _loc20_ = this.var_4549[5];
         _loc1_ = _loc16_ - _loc12_;
         _loc2_ = _loc17_ - _loc13_;
         _loc3_ = _loc18_ - _loc14_;
         _loc22_ = 1 / Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_ + _loc3_ * _loc3_);
         _loc20_.a = _loc1_ * _loc22_;
         _loc20_.b = _loc2_ * _loc22_;
         _loc20_.c = _loc3_ * _loc22_;
         _loc20_.d = (_loc15_ - _loc19_) * _loc22_;
         this.var_3439 = false;
      }
      
      override protected function method_3172() : void
      {
         super.method_3172();
         this.var_4087 = true;
         this.var_3439 = true;
      }
      
      override protected function updateBounds() : void
      {
         _bounds.method_5406();
         var_2006 = false;
      }
      
      override protected function method_1737() : class_2225
      {
         return new class_2229(this);
      }
      
      public function get lens() : class_1757
      {
         return this.var_4129;
      }
      
      public function set lens(param1:class_1757) : void
      {
         if(this.var_4129 == param1)
         {
            return;
         }
         if(!param1)
         {
            throw new Error("Lens cannot be null!");
         }
         this.var_4129.removeEventListener(class_2139.const_2979,this.method_5817);
         this.var_4129 = param1;
         this.var_4129.addEventListener(class_2139.const_2979,this.method_5817);
         dispatchEvent(new class_2153(class_2153.const_1507,this));
      }
      
      public function get method_2785() : Matrix3D
      {
         if(this.var_4087)
         {
            this.var_2067.copyFrom(method_2908);
            this.var_2067.append(this.var_4129.matrix);
            this.var_4087 = false;
         }
         return this.var_2067;
      }
      
      public function method_3456(param1:Number, param2:Number, param3:Number, param4:Vector3D = null) : Vector3D
      {
         return class_2125.transformVector(sceneTransform,this.lens.method_3456(param1,param2,param3,param4),param4);
      }
      
      public function method_6082(param1:Number, param2:Number, param3:Number, param4:Vector3D = null) : Vector3D
      {
         return class_2125.deltaTransformVector(sceneTransform,this.lens.method_3456(param1,param2,param3,param4),param4);
      }
      
      public function method_642(param1:Vector3D, param2:Vector3D = null) : Vector3D
      {
         return this.lens.method_642(class_2125.transformVector(method_2908,param1,param2),param2);
      }
   }
}
