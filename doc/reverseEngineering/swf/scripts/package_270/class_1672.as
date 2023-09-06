package package_270
{
   import net.bigpoint.darkorbit.mvc.events.model.EventProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_132.class_382;
   import package_201.EventNotifications;
   import package_346.class_1965;
   import package_347.class_1966;
   
   public class class_1672 extends SimpleCommand
   {
       
      
      public function class_1672()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         facade.registerProxy(new EventProxy(new Vector.<class_382>()));
         facade.registerCommand(EventNotifications.ACTIVATE_EVENT,class_1962);
         facade.registerCommand(EventNotifications.ADD_EVENT,class_1963);
         facade.registerCommand(EventNotifications.CHRISTMAS_TREES,class_1966);
         facade.registerCommand(EventNotifications.MOOD_ASSETS,class_1965);
         facade.registerCommand(EventNotifications.MOOD_ASSETS_DESTRIBUTION,HandelMoodAssetsDestributionCommand);
         facade.registerCommand(EventNotifications.EXCHANGE_MAP,class_1967);
         facade.registerCommand(EventNotifications.DEMOLISHED_HQ,class_1964);
         facade.registerCommand(EventNotifications.EVENT_DOMINATION_FACTION,class_1968);
         facade.registerCommand(EventNotifications.APRILS_FOOLS,class_1961);
      }
   }
}
