package package_217
{
   import package_163.BattleStationProxy;
   import package_37.class_170;
   import package_38.class_683;
   
   public class class_1257 extends class_170
   {
       
      
      public function class_1257()
      {
         super();
      }
      
      public static function run(param1:class_683) : void
      {
         var _loc2_:BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
         _loc2_.method_5530(param1.type);
      }
   }
}
