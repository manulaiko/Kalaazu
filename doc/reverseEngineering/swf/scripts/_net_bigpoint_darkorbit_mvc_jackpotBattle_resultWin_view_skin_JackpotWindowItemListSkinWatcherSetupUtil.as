package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_5.class_4;
   
   public class _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_4.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinWatcherSetupUtil();
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
