package package_187
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_108.GroupProxy;
   import package_44.GroupSystemNotification;
   import package_63.ChatNotifications;
   
   public class class_1122 extends SimpleCommand
   {
       
      
      public function class_1122()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:GroupProxy = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
         if(_loc2_)
         {
            _loc2_.cleanup();
         }
         sendNotification(GroupSystemNotification.CLEANUP_UI);
         if(Boolean(param1.getBody()))
         {
            sendNotification(ChatNotifications.const_2630);
         }
      }
   }
}
