package package_345
{
   import flash.events.Event;
   import package_139.class_1156;
   
   public class class_1931 extends Event
   {
      
      public static const TOGGLE_PING_MODE_BUTTON_CLICKED:String = "TOGGLE_PING_MODE_BUTTON_CLICKED";
      
      public static const TRY_TO_SELECT_MAPASSET:String = "TRY_TO_SELECT_MAPASSET";
      
      public static const KICK_MEMBER:String = "KICK_MEMBER";
      
      public static const FLY_TO_MEMBER:String = "FLY_TO_MEMBER";
      
      public static const CHANGE_LEADER:String = "CHANGE_LEADER";
      
      public static const LEAVE_GROUP:String = "LEAVE_GROUP";
      
      public static const INVITATION_BLOCK_TOGGLE:String = "INVITATION_BLOCK_TOGGLE";
      
      public static const PING_MEMBER:String = "PING_MEMBER";
      
      public static const BLOCK_KEYBOARD:String = "BLOCK_KEYBOARD";
      
      public static const UNBLOCK_KEYBOARD:String = "UNBLOCK_KEYBOARD";
       
      
      private var var_407:class_1156;
      
      private var _mode:int;
      
      public function class_1931(param1:String, param2:class_1156 = null, param3:Boolean = false, param4:Boolean = false)
      {
         this._mode = this.mode;
         this.var_407 = param2;
         super(param1,param3,param4);
      }
      
      public function get method_4995() : class_1156
      {
         return this.var_407;
      }
      
      public function get mode() : int
      {
         return this._mode;
      }
   }
}
