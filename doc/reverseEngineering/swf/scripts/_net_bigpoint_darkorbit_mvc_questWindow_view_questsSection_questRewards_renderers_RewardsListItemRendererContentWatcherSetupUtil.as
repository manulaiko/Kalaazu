package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_336.class_2288;
   
   public class _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_2288.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[4] = new PropertyWatcher("amount",{"propertyChange":true},[bindings[4]],propertyGetter);
         watchers[2] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["labelsPaddingTop"];
         },null,[bindings[2]],propertyGetter,true);
         watchers[1] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["rewardNameFontColor"];
         },null,[bindings[1]],propertyGetter,true);
         watchers[0] = new PropertyWatcher("rewardName",{"propertyChange":true},[bindings[0]],propertyGetter);
         watchers[6] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["labelsPaddingTop"];
         },null,[bindings[6]],propertyGetter,true);
         watchers[5] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["amountFontColor"];
         },null,[bindings[5]],propertyGetter,true);
         watchers[3] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["labelsPaddingBottom"];
         },null,[bindings[3]],propertyGetter,true);
         watchers[7] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["labelsPaddingBottom"];
         },null,[bindings[7]],propertyGetter,true);
         watchers[4].updateParent(target);
         watchers[2].updateParent(target);
         watchers[1].updateParent(target);
         watchers[0].updateParent(target);
         watchers[6].updateParent(target);
         watchers[5].updateParent(target);
         watchers[3].updateParent(target);
         watchers[7].updateParent(target);
      }
   }
}
