package package_493
{
   import flash.geom.Vector3D;
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2738 extends class_2594
   {
       
      
      private var var_4842:class_2594;
      
      private var var_520:class_2594;
      
      public function class_2738(param1:String, param2:class_2594, param3:class_2594)
      {
         super(param1);
         this.var_4842 = param2;
         this.var_520 = param3;
      }
      
      override public function method_5590(param1:class_2580) : void
      {
         this.var_4842.method_5590(param1);
         this.var_520.method_5590(param1);
      }
      
      override public function method_3724(param1:class_2580) : void
      {
         this.var_4842.method_3724(param1);
         this.var_520.method_3724(param1);
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this.generateOneValue(param1.index,param1.total);
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         var _loc3_:Vector3D = this.var_4842.generateOneValue(param1,param2);
         _loc3_.w = this.var_520.generateOneValue(param1,param2);
         return _loc3_;
      }
   }
}
