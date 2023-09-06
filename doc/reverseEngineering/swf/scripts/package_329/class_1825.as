package package_329
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_80.QuestProxy;
   
   public class class_1825 extends SimpleCommand
   {
       
      
      public function class_1825()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:QuestProxy = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
         var _loc3_:Array = param1.getBody() as Array;
         var _loc4_:int = _loc3_[0] as int;
         _loc2_.method_1527(_loc4_);
      }
   }
}
