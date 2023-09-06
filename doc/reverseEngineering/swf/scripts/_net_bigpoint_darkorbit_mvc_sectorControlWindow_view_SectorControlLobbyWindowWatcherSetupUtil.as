package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.SectorControlLobbyWindow;
   
   public class _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_SectorControlLobbyWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_SectorControlLobbyWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SectorControlLobbyWindow.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_SectorControlLobbyWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("lobbyListCollection",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
