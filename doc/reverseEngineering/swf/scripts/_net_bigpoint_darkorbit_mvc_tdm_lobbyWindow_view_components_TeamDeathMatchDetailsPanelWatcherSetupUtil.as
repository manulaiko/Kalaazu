package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_144.class_981;
   
   public class _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_components_TeamDeathMatchDetailsPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_components_TeamDeathMatchDetailsPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_981.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_components_TeamDeathMatchDetailsPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("toolTipPoints",{"propertyChange":true},[param4[0],param4[6]],param2);
         param5[3] = new PropertyWatcher("toolTipPlayerAmount",{"propertyChange":true},[param4[3],param4[9]],param2);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
