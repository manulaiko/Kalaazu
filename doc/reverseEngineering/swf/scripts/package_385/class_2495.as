package package_385
{
   import away3d.arcane;
   import package_307.class_2496;
   import package_310.class_1779;
   import package_310.class_1780;
   import package_310.class_2252;
   import package_310.class_2494;
   import package_310.class_2497;
   
   public class class_2495
   {
       
      
      protected var var_1283:class_2250;
      
      protected var var_4305:class_2237;
      
      protected var var_3743:class_2668;
      
      protected var var_1738:class_2494;
      
      protected var _smooth:Boolean;
      
      protected var _repeat:Boolean;
      
      protected var var_2370:Boolean;
      
      protected var var_673:Boolean;
      
      protected var var_2514:Boolean = true;
      
      protected var var_416:Boolean;
      
      protected var var_3218:Boolean;
      
      protected var var_1253:Vector.<Number>;
      
      protected var var_180:Vector.<Number>;
      
      protected var var_595:String;
      
      protected var var_2468:String;
      
      protected var var_1561:String;
      
      protected var var_1221:String;
      
      private var var_1418:int = -1;
      
      protected var var_16:Vector.<String>;
      
      protected var var_2915:Vector.<String>;
      
      protected var var_553:Vector.<uint>;
      
      protected var var_1335:Vector.<uint>;
      
      protected var var_4851:int = -1;
      
      protected var var_1938:int = -1;
      
      protected var var_2811:int = -1;
      
      protected var var_3008:int = -1;
      
      protected var var_2060:int = -1;
      
      protected var var_2296:int = -1;
      
      protected var var_2386:int = -1;
      
      protected var var_1163:int = -1;
      
      protected var var_3169:int = -1;
      
      protected var var_1468:int = -1;
      
      protected var var_2151:uint;
      
      protected var var_266:uint;
      
      protected var var_612:int;
      
      protected var var_1052:uint;
      
      protected var var_1458:uint;
      
      protected var var_231:uint;
      
      protected var var_1687:Number;
      
      protected var var_3497:uint;
      
      protected var var_2991:Boolean;
      
      protected var var_1081:Boolean;
      
      protected var var_1613:String;
      
      protected var var_1302:String;
      
      protected var _profile:String;
      
      protected var var_4043:Boolean;
      
      public function class_2495(param1:String)
      {
         super();
         this.var_1283 = new class_2250();
         this.var_3743 = new class_2668();
         this._profile = param1;
         this.method_641(param1);
      }
      
      public function get method_1581() : Boolean
      {
         return this.var_673;
      }
      
      public function set method_1581(param1:Boolean) : void
      {
         this.var_673 = param1;
      }
      
      public function get name_26() : Boolean
      {
         return this.var_1081;
      }
      
      public function get method_4551() : String
      {
         return this.var_1613;
      }
      
      public function get method_506() : String
      {
         return this.var_1302;
      }
      
      public function get method_579() : Boolean
      {
         return this.var_4043;
      }
      
      public function set method_579(param1:Boolean) : void
      {
         this.var_4043 = param1;
      }
      
      private function method_641(param1:String) : void
      {
         this.var_4305 = new class_2237(param1);
         this.var_4305.method_4542 = 1;
         this.var_4305.reset();
      }
      
      public function get animateUVs() : Boolean
      {
         return this.var_416;
      }
      
      public function set animateUVs(param1:Boolean) : void
      {
         this.var_416 = param1;
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return this.var_3218;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         this.var_3218 = param1;
      }
      
      public function get method_4194() : Boolean
      {
         return this.var_2514;
      }
      
      public function set method_4194(param1:Boolean) : void
      {
         this.var_2514 = param1;
      }
      
      public function method_6474(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this._smooth = param1;
         this._repeat = param2;
         this.var_2370 = param3;
      }
      
      public function method_781(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         this.var_1253 = param1;
         this.var_180 = param2;
      }
      
      public function get method_5183() : class_2494
      {
         return this.var_1738;
      }
      
      public function set method_5183(param1:class_2494) : void
      {
         this.var_1738 = param1;
      }
      
      public function compile() : void
      {
         this.method_1658();
         this.method_17();
         this.var_16 = Vector.<String>(["va0"]);
         this.var_2915 = Vector.<String>(["vt0"]);
         this.var_595 = "";
         this.var_2468 = "";
         this.var_1283.name_53 = this.var_4305.method_3118();
         this.var_4305.method_588(this.var_1283.name_53,1);
         this.method_2652();
         this.method_1869();
         this.method_595();
         var _loc1_:Number = 0;
         while(_loc1_ < 4)
         {
            this.var_4305.method_5384();
            _loc1_++;
         }
         this.method_2506();
         if(this.var_3743.method_1841 > 0 || Boolean(this.var_4043))
         {
            this.method_6412();
         }
         this.method_4652();
         this.method_556();
         this.method_1355();
         this.var_1221 = this.method_6538;
      }
      
      protected function method_2506() : void
      {
      }
      
      protected function method_556() : void
      {
         if(this.var_3743.method_5110 > 0)
         {
            this.method_3144();
         }
         if(this.var_3743.method_2865 > 0)
         {
            this.method_4302();
         }
         if(this.var_3743.method_2419 > 0)
         {
            this.method_1462();
         }
         if(this.var_3743.method_2081 > 0)
         {
            this.method_2124();
         }
         this.method_1661();
         this.var_1561 = this.var_2468;
         this.var_2468 = "";
         this.method_1280();
      }
      
      protected function method_1661() : void
      {
      }
      
      protected function method_2124() : void
      {
      }
      
      protected function method_1462() : void
      {
      }
      
      private function method_3144() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:class_2251 = this.var_4305.method_723();
         this.var_4851 = _loc1_.index;
         var _loc2_:class_2251 = this.var_4305.method_5601();
         this.var_1283.var_443 = _loc2_;
         if(this.animateUVs)
         {
            _loc3_ = this.var_4305.method_5384();
            _loc4_ = this.var_4305.method_5384();
            this.var_1938 = Number(_loc3_.index) * 4;
            this.var_595 += "dp4 " + _loc2_ + ".x, " + _loc1_ + ", " + _loc3_ + "\n" + "dp4 " + _loc2_ + ".y, " + _loc1_ + ", " + _loc4_ + "\n" + "mov " + _loc2_ + ".zw, " + _loc1_ + ".zw \n";
         }
         else
         {
            this.var_1938 = -1;
            this.var_1081 = true;
            this.var_1613 = _loc2_.toString();
            this.var_1302 = _loc1_.toString();
         }
      }
      
      private function method_4302() : void
      {
         var _loc1_:class_2251 = this.var_4305.method_723();
         this.var_2811 = _loc1_.index;
         this.var_1283.var_1121 = this.var_4305.method_5601();
         this.var_595 += "mov " + this.var_1283.var_1121 + ", " + _loc1_ + "\n";
      }
      
      protected function method_6412() : void
      {
         this.var_1283.var_1070 = this.var_4305.method_3118();
         this.var_4305.method_588(this.var_1283.var_1070,this.var_3743.method_1841);
         var _loc1_:class_2251 = this.var_4305.method_5384();
         this.var_4305.method_5384();
         this.var_4305.method_5384();
         this.var_4305.method_5384();
         this.var_2386 = Number(_loc1_.index) * 4;
         this.var_595 += "m44 " + this.var_1283.var_1070 + ", " + this.var_1283.name_53 + ", " + _loc1_ + "\n";
         if(this.var_3743.method_3227)
         {
            this.var_1283.var_1489 = this.var_4305.method_5601();
            this.var_595 += "mov " + this.var_1283.var_1489 + ", " + this.var_1283.var_1070 + "\n";
         }
      }
      
      private function method_4652() : void
      {
         var _loc2_:* = null;
         var _loc1_:String = this.var_3743.method_1841 > 0 || Boolean(this.var_4043) ? this.var_1283.var_1070.toString() : this.var_2915[0];
         if(this.var_3743.method_1238 > 0)
         {
            this.var_1283.var_1930 = this.var_4305.method_5601();
            _loc2_ = "m44 vt5, " + _loc1_ + ", vc0\t\t\n" + "mov " + this.var_1283.var_1930 + ", vt5\n" + "mov op, vt5\n";
         }
         else
         {
            _loc2_ = "m44 op, " + _loc1_ + ", vc0\t\t\n";
         }
         this.var_595 += _loc2_;
      }
      
      private function method_1355() : void
      {
         this.var_2468 += "mov " + this.var_4305.method_5810 + ", " + this.var_1283.name_28 + "\n";
         this.var_4305.method_771(this.var_1283.name_28);
      }
      
      protected function method_1658() : void
      {
         this.var_1418 = -1;
         this.var_3169 = -1;
         this.var_4851 = -1;
         this.var_1938 = -1;
         this.var_2811 = -1;
         this.var_3008 = -1;
         this.var_2060 = -1;
         this.var_2296 = -1;
         this.var_2386 = -1;
         this.var_1163 = -1;
         this.var_1468 = -1;
      }
      
      protected function method_17() : void
      {
         this.var_612 = this.var_1458 + this.var_231;
         this.var_1687 = Math.ceil(Number(this.var_1052) / 4);
         if(this.var_1738.arcane::var_1906)
         {
            this.var_3497 = Number(this.var_2151) | Number(this.var_266);
         }
         else
         {
            this.var_3497 = this.var_266;
         }
         this.var_2991 = Boolean(this.var_1738.arcane::var_1906 && (this.method_5632() || this.method_2381()));
      }
      
      private function method_2652() : void
      {
         this.var_1283.var_1569 = this.var_4305.method_1853();
         this.var_1418 = Number(this.var_1283.var_1569.index) * 4;
      }
      
      protected function method_1869() : void
      {
         var _loc2_:* = 0;
         this.var_3743.reset();
         var _loc1_:Vector.<class_2497> = this.var_1738.arcane::var_1420;
         this.method_4067(this.var_1738.arcane::var_2753,this.var_1738.arcane::var_2698);
         if(this.var_1738.arcane::var_2047)
         {
            this.method_4067(this.var_1738.arcane::var_2047,this.var_1738.arcane::var_1078);
         }
         this.method_4067(this.var_1738.arcane::var_2401,this.var_1738.arcane::var_4870);
         if(this.var_2991)
         {
            this.method_4067(this.var_1738.arcane::var_1906,this.var_1738.arcane::var_3165);
         }
         if(this.var_1738.arcane::var_2959)
         {
            this.method_4067(this.var_1738.arcane::var_2959,this.var_1738.arcane::var_3212);
         }
         _loc2_ = _loc1_.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            this.method_4067(_loc1_[_loc3_].method,_loc1_[_loc3_].data);
            _loc3_++;
         }
         if(this.method_4682)
         {
            this.method_4067(this.var_1738.arcane::var_491,this.var_1738.arcane::var_1294);
         }
         this.var_3743.method_6510(this.var_1458,this.var_3497);
      }
      
      private function method_4067(param1:class_1779, param2:class_2252) : void
      {
         this.method_2167(param1,param2);
         this.var_3743.method_878(param2);
      }
      
      private function method_2167(param1:class_1779, param2:class_2252) : void
      {
         param1.arcane::reset();
         param2.reset();
         param2.name_104 = this.var_1253;
         param2.var_3329 = this.var_180;
         param2.var_4636 = this._smooth;
         param2.var_2679 = this._repeat;
         param2.var_2526 = this.var_2370;
         param2.var_4198 = Boolean(this.var_673) && this._profile != "baselineConstrained";
         param2.name_108 = this.var_612 + this.var_1052;
         param1.arcane::initVO(param2);
      }
      
      public function get method_5221() : int
      {
         return this.var_1418;
      }
      
      private function method_595() : void
      {
         this.var_1738.arcane::var_491.arcane::sharedRegisters = this.var_1283;
         this.var_1738.arcane::var_2753.arcane::sharedRegisters = this.var_1283;
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::sharedRegisters = this.var_1283;
         }
         this.var_1738.arcane::var_2401.arcane::sharedRegisters = this.var_1283;
         if(this.var_1738.arcane::var_1906)
         {
            this.var_1738.arcane::var_1906.arcane::sharedRegisters = this.var_1283;
         }
         if(this.var_1738.arcane::var_2959)
         {
            this.var_1738.arcane::var_2959.arcane::sharedRegisters = this.var_1283;
         }
         var _loc1_:Vector.<class_2497> = this.var_1738.arcane::var_1420;
         var _loc2_:int = _loc1_.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].method.arcane::sharedRegisters = this.var_1283;
            _loc3_++;
         }
      }
      
      public function get method_1025() : uint
      {
         return this.var_4305.method_1025;
      }
      
      public function get method_6441() : uint
      {
         return this.var_4305.method_6441;
      }
      
      public function get method_1035() : uint
      {
         return this.var_4305.method_1035;
      }
      
      public function get method_5678() : uint
      {
         return this.var_4305.method_5678;
      }
      
      public function get method_5243() : uint
      {
         return this.var_4305.method_5243;
      }
      
      protected function method_5632() : Boolean
      {
         return this.var_612 > 0 && (Number(this.var_2151) & 0) != 0;
      }
      
      protected function method_1538() : Boolean
      {
         return this.var_612 > 0 && (Number(this.var_266) & 0) != 0;
      }
      
      public function dispose() : void
      {
         this.method_3637();
         this.var_4305.dispose();
         this.var_4305 = null;
         this.var_1283 = null;
      }
      
      private function method_3637() : void
      {
         if(this.var_1738.arcane::var_491)
         {
            this.var_1738.arcane::var_491.arcane::method_3031();
         }
         if(this.var_1738.arcane::var_2753)
         {
            this.var_1738.arcane::var_2753.arcane::method_3031();
         }
         if(this.var_1738.arcane::var_2401)
         {
            this.var_1738.arcane::var_2401.arcane::method_3031();
         }
         if(this.var_1738.arcane::var_1906)
         {
            this.var_1738.arcane::var_1906.arcane::method_3031();
         }
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::method_3031();
         }
         if(this.var_1738.arcane::var_2959)
         {
            this.var_1738.arcane::var_2959.arcane::method_3031();
         }
         var _loc1_:Vector.<class_2497> = this.var_1738.arcane::var_1420;
         var _loc2_:uint = _loc1_.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].method.arcane::method_3031();
            _loc3_++;
         }
      }
      
      public function get method_3842() : uint
      {
         return this.var_2151;
      }
      
      public function set method_3842(param1:uint) : void
      {
         this.var_2151 = param1;
      }
      
      public function get method_2793() : uint
      {
         return this.var_266;
      }
      
      public function set method_2793(param1:uint) : void
      {
         this.var_266 = param1;
      }
      
      protected function method_2381() : Boolean
      {
         return this.var_1052 > 0 && (Number(this.var_2151) & 0) != 0;
      }
      
      protected function method_2490() : Boolean
      {
         return this.var_1052 > 0 && (Number(this.var_266) & 0) != 0;
      }
      
      protected function method_564() : Boolean
      {
         return this.var_1052 > 0 && ((Number(this.var_266) | Number(this.var_2151)) & 0) != 0;
      }
      
      public function get method_4420() : int
      {
         return this.var_4851;
      }
      
      public function get method_2259() : int
      {
         return this.var_1938;
      }
      
      public function get method_6044() : int
      {
         return this.var_2811;
      }
      
      public function get method_3020() : int
      {
         return this.var_3008;
      }
      
      public function get method_6211() : int
      {
         return this.var_2060;
      }
      
      public function get method_635() : int
      {
         return this.var_2296;
      }
      
      public function get method_4931() : int
      {
         return this.var_3169;
      }
      
      public function get method_3846() : int
      {
         return this.var_2386;
      }
      
      public function get method_1623() : int
      {
         return this.var_1163;
      }
      
      public function get method_3999() : int
      {
         return this.var_1468;
      }
      
      public function get method_2231() : String
      {
         return this.var_595;
      }
      
      public function get method_6538() : String
      {
         return this.var_2468;
      }
      
      public function get method_4297() : String
      {
         return this.var_1561;
      }
      
      public function get method_3709() : String
      {
         return this.var_1221;
      }
      
      public function get name_28() : String
      {
         return this.var_1283.name_28.toString();
      }
      
      public function get method_2262() : uint
      {
         return this.var_1458;
      }
      
      public function set method_2262(param1:uint) : void
      {
         this.var_1458 = param1;
      }
      
      public function get method_3204() : uint
      {
         return this.var_231;
      }
      
      public function set method_3204(param1:uint) : void
      {
         this.var_231 = param1;
      }
      
      public function get method_1248() : uint
      {
         return this.var_1052;
      }
      
      public function set method_1248(param1:uint) : void
      {
         this.var_1052 = param1;
      }
      
      public function get method_3832() : Boolean
      {
         return this.var_2991;
      }
      
      public function get method_1591() : Vector.<String>
      {
         return this.var_16;
      }
      
      public function get method_2721() : Vector.<String>
      {
         return this.var_2915;
      }
      
      public function get method_4682() : Boolean
      {
         return this.var_3743.method_2419 > 0 && Boolean(this.var_1738.arcane::var_491.arcane::method_5395);
      }
      
      protected function method_71() : Boolean
      {
         return this.var_612 > 0 && (Number(this.var_3497) & 0) != 0;
      }
      
      protected function method_1280() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Vector.<class_2497> = this.var_1738.arcane::var_1420;
         var _loc2_:uint = _loc1_.length;
         if(this.var_2514)
         {
            _loc5_ = this.var_4305.method_4883();
            this.var_4305.method_4539(_loc5_,1);
            this.var_2468 += "mov " + _loc5_ + ", " + this.var_1283.name_28 + ".w\n";
         }
         var _loc6_:Number = 0;
         while(_loc6_ < _loc2_)
         {
            _loc3_ = _loc1_[_loc6_].method;
            _loc4_ = _loc1_[_loc6_].data;
            this.var_595 += _loc3_.arcane::getVertexCode(_loc4_,this.var_4305);
            if(Boolean(_loc4_.var_4475) || Boolean(_loc4_.var_4342))
            {
               this.var_4305.method_5694(this.var_1283.var_1070);
            }
            this.var_2468 += _loc3_.arcane::getFragmentCode(_loc4_,this.var_4305,this.var_1283.name_28);
            if(_loc4_.var_10)
            {
               this.var_4305.method_771(this.var_1283.var_3779);
            }
            if(_loc4_.var_3475)
            {
               this.var_4305.method_771(this.var_1283.var_4238);
            }
            _loc6_++;
         }
         if(this.var_2514)
         {
            this.var_2468 += "mov " + this.var_1283.name_28 + ".w, " + _loc5_ + "\n";
            this.var_4305.method_771(_loc5_);
         }
         if(this.var_1738.arcane::var_2959)
         {
            this.var_595 += this.var_1738.arcane::var_2959.arcane::getVertexCode(this.var_1738.arcane::var_3212,this.var_4305);
            this.var_2468 += this.var_1738.arcane::var_2959.arcane::getFragmentCode(this.var_1738.arcane::var_3212,this.var_4305,this.var_1283.name_28);
         }
      }
      
      public function get method_6513() : Vector.<uint>
      {
         return this.var_553;
      }
      
      public function get method_2846() : Vector.<uint>
      {
         return this.var_1335;
      }
   }
}
