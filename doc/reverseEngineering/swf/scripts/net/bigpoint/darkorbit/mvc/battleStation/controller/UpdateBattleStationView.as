package net.bigpoint.darkorbit.mvc.battleStation.controller
{
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_883;
   import package_84.class_243;
   
   public class UpdateBattleStationView extends class_243
   {
       
      
      public function UpdateBattleStationView()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_883 = param1.getBody() as class_883;
         var _loc3_:BattleStation = name_47.map.method_327(_loc2_.name_115) as BattleStation;
         if(_loc3_)
         {
            _loc3_.updateVisuals(_loc2_.name_164,_loc2_.name_127);
         }
      }
   }
}
