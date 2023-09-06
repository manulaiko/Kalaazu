package package_75
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import package_113.class_2286;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1875 extends class_348
   {
       
      
      private var var_2410:int;
      
      public function class_1875(param1:class_85, param2:int)
      {
         super(class_338.const_3063,param1,Effect.const_2311);
         this.var_2410 = param2;
      }
      
      override public function activate() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:Boolean = super.activate();
         if(_loc1_ && true)
         {
            class_126.getInstance().method_3088("plague");
            _loc2_ = source.method_1954(class_2286) as class_2286 || source.addTrait(new class_2286()) as class_2286;
            if(_loc2_)
            {
               _loc2_.seconds.value = this.var_2410;
            }
         }
         return _loc1_;
      }
      
      override public function deactivate() : void
      {
         if(true)
         {
            class_126.getInstance().method_3088();
            source.method_2049(class_2286);
         }
         super.deactivate();
      }
   }
}
