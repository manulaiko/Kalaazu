package package_329
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_80.QuestProxy;
   
   public class class_1832 extends SimpleCommand implements ICommand
   {
       
      
      public function class_1832()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         (facade.retrieveProxy(QuestProxy.NAME) as QuestProxy).method_4124();
      }
   }
}
