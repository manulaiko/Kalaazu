package package_310
{
   import away3d.arcane;
   import flash.display.BitmapData;
   import package_198.class_1208;
   import package_364.DirectionalLight;
   import package_369.class_2117;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2616 extends class_2608
   {
      
      private static var var_194:class_2117;
      
      private static var var_3897:int;
      
      private static var var_2018:BitmapData;
       
      
      private var var_3256:int;
      
      private var _range:Number = 1;
      
      private var var_2353:int;
      
      public function class_2616(param1:DirectionalLight, param2:int = 4)
      {
         super(param1);
         this.var_3256 = var_1527.method_493.depthMapSize;
         this.method_2452 = param2;
         ++var_3897;
         if(!var_194)
         {
            this.method_5426();
         }
      }
      
      public function get method_2452() : int
      {
         return this.var_2353;
      }
      
      public function set method_2452(param1:int) : void
      {
         this.var_2353 = param1;
         if(this.var_2353 < 1)
         {
            this.var_2353 = 1;
         }
         else if(this.var_2353 > 24)
         {
            this.var_2353 = 24;
         }
         method_220();
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         super.arcane::initVO(param1);
         param1.var_1986 = true;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         super.arcane::method_4956(param1);
         var _loc2_:Vector.<Number> = param1.var_3329;
         var _loc3_:int = int(param1.var_2676);
         _loc2_[_loc3_ + 8] = 1 / Number(this.var_2353);
      }
      
      public function get range() : Number
      {
         return Number(this._range) * 2;
      }
      
      public function set range(param1:Number) : void
      {
         this._range = param1 / 2;
      }
      
      private function method_5426() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var_2018 = new BitmapData(64,64,false);
         var _loc1_:Vector.<uint> = new Vector.<uint>();
         var _loc3_:Number = 1 / (Number(this.var_3256) * Number(this._range));
         var _loc6_:Number = 0;
         while(_loc6_ < 4096)
         {
            _loc4_ = 2 * (Math.random() - 0.5);
            _loc5_ = 2 * (Math.random() - 0.5);
            if(_loc4_ < 0)
            {
               _loc4_ -= _loc3_;
            }
            else
            {
               _loc4_ += _loc3_;
            }
            if(_loc5_ < 0)
            {
               _loc5_ -= _loc3_;
            }
            else
            {
               _loc5_ += _loc3_;
            }
            if(_loc4_ > 1)
            {
               _loc4_ = 1;
            }
            else if(_loc4_ < -1)
            {
               _loc4_ = -1;
            }
            if(_loc5_ > 1)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ < -1)
            {
               _loc5_ = -1;
            }
            _loc1_[_loc6_] = int((_loc4_ * 0.5 + 0.5) * 255) << 16 | int((_loc5_ * 0.5 + 0.5) * 255) << 8;
            _loc6_++;
         }
         var_2018.setVector(var_2018.rect,_loc1_);
         var_194 = new class_2117(var_2018);
      }
      
      override public function dispose() : void
      {
         if(--var_3897 == 0)
         {
            var_194.dispose();
            var_2018.dispose();
            var_194 = null;
         }
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         super.arcane::activate(param1,param2);
         var _loc3_:Vector.<Number> = param1.var_3329;
         var _loc4_:uint = uint(param1.var_2676);
         _loc3_[_loc4_ + 9] = (param2.width - 1) / 63;
         _loc3_[_loc4_ + 10] = (param2.height - 1) / 63;
         _loc3_[_loc4_ + 11] = 2 * Number(this._range) / Number(this.var_3256);
         param2.arcane::var_4582.setTextureAt(param1.var_2852 + 1,var_194.method_6425(param2));
      }
      
      override protected function method_157(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:class_2251 = param2.method_3238();
         var _loc5_:class_2251 = param2.method_1853();
         var _loc6_:class_2251 = param2.method_1853();
         var _loc7_:class_2251 = param2.method_1853();
         param1.var_2676 = Number(_loc5_.index) * 4;
         param1.var_2852 = _loc4_.index;
         return this.method_4494(param2,_loc7_,_loc4_,_loc5_,param3);
      }
      
      private function method_4494(param1:class_2237, param2:class_2251, param3:class_2251, param4:class_2251, param5:class_2251) : String
      {
         var _loc6_:String = "";
         var _loc7_:class_2251 = param1.method_3238();
         var _loc8_:class_2251 = param1.method_4834();
         var _loc9_:int = int(this.var_2353);
         param1.method_4539(_loc8_,1);
         var _loc10_:class_2251 = param1.method_4834();
         var _loc11_:class_2251 = var_1283.var_1930;
         _loc6_ += "div " + _loc8_ + ", " + _loc11_ + ", " + _loc11_ + ".w\n" + "mul " + _loc8_ + ".xy, " + _loc8_ + ".xy, " + param2 + ".yz\n";
         while(_loc9_ > 0)
         {
            if(_loc9_ == this.var_2353)
            {
               _loc6_ += "tex " + _loc8_ + ", " + _loc8_ + ", " + _loc7_ + " <2d,nearest,repeat,mipnone>\n";
            }
            else
            {
               _loc6_ += "tex " + _loc8_ + ", " + _loc8_ + ".zwxy, " + _loc7_ + " <2d,nearest,repeat,mipnone>\n";
            }
            _loc6_ += "sub " + _loc8_ + ".zw, " + _loc8_ + ".xy, fc0.xx\n" + "mul " + _loc8_ + ".zw, " + _loc8_ + ".zw, " + param2 + ".w\n";
            if(_loc9_ == this.var_2353)
            {
               _loc6_ += "add " + _loc8_ + ".xy, " + _loc8_ + ".zw, " + var_1513 + ".xy\n" + "tex " + _loc10_ + ", " + _loc8_ + ", " + param3 + " <2d,nearest,clamp,mipnone>\n" + "dp4 " + _loc10_ + ".z, " + _loc10_ + ", " + param4 + "\n" + "slt " + param5 + ".w, " + var_1513 + ".z, " + _loc10_ + ".z\n";
            }
            else
            {
               _loc6_ += this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 4)
            {
               _loc6_ += "add " + _loc8_ + ".xy, " + _loc8_ + ".xy, " + _loc8_ + ".zw\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 1)
            {
               _loc6_ += "sub " + _loc8_ + ".xy, " + var_1513 + ".xy, " + _loc8_ + ".zw\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 5)
            {
               _loc6_ += "sub " + _loc8_ + ".xy, " + _loc8_ + ".xy, " + _loc8_ + ".zw\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 2)
            {
               _loc6_ = (_loc6_ += "neg " + _loc8_ + ".w, " + _loc8_ + ".w\n") + ("add " + _loc8_ + ".xy, " + _loc8_ + ".wz, " + var_1513 + ".xy\n" + this.method_854(_loc8_,param3,param4,param5,param1));
            }
            if(_loc9_ > 6)
            {
               _loc6_ += "add " + _loc8_ + ".xy, " + _loc8_ + ".xy, " + _loc8_ + ".wz\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 3)
            {
               _loc6_ += "sub " + _loc8_ + ".xy, " + var_1513 + ".xy, " + _loc8_ + ".wz\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            if(_loc9_ > 7)
            {
               _loc6_ += "sub " + _loc8_ + ".xy, " + _loc8_ + ".xy, " + _loc8_ + ".wz\n" + this.method_854(_loc8_,param3,param4,param5,param1);
            }
            _loc9_ -= 8;
         }
         param1.method_771(_loc8_);
         return _loc6_ + ("mul " + param5 + ".w, " + param5 + ".w, " + param2 + ".x\n");
      }
      
      private function method_854(param1:class_2251, param2:class_2251, param3:class_2251, param4:class_2251, param5:class_2237) : String
      {
         var _loc6_:class_2251 = param5.method_4834();
         return "tex " + _loc6_ + ", " + param1 + ", " + param2 + " <2d,nearest,clamp,mipnone>\n" + "dp4 " + _loc6_ + ".z, " + _loc6_ + ", " + param3 + "\n" + "slt " + _loc6_ + ".z, " + var_1513 + ".z, " + _loc6_ + ".z\n" + "add " + param4 + ".w, " + param4 + ".w, " + _loc6_ + ".z\n";
      }
      
      override arcane function method_766(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:Vector.<Number> = param1.var_3329;
         var _loc4_:uint = uint(param1.var_4227);
         _loc3_[_loc4_] = 1 / Number(this.var_2353);
         _loc3_[_loc4_ + 1] = (param2.width - 1) / 63;
         _loc3_[_loc4_ + 2] = (param2.height - 1) / 63;
         _loc3_[_loc4_ + 3] = 2 * Number(this._range) / Number(this.var_3256);
         param2.arcane::var_4582.setTextureAt(param1.var_2852 + 1,var_194.method_6425(param2));
      }
      
      override arcane function method_6039(param1:class_2252, param2:class_2237, param3:class_2251, param4:class_2251, param5:class_2251, param6:class_2251) : String
      {
         var_1513 = param5;
         var _loc7_:class_2251 = param2.method_1853();
         param1.var_4227 = Number(_loc7_.index) * 4;
         return this.method_4494(param2,_loc7_,param4,param3,param6);
      }
   }
}
