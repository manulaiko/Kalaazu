package package_36
{
   import package_29.class_85;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1819 extends class_348
   {
       
      
      private var var_1553:String;
      
      public function class_1819(param1:class_85, param2:String)
      {
         super(class_338.DAMAGE,param1,const_925);
         this.var_1553 = param2;
      }
      
      public function get method_938() : String
      {
         return this.var_1553;
      }
      
      override public function get method_5314() : Boolean
      {
         return true;
      }
   }
}
