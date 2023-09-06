package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;
   import net.bigpoint.darkorbit.mvc.battleStation.controller.CloseBuildingUIBubbleCommand;
   import net.bigpoint.darkorbit.mvc.battleStation.controller.OpenBuildingUIBubbleCommand;
   import net.bigpoint.darkorbit.mvc.battleStation.controller.UpdateBattleStationModuleView;
   import net.bigpoint.darkorbit.mvc.battleStation.controller.UpdateBattleStationView;
   import net.bigpoint.darkorbit.mvc.boosterstation.controller.BoosterStationEffectCommand;
   import net.bigpoint.darkorbit.mvc.boosterstation.notification.BoosterStationViewNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands.LoadMapAssetViewCommand;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoaderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MapAssetSystemStartup extends SimpleCommand
   {
       
      
      public function MapAssetSystemStartup()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         facade.registerCommand(MapAssetNotification.ATTACK_MAP_ASSET,MapAssetAttackCommand);
         facade.registerCommand(MapAssetNotification.TRY_TO_SELECT_MAPASSET,TryToSelectMapAssetCommand);
         facade.registerCommand(MapAssetNotification.MAP_ASSET_UPDATE_HP,MapAssetUpdateHp);
         facade.registerCommand(MapAssetNotification.MAP_ASSET_UPDATE_SHIELD,MapAssetUpdateShield);
         facade.registerCommand(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,LoadGraphicsForMapAssetCommand);
         facade.registerCommand(MapAssetNotification.LOAD_MAPASSET_VIEW,LoadMapAssetViewCommand);
         facade.registerCommand(MapAssetNotification.RETRY_LOAD,RetryLoadMapAssetGraphics);
         facade.registerCommand(BattleStationViewNotifications.UPDATE_BATTLESTATION_VIEW,UpdateBattleStationView);
         facade.registerCommand(BattleStationViewNotifications.UPDATE_BATTLESTATION_MODULE_VIEW,UpdateBattleStationModuleView);
         facade.registerCommand(BattleStationViewNotifications.OPEN_BUILDING_UI_BUBBLE,OpenBuildingUIBubbleCommand);
         facade.registerCommand(BattleStationViewNotifications.CLOSE_ALL_UI_BUBBLES_OF_ID,CloseBuildingUIBubbleCommand);
         facade.registerCommand(BoosterStationViewNotification.RING_EFFECT,BoosterStationEffectCommand);
         facade.registerProxy(new MapAssetLoaderProxy(new Dictionary()));
         facade.registerCommand(MapAssetNotification.CLEANUP,MapAssetProxyCleanUpCommand);
      }
   }
}
