package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_61.JackpotArenaMatchResultWindow;
   
   public class _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_JackpotArenaMatchResultWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_JackpotArenaMatchResultWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         JackpotArenaMatchResultWindow.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_JackpotArenaMatchResultWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("_headerImage",{"propertyChange":true},[param4[4]],param2);
         param5[2] = new PropertyWatcher("headerPic",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[4] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],null);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[2]],null);
         param5[13] = new PropertyWatcher("_hint",{"propertyChange":true},[param4[17]],param2);
         param5[5].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[4]);
         param5[2].addChild(param5[3]);
         param5[13].updateParent(param1);
      }
   }
}
