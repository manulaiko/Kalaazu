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
   import package_431.class_2725;
   
   public class class_2748 extends class_2401
   {
       
      
      private var var_39:class_2725;
      
      private var var_3304:Vector3D;
      
      private var var_4565:Vector3D;
      
      public function class_2748(param1:class_2403, param2:class_2725)
      {
         super(param1,param2);
         this.var_39 = param2;
         this.var_3304 = this.var_39.arcane::var_3304;
         this.method_536();
      }
      
      public function get oscillator() : Vector3D
      {
         return this.var_3304;
      }
      
      public function set oscillator(param1:Vector3D) : void
      {
         this.var_3304 = param1;
         this.method_536();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         var _loc6_:int = int(param4.method_2879(var_3560,class_2725.arcane::const_2467));
         if(this.var_39.mode == class_2578.name_24)
         {
            param3.method_748(_loc6_,this.var_39.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_4);
         }
         else
         {
            param4.method_5167(_loc6_,this.var_4565.x,this.var_4565.y,this.var_4565.z,this.var_4565.w);
         }
      }
      
      private function method_536() : void
      {
         if(this.var_39.mode == class_2578.name_100)
         {
            if(this.var_3304.w <= 0)
            {
               throw new Error("the cycle duration must greater than zero");
            }
            this.var_4565 = this.var_4565 || new Vector3D();
            this.var_4565.x = this.var_3304.x;
            this.var_4565.y = this.var_3304.y;
            this.var_4565.z = this.var_3304.z;
            this.var_4565.w = 0 / Number(this.var_3304.w);
         }
      }
   }
}
