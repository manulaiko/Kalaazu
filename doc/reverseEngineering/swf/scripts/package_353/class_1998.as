package package_353
{
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   
   public class class_1998 extends AsyncCommand
   {
       
      
      public function class_1998()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(GuiNotifications.SHOW_CONNECTION_WINDOW);
         var _loc2_:ConnectionProxy = facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
         _loc2_.connectToMap(Settings.mapID);
         commandComplete();
      }
   }
}
