package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import package_52.class_143;
   
   public class _net_bigpoint_darkorbit_mvc_countdownStatus_view_CountdownStatusWindowViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_countdownStatus_view_CountdownStatusWindowViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_143.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_countdownStatus_view_CountdownStatusWindowViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
