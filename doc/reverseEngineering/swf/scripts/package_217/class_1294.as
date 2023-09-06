package package_217
{
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;
   import package_163.BattleStationProxy;
   import package_37.class_170;
   import package_38.class_709;
   
   public class class_1294 extends class_170
   {
       
      
      public function class_1294()
      {
         super();
      }
      
      public static function run(param1:class_709) : void
      {
         var _loc2_:BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
         _loc2_.method_6053();
         class_170.var_271.sendNotification(BattleStationViewNotifications.CLOSE_ALL_UI_BUBBLES_OF_ID,param1.var_1529);
      }
   }
}
