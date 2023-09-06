package package_403
{
   import flash.events.Event;
   
   public class class_2292 extends Event
   {
      
      public static const SW_CREATED:String = "SW_CREATED";
      
      public static const INVITE_CLICKED:String = "INVITE_CLICKED";
      
      public static const REMOVE_CLICKED:String = "REMOVE_CLICKED";
      
      public static const BLOCK_CLICKED:String = "BLOCK_CLICKED";
      
      public static const INVITE_TO_GROUP_CLICKED:String = "INVITE_TO_GROUP_CLICKED";
      
      public static const UNBLOCK_USER_CLICKED:String = "UNBLOCK_USER_CLICKED";
      
      public static const REMOVE_OUTGOING_REQUEST_CLICKED:String = "REMOVE_OUTGOING_REQUEST_CLICKED";
      
      public static const ACCEPT_PENDING_REQUEST_CLICKED:String = "ACCEPT_PENDING_REQUEST_CLICKED";
      
      public static const DECLINE_PENDING_REQUEST_CLICKED:String = "DECLINE_PENDING_REQUEST_CLICKED";
      
      public static const FILTER_CHECKBOX_STATE_CHANGED:String = "FILTER_CHECKBOX_STATE_CHANGED";
      
      public static const CONTACTS_CHECKBOX:String = "CONTACTS_CHECKBOX";
      
      public static const CLANMEMBERS_CHECKBOX:String = "CLANMEMBERS_CHECKBOX";
      
      public static const REQUESTS_CHECKBOX:String = "REQUESTS_CHECKBOX";
      
      public static const BLACKLISTED_CHECKBOX:String = "BLACKLISTED_CHECKBOX";
      
      public static const BLOCK_NOTIFICATIONS_CHECKBOX_STATE_CHANGED:String = "BLOCK_NOTIFICATIONS_CHECKBOX_STATE_CHANGED";
      
      public static const USERNAME_INPUTFIELD_GAINED_FOCUS:String = "USERNAME_INPUTFIELD_GAINED_FOCUS";
      
      public static const USERNAME_INPUTFIELD_LOST_FOCUS:String = "USERNAME_INPUTFIELD_LOST_FOCUS";
      
      public static const CONTACT_CLICKED:String = "CONTACT_CLICKED";
       
      
      public var params:Array;
      
      public function class_2292(param1:String, param2:Array = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.params = [];
         super(param1,param3,param4);
         if(param2)
         {
            this.params = param2;
         }
      }
   }
}
