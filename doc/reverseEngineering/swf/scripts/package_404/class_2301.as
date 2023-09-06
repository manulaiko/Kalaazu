package package_404
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.gui.class_1555;
   import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;
   import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_192.class_1557;
   import package_38.class_200;
   import package_406.class_2302;
   import package_406.class_2534;
   import package_46.class_131;
   import package_64.class_171;
   import package_84.class_243;
   
   public class class_2301 extends class_243
   {
       
      
      private const const_1637:int = 0;
      
      private const const_2993:int = 1;
      
      private const const_3008:int = 2;
      
      private const const_2527:int = 3;
      
      private const const_359:int = 4;
      
      private var var_260:Dictionary;
      
      public function class_2301()
      {
         this.var_260 = new Dictionary();
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.var_260[0] = this.method_2207;
         this.var_260[1] = this.method_148;
         this.var_260[2] = this.method_1542;
         this.var_260[3] = this.method_457;
         this.var_260[4] = this.method_2324;
         var _loc2_:class_2302 = param1.getBody() as class_2302;
         this.var_260[0](_loc2_);
         this.var_260[1](_loc2_);
         this.var_260[2](_loc2_);
         this.var_260[3](_loc2_);
         this.var_260[4](_loc2_);
      }
      
      private function method_2207(param1:class_2302) : void
      {
         if(Settings.FORCE_2D.value || true)
         {
            Settings.qualityBackground.value = param1.method_4640;
            Settings.qualityPoizone.value = param1.method_5112;
            Settings.qualityShip.value = param1.method_3387;
            Settings.qualityEngine.value = param1.method_2536;
            Settings.qualityExplosion.value = param1.method_5151;
            Settings.qualityCollectable.value = param1.method_5596;
         }
         else
         {
            Settings.displaySetting3DqualityAntialias.value = param1.displaySetting3DqualityAntialias;
            Settings.qualityBackground.value = param1.name_44;
            Settings.displaySetting3DqualityEffects.value = param1.displaySetting3DqualityEffects;
            Settings.displaySetting3DqualityLights.value = param1.displaySetting3DqualityLights;
            Settings.displaySetting3DqualityTextures.value = param1.displaySetting3DqualityTextures;
            Settings.qualityPoizone.value = param1.name_16;
            Settings.displaySetting3DsizeTextures.value = param1.displaySetting3DsizeTextures;
            Settings.displaySetting3DtextureFiltering.value = param1.displaySetting3DtextureFiltering;
         }
         Settings.preloadUserShips = param1.method_759;
         Settings.qualityCustomized = param1.advanced;
         Settings.qualityPresetting = param1.method_3958;
      }
      
      private function method_148(param1:class_2302) : void
      {
         Settings.autoBoost = param1.method_2761;
         Settings.autochangeAmmo = param1.method_4459;
         Settings.autoRefinement = param1.method_1879;
         Settings.quickSlotStopAttack = param1.method_5692;
         Settings.autoStartEnabled = param1.autoLogin;
         Settings.doubleclickAttackEnabled = param1.doubleClickAttack;
         Settings.autoBuyBootyKeys = param1.method_6156;
         Settings.displayBattlerayNotifications = param1.method_4733;
         Settings.showLowHpWarnings = param1.showLowHpWarnings;
      }
      
      private function method_1542(param1:class_2302) : void
      {
         Settings.displayPlayerNames.value = param1.method_3208;
         Settings.displayResources.value = param1.method_2364;
         Settings.displayBonusBoxes.value = param1.method_6273;
         Settings.displayHitpointBubbles = param1.method_706;
         Settings.displayDrones.value = param1.method_3810;
         Settings.displayFreeCargoBoxes.value = param1.method_5736;
         Settings.displayNotFreeCargoBoxes.value = param1.method_525;
         Settings.displayMiniMapBackgroundImage.value = param1.method_2596;
         Settings.displayNotifications.value = param1.method_5392;
         Settings.allowAutoQuality.value = param1.autoQualityReduction;
         Settings.hoverShips.value = param1.hoverShips;
         Settings.displayChat = param1.method_2258;
         Settings.dragWindowsAlways = param1.name_154;
         this.method_3733();
         Settings.displayWindowsBackground = param1.method_4912;
         this.method_4213();
         Settings.showPremiumQuickslotBar = param1.method_6233;
         Settings.showNotOwnedItems = param1.method_366;
         Settings.proActionBarEnabled.value = param1.proActionBarEnabled;
         Settings.proActionBarAutohideEnabled = param1.proActionBarAutohideEnabled;
         Settings.proActionBarKeyboardInputEnabled = param1.proActionBarKeyboardInputEnabled;
      }
      
      private function method_457(param1:class_2302) : void
      {
         class_171.run(new class_200(false,param1.method_6008,param1.musicVolume,param1.method_4421,param1.playCombatMusic),true);
      }
      
      private function method_2324(param1:class_2302) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:KeyboardMapper = KeyboardMapper.getInstance();
         _loc2_.cleanup();
         var _loc3_:class_1557 = new class_1557();
         var _loc4_:class_1555 = new class_1555(guiManager.method_6185().method_6154());
         for(_loc5_ in param1.method_3956)
         {
            (_loc6_ = new class_1554()).name = class_2534.method_3622(int(_loc5_));
            _loc6_.keys = param1.method_3956[int(_loc5_)] as Vector.<int>;
            _loc6_.args = new Vector.<String>();
            if(class_2534.method_1459(_loc6_.name).indexOf(_loc5_) != -1)
            {
               _loc6_.args.push(class_2534.method_1459(_loc6_.name).indexOf(_loc5_));
            }
            else
            {
               _loc6_.args.push("0");
            }
            _loc3_.method_889(_loc6_);
            _loc4_.method_2039(_loc6_);
         }
         _loc2_.method_1900(_loc3_);
         _loc4_.method_1900();
         _loc3_.reset();
      }
      
      private function method_4213() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Dictionary = guiManager.windows;
         for(_loc2_ in _loc1_)
         {
            _loc3_ = _loc1_[_loc2_] as class_131;
            if(false)
            {
               _loc3_.method_25();
               _loc3_.method_3086();
            }
            else
            {
               _loc3_.method_3883();
               _loc3_.method_1349();
            }
         }
      }
      
      private function method_3733() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Dictionary = guiManager.windows;
         for(_loc2_ in _loc1_)
         {
            _loc3_ = _loc1_[_loc2_] as class_131;
            _loc3_.method_1949();
         }
      }
   }
}
