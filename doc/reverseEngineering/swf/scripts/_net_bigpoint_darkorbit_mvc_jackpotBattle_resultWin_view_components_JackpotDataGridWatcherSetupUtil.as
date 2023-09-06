package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_168.class_1038;
   
   public class _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_components_JackpotDataGridWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_components_JackpotDataGridWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1038.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_components_JackpotDataGridWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_opponentHeadline",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("_heroHeadline",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("_statsHeadline",{"propertyChange":true},[param4[0]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
