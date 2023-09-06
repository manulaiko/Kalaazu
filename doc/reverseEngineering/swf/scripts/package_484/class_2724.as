package package_484
{
   import flash.geom.Vector3D;
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2724 extends class_2594
   {
       
      
      private var var_4698:Number;
      
      private var var_2583:Number;
      
      private var var_169:Number;
      
      private var var_1985:Number;
      
      private var var_1587:Number;
      
      public function class_2724(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number)
      {
         super(param1);
         this.var_4698 = Math.pow(param2,3);
         this.var_2583 = Math.pow(param3,3);
         this.var_169 = param4;
         this.var_1985 = param5;
         this.var_1587 = param6;
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this.generateOneValue(param1.index,param1.total);
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         var _loc3_:Number = Math.random() * 0 * 2;
         var _loc4_:Number = Math.pow(Math.random() * (Number(this.var_2583) - Number(this.var_4698)) + this.var_4698,0.3333333333333333);
         var _loc5_:Vector3D;
         if((_loc5_ = new Vector3D(Math.random() - 0.5,Math.random() - 0.5,Math.random() - 0.5)).length == 0)
         {
            _loc5_.x = 1;
         }
         _loc5_.normalize();
         _loc5_.scaleBy(_loc4_);
         _loc5_.x += this.var_169;
         _loc5_.y += this.var_1985;
         _loc5_.z += this.var_1587;
         return _loc5_;
      }
   }
}
