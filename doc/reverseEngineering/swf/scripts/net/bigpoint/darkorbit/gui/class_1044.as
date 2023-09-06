package net.bigpoint.darkorbit.gui
{
   import fl.controls.Slider;
   import fl.events.SliderEvent;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.system.System;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;
   import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.ConfigModePopupMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components.ConfigModePopup;
   import net.bigpoint.darkorbit.net.class_368;
   import net.bigpoint.darkorbit.net.class_59;
   import net.bigpoint.darkorbit.net.class_74;
   import net.bigpoint.darkorbit.settings.Presetting;
   import net.bigpoint.darkorbit.settings.PresettingItem;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_39;
   import package_17.class_62;
   import package_192.class_1557;
   import package_251.class_1548;
   import package_251.class_1550;
   import package_251.class_1559;
   import package_252.class_1556;
   import package_252.class_1558;
   import package_27.class_82;
   import package_30.class_1551;
   import package_30.class_1553;
   import package_30.class_185;
   import package_30.class_218;
   import package_30.class_219;
   import package_30.class_91;
   import package_33.class_1549;
   import package_33.class_93;
   import package_38.class_200;
   import package_38.class_617;
   import package_38.class_783;
   import package_46.class_131;
   import package_64.class_171;
   import package_70.SimpleWindowEvent;
   import package_9.ResourceManager;
   
   public class class_1044
   {
      
      private static var _instance:class_1044;
      
      private static const const_526:Object = new Object();
      
      private static var var_1009:Dictionary;
      
      {
         const_526[Keyboard.BACKSPACE] = class_88.getItem("keyboard_key_backspace");
         const_526[Keyboard.CONTROL] = class_88.getItem("keyboard_key_ctrl");
         const_526[Keyboard.ESCAPE] = class_88.getItem("keyboard_key_esc");
         const_526[Keyboard.CAPS_LOCK] = class_88.getItem("keyboard_key_capslock");
         const_526[Keyboard.DELETE] = class_88.getItem("keyboard_key_delete");
         const_526[Keyboard.END] = class_88.getItem("keyboard_key_end");
         const_526[Keyboard.ENTER] = class_88.getItem("keyboard_key_enter");
         const_526[Keyboard.HOME] = class_88.getItem("keyboard_key_home");
         const_526[Keyboard.INSERT] = class_88.getItem("keyboard_key_insert");
         const_526[Keyboard.PAGE_UP] = class_88.getItem("keyboard_key_page up");
         const_526[Keyboard.PAGE_DOWN] = class_88.getItem("keyboard_key_page down");
         const_526[Keyboard.SPACE] = class_88.getItem("keyboard_key_space");
         const_526[Keyboard.SHIFT] = class_88.getItem("keyboard_key_key_shift");
         const_526[Keyboard.TAB] = class_88.getItem("keyboard_key_tab");
         const_526[Keyboard.UP] = class_88.getItem("keyboard_key_up");
         const_526[Keyboard.DOWN] = class_88.getItem("keyboard_key_down");
         const_526[Keyboard.LEFT] = class_88.getItem("keyboard_key_left");
         const_526[Keyboard.RIGHT] = class_88.getItem("keyboard_key_right");
         const_526[144] = class_88.getItem("keyboard_key_numpad").split("\n").join(" ");
         const_526[145] = class_88.getItem("keyboard_key_roll");
         const_526[19] = class_88.getItem("keyboard_key_pause");
         const_526[93] = class_88.getItem("keyboard_key_option");
         const_526[92] = class_88.getItem("keyboard_key_win");
         const_526[91] = class_88.getItem("keyboard_key_win");
         const_526[-1] = class_88.getItem("keyboard_key_undefined");
         const_526[Keyboard.NUMPAD_0] = "undefined 0";
         const_526[Keyboard.NUMPAD_1] = "undefined 1";
         const_526[Keyboard.NUMPAD_2] = "undefined 2";
         const_526[Keyboard.NUMPAD_3] = "undefined 3";
         const_526[Keyboard.NUMPAD_4] = "undefined 4";
         const_526[Keyboard.NUMPAD_5] = "undefined 5";
         const_526[Keyboard.NUMPAD_6] = "undefined 6";
         const_526[Keyboard.NUMPAD_7] = "undefined 7";
         const_526[Keyboard.NUMPAD_8] = "undefined 8";
         const_526[Keyboard.NUMPAD_9] = "undefined 9";
         const_526[Keyboard.NUMPAD_ADD] = "undefined +";
         const_526[Keyboard.NUMPAD_SUBTRACT] = "undefined -";
         const_526[Keyboard.NUMPAD_MULTIPLY] = "undefined *";
         const_526[Keyboard.NUMPAD_DIVIDE] = "undefined /";
      }
      
      private var var_1839:int = -2147483648;
      
      private var scrollContainer:class_1549;
      
      private var var_4308:class_1557;
      
      private var var_821:class_1555;
      
      private var var_2233:Vector.<class_1552>;
      
      private var guiManager:class_58;
      
      private var var_2186:class_39;
      
      private var var_4094:Dictionary;
      
      private var var_2193:Dictionary;
      
      private var qualityPresetting:Presetting;
      
      private var var_2621:class_1548;
      
      private var var_2137:Dictionary;
      
      private var isAdvanced:Boolean = false;
      
      private var var_2124:class_218;
      
      private var var_3484:class_219;
      
      public function class_1044(param1:class_58)
      {
         this.var_4308 = new class_1557();
         this.var_2233 = new Vector.<class_1552>();
         this.var_4094 = new Dictionary();
         this.var_2193 = new Dictionary();
         super();
         this.guiManager = param1;
         this.var_2186 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.qualityPresetting = new Presetting(Settings.gpuSupport);
         this.var_821 = new class_1555(param1.method_6185().method_6154());
         this.var_2137 = new Dictionary();
         _instance = this;
      }
      
      public static function getInstance() : class_1044
      {
         return _instance;
      }
      
      public static function method_3660(param1:int) : Boolean
      {
         switch(param1)
         {
            case class_1551.const_1567:
               return Settings.displayNotifications.value;
            case class_1551.const_2283:
               return Settings.displayChat;
            case class_1551.const_981:
               return Settings.playMusic;
            case class_1551.const_2101:
               return Settings.playSFX;
            case class_1551.const_960:
               return Settings.playVoice;
            case class_1551.const_2425:
               return Settings.playCombatMusic;
            case class_1551.const_398:
               return Settings.displayHitpointBubbles;
            case class_1551.const_416:
               return Settings.displayPlayerNames.value;
            case class_1551.const_1094:
               return Settings.autoBoost;
            case class_1551.const_2338:
               return Settings.displayResources.value;
            case class_1551.const_2936:
               return Settings.displayBonusBoxes.value;
            case class_1551.const_1037:
               return Settings.displayFreeCargoBoxes.value;
            case class_1551.const_2846:
               return Settings.displayNotFreeCargoBoxes.value;
            case class_1551.const_348:
               return Settings.displayMiniMapBackgroundImage.value;
            case class_1551.const_2694:
               return Settings.displayDrones.value;
            case class_1551.const_1280:
               return Settings.autochangeAmmo;
            case class_1551.const_1958:
               return Settings.autoRefinement;
            case class_1551.const_1938:
               return Settings.quickSlotStopAttack;
            case class_1551.const_1680:
               return Settings.autoStartEnabled;
            case class_1551.const_3255:
               return Settings.doubleclickAttackEnabled;
            case class_1551.const_3088:
               return Settings.displayBattlerayNotifications;
            case class_1551.const_1379:
               return Settings.displayWindowsBackground;
            case class_1551.const_1240:
               return Settings.dragWindowsAlways;
            case class_1551.const_1862:
               return Settings.preloadUserShips;
            case class_1551.const_249:
               return Settings.allowAutoQuality.value;
            case class_1551.const_2831:
               return Settings.hoverShips.value;
            case class_1551.const_2152:
               return Settings.showPremiumQuickslotBar;
            case class_1551.const_2092:
               return Settings.autoBuyBootyKeys;
            case class_1551.const_2450:
               return Settings.showNotOwnedItems;
            case class_1551.const_167:
               return Settings.showLowHpWarnings;
            default:
               return false;
         }
      }
      
      public static function method_508(param1:int) : int
      {
         switch(param1)
         {
            case class_1551.const_3264:
               return 0;
            case class_1551.const_1443:
               return Settings.qualityBackground.value;
            case class_1551.const_520:
               return Settings.qualityPoizone.value;
            case class_1551.const_1879:
               return Settings.qualityShip.value;
            case class_1551.const_1788:
               return Settings.qualityEngine.value;
            case class_1551.const_3225:
               return Settings.qualityCollectable.value;
            case class_1551.const_2691:
               return Settings.qualityAttack.value;
            case class_1551.const_1180:
               return Settings.qualityEffect.value;
            case class_1551.const_43:
               return Settings.qualityExplosion.value;
            default:
               return 0;
         }
      }
      
      public static function method_4513(param1:int) : int
      {
         switch(param1)
         {
            case class_1551.const_3273:
               return Settings.qualityPresetting;
            default:
               return 0;
         }
      }
      
      public static function method_3423(param1:int, param2:String) : void
      {
         var _loc3_:Dictionary = method_3718();
         if(_loc3_[param1] != null)
         {
            class_368.getInstance().method_1606([_loc3_[param1],param2]);
         }
      }
      
      private static function method_3718() : Dictionary
      {
         if(var_1009 == null)
         {
            var_1009 = new Dictionary();
            var_1009[class_1551.const_2283] = class_74.const_1036;
            var_1009[class_1551.const_1567] = class_74.const_2341;
            var_1009[class_1551.const_981] = class_74.const_2489;
            var_1009[class_1551.const_2425] = class_74.const_3318;
            var_1009[class_1551.const_2101] = class_74.const_1767;
            var_1009[class_1551.const_398] = class_74.const_108;
            var_1009[class_1551.const_416] = class_74.const_1426;
            var_1009[class_1551.const_1094] = class_74.const_3097;
            var_1009[class_1551.const_2338] = class_74.const_469;
            var_1009[class_1551.const_2936] = class_74.const_1585;
            var_1009[class_1551.const_1037] = class_74.const_1940;
            var_1009[class_1551.const_2846] = class_74.const_3062;
            var_1009[class_1551.const_348] = class_74.SET_DISPLAY_MINIMAP_BACKGROUND_IMAGE;
            var_1009[class_1551.const_2694] = class_74.const_2928;
            var_1009[class_1551.const_1280] = class_74.const_2397;
            var_1009[class_1551.const_1958] = class_74.const_1480;
            var_1009[class_1551.const_1938] = class_74.const_755;
            var_1009[class_1551.const_1680] = class_74.const_1872;
            var_1009[class_1551.const_3255] = class_74.const_2851;
            var_1009[class_1551.const_3088] = class_74.const_309;
            var_1009[class_1551.const_167] = class_74.const_2844;
            var_1009[class_1551.const_2092] = class_74.const_1850;
            var_1009[class_1551.const_1379] = class_74.const_1578;
            var_1009[class_1551.const_1240] = class_74.const_2629;
            var_1009[class_1551.const_1862] = class_74.const_1408;
            var_1009[class_1551.const_3264] = class_74.SET_RESOLUTION;
            var_1009[class_1551.const_3273] = class_74.const_1587;
            var_1009[class_1551.const_2919] = class_74.const_2869;
            var_1009[class_1551.const_1443] = class_74.const_1820;
            var_1009[class_1551.const_1879] = class_74.const_886;
            var_1009[class_1551.const_520] = class_74.const_2830;
            var_1009[class_1551.const_1788] = class_74.const_1627;
            var_1009[class_1551.const_3225] = class_74.const_2282;
            var_1009[class_1551.const_2691] = class_74.const_2022;
            var_1009[class_1551.const_1180] = class_74.const_1449;
            var_1009[class_1551.const_43] = class_74.const_1622;
            var_1009[class_1551.const_249] = class_74.const_1786;
            var_1009[class_1551.const_2831] = class_74.const_577;
            var_1009[class_1551.const_2152] = class_74.const_2692;
            var_1009[class_1551.const_2450] = class_74.const_1260;
         }
         return var_1009;
      }
      
      public function decorate(param1:class_131) : void
      {
         param1.addEventListener(SimpleWindowEvent.const_940,this.method_618);
         var _loc2_:class_93 = new class_93(this.guiManager,class_93.const_2709);
         this.method_888(class_185.const_3312,_loc2_,"setting_btn_display_tab",true);
         this.method_888(class_185.const_951,_loc2_,"setting_btn_gameplay_tab");
         this.method_888(class_185.const_2423,_loc2_,"setting_btn_interface_tab");
         this.method_888(class_185.const_3067,_loc2_,"setting_btn_sound_tab");
         this.method_888(class_185.const_3292,_loc2_,"setting_btn_keyboard_tab");
         this.method_489(_loc2_);
         param1.method_1655(_loc2_);
         _loc2_.method_5942(new Point(20,45));
         _loc2_.method_558();
         this.method_4183(class_93.const_1858,class_185.const_3312,param1,class_9.var_2751.settingsDisplay.settingField,true);
         this.method_4183(class_93.const_1563,class_185.const_951,param1,class_9.var_2751.settingsGameplay.settingField,false);
         this.method_4183(class_93.const_1653,class_185.const_2423,param1,class_9.var_2751.settingsInterface.settingField,false);
         this.method_4183(class_93.const_2512,class_185.const_3067,param1,class_9.var_2751.settingsSound.settingField,false);
         this.method_4183(class_93.const_3293,class_185.const_3292,param1,class_9.var_2751.settingsKeyBoard.settingField,false);
         var _loc3_:class_93 = new class_93(this.guiManager,class_93.const_2593);
         var _loc4_:class_218;
         (_loc4_ = new class_218(class_185.var_2867,class_88.getItem("sett_save"),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_5371);
         _loc3_.addElement(_loc4_,class_93.const_3298);
         var _loc5_:class_218;
         (_loc5_ = new class_218(class_185.var_3921,class_88.getItem("btn_cancel"),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_1550);
         _loc3_.addElement(_loc5_,class_93.const_2568);
         var _loc6_:class_218;
         (_loc6_ = new class_218(class_185.var_1536,class_88.getItem("btn_reset"),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_5015);
         _loc3_.addElement(_loc6_,class_93.const_2568);
         param1.method_1655(_loc3_);
         _loc3_.method_5942(new Point(30,Number(param1.resizeDimension.y) - 11));
         _loc3_.method_558();
      }
      
      private function method_4183(param1:int, param2:int, param3:class_131, param4:XMLList, param5:Boolean = true) : class_93
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:Boolean = false;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc6_:int = 0;
         _loc7_ = new class_93(this.guiManager,param1);
         param3.method_2440(param1);
         param3.method_1655(_loc7_);
         if(param1 == class_93.const_3293)
         {
            this.scrollContainer = new class_1549(this.guiManager,param1);
            this.scrollContainer.method_3664().y = this.scrollContainer.method_3664().y + 20;
            this.scrollContainer.method_3664().setSize(400,350);
            _loc7_.addChild(this.scrollContainer.method_3664());
         }
         _loc7_.method_5942(new Point(10,75));
         _loc7_.method_558();
         this.var_2193[param2] = _loc7_;
         _loc7_.visible = param5;
         _loc20_ = "noParam";
         for each(_loc24_ in param4)
         {
            _loc8_ = parseInt(_loc24_.@id);
            _loc9_ = _loc24_.@type;
            _loc10_ = _loc24_.@key;
            _loc12_ = _loc24_.@align;
            _loc11_ = _loc24_.@tooltipKey;
            _loc15_ = ParserUtility.parseBooleanFromString(_loc24_.@isAdvanced);
            _loc19_ = _loc24_.@commandID;
            _loc20_ = _loc24_.@param;
            switch(_loc9_)
            {
               case "slider":
                  _loc17_ = [];
                  for each(_loc16_ in _loc24_.item)
                  {
                     _loc13_ = int(_loc16_.@value);
                     _loc14_ = _loc16_.@languageKey;
                     _loc17_[_loc13_] = new class_1559(_loc13_,_loc14_);
                  }
                  this.var_2621 = new class_1548(_loc8_,_loc10_,_loc17_);
                  this.var_2621.y = _loc6_;
                  _loc7_.addElement(this.var_2621,class_93.const_2374);
                  _loc6_ += 60;
                  this.var_2621.resetSetting();
                  this.var_2621.slider.addEventListener(SliderEvent.CHANGE,this.method_4331);
                  if(ParserUtility.parseBooleanFromString(_loc24_.@showAdvancedBtn))
                  {
                     this.var_2124 = new class_218(class_185.const_2148,class_88.getItem("btn_advanced"),this.var_2186.getEmbeddedMovieClip("button1"));
                     this.var_2124.addEventListener(MouseEvent.CLICK,this.method_5748);
                     this.var_2124.y = _loc6_;
                     _loc7_.addElement(this.var_2124,class_93.const_2374);
                     _loc6_ += 25;
                     this.var_3484 = new class_219(340,40,new TextFormat(),"");
                     (_loc29_ = new TextFormat(class_18.const_2667.font,class_18.const_662,16777215)).align = TextFormatAlign.LEFT;
                     (_loc30_ = this.var_3484.textField).defaultTextFormat = _loc29_;
                     this.var_3484.method_1455(class_88.getItem("info_advanced"));
                     this.var_3484.y = _loc6_;
                     _loc7_.addElement(this.var_3484);
                     _loc6_ += 34;
                  }
                  break;
               case "simpleslider":
                  (_loc25_ = new class_1550(_loc8_,_loc10_,this.method_96)).y = _loc6_;
                  if(_loc8_ == class_1551.const_981)
                  {
                     _loc25_.method_286(Settings.musicVolume);
                  }
                  else if(_loc8_ == class_1551.const_2101)
                  {
                     _loc25_.method_286(Settings.soundVolume);
                  }
                  else if(_loc8_ == class_1551.const_960)
                  {
                     _loc25_.method_286(Settings.voiceVolume);
                  }
                  this.var_2137[_loc8_] = _loc25_;
                  _loc7_.addElement(_loc25_,class_93.const_2374);
                  _loc6_ += 60;
                  break;
               case "combobox":
                  _loc17_ = [];
                  for each(_loc16_ in _loc24_.item)
                  {
                     _loc13_ = int(_loc16_.@value);
                     _loc14_ = _loc16_.@languageKey;
                     if(!(_loc10_ == "setting_quality_background" && true && _loc13_ == Settings.QUALITY_HIGH))
                     {
                        _loc17_.push(new class_1558(_loc13_,class_88.getItem(_loc14_)));
                     }
                  }
                  _loc21_ = new class_1556(_loc8_,_loc10_,_loc17_,this.method_6390(_loc11_),_loc15_);
                  switch(_loc12_)
                  {
                     case "right":
                        _loc7_.addElement(_loc21_,class_93.const_2568,40);
                        break;
                     case "left":
                     default:
                        _loc21_.y = _loc6_;
                        _loc7_.addElement(_loc21_,class_93.const_2374);
                        _loc6_ += 48;
                  }
                  _loc21_.resetSetting();
                  if(_loc15_)
                  {
                     _loc21_.addEventListener(Event.CHANGE,this.method_2114);
                  }
                  break;
               case "keyboard_row":
                  _loc26_ = 16777215;
                  if(int(_loc19_) == class_617.const_795)
                  {
                     if(!class_81.premium.value)
                     {
                        continue;
                     }
                     _loc26_ = 4488066;
                  }
                  (_loc27_ = new class_1552(_loc10_,_loc19_,_loc20_,this.method_996,this.var_2186.getEmbeddedMovieClip("button1"),_loc26_)).keyValuePair.keys = new <int>[-1];
                  this.var_2233.push(_loc27_);
                  _loc27_.y = _loc6_;
                  this.scrollContainer.addElement(_loc27_);
                  _loc6_ += _loc27_.height + 5;
                  _loc18_++;
                  break;
               case "header":
                  (_loc29_ = new TextFormat(class_18.const_2667.font,NaN,16777215)).underline = true;
                  _loc29_.bold = true;
                  _loc23_ = new class_219(150,20,_loc29_);
                  if(_loc12_ == "right")
                  {
                     _loc23_.x = 400 - Number(_loc23_.width) * 0.5 - 10;
                  }
                  else if(_loc12_ == "left")
                  {
                     _loc23_.x = 10;
                  }
                  else if(_loc12_ == "center")
                  {
                     _loc23_.textField.defaultTextFormat.align = TextFormatAlign.CENTER;
                     _loc23_.x = 200 - Number(_loc23_.width) * 0.5 + 10;
                  }
                  _loc23_.textField.text = class_88.getItem(_loc10_);
                  _loc7_.addElement(_loc23_);
                  break;
               case "button":
                  (_loc28_ = new class_218(_loc8_,class_88.getItem(_loc10_),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_6303);
                  _loc28_.y = _loc6_;
                  _loc6_ += 25;
                  _loc7_.addElement(_loc28_,class_93.const_2374);
                  break;
               case "checkbox":
                  (_loc22_ = new class_1553(_loc8_,_loc10_,this.guiManager,_loc11_,_loc15_)).y = _loc6_;
                  _loc7_.addElement(_loc22_,class_93.const_2374);
                  break;
            }
            _loc6_ += 25;
            if(_loc15_)
            {
               _loc22_.addEventListener(Event.CHANGE,this.method_2114);
            }
         }
         return _loc7_;
      }
      
      private function method_6303(param1:MouseEvent) : void
      {
         var _loc2_:class_218 = param1.currentTarget as class_218;
         switch(_loc2_.getType())
         {
            case class_1551.const_3231:
               this.method_3277();
               this.method_1550();
               break;
            case class_1551.const_807:
               this.method_4183(class_93.const_1858,class_185.const_3312,this.guiManager.method_468(GuiConstants.SETTINGS_WINDOW),class_9.var_2751.settingsDisplay3D.settingField,true);
         }
      }
      
      private function method_996(param1:MouseEvent) : void
      {
         var _loc2_:class_1552 = param1.currentTarget as class_1552;
         this.guiManager.method_6205(this.handleKeyDown,this.method_5367);
         var _loc3_:class_131 = this.guiManager.method_468(GuiConstants.POPUP_WINDOW);
         _loc3_.name = _loc2_.name;
      }
      
      private function method_5367(param1:MouseEvent) : void
      {
         this.method_5088();
      }
      
      private function method_5088() : void
      {
         var _loc1_:class_131 = this.guiManager.method_468(GuiConstants.POPUP_WINDOW);
         _loc1_.minimize(false);
         _loc1_.cleanup();
         this.guiManager.method_2624(GuiConstants.POPUP_WINDOW);
         this.guiManager.method_6185().stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
      }
      
      private function handleKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:String = this.method_1944(param1.keyCode);
         this.method_6124(param1.keyCode,_loc2_);
         this.method_5088();
      }
      
      private function method_1944(param1:int) : String
      {
         var _loc2_:String = "";
         if(false)
         {
            _loc2_ = "null";
         }
         else if(param1 > 111 && param1 <= 126)
         {
            _loc2_ = "F" + (param1 - 111).toString();
         }
         else
         {
            _loc2_ = class_88.getItem("keyboard_key_" + param1.toString());
            if(!_loc2_ || _loc2_ == "")
            {
               _loc2_ = String.fromCharCode(param1);
            }
         }
         return _loc2_;
      }
      
      private function method_6124(param1:int, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:String = this.guiManager.method_468(GuiConstants.POPUP_WINDOW).name;
         var _loc5_:int = 0;
         while(_loc5_ < this.var_2233.length)
         {
            if((_loc4_ = this.var_2233[_loc5_]).keyValuePair.keys[0] == param1 && _loc4_.name != _loc3_)
            {
               _loc4_.keyValuePair.keys = new <int>[-1];
               _loc4_.method_520 = const_526[_loc4_.keyValuePair.keys[0]];
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this.var_2233.length)
         {
            if((_loc4_ = this.var_2233[_loc5_]).name == _loc3_)
            {
               _loc4_.method_520 = param2;
               _loc4_.keyValuePair.keys = new <int>[param1];
            }
            _loc5_++;
         }
      }
      
      private function method_3503() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:KeyboardMapper = KeyboardMapper.getInstance();
         var _loc4_:int = 0;
         while(_loc4_ < this.var_2233.length)
         {
            _loc2_ = this.var_2233[_loc4_];
            if(!_loc2_.keyValuePair.args[0] || _loc2_.keyValuePair.args[0] == "")
            {
               _loc3_ = _loc1_.method_6497(_loc2_.keyValuePair.name);
            }
            else
            {
               _loc3_ = _loc1_.method_5293(_loc2_.keyValuePair.name,_loc2_.keyValuePair.args);
            }
            if(_loc3_.length > 0)
            {
               _loc2_.method_520 = this.method_1944(_loc3_[0]);
               _loc2_.keyValuePair.keys = _loc3_;
            }
            _loc4_++;
         }
      }
      
      private function method_3954() : void
      {
         var _loc1_:class_131 = this.guiManager.method_468(GuiConstants.SETTINGS_WINDOW);
         _loc1_.method_2440(class_93.const_3293);
         var _loc2_:* = this.var_1839 == class_185.const_3292;
         this.method_4183(class_93.const_3293,class_185.const_3292,_loc1_,class_9.var_2751.settingsKeyBoard.settingField,_loc2_);
      }
      
      private function method_2114(param1:Event) : void
      {
         if(true)
         {
            method_3423(class_1551.const_2919,String(1));
         }
         this.var_2621.method_1046("quality_custom");
      }
      
      public function method_1326() : void
      {
         (this.var_2137[class_1551.const_981] as class_1550).method_286(Settings.musicVolume);
         (this.var_2137[class_1551.const_2101] as class_1550).method_286(Settings.soundVolume);
         (this.var_2137[class_1551.const_960] as class_1550).method_286(Settings.voiceVolume);
      }
      
      private function method_4331(param1:SliderEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Slider = Slider(param1.target);
         if(false)
         {
            method_3423(class_1551.const_2919,String(0));
         }
         var _loc3_:class_93 = this.var_2193[class_185.const_3312];
         var _loc4_:Array = _loc3_.method_1864();
         var _loc5_:Array = this.qualityPresetting.getQualitySet(_loc2_.value);
         for each(_loc7_ in _loc5_)
         {
            for each(_loc6_ in _loc4_)
            {
               if(_loc6_.getID() == class_91.const_31)
               {
                  if(class_1553(_loc6_).typeID == _loc7_.typeID)
                  {
                     class_1553(_loc6_).switchChecked(_loc7_.value);
                  }
               }
               if(_loc6_.getID() == class_91.const_149)
               {
                  if(class_1556(_loc6_).type == _loc7_.typeID)
                  {
                     class_1556(_loc6_).setSelected(_loc7_.value);
                  }
               }
            }
         }
      }
      
      private function method_96(param1:SliderEvent) : void
      {
         var _loc2_:Slider = Slider(param1.target);
         if(_loc2_.name == class_1551.const_981.toString())
         {
            class_171.run(new class_200(false,Settings.soundVolume,_loc2_.value,Settings.voiceVolume,Settings.playCombatMusic),true);
            this.guiManager.method_707(null,true);
            class_82.method_2282();
         }
         else if(_loc2_.name == class_1551.const_2101.toString())
         {
            class_171.run(new class_200(false,_loc2_.value,Settings.musicVolume,Settings.voiceVolume,Settings.playCombatMusic),true);
            this.guiManager.method_707(null,true);
            class_82.method_2916();
         }
         else if(_loc2_.name == class_1551.const_960.toString())
         {
            class_171.run(new class_200(false,Settings.soundVolume,Settings.musicVolume,_loc2_.value,Settings.playCombatMusic),true);
            this.guiManager.method_707(null,true);
            class_82.method_2916();
         }
      }
      
      private function method_888(param1:int, param2:class_93, param3:String, param4:Boolean = false) : void
      {
         var _loc5_:class_218;
         (_loc5_ = new class_218(param1,class_88.getItem(param3),this.var_2186.getEmbeddedMovieClip("button1"))).selected = param4;
         _loc5_.addEventListener(MouseEvent.CLICK,this.method_3899);
         param2.addElement(_loc5_,class_93.const_2568);
         this.var_4094[param1] = _loc5_;
      }
      
      private function method_489(param1:class_93) : void
      {
         var _loc2_:class_91 = new class_91(class_91.const_38);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.lineStyle(1,8289918);
         _loc3_.graphics.moveTo(0,0);
         _loc3_.graphics.lineTo(380,0);
         _loc2_.addChild(_loc3_);
         _loc2_.y = 20;
         param1.addElement(_loc2_,class_93.const_2374,0);
      }
      
      private function method_3899(param1:MouseEvent) : void
      {
         this.var_1839 = (param1.currentTarget as class_218).getType();
         (this.var_4094[class_185.const_951] as class_218).selected = this.var_1839 == class_185.const_951;
         (this.var_4094[class_185.const_2423] as class_218).selected = this.var_1839 == class_185.const_2423;
         (this.var_4094[class_185.const_3312] as class_218).selected = this.var_1839 == class_185.const_3312;
         (this.var_4094[class_185.const_3067] as class_218).selected = this.var_1839 == class_185.const_3067;
         (this.var_4094[class_185.const_3292] as class_218).selected = this.var_1839 == class_185.const_3292;
         (this.var_2193[class_185.const_3292] as class_93).visible = this.var_1839 == class_185.const_3292;
         (this.var_2193[class_185.const_951] as class_93).visible = this.var_1839 == class_185.const_951;
         (this.var_2193[class_185.const_2423] as class_93).visible = this.var_1839 == class_185.const_2423;
         (this.var_2193[class_185.const_3312] as class_93).visible = this.var_1839 == class_185.const_3312;
         (this.var_2193[class_185.const_3067] as class_93).visible = this.var_1839 == class_185.const_3067;
      }
      
      private function method_618(param1:SimpleWindowEvent) : void
      {
         this.method_3954();
         this.method_5251();
         this.method_3503();
      }
      
      private function method_5748(param1:MouseEvent) : void
      {
         this.method_6327(!this.isAdvanced);
      }
      
      private function method_634() : void
      {
         this.method_6327(Settings.qualityCustomized);
      }
      
      private function method_6327(param1:Boolean) : void
      {
         var _loc4_:* = null;
         this.isAdvanced = param1;
         var _loc2_:class_93 = this.var_2193[class_185.const_3312];
         var _loc3_:Array = _loc2_.method_1864();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.getID() == class_91.const_31)
            {
               if(class_1553(_loc4_).isAdvanced)
               {
                  class_1553(_loc4_).show(param1);
               }
            }
            if(_loc4_.getID() == class_91.const_149)
            {
               if(class_1556(_loc4_).isAdvanced)
               {
                  class_1556(_loc4_).show(param1);
               }
            }
         }
         if(this.var_2124)
         {
            if(param1)
            {
               this.var_2124.method_4577 = class_88.getItem("btn_simple");
               this.var_3484.method_1455(class_88.getItem("info_simple"));
            }
            else
            {
               this.var_2124.method_4577 = class_88.getItem("btn_advanced");
               this.var_3484.method_1455(class_88.getItem("info_advanced"));
            }
         }
      }
      
      private function method_3277() : void
      {
         var _loc1_:ConfigModePopup = ConfigModePopup(class_57.getInstance().createWindow(class_57.const_663,class_57.const_2956));
         if(!this.facade.hasMediator(ConfigModePopupMediator.NAME))
         {
            this.facade.registerMediator(new ConfigModePopupMediator(_loc1_));
         }
         this.facade.sendNotification(GuiNotifications.MANAGE_MENUS_CONFIG_MODE,true);
      }
      
      private function method_5015(param1:MouseEvent) : void
      {
         var _loc2_:class_131 = this.guiManager.createWindow(GuiConstants.RESET_PROMPT_WINDOW,null,class_131.const_3085) as class_131;
         this.guiManager.method_6185().name_47.method_6313().addChild(_loc2_);
         var _loc3_:class_93 = new class_93(this.guiManager,class_93.const_1053);
         var _loc4_:class_219 = new class_219(280,80,new TextFormat(),"");
         var _loc5_:TextFormat;
         (_loc5_ = new TextFormat(class_18.const_2442.font,class_18.const_3317,16777215)).align = TextFormatAlign.CENTER;
         var _loc6_:TextField;
         (_loc6_ = _loc4_.textField).defaultTextFormat = _loc5_;
         _loc6_.embedFonts = class_18.var_3809;
         _loc6_.antiAliasType = AntiAliasType.ADVANCED;
         _loc6_.autoSize = TextFieldAutoSize.CENTER;
         _loc6_.wordWrap = true;
         _loc6_.multiline = true;
         _loc6_.width = 280;
         _loc6_.text = class_88.getItem("resetSettings");
         _loc3_.addElement(_loc4_);
         _loc3_.x = 16;
         _loc3_.y = 32;
         var _loc7_:class_218;
         (_loc7_ = new class_218(class_185.const_2597,class_88.getItem("dest_ok"),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_1264);
         _loc3_.addElement(_loc7_,class_93.const_1191);
         _loc7_.x -= _loc7_.width;
         var _loc8_:class_218;
         (_loc8_ = new class_218(class_185.const_2551,class_88.getItem("btn_cancel"),this.var_2186.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK,this.method_1790);
         _loc3_.addElement(_loc8_,class_93.const_2568);
         _loc2_.method_1655(_loc3_);
         _loc2_.method_1321(true);
      }
      
      private function method_1264(param1:MouseEvent) : void
      {
         this.guiManager.method_6185().method_6154().sendRequest(new class_783());
         class_59.call(class_59.const_2459,[false],System.exit,[0]);
      }
      
      private function method_1790(param1:MouseEvent) : void
      {
         this.var_4308.reset();
         this.method_1226();
      }
      
      private function method_1226() : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:class_131 = this.guiManager.method_468(GuiConstants.RESET_PROMPT_WINDOW);
         var _loc2_:class_93 = _loc1_.method_3694(class_93.const_1053);
         var _loc3_:Array = _loc2_.method_1864();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if((_loc5_ = _loc3_[_loc4_]).getID() == class_91.const_2623)
            {
               if((_loc6_ = class_218(_loc5_)).getID() == class_185.const_2597)
               {
                  _loc6_.removeEventListener(MouseEvent.CLICK,this.method_1264);
               }
               if(_loc6_.getID() == class_185.const_2551)
               {
                  _loc6_.removeEventListener(MouseEvent.CLICK,this.method_1790);
               }
            }
            _loc4_++;
         }
         this.guiManager.closeWindow(_loc1_);
      }
      
      private function method_5371(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         this.method_6450();
         for each(_loc2_ in this.var_2193)
         {
            _loc4_ = _loc2_.method_1864();
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if((_loc6_ = _loc4_[_loc5_]).getID() == class_91.const_748)
               {
                  class_1548(_loc6_).setSetting();
               }
               if(_loc6_.getID() == class_91.const_31)
               {
                  class_1553(_loc6_).setSetting();
               }
               if(_loc6_.getID() == class_91.const_149)
               {
                  class_1556(_loc6_).setSetting();
               }
               _loc5_++;
            }
         }
         _loc3_ = this.guiManager.method_468(GuiConstants.SETTINGS_WINDOW);
         _loc3_.dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1645));
         _loc3_.dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1791));
         _loc3_.dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_308));
         _loc3_.dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1954));
         _loc3_.dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1564));
         _loc3_.minimize();
      }
      
      private function method_6450() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         KeyboardMapper.getInstance().cleanup();
         for each(_loc2_ in this.var_2233)
         {
            _loc1_ = _loc2_.keyValuePair;
            this.var_4308.method_2803(_loc1_.keys[0],_loc1_.args,_loc1_.name);
            this.var_821.method_2039(_loc1_);
         }
         this.var_821.method_1900();
         KeyboardMapper.getInstance().method_1900(this.var_4308);
         this.var_4308.reset();
      }
      
      private function method_1550(param1:MouseEvent = null) : void
      {
         this.var_4308.reset();
         class_171.method_1172();
         this.guiManager.method_468(GuiConstants.SETTINGS_WINDOW).minimize();
      }
      
      private function method_6390(param1:String) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case "ttip_setting_quality_background":
               if(true)
               {
                  _loc2_ = class_88.getItem("ttip_setting_quality_background") + "\n" + class_88.getItem("ttip_setting_quality_high_option_unsupported_gpu");
                  break;
               }
               _loc2_ = class_88.getItem(param1);
               break;
            case "":
               break;
            default:
               _loc2_ = class_88.getItem(param1);
         }
         return _loc2_;
      }
      
      private function method_5251() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         for each(_loc1_ in this.var_2193)
         {
            _loc2_ = _loc1_.method_1864();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if((_loc4_ = _loc2_[_loc3_]).getID() == class_91.const_748)
               {
                  class_1548(_loc4_).resetSetting();
               }
               if(_loc4_.getID() == class_91.const_31)
               {
                  class_1553(_loc4_).resetSetting();
               }
               if(_loc4_.getID() == class_91.const_149)
               {
                  class_1556(_loc4_).resetSetting();
               }
               _loc3_++;
            }
         }
         this.method_634();
      }
      
      private function get facade() : class_62
      {
         return class_62.getInstance();
      }
   }
}
