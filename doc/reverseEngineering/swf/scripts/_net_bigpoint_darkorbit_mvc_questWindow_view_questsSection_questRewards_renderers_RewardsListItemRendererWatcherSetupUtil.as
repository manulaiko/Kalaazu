package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_336.class_1897;
   
   public class _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1897.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("rewardData",{"dataChange":true},[param4[0],param4[1]],param2);
         param5[4] = new PropertyWatcher("amount",{"propertyChange":true},[param4[1]],null);
         param5[2] = new PropertyWatcher("lootId",{"propertyChange":true},[param4[0]],null);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[4]);
         param5[1].addChild(param5[2]);
      }
   }
}
