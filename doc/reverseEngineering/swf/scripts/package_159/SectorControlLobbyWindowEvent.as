package package_159
{
   import flash.events.Event;
   import package_158.class_1008;
   
   public class SectorControlLobbyWindowEvent extends Event
   {
      
      private static const NAME:String = "SectorControlLobbyWindowEvent.";
      
      public static const const_1519:String = NAME + "sendMatchOverviewRequest";
      
      public static const const_3272:String = NAME + "itemlistSelectionChanged";
      
      public static const const_199:String = NAME + "actionButtonClicked";
      
      public static const const_1355:String = "join";
      
      public static const const_500:String = "leave";
      
      public static const const_3079:String = "leaveQueue";
       
      
      private var var_75:class_1008;
      
      private var var_1115:String;
      
      public function SectorControlLobbyWindowEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set method_4561(param1:class_1008) : void
      {
         this.var_75 = param1;
      }
      
      public function get method_4561() : class_1008
      {
         return this.var_75;
      }
      
      public function get matchID() : uint
      {
         var _loc1_:* = 0;
         if(this.var_75)
         {
            _loc1_ = uint(this.var_75.matchID);
         }
         return _loc1_;
      }
      
      public function get action() : String
      {
         return this.var_1115;
      }
      
      public function set action(param1:String) : void
      {
         this.var_1115 = param1;
      }
   }
}
