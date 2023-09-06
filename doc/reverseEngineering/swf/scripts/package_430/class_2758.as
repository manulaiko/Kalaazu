package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_386.class_2578;
   import package_431.class_2741;
   
   public class class_2758 extends class_2401
   {
       
      
      private var var_2710:class_2741;
      
      private var var_2244:Boolean;
      
      private var var_219:Boolean;
      
      private var var_81:Boolean;
      
      private var var_126:Number;
      
      private var var_872:Number;
      
      private var var_544:Number;
      
      private var var_2551:Vector3D;
      
      private var var_3422:Vector3D;
      
      private var var_2540:Matrix3D;
      
      public function class_2758(param1:class_2403, param2:class_2741)
      {
         super(param1,param2);
         this.var_2710 = param2;
         this.var_2244 = this.var_2710.arcane::var_2244;
         this.var_219 = this.var_2710.arcane::var_219;
         this.var_81 = this.var_2710.arcane::var_81;
         this.var_2551 = this.var_2710.arcane::var_2551;
         this.var_126 = this.var_2710.arcane::var_126;
         this.var_872 = this.var_2710.arcane::var_872;
         this.var_544 = this.var_2710.arcane::var_544;
         this.method_3513();
      }
      
      public function get radius() : Number
      {
         return this.var_126;
      }
      
      public function set radius(param1:Number) : void
      {
         this.var_126 = param1;
         this.method_3513();
      }
      
      public function get cycleDuration() : Number
      {
         return this.var_872;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         this.var_872 = param1;
         this.method_3513();
      }
      
      public function get cyclePhase() : Number
      {
         return this.var_544;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         this.var_544 = param1;
         this.method_3513();
      }
      
      public function get eulers() : Vector3D
      {
         return this.var_2551;
      }
      
      public function set eulers(param1:Vector3D) : void
      {
         this.var_2551 = param1;
         this.method_3513();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         var _loc6_:int = int(param4.method_2879(var_3560,class_2741.arcane::const_2288));
         if(this.var_2710.mode == class_2578.name_24)
         {
            if(this.var_81)
            {
               param3.method_748(_loc6_,this.var_2710.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_4);
            }
            else
            {
               param3.method_748(_loc6_,this.var_2710.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
            }
         }
         else
         {
            param4.method_5167(_loc6_,this.var_3422.x,this.var_3422.y,this.var_3422.z,this.var_3422.w);
         }
         if(this.var_2244)
         {
            param4.method_1255(param4.method_2879(var_3560,class_2741.arcane::const_566),this.var_2540);
         }
      }
      
      private function method_3513() : void
      {
         if(this.var_2244)
         {
            this.var_2540 = new Matrix3D();
            this.var_2540.appendRotation(this.var_2551.x,Vector3D.X_AXIS);
            this.var_2540.appendRotation(this.var_2551.y,Vector3D.Y_AXIS);
            this.var_2540.appendRotation(this.var_2551.z,Vector3D.Z_AXIS);
         }
         if(this.var_2710.mode == class_2578.name_100)
         {
            this.var_3422 = new Vector3D(this.var_126,0,Number(this.var_126) * 0 * 2,Number(this.var_544) * 0 / 180);
            if(this.var_219)
            {
               if(this.var_872 <= 0)
               {
                  throw new Error("the cycle duration must be greater than zero");
               }
               this.var_3422.y = 0 / Number(this.var_872);
            }
            else
            {
               this.var_3422.y = 0;
            }
         }
      }
   }
}
