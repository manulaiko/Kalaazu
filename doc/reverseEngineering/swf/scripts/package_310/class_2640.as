package package_310
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import package_198.class_1208;
   import package_369.class_2116;
   import package_369.class_2570;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2640 extends class_1780
   {
       
      
      private var var_302:class_2570;
      
      private var var_2828:Number = 5;
      
      private var var_1190:Number = 0;
      
      private var _alpha:Number;
      
      private var _mask:class_2116;
      
      public function class_2640(param1:class_2570, param2:Number = 1)
      {
         super();
         this.var_302 = param1;
         this._alpha = param2;
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_10 = true;
         param1.var_3475 = true;
         param1.var_3859 = this._mask != null;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         param1.var_3329[param1.var_2676 + 3] = 1;
      }
      
      public function get mask() : class_2116
      {
         return this._mask;
      }
      
      public function set mask(param1:class_2116) : void
      {
         if(Boolean(param1) != Boolean(this._mask) || param1 && this._mask && (param1.method_5818 != this._mask.method_5818 || param1.format != this._mask.format))
         {
            method_220();
         }
         this._mask = param1;
      }
      
      public function get fresnelPower() : Number
      {
         return this.var_2828;
      }
      
      public function set fresnelPower(param1:Number) : void
      {
         this.var_2828 = param1;
      }
      
      public function get method_5045() : class_2570
      {
         return this.var_302;
      }
      
      public function set method_5045(param1:class_2570) : void
      {
         this.var_302 = param1;
      }
      
      override public function dispose() : void
      {
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
      }
      
      public function get normalReflectance() : Number
      {
         return this.var_1190;
      }
      
      public function set normalReflectance(param1:Number) : void
      {
         this.var_1190 = param1;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:Vector.<Number> = param1.var_3329;
         var _loc4_:int = int(param1.var_2676);
         var _loc5_:Context3D = param2.arcane::var_4582;
         _loc3_[_loc4_] = this._alpha;
         _loc3_[_loc4_ + 1] = this.var_1190;
         _loc3_[_loc4_ + 2] = this.var_2828;
         _loc5_.setTextureAt(param1.var_2852,this.var_302.method_6425(param2));
         if(this._mask)
         {
            _loc5_.setTextureAt(param1.var_2852 + 1,this._mask.method_6425(param2));
         }
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc11_:* = null;
         var _loc4_:class_2251 = param2.method_1853();
         var _loc5_:class_2251 = param2.method_4834();
         var _loc6_:String = "";
         var _loc7_:class_2251 = param2.method_3238();
         var _loc8_:class_2251 = var_1283.var_4238;
         var _loc9_:class_2251 = var_1283.var_3779;
         param1.var_2852 = _loc7_.index;
         param1.var_2676 = Number(_loc4_.index) * 4;
         param2.method_4539(_loc5_,1);
         var _loc10_:class_2251 = param2.method_4834();
         _loc6_ = (_loc6_ += "dp3 " + _loc5_ + ".w, " + _loc8_ + ".xyz, " + _loc9_ + ".xyz\t\t\n" + "add " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc5_ + ".w\t\t\t\t\t\t\t\t\t\t\t\n" + "mul " + _loc5_ + ".xyz, " + _loc9_ + ".xyz, " + _loc5_ + ".w\t\t\t\t\t\t\n" + "sub " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + _loc8_ + ".xyz\t\t\t\t\t\n" + method_3486(param1,_loc5_,_loc7_,this.var_302,_loc5_) + "sub " + _loc10_ + ".w, " + _loc5_ + ".w, fc0.x\t\t\t\t\t\t\t\t\t\n" + "kil " + _loc10_ + ".w\n" + "sub " + _loc5_ + ", " + _loc5_ + ", " + param3 + "\t\t\t\t\t\t\t\t\t\t\t\n") + ("dp3 " + _loc8_ + ".w, " + _loc8_ + ".xyz, " + _loc9_ + ".xyz\n" + "sub " + _loc8_ + ".w, " + _loc4_ + ".w, " + _loc8_ + ".w\n" + "pow " + _loc8_ + ".w, " + _loc8_ + ".w, " + _loc4_ + ".z\n" + "sub " + _loc9_ + ".w, " + _loc4_ + ".w, " + _loc8_ + ".w\n" + "mul " + _loc9_ + ".w, " + _loc4_ + ".y, " + _loc9_ + ".w\n" + "add " + _loc8_ + ".w, " + _loc8_ + ".w, " + _loc9_ + ".w\n" + "mul " + _loc8_ + ".w, " + _loc4_ + ".x, " + _loc8_ + ".w\n");
         if(this._mask)
         {
            _loc11_ = param2.method_3238();
            _loc6_ += getTex2DSampleCode(param1,_loc10_,_loc11_,this._mask,var_1283.var_443) + "mul " + _loc8_ + ".w, " + _loc10_ + ".x, " + _loc8_ + ".w\n";
         }
         _loc6_ += "mul " + _loc5_ + ", " + _loc5_ + ", " + _loc8_ + ".w\t\t\t\t\t\t\n" + "add " + param3 + ", " + param3 + ", " + _loc5_ + "\t\t\t\t\t\t\n";
         param2.method_771(_loc5_);
         return _loc6_;
      }
   }
}
