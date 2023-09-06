package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import spark.skins.spark.ImageLoadingSkin;
   
   public class _spark_skins_spark_ImageLoadingSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _spark_skins_spark_ImageLoadingSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ImageLoadingSkin.watcherSetupUtil = new _spark_skins_spark_ImageLoadingSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("value",{"valueCommit":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
