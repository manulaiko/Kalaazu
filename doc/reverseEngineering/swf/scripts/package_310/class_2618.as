package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_369.class_2570;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2618 extends class_1780
   {
       
      
      private var var_2100:class_2570;
      
      private var var_3679:Number = 0;
      
      private var var_3485:Number = 0;
      
      private var var_1109:Number = 0;
      
      private var var_4219:Boolean;
      
      private var var_3745:Number;
      
      private var _alpha:Number = 1;
      
      public function class_2618(param1:class_2570, param2:Number = 0.1, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super();
         this.var_2100 = param1;
         this.var_3679 = param3;
         this.var_3485 = param4;
         this.var_1109 = param5;
         this.var_4219 = !(this.var_3679 == this.var_1109 && this.var_3679 == this.var_3485);
         this.var_3745 = param2;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         var _loc2_:int = int(param1.var_2676);
         var _loc3_:Vector.<Number> = param1.var_3329;
         _loc3_[_loc2_ + 4] = 1;
         _loc3_[_loc2_ + 5] = 0;
         _loc3_[_loc2_ + 7] = 1;
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_10 = true;
         param1.var_3475 = true;
      }
      
      public function get method_5045() : class_2570
      {
         return this.var_2100;
      }
      
      public function set method_5045(param1:class_2570) : void
      {
         this.var_2100 = param1;
      }
      
      public function get method_6212() : Number
      {
         return this.var_3745;
      }
      
      public function set method_6212(param1:Number) : void
      {
         this.var_3745 = param1;
      }
      
      public function get method_2206() : Number
      {
         return this.var_3679;
      }
      
      public function set method_2206(param1:Number) : void
      {
         this.var_3679 = param1;
         var _loc2_:* = !(this.var_3679 == this.var_1109 && this.var_3679 == this.var_3485);
         if(this.var_4219 != _loc2_)
         {
            method_220();
            this.var_4219 = _loc2_;
         }
      }
      
      public function get method_3539() : Number
      {
         return this.var_3485;
      }
      
      public function set method_3539(param1:Number) : void
      {
         this.var_3485 = param1;
         var _loc2_:* = !(this.var_3679 == this.var_1109 && this.var_3679 == this.var_3485);
         if(this.var_4219 != _loc2_)
         {
            method_220();
            this.var_4219 = _loc2_;
         }
      }
      
      public function get method_4300() : Number
      {
         return this.var_1109;
      }
      
      public function set method_4300(param1:Number) : void
      {
         this.var_1109 = param1;
         var _loc2_:* = !(this.var_3679 == this.var_1109 && this.var_3679 == this.var_3485);
         if(this.var_4219 != _loc2_)
         {
            method_220();
            this.var_4219 = _loc2_;
         }
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:int = int(param1.var_2676);
         var _loc4_:Vector.<Number>;
         (_loc4_ = param1.var_3329)[_loc3_] = this.var_3679 + this.var_3745;
         if(this.var_4219)
         {
            _loc4_[_loc3_ + 1] = this.var_3485 + this.var_3745;
            _loc4_[_loc3_ + 2] = this.var_1109 + this.var_3745;
         }
         _loc4_[_loc3_ + 3] = this._alpha;
         param2.arcane::var_4582.setTextureAt(param1.var_2852,this.var_2100.method_6425(param2));
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc4_:class_2251 = param2.method_1853();
         var _loc5_:class_2251 = param2.method_1853();
         var _loc6_:String = "";
         var _loc7_:class_2251 = param2.method_3238();
         param1.var_2852 = _loc7_.index;
         param1.var_2676 = Number(_loc4_.index) * 4;
         _loc8_ = param2.method_4834();
         param2.method_4539(_loc8_,1);
         _loc9_ = param2.method_4834();
         param2.method_4539(_loc9_,1);
         _loc10_ = param2.method_4834();
         var _loc11_:class_2251 = var_1283.var_4238;
         var _loc12_:class_2251 = var_1283.var_3779;
         _loc6_ = (_loc6_ = (_loc6_ += "neg " + _loc11_ + ".xyz, " + _loc11_ + ".xyz\n") + ("dp3 " + _loc10_ + ".x, " + _loc11_ + ".xyz, " + _loc12_ + ".xyz\n" + "mul " + _loc10_ + ".w, " + _loc10_ + ".x, " + _loc10_ + ".x\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".x, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".x, " + _loc10_ + ".w\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "sqt " + _loc10_ + ".y, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".x, " + _loc4_ + ".x, " + _loc10_ + ".x\n" + "add " + _loc10_ + ".x, " + _loc10_ + ".x, " + _loc10_ + ".y\n" + "mul " + _loc10_ + ".xyz, " + _loc10_ + ".x, " + _loc12_ + ".xyz\n" + "mul " + _loc8_ + ", " + _loc4_ + ".x, " + _loc11_ + "\n" + "sub " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc10_ + ".xyz\n" + "nrm " + _loc8_ + ".xyz, " + _loc8_ + ".xyz\n")) + (method_3486(param1,_loc9_,_loc7_,this.var_2100,_loc8_) + "sub " + _loc9_ + ".w, " + _loc9_ + ".w, fc0.x\t\n" + "kil " + _loc9_ + ".w\n");
         if(this.var_4219)
         {
            _loc6_ = (_loc6_ = (_loc6_ = (_loc6_ += "dp3 " + _loc10_ + ".x, " + _loc11_ + ".xyz, " + _loc12_ + ".xyz\n" + "mul " + _loc10_ + ".w, " + _loc10_ + ".x, " + _loc10_ + ".x\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".y, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".y, " + _loc10_ + ".w\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "sqt " + _loc10_ + ".y, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".x, " + _loc4_ + ".y, " + _loc10_ + ".x\n" + "add " + _loc10_ + ".x, " + _loc10_ + ".x, " + _loc10_ + ".y\n" + "mul " + _loc10_ + ".xyz, " + _loc10_ + ".x, " + _loc12_ + ".xyz\n" + "mul " + _loc8_ + ", " + _loc4_ + ".y, " + _loc11_ + "\n" + "sub " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc10_ + ".xyz\n" + "nrm " + _loc8_ + ".xyz, " + _loc8_ + ".xyz\n") + (method_3486(param1,_loc10_,_loc7_,this.var_2100,_loc8_) + "mov " + _loc9_ + ".y, " + _loc10_ + ".y\n")) + ("dp3 " + _loc10_ + ".x, " + _loc11_ + ".xyz, " + _loc12_ + ".xyz\n" + "mul " + _loc10_ + ".w, " + _loc10_ + ".x, " + _loc10_ + ".x\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".z, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".w, " + _loc4_ + ".z, " + _loc10_ + ".w\n" + "sub " + _loc10_ + ".w, " + _loc5_ + ".x, " + _loc10_ + ".w\n" + "sqt " + _loc10_ + ".y, " + _loc10_ + ".w\n" + "mul " + _loc10_ + ".x, " + _loc4_ + ".z, " + _loc10_ + ".x\n" + "add " + _loc10_ + ".x, " + _loc10_ + ".x, " + _loc10_ + ".y\n" + "mul " + _loc10_ + ".xyz, " + _loc10_ + ".x, " + _loc12_ + ".xyz\n" + "mul " + _loc8_ + ", " + _loc4_ + ".z, " + _loc11_ + "\n" + "sub " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc10_ + ".xyz\n" + "nrm " + _loc8_ + ".xyz, " + _loc8_ + ".xyz\n")) + (method_3486(param1,_loc10_,_loc7_,this.var_2100,_loc8_) + "mov " + _loc9_ + ".z, " + _loc10_ + ".z\n");
         }
         param2.method_771(_loc8_);
         _loc6_ += "sub " + _loc9_ + ".xyz, " + _loc9_ + ".xyz, " + param3 + ".xyz\n" + "mul " + _loc9_ + ".xyz, " + _loc9_ + ".xyz, " + _loc4_ + ".w\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc9_ + ".xyz\n";
         param2.method_771(_loc9_);
         return _loc6_ + ("neg " + _loc11_ + ".xyz, " + _loc11_ + ".xyz\n");
      }
   }
}
