package package_273
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_163.BattleStationProxy;
   
   public class class_1983 extends SimpleCommand
   {
       
      
      public function class_1983()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:BattleStationProxy = facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
         var _loc3_:Array = param1.getBody() as Array;
         _loc2_.method_5603(_loc3_);
      }
   }
}
