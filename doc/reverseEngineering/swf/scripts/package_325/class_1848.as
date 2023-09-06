package package_325
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_776;
   import package_396.TeamDeathMatchLobbywindowProxy;
   
   public class class_1848 extends SimpleCommand
   {
       
      
      public function class_1848()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_776 = param1.getBody() as class_776;
         var _loc3_:TeamDeathMatchLobbywindowProxy = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy;
         _loc3_.method_3535(_loc2_);
      }
   }
}
