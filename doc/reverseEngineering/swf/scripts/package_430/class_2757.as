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
   import package_431.class_2740;
   
   public class class_2757 extends class_2401
   {
       
      
      private var var_1848:class_2740;
      
      private var var_205:Vector3D;
      
      private var var_1674:Vector3D;
      
      public function class_2757(param1:class_2403, param2:class_2740)
      {
         super(param1,param2);
         this.var_1848 = param2;
         this.var_205 = this.var_1848.arcane::var_205;
         this.method_1165();
      }
      
      public function get acceleration() : Vector3D
      {
         return this.var_205;
      }
      
      public function set acceleration(param1:Vector3D) : void
      {
         this.var_205.x = param1.x;
         this.var_205.y = param1.y;
         this.var_205.z = param1.z;
         this.method_1165();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param2 = param2;
         param5 = param5;
         var _loc6_:int = int(param4.method_2879(var_3560,class_2740.arcane::const_2185));
         if(this.var_1848.mode == class_2578.name_24)
         {
            param3.method_748(_loc6_,this.var_1848.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
         }
         else
         {
            param4.method_5167(_loc6_,this.var_1674.x,this.var_1674.y,this.var_1674.z);
         }
      }
      
      private function method_1165() : void
      {
         if(this.var_1848.mode == class_2578.name_100)
         {
            this.var_1674 = new Vector3D(Number(this.var_205.x) / 2,Number(this.var_205.y) / 2,Number(this.var_205.z) / 2);
         }
      }
   }
}
