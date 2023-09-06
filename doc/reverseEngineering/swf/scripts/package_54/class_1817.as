package package_54
{
   import flash.events.Event;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import net.bigpoint.darkorbit.mvc.tdm.lobbyWindow.TeamDeathMatchLobbywindowNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class class_1817 extends Mediator
   {
       
      
      protected var var_3129:Dictionary;
      
      public function class_1817(param1:String)
      {
         super(param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         this.method_378();
         return super.listNotificationInterests();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:String = param1.getName();
         var _loc3_:Function = this.var_3129[_loc2_];
         if(_loc3_ != null)
         {
            _loc3_(param1);
         }
      }
      
      protected function method_378() : void
      {
         this.var_3129 = new Dictionary();
      }
      
      protected function method_4135(param1:INotification = null) : void
      {
         sendNotification(TeamDeathMatchLobbywindowNotifications.SET_UI_INTERACTIVITY,false);
         this.method_211();
         this.popup.addEventListener(Event.CLOSE,this.method_446);
      }
      
      protected function method_211() : void
      {
      }
      
      protected function method_334(param1:INotification = null) : void
      {
         this.method_1386();
         this.method_2956();
      }
      
      protected function method_2956() : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      protected function method_1386() : void
      {
         sendNotification(TeamDeathMatchLobbywindowNotifications.SET_UI_INTERACTIVITY,true);
         this.popup.removeEventListener(Event.CLOSE,this.method_446);
      }
      
      protected function method_446(param1:Event) : void
      {
         this.method_1386();
      }
      
      protected function get popup() : DOPopUp
      {
         return viewComponent as DOPopUp;
      }
      
      protected function set popup(param1:DOPopUp) : void
      {
         viewComponent = param1;
      }
   }
}
