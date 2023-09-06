package package_231
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.external.ExternalLoadVo;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_328.class_2278;
   import package_38.class_894;
   import package_398.JackpotStatusProxy;
   import package_398.class_2281;
   import package_398.class_2282;
   import package_399.JackPotStatusUiMediator;
   import package_400.class_2280;
   import package_46.class_131;
   import package_76.class_2279;
   import package_84.class_243;
   
   public class class_1840 extends class_243
   {
       
      
      public function class_1840()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:* = null;
         super.execute(param1);
         var _loc2_:class_894 = param1.getBody() as class_894;
         var _loc3_:JackPotStatusUiMediator = facade.retrieveMediator(JackPotStatusUiMediator.NAME) as JackPotStatusUiMediator;
         if(!_loc3_)
         {
            if(!(_loc6_ = guiProxy.getWindowById(GuiConstants.JACKPOT_STATUS_UI_WINDOW)))
            {
               sendNotification(GuiNotifications.CREATE_WINDOW,GuiConstants.JACKPOT_STATUS_UI_WINDOW);
               _loc6_ = guiProxy.getWindowById(GuiConstants.JACKPOT_STATUS_UI_WINDOW);
            }
            _loc3_ = new JackPotStatusUiMediator(new class_2280(_loc6_));
            facade.registerMediator(_loc3_);
         }
         var _loc4_:JackpotStatusProxy = facade.retrieveProxy(JackpotStatusProxy.NAME) as JackpotStatusProxy;
         var _loc5_:class_2281 = new class_2281(_loc2_.var_4796,_loc2_.var_3529);
         if(!_loc4_)
         {
            _loc4_ = new JackpotStatusProxy();
            facade.registerProxy(_loc4_);
         }
         _loc4_.setData(_loc5_);
         _loc3_.data = this.getVO(_loc2_);
         this.method_5760(_loc3_);
         this.method_2202(class_81.userID,_loc3_);
         this.method_463(_loc2_.var_1761,_loc3_,_loc2_.var_970);
      }
      
      private function getVO(param1:class_894) : class_2282
      {
         var _loc2_:class_2282 = new class_2282();
         _loc2_.var_4318 = this.method_11(param1);
         _loc2_.var_1877 = class_81.name_148;
         _loc2_.var_110 = param1.var_1790;
         _loc2_.var_2655 = param1.var_3301;
         _loc2_.var_3175 = param1.var_4796;
         _loc2_.var_255 = param1.var_1497;
         _loc2_.matchType = param1.status;
         return _loc2_;
      }
      
      private function method_11(param1:class_894) : String
      {
         var _loc2_:* = null;
         switch(param1.var_1761)
         {
            case class_2278.const_3007:
               _loc2_ = class_88.getItem("jackpot_status_window_avatar_unknown");
               break;
            case class_2278.const_1557:
               _loc2_ = class_88.getItem("jackpot_status_window_avatar_wildcard");
               break;
            default:
               _loc2_ = param1.name_158;
         }
         return _loc2_;
      }
      
      private function method_463(param1:int, param2:JackPotStatusUiMediator, param3:int) : void
      {
         var _loc4_:* = null;
         switch(param1)
         {
            case class_2278.const_3007:
               sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(param2.method_927,class_2278.LIB_ID,new <String>[class_2278.UNKNOWN],Bitmap));
               break;
            case class_2278.const_1557:
               sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(param2.method_3875,class_2278.LIB_ID,new <String>[class_2278.const_664],Bitmap));
               break;
            default:
               _loc4_ = class_2279.method_1192(param1,param3,Settings.dynamicHost);
               sendNotification(AssetNotifications.LOAD_EXTERNAL,new ExternalLoadVo(_loc4_,param2.method_2975));
         }
      }
      
      private function method_2202(param1:int, param2:JackPotStatusUiMediator) : void
      {
         var _loc3_:String = class_2279.method_1192(param1,Settings.instanceID,Settings.dynamicHost);
         sendNotification(AssetNotifications.LOAD_EXTERNAL,new ExternalLoadVo(_loc3_,param2.method_6246));
      }
      
      private function method_5760(param1:JackPotStatusUiMediator) : void
      {
         sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(param1.method_3121,class_2278.LIB_ID,new <String>[class_2278.const_3046],BitmapData));
         sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(param1.method_116,class_2278.LIB_ID,new <String>[class_2278.const_630],Bitmap));
      }
   }
}
