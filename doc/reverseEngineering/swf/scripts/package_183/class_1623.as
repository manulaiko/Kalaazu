package package_183
{
   import com.bigpoint.utils.class_968;
   import flash.display.BitmapData;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import package_17.class_62;
   import package_38.class_117;
   
   public class class_1623 extends Condition
   {
       
      
      public function class_1623()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super.method_153(param1);
         _loc2_ = !!param1[0] ? param1[0] : "";
         _description = _description.replace(/%TYPE%/,TextUtils.getTranslationByType(_loc2_,class_117.const_1296));
         var_106 = "/" + _target;
         var _loc3_:AssetsProxy = class_62.getInstance().retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
         var _loc5_:BitmapData;
         var _loc4_:class_968;
         if(_loc5_ = (_loc4_ = _loc3_.getBitmapAtlasById(ItemsControlMenuConstants.ICONS_BITMAP_ATLAS)).method_4093(_loc2_,true))
         {
            var_3277 = _loc5_;
         }
         else if(_loc7_ = (_loc6_ = class_126.instance).method_3229[_loc2_])
         {
            var_3277 = method_6395(_loc7_);
         }
      }
      
      override public function get method_1303() : String
      {
         return _current.toString();
      }
   }
}
