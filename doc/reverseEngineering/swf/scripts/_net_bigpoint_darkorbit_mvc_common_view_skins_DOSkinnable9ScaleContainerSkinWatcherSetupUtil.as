package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOSkinnable9ScaleContainerSkin;
   
   public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOSkinnable9ScaleContainerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOSkinnable9ScaleContainerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DOSkinnable9ScaleContainerSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOSkinnable9ScaleContainerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("bgBitmapData",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
