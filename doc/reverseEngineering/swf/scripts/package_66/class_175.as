package package_66 {

import com.bigpoint.utils.class_73;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import org.puremvc.as3.multicore.patterns.facade.Facade;

import package_11.class_39;

import package_14.class_52;

import package_17.class_62;

import package_22.class_1043;
import package_22.class_169;
import package_22.class_198;

import package_30.class_185;
import package_30.class_218;
import package_30.class_219;
import package_30.class_91;

import package_33.class_93;

import package_38.class_163;
import package_38.class_902;
import package_38.class_905;

import package_46.class_131;

import package_69.class_181;

import package_70.SimpleWindowEvent;

import package_9.ResourceManager;
import package_9.class_50;

public class class_175 implements class_52 {


    private var var_271: Facade;

    private var _guiManager: class_58;

    private var var_4693: class_218;

    private var var_1238: class_218;

    private var var_489: int;

    private var _tpf: Number = 0;

    private var var_3633: Number = 0;

    public function class_175(param1: class_58) {
        super();
        this._guiManager = param1;
        this.var_271 = class_62.getInstance();
        this.method_4950();
        this.method_3275();
    }

    public static function method_517(param1: uint): String {
        var _loc2_: * = null;
        switch (param1) {
            case 0:
                _loc2_ = "LASER";
                break;
            case 1:
                _loc2_ = "ROCKET";
                break;
            case 2:
                _loc2_ = "DRIVING";
                break;
            case 3:
                _loc2_ = "SHIELD";
        }
        return _loc2_;
    }

    public static function method_2527(param1: String): uint {
        var _loc2_: Number = 0;
        switch (param1) {
            case "LASER":
                _loc2_ = 0;
                break;
            case "ROCKET":
                _loc2_ = 1;
                break;
            case "DRIVING":
                _loc2_ = 2;
                break;
            case "SHIELD":
                _loc2_ = 3;
        }
        return _loc2_;
    }

    public function method_175(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        _loc1_ = class_181.method_4666([class_163.const_98, class_163.const_225, class_163.const_2375, class_163.const_1025, class_163.PALLADIUM]);
        _loc2_ = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_2811);
        _loc3_ = _loc2_.method_1864();
        _loc4_ = 0;
        _loc5_ = 0;
        while (_loc5_ < _loc3_.length) {
            if (_loc3_[_loc5_] is class_1047) {
                _loc7_ = _loc3_[_loc5_];
                _loc6_ = _loc1_[_loc4_++];
                _loc7_.method_4016(_loc6_.count);
                _loc7_.method_2920();
            }
            _loc5_++;
        }
        _loc1_ = class_181.method_4666([class_163.const_763, class_163.const_2322, class_163.PROMERIUM, class_163.SEPROM]);
        _loc2_ = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_1597);
        _loc3_ = _loc2_.method_1864();
        _loc4_ = 0;
        _loc5_ = 0;
        while (_loc5_ < _loc3_.length) {
            if (_loc3_[_loc5_] is class_1050) {
                _loc8_ = _loc3_[_loc5_];
                _loc6_ = _loc1_[_loc4_++];
                _loc8_.method_4016(_loc6_.count);
                _loc8_.method_2920();
            }
            _loc5_++;
        }
        _loc2_ = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_1971);
        _loc3_ = _loc2_.method_1864();
        _loc1_ = class_181.method_4666([class_163.const_98, class_163.const_225, class_163.const_2375]);
        _loc4_ = 0;
        _loc5_ = 0;
        while (_loc5_ < _loc3_.length) {
            if (_loc3_[_loc5_] is class_1047) {
                _loc9_ = _loc3_[_loc5_];
                _loc6_ = _loc1_[_loc4_++];
                _loc9_.method_4016(_loc6_.count);
                _loc9_.method_2920();
            }
            _loc5_++;
        }
        _loc2_ = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_2343);
        _loc3_ = _loc2_.method_1864();
        _loc1_ = class_181.method_4666([class_163.const_763, class_163.const_2322, class_163.PROMERIUM, class_163.const_1025]);
        _loc4_ = 0;
        _loc5_ = 0;
        while (_loc5_ < _loc3_.length) {
            if (_loc3_[_loc5_] is class_1047) {
                _loc10_ = _loc3_[_loc5_];
                _loc6_ = _loc1_[_loc4_++];
                _loc10_.method_4016(_loc6_.count);
                _loc10_.method_2920();
            }
            _loc5_++;
        }
    }

    public function method_4040(param1: String, param2: int, param3: int): void {
        var _loc6_: * = null;
        var _loc4_: class_1046;
        if ((_loc4_ = this.method_3074(param1)) != null) {
            _loc4_.method_5928(param3);
        }
        var _loc5_: class_1050;
        if ((_loc5_ = this.method_3598(param2)) != null) {
            _loc4_.method_1554();
            if (param3 > 0) {
                _loc6_ = _loc5_.method_420();
                _loc4_.method_5287(_loc6_);
            }
        }
    }

    private function method_3074(param1: String): class_1046 {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc2_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        if (_loc2_) {
            _loc3_ = _loc2_.method_3694(class_93.const_922);
            _loc4_ = _loc3_.method_1864();
            _loc5_ = 0;
            while (_loc5_ < _loc4_.length) {
                if (_loc4_[_loc5_] is class_1046) {
                    if ((_loc6_ = _loc4_[_loc5_]).identifier == param1) {
                        return _loc6_;
                    }
                }
                _loc5_++;
            }
        }
        return null;
    }

    private function method_3598(param1: int): class_1050 {
        var _loc6_: * = null;
        var _loc2_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc3_: class_93 = _loc2_.method_3694(class_93.const_1597);
        var _loc4_: Array = _loc3_.method_1864();
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_.length) {
            if (_loc4_[_loc5_] is class_1050) {
                if ((_loc6_ = _loc4_[_loc5_]).type == param1) {
                    return _loc6_;
                }
            }
            _loc5_++;
        }
        return null;
    }

    private function method_3316(param1: MouseEvent): void {
        this.method_4622(true);
    }

    private function method_5270(param1: MouseEvent): void {
        this.method_4622(false);
        this.method_175();
    }

    private function method_4622(param1: Boolean): void {
        var _loc2_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc3_: class_93 = _loc2_.method_3694(class_93.const_2811);
        var _loc4_: class_93 = _loc2_.method_3694(class_93.const_1597);
        var _loc5_: class_93 = _loc2_.method_3694(class_93.const_922);
        var _loc6_: class_93 = _loc2_.method_3694(class_93.const_1971);
        var _loc7_: class_93 = _loc2_.method_3694(class_93.const_2343);
        var _loc8_: class_93 = _loc2_.method_3694(class_93.const_2085);
        var _loc9_: class_93 = _loc2_.method_3694(class_93.const_1301);
        _loc6_.visible = param1;
        _loc7_.visible = param1;
        _loc8_.visible = param1;
        _loc9_.visible = param1;
        this.var_4693.selected = param1;
        _loc3_.visible = !param1;
        _loc4_.visible = !param1;
        _loc5_.visible = !param1;
        this.var_1238.selected = !param1;
    }

    public function method_4950(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = this._guiManager.createWindow(GuiConstants.REFINEMENT_WINDOW) as class_131;
            _loc1_.addEventListener(SimpleWindowEvent.const_940, this.method_6500);
            _loc1_.addEventListener(SimpleWindowEvent.const_1770, this.method_376);
            _loc2_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            _loc3_ = _loc1_.method_3694(class_93.const_2935);
            this.var_4693 = new class_218(class_185.const_2934, class_88.getItem("lab_btn_refinement"), _loc2_.getEmbeddedMovieClip("button1"));
            this.var_4693.selected = true;
            this.var_4693.addEventListener(MouseEvent.CLICK, this.method_3316);
            _loc3_.addElement(this.var_4693);
            this.var_1238 = new class_218(class_185.const_2895, class_88.getItem("lab_btn_update"), _loc2_.getEmbeddedMovieClip("button1"));
            this.var_1238.addEventListener(MouseEvent.CLICK, this.method_5270);
            _loc3_.addElement(this.var_1238, class_93.const_2568);
            _loc4_ = new class_91(class_91.const_38);
            (_loc5_ = new Sprite()).graphics.lineStyle(1, 8289918);
            _loc5_.graphics.moveTo(0, 0);
            _loc5_.graphics.lineTo(434, 0);
            _loc4_.addChild(_loc5_);
            _loc4_.y = 20;
            _loc3_.addElement(_loc4_, class_93.const_2374, 0);
            _loc1_.method_1655(_loc3_);
            this.method_3886();
            this.method_533();
            if (_loc1_.maximized) {
                this.method_3894();
            }
        }
    }

    private function method_6500(param1: SimpleWindowEvent): void {
        this.method_4560();
        this.method_3894();
        this.method_3275();
    }

    private function method_376(param1: Event): void {
        this.method_4560();
    }

    private function method_3894(): void {
        class_50.method_5621(this);
    }

    private function method_135(): void {
        var _loc1_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        this.method_4560();
        _loc1_.minimize(true);
    }

    private function method_4560(): void {
        this.var_3633 = 0;
        class_50.removeObserver(this);
    }

    public function updateTimer(param1: Number): void {
        this._tpf += param1;
        if (this._tpf > 999) {
            this.method_3275();
            ++this.var_3633;
            if (this.var_3633 > 599) {
                this.method_135();
            }
            this._tpf = 0;
        }
    }

    private function method_3275(): void {
        var _loc1_: class_902 = new class_902();
        this.var_271.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, _loc1_);
    }

    private function method_3886(): void {
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: int = 0;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: * = null;
        var _loc22_: Boolean = false;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc25_: int = 0;
        var _loc26_: * = null;
        var _loc1_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc2_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc3_: class_93 = _loc1_.method_3694(class_93.const_1301);
        var _loc4_: class_91;
        (_loc4_ = new class_91(class_91.const_38)).addChild(_loc2_.getEmbeddedBitmap("ore_tree"));
        _loc3_.addElement(_loc4_);
        _loc1_.method_1655(_loc3_);
        var _loc5_: class_93 = _loc1_.method_3694(class_93.const_1971);
        var _loc6_: int = 0;
        var _loc7_: int = 8;
        for each(_loc11_ in class_9.var_2751.refinementWindow.refinement.staticOres.ore) {
            _loc8_ = parseInt(_loc11_.attribute("type"));
            _loc9_ = class_198.var_4944[_loc8_];
            _loc10_ = null;
            if (_loc11_.attribute("tooltipKey").length() > 0) {
                _loc10_ = class_88.getItem(_loc11_.attribute("tooltipKey"));
            }
            (_loc17_ = new class_1047(this, _loc8_, _loc9_.languageKey, _loc9_.resKey, _loc10_)).x = _loc6_;
            _loc17_.y = 40;
            _loc6_ = _loc6_ + _loc17_.background.width + _loc7_;
            _loc5_.addElement(_loc17_, class_93.const_2374, 1);
        }
        _loc1_.method_1655(_loc5_);
        _loc12_ = _loc1_.method_3694(class_93.const_2343);
        _loc13_ = _loc1_.method_3694(class_93.const_2085);
        _loc6_ = 0;
        _loc7_ = 8;
        for each(_loc11_ in class_9.var_2751.refinementWindow.refinement.ores.ore) {
            _loc8_ = parseInt(_loc11_.attribute("type"));
            _loc9_ = class_198.var_4944[_loc8_];
            _loc10_ = null;
            if ((_loc18_ = _loc11_.attribute("tooltipKey")).length > 0) {
                if ((_loc24_ = _loc18_.split(",")).length > 1) {
                    _loc10_ = "";
                    _loc25_ = 0;
                    while (_loc25_ < _loc24_.length) {
                        _loc10_ += class_88.getItem(_loc24_[_loc25_]) + "\n";
                        _loc25_++;
                    }
                } else {
                    _loc10_ = class_88.getItem(_loc11_.attribute("tooltipKey"));
                }
            }
            if ((_loc19_ = _loc9_.method_3065)[0]) {
                _loc20_ = _loc19_[0];
                _loc21_ = class_198.var_4944[_loc20_.name_2];
                _loc10_ = (_loc10_ = _loc10_.replace("%COUNT_1%", _loc20_.count)).replace("%ORE_1%", class_88.getItem(_loc21_.languageKey));
            }
            if (_loc19_[1]) {
                _loc20_ = _loc19_[1];
                _loc21_ = class_198.var_4944[_loc20_.name_2];
                _loc10_ = (_loc10_ = _loc10_.replace("%COUNT_2%", _loc20_.count)).replace("%ORE_2%", class_88.getItem(_loc21_.languageKey));
            }
            if (_loc19_[2]) {
                _loc20_ = _loc19_[2];
                _loc21_ = class_198.var_4944[_loc20_.name_2];
                _loc10_ = (_loc10_ = _loc10_.replace("%COUNT%", _loc20_.count)).replace("%ORE%", class_88.getItem(_loc21_.languageKey));
            }
            _loc22_ = false;
            if (_loc11_.attribute("button").length() > 0) {
                _loc22_ = ParserUtility.parseBooleanFromString(_loc11_.attribute("button"));
            }
            (_loc23_ = new class_1047(this, _loc8_, _loc9_.languageKey, _loc9_.resKey, _loc10_)).x = _loc6_;
            _loc23_.y = 55;
            if (_loc22_) {
                (_loc26_ = new class_218(class_185.const_2934, class_88.getItem("lab_btn_refine"), _loc2_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_4392);
                _loc26_.width = _loc23_.width;
                _loc26_.y = 100;
                _loc23_.addChild(_loc26_);
            }
            _loc6_ = _loc6_ + _loc23_.background.width + _loc7_;
            _loc12_.addElement(_loc23_, class_93.const_2374, 1);
        }
        (_loc14_ = class_1047(_loc12_.getElementAt(2))).y = 215;
        _loc14_.x = 42;
        (_loc15_ = class_1047(_loc12_.getElementAt(3))).x = 220;
        _loc16_ = _loc12_.width > _loc5_.width ? int(_loc12_.width) : int(_loc5_.width);
        var _loc27_: * = 260 - _loc16_ / 2;
        _loc3_.x = 260 - _loc16_ / 2;
        _loc12_.x = _loc27_;
        _loc5_.x = Number(_loc12_.x) - 47;
        _loc1_.method_1655(_loc12_);
        _loc1_.method_1655(_loc13_);
    }

    private function method_4392(param1: MouseEvent): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc2_: class_218 = param1.currentTarget as class_218;
        var _loc3_: class_1047 = _loc2_.parent as class_1047;
        this.var_489 = _loc3_.type;
        var _loc4_: class_73 = this.method_3609(GuiConstants.REFINEMENT_WINDOW);
        var _loc5_: class_131;
        if (_loc5_ = this.guiManager.createWindow(GuiConstants.REFINEMENT_REFINE_WINDOW, null, 1, _loc4_) as class_131) {
            (_loc6_ = new class_93(this.guiManager, class_93.const_1852)).x = 20;
            _loc6_.y = 35;
            _loc7_ = new class_219(200, 20, new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215), class_88.getItem(_loc3_.languageKey), TextFormatAlign.LEFT);
            _loc6_.addElement(_loc7_);
            _loc8_ = new class_219(200, 20, new TextFormat(class_18.const_2667.font, class_18.const_2667.size, 16777215), class_88.getItem("lab_refine_question"), TextFormatAlign.LEFT);
            _loc6_.addElement(_loc8_, class_93.const_3298);
            _loc9_ = new class_1048(this.guiManager);
            _loc6_.addElement(_loc9_, class_93.const_3298);
            this.method_5226(_loc3_.type, _loc9_);
            _loc10_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            (_loc11_ = new class_218(class_185.const_2597, class_88.getItem("lab_btn_refine"), _loc10_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_413);
            _loc6_.addElement(_loc11_);
            _loc11_.y = 90;
            (_loc12_ = new class_218(class_185.const_2551, class_88.getItem("lab_cancel"), _loc10_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_3024);
            _loc6_.addElement(_loc12_, class_93.const_2568);
            _loc5_.method_1655(_loc6_);
            _loc5_.method_1321(true);
        } else if (_loc5_ = this.guiManager.method_468(GuiConstants.REFINEMENT_REFINE_WINDOW)) {
            _loc5_.maximize(false);
        }
    }

    private function method_413(param1: MouseEvent): void {
        var _loc2_: class_131 = this.guiManager.method_468(GuiConstants.REFINEMENT_REFINE_WINDOW);
        var _loc3_: class_93 = _loc2_.method_3694(class_93.const_1852);
        var _loc4_: class_1048 = class_1048(_loc3_.method_89(class_91.const_1723));
        var _loc5_: int = parseInt(_loc4_.name_54.selectedLabel);
        var _loc6_: class_905;
        (_loc6_ = new class_905()).var_834.count = _loc5_;
        _loc6_.var_834.var_4809.var_2008 = uint(this.var_489);
        this.guiManager.method_6185().method_6154().sendRequest(_loc6_);
        this.method_1024();
    }

    private function method_3024(param1: MouseEvent): void {
        this.method_1024();
    }

    private function method_1024(): void {
        var _loc5_: * = null;
        var _loc1_: class_131 = this.guiManager.method_468(GuiConstants.REFINEMENT_REFINE_WINDOW);
        var _loc2_: class_93 = _loc1_.method_3694(class_93.const_1852);
        var _loc3_: Array = _loc2_.method_632(class_91.const_2623);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.length) {
            if ((_loc5_ = _loc3_[_loc4_]).getType() == class_185.const_2597) {
                _loc5_.removeEventListener(MouseEvent.CLICK, this.method_413);
            }
            if (_loc5_.getType() == class_185.const_2551) {
                _loc5_.removeEventListener(MouseEvent.CLICK, this.method_3024);
            }
            _loc4_++;
        }
        this.guiManager.closeWindow(_loc1_);
    }

    private function method_5226(param1: int, param2: class_1048): void {
        var _loc11_: * = null;
        var _loc3_: class_169 = class_198.var_4944[param1];
        var _loc4_: Array;
        var _loc5_: class_1043 = (_loc4_ = _loc3_.method_3065)[0];
        var _loc6_: class_1043 = _loc4_[1];
        var _loc7_: class_1043 = _loc4_[2];
        var _loc8_: class_169 = class_198.var_4944[_loc5_.name_2];
        var _loc9_: class_169 = class_198.var_4944[_loc6_.name_2];
        var _loc10_: int = Math.min(Number(_loc8_.count) / Number(_loc5_.count), Number(_loc9_.count) / Number(_loc6_.count));
        if (_loc7_) {
            _loc11_ = class_198.var_4944[_loc7_.name_2];
            _loc10_ = Math.min(_loc10_, Number(_loc11_.count) / Number(_loc7_.count));
        }
        param2.method_4625(_loc10_);
    }

    private function method_533(): void {
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: int = 0;
        var _loc20_: * = null;
        var _loc21_: * = null;
        var _loc22_: * = null;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc1_: class_131 = this._guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc2_: class_93 = _loc1_.method_3694(class_93.const_2811);
        _loc2_.visible = false;
        var _loc3_: class_219 = new class_219(340, 20, new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215), class_88.getItem("lab_title"), TextFormatAlign.LEFT);
        _loc2_.addElement(_loc3_);
        var _loc4_: int = 0;
        var _loc5_: int = 8;
        for each(_loc8_ in class_9.var_2751.refinementWindow.update.staticOres.ore) {
            _loc6_ = parseInt(_loc8_.attribute("type"));
            _loc7_ = class_198.var_4944[_loc6_];
            _loc14_ = null;
            if (_loc8_.attribute("tooltipKey").length() > 0) {
                _loc14_ = class_88.getItem(_loc8_.attribute("tooltipKey"));
            }
            (_loc15_ = new class_1047(this, _loc6_, _loc7_.languageKey, _loc7_.resKey, _loc14_)).x = _loc4_;
            _loc15_.y = 40;
            _loc4_ = _loc4_ + _loc15_.background.width + _loc5_;
            _loc2_.addElement(_loc15_, class_93.const_2374, 1);
        }
        _loc1_.method_1655(_loc2_);
        (_loc9_ = _loc1_.method_3694(class_93.const_1597)).visible = false;
        _loc10_ = new class_219(340, 40, new TextFormat(class_18.const_2667.font, class_18.const_2667.size, 16777215), class_88.getItem("labor_intro"), TextFormatAlign.LEFT);
        _loc9_.addElement(_loc10_);
        _loc4_ = 0;
        _loc5_ = 8;
        for each(_loc8_ in class_9.var_2751.refinementWindow.update.ores.ore) {
            _loc6_ = parseInt(_loc8_.attribute("type"));
            _loc7_ = class_198.var_4944[_loc6_];
            _loc16_ = _loc8_.attribute("iconResKey");
            _loc17_ = _loc8_.attribute("tooltipKey");
            (_loc18_ = new class_1050(this, _loc6_, _loc7_.languageKey, _loc7_.resKey, _loc16_, _loc17_)).x = _loc4_;
            _loc18_.y = 55;
            _loc4_ = _loc4_ + _loc18_.background.width + _loc5_;
            _loc9_.addElement(_loc18_, class_93.const_2374, 1);
        }
        _loc1_.method_1655(_loc9_);
        (_loc11_ = _loc1_.method_3694(class_93.const_922)).visible = false;
        _loc4_ = 0;
        for each(_loc12_ in class_9.var_2751.refinementWindow.update.items.item) {
            _loc19_ = parseInt(_loc12_.attribute("type"));
            _loc20_ = _loc12_.attribute("languageKey");
            _loc21_ = _loc12_.attribute("resKey");
            _loc22_ = _loc12_.attribute("identifier");
            _loc23_ = _loc12_.attribute("ammountKey");
            (_loc24_ = new class_1046(this, _loc19_, _loc20_, _loc21_, _loc22_, _loc23_)).x = _loc4_;
            _loc4_ = _loc4_ + _loc24_.background.width + _loc5_;
            _loc11_.addElement(_loc24_, class_93.const_2374, 1);
        }
        _loc1_.method_1655(_loc11_);
        _loc13_ = _loc11_.width > _loc9_.width ? int(_loc11_.width) : int(_loc9_.width);
        var _loc25_: * = 230 - _loc13_ / 2;
        _loc11_.x = 230 - _loc13_ / 2;
        _loc9_.x = _loc25_;
    }

    public function get guiManager(): class_58 {
        return this._guiManager;
    }

    public function method_3609(param1: String): class_73 {
        var _loc2_: class_131 = this._guiManager.method_468(param1);
        var _loc3_: Number = _loc2_.x + Number(_loc2_.width) / 2;
        var _loc4_: Number = Number(class_50.method_6533());
        var _loc5_: Number = 100 * _loc3_ / _loc4_;
        return new class_73(_loc5_, 50);
    }
}
}
