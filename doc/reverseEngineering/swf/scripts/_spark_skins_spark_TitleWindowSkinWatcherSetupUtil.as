package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import spark.skins.spark.TitleWindowSkin;
   
   public class _spark_skins_spark_TitleWindowSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _spark_skins_spark_TitleWindowSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TitleWindowSkin.watcherSetupUtil = new _spark_skins_spark_TitleWindowSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("topGroupMask",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("bottomGroupMask",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
