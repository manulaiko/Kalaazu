package package_460
{
   import package_459.class_2551;
   import package_459.class_2559;
   import package_478.class_2683;
   
   public class class_2560 implements class_2559
   {
       
      
      private var var_278:Vector.<class_2551>;
      
      public function class_2560()
      {
         super();
         this.var_278 = new Vector.<class_2551>();
      }
      
      public function method_1095() : class_2551
      {
         ++class_2683.var_4203;
         if(this.var_278.length)
         {
            return this.var_278.pop();
         }
         return new class_2552();
      }
      
      public function method_1122(param1:class_2551) : void
      {
         --class_2683.var_4203;
         if(param1 is class_2552)
         {
            param1.initialize();
            this.var_278.push(param1);
         }
      }
      
      public function method_1354() : void
      {
         this.var_278 = new Vector.<class_2551>();
      }
   }
}
