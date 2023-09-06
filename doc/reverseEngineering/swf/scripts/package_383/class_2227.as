package package_383
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_371.class_2125;
   import package_371.class_2230;
   import package_371.class_2491;
   import package_436.class_2489;
   import package_436.class_2490;
   
   public class class_2227 extends class_2226
   {
       
      
      private var var_169:Number = 0;
      
      private var var_1985:Number = 0;
      
      private var var_1587:Number = 0;
      
      private var var_2824:Number = 0;
      
      private var var_4542:Number = 0;
      
      private var var_2252:Number = 0;
      
      public function class_2227()
      {
         super();
      }
      
      override public function method_5406() : void
      {
         super.method_5406();
         this.var_169 = this.var_1985 = this.var_1587 = 0;
         this.var_2824 = this.var_4542 = this.var_2252 = 0;
      }
      
      override public function method_3128(param1:Vector.<class_2230>, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:Number = 0;
         while(_loc3_ < param2)
         {
            _loc5_ = Number((_loc4_ = param1[_loc3_]).a);
            _loc6_ = Number(_loc4_.b);
            _loc7_ = Number(_loc4_.c);
            _loc8_ = _loc5_ < 0 ? -Number(this.var_2824) : Number(this.var_2824);
            _loc9_ = _loc6_ < 0 ? -Number(this.var_4542) : Number(this.var_4542);
            _loc10_ = _loc7_ < 0 ? -Number(this.var_2252) : Number(this.var_2252);
            if((_loc11_ = _loc5_ * (this.var_169 + _loc8_) + _loc6_ * (this.var_1985 + _loc9_) + _loc7_ * (this.var_1587 + _loc10_) - Number(_loc4_.d)) < 0)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      override public function method_2610(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Number
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Boolean = false;
         if(this.containsPoint(param1))
         {
            return 0;
         }
         var _loc4_:Number = param1.x - Number(this.var_169);
         var _loc5_:Number = param1.y - Number(this.var_1985);
         var _loc6_:Number = param1.z - Number(this.var_1587);
         var _loc7_:Number = param2.x;
         var _loc8_:Number = param2.y;
         var _loc9_:Number = param2.z;
         if(_loc7_ < 0)
         {
            if((_loc13_ = (Number(this.var_2824) - _loc4_) / _loc7_) > 0)
            {
               _loc11_ = _loc5_ + _loc13_ * _loc8_;
               _loc12_ = _loc6_ + _loc13_ * _loc9_;
               if(_loc11_ > -Number(this.var_4542) && _loc11_ < this.var_4542 && _loc12_ > -Number(this.var_2252) && _loc12_ < this.var_2252)
               {
                  param3.x = 1;
                  param3.y = 0;
                  param3.z = 0;
                  _loc14_ = true;
               }
            }
         }
         if(!_loc14_ && _loc7_ > 0)
         {
            if((_loc13_ = (-Number(this.var_2824) - _loc4_) / _loc7_) > 0)
            {
               _loc11_ = _loc5_ + _loc13_ * _loc8_;
               _loc12_ = _loc6_ + _loc13_ * _loc9_;
               if(_loc11_ > -Number(this.var_4542) && _loc11_ < this.var_4542 && _loc12_ > -Number(this.var_2252) && _loc12_ < this.var_2252)
               {
                  param3.x = -1;
                  param3.y = 0;
                  param3.z = 0;
                  _loc14_ = true;
               }
            }
         }
         if(!_loc14_ && _loc8_ < 0)
         {
            if((_loc13_ = (Number(this.var_4542) - _loc5_) / _loc8_) > 0)
            {
               _loc10_ = _loc4_ + _loc13_ * _loc7_;
               _loc12_ = _loc6_ + _loc13_ * _loc9_;
               if(_loc10_ > -Number(this.var_2824) && _loc10_ < this.var_2824 && _loc12_ > -Number(this.var_2252) && _loc12_ < this.var_2252)
               {
                  param3.x = 0;
                  param3.y = 1;
                  param3.z = 0;
                  _loc14_ = true;
               }
            }
         }
         if(!_loc14_ && _loc8_ > 0)
         {
            if((_loc13_ = (-Number(this.var_4542) - _loc5_) / _loc8_) > 0)
            {
               _loc10_ = _loc4_ + _loc13_ * _loc7_;
               _loc12_ = _loc6_ + _loc13_ * _loc9_;
               if(_loc10_ > -Number(this.var_2824) && _loc10_ < this.var_2824 && _loc12_ > -Number(this.var_2252) && _loc12_ < this.var_2252)
               {
                  param3.x = 0;
                  param3.y = -1;
                  param3.z = 0;
                  _loc14_ = true;
               }
            }
         }
         if(!_loc14_ && _loc9_ < 0)
         {
            if((_loc13_ = (Number(this.var_2252) - _loc6_) / _loc9_) > 0)
            {
               _loc10_ = _loc4_ + _loc13_ * _loc7_;
               if((_loc11_ = _loc5_ + _loc13_ * _loc8_) > -Number(this.var_4542) && _loc11_ < this.var_4542 && _loc10_ > -Number(this.var_2824) && _loc10_ < this.var_2824)
               {
                  param3.x = 0;
                  param3.y = 0;
                  param3.z = 1;
                  _loc14_ = true;
               }
            }
         }
         if(!_loc14_ && _loc9_ > 0)
         {
            if((_loc13_ = (-Number(this.var_2252) - _loc6_) / _loc9_) > 0)
            {
               _loc10_ = _loc4_ + _loc13_ * _loc7_;
               if((_loc11_ = _loc5_ + _loc13_ * _loc8_) > -Number(this.var_4542) && _loc11_ < this.var_4542 && _loc10_ > -Number(this.var_2824) && _loc10_ < this.var_2824)
               {
                  param3.x = 0;
                  param3.y = 0;
                  param3.z = -1;
                  _loc14_ = true;
               }
            }
         }
         return _loc14_ ? _loc13_ : -1;
      }
      
      override public function containsPoint(param1:Vector3D) : Boolean
      {
         var _loc2_:Number = param1.x - Number(this.var_169);
         var _loc3_:Number = param1.y - Number(this.var_1985);
         var _loc4_:Number = param1.z - Number(this.var_1587);
         return _loc2_ <= this.var_2824 && _loc2_ >= -Number(this.var_2824) && _loc3_ <= this.var_4542 && _loc3_ >= -Number(this.var_4542) && _loc4_ <= this.var_2252 && _loc4_ >= -Number(this.var_2252);
      }
      
      override public function method_5348(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.var_169 = (param4 + param1) * 0.5;
         this.var_1985 = (param5 + param2) * 0.5;
         this.var_1587 = (param6 + param3) * 0.5;
         this.var_2824 = (param4 - param1) * 0.5;
         this.var_4542 = (param5 - param2) * 0.5;
         this.var_2252 = (param6 - param3) * 0.5;
         super.method_5348(param1,param2,param3,param4,param5,param6);
      }
      
      override public function clone() : class_2226
      {
         var _loc1_:class_2227 = new class_2227();
         _loc1_.method_5348(_min.x,_min.y,_min.z,_max.x,_max.y,_max.z);
         return _loc1_;
      }
      
      public function get method_2656() : Number
      {
         return this.var_2824;
      }
      
      public function get method_6336() : Number
      {
         return this.var_4542;
      }
      
      public function get method_2955() : Number
      {
         return this.var_2252;
      }
      
      public function method_2122(param1:Vector3D, param2:Vector3D = null) : Vector3D
      {
         var _loc3_:Number = NaN;
         param2 = param2 || new Vector3D();
         _loc3_ = param1.x;
         if(_loc3_ < _min.x)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > _max.x)
         {
            _loc3_ = 0;
         }
         param2.x = _loc3_;
         _loc3_ = param1.y;
         if(_loc3_ < _min.y)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > _max.y)
         {
            _loc3_ = 0;
         }
         param2.y = _loc3_;
         _loc3_ = param1.z;
         if(_loc3_ < _min.z)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > _max.z)
         {
            _loc3_ = 0;
         }
         param2.z = _loc3_;
         return param2;
      }
      
      override protected function method_3591() : void
      {
         var_1588.scaleX = Math.max(Number(this.var_2824) * 2,0.001);
         var_1588.scaleY = Math.max(Number(this.var_4542) * 2,0.001);
         var_1588.scaleZ = Math.max(Number(this.var_2252) * 2,0.001);
         var_1588.x = this.var_169;
         var_1588.y = this.var_1985;
         var_1588.z = this.var_1587;
      }
      
      override protected function method_2569() : class_2489
      {
         return new class_2490(1,1,1,16777215,0.5);
      }
      
      override public function method_2618(param1:class_2230) : int
      {
         var _loc2_:Number = Number(param1.a);
         var _loc3_:Number = Number(param1.b);
         var _loc4_:Number = Number(param1.c);
         var _loc5_:Number = _loc2_ * Number(this.var_169) + _loc3_ * Number(this.var_1985) + _loc4_ * Number(this.var_1587) - Number(param1.d);
         if(_loc2_ < 0)
         {
            _loc2_ = -_loc2_;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = -_loc3_;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = -_loc4_;
         }
         var _loc6_:Number = _loc2_ * Number(this.var_2824) + _loc3_ * Number(this.var_4542) + _loc4_ * Number(this.var_2252);
         return _loc5_ > _loc6_ ? 0 : (_loc5_ < -_loc6_ ? 0 : int(class_2491.const_2149));
      }
      
      override public function method_2232(param1:class_2226, param2:Matrix3D) : void
      {
         var _loc3_:class_2227 = class_2227(param1);
         var _loc4_:Number = Number(_loc3_.var_169);
         var _loc5_:Number = Number(_loc3_.var_1985);
         var _loc6_:Number = Number(_loc3_.var_1587);
         var _loc7_:Vector.<Number> = class_2125.const_2368;
         param2.copyRawDataTo(_loc7_);
         var _loc8_:Number = _loc7_[0];
         var _loc9_:Number = _loc7_[4];
         var _loc10_:Number = _loc7_[8];
         var _loc11_:Number = _loc7_[12];
         var _loc12_:Number = _loc7_[1];
         var _loc13_:Number = _loc7_[5];
         var _loc14_:Number = _loc7_[9];
         var _loc15_:Number = _loc7_[13];
         var _loc16_:Number = _loc7_[2];
         var _loc17_:Number = _loc7_[6];
         var _loc18_:Number = _loc7_[10];
         var _loc19_:Number = _loc7_[14];
         this.var_169 = _loc4_ * _loc8_ + _loc5_ * _loc9_ + _loc6_ * _loc10_ + _loc11_;
         this.var_1985 = _loc4_ * _loc12_ + _loc5_ * _loc13_ + _loc6_ * _loc14_ + _loc15_;
         this.var_1587 = _loc4_ * _loc16_ + _loc5_ * _loc17_ + _loc6_ * _loc18_ + _loc19_;
         if(_loc8_ < 0)
         {
            _loc8_ = -_loc8_;
         }
         if(_loc9_ < 0)
         {
            _loc9_ = -_loc9_;
         }
         if(_loc10_ < 0)
         {
            _loc10_ = -_loc10_;
         }
         if(_loc12_ < 0)
         {
            _loc12_ = -_loc12_;
         }
         if(_loc13_ < 0)
         {
            _loc13_ = -_loc13_;
         }
         if(_loc14_ < 0)
         {
            _loc14_ = -_loc14_;
         }
         if(_loc16_ < 0)
         {
            _loc16_ = -_loc16_;
         }
         if(_loc17_ < 0)
         {
            _loc17_ = -_loc17_;
         }
         if(_loc18_ < 0)
         {
            _loc18_ = -_loc18_;
         }
         var _loc20_:Number = Number(_loc3_.var_2824);
         var _loc21_:Number = Number(_loc3_.var_4542);
         var _loc22_:Number = Number(_loc3_.var_2252);
         this.var_2824 = _loc20_ * _loc8_ + _loc21_ * _loc9_ + _loc22_ * _loc10_;
         this.var_4542 = _loc20_ * _loc12_ + _loc21_ * _loc13_ + _loc22_ * _loc14_;
         this.var_2252 = _loc20_ * _loc16_ + _loc21_ * _loc17_ + _loc22_ * _loc18_;
         _min.x = Number(this.var_169) - Number(this.var_2824);
         _min.y = Number(this.var_1985) - Number(this.var_4542);
         _min.z = Number(this.var_1587) - Number(this.var_2252);
         _max.x = this.var_169 + this.var_2824;
         _max.y = this.var_1985 + this.var_4542;
         _max.z = this.var_1587 + this.var_2252;
         var_1346 = true;
      }
   }
}
