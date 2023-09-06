package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOCheckBoxSkin;
   
   public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOCheckBoxSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOCheckBoxSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DOCheckBoxSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOCheckBoxSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("unchecked",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("unchecked_hovered",{"propertyChange":true},[param4[3],param4[4]],param2);
         param5[3] = new PropertyWatcher("checked_hovered",{"propertyChange":true},[param4[7],param4[8]],param2);
         param5[0] = new PropertyWatcher("checked",{"propertyChange":true},[param4[0],param4[5],param4[6]],param2);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
