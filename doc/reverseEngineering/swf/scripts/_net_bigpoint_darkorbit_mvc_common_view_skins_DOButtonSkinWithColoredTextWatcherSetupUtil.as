package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonSkinWithColoredText;
   
   public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOButtonSkinWithColoredTextWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOButtonSkinWithColoredTextWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DOButtonSkinWithColoredText.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOButtonSkinWithColoredTextWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("over",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("normal",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("down",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("disabled",{"propertyChange":true},[param4[3]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
