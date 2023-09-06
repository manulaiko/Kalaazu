package package_329
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_80.QuestProxy;
   
   public class class_1829 extends SimpleCommand
   {
       
      
      public function class_1829()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:QuestProxy = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
         var _loc3_:Array = param1.getBody() as Array;
         var _loc4_:int = _loc3_[0] as int;
         var _loc5_:int = _loc3_[1] as int;
         _loc2_.method_1313(_loc4_,_loc5_);
      }
   }
}
