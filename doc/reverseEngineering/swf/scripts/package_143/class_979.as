package package_143
{
   import flash.events.Event;
   
   public class class_979 extends Event
   {
      
      public static const const_1519:String = "sendMatchOverviewRequest";
      
      public static const const_935:String = "joinButtonClicked";
      
      public static const const_1817:String = "leaveButtonClicked";
      
      public static const const_3011:String = "matchoverviewSelectionChanged";
      
      public static const const_3289:String = "windowCreated";
       
      
      private var var_958:int;
      
      public function class_979(param1:String)
      {
         super(param1);
      }
      
      public function set name_93(param1:int) : void
      {
         this.var_958 = param1;
      }
      
      public function get name_93() : int
      {
         return this.var_958;
      }
   }
}
