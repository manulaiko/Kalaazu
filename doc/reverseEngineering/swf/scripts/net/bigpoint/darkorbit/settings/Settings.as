package net.bigpoint.darkorbit.settings
{
   import flash.net.SharedObject;
   import flash.system.Capabilities;
   import net.bigpoint.darkorbit.gui.class_21;
   import package_10.class_19;
   import package_10.class_20;
   
   public class Settings
   {
      
      public static const USER_TYPE_NEW:int = -1;
      
      public static const USER_TYPE_NOT_SELECTED:int = 0;
      
      public static const USER_TYPE_2D:int = 2;
      
      public static const USER_TYPE_3D:int = 1;
      
      private static var _localSettings:SharedObject;
      
      private static var _localSettingsAvailable:Boolean = true;
      
      public static var localSettingsErrors:String = "";
      
      public static var userType:int;
      
      public static const QUALITY_LOW:int = 0;
      
      public static const QUALITY_MEDIUM:int = 1;
      
      public static const QUALITY_GOOD:int = 2;
      
      public static const QUALITY_HIGH:int = 3;
      
      public static var selectedLauncherRocket:int = 6;
      
      public static var selectedConfiguration:int = 1;
      
      public static var selectedQuickBuyIcon:int = 1;
      
      public static var questsAvailableFilter:Boolean = true;
      
      public static var questsUnavailableFilter:Boolean = false;
      
      public static var questsCompletedFilter:Boolean = false;
      
      public static var questsLevelOrderDescending:Boolean = false;
      
      public static var challengesAttemptedFilter:Boolean = true;
      
      public static var challengesUnattemptedFilter:Boolean = true;
      
      public static var languageXMLHash:String = "";
      
      private static var _driverInfo:String = "";
      
      public static var stage3DProfile:String = "";
      
      public static var useEmbeddedFonts:Boolean = true;
      
      public static var displayChat:Boolean = true;
      
      public static var playMusic:Boolean = true;
      
      public static var playCombatMusic:Boolean = true;
      
      public static var combatMusicActive:Boolean = false;
      
      public static var playSFX:Boolean = true;
      
      public static var playVoice:Boolean = true;
      
      public static var musicVolume:int = 50;
      
      public static var soundVolume:int = 50;
      
      public static var voiceVolume:int = 50;
      
      public static var displayHitpointBubbles:Boolean = true;
      
      public static const displayPlayerNames:class_19 = new class_19(true);
      
      public static const displayNotifications:class_19 = new class_19(true);
      
      public static const displayResources:class_19 = new class_19(true);
      
      public static const displayBonusBoxes:class_19 = new class_19(true);
      
      public static const displayFreeCargoBoxes:class_19 = new class_19(true);
      
      public static const displayNotFreeCargoBoxes:class_19 = new class_19(false);
      
      public static const displayMiniMapBackgroundImage:class_19 = new class_19(true);
      
      public static const displayDrones:class_19 = new class_19(true);
      
      public static const show2DFormation:class_19 = new class_19(false);
      
      public static var hoverShips:class_19 = new class_19(true);
      
      private static var _showPremiumQuickslotBar:Boolean = true;
      
      public static var proActionBarEnabled:class_19 = new class_19(true);
      
      public static var proActionBarAutohideEnabled:Boolean = true;
      
      public static var proActionBarKeyboardInputEnabled:Boolean = true;
      
      public static var autoBoost:Boolean;
      
      public static var autochangeAmmo:Boolean = true;
      
      public static var quickSlotStopAttack:Boolean = true;
      
      public static var autoRefinement:Boolean;
      
      public static const enemyCount:class_20 = new class_20(0);
      
      public static var instantLogViewConfig:class_21;
      
      public static var advertisingHintEnabled:Boolean;
      
      public static var useLocalMapsXML:Boolean = false;
      
      public static var JS_EVENT_TRACKING_ENABLED:Boolean = false;
      
      public static var doubleclickAttackEnabled:Boolean = true;
      
      public static var displayBattlerayNotifications:Boolean = false;
      
      public static var autoBuyBootyKeys:Boolean = false;
      
      public static var showLowHpWarnings:Boolean = true;
      
      public static var showNotOwnedItems:Boolean = false;
      
      public static var autoStartEnabled:Boolean = false;
      
      public static var singleSessionAutoStartEnabled:Boolean = false;
      
      public static var showInstantLog:Boolean = true;
      
      public static const createCollectables:Boolean = true;
      
      public static const createOpponents:Boolean = true;
      
      public static var createChat:Boolean = true;
      
      public static const createMinimap:Boolean = true;
      
      public static const createMusic:Boolean = true;
      
      public static var unloadResources:Boolean = true;
      
      public static var instanceID:int;
      
      public static var chatHost:String;
      
      public static var nextMapID:int = -1;
      
      public static var mapID:int = -1;
      
      public static var lastMapID:int = -1;
      
      public static var boardLink:String;
      
      public static var basePath:String;
      
      public static var currency:String = "EUR";
      
      public static var language:String;
      
      public static var staticHost:String;
      
      public static var dynamicHost:String = "/";
      
      public static var defaultGameServer:String;
      
      public static var rocketLauncherTypes:Vector.<int> = new Vector.<int>();
      
      public static var rocketLauncherRocketsLoaded:int = 0;
      
      public static var displayWindowsBackground:Boolean = true;
      
      public static var maxWindowsTransparency:Number = 1;
      
      public static var gridSize:int = 10;
      
      public static var dragWindowsAlways:Boolean = true;
      
      public static var preloadUserShips:Boolean = false;
      
      public static var resizeOnTheFly:Boolean = true;
      
      public static const allowAutoQuality:class_19 = new class_19(true);
      
      public static const autoQualityReduction:class_20 = new class_20(0,0);
      
      public static const AQ_NONE:int = 0;
      
      public static const AQ_NO_STARFIELD_MOVEMENT_LIMIT:int = 5;
      
      public static const AQ_NO_PORTAL_TARGET_PREVIEW_LIMIT:int = 1;
      
      public static const AQ_NO_ENGINE_SMOKE_LIMIT:int = 2;
      
      public static const AQ_NO_ANIMATED_MAPASSETS_LIMIT:int = 3;
      
      public static const AQ_LOW_EXPLOSION_DETAIL_LIMIT:int = 4;
      
      public static const AQ_NO_EXPLOSION_LIMIT:int = 5;
      
      public static const AQ_MAX_REDUCTION:int = 5;
      
      public static var qualityPresetting:int = 3;
      
      public static var qualityCustomized:Boolean = false;
      
      public static const qualityBackground:BindableSettings = new BindableSettings(QUALITY_HIGH);
      
      public static const qualityPoizone:BindableSettings = new BindableSettings(QUALITY_HIGH);
      
      public static const qualityShip:class_20 = new class_20(QUALITY_LOW);
      
      public static const qualityEngine:class_20 = new class_20(QUALITY_LOW);
      
      public static const qualityExplosion:class_20 = new class_20(QUALITY_LOW);
      
      public static const qualityCollectable:class_20 = new class_20(QUALITY_LOW);
      
      public static const qualityAttack:class_20 = new class_20(QUALITY_HIGH);
      
      public static const qualityEffect:class_20 = new class_20(QUALITY_HIGH);
      
      private static var _majorVersion:int;
      
      private static var _minorVersion:int;
      
      private static var _buildNumber:int;
      
      public static var browser:String;
      
      public static var gpuSupport:Boolean = true;
      
      public static const FORCE_2D:class_19 = initLocalBooleanSetting("force2D",false);
      
      public static const displaySetting3DqualityAntialias:BindableSettings = initLocalIntegerSetting("displaySetting3DqualityAntialias",3);
      
      public static const displaySetting3DqualityLights:BindableSettings = initLocalIntegerSetting("displaySetting3DqualityLights",3);
      
      public static const displaySetting3DqualityTextures:BindableSettings = initLocalIntegerSetting("displaySetting3DqualityTextures",3);
      
      public static const displaySetting3DsizeTextures:BindableSettings = initLocalIntegerSetting("displaySetting3DsizeTextures",3);
      
      public static const displaySetting3DqualityEffects:BindableSettings = initLocalIntegerSetting("displaySetting3DqualityEffects",3);
      
      public static const displaySetting3DtextureFiltering:BindableSettings = initLocalIntegerSetting("displaySetting3DtextureFiltering",3);
      
      public static const showHUD:class_19 = new class_19(true);
      
      public static const showUI:class_19 = new class_19(true);
      
      public static const show_debug_objects:class_19 = new class_19(false);
      
      public static var isPepperFlashPlayer:Boolean = false;
      
      public static var profileXMLHash:String;
      
      public static var gameXMLHash:String;
      
      public static var resourceXMLHash:String;
      
      public static var eventStreamContext:String = null;
      
      private static var _has3DCapabilities:Boolean = false;
       
      
      public function Settings()
      {
         super();
      }
      
      private static function initLocalBooleanSetting(param1:String, param2:Boolean) : class_19
      {
         var bindable:class_19 = null;
         var key:String = param1;
         var defaultValue:Boolean = param2;
         if(_localSettings == null)
         {
            try
            {
               _localSettings = SharedObject.getLocal("darkorbit","/");
            }
            catch(e:Error)
            {
               _localSettingsAvailable = false;
               localSettingsErrors += e + "\n";
            }
         }
         bindable = new class_19(defaultValue);
         if(_localSettings != null)
         {
            if(Boolean(_localSettings.data.settings) && _localSettings.data.settings[key] !== undefined)
            {
               bindable.value = Boolean(_localSettings.data.settings[key]);
            }
            else
            {
               storeLocalBooleanSetting(key,bindable);
               _localSettingsAvailable = false;
            }
            bindable.changed.add(function():void
            {
               storeLocalBooleanSetting(key,bindable);
            });
         }
         return bindable;
      }
      
      public static function initLocalIntegerSetting(param1:String, param2:int) : BindableSettings
      {
         var bindable:BindableSettings = null;
         var key:String = param1;
         var defaultValue:int = param2;
         if(_localSettings == null)
         {
            _localSettingsAvailable = false;
            try
            {
               _localSettings = SharedObject.getLocal("darkorbit","/");
            }
            catch(e:Error)
            {
            }
         }
         bindable = new BindableSettings(defaultValue);
         if(_localSettings != null)
         {
            if(Boolean(_localSettings.data.settings) && _localSettings.data.settings[key] !== undefined)
            {
               bindable.value = int(_localSettings.data.settings[key]);
            }
            else
            {
               storeLocalIntegerSetting(key,bindable);
               _localSettingsAvailable = false;
            }
            bindable.changed.add(function():void
            {
               storeLocalIntegerSetting(key,bindable);
            });
         }
         return bindable;
      }
      
      private static function storeLocalIntegerSetting(param1:String, param2:BindableSettings) : void
      {
         var key:String = param1;
         var bindable:BindableSettings = param2;
         if(_localSettings.data.settings == null)
         {
            _localSettings.data.settings = {};
         }
         _localSettings.data.settings[key] = bindable.value;
         try
         {
            _localSettings.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      public static function storeLocalBooleanSetting(param1:String, param2:class_19) : void
      {
         var key:String = param1;
         var bindable:class_19 = param2;
         if(_localSettings.data.settings == null)
         {
            _localSettings.data.settings = {};
         }
         _localSettings.data.settings[key] = bindable.value;
         try
         {
            _localSettings.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      public static function get useATF() : Boolean
      {
         return gpuSupport;
      }
      
      public static function getQualitySettingLevel() : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = [qualityBackground.value,qualityPoizone.value,qualityShip,qualityEngine,qualityExplosion,qualityCollectable.value];
         var _loc2_:int = 0;
         for each(_loc3_ in _loc1_)
         {
            _loc2_ += _loc3_;
         }
         return Math.round(_loc2_ / _loc1_.length);
      }
      
      public static function parsePlayerVersion() : void
      {
         var _loc1_:String = "null";
         var _loc2_:Array = _loc1_.split(",");
         var _loc3_:Array = String(_loc2_[0]).split(" ");
         _majorVersion = parseInt(_loc3_[1]);
         _minorVersion = parseInt(_loc2_[1]);
         _buildNumber = parseInt(_loc2_[2]);
      }
      
      public static function get showPremiumQuickslotBar() : Boolean
      {
         return _showPremiumQuickslotBar;
      }
      
      public static function set showPremiumQuickslotBar(param1:Boolean) : void
      {
         _showPremiumQuickslotBar = param1;
      }
      
      public static function toString() : String
      {
         var _loc1_:String = "";
         _loc1_ += "chatHost   = " + chatHost + "\n";
         return _loc1_ + ("instanceID = " + instanceID + "\n");
      }
      
      public static function setDefaultQualitySettings() : void
      {
         qualityShip.value = QUALITY_HIGH;
         qualityEngine.value = QUALITY_HIGH;
         qualityExplosion.value = QUALITY_HIGH;
         qualityCollectable.value = QUALITY_HIGH;
      }
      
      public static function localSettingsAvailable() : Boolean
      {
         return _localSettingsAvailable;
      }
      
      public static function get has3DCapabilities() : Boolean
      {
         return _has3DCapabilities;
      }
      
      public static function get driverInfo() : String
      {
         return _driverInfo;
      }
      
      public static function set driverInfo(param1:String) : void
      {
         _driverInfo = param1;
         var _loc2_:Array = Capabilities.version.split(" ")[1].split(",");
         var _loc3_:Number = int(_loc2_[0]) + int(_loc2_[1]) / 10;
         Settings.gpuSupport = _driverInfo && _driverInfo.indexOf("Software") == -1 && _driverInfo.indexOf("Disabled") == -1 && _loc3_ >= 11.8;
         _has3DCapabilities = gpuSupport;
      }
   }
}
