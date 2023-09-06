package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOWindowSkin;
   
   public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOWindowSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOWindowSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DOWindowSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOWindowSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("scaleBitmapData",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1],param4[4],param4[6]],param2);
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0],param4[3],param4[5],param4[8]],param2);
         param5[3] = new PropertyWatcher("_headerHeight",{"propertyChange":true},[param4[7]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
