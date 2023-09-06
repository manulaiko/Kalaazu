package net.bigpoint.darkorbit.net
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_124.class_1340;
   import package_27.class_82;
   import package_46.class_131;
   import package_9.class_50;
   
   public class class_368 extends class_96
   {
      
      private static var _instance:class_368;
       
      
      private var var_139:Dictionary;
      
      private var main:class_9;
      
      public function class_368(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("SettingsAssembly is a Singleton and can only be accessed through SettingsAssembly.getInstance()");
         }
         this.main = var_574;
         this.method_709();
      }
      
      public static function getInstance() : class_368
      {
         if(_instance == null)
         {
            _instance = new class_368(method_336);
         }
         return _instance;
      }
      
      private static function method_336() : void
      {
      }
      
      public function method_1606(param1:Array) : void
      {
         var _loc2_:String = param1[0];
         var _loc3_:String = param1[1];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](_loc3_);
         }
      }
      
      private function method_709() : void
      {
         this.var_139 = new Dictionary();
         this.var_139[class_74.const_3110] = this.method_3126;
         this.var_139[class_74.const_108] = this.method_2765;
         this.var_139[class_74.const_1426] = this.method_1684;
         this.var_139[class_74.const_1767] = this.method_5034;
         this.var_139[class_74.const_2489] = this.method_2199;
         this.var_139[class_74.const_3318] = this.method_1169;
         this.var_139[class_74.const_2851] = this.method_433;
         this.var_139[class_74.const_309] = this.method_3426;
         this.var_139[class_74.const_2844] = this.method_2423;
         this.var_139[class_74.const_1850] = this.method_1603;
         this.var_139[class_74.const_755] = this.method_1471;
         this.var_139[class_74.const_2928] = this.method_2257;
         this.var_139[class_74.const_2341] = this.method_1311;
         this.var_139[class_74.const_1036] = this.method_2033;
         this.var_139[class_74.const_1480] = this.method_4377;
         this.var_139[class_74.const_3097] = this.method_1687;
         this.var_139[class_74.const_469] = this.method_2189;
         this.var_139[class_74.const_1585] = this.method_1053;
         this.var_139[class_74.const_1940] = this.method_4895;
         this.var_139[class_74.const_3062] = this.method_4997;
         this.var_139[class_74.SET_DISPLAY_MINIMAP_BACKGROUND_IMAGE] = this.method_4581;
         this.var_139[class_74.const_2397] = this.method_5070;
         this.var_139[class_74.const_1872] = this.method_1770;
         this.var_139[class_74.const_1578] = this.method_204;
         this.var_139[class_74.const_2629] = this.method_270;
         this.var_139[class_74.const_1408] = this.method_5483;
         this.var_139[class_74.SET_RESOLUTION] = this.method_4120;
         this.var_139[class_74.const_1587] = this.method_2562;
         this.var_139[class_74.const_2869] = this.method_2866;
         this.var_139[class_74.const_1820] = this.method_2882;
         this.var_139[class_74.const_2830] = this.method_2111;
         this.var_139[class_74.const_886] = this.method_1562;
         this.var_139[class_74.const_1627] = this.method_4477;
         this.var_139[class_74.const_2282] = this.method_5800;
         this.var_139[class_74.const_2022] = this.method_4967;
         this.var_139[class_74.const_1449] = this.method_4467;
         this.var_139[class_74.const_1622] = this.method_193;
         this.var_139[class_74.const_1786] = this.method_2948;
         this.var_139[class_74.const_577] = this.method_5618;
         this.var_139[class_74.const_2692] = this.method_4852;
         this.var_139[class_74.const_1260] = this.method_4776;
         this.var_139[class_74.const_1260] = this.method_4776;
      }
      
      private function method_4120(param1:String) : void
      {
      }
      
      private function method_5483(param1:String) : void
      {
         Settings.preloadUserShips = Boolean(int(param1));
      }
      
      private function method_2562(param1:String) : void
      {
         Settings.qualityPresetting = int(param1);
      }
      
      private function method_2866(param1:String) : void
      {
         Settings.qualityCustomized = Boolean(int(param1));
      }
      
      private function method_2882(param1:String) : void
      {
         Settings.qualityBackground.value = int(param1);
      }
      
      private function method_2111(param1:String) : void
      {
         Settings.qualityPoizone.value = int(param1);
      }
      
      private function method_1562(param1:String) : void
      {
         Settings.qualityShip.value = int(param1);
      }
      
      private function method_4477(param1:String) : void
      {
         Settings.qualityEngine.value = int(param1);
      }
      
      private function method_5800(param1:String) : void
      {
         Settings.qualityCollectable.value = int(param1);
      }
      
      private function method_4967(param1:String) : void
      {
         Settings.qualityAttack.value = int(param1);
      }
      
      private function method_4467(param1:String) : void
      {
         Settings.qualityEffect.value = int(param1);
      }
      
      private function method_193(param1:String) : void
      {
         Settings.qualityExplosion.value = int(param1);
      }
      
      private function method_3126(param1:Array) : void
      {
         this.main.method_4489().method_4214();
         if(class_81.var_4677.value)
         {
            this.main.method_4489().method_4380();
         }
      }
      
      private function method_1471(param1:String) : void
      {
         Settings.quickSlotStopAttack = Boolean(int(param1));
      }
      
      private function method_2257(param1:String) : void
      {
         Settings.displayDrones.value = Boolean(int(param1));
      }
      
      private function method_1770(param1:String) : void
      {
         Settings.autoStartEnabled = Boolean(int(param1));
      }
      
      private function method_204(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         Settings.displayWindowsBackground = Boolean(int(param1));
         var _loc2_:Dictionary = var_574.method_4489().windows;
         for(_loc3_ in _loc2_)
         {
            _loc4_ = _loc2_[_loc3_] as class_131;
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
      }
      
      private function method_270(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         Settings.dragWindowsAlways = Boolean(int(param1));
         var _loc2_:Dictionary = var_574.method_4489().windows;
         for(_loc3_ in _loc2_)
         {
            (_loc4_ = _loc2_[_loc3_] as class_131).method_1949();
         }
      }
      
      private function method_3426(param1:String) : void
      {
         Settings.displayBattlerayNotifications = Boolean(int(param1));
      }
      
      private function method_2423(param1:String) : void
      {
         Settings.showLowHpWarnings = Boolean(int(param1));
         class_1340.method_3364();
      }
      
      private function method_433(param1:String) : void
      {
         Settings.doubleclickAttackEnabled = Boolean(int(param1));
      }
      
      private function method_1603(param1:String) : void
      {
         Settings.autoBuyBootyKeys = Boolean(int(param1));
      }
      
      private function method_4377(param1:String) : void
      {
         Settings.autoRefinement = Boolean(int(param1));
      }
      
      private function method_5070(param1:String) : void
      {
         Settings.autochangeAmmo = Boolean(int(param1));
      }
      
      private function method_4997(param1:String) : void
      {
         Settings.displayNotFreeCargoBoxes.value = Boolean(int(param1));
      }
      
      private function method_4895(param1:String) : void
      {
         Settings.displayFreeCargoBoxes.value = Boolean(int(param1));
      }
      
      private function method_1311(param1:String) : void
      {
         Settings.displayNotifications.value = Boolean(int(param1));
      }
      
      private function method_2033(param1:String) : void
      {
         Settings.displayChat = Boolean(int(param1));
      }
      
      private function method_2199(param1:String) : void
      {
         Settings.playMusic = Boolean(int(param1));
         var _loc2_:class_90 = var_574.name_47.map;
         if(true)
         {
            class_82.method_5398();
         }
         else if(_loc2_ != null)
         {
            _loc2_.method_6148();
         }
      }
      
      private function method_1169(param1:String) : void
      {
         Settings.playCombatMusic = Boolean(int(param1));
         if(Boolean(class_50.getInstance().map))
         {
            class_82.method_2019(class_50.getInstance().map.method_1123());
         }
      }
      
      private function method_5034(param1:String) : void
      {
         Settings.playSFX = Boolean(int(param1));
         var _loc2_:class_90 = var_574.name_47.map;
         if(false)
         {
            if(_loc2_)
            {
               _loc2_.method_2778();
            }
         }
         else if(_loc2_)
         {
            _loc2_.method_2204();
         }
      }
      
      private function method_1687(param1:String) : void
      {
         Settings.autoBoost = Boolean(int(param1));
      }
      
      private function method_1684(param1:String) : void
      {
         Settings.displayPlayerNames.value = Boolean(int(param1));
      }
      
      private function method_2189(param1:String) : void
      {
         Settings.displayResources.value = Boolean(int(param1));
      }
      
      private function method_1053(param1:String) : void
      {
         Settings.displayBonusBoxes.value = Boolean(int(param1));
      }
      
      private function method_4581(param1:String) : void
      {
         Settings.displayMiniMapBackgroundImage.value = Boolean(int(param1));
      }
      
      private function method_2765(param1:String) : void
      {
         Settings.displayHitpointBubbles = Boolean(int(param1));
      }
      
      private function method_2948(param1:String) : void
      {
         Settings.allowAutoQuality.value = Boolean(int(param1));
      }
      
      private function method_5618(param1:String) : void
      {
         Settings.hoverShips.value = Boolean(int(param1));
      }
      
      private function method_4852(param1:String) : void
      {
         Settings.showPremiumQuickslotBar = Boolean(int(param1));
      }
      
      private function method_4776(param1:String) : void
      {
         Settings.showNotOwnedItems = Boolean(int(param1));
      }
   }
}
