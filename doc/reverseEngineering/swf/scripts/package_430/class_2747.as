package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_386.class_2578;
   import package_431.class_2723;
   
   public class class_2747 extends class_2401
   {
       
      
      private var var_3211:class_2723;
      
      private var var_2734:Vector3D;
      
      private var var_4328:Vector3D;
      
      public function class_2747(param1:class_2403, param2:class_2723)
      {
         super(param1,param2);
         this.var_3211 = param2;
         this.var_2734 = this.var_3211.arcane::var_2734;
         this.var_4328 = this.var_3211.arcane::var_4328;
      }
      
      public function get method_2235() : Vector3D
      {
         return this.var_2734;
      }
      
      public function set method_2235(param1:Vector3D) : void
      {
         this.var_2734 = param1;
      }
      
      public function get method_3375() : Vector3D
      {
         return this.var_4328;
      }
      
      public function set method_3375(param1:Vector3D) : void
      {
         this.var_4328 = param1;
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param2 = param2;
         param5 = param5;
         var _loc6_:int = int(param4.method_2879(var_3560,class_2723.arcane::const_296));
         var _loc7_:int = int(param4.method_2879(var_3560,class_2723.arcane::const_2188));
         if(this.var_3211.mode == class_2578.name_24)
         {
            param3.method_748(_loc6_,this.var_3211.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
            param3.method_748(_loc7_,this.var_3211.arcane::var_4676 + 3,param1,Context3DVertexBufferFormat.FLOAT_3);
         }
         else
         {
            param4.method_5167(_loc6_,this.var_2734.x,this.var_2734.y,this.var_2734.z);
            param4.method_5167(_loc7_,this.var_4328.x,this.var_4328.y,this.var_4328.z);
         }
      }
   }
}
