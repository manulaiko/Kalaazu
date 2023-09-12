package net.bigpoint.darkorbit.gui {

import com.bigpoint.utils.class_122;
import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import fl.controls.TextArea;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.SecurityErrorEvent;
import flash.filters.GlowFilter;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.system.SecurityDomain;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.utils.Dictionary;
import flash.utils.setTimeout;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.vo.class_186;
import net.bigpoint.darkorbit.gui.windows.class_192;
import net.bigpoint.darkorbit.gui.windows.class_193;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
import net.bigpoint.darkorbit.mvc.gui.windows.WindowCreationVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.net.class_113;
import net.bigpoint.darkorbit.net.class_53;
import net.bigpoint.darkorbit.net.class_59;
import net.bigpoint.darkorbit.net.class_74;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_14.class_52;

import package_17.class_62;

import package_22.class_169;
import package_22.class_198;
import package_22.class_206;
import package_22.class_222;

import package_27.class_82;

import package_28.EventStreamClient;

import package_30.class_130;
import package_30.class_162;
import package_30.class_179;
import package_30.class_185;
import package_30.class_195;
import package_30.class_208;
import package_30.class_209;
import package_30.class_212;
import package_30.class_217;
import package_30.class_218;
import package_30.class_219;
import package_30.class_220;
import package_30.class_91;

import package_33.class_183;
import package_33.class_93;

import package_36.class_184;
import package_36.class_207;

import package_38.class_163;
import package_38.class_164;
import package_38.class_166;
import package_38.class_174;
import package_38.class_177;
import package_38.class_182;
import package_38.class_191;
import package_38.class_199;
import package_38.class_200;

import package_39.class_100;

import package_40.CLILog;

import package_44.GroupSystemNotification;

import package_46.class_131;

import package_62.ChatMediator;

import package_63.ChatNotifications;
import package_63.class_224;

import package_64.class_171;

import package_65.class_173;
import package_65.class_203;
import package_65.class_214;

import package_66.class_175;

import package_67.AbilitiesModel;
import package_67.class_204;

import package_68.class_178;
import package_68.class_211;
import package_68.class_216;

import package_69.class_181;

import package_70.SimpleWindowEvent;

import package_71.class_189;

import package_72.class_190;

import package_73.class_196;

import package_74.class_197;
import package_74.class_205;

import package_75.class_201;

import package_76.class_215;

import package_77.QualityNotification;

import package_78.class_225;

import package_9.ResourceManager;
import package_9.class_50;

public class class_58 implements class_52 {

    public static var instance: class_58;


    private var var_675: class_62;

    private var var_1289: class_39;

    private var var_756: Boolean;

    private var main: class_9;

    public var var_296: class_204;

    public var var_396: AbilitiesModel;

    private var var_2094: Loader;

    private var var_2653: Boolean;

    private var var_3672: int = 0;

    private var var_186: MovieClip;

    private var var_3018: Bitmap;

    private var var_3713: Boolean;

    private var var_4784: Boolean = true;

    private var var_4522: Boolean;

    private var var_2853: CLILog;

    private var var_4484: Boolean;

    private var var_2301: TextArea;

    private var var_916: Boolean = false;

    private var var_3027: Dictionary;

    private var var_320: Array;

    private var var_503: Vector.<class_176>;

    private var var_2206: Array;

    private var var_2016: class_175;

    private var var_2835: class_55;

    private var var_592: class_213;

    public var var_4160: Boolean;

    private var name_134: Number = 0;

    private var var_2871: Number = 0;

    private var var_721: Boolean = false;

    private var var_4476: Boolean;

    private var var_1467: Boolean;

    private var var_4452: Boolean;

    private var var_2397: Boolean;

    public var var_1259: class_225;

    public function class_58(param1: class_9) {
        this.var_2301 = new TextArea();
        this.var_3027 = new Dictionary();
        this.var_320 = [];
        this.var_503 = new Vector.<class_176>();
        this.var_2206 = [];
        this.var_1259 = new class_225();
        super();
        this.main = param1;
        instance = this;
        this.method_4649();
        class_50.method_5621(this);
        this.method_1441();
        this.var_675 = class_62.getInstance();
    }

    public function updateTimer(param1: Number): void {
        this.name_134 += param1;
        if (this.name_134 > 39) {
            this.name_134 = 0;
        }
        if (this.var_721) {
            this.var_2871 += param1;
            if (this.var_2871 > 1199) {
                this.onTimerComplete();
                this.var_2871 = 0;
            }
        }
    }

    public function method_5249(param1: Object = null): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: class_90 = this.main.name_47.map;
        if (_loc2_ != null) {
            _loc2_.effects.method_2947(class_201.ID);
            _loc3_ = _loc2_.hero;
            if (_loc3_ == null) {
                return;
            }
            _loc2_.effects.method_4748(_loc3_.id);
            _loc4_ = class_198.method_1020(class_222.const_273, _loc3_.method_426.explosionTypeID);
            _loc2_.effects.method_269(new class_184(_loc3_.x, _loc3_.y, _loc3_.z, _loc4_, _loc3_));
            class_82.playSoundEffect(class_126.const_2472);
            this.main.name_47.method_370(16777215, 0.75, 0.25, 2);
            _loc2_.effects.method_269(new class_207(0, _loc3_.position.x, _loc3_.position.y, true));
            this.main.name_47.shakeScreen();
            this.main.name_47.method_1772.method_5917();
            _loc2_.method_1203().method_4323(class_81.userID);
        }
        TweenMax.delayedCall(3, this.method_6078);
    }

    public function method_6078(): void {
        class_82.playSoundEffect(class_126.const_3018);
    }

    public function method_5056(param1: String, param2: String, param3: String): void {
        this.main.method_4489().method_5921();
        var _loc4_: class_100;
        if ((_loc4_ = class_100.getInstance()).method_503) {
            _loc4_.method_4332();
        }
        _loc4_.method_5056(this.main, param1, param2, param3);
    }

    public function method_4593(): void {
        class_59.call(class_59.const_339, [], System.exit, [0]);
    }

    private function method_4649(): void {
    }

    public function method_4207(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null) {
            _loc2_.method_5591 = true;
            _loc2_.visible = false;
        }
    }

    public function method_2004(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null && Boolean(_loc2_.maximized) && !_loc2_.isTweening) {
            _loc2_.minimize();
        }
    }

    public function method_1875(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null && !_loc2_.maximized && !_loc2_.isTweening) {
            _loc2_.maximize();
        }
    }

    public function method_380(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null) {
            _loc2_.method_5591 = false;
            _loc2_.visible = true;
        }
    }

    public function method_4610(param1: String): Boolean {
        var _loc2_: class_131 = this.method_468(param1);
        if (Boolean(_loc2_) && Boolean(_loc2_.method_5591)) {
            return true;
        }
        return false;
    }

    public function method_5163(param1: class_39): void {
        this.var_1289 = param1;
    }

    public function method_144(): void {
        if (this.var_2016) {
            this.var_2016.method_175();
        }
    }

    public function method_1441(): void {
        if (this.var_2835 == null) {
            this.var_2835 = new class_55(Settings.instantLogViewConfig);
            this.var_2835.mouseChildren = false;
            this.var_2835.mouseEnabled = false;
        }
        if (this.main.name_47.method_608) {
            this.main.name_47.method_608.addChild(this.var_2835);
        }
    }

    public function method_2474(): void {
        if (this.var_592 == null) {
            this.var_592 = new class_213();
            this.var_592.mouseChildren = false;
            this.var_592.mouseEnabled = false;
        }
        if (!this.main.name_47.method_608.contains(this.var_592)) {
            this.var_592.x = Number(this.var_592.itemWidth) * -0.5;
            this.var_592.y = 0;
            this.method_2003().addChild(this.var_592);
        }
    }

    public function method_5665(param1: Array): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        if (this.method_4610(GuiConstants.SPACEBALL_WINDOW)) {
            this.method_380(GuiConstants.SPACEBALL_WINDOW);
        }
        var _loc2_: class_131 = this.method_468(GuiConstants.SPACEBALL_WINDOW);
        if (_loc2_ == null) {
            _loc2_ = this.createWindow(GuiConstants.SPACEBALL_WINDOW) as class_131;
            _loc3_ = new class_93(this, class_93.const_752);
            _loc4_ = 0;
            _loc3_.x = 12;
            _loc3_.y = 35;
            _loc5_ = 0;
            while (_loc5_ < param1.length) {
                (_loc6_ = new class_195(this, _loc5_ + 1)).method_3125(param1[_loc5_]);
                _loc3_.addElement(_loc6_, class_93.const_2374);
                _loc6_.x = _loc4_;
                _loc4_ += _loc6_.method_5979().width;
                _loc5_++;
            }
            _loc2_.method_1655(_loc3_);
        } else {
            this.method_2694(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 1, param1[0]);
            this.method_2694(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 2, param1[1]);
            this.method_2694(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 3, param1[2]);
        }
    }

    public function method_2624(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null) {
            this.closeWindow(_loc2_, false);
        }
    }

    public function method_5092(): void {
        var _loc1_: class_131 = this.createWindow(GuiConstants.AUTOSTART_WARNING_WINDOW, this.main.name_47.method_6313(), class_131.const_3085) as class_131;
        _loc1_.method_1321(true);
        var _loc2_: class_93 = new class_93(this, class_93.const_3168);
        var _loc3_: class_219 = new class_219(Number(_loc1_.resizeDimension.x) - 32, int(class_18.const_1629.size), new TextFormat(class_18.const_1629.font, class_18.const_1629.size, 16777215), class_88.getItem("msg_autostart_warning"));
        _loc3_.textField.autoSize = TextFieldAutoSize.CENTER;
        _loc3_.textField.wordWrap = true;
        _loc3_.textField.multiline = true;
        _loc2_.addElement(_loc3_);
        var _loc4_: class_218;
        (_loc4_ = new class_218(class_185.const_2597, class_88.getItem("dest_ok"), this.var_1289.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.handleCloseButtonClick);
        _loc2_.addElement(_loc4_, class_93.const_1191);
        _loc2_.method_5942(new Point(15, 30));
        _loc2_.method_558();
        _loc1_.method_1655(_loc2_);
        _loc1_.autoSize();
    }

    public function method_3007(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.AUTOSTART_WARNING_WINDOW);
        if (_loc1_ != null) {
            _loc2_ = _loc1_.method_3694(class_93.const_3168);
            _loc3_ = _loc2_.method_89(class_91.const_2623) as class_218;
            _loc3_.removeEventListener(MouseEvent.CLICK, this.handleCloseButtonClick);
            this.closeWindow(_loc1_);
        }
    }

    private function handleCloseButtonClick(param1: Event): void {
        this.method_3007();
    }

    public function method_2814(): Boolean {
        var _loc1_: class_131 = this.method_468(GuiConstants.INVASION_WINDOW);
        return _loc1_ == null ? false : true;
    }

    public function method_3927(param1: Array): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (this.method_468(GuiConstants.INVASION_WINDOW) == null) {
            _loc2_ = this.createWindow(GuiConstants.INVASION_WINDOW) as class_131;
            _loc3_ = new class_93(this, class_93.const_2114);
            _loc4_ = 0;
            _loc3_.x = 12;
            _loc3_.y = 35;
            _loc5_ = 0;
            while (_loc5_ < param1.length) {
                (_loc7_ = new class_212(this, _loc5_ + 1)).method_3125(param1[_loc5_]);
                _loc3_.addElement(_loc7_, class_93.const_2374);
                _loc7_.x = _loc4_;
                _loc4_ += _loc7_.method_5979().width;
                _loc5_++;
            }
            (_loc6_ = new class_219(_loc2_.resizeDimension.x, 20, new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215), null, TextFormatAlign.LEFT)).y = 40;
            _loc3_.addElement(_loc6_, class_93.const_2374);
            _loc2_.method_1655(_loc3_);
        }
    }

    public function method_4691(param1: Number): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.INVASION_WINDOW);
        var _loc3_: class_219 = class_219(_loc2_.method_3694(class_93.const_2114).method_89(class_91.const_586));
        _loc3_.method_1455(class_88.getItem("attack_wave_x").replace("%COUNT%", class_122.method_98(param1)));
    }

    public function method_2694(param1: String, param2: int, param3: int, param4: int): void {
        var _loc5_: class_179;
        if ((_loc5_ = this.method_785(param1, param2, param3)) != null) {
            _loc5_.method_3125(param4);
        }
    }

    public function method_785(param1: String, param2: int, param3: int): class_179 {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc4_: class_131;
        if ((_loc4_ = this.method_468(param1)) != null) {
            _loc5_ = _loc4_.method_3694(param2).method_1864();
            for each(_loc6_ in _loc5_) {
                if (_loc6_.method_5773() == param3) {
                    return _loc6_;
                }
            }
        }
        return null;
    }

    public function method_5807(param1: int, param2: int): void {
        var _loc3_: class_131 = this.method_468(GuiConstants.SPACEBALL_WINDOW);
        if (!_loc3_) {
            this.method_5665([0, 0, 0]);
        }
        class_195(this.method_785(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 1)).setSpeed(0);
        class_195(this.method_785(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 2)).setSpeed(0);
        class_195(this.method_785(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, 3)).setSpeed(0);
        if (param1 != 0) {
            class_195(this.method_785(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, param1)).setSpeed(param2);
        }
    }

    public function method_5457(param1: class_130): void {
        this.method_527();
    }

    public function method_5352(param1: class_130): void {
        this.var_2206[param1.getID()] = param1;
    }

    public function method_4329(): void {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        var _loc2_: class_173 = this.method_5098();
        _loc2_.update();
        _loc2_.x = Number(_loc1_.method_468().width) - Number(_loc2_.width) - 26;
    }

    public function method_5103(param1: uint): Boolean {
        var _loc2_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        var _loc3_: class_173 = this.method_5098();
        var _loc4_: Boolean = Boolean(_loc3_.method_6351(param1));
        _loc3_.x = Number(_loc2_.method_468().width) - Number(_loc3_.width) - 0;
        if (!_loc2_.maximized && _loc4_ && !this.guiProxy.hideAllWindows) {
            setTimeout(_loc2_.maximize, 1000, false, true);
        }
        return _loc4_;
    }

    public function method_4497(param1: uint): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        var _loc3_: class_173 = this.method_5098();
        _loc3_.method_3515(param1);
        _loc3_.x = Number(_loc2_.method_468().width) - Number(_loc3_.width) - 0;
    }

    public function method_5503(): class_214 {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        return class_214(_loc1_.method_3694(class_93.const_1827));
    }

    public function method_1919(): class_189 {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        return class_189(_loc1_.method_3694(class_93.const_1156));
    }

    public function method_1092(): class_165 {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        return _loc1_.method_3694(class_93.const_1574) as class_165;
    }

    public function method_5098(): class_173 {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        return class_173(_loc1_.method_3694(class_93.const_3185));
    }

    public function method_1322(): void {
        this.method_5503().method_1322();
        this.method_1919().method_1322();
    }

    public function method_5065(): void {
        this.method_5503().clearContent();
    }

    public function method_2466(): void {
        this.method_1919().clearContent();
    }

    public function method_636(param1: int, param2: Boolean = false): void {
        this.method_5503().method_2655(param1, param2);
    }

    private function onTimerComplete(): void {
        this.var_4784 = true;
        this.var_721 = false;
    }

    public function method_3624(): void {
        if (!this.var_4784) {
            return;
        }
        this.method_2148(GuiConstants.SPACEMAP_WINDOW);
        if (this.var_3713) {
            this.var_3713 = false;
        } else {
            this.var_3713 = true;
        }
        this.method_615();
    }

    private function method_2148(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ == null) {
            return;
        }
        if (this.var_3713) {
            if (!_loc2_.maximized) {
                _loc2_.maximize();
            }
        } else if (_loc2_.maximized) {
            _loc2_.minimize();
        }
    }

    public function method_615(): void {
        this.var_4784 = false;
        this.var_721 = true;
    }

    public function method_2001(param1: String, param2: int): void {
        var _loc4_: * = null;
        var _loc3_: class_90 = this.main.name_47.map;
        if (_loc3_ != null) {
            if ((_loc4_ = _loc3_.method_1203().method_3338() as class_86) != null) {
                if (param2 == 0) {
                    if (param1 == "R") {
                        this.writeToLog(class_88.getItem("emptyrok"));
                        class_59.call(class_59.const_2242, [class_59.const_1395]);
                    } else if (param1 == "L") {
                        if (_loc4_ != null) {
                            this.writeToLog(class_88.getItem("attstop").replace(class_53.var_4310, _loc4_.info.name_148.value));
                        }
                        class_59.call(class_59.const_2242, [class_59.const_2232]);
                        this.writeToLog(class_88.getItem("emptybat"));
                    }
                } else if (param1 == "R") {
                    this.writeToLog(class_88.getItem("chgrokmanual"));
                } else if (param1 == "L") {
                    if (_loc4_ != null) {
                        this.writeToLog(class_88.getItem("attstop").replace(class_53.var_4310, _loc4_.info.name_148.value));
                    }
                    this.writeToLog(class_88.getItem("chgbatmanual"));
                }
            }
        }
    }

    public function method_4761(param1: String): void {
        if (this.var_592) {
            this.var_592.method_4900(param1);
        }
    }

    public function writeToLog(param1: String, param2: String = "ST"): void {
        if (this.var_2835 != null && param2 != class_187.const_413) {
            this.method_6055(param1);
        }
        this.name_59(param1);
    }

    public function method_6055(param1: String, param2: String = "ST"): void {
        this.var_2835.method_4900(param1, class_187.method_4915(param2));
    }

    public function name_59(param1: String): void {
        var _loc2_: class_226 = new class_226(param1);
        this.var_320.push(_loc2_);
        if (this.var_320.length > 25) {
            this.var_320.shift();
            this.method_3428();
        } else {
            this.method_3090(param1, true);
        }
    }

    private function method_3428(): void {
        var _loc3_: * = null;
        var _loc1_: * = "";
        var _loc2_: int = 0;
        while (_loc2_ < this.var_320.length) {
            _loc3_ = this.var_320[_loc2_];
            if (this.var_916) {
                _loc1_ += _loc3_.method_3393();
            } else {
                _loc1_ = _loc1_ + _loc3_.method_3393() + "\n";
            }
            _loc2_++;
        }
        this.method_3090(_loc1_);
    }

    private function method_3090(param1: String, param2: Boolean = false): void {
        if (this.var_916) {
            if (param2) {
                this.var_2301.htmlText += param1;
            } else {
                this.var_2301.htmlText = param1;
            }
        } else if (param2) {
            this.var_2301.text = this.var_2301.text + "\n" + param1;
        } else {
            this.var_2301.text = param1;
        }
        this.var_2301.verticalScrollPosition = this.var_2301.maxVerticalScrollPosition;
    }

    public function method_4102(param1: Vector.<class_186>): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.BOOSTER_WINDOW) || this.method_6163();
        if (param1.length == 0) {
            this.closeWindow(_loc2_);
            this.method_1705(_loc2_.id);
            return;
        }
        this.method_4741(param1, _loc2_);
    }

    private function method_4741(param1: Vector.<class_186>, param2: class_131): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc3_: class_93 = param2.method_3694(class_93.const_3034);
        var _loc4_: Vector.<class_130> = new Vector.<class_130>();
        this.method_5968(param1, _loc3_);
        for each(_loc6_ in param1) {
            _loc9_ = class_198.var_1757[_loc6_.var_2303];
            if (!(_loc5_ = _loc3_.method_89(_loc9_.getInfoFieldID()) as class_130)) {
                if ((_loc11_ = this.method_1262(_loc9_.getInfoFieldID())) != null) {
                    _loc10_ = int(_loc11_.var_3041);
                } else {
                    _loc10_ = 0;
                }
                _loc12_ = class_39(ResourceManager.name_15.getFinisher("ui"));
                _loc13_ = _loc9_.getResKey();
                _loc14_ = _loc12_.getEmbeddedBitmapData(_loc13_);
                _loc5_ = new class_130(this, _loc9_.getInfoFieldID(), new Bitmap(_loc14_), -1, [_loc9_.method_1236()], null, _loc10_);
            }
            _loc5_.method_2330(_loc6_.tooltip);
            _loc5_.method_4984(_loc6_.var_561, 100, false);
            _loc5_.method_2518(_loc6_.var_561 + " %");
            _loc4_.push(_loc5_);
        }
        _loc3_.removeAllElements();
        _loc7_ = 0;
        while (_loc7_ < _loc4_.length) {
            _loc3_.addElement(_loc4_[_loc7_], class_93.const_3298);
            _loc7_++;
        }
        var _loc8_: int = _loc3_.height + 32;
        param2.setSize(110, _loc8_);
    }

    private function method_5968(param1: Vector.<class_186>, param2: class_93): void {
        var _loc5_: Boolean = false;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc3_: Array = param2.method_1864();
        var _loc4_: Vector.<int> = new Vector.<int>();
        for each(_loc7_ in _loc3_) {
            _loc5_ = false;
            _loc6_ = int(_loc7_.getID());
            for each(_loc9_ in param1) {
                if (_loc6_ == class_206(class_198.var_1757[_loc9_.var_2303]).getInfoFieldID()) {
                    _loc5_ = true;
                }
            }
            if (!_loc5_) {
                _loc4_.push(_loc6_);
            } else {
                _loc7_.x = 0;
                _loc7_.y = 0;
                _loc7_.updateView();
            }
        }
        for each(_loc8_ in _loc4_) {
            param2.method_591(_loc8_);
        }
    }

    private function method_6163(): class_131 {
        var _loc1_: class_131 = this.createWindow(GuiConstants.BOOSTER_WINDOW) as class_131;
        var _loc2_: class_93 = new class_93(this, class_93.const_3034);
        _loc2_.x = 15;
        _loc2_.y = 38;
        _loc1_.method_1655(_loc2_);
        return _loc1_;
    }

    public function method_4765(): class_131 {
        var _loc1_: class_131 = this.createWindow(GuiConstants.SCOREEVENT_WINDOW) as class_131;
        var _loc2_: class_188 = new class_188(this);
        _loc2_.decorate(_loc1_);
        return _loc1_;
    }

    public function method_840(): void {
        this.updateInfoField(GuiConstants.SCOREEVENT_WINDOW, class_93.const_2070, class_91.const_1436);
        this.updateInfoField(GuiConstants.SCOREEVENT_WINDOW, class_93.const_2926, class_91.const_276);
        this.updateInfoField(GuiConstants.SCOREEVENT_WINDOW, class_93.const_809, class_91.const_24);
        this.updateInfoField(GuiConstants.SCOREEVENT_WINDOW, class_93.const_1521, class_91.const_2260);
    }

    public function method_5740(): class_131 {
        return this.createWindow(GuiConstants.HIGH_SCORE_GATE_WINDOW) as class_131;
    }

    public function method_3641(): void {
        this.updateInfoField(GuiConstants.HIGH_SCORE_GATE_WINDOW, class_93.const_2493, class_91.const_1354);
        this.updateInfoField(GuiConstants.HIGH_SCORE_GATE_WINDOW, class_93.const_565, class_91.const_2921);
        this.updateInfoField(GuiConstants.HIGH_SCORE_GATE_WINDOW, class_93.const_2156, class_91.const_948);
    }

    public function method_1917(param1: int): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.RANKED_HUNT_EVENT_WINDOW);
        var _loc3_: class_190 = class_81.var_121.var_3580[param1] as class_190;
        if (_loc3_ == null) {
            if (_loc2_ != null) {
                this.method_2624(GuiConstants.RANKED_HUNT_EVENT_WINDOW);
            }
        }
        if (_loc2_ == null) {
            this.createWindow(GuiConstants.RANKED_HUNT_EVENT_WINDOW);
        }
        this.method_6204();
    }

    private function method_6204(): void {
        this.updateInfoField(GuiConstants.RANKED_HUNT_EVENT_WINDOW, class_93.const_1784, class_91.const_1504);
        this.updateInfoField(GuiConstants.RANKED_HUNT_EVENT_WINDOW, class_93.const_1863, class_91.const_840);
    }

    public function method_4080(param1: int): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.HIGH_SCORE_GATE_WINDOW);
        if (_loc2_ == null) {
            this.createWindow(GuiConstants.HIGH_SCORE_GATE_WINDOW);
        }
    }

    public function method_3147(): void {
        var _loc1_: class_131 = this.method_1626();
        var _loc2_: class_203 = this.main.method_2732().method_345;
        var _loc3_: class_214 = this.method_5503();
        _loc3_.quest = _loc2_;
        _loc3_.update();
        _loc3_.method_1707();
        var _loc4_: class_173;
        (_loc4_ = this.method_5098()).x = Number(_loc1_.method_468().width) - Number(_loc4_.width) - 0;
        var _loc5_: class_189;
        (_loc5_ = this.method_1919()).quest = _loc2_;
        var _loc6_: class_165;
        (_loc6_ = this.method_1092()).quest = _loc2_;
    }

    public function method_5875(): void {
        if (this.var_756) {
            return;
        }
        this.var_756 = true;
        this.method_3872();
        this.method_5005();
        this.method_5299();
        this.var_2016 = new class_175(this);
        this.method_5973();
        this.method_1352();
        if (false) {
            class_82.playSoundEffect(class_126.const_757);
        }
        class_82.playSoundEffect(class_126.const_1498);
        if (this.var_4452) {
            this.method_707(new SimpleWindowEvent(SimpleWindowEvent.const_1791));
            this.var_4452 = false;
        }
        if (this.var_1467) {
            this.method_3430(new SimpleWindowEvent(SimpleWindowEvent.const_308));
            this.var_1467 = false;
        }
        if (this.var_4476) {
            this.method_1383(new SimpleWindowEvent(SimpleWindowEvent.const_1954), this.var_4476);
            this.var_4476 = false;
        }
        if (this.var_2397) {
            this.method_2310(new SimpleWindowEvent(SimpleWindowEvent.const_1564));
            this.var_2397 = false;
        }
    }

    public function method_6185(): class_9 {
        return this.main;
    }

    public function method_5764(): class_131 {
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.method_1626();
        }
        return _loc1_;
    }

    public function method_3615(): class_131 {
        return (Settings.createMinimap ? this.createWindow(GuiConstants.MINIMAP_WINDOW) : null) as class_131;
    }

    public function method_468(param1: String): class_131 {
        return this.var_3027[param1];
    }

    public function updateInfoField(param1: String, param2: int, param3: int): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        switch (param1) {
            case GuiConstants.USER_WINDOW:
                if ((_loc4_ = this.method_468(GuiConstants.USER_WINDOW)) != null) {
                    class_183(_loc4_.method_3694(param2)).updateInfoField(param3);
                    break;
                }
                break;
            case GuiConstants.SHIP_WINDOW:
                if ((_loc5_ = this.method_468(GuiConstants.SHIP_WINDOW)) != null) {
                    if ((_loc9_ = class_183(_loc5_.method_3694(param2))) != null) {
                        _loc9_.updateInfoField(param3);
                        break;
                    }
                    break;
                }
                break;
            case GuiConstants.RANKED_HUNT_EVENT_WINDOW:
                if ((_loc6_ = this.method_468(GuiConstants.RANKED_HUNT_EVENT_WINDOW)) != null) {
                    if ((_loc10_ = class_183(_loc6_.method_3694(param2))) != null) {
                        _loc10_.updateInfoField(param3);
                        break;
                    }
                    break;
                }
                break;
            case GuiConstants.HIGH_SCORE_GATE_WINDOW:
                if ((_loc7_ = this.method_468(GuiConstants.HIGH_SCORE_GATE_WINDOW)) != null) {
                    if ((_loc11_ = class_183(_loc7_.method_3694(param2))) != null) {
                        _loc11_.updateInfoField(param3);
                        break;
                    }
                    break;
                }
                break;
            case GuiConstants.SCOREEVENT_WINDOW:
                if ((_loc8_ = this.method_468(GuiConstants.SCOREEVENT_WINDOW)) != null) {
                    if ((_loc12_ = class_183(_loc8_.method_3694(param2))) != null) {
                        _loc12_.updateInfoField(param3);
                        break;
                    }
                    break;
                }
        }
    }

    public function method_1002(): void {
        var _loc1_: class_131 = this.method_468(GuiConstants.SHIP_WINDOW);
        var _loc2_: class_183 = class_183(_loc1_.method_3694(class_93.var_3654));
        if (_loc2_ != null) {
            _loc2_.method_1002();
            _loc2_.method_558();
        }
        _loc2_ = class_183(_loc1_.method_3694(class_93.var_1265));
        if (_loc2_ != null) {
            _loc2_.method_1002();
            _loc2_.method_558();
        }
    }

    public function closeWindow(param1: class_131, param2: Boolean = true): void {
        if (param1 == null) {
            return;
        }
        param1.cleanup(param2);
    }

    public function method_1705(param1: String): void {
        delete this.var_3027[param1];
    }

    public function createVideoWindow(param1: Vector.<String>, param2: int, param3: int, param4: int, param5: Boolean = true, param6: String = "n", param7: int = 400, param8: int = 183): void {
        var _loc9_: class_192;
        if ((_loc9_ = this.var_3027[GuiConstants.VIDEO_WINDOW + param2]) != null) {
            this.removeVideoWindow(GuiConstants.VIDEO_WINDOW + param2);
        }
        var _loc10_: FeatureWindowVO = this.guiProxy.getFeatureWindowById(GuiConstants.VIDEO_WINDOW);
        var _loc11_: class_192;
        (_loc11_ = new class_192(this, _loc10_, param2, param3, param4, param6, param5)).setSize(param7, param8);
        _loc11_.languageKeys = param1;
        _loc11_.method_3837();
        this.var_3027[GuiConstants.VIDEO_WINDOW + param2] = _loc11_;
    }

    public function method_5512(param1: Vector.<String>, param2: int, param3: int, param4: int, param5: Boolean = true, param6: String = "n", param7: int = 400, param8: int = 183): void {
        var _loc9_: class_192;
        if ((_loc9_ = this.windows[param2] as class_192) != null) {
            _loc9_.languageKeys = param1;
            _loc9_.method_3648();
            return;
        }
        var _loc10_: DOWindow;
        if (_loc10_ = class_57.getInstance().method_4369(class_57.const_728) as DOWindow) {
            return;
        }
        var _loc11_: FeatureWindowVO = this.guiProxy.getFeatureWindowById(GuiConstants.HELP_VIDEO_WINDOW);
        var _loc12_: class_192;
        (_loc12_ = new class_193(this, _loc11_, param2, param3, param4, param6, param5)).setSize(param7, param8);
        _loc12_.languageKeys = param1;
        _loc12_.method_3837();
        this.windows[GuiConstants.HELP_VIDEO_WINDOW + param2] = _loc12_;
    }

    public function removeVideoWindow(param1: String): void {
        var _loc2_: class_192 = this.var_3027[param1];
        if (_loc2_ != null) {
            _loc2_.hide();
            delete this.var_3027[int(param1)];
        }
    }

    public function showNextPageOfVideoWindow(param1: String): void {
        var _loc2_: class_192 = this.var_3027[param1];
        if (_loc2_) {
            _loc2_.nextPage();
        }
    }

    public function createWindow(param1: String, param2: DisplayObjectContainer = null, param3: int = 1, param4: class_73 = null): IWindow {
        var _loc7_: * = null;
        var _loc5_: FeatureWindowVO = this.guiProxy.getFeatureWindowById(param1);
        var _loc6_: WindowCreationVO = this.guiProxy.getWindowCreationVO(param1);
        param2 = param2 || class_50.method_4278();
        if (param2 == null || this.var_3027[param1] != null || !_loc5_) {
            return null;
        }
        if (!_loc5_.showOnTop) {
            _loc5_.showOnTop = param3 == class_131.const_3085;
        }
        if (_loc6_) {
            if ((_loc7_ = _loc6_.createWindowInstance()) is class_131) {
                this.method_2346(_loc5_, _loc7_);
            }
        }
        this.var_3027[param1] = _loc7_;
        var _loc8_: class_73 = this.method_4576(_loc5_, param4);
        _loc7_.x = _loc8_.x;
        _loc7_.y = _loc8_.y;
        _loc7_.setSize(_loc5_.size.x, _loc5_.size.y);
        param2.addChild(_loc7_ as DisplayObject);
        if (!_loc5_.maximized || Boolean(this.guiProxy.hideAllWindows)) {
            _loc7_.minimize(false, true);
        }
        var _loc9_: class_39 = ResourceManager.name_15.getFinisher(FeaturesMenuConstants.MENU_ID) as class_39;
        _loc7_.initIcon(param1, _loc9_, this.assetsProxy.getBitmapAtlasById(FeaturesMenuConstants.ICONS_BITMAP_ATLAS));
        _loc7_.addEventListener(SimpleWindowEvent.const_1645, this.method_2087);
        _loc7_.addEventListener(SimpleWindowEvent.const_2430, this.method_16);
        this.var_675.sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
        if (_loc6_) {
            _loc6_.executePostWindowCreateCommand(_loc7_, _loc5_);
        }
        return _loc7_;
    }

    public function method_4511(param1: String, param2: class_131): void {
        this.var_3027[param1] = param2;
    }

    protected function method_4576(param1: FeatureWindowVO, param2: class_73 = null): class_73 {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: class_73 = new class_73();
        if (param2 == null) {
            _loc4_ = ScreenScaleUtils.getRealPosFromPercentagePos(this.name_47.name_118, param1.size, param1.position);
            _loc3_.x = int(_loc4_.x);
            _loc3_.y = int(_loc4_.y);
        } else {
            _loc5_ = ScreenScaleUtils.getRealPosFromPercentagePos(this.name_47.name_118, param1.size, param2);
            _loc3_.x = int(_loc5_.x);
            _loc3_.y = int(_loc5_.y);
        }
        return _loc3_;
    }

    protected function method_2346(param1: FeatureWindowVO, param2: IWindow): void {
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher("window"));
        var _loc4_: class_131;
        (_loc4_ = param2 as class_131).preinitialize(param1, this, _loc3_, param1);
    }

    private function method_16(param1: SimpleWindowEvent): void {
        this.var_675.sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
    }

    public function method_1298(): void {
        this.var_1259.method_2277(class_57.SETTINGS_WINDOW);
        var _loc1_: class_131 = this.method_468(GuiConstants.SETTINGS_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.createWindow(GuiConstants.SETTINGS_WINDOW, class_50.getInstance().method_6313(), class_131.const_3085) as class_131;
            class_62.getInstance().method_2407(class_196.CREATE_SETTINGS_WINDOW);
        }
    }

    public function method_440(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.LOG_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.createWindow(GuiConstants.LOG_WINDOW) as class_131;
            _loc1_.addEventListener(SimpleWindowEvent.const_1674, this.method_1797);
            _loc2_ = new class_93(this, class_93.const_3223);
            _loc3_ = new class_209(10, 10, TextFormatAlign.LEFT);
            _loc3_.mouseEnabled = class_9.const_3029;
            this.var_2301 = _loc3_.textArea;
            _loc2_.addElement(_loc3_);
            _loc1_.method_1655(_loc2_);
            _loc2_.method_5942(new Point(15, 30));
            _loc2_.method_558();
            this.writeToLog(class_88.getItem("log_boot_message"));
        }
    }

    public function method_1626(): class_131 {
        var _loc2_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.QUEST_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.createWindow(GuiConstants.QUEST_WINDOW) as class_131;
            _loc2_ = new class_202(this, _loc1_);
        }
        return _loc1_;
    }

    public function method_1962(): void {
        var _loc1_: class_131 = this.method_468(GuiConstants.COMMAND_LINE_WINDOW);
    }

    public function method_5299(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: Boolean = false;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: int = 0;
        var _loc18_: * = null;
        var _loc6_: class_131;
        if ((_loc6_ = this.method_468(GuiConstants.TRADE_WINDOW)) == null) {
            _loc6_ = this.createWindow(GuiConstants.TRADE_WINDOW) as class_131;
            _loc7_ = 0;
            _loc8_ = new class_93(this, class_93.const_2961);
            _loc11_ = false;
            for each(_loc12_ in class_9.var_2751.tradeWindow.ores.ore) {
                _loc1_ = int(_loc12_.@type);
                _loc2_ = _loc12_.@languageKey;
                _loc3_ = _loc12_.@pricetagTooltipKey;
                _loc4_ = _loc12_.@gaintagTooltipKey;
                _loc5_ = _loc12_.@notavailableTooltipKey;
                _loc9_ = _loc12_.@pricetag;
                _loc10_ = _loc12_.@gaintag;
                if (_loc12_.@isRatio.length() > 0) {
                    _loc11_ = ParserUtility.parseBooleanFromString(_loc12_.@isRatio);
                }
                (_loc18_ = new class_162(this, _loc1_, _loc2_, _loc9_, _loc10_, _loc3_, _loc4_, _loc5_, _loc11_)).x = 80 * _loc7_;
                _loc7_++;
                _loc8_.addElement(_loc18_, class_93.const_2374, 1);
                _loc11_ = false;
            }
            _loc6_.method_1655(_loc8_);
            _loc8_.method_5942(new Point(10, 35));
            _loc8_.method_558();
            (_loc13_ = new class_219(_loc8_.width, 20, new TextFormat(class_18.const_2667.font, class_18.const_2667.size, 16777215), "", TextFormatAlign.CENTER)).y = _loc8_.height + 5;
            _loc8_.addElement(_loc13_, class_93.const_2374);
            _loc14_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            _loc15_ = new class_218(class_185.const_3207, class_88.getItem("label_trade_window_shop_button"), _loc14_.getEmbeddedMovieClip("generalButton"), class_18.const_2442);
            _loc16_ = new class_218(class_185.const_1664, class_88.getItem("label_trade_window_uridium_button"), _loc14_.getEmbeddedMovieClip("generalButton"), class_18.const_2442);
            _loc17_ = 15;
            _loc15_.width = 270;
            _loc16_.width = 270;
            _loc15_.x = 5;
            _loc16_.x = _loc15_.width + _loc17_;
            _loc16_.y = _loc8_.height + 5;
            _loc15_.y = _loc8_.height + 5;
            _loc15_.addEventListener(MouseEvent.CLICK, this.method_2698);
            _loc16_.addEventListener(MouseEvent.CLICK, this.method_2307);
            _loc8_.addElement(_loc15_, class_93.const_2374);
            _loc8_.addElement(_loc16_, class_93.const_2374);
            _loc6_.addEventListener(SimpleWindowEvent.const_328, this.method_3339);
            _loc6_.addEventListener(SimpleWindowEvent.const_2430, this.method_4274);
        }
    }

    private function method_3339(param1: SimpleWindowEvent): void {
        var _loc2_: class_191 = new class_191();
        this.method_6185().method_6154().sendRequest(_loc2_);
    }

    private function method_4274(param1: Event): void {
        this.method_6185().method_6154().sendCommand(class_113.const_969);
    }

    private function method_2307(param1: MouseEvent): void {
        class_59.referToURL("internalPayment", "seo_tittle_uridium");
    }

    private function method_2698(param1: MouseEvent): void {
        class_59.referToURL("internalDock", "seo_tittle_ships", "internalDockShips");
    }

    public function method_461(): void {
        var _loc1_: class_131 = this.method_468(GuiConstants.TRADE_WINDOW);
        if (_loc1_ != null && !_loc1_.maximized) {
            _loc1_.maximize();
        }
    }

    public function method_4627(param1: Boolean = false): void {
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc2_: class_131 = (this.method_468(GuiConstants.TRADE_WINDOW) || this.createWindow(GuiConstants.TRADE_WINDOW)) as class_131;
        if ((_loc2_ == null || !_loc2_.method_2029() && !_loc2_.maximized) && !param1) {
            return;
        }
        var _loc3_: Array = class_181.method_4666([class_163.const_98, class_163.const_225, class_163.const_2375, class_163.const_763, class_163.const_2322, class_163.PROMERIUM, class_163.PALLADIUM]);
        if (_loc3_ == null) {
            return;
        }
        var _loc4_: class_93;
        var _loc5_: Array = (_loc4_ = _loc2_.method_3694(class_93.const_2961)).method_1864();
        var _loc6_: class_219 = _loc4_.method_89(class_91.const_586) as class_219;
        switch (class_81.var_1859) {
            case class_174.const_1077:
            case class_174.const_1459:
                _loc6_.textField.text = class_88.getItem("desc_trade_window_costs_free_trade");
                break;
            case class_174.PET:
                _loc6_.textField.text = class_88.getItem("desc_trade_window_costs_petgear_trade");
                break;
            case class_174.const_2199:
                _loc6_.textField.text = "";
                break;
            case class_174.INACTIVE:
            default:
                _loc6_.textField.text = "";
        }
        var _loc7_: int = 0;
        while (_loc7_ < _loc5_.length) {
            if (_loc5_[_loc7_] is class_162) {
                _loc8_ = _loc5_[_loc7_] as class_162;
                if ((_loc9_ = _loc3_[_loc7_]) != null) {
                    _loc8_.method_775(_loc9_.price);
                    _loc8_.method_4016(_loc9_.count);
                }
            }
            _loc7_++;
        }
    }

    private function method_1797(param1: Event): void {
        var _loc2_: class_131 = param1.currentTarget as class_131;
        this.var_2301.width = Number(_loc2_.method_468().width) - 30;
        this.var_2301.height = Number(_loc2_.method_468().height) - 50;
    }

    private function method_1572(param1: Event): void {
        var _loc2_: class_73 = this.method_468(GuiConstants.COMMAND_LINE_WINDOW).resizeDimension;
        this.var_2853.setSize(Number(_loc2_.x) - 16, Number(_loc2_.y) - 24);
    }

    public function method_3313(): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: String = "";
        var _loc2_: String = "null";
        for (_loc3_ in this.var_3027) {
            if ((_loc4_ = this.var_3027[_loc3_] as class_131).definition.resizable) {
                _loc5_ = _loc4_.resizeDimension;
                _loc1_ += _loc4_.id + _loc2_ + _loc5_.x + _loc2_ + _loc5_.y + _loc2_;
            }
        }
        return _loc1_;
    }

    public function method_4717(): void {
        if (true) {
            return;
        }
        if (true) {
            this.method_6529();
        } else if (this.var_186 == null) {
            this.method_6071();
        }
    }

    private function method_3388(): void {
        var _loc1_: class_62 = class_62.getInstance();
        if (!_loc1_.hasCommand(ChatNotifications.const_1131)) {
            _loc1_.registerCommand(ChatNotifications.const_1131, class_178);
        }
        if (!_loc1_.hasCommand(ChatNotifications.const_776)) {
            _loc1_.registerCommand(ChatNotifications.const_776, class_211);
        }
        if (!_loc1_.hasCommand(ChatNotifications.const_2611)) {
            _loc1_.registerCommand(ChatNotifications.const_2611, class_216);
        }
        _loc1_.method_2407(ChatNotifications.const_1131);
    }

    private function method_6071(): void {
        this.var_2094 = new Loader();
        this.var_2094.contentLoaderInfo.addEventListener(Event.COMPLETE, this.method_583);
        this.var_2094.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.method_2323);
        this.var_2094.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_2323);
        var _loc1_: LoaderContext = new LoaderContext();
        _loc1_.securityDomain = SecurityDomain.currentDomain;
        this.var_2094.load(new URLRequest(class_224.method_5407), _loc1_);
    }

    private function method_6529(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.var_186 != null) {
            this.var_186.cleanup();
            _loc1_ = this.method_468(GuiConstants.CHAT_WINDOW);
            if (_loc1_ != null) {
                _loc1_.removeEventListener(SimpleWindowEvent.const_1674, this.method_3968);
                _loc1_.removeEventListener(SimpleWindowEvent.const_2430, this.method_4456);
                _loc1_.removeEventListener(SimpleWindowEvent.const_940, this.method_806);
                this.var_186.removeEventListener("ChatEvent.ALL_LOADED", this.method_3177);
                this.var_186.removeEventListener("ChatEvent.CONNECTED", this.method_751);
                _loc2_ = _loc1_.method_3694(class_93.const_284);
                _loc3_ = _loc2_.method_89(class_91.const_552);
                if (_loc3_.contains(this.var_186)) {
                    _loc3_.removeChild(this.var_186);
                }
                this.closeWindow(_loc1_);
            }
            this.var_675.removeMediator(ChatMediator.NAME);
            this.var_186 = null;
        }
    }

    private function method_2323(param1: *): void {
    }

    private function method_583(param1: Event): void {
        if (this.var_2094.content == null) {
            return;
        }
        this.var_2094.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.method_583);
        this.var_186 = MovieClip(this.var_2094.content);
        var _loc2_: String = "null";
        if (_loc2_ == "dev") {
            _loc2_ = "de";
        }
        if (_loc2_ == "br") {
            _loc2_ = "pt";
        }
        if (_loc2_ == "us") {
            _loc2_ = "en";
        }
        if (_loc2_ == "mx") {
            _loc2_ = "es";
        }
        if (_loc2_ == "sk") {
            _loc2_ = "cs";
        }
        var _loc3_: class_131 = this.createWindow(GuiConstants.CHAT_WINDOW) as class_131;
        if (_loc3_ == null) {
            return;
        }
        var _loc4_: FeatureItemVO;
        if (!(_loc4_ = (this.var_675.retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy).getFeatureItemVOById(GuiConstants.CHAT_WINDOW)).visible) {
            _loc3_.minimize(false, true);
        }
        _loc3_.addEventListener(SimpleWindowEvent.const_1674, this.method_3968);
        _loc3_.addEventListener(SimpleWindowEvent.const_2430, this.method_4456);
        _loc3_.addEventListener(SimpleWindowEvent.const_940, this.method_806);
        var _loc5_: class_93 = new class_93(this, class_93.const_284);
        var _loc6_: class_91 = new class_91(class_91.const_552);
        var _loc7_: Boolean = false;
        if (true) {
            _loc7_ = true;
        }
        var _loc8_: String = "null";
        this.var_186.initChatSecure(class_81.name_148, class_81.userID, class_81.sessionID, Settings.instanceID, _loc2_, false ? class_81.name_145 : class_81.const_1509, class_81.factionID, new Point(14, 30), new Rectangle(0, 0, class_50.method_6533(), class_50.method_1269()), false, _loc8_, 0, false, 0, 0, false, _loc7_);
        this.var_186.addEventListener("ChatEvent.ALL_LOADED", this.method_3177);
        this.var_186.addEventListener("ChatEvent.CONNECTED", this.method_751);
        if (!_loc3_.maximized) {
            this.var_186.visible = false;
        }
        _loc6_.addChild(this.var_186);
        _loc5_.addElement(_loc6_, class_93.const_2374);
        _loc3_.method_1655(_loc5_);
    }

    private function method_3177(param1: Event): void {
        this.var_675.registerMediator(new ChatMediator(this.var_186));
        this.method_3968(null);
    }

    private function method_751(param1: Event): void {
        this.var_4160 = true;
        this.var_675.method_2407(GroupSystemNotification.UPDATE_GROUP_CHAT_STATE);
    }

    private function method_3968(param1: Event): void {
        var _loc2_: class_131 = this.method_468(GuiConstants.CHAT_WINDOW);
        if (this.var_186 != null && _loc2_ != null) {
            this.var_186.setSize(Number(_loc2_.resizeDimension.x) - 10, Number(_loc2_.resizeDimension.y) - 20);
        }
    }

    private function method_4456(param1: Event): void {
        if (this.var_186 != null) {
            this.var_186.visible = false;
        }
    }

    private function method_806(param1: Event): void {
        if (this.var_186 != null) {
            this.var_186.visible = true;
        }
    }

    public function method_5005(): void {
        this.createWindow(GuiConstants.HELP_WINDOW);
    }

    public function method_6205(param1: Function, param2: Function): class_131 {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc3_: class_131 = this.createWindow(GuiConstants.POPUP_WINDOW, this.method_468(GuiConstants.SETTINGS_WINDOW).parent, class_131.const_3085) as class_131;
        if (!_loc3_) {
            _loc3_ = this.method_468(GuiConstants.POPUP_WINDOW);
        } else {
            _loc4_ = new class_93(this, class_93.const_1053);
            (_loc5_ = new class_219(Number(_loc3_.resizeDimension.x) - 32, Number(_loc3_.resizeDimension.y) - 100, new TextFormat(class_18.const_1629.font, class_18.const_1629.size, 16777215), class_88.getItem("msg_new_key"))).x = 8;
            _loc5_.y = 32;
            _loc4_.addElement(_loc5_);
            _loc6_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            (_loc7_ = new class_218(class_185.const_2597, class_88.getItem("btn_cancel"), _loc6_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, param2);
            _loc4_.addElement(_loc7_, class_93.const_1191);
            _loc4_.x = 8;
            _loc3_.method_1655(_loc4_);
            _loc3_.setSize(-1, -1);
            this.main.stage.addEventListener(KeyboardEvent.KEY_DOWN, param1);
        }
        _loc3_.minimize(false, true);
        _loc3_.maximize();
        _loc3_.method_1321(true);
        return _loc3_;
    }

    public function method_5973(): void {
        var _loc1_: class_131 = this.createWindow(GuiConstants.SPACEMAP_WINDOW) as class_131;
        var _loc2_: class_172 = new class_172(this);
        _loc1_.addEventListener(SimpleWindowEvent.const_328, this.method_3869);
        _loc2_.decorate(_loc1_);
    }

    private function method_3869(param1: SimpleWindowEvent): void {
        this.method_4214();
    }

    public function method_4380(): void {
        this.method_4214();
        this.main.method_6154().sendCommand(class_74.const_1367, [class_74.GET]);
    }

    public function method_4214(): void {
        var _loc5_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.SPACEMAP_WINDOW);
        if (_loc1_ == null) {
            return;
        }
        var _loc2_: class_93 = _loc1_.method_3694(class_93.const_1306);
        var _loc3_: class_93 = _loc1_.method_3694(class_93.const_1098);
        var _loc4_: class_91 = _loc3_.method_89(class_91.const_2677);
        if (class_81.var_4677.value) {
            _loc3_.visible = true;
            _loc2_.visible = false;
            _loc1_.method_1410(720);
            _loc1_.method_5152(560);
            _loc1_.method_821();
            if (!_loc4_.hasEventListener(MouseEvent.CLICK)) {
                _loc4_.addEventListener(MouseEvent.CLICK, this.method_667);
            }
            this.method_4244(class_197.method_4544(this.main.name_47.map.mapID));
        } else {
            _loc1_.method_1410(_loc2_.width + 10);
            _loc1_.method_5152(_loc2_.height + 30);
            _loc3_.visible = false;
            _loc2_.visible = true;
            (_loc5_ = _loc2_.getChildAt(0) as class_197).update();
        }
    }

    public function method_322(): void {
        var _loc1_: class_93 = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098);
        var _loc2_: class_205 = _loc1_.method_89(class_91.const_1230).getChildAt(0) as class_205;
        var _loc3_: class_205 = _loc1_.method_89(class_91.const_760).getChildAt(0) as class_205;
        _loc2_.method_6051();
        _loc3_.method_6051();
        this.method_4214();
    }

    public function method_4244(param1: int): void {
        var _loc2_: class_93 = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098);
        var _loc3_: TextField = Sprite(_loc2_.method_89(class_91.const_2677).getChildAt(0)).getChildAt(0) as TextField;
        if (param1 == 0) {
            _loc2_.method_89(class_91.const_1230).visible = true;
            _loc2_.method_89(class_91.const_760).visible = false;
            _loc3_.text = class_88.getItem("label_switch_map_to_upper_section");
        } else {
            _loc2_.method_89(class_91.const_1230).visible = false;
            _loc2_.method_89(class_91.const_760).visible = true;
            _loc3_.text = class_88.getItem("label_switch_map_to_lower_section");
        }
        (_loc2_.method_89(class_91.const_1230).getChildAt(0) as class_205).method_4239();
        (_loc2_.method_89(class_91.const_760).getChildAt(0) as class_205).method_4239();
    }

    public function method_3629(param1: Array, param2: Array, param3: Array): void {
        var _loc4_: class_93;
        var _loc5_: class_205 = (_loc4_ = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098)).method_89(class_91.const_1230).getChildAt(0) as class_205;
        var _loc6_: class_205 = _loc4_.method_89(class_91.const_760).getChildAt(0) as class_205;
        var _loc7_: TextField = _loc4_.method_89(class_91.const_155).getChildAt(1) as TextField;
        var _loc8_: int = int(this.main.name_47.map.method_1480());
        _loc7_.text = class_126.getInstance().var_1524[_loc8_];
        _loc5_.update(_loc8_, param1, param2, param3);
        _loc6_.update(_loc8_, param1, param2, param3);
        this.method_4214();
    }

    public function method_6383(param1: int, param2: int, param3: int): void {
        var _loc4_: class_93;
        var _loc5_: TextField = (_loc4_ = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098)).method_89(class_91.const_155).getChildAt(2) as TextField;
        var _loc6_: class_205 = _loc4_.method_89(class_91.const_1230).getChildAt(0) as class_205;
        var _loc7_: class_205 = _loc4_.method_89(class_91.const_760).getChildAt(0) as class_205;
        var _loc8_: String = class_126.getInstance().var_1524[param1];
        _loc5_.text = _loc8_;
        this.method_570(param2);
        this.method_2830();
        if (param3 == 1) {
            if (!_loc4_.method_89(class_91.const_414).hasEventListener(MouseEvent.CLICK)) {
                _loc4_.method_89(class_91.const_414).addEventListener(MouseEvent.CLICK, this.method_5732);
            }
            _loc6_.method_800(param1);
            _loc7_.method_800(param1);
            this.writeToLog(class_88.getItem("ttip_selected_target").replace("%MAP%", _loc8_));
        } else {
            if (!_loc4_.method_89(class_91.const_414).hasEventListener(MouseEvent.CLICK)) {
                _loc4_.method_89(class_91.const_414).removeEventListener(MouseEvent.CLICK, this.method_5732);
            }
            _loc6_.method_3653(param1);
            _loc7_.method_3653(param1);
            this.writeToLog(class_88.getItem("ttip_block_general"));
        }
    }

    public function method_570(param1: int = 0): void {
        var _loc2_: class_93 = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098);
        if (_loc2_ == null) {
            return;
        }
        var _loc3_: TextField = _loc2_.method_89(class_91.const_155).getChildAt(2) as TextField;
        var _loc4_: TextField = _loc2_.method_89(class_91.const_1539).getChildAt(1) as TextField;
        if (_loc3_.text.length > 0) {
            if (false) {
                _loc4_.text = class_88.getItem("attribute_free_cpu_jump");
                _loc4_.textColor = 16763904;
            } else {
                _loc4_.text = class_88.getItem("pricetag_uridium_compact").replace("%VALUE%", class_122.method_98(param1));
                _loc4_.textColor = 65535;
            }
        }
    }

    public function method_2830(): void {
        var _loc1_: class_93 = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098);
        var _loc2_: TextField = _loc1_.method_89(class_91.const_2486).getChildByName("text") as TextField;
        _loc2_.text = class_88.getItem("label_jump-vouchers").replace("%COUNT%", class_122.method_98(class_81.var_238));
        if (false) {
            _loc2_.textColor = 16763904;
        } else {
            _loc2_.textColor = 65535;
        }
    }

    public function method_6388(param1: int, param2: int): void {
        var _loc3_: class_131 = this.method_468(GuiConstants.SPACEMAP_WINDOW);
        var _loc4_: class_93;
        var _loc5_: class_205 = (_loc4_ = _loc3_.method_3694(class_93.const_1098)).method_89(class_91.const_1230).getChildAt(0) as class_205;
        var _loc6_: class_205 = _loc4_.method_89(class_91.const_760).getChildAt(0) as class_205;
        if (param1 <= -1) {
            _loc3_.minimize();
        }
        _loc5_.method_6388(param1, param2);
        _loc6_.method_6388(param1, param2);
        if (param1 > 0) {
            this.writeToLog(class_88.getItem("msg_cpu_jump_sequence_started").replace("%COUNT%", param1));
        }
    }

    private function method_5732(param1: MouseEvent): void {
        this.main.method_6154().sendCommand(class_74.const_1367, [class_74.const_1809]);
    }

    public function method_667(param1: MouseEvent): void {
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc2_: class_93 = this.method_468(GuiConstants.SPACEMAP_WINDOW).method_3694(class_93.const_1098);
        var _loc3_: class_91 = _loc2_.method_89(class_91.const_1230);
        var _loc4_: class_91 = _loc2_.method_89(class_91.const_760);
        var _loc5_: TextField = Sprite(_loc2_.method_89(class_91.const_2677).getChildAt(0)).getChildAt(0) as TextField;
        if (_loc3_.visible) {
            _loc3_.visible = false;
            _loc4_.visible = true;
            if (class_205(_loc4_.getChildAt(0)).lastSelectedMapForJump != null) {
                _loc6_ = int(class_205(_loc4_.getChildAt(0)).lastSelectedMapForJump.id);
            }
            _loc7_ = class_88.getItem("label_switch_map_to_lower_section");
        } else {
            _loc3_.visible = true;
            _loc4_.visible = false;
            if (class_205(_loc3_.getChildAt(0)).lastSelectedMapForJump != null) {
                _loc6_ = int(class_205(_loc3_.getChildAt(0)).lastSelectedMapForJump.id);
            }
            _loc7_ = class_88.getItem("label_switch_map_to_upper_section");
        }
        _loc5_.text = _loc7_;
        this.main.method_6154().sendCommand(class_74.const_1367, [class_74.const_1690, _loc6_]);
    }

    public function method_3872(): void {
        var _loc1_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc2_: class_131 = this.createWindow(GuiConstants.LOGOUT_WINDOW) as class_131;
        var _loc3_: class_93 = new class_93(this, class_93.const_2023);
        _loc3_.method_5942(new Point(10, 40));
        _loc3_.method_558();
        _loc2_.method_1655(_loc3_);
        var _loc4_: class_217 = new class_217(this);
        _loc3_.addElement(_loc4_);
        var _loc5_: class_218;
        (_loc5_ = new class_218(class_185.var_2426, class_88.getItem("logout_subbot"), _loc1_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_3738);
        _loc3_.addElement(_loc5_, class_93.const_1191);
        _loc2_.setSize(-1, _loc5_.y + _loc5_.height + _loc3_.y);
        _loc2_.addEventListener(SimpleWindowEvent.const_940, this.method_6089);
        _loc2_.addEventListener(SimpleWindowEvent.const_2300, this.method_3738);
        _loc2_.addEventListener(SimpleWindowEvent.const_328, this.method_3696);
    }

    public function method_3696(param1: SimpleWindowEvent): void {
        var _loc2_: class_194 = class_194.getInstance();
        if (_loc2_.method_977()) {
            _loc2_.closeWindow(null);
        }
        this.main.method_360(false);
        this.main.name_47.method_1772.method_5917();
    }

    public function method_6089(param1: Event): void {
        this.var_675.method_2407(GuiNotifications.CLOSE_ALL_FLEX_WINDOWS);
        var _loc2_: class_131 = this.method_468(GuiConstants.LOGOUT_WINDOW);
        var _loc3_: class_217 = class_217(_loc2_.method_3694(class_93.const_2023).method_89(class_91.const_872));
        _loc3_.method_5021();
        class_82.playSoundEffect(class_126.const_623);
    }

    public function method_5120(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null) {
            _loc2_.method_5120();
        }
    }

    public function method_1081(param1: String): void {
        var _loc2_: class_131 = this.method_468(param1);
        if (_loc2_ != null) {
            _loc2_.method_1081();
        }
    }

    public function method_3738(param1: Event = null): void {
        this.main.method_360(false);
        this.var_2653 = true;
        this.writeToLog(class_88.getItem("logoutbreak_user"));
        this.main.method_6154().sendRequest(new class_182());
        this.method_3012();
    }

    public function method_975(): void {
        var _loc1_: class_131 = this.method_468(GuiConstants.LOGOUT_WINDOW);
        if (_loc1_) {
            this.method_3012();
            this.main.name_47.method_1772.method_94();
            if (!this.var_2653) {
                this.writeToLog(class_88.getItem("logoutbreak"));
            }
            this.var_2653 = false;
            this.var_675.sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION, false, GuiConstants.LOGOUT_WINDOW);
        }
    }

    private function method_3012(): void {
        var _loc2_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.LOGOUT_WINDOW);
        if (_loc1_) {
            _loc2_ = class_217(_loc1_.method_3694(class_93.const_2023).method_89(class_91.const_872));
            _loc2_.method_6286();
            _loc1_.minimize(false, true);
        }
    }

    public function method_5023(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        this.var_675.method_2407(GuiNotifications.CLOSE_ALL_FLEX_WINDOWS);
        this.var_675.method_2407(GuiNotifications.CLOSE_KILLSCREEN);
        this.var_675.method_2407(MapAssetNotification.CLEANUP);
        this.var_675.method_2407(HighLightItemNotification.CLEANUP);
        var _loc1_: class_131 = this.method_468(GuiConstants.CONNECTION_LOST_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.createWindow(GuiConstants.CONNECTION_LOST_WINDOW, this.main.name_47.method_6313(), class_131.const_3085) as class_131;
            _loc2_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            _loc3_ = MovieClip(_loc2_.getEmbeddedMovieClip("connectionLostWindow"));
            _loc3_.mouseEnabled = class_9.const_3029;
            _loc3_.mouseChildren = class_9.const_3029;
            (_loc4_ = TextField(_loc3_.getChildByName("bodyP"))).x = 125;
            _loc4_.width = 164;
            _loc4_.defaultTextFormat = class_18.const_1629;
            _loc4_.embedFonts = class_18.var_620;
            _loc4_.autoSize = TextFieldAutoSize.LEFT;
            _loc4_.wordWrap = true;
            _loc4_.text = class_88.getItem("log_verbindunghead") + "\n\n" + class_88.getItem("log_verbindungtext");
            _loc5_ = new class_93(this, class_93.const_2110);
            (_loc6_ = new class_220()).addChild(_loc3_);
            _loc5_.addElement(_loc6_, class_93.const_3298);
            (_loc7_ = new class_218(class_185.const_7, class_88.getItem("log_neueverbindung"), _loc2_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_742);
            _loc5_.addElement(_loc7_, class_93.const_3298);
            (_loc8_ = new class_218(class_185.const_471, class_88.getItem("log_Logout"), _loc2_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_4150);
            _loc5_.addElement(_loc8_, class_93.const_2568);
            _loc5_.method_5942(new Point(15, 30));
            _loc5_.method_558();
            _loc1_.method_1655(_loc5_);
            _loc1_.autoSize();
            _loc1_.method_1321(true);
            this.method_3012();
        } else {
            this.method_5921();
            this.method_5023();
        }
    }

    private function method_4150(param1: MouseEvent): void {
        class_59.call(class_59.const_339, [], System.exit, [0]);
    }

    private function method_742(param1: MouseEvent): void {
        EventStreamClient.track("flash_socket_reconnectClick");
        this.method_2624(GuiConstants.CONNECTION_LOST_WINDOW);
        this.showConnectionWindow();
        this.main.method_6154().connectToMap(Settings.mapID);
    }

    public function showConnectionWindow(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: class_131 = this.method_468(GuiConstants.CONNECTION_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this.createWindow(GuiConstants.CONNECTION_WINDOW, this.main.name_47.method_6313(), class_131.const_3085) as class_131;
            _loc2_ = new class_93(this, class_93.const_846);
            _loc3_ = new class_208();
            _loc3_.x = 24;
            _loc3_.y = 20;
            _loc2_.addElement(_loc3_);
            _loc4_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            (_loc5_ = new class_218(class_185.var_4139, class_88.getItem("log_abbruch"), _loc4_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_6165);
            _loc2_.addElement(_loc5_, class_93.const_2374);
            _loc5_.x = Number(_loc1_.resizeDimension.x) / 2 - Number(_loc5_.width) / 2 + 5;
            _loc5_.y = _loc3_.y + _loc3_.height + 10;
            _loc1_.method_1655(_loc2_);
            _loc1_.method_1321(true);
        } else {
            _loc1_.alpha = 1;
        }
    }

    private function method_6165(param1: MouseEvent): void {
        class_59.call(class_59.const_339, [], System.exit, [0]);
    }

    public function method_5921(): void {
        this.method_2624(GuiConstants.CONNECTION_WINDOW);
        this.method_2624(GuiConstants.CONNECTION_LOST_WINDOW);
        this.method_1705(GuiConstants.CONNECTION_WINDOW);
        this.method_1705(GuiConstants.CONNECTION_LOST_WINDOW);
    }

    public function method_4277(): void {
        ++this.var_3672;
    }

    public function method_1993(): void {
        --this.var_3672;
    }

    public function method_3360(): int {
        return this.var_3672;
    }

    public function method_2085(): Boolean {
        return this.var_4784;
    }

    public function method_1352(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.var_3018 == null) {
            _loc1_ = new TextField();
            _loc1_.defaultTextFormat = class_18.const_1442;
            _loc1_.embedFonts = class_18.var_3994;
            _loc1_.autoSize = TextFieldAutoSize.LEFT;
            _loc1_.height = NaN;
            _loc1_.textColor = 16777215;
            _loc1_.antiAliasType = "advanced";
            _loc1_.selectable = false;
            _loc1_.text = class_88.getItem("peacearea");
            _loc1_.filters = [new GlowFilter(255, 1, 1, 1, 1)];
            _loc2_ = new BitmapData(_loc1_.width, _loc1_.height, true, 0);
            _loc2_.draw(_loc1_);
            this.var_3018 = new Bitmap(_loc2_);
            this.var_3018.x = -Number(this.var_3018.width) / 2;
            this.var_3018.y = 200;
        }
    }

    public function method_1627(param1: Boolean): void {
        if (this.var_3018 == null) {
            return;
        }
        var _loc2_: DisplayObjectContainer = this.main.name_47.method_6228;
        if (param1) {
            if (!_loc2_.contains(this.var_3018)) {
                this.var_3018.alpha = 0;
                _loc2_.addChild(this.var_3018);
                TweenLite.to(this.var_3018, 1, {"alpha": 1});
            }
        } else if (_loc2_.contains(this.var_3018)) {
            TweenLite.to(this.var_3018, 1, {
                "alpha": 0,
                "onComplete": this.method_3411
            });
        }
    }

    private function method_3411(): void {
        if (TweenMax.isTweening(this.var_3018)) {
            return;
        }
        var _loc1_: DisplayObjectContainer = this.main.name_47.method_6228;
        if (_loc1_.contains(this.var_3018)) {
            _loc1_.removeChild(this.var_3018);
        }
    }

    public function method_4304(param1: int, param2: int): void {
        this.writeToLog(class_88.getItem("lvlup_msg").replace(/%!/, param1));
        if (param2 > 0) {
            this.writeToLog(class_88.getItem("lvlup_msg_p2").replace(/%!/, param2));
        }
    }

    public function method_2675(): void {
        var _loc1_: * = null;
        if (this.var_4522) {
            for each(_loc1_ in this.var_3027) {
                if (_loc1_.maximized) {
                    _loc1_.method_5635();
                    _loc1_.method_1067();
                }
            }
        }
    }

    public function method_3053(): void {
        var _loc1_: * = null;
        if (this.var_4484) {
            for each(_loc1_ in this.var_3027) {
                if (_loc1_.definition.resizable) {
                    _loc1_.method_1067();
                }
            }
            this.method_4508(false);
        }
    }

    public function method_4747(param1: Boolean): void {
        this.var_4522 = param1;
    }

    public function method_4508(param1: Boolean): void {
        this.var_4484 = param1;
    }

    public function get method_6320(): class_175 {
        return this.var_2016;
    }

    public function method_3714(param1: class_176): void {
        this.var_503.push(param1);
    }

    public function method_1262(param1: int): class_176 {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_503) {
            if (param1 == _loc2_.getID()) {
                return _loc2_;
            }
        }
        return null;
    }

    public function getBarStatesAsString(): String {
        var _loc2_: * = null;
        var _loc1_: String = "";
        for each(_loc2_ in this.var_503) {
            _loc1_ += _loc2_.getID() + "," + _loc2_.var_3041 + "|";
        }
        return _loc1_;
    }

    public function method_3418(param1: Boolean): String {
        if (param1) {
            return "1";
        }
        return "0";
    }

    public function get windows(): Dictionary {
        return this.var_3027;
    }

    public function method_4988(): class_131 {
        var _loc3_: * = null;
        var _loc1_: String = "null";
        var _loc2_: class_131 = this.method_468(_loc1_);
        if (_loc2_ == null) {
            _loc2_ = this.createWindow(_loc1_) as class_131;
            _loc3_ = new class_223(this);
            _loc3_.decorate(_loc2_);
        }
        return _loc2_;
    }

    public function method_2087(param1: SimpleWindowEvent): void {
        var _loc2_: * = null;
        if (Boolean(this.var_756) && Boolean(this.menuProxy)) {
            _loc2_ = param1.target as IWindow;
            if (_loc2_) {
                this.var_675.sendNotification(GuiNotifications.SEND_WINDOW_UPDATE_REQUEST, _loc2_);
            }
        }
    }

    public function method_527(): void {
        this.var_675.sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
    }

    public function method_3430(param1: SimpleWindowEvent = null): void {
        var _loc2_: class_53 = this.main.method_6154();
        var _loc3_: class_164 = new class_164();
        _loc3_.var_2376 = Settings.displayPlayerNames.value;
        _loc3_.displayResources = Settings.displayResources.value;
        _loc3_.var_4829 = Settings.displayBonusBoxes.value;
        _loc3_.displayHitpointBubbles = Settings.displayHitpointBubbles;
        _loc3_.displayChat = Settings.displayChat;
        _loc3_.displayDrones = Settings.displayDrones.value;
        _loc3_.var_4972 = Settings.displayFreeCargoBoxes.value;
        _loc3_.var_482 = Settings.displayNotFreeCargoBoxes.value;
        _loc3_.showNotOwnedItems = Settings.showNotOwnedItems;
        _loc3_.var_2907 = Settings.displayWindowsBackground;
        _loc3_.var_3068 = Settings.displayMiniMapBackgroundImage.value;
        _loc3_.displayNotifications = Settings.displayNotifications.value;
        _loc3_.preloadUserShips = Settings.preloadUserShips;
        _loc3_.name_154 = Settings.dragWindowsAlways;
        _loc3_.var_1368 = Settings.hoverShips.value;
        _loc3_.var_1882 = Settings.showPremiumQuickslotBar;
        _loc3_.var_1348 = Settings.allowAutoQuality.value;
        _loc3_.proActionBarEnabled = Settings.proActionBarEnabled.value;
        _loc3_.proActionBarAutohideEnabled = Settings.proActionBarAutohideEnabled;
        _loc3_.proActionBarKeyboardInputEnabled = Settings.proActionBarKeyboardInputEnabled;
        _loc3_.var_69 = Settings.FORCE_2D.value;
        _loc3_.displaySetting3DqualityAntialias = Settings.displaySetting3DqualityAntialias.value + 1;
        _loc3_.name_44 = Settings.qualityBackground.value + 1;
        _loc3_.displaySetting3DqualityEffects = Settings.displaySetting3DqualityEffects.value + 1;
        _loc3_.displaySetting3DqualityLights = Settings.displaySetting3DqualityLights.value + 1;
        _loc3_.displaySetting3DqualityTextures = Settings.displaySetting3DqualityTextures.value + 1;
        _loc3_.name_16 = Settings.qualityPoizone.value + 1;
        _loc3_.displaySetting3DsizeTextures = Settings.displaySetting3DsizeTextures.value + 1;
        _loc3_.displaySetting3DtextureFiltering = Settings.displaySetting3DtextureFiltering.value + 1;
        _loc2_.sendRequest(_loc3_);
    }

    public function method_1383(param1: SimpleWindowEvent = null, param2: Boolean = false): void {
        var _loc4_: int = 0;
        var _loc3_: class_53 = this.main.method_6154();
        this.var_675.method_2407(QualityNotification.QUALITY_SETTINGS_CHANGED);
        if (param2) {
            Settings.setDefaultQualitySettings();
        }
        if (Settings.qualityBackground.value == Settings.QUALITY_GOOD && false) {
            _loc4_ = 0;
        } else {
            _loc4_ = Settings.qualityBackground.value;
        }
        var _loc5_: class_166 = new class_166(Settings.qualityAttack.value, _loc4_, Settings.qualityPresetting, Settings.qualityCustomized, Settings.qualityPoizone.value, Settings.qualityShip.value, Settings.qualityEngine.value, Settings.qualityExplosion.value, Settings.qualityCollectable.value, Settings.qualityEffect.value);
        _loc3_.sendRequest(_loc5_);
    }

    public function method_707(param1: SimpleWindowEvent = null, param2: Boolean = false): void {
        var _loc3_: class_53 = this.main.method_6154();
        var _loc4_: class_177 = new class_177(Settings.soundVolume, Settings.musicVolume, Settings.voiceVolume, Settings.playCombatMusic);
        if (!param2) {
            class_171.method_4215(new class_200(false, Settings.soundVolume, Settings.musicVolume, Settings.voiceVolume, Settings.playCombatMusic));
        }
        _loc3_.sendRequest(_loc4_);
    }

    public function method_2310(param1: SimpleWindowEvent = null): void {
        var _loc2_: class_53 = this.main.method_6154();
        var _loc3_: class_199 = new class_199(Settings.autoBoost, Settings.autoRefinement, Settings.quickSlotStopAttack, Settings.doubleclickAttackEnabled, Settings.autochangeAmmo, Settings.autoStartEnabled, Settings.autoBuyBootyKeys, Settings.displayBattlerayNotifications, Settings.showLowHpWarnings);
        _loc2_.sendRequest(_loc3_);
    }

    public function method_5230(param1: class_131): void {
        if (!param1.maximized) {
            param1.minimize(false);
        } else {
            param1.maximize(false);
        }
    }

    public function method_3126(): void {
        this.method_4214();
    }

    public function method_2003(): class_55 {
        return this.var_2835;
    }

    public function set setDefaultQualitySettings(param1: Boolean): void {
        this.var_4476 = param1;
    }

    public function set method_6344(param1: Boolean): void {
        this.var_1467 = param1;
    }

    public function set method_3963(param1: Boolean): void {
        this.var_4452 = param1;
    }

    public function set method_5295(param1: Boolean): void {
        this.var_2397 = param1;
    }

    private function get guiProxy(): GuiProxy {
        return this.var_675.retrieveProxy(GuiProxy.NAME) as GuiProxy;
    }

    protected function get menuProxy(): ItemsControlMenuProxy {
        return this.var_675.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }

    protected function get assetsProxy(): AssetsProxy {
        return this.var_675.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
    }

    public function method_3445(): void {
        if (this.var_186 != null && Boolean(this.var_4160)) {
            this.var_186["cleanup"]();
            this.var_675.removeMediator(ChatMediator.NAME);
        }
    }

    private function get name_47(): class_50 {
        return class_50.getInstance();
    }

    public function method_6045(): void {
        var _loc2_: * = null;
        var _loc1_: Dictionary = this.windows;
        for each(_loc2_ in _loc1_) {
            _loc2_.method_6353();
        }
    }

    public function method_3916(param1: String, param2: String = ""): void {
        var _loc3_: Sprite = new Sprite();
        _loc3_.name = param2;
        _loc3_.mouseEnabled = class_9.const_3029;
        _loc3_.mouseChildren = class_9.const_3029;
        var _loc4_: TextField;
        (_loc4_ = new TextField()).defaultTextFormat = class_18.const_1442;
        _loc4_.embedFonts = class_18.var_3994;
        _loc4_.width = Number(class_50.method_6533()) * 0.6;
        _loc4_.multiline = true;
        _loc4_.wordWrap = true;
        _loc4_.autoSize = TextFieldAutoSize.CENTER;
        _loc4_.textColor = 16777215;
        _loc4_.antiAliasType = "advanced";
        _loc4_.selectable = false;
        _loc4_.text = param1;
        var _loc5_: class_55 = this.method_2003();
        _loc3_.addChild(_loc4_);
        _loc3_.x = -Number(class_50.method_6533()) * 0.5;
        _loc3_.y = Number(class_50.method_1269()) * 0.4;
        _loc5_.addChild(_loc3_);
    }

    public function method_5578(param1: String, param2: int = 2, param3: int = 0): void {
        var _loc4_: TextField = new TextField();
        var _loc5_: TextFormat;
        (_loc5_ = new TextFormat()).font = class_18.const_1442.font;
        _loc5_.size = 48;
        _loc5_.align = TextFormatAlign.CENTER;
        _loc4_.defaultTextFormat = _loc5_;
        _loc4_.width = Number(class_50.method_6533()) * 0.8;
        _loc4_.embedFonts = class_18.var_3994;
        _loc4_.wordWrap = true;
        _loc4_.autoSize = TextFieldAutoSize.CENTER;
        _loc4_.multiline = true;
        _loc4_.textColor = 16777215;
        _loc4_.antiAliasType = "advanced";
        _loc4_.selectable = false;
        _loc4_.text = param1;
        var _loc6_: DisplayObjectContainer = this.method_2003();
        var _loc7_: BitmapData;
        (_loc7_ = new BitmapData(_loc4_.width, _loc4_.height, true, 0)).draw(_loc4_);
        var _loc8_: Bitmap;
        (_loc8_ = new Bitmap(_loc7_)).alpha = 0;
        _loc8_.x = -_loc8_.width * 0.5;
        _loc8_.y = 220;
        var _loc9_: int = _loc8_.x;
        _loc8_.x -= 25;
        _loc6_.addChild(_loc8_);
        TweenMax.to(_loc8_, 1, {
            "delay": param3,
            "x": _loc9_,
            "alpha": 1,
            "glowFilter": {
                "color": 255,
                "alpha": 1,
                "blurX": 10,
                "blurY": 10
            },
            "onComplete": this.method_3904,
            "onCompleteParams": [_loc8_, param2]
        });
    }

    private function method_3904(param1: Bitmap, param2: int): void {
        TweenMax.to(param1, 1, {
            "delay": param2,
            "alpha": 0,
            "onComplete": class_215.removeDisplayObject,
            "onCompleteParams": [param1]
        });
    }
}
}
