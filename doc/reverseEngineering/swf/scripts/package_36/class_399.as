package package_36
{
   import net.bigpoint.darkorbit.class_126;
   import package_29.class_85;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_399 extends class_348
   {
       
      
      private var var_382:Boolean;
      
      private var var_1955:Boolean;
      
      public function class_399(param1:class_85, param2:Boolean, param3:Boolean = false)
      {
         super(class_338.EMP,param1,const_925,null,class_126.const_1571);
         this.var_382 = param2;
         this.var_1955 = param3;
      }
      
      public function get method_942() : Boolean
      {
         return this.var_382;
      }
      
      public function get method_4989() : Boolean
      {
         return this.var_1955;
      }
      
      override public function get method_5314() : Boolean
      {
         return true;
      }
   }
}
