package package_187
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_108.GroupProxy;
   import package_44.GroupSystemNotification;
   import package_68.class_1925;
   
   public class class_1663 extends SimpleCommand
   {
       
      
      public function class_1663()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         this.method_4604();
         this.method_4832();
      }
      
      private function method_4832() : void
      {
         if(!facade.hasCommand(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE))
         {
            facade.registerCommand(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE,class_1924);
         }
         if(!facade.hasCommand(GroupSystemNotification.UPDATE_MODEL_PING_STATE))
         {
            facade.registerCommand(GroupSystemNotification.UPDATE_MODEL_PING_STATE,class_1923);
         }
         if(!facade.hasCommand(GroupSystemNotification.CLEANUP))
         {
            facade.registerCommand(GroupSystemNotification.CLEANUP,class_1122);
         }
         if(!facade.hasCommand(GroupSystemNotification.UPDATE_GROUP_CHAT_STATE))
         {
            facade.registerCommand(GroupSystemNotification.UPDATE_GROUP_CHAT_STATE,class_1925);
         }
         if(!facade.hasCommand(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID))
         {
            facade.registerCommand(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID,class_1922);
         }
      }
      
      private function method_4604() : void
      {
         if(!facade.hasProxy(GroupProxy.NAME))
         {
            facade.registerProxy(new GroupProxy());
         }
      }
   }
}
