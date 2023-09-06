package package_273
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_163.BattleStationProxy;
   
   public class class_1976 extends SimpleCommand
   {
       
      
      public function class_1976()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:BattleStationProxy = facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
         _loc2_.method_2747();
      }
   }
}
