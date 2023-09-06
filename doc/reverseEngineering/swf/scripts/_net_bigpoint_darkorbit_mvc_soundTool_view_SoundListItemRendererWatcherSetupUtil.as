package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import package_57.class_1005;
   
   public class _net_bigpoint_darkorbit_mvc_soundTool_view_SoundListItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_soundTool_view_SoundListItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         class_1005.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_soundTool_view_SoundListItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("pattern",{"dataChange":true},[param4[0],param4[1],param4[4]],param2);
         param5[2] = new PropertyWatcher("resKeyList",null,[param4[1]],null);
         param5[1] = new PropertyWatcher("soundbank",null,[param4[0]],null);
         param5[3] = new PropertyWatcher("hSlider",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[1]);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[4]);
      }
   }
}
