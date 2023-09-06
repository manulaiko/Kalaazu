package package_331
{
   import net.bigpoint.darkorbit.mvc.tdm.lobbyWindow.TeamDeathMatchLobbywindowNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_311.TeamDeathMatchPopupNotifications;
   import package_396.TeamDeathMatchLobbywindowProxy;
   
   public class class_1837 extends SimpleCommand
   {
       
      
      public function class_1837()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:TeamDeathMatchLobbywindowProxy = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy;
         if(_loc2_.method_1454())
         {
            sendNotification(TeamDeathMatchLobbywindowNotifications.const_645);
         }
         else
         {
            sendNotification(TeamDeathMatchPopupNotifications.const_3102);
         }
      }
   }
}
