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
   import package_431.class_2731;
   
   public class class_2752 extends class_2401
   {
       
      
      private var var_49:class_2731;
      
      private var var_219:Boolean;
      
      private var var_81:Boolean;
      
      private var var_446:Number;
      
      private var var_1704:Number;
      
      private var var_872:Number;
      
      private var var_544:Number;
      
      private var var_924:Vector3D;
      
      public function class_2752(param1:class_2403, param2:class_2731)
      {
         super(param1,param2);
         this.var_49 = param2;
         this.var_219 = this.var_49.arcane::var_219;
         this.var_81 = this.var_49.arcane::var_81;
         this.var_446 = this.var_49.arcane::var_446;
         this.var_1704 = this.var_49.arcane::var_1704;
         this.var_872 = this.var_49.arcane::var_872;
         this.var_544 = this.var_49.arcane::var_544;
         this.method_2316();
      }
      
      public function get method_737() : Number
      {
         return this.var_446;
      }
      
      public function set method_737(param1:Number) : void
      {
         this.var_446 = param1;
         this.method_2316();
      }
      
      public function get maxScale() : Number
      {
         return this.var_1704;
      }
      
      public function set maxScale(param1:Number) : void
      {
         this.var_1704 = param1;
         this.method_2316();
      }
      
      public function get cycleDuration() : Number
      {
         return this.var_872;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         this.var_872 = param1;
         this.method_2316();
      }
      
      public function get cyclePhase() : Number
      {
         return this.var_544;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         this.var_544 = param1;
         this.method_2316();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         var _loc6_:int = int(param4.method_2879(var_3560,class_2731.arcane::const_641));
         if(this.var_49.mode == class_2578.name_24)
         {
            if(this.var_219)
            {
               if(this.var_81)
               {
                  param3.method_748(_loc6_,this.var_49.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_4);
               }
               else
               {
                  param3.method_748(_loc6_,this.var_49.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
               }
            }
            else
            {
               param3.method_748(_loc6_,this.var_49.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_2);
            }
         }
         else
         {
            param4.method_5167(_loc6_,this.var_924.x,this.var_924.y,this.var_924.z,this.var_924.w);
         }
      }
      
      private function method_2316() : void
      {
         if(this.var_49.mode == class_2578.name_100)
         {
            if(this.var_219)
            {
               if(this.var_872 <= 0)
               {
                  throw new Error("the cycle duration must be greater than zero");
               }
               this.var_924 = new Vector3D((this.var_446 + this.var_1704) / 2,Math.abs(Number(this.var_446) - Number(this.var_1704)) / 2,0 / Number(this.var_872),Number(this.var_544) * 0 / 180);
            }
            else
            {
               this.var_924 = new Vector3D(this.var_446,Number(this.var_1704) - Number(this.var_446),0,0);
            }
         }
      }
   }
}
