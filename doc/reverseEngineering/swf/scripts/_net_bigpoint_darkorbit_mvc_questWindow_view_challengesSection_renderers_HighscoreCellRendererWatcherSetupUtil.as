package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_12.class_49;
   
   public class _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreCellRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreCellRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_49.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreCellRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("column",{"columnChanged":true},[param4[0],param4[2]],param2);
         param5[5] = new PropertyWatcher("columnIndex",{"columnIndexChanged":true},[param4[2]],null);
         param5[3] = new PropertyWatcher("dataField",{"dataFieldChanged":true},[param4[0]],null);
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0],param4[1],param4[3]],param2);
         param5[4] = new PropertyWatcher("active",{"propertyChange":true},[param4[1]],null);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[5]);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[4]);
      }
   }
}
