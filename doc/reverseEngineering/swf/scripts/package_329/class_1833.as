package package_329
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_80.QuestProxy;
   
   public class class_1833 extends SimpleCommand
   {
       
      
      public function class_1833()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.method_3605.refreshCurrentlySelectedQuestDetails();
      }
      
      private function get method_3605() : QuestProxy
      {
         return facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
      }
   }
}
