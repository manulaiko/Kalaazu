package package_448
{
   import net.bigpoint.darkorbit.net.class_227;
   import package_314.class_2258;
   
   public class class_2506
   {
       
      
      private var var_1585:Class;
      
      private var var_1330:class_227;
      
      private var var_4657:String;
      
      public function class_2506(param1:Class = null, param2:class_227 = null, param3:String = null)
      {
         this.var_1585 = class_2258;
         super();
         if(param1 != null)
         {
            this.var_1585 = param1;
         }
         this.var_1330 = param2;
         this.var_4657 = param3;
      }
      
      public function get command() : Class
      {
         return this.var_1585;
      }
      
      public function get method_3977() : class_227
      {
         return this.var_1330;
      }
      
      public function get method_5141() : String
      {
         return this.var_4657;
      }
   }
}
