package package_429
{
   import away3d.arcane;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_295.class_2128;
   import package_299.class_2573;
   import package_300.class_2152;
   import package_305.class_1767;
   import package_364.DirectionalLight;
   import package_371.class_2125;
   import package_371.class_2230;
   
   public class DirectionalShadowMapper extends class_2393
   {
       
      
      protected var var_1887:class_1767;
      
      protected var var_4534:Vector.<Number>;
      
      protected var var_1056:Number = 10000;
      
      protected var _matrix:Matrix3D;
      
      protected var var_1025:class_2573;
      
      protected var var_4925:Number = 64;
      
      protected var var_1168:Vector.<class_2230>;
      
      protected var var_2170:Number;
      
      protected var var_2544:Number;
      
      public function DirectionalShadowMapper()
      {
         super();
         this.var_1168 = new Vector.<class_2230>();
         this.var_1025 = new class_2573();
         this.var_1887 = new class_1767(this.var_1025);
         this.var_4534 = new Vector.<Number>(24);
         this._matrix = new Matrix3D();
      }
      
      public function get method_229() : Number
      {
         return this.var_4925;
      }
      
      public function set method_229(param1:Number) : void
      {
         this.var_4925 = param1;
      }
      
      public function get method_1778() : Number
      {
         return this.var_1056;
      }
      
      public function set method_1778(param1:Number) : void
      {
         this.var_1056 = param1;
      }
      
      arcane function get depthProjection() : Matrix3D
      {
         return this.var_1887.method_2785;
      }
      
      arcane function get depth() : Number
      {
         return Number(this.var_2544) - Number(this.var_2170);
      }
      
      override protected function method_2669(param1:TextureBase, param2:class_2128, param3:class_2152) : void
      {
         var_3449.camera = this.var_1887;
         var_3449.method_4664 = this.var_1168;
         var_3449.clear();
         param2.method_2653(var_3449);
         param3.arcane::render(var_3449,param1);
         var_3449.method_1140();
      }
      
      protected function method_631(param1:class_1767) : void
      {
         var _loc10_:* = null;
         var _loc2_:Vector.<class_2230> = this.var_1887.method_5756;
         var _loc3_:Vector.<class_2230> = param1.method_5756;
         this.var_1168.length = 4;
         this.var_1168[0] = _loc2_[0];
         this.var_1168[1] = _loc2_[1];
         this.var_1168[2] = _loc2_[2];
         this.var_1168[3] = _loc2_[3];
         var _loc4_:Vector3D;
         var _loc5_:Number = (_loc4_ = DirectionalLight(_light).sceneDirection).x;
         var _loc6_:Number = _loc4_.y;
         var _loc7_:Number = _loc4_.z;
         var _loc8_:int = 4;
         var _loc9_:int = 0;
         while(_loc9_ < 6)
         {
            if(Number((_loc10_ = _loc3_[_loc9_]).a) * _loc5_ + Number(_loc10_.b) * _loc6_ + Number(_loc10_.c) * _loc7_ < 0)
            {
               var _loc11_:*;
               this.var_1168[_loc11_ = _loc8_++] = _loc10_;
            }
            _loc9_++;
         }
      }
      
      override protected function method_873(param1:class_1767) : void
      {
         this.method_5949(param1,param1.lens.method_2727,this._matrix);
         this.var_1025.matrix = this._matrix;
         this.method_631(param1);
      }
      
      protected function method_5949(param1:class_1767, param2:Vector.<Number>, param3:Matrix3D) : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = 0;
         var _loc4_:Vector.<Number> = class_2125.const_2368;
         _loc5_ = DirectionalLight(_light).sceneDirection;
         this.var_1887.transform = _light.sceneTransform;
         _loc6_ = int((Number(param1.x) - _loc5_.x * Number(this.var_1056)) / Number(this.var_4925)) * Number(this.var_4925);
         _loc7_ = int((Number(param1.y) - _loc5_.y * Number(this.var_1056)) / Number(this.var_4925)) * Number(this.var_4925);
         _loc8_ = int((Number(param1.z) - _loc5_.z * Number(this.var_1056)) / Number(this.var_4925)) * Number(this.var_4925);
         this.var_1887.x = _loc6_;
         this.var_1887.y = _loc7_;
         this.var_1887.z = _loc8_;
         this._matrix.copyFrom(this.var_1887.method_2908);
         this._matrix.prepend(param1.sceneTransform);
         this._matrix.transformVectors(param2,this.var_4534);
         _loc9_ = _loc11_ = Number(this.var_4534[0]);
         _loc10_ = _loc12_ = Number(this.var_4534[1]);
         this.var_2544 = this.var_4534[2];
         _loc13_ = 3;
         while(_loc13_ < 24)
         {
            _loc6_ = Number(this.var_4534[_loc13_]);
            _loc7_ = Number(this.var_4534[uint(_loc13_ + 1)]);
            _loc8_ = Number(this.var_4534[uint(_loc13_ + 2)]);
            if(_loc6_ < _loc9_)
            {
               _loc9_ = _loc6_;
            }
            if(_loc6_ > _loc11_)
            {
               _loc11_ = _loc6_;
            }
            if(_loc7_ < _loc10_)
            {
               _loc10_ = _loc7_;
            }
            if(_loc7_ > _loc12_)
            {
               _loc12_ = _loc7_;
            }
            if(_loc8_ > this.var_2544)
            {
               this.var_2544 = _loc8_;
            }
            _loc13_ += 3;
         }
         this.var_2170 = 1;
         var _loc14_:Number = _loc11_ - _loc9_;
         var _loc15_:Number = _loc12_ - _loc10_;
         var _loc16_:Number = 1 / (Number(this.var_2544) - Number(this.var_2170));
         if(_loc9_ < 0)
         {
            _loc9_ -= this.var_4925;
         }
         if(_loc10_ < 0)
         {
            _loc10_ -= this.var_4925;
         }
         _loc9_ = int(_loc9_ / Number(this.var_4925)) * Number(this.var_4925);
         _loc10_ = int(_loc10_ / Number(this.var_4925)) * Number(this.var_4925);
         var _loc17_:Number = 2 * Number(this.var_4925);
         _loc14_ = int(_loc14_ / _loc17_ + 2) * _loc17_;
         _loc15_ = int(_loc15_ / _loc17_ + 2) * _loc17_;
         _loc11_ = _loc9_ + _loc14_;
         _loc12_ = _loc10_ + _loc15_;
         _loc14_ = 1 / _loc14_;
         _loc15_ = 1 / _loc15_;
         _loc4_[0] = 2 * _loc14_;
         _loc4_[5] = 2 * _loc15_;
         _loc4_[10] = _loc16_;
         _loc4_[12] = -(_loc11_ + _loc9_) * _loc14_;
         _loc4_[13] = -(_loc12_ + _loc10_) * _loc15_;
         _loc4_[14] = -Number(this.var_2170) * _loc16_;
         _loc4_[15] = 1;
         _loc4_[1] = _loc4_[2] = _loc4_[3] = _loc4_[4] = _loc4_[6] = _loc4_[7] = _loc4_[8] = _loc4_[9] = _loc4_[11] = 0;
         param3.copyRawDataFrom(_loc4_);
      }
   }
}
