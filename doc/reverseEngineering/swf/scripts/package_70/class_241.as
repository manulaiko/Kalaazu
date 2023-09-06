package package_70
{
   import flash.events.Event;
   
   public class class_241 extends Event
   {
      
      public static const const_1530:String = "unselectTab";
       
      
      private var var_1598:int;
      
      private var var_955:Boolean = true;
      
      public function class_241(param1:String, param2:int, param3:Boolean)
      {
         super(param1,true);
         this.var_1598 = param2;
         this.var_955 = param3;
      }
      
      public function get method_4444() : int
      {
         return this.var_1598;
      }
      
      public function get method_6030() : Boolean
      {
         return this.var_955;
      }
   }
}
