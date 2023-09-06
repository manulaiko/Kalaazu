package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_369.class_2116;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2631 extends class_2246
   {
       
      
      private var var_2350:class_2251;
      
      private var _gradient:class_2116;
      
      public function class_2631(param1:class_2116)
      {
         super();
         this._gradient = param1;
      }
      
      public function get gradient() : class_2116
      {
         return this._gradient;
      }
      
      public function set gradient(param1:class_2116) : void
      {
         if(param1.method_5818 != this._gradient.method_5818 || param1.format != this._gradient.format)
         {
            method_220();
         }
         this._gradient = param1;
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_2350 = null;
      }
      
      override arcane function method_1029(param1:class_2252, param2:class_2237) : String
      {
         var _loc3_:String = super.arcane::method_1029(param1,param2);
         var_3130 = true;
         if(param1.name_108 > 0)
         {
            this.var_2350 = param2.method_3238();
            param1.var_4217 = this.var_2350.index;
         }
         return _loc3_;
      }
      
      override arcane function method_4161(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2237) : String
      {
         var _loc6_:* = null;
         var _loc5_:String = "";
         if(var_3130)
         {
            _loc6_ = var_800;
         }
         else
         {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_,1);
         }
         _loc5_ += "dp3 " + _loc6_ + ".w, " + param2 + ".xyz, " + var_1283.var_3779 + ".xyz\n" + "mul " + _loc6_ + ".w, " + _loc6_ + ".w, " + var_1283.var_1569 + ".x\n" + "add " + _loc6_ + ".w, " + _loc6_ + ".w, " + var_1283.var_1569 + ".x\n" + "mul " + _loc6_ + ".xyz, " + _loc6_ + ".w, " + param2 + ".w\n";
         if(arcane::var_366 != null)
         {
            _loc5_ += arcane::var_366(param1,_loc6_,param4,var_1283);
         }
         _loc5_ += getTex2DSampleCode(param1,_loc6_,this.var_2350,this._gradient,_loc6_,"clamp") + "mul " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + param3 + ".xyz\n";
         if(!var_3130)
         {
            _loc5_ += "add " + var_800 + ".xyz, " + var_800 + ".xyz, " + _loc6_ + ".xyz\n";
            param4.method_771(_loc6_);
         }
         var_3130 = false;
         return _loc5_;
      }
      
      override protected function method_4878(param1:class_2252, param2:class_2237) : String
      {
         var _loc3_:class_2251 = param2.method_4834();
         return "mov " + _loc3_ + ", " + var_712 + ".wwww\n" + getTex2DSampleCode(param1,_loc3_,this.var_2350,this._gradient,_loc3_,"clamp") + "mul " + var_800 + ".xyz, " + var_800 + ", " + _loc3_ + "\n";
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         super.arcane::activate(param1,param2);
         param2.arcane::var_4582.setTextureAt(param1.var_4217,this._gradient.method_6425(param2));
      }
   }
}
