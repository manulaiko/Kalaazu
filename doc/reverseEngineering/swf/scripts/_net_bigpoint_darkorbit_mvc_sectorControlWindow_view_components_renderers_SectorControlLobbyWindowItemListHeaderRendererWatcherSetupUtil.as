package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_247.class_1903;
   
   public class _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_components_renderers_SectorControlLobbyWindowItemListHeaderRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_components_renderers_SectorControlLobbyWindowItemListHeaderRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1903.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_sectorControlWindow_view_components_renderers_SectorControlLobbyWindowItemListHeaderRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("headerText",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
