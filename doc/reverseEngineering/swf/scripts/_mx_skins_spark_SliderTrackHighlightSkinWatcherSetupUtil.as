package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.skins.spark.SliderTrackHighlightSkin;
   
   public class _mx_skins_spark_SliderTrackHighlightSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _mx_skins_spark_SliderTrackHighlightSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SliderTrackHighlightSkin.watcherSetupUtil = new _mx_skins_spark_SliderTrackHighlightSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["accentColor"];
         },null,[bindings[0]],propertyGetter,true);
         watchers[0].updateParent(target);
      }
   }
}
