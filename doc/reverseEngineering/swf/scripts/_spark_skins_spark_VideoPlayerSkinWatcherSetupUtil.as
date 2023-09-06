package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import spark.skins.spark.VideoPlayerSkin;
   
   public class _spark_skins_spark_VideoPlayerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _spark_skins_spark_VideoPlayerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VideoPlayerSkin.watcherSetupUtil = new _spark_skins_spark_VideoPlayerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("clippedGroup",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("height",{"heightChanged":true},[param4[0]],null);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}
