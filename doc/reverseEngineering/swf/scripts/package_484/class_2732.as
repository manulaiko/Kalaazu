package package_484
{
   import flash.geom.Vector3D;
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2732 extends class_2594
   {
       
      
      private var var_1626:class_2594;
      
      private var var_179:class_2594;
      
      private var var_3117:class_2594;
      
      private var var_959:Boolean;
      
      public function class_2732(param1:String, param2:class_2594, param3:class_2594, param4:class_2594, param5:Boolean = false)
      {
         super(param1);
         this.var_1626 = param2;
         this.var_179 = param3;
         this.var_3117 = param4;
         this.var_959 = param5;
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this.generateOneValue(param1.index,param1.total);
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         var _loc3_:Number = Number(this.var_1626.generateOneValue(param1,param2));
         var _loc4_:Number = !!this.var_959 ? _loc3_ : Number(this.var_179.generateOneValue(param1,param2));
         var _loc5_:Number = !!this.var_959 ? _loc3_ : Number(this.var_3117.generateOneValue(param1,param2));
         return new Vector3D(_loc3_,_loc4_,_loc5_);
      }
      
      override public function method_5590(param1:class_2580) : void
      {
         if(this.var_1626)
         {
            this.var_1626.method_5590(param1);
         }
         if(this.var_179)
         {
            this.var_179.method_5590(param1);
         }
         if(this.var_3117)
         {
            this.var_3117.method_5590(param1);
         }
      }
      
      override public function method_3724(param1:class_2580) : void
      {
         if(this.var_1626)
         {
            this.var_1626.method_3724(param1);
         }
         if(this.var_179)
         {
            this.var_179.method_3724(param1);
         }
         if(this.var_3117)
         {
            this.var_3117.method_3724(param1);
         }
      }
   }
}
