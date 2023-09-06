package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_6.class_5;
   
   public class _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_skins_TeamDeathMatchLobbyWindowMatchoverviewSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_skins_TeamDeathMatchLobbyWindowMatchoverviewSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_5.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_skins_TeamDeathMatchLobbyWindowMatchoverviewSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("headerRenderer",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("headerColumnSeparator",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
