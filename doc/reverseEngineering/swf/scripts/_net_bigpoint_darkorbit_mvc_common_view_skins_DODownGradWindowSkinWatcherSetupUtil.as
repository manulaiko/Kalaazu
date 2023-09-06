package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DODownGradWindowSkin;
   
   public class _net_bigpoint_darkorbit_mvc_common_view_skins_DODownGradWindowSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_common_view_skins_DODownGradWindowSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DODownGradWindowSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DODownGradWindowSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("scaleBitmapData",{"propertyChange":true},[param4[6]],param2);
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1],param4[7]],param2);
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],param2);
         param5[4] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[4],param4[5]],param2);
         param5[6] = new PropertyWatcher("minHeight",{"explicitMinHeightChanged":true},[param4[5]],null);
         param5[5] = new PropertyWatcher("minWidth",{"explicitMinWidthChanged":true},[param4[4]],null);
         param5[7].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[6]);
         param5[4].addChild(param5[5]);
      }
   }
}
