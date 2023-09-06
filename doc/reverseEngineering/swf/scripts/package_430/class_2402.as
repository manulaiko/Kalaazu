package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.display3D.Context3DVertexBufferFormat;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_431.class_2577;
   
   public class class_2402 extends class_2401
   {
       
      
      private var var_1751:class_2577;
      
      public function class_2402(param1:class_2403, param2:class_2577)
      {
         super(param1,param2,true);
         this.var_1751 = param2;
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param3.method_748(param4.method_2879(var_3560,class_2577.arcane::const_2342),this.var_1751.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_4);
         var _loc6_:Number = Number(_time) / 1000;
         param4.method_5167(param4.method_2879(var_3560,class_2577.arcane::const_3056),_loc6_,_loc6_,_loc6_,_loc6_);
      }
      
      public function get method_2497() : class_2577
      {
         return this.var_1751;
      }
   }
}
