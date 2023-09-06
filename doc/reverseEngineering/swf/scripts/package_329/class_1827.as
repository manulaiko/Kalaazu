package package_329
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_80.QuestProxy;
   
   public class class_1827 extends SimpleCommand
   {
       
      
      public function class_1827()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:QuestProxy = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
         _loc2_.method_6477();
      }
   }
}
