package package_329
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_65.class_203;
   import package_80.QuestProxy;
   
   public class class_1824 extends SimpleCommand
   {
       
      
      public function class_1824()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:QuestProxy = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
         var _loc3_:class_203 = param1.getBody() as class_203;
         _loc2_.method_225(_loc3_);
      }
   }
}
