package package_199
{
   import flash.events.Event;
   import package_386.class_2404;
   
   public class class_2453 extends Event
   {
      
      public static const const_786:String = "occur";
       
      
      private var var_3001:class_2404;
      
      public function class_2453(param1:String, param2:class_2404, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_3001 = param2;
      }
      
      public function get method_6196() : class_2404
      {
         return this.var_3001;
      }
   }
}
