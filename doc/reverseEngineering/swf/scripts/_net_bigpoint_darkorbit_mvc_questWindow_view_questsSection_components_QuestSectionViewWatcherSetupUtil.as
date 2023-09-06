package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_145.class_983;
   
   public class _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_components_QuestSectionViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_components_QuestSectionViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_983.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_components_QuestSectionViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new FunctionReturnWatcher("getItem",target,function():Array
         {
            return ["label_questslots_free_p"];
         },null,[bindings[0]],null);
         watchers[0].updateParent(class_88);
      }
   }
}
