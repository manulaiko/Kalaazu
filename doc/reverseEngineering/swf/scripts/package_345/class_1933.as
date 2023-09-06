package package_345
{
   import flash.events.Event;
   
   public class class_1933 extends Event
   {
      
      public static const ACCEPT:String = "ACCEPT";
      
      public static const REVOKE:String = "REVOKE";
      
      public static const REJECT:String = "REJECT";
      
      public static const INVITE:String = "INVITE";
       
      
      private var var_3929:int;
      
      private var var_5044:String;
      
      public function class_1933(param1:String, param2:int = 0, param3:String = null)
      {
         this.var_5044 = param3;
         super(param1);
         this.var_3929 = param2;
      }
      
      public function get method_926() : int
      {
         return this.var_3929;
      }
      
      public function get name_82() : String
      {
         return this.var_5044;
      }
   }
}
