package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_166.class_1026;
   
   public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_ratings_components_RatingsViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_ratings_components_RatingsViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1026.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_ratings_components_RatingsViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_regenerationTooltipText",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}
