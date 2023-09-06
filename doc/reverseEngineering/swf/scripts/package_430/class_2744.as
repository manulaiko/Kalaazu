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
   import package_386.class_2578;
   import package_431.class_2719;
   
   public class class_2744 extends class_2401
   {
       
      
      private var var_2525:class_2719;
      
      private var var_219:Boolean;
      
      private var var_81:Boolean;
      
      private var var_1099:int;
      
      private var _numColumns:int;
      
      private var var_2462:int;
      
      private var var_872:Number;
      
      private var var_544:Number;
      
      private var var_2413:Vector.<Number>;
      
      public function class_2744(param1:class_2403, param2:class_2719)
      {
         super(param1,param2);
         this.var_2525 = param2;
         this.var_219 = this.var_2525.arcane::var_219;
         this.var_81 = this.var_2525.arcane::var_81;
         this.var_1099 = this.var_2525.arcane::var_1099;
         this._numColumns = this.var_2525.arcane::_numColumns;
         this.var_2462 = this.var_2525.arcane::var_2462;
         this.var_872 = this.var_2525.arcane::var_872;
         this.var_544 = this.var_2525.arcane::var_544;
         this.method_4910();
      }
      
      public function get cyclePhase() : Number
      {
         return this.var_544;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         this.var_544 = param1;
         this.method_4910();
      }
      
      public function get cycleDuration() : Number
      {
         return this.var_872;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         this.var_872 = param1;
         this.method_4910();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         var _loc6_:int = 0;
         if(param4.name_26)
         {
            param4.method_5167(param4.method_2879(var_3560,class_2719.arcane::const_1800),this.var_2413[0],this.var_2413[1],this.var_2413[2],this.var_2413[3]);
            if(this.var_219)
            {
               _loc6_ = int(param4.method_2879(var_3560,class_2719.arcane::const_3227));
               if(this.var_2525.mode == class_2578.name_24)
               {
                  if(this.var_81)
                  {
                     param3.method_748(_loc6_,this.var_2525.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
                  }
                  else
                  {
                     param3.method_748(_loc6_,this.var_2525.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_2);
                  }
               }
               else
               {
                  param4.method_5167(_loc6_,this.var_2413[4],this.var_2413[5]);
               }
            }
         }
      }
      
      private function method_4910() : void
      {
         this.var_2413 = new Vector.<Number>(8,true);
         var _loc1_:Number = Number(this.var_1099) / Number(this._numColumns);
         this.var_2413[0] = _loc1_;
         this.var_2413[1] = 1 / Number(this._numColumns);
         this.var_2413[2] = 1 / Number(this.var_2462);
         if(this.var_219)
         {
            if(this.var_872 <= 0)
            {
               throw new Error("the cycle duration must be greater than zero");
            }
            this.var_2413[4] = _loc1_ / Number(this.var_872);
            this.var_2413[5] = this.var_872;
            if(this.var_81)
            {
               this.var_2413[6] = this.var_544;
            }
         }
      }
   }
}
