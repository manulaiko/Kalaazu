package package_217
{
   import package_163.BattleStationProxy;
   import package_163.class_1841;
   import package_37.class_170;
   import package_38.class_831;
   
   public class class_1404 extends class_170
   {
       
      
      public function class_1404()
      {
         super();
      }
      
      public static function run(param1:class_831) : void
      {
         var _loc2_:BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
         var _loc3_:class_1841 = new class_1841(param1.name_159,param1.slotId,param1.currentHitpoints,param1.maxHitpoints,param1.currentShield,param1.maxShield,param1.emergencyRepairSecondsLeft,param1.emergencyRepairSecondsTotal,param1.installationSecondsLeft);
         _loc2_.method_4687(_loc3_);
      }
   }
}
