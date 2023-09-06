package package_385
{
   import away3d.arcane;
   
   public class class_2704 extends class_2495
   {
       
      
      public var var_2643:Vector.<class_2251>;
      
      public var var_459:Vector.<class_2251>;
      
      public var var_488:Vector.<class_2251>;
      
      public var var_4126:Vector.<class_2251>;
      
      private var var_439:int;
      
      private var var_712:class_2251;
      
      public function class_2704(param1:String)
      {
         super(param1);
      }
      
      public function get lightVertexConstantIndex() : int
      {
         return this.var_439;
      }
      
      override protected function method_1658() : void
      {
         super.method_1658();
         this.var_439 = -1;
      }
      
      override protected function method_2506() : void
      {
         if(this.tangentSpace)
         {
            var_1283.var_2367 = var_4305.method_3118();
            var_4305.method_588(var_1283.var_2367,1);
            var_1283.var_2765 = var_4305.method_3118();
            var_4305.method_588(var_1283.var_2765,1);
            var_1283.var_723 = var_4305.method_723();
            var_2060 = var_1283.var_723.index;
            var_16.push(var_1283.var_723.toString());
            var_2915.push(var_1283.var_2367.toString());
         }
         var_1283.var_4037 = var_4305.method_723();
         var_3008 = var_1283.var_4037.index;
         var_1283.var_2573 = var_4305.method_3118();
         var_4305.method_588(var_1283.var_2573,1);
         var_16.push(var_1283.var_4037.toString());
         var_2915.push(var_1283.var_2573.toString());
      }
      
      public function get tangentSpace() : Boolean
      {
         return var_1052 == 0 && Boolean(method_5183.arcane::var_491.arcane::method_5395) && Boolean(var_1738.arcane::var_491.arcane::tangentSpace);
      }
      
      override protected function method_17() : void
      {
         super.method_17();
         this.var_459 = new Vector.<class_2251>(var_1458,true);
         this.var_2643 = new Vector.<class_2251>(Number(var_1458) * 2,true);
         if(this.tangentSpace)
         {
            this.var_4126 = new Vector.<class_2251>(var_231,true);
            this.var_488 = new Vector.<class_2251>(Number(var_231) * 2,true);
         }
         else
         {
            this.var_488 = new Vector.<class_2251>(Number(var_231) * 3,true);
         }
      }
      
      override protected function method_1869() : void
      {
         super.method_1869();
         if(!this.tangentSpace)
         {
            var_3743.method_6352(false);
         }
      }
      
      override protected function method_1462() : void
      {
         var _loc1_:* = null;
         var_1283.var_3779 = var_4305.method_4834();
         var_4305.method_4539(var_1283.var_3779,var_3743.method_2419);
         if(Boolean(var_1738.arcane::var_491.arcane::method_5395) && !var_1738.arcane::var_491.arcane::tangentSpace)
         {
            var_595 += var_1738.arcane::var_491.arcane::getVertexCode(var_1738.arcane::var_1294,var_4305);
            var_2468 += var_1738.arcane::var_491.arcane::getFragmentCode(var_1738.arcane::var_1294,var_4305,var_1283.var_3779);
            return;
         }
         if(this.tangentSpace)
         {
            this.method_5162();
         }
         else
         {
            _loc1_ = new Vector.<class_2251>(3,true);
            _loc1_[0] = var_4305.method_5384();
            _loc1_[1] = var_4305.method_5384();
            _loc1_[2] = var_4305.method_5384();
            var_4305.method_5384();
            var_1163 = Number(_loc1_[0].index) * 4;
            var_1283.var_3038 = var_4305.method_5601();
            var_595 += "m33 undefined.xyz, undefined, " + _loc1_[0] + "\n" + "mov " + var_1283.var_3038 + ".w, " + var_1283.var_2573 + ".w\t\n";
            var_2468 += "nrm undefined.xyz, undefined\nmov undefined.w, undefined.w\t\t\n";
         }
         if(false)
         {
            var_1283.var_723 = var_4305.method_723();
            var_2060 = var_1283.var_723.index;
            var_1283.var_1141 = var_4305.method_5601();
         }
      }
      
      private function method_5162() : void
      {
         var_595 += "nrm undefined.xyz, undefined\nnrm undefined.xyz, undefined\n";
         var_595 += "crs undefined.xyz, undefined, undefined\n";
         var_2468 += var_1738.arcane::var_491.arcane::getFragmentCode(var_1738.arcane::var_1294,var_4305,var_1283.var_3779);
         if(var_1738.arcane::var_1294.var_3475)
         {
            var_4305.method_771(var_1283.var_4238);
         }
         if(Boolean(var_1738.arcane::var_1294.var_4342) || Boolean(var_1738.arcane::var_1294.var_4475))
         {
            var_4305.method_5694(var_1283.var_1070);
         }
      }
      
      override protected function method_2124() : void
      {
         var _loc2_:* = null;
         var _loc1_:class_2251 = var_4305.method_5384();
         var_1283.var_4419 = var_4305.method_5601();
         var_1283.var_4238 = var_4305.method_4834();
         var_4305.method_4539(var_1283.var_4238,var_3743.method_2081);
         var_3169 = Number(_loc1_.index) * 4;
         if(this.tangentSpace)
         {
            _loc2_ = var_4305.method_3118();
            var_595 += "sub " + _loc2_ + ", " + _loc1_ + ", " + var_1283.name_53 + "\n" + "m33 " + var_1283.var_4419 + ".xyz, " + _loc2_ + ", " + var_1283.var_2367 + "\n" + "mov " + var_1283.var_4419 + ".w, " + var_1283.name_53 + ".w\n";
         }
         else
         {
            var_595 += "sub undefined, " + _loc1_ + ", " + var_1283.var_1070 + "\n";
            var_4305.method_5694(var_1283.var_1070);
         }
         var_2468 += "nrm undefined.xyz, undefined\nmov undefined.w,   undefined.w \t\t\n";
      }
      
      override protected function method_1661() : void
      {
         if(false)
         {
            this.method_3226();
         }
         var_1738.arcane::var_2753.arcane::shadowRegister = this.var_712;
         var_1283.name_28 = var_4305.method_4834();
         var_4305.method_4539(var_1283.name_28,1);
         var_595 += var_1738.arcane::var_2753.arcane::getVertexCode(var_1738.arcane::var_2698,var_4305);
         var_2468 += var_1738.arcane::var_2753.arcane::method_1029(var_1738.arcane::var_2698,var_4305);
         if(var_2991)
         {
            var_595 += var_1738.arcane::var_1906.arcane::getVertexCode(var_1738.arcane::var_3165,var_4305);
            var_2468 += var_1738.arcane::var_1906.arcane::method_1029(var_1738.arcane::var_3165,var_4305);
         }
         if(method_71())
         {
            this.method_2949();
            this.method_1010();
            this.method_1194();
         }
         if(method_564())
         {
            this.method_4973();
         }
         var_595 += var_1738.arcane::var_2401.arcane::getVertexCode(var_1738.arcane::var_4870,var_4305);
         var_2468 += var_1738.arcane::var_2401.arcane::getFragmentCode(var_1738.arcane::var_4870,var_4305,var_1283.name_28);
         if(var_1738.arcane::var_4870.var_10)
         {
            var_4305.method_771(var_1283.var_3779);
         }
         if(var_1738.arcane::var_4870.var_3475)
         {
            var_4305.method_771(var_1283.var_4238);
         }
         var_2468 += var_1738.arcane::var_2753.arcane::method_5951(var_1738.arcane::var_2698,var_4305,var_1283.name_28);
         if(var_3218)
         {
            var_2468 += "add undefined.w, undefined.w, undefined.z\ndiv undefined.xyz, undefined, undefined.w\nsub undefined.w, undefined.w, undefined.z\nsat undefined.xyz, undefined\n";
         }
         if(var_1738.arcane::var_2698.var_10)
         {
            var_4305.method_771(var_1283.var_3779);
         }
         if(var_1738.arcane::var_2698.var_3475)
         {
            var_4305.method_771(var_1283.var_4238);
         }
         if(var_2991)
         {
            var_1738.arcane::var_1906.arcane::shadowRegister = this.var_712;
            var_2468 += var_1738.arcane::var_1906.arcane::method_5951(var_1738.arcane::var_3165,var_4305,var_1283.name_28);
            if(var_1738.arcane::var_3165.var_10)
            {
               var_4305.method_771(var_1283.var_3779);
            }
            if(var_1738.arcane::var_3165.var_3475)
            {
               var_4305.method_771(var_1283.var_4238);
            }
         }
         if(false)
         {
            var_4305.method_771(this.var_712);
         }
      }
      
      private function method_3226() : void
      {
         if(false)
         {
            this.var_712 = var_1283.var_3779;
         }
         else
         {
            this.var_712 = var_4305.method_4834();
         }
         var_4305.method_4539(this.var_712,1);
         var_595 += var_1738.arcane::var_2047.arcane::getVertexCode(var_1738.arcane::var_1078,var_4305);
         var_2468 += var_1738.arcane::var_2047.arcane::getFragmentCode(var_1738.arcane::var_1078,var_4305,this.var_712);
      }
      
      private function method_2949() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:* = 0;
         if(this.var_4126)
         {
            _loc2_ = uint(this.var_4126.length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               this.var_4126[_loc1_] = var_4305.method_5384();
               if(this.var_439 == -1)
               {
                  this.var_439 = Number(this.var_4126[_loc1_].index) * 4;
               }
               _loc1_++;
            }
         }
         _loc2_ = uint(this.var_459.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.var_459[_loc1_] = var_4305.method_5384();
            if(this.var_439 == -1)
            {
               this.var_439 = Number(this.var_459[_loc1_].index) * 4;
            }
            _loc1_++;
         }
         _loc2_ = uint(this.var_488.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.var_488[_loc1_] = var_4305.method_1853();
            if(var_2296 == -1)
            {
               var_2296 = Number(this.var_488[_loc1_].index) * 4;
            }
            _loc1_++;
         }
         _loc2_ = uint(this.var_2643.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.var_2643[_loc1_] = var_4305.method_1853();
            if(var_2296 == -1)
            {
               var_2296 = Number(this.var_2643[_loc1_].index) * 4;
            }
            _loc1_++;
         }
      }
      
      private function method_1010() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:* = null;
         var _loc6_:Boolean = Boolean(var_2991) && Boolean(method_5632());
         var _loc7_:Boolean = Boolean(method_1538());
         if(!(_loc6_ || _loc7_))
         {
            return;
         }
         var _loc8_:Number = 0;
         while(_loc8_ < var_231)
         {
            if(this.tangentSpace)
            {
               _loc3_ = this.var_4126[_loc4_++];
               _loc9_ = var_4305.method_5601();
               var_595 += "m33 " + _loc9_ + ".xyz, " + _loc3_ + ", " + var_1283.var_2367 + "\n" + "mov " + _loc9_ + ".w, " + _loc3_ + ".w\n";
               _loc3_ = var_4305.method_4834();
               var_4305.method_588(_loc3_,1);
               var_2468 += "nrm " + _loc3_ + ".xyz, " + _loc9_ + "\n";
               var_2468 += "mov " + _loc3_ + ".w, " + _loc9_ + ".w\n";
            }
            else
            {
               _loc3_ = this.var_488[_loc5_++];
            }
            _loc1_ = this.var_488[_loc5_++];
            _loc2_ = this.var_488[_loc5_++];
            if(_loc7_)
            {
               var_2468 += var_1738.arcane::var_2753.arcane::method_4161(var_1738.arcane::var_2698,_loc3_,_loc1_,var_4305);
            }
            if(_loc6_)
            {
               var_2468 += var_1738.arcane::var_1906.arcane::method_4161(var_1738.arcane::var_3165,_loc3_,_loc2_,var_4305);
            }
            if(this.tangentSpace)
            {
               var_4305.method_5694(_loc3_);
            }
            _loc8_++;
         }
      }
      
      private function method_1194() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:* = null;
         _loc7_ = Boolean(var_2991) && Boolean(method_5632());
         _loc8_ = Boolean(method_1538());
         if(!(_loc7_ || _loc8_))
         {
            return;
         }
         var _loc9_:Number = 0;
         while(_loc9_ < var_1458)
         {
            _loc3_ = this.var_459[_loc5_++];
            _loc1_ = this.var_2643[_loc6_++];
            _loc2_ = this.var_2643[_loc6_++];
            _loc4_ = var_4305.method_4834();
            var_4305.method_4539(_loc4_,1);
            _loc10_ = var_4305.method_5601();
            if(this.tangentSpace)
            {
               _loc11_ = var_4305.method_3118();
               var_595 += "sub " + _loc11_ + ", " + _loc3_ + ", " + var_1283.name_53 + "\n" + "m33 " + _loc10_ + ".xyz, " + _loc11_ + ", " + var_1283.var_2367 + "\n" + "mov " + _loc10_ + ".w, " + var_1283.name_53 + ".w\n";
            }
            else
            {
               var_595 += "sub " + _loc10_ + ", " + _loc3_ + ", " + var_1283.var_1070 + "\n";
            }
            if(Boolean(var_673) && _profile != "baselineConstrained")
            {
               var_2468 += "dp3 " + _loc4_ + ".w, " + _loc10_ + ", " + _loc10_ + "\n" + "sub " + _loc4_ + ".w, " + _loc4_ + ".w, " + _loc1_ + ".w\n" + "mul " + _loc4_ + ".w, " + _loc4_ + ".w, " + _loc2_ + ".w\n" + "sat " + _loc4_ + ".w, " + _loc4_ + ".w\n" + "sub " + _loc4_ + ".w, " + var_1283.var_1569 + ".w, " + _loc4_ + ".w\n" + "nrm " + _loc4_ + ".xyz, " + _loc10_ + "\n";
            }
            else
            {
               var_2468 += "nrm " + _loc4_ + ".xyz, " + _loc10_ + "\n" + "mov " + _loc4_ + ".w, " + _loc10_ + ".w\n";
            }
            if(var_2296 == -1)
            {
               var_2296 = Number(_loc3_.index) * 4;
            }
            if(_loc8_)
            {
               var_2468 += var_1738.arcane::var_2753.arcane::method_4161(var_1738.arcane::var_2698,_loc4_,_loc1_,var_4305);
            }
            if(_loc7_)
            {
               var_2468 += var_1738.arcane::var_1906.arcane::method_4161(var_1738.arcane::var_3165,_loc4_,_loc2_,var_4305);
            }
            var_4305.method_771(_loc4_);
            _loc9_++;
         }
      }
      
      private function method_4973() : void
      {
         var _loc1_:* = null;
         var _loc4_:Number = 0;
         var _loc5_:* = null;
         var _loc2_:* = [".x",".y",".z",".w"];
         var _loc3_:Vector.<class_2251> = new Vector.<class_2251>();
         var _loc6_:Boolean = Boolean(var_2991) && Boolean(method_2381());
         var _loc7_:Boolean = Boolean(method_2490());
         if(!(_loc6_ || _loc7_))
         {
            return;
         }
         if(_loc7_)
         {
            var_553 = new Vector.<uint>();
         }
         if(_loc6_)
         {
            var_1335 = new Vector.<uint>();
         }
         _loc4_ = 0;
         while(_loc4_ < var_1687)
         {
            _loc3_[_loc4_] = var_4305.method_1853();
            if(_loc4_ == 0)
            {
               var_1468 = Number(_loc3_[_loc4_].index) * 4;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < var_1052)
         {
            _loc1_ = _loc3_[Math.floor(_loc4_ / 4)].toString() + _loc2_[_loc4_ % 4];
            if(_loc7_)
            {
               _loc5_ = var_4305.method_3238();
               var_553[_loc4_] = _loc5_.index;
               var_2468 += var_1738.arcane::var_2753.arcane::method_1573(var_1738.arcane::var_2698,_loc5_,_loc1_,var_4305);
            }
            if(_loc6_)
            {
               _loc5_ = var_4305.method_3238();
               var_1335[_loc4_] = _loc5_.index;
               var_2468 += var_1738.arcane::var_1906.arcane::method_1573(var_1738.arcane::var_3165,_loc5_,_loc1_,var_4305);
            }
            _loc4_++;
         }
      }
   }
}
