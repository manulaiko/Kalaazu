package package_431
{
   import away3d.animators.class_2120;
   import away3d.animators.class_2579;
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_430.class_2746;
   
   public class class_2722 extends class_2406
   {
      
      arcane static const const_947:int = 0;
       
      
      arcane var var_2103:Vector3D;
      
      public function class_2722(param1:Vector3D = null)
      {
         super("ParticleBillboard",class_2578.name_100,0,4);
         var_4797 = class_2746;
         this.arcane::var_2103 = param1;
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc5_:* = null;
         param1 = param1;
         var _loc3_:class_2251 = param2.method_5384();
         param2.method_5487(this,arcane::const_947,_loc3_.index);
         param2.method_5384();
         param2.method_5384();
         param2.method_5384();
         var _loc4_:* = "m33 " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc3_ + "\n";
         for each(_loc5_ in param2.var_3853)
         {
            _loc4_ += "m33 " + _loc5_.method_3684 + _loc5_.index + ".xyz," + _loc5_ + "," + _loc3_ + "\n";
         }
         return _loc4_;
      }
      
      public function method_3412(param1:class_2120) : class_2746
      {
         return param1.method_3412(this) as class_2746;
      }
      
      override arcane function method_2127(param1:class_2579) : void
      {
         param1.var_3591 = true;
      }
   }
}
