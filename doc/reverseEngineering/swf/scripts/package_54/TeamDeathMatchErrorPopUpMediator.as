package package_54
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_311.TeamDeathMatchPopupNotifications;
   
   public class TeamDeathMatchErrorPopUpMediator extends class_1817
   {
      
      public static const NAME:String = "TeamDeathMatchErrorPopUpMediator";
       
      
      private var _title:String;
      
      private var _message:String;
      
      public function TeamDeathMatchErrorPopUpMediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         super.listNotificationInterests();
         return [TeamDeathMatchPopupNotifications.OPEN_LEVEL_TOO_LOW_POPUP,TeamDeathMatchPopupNotifications.OPEN_MATCH_ENDED_POPUP,TeamDeathMatchPopupNotifications.OPEN_NO_MATCH_FOR_FACTION_POPUP,TeamDeathMatchPopupNotifications.const_2004];
      }
      
      override protected function method_378() : void
      {
         super.method_378();
         var_3129[TeamDeathMatchPopupNotifications.OPEN_LEVEL_TOO_LOW_POPUP] = this.method_2165;
         var_3129[TeamDeathMatchPopupNotifications.OPEN_MATCH_ENDED_POPUP] = this.method_1783;
         var_3129[TeamDeathMatchPopupNotifications.OPEN_NO_MATCH_FOR_FACTION_POPUP] = this.method_2951;
         var_3129[TeamDeathMatchPopupNotifications.const_2004] = method_334;
      }
      
      private function method_2165(param1:INotification = null) : void
      {
         this._title = class_88.getItem("tdm_popup_level_too_low_title");
         this._message = class_88.getItem("tdm_popup_level_too_low_message");
         method_4135();
      }
      
      private function method_1783(param1:INotification = null) : void
      {
         this._title = class_88.getItem("tdm_popup_match_ended_title");
         this._message = class_88.getItem("tdm_popup_match_ended_message");
         method_4135();
      }
      
      private function method_2951(param1:INotification = null) : void
      {
         this._title = class_88.getItem("tdm_popup_no_match_for_faction_title");
         this._message = class_88.getItem("tdm_popup_no_match_for_faction_message");
         method_4135();
      }
      
      override protected function method_211() : void
      {
         popup = class_57.getInstance().createWindow(class_57.const_3139,class_57.const_2956) as class_149;
         var _loc1_:class_149 = popup as class_149;
         _loc1_.title = this._title;
         _loc1_.errorMessage = this._message;
      }
   }
}
