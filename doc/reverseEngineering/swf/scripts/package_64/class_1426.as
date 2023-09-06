package package_64
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_37.class_170;
   import package_38.class_915;
   import package_46.class_131;
   import package_73.class_196;
   
   public class class_1426 extends class_170
   {
       
      
      public function class_1426()
      {
         super();
      }
      
      public static function run(param1:class_915) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         Settings.dragWindowsAlways = param1.name_154;
         var _loc2_:Dictionary = var_574.method_4489().windows;
         for(_loc3_ in _loc2_)
         {
            (_loc6_ = _loc2_[_loc3_] as class_131).method_1949();
         }
         Settings.displayPlayerNames.value = param1.var_2376;
         Settings.displayResources.value = param1.displayResources;
         Settings.displayBonusBoxes.value = param1.var_4829;
         Settings.displayHitpointBubbles = param1.displayHitpointBubbles;
         Settings.displayChat = param1.displayChat;
         Settings.displayDrones.value = param1.displayDrones;
         Settings.displayFreeCargoBoxes.value = param1.var_4972;
         Settings.displayNotFreeCargoBoxes.value = param1.var_482;
         Settings.displayWindowsBackground = param1.var_2907;
         for each(_loc4_ in _loc2_)
         {
            if(false)
            {
               _loc4_.method_25();
               _loc4_.method_3086();
            }
            else
            {
               _loc4_.method_3883();
               _loc4_.method_1349();
            }
         }
         Settings.displayNotifications.value = param1.displayNotifications;
         Settings.dragWindowsAlways = param1.name_154;
         Settings.preloadUserShips = param1.preloadUserShips;
         Settings.allowAutoQuality.value = param1.var_1348;
         Settings.hoverShips.value = param1.var_1368;
         Settings.showPremiumQuickslotBar = param1.var_1882;
         Settings.proActionBarEnabled.value = param1.proActionBarEnabled;
         Settings.proActionBarAutohideEnabled = param1.proActionBarAutohideEnabled;
         Settings.proActionBarKeyboardInputEnabled = param1.proActionBarKeyboardInputEnabled;
         Settings.showNotOwnedItems = param1.showNotOwnedItems;
         Settings.displayMiniMapBackgroundImage.value = param1.var_3068;
         _loc5_ = false;
         if(!Settings.localSettingsAvailable())
         {
            if(param1.displaySetting3DqualityAntialias > 0)
            {
               Settings.displaySetting3DqualityAntialias.value = param1.displaySetting3DqualityAntialias - 1;
               Settings.qualityBackground.value = param1.name_44 - 1;
               Settings.displaySetting3DqualityEffects.value = param1.displaySetting3DqualityEffects - 1;
               Settings.displaySetting3DqualityLights.value = param1.displaySetting3DqualityLights - 1;
               Settings.displaySetting3DqualityTextures.value = param1.displaySetting3DqualityTextures - 1;
               Settings.qualityPoizone.value = param1.name_16 - 1;
               Settings.displaySetting3DsizeTextures.value = param1.displaySetting3DsizeTextures - 1;
               Settings.displaySetting3DtextureFiltering.value = param1.displaySetting3DtextureFiltering - 1;
               var_271.sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_SETTINGS_FROM_SERVER);
            }
            else
            {
               method_5445();
               _loc5_ = true;
            }
         }
         if(_loc5_ == false && (true || true))
         {
            method_5445(false);
         }
      }
      
      private static function method_5445(param1:Boolean = true) : void
      {
         Settings.userType = Settings.FORCE_2D.value ? 0 : Settings.USER_TYPE_3D;
         if(param1)
         {
            Settings.displaySetting3DqualityAntialias.value = 3;
            Settings.qualityBackground.value = 3;
            Settings.displaySetting3DqualityEffects.value = 3;
            Settings.displaySetting3DqualityLights.value = 3;
            Settings.displaySetting3DqualityTextures.value = 3;
            Settings.qualityPoizone.value = 3;
            Settings.displaySetting3DsizeTextures.value = 3;
            Settings.displaySetting3DtextureFiltering.value = 3;
         }
         var_271.sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_SETTINGS_FROM_SERVER);
         var_574.method_4489().method_3430();
      }
   }
}
