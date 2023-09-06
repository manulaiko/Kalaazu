package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import spark.skins.spark.mediaClasses.fullScreen.DataTipClass;
   
   public class _spark_skins_spark_mediaClasses_fullScreen_DataTipClassWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _spark_skins_spark_mediaClasses_fullScreen_DataTipClassWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DataTipClass.watcherSetupUtil = new _spark_skins_spark_mediaClasses_fullScreen_DataTipClassWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
