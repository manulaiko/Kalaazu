package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_153.class_1516;
   
   public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_accordion_TDMAccordionContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_accordion_TDMAccordionContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1516.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_accordion_TDMAccordionContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("_padding",{"propertyChange":true},[param4[4],param4[9]],param2);
         param5[6] = new PropertyWatcher("_rightText",{"propertyChange":true},[param4[7]],param2);
         param5[2] = new PropertyWatcher("_leftText",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("_bgcolor",{"propertyChange":true},[param4[0]],param2);
         param5[3].updateParent(param1);
         param5[6].updateParent(param1);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
