package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_369.class_2570;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2632 extends class_2239
   {
       
      
      private var var_302:class_2570;
      
      public function class_2632(param1:class_2570)
      {
         super();
         this.var_302 = param1;
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         super.arcane::initVO(param1);
         param1.var_10 = true;
      }
      
      override public function dispose() : void
      {
      }
      
      public function get method_5045() : class_2570
      {
         return this.var_302;
      }
      
      public function set method_5045(param1:class_2570) : void
      {
         this.var_302 = param1;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         super.arcane::activate(param1,param2);
         param2.arcane::var_4582.setTextureAt(param1.var_2852,this.var_302.method_6425(param2));
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:String = "";
         var _loc5_:class_2251 = param2.method_3238();
         param1.var_2852 = _loc5_.index;
         _loc4_ += method_3486(param1,param3,_loc5_,this.var_302,var_1283.var_3779);
         var_3318 = param2.method_1853();
         param1.var_2676 = var_3318.index;
         return _loc4_ + ("add " + param3 + ".xyz, " + param3 + ".xyz, " + var_3318 + ".xyz\n");
      }
   }
}
