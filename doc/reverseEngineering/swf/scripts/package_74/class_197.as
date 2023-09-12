package package_74 {

import com.bigpoint.utils.class_73;

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFormat;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import package_11.class_39;

import package_17.class_62;

import package_174.class_1060;

import package_175.StarmapBattleStationIconProxy;

import package_30.class_91;

import package_76.class_215;

import package_9.ResourceManager;

public class class_197 extends class_91 {


    private var guiManager: class_58;

    private var blink_0: MovieClip;

    private var blink_1: MovieClip;

    private var name_79: Array;

    private var var_1496: Array;

    private var var_4250: Array;

    private var var_1194: MovieClip;

    private var var_4767: DisplayObjectContainer;

    private var textField: TextField;

    public function class_197(param1: class_58) {
        this.name_79 = [];
        super(const_968);
        this.guiManager = param1;
    }

    public static function method_4544(param1: int): int {
        var _loc2_: int = -1;
        if (param1 > 0 && param1 < 16) {
            _loc2_ = 0;
        } else if (param1 > 15 && param1 < 30 || param1 >= 91 && param1 <= 93) {
            _loc2_ = 1;
        }
        return _loc2_;
    }

    public function init(param1: Array, param2: Array, param3: Array): void {
        var _loc4_: * = null;
        this.name_79 = param1;
        this.var_1496 = param2;
        this.var_4250 = param3;
        this.var_1194 = new MovieClip();
        this.var_4767 = new Sprite();
        this.var_1194.x = 10;
        this.var_1194.addChild(this.var_4767);
        this.addChild(this.var_1194);
        _loc4_ = class_39(ResourceManager.name_15.getFinisher("spacemap"));
        this.blink_0 = _loc4_.getEmbeddedMovieClip("blink_0");
        this.blink_0.mouseEnabled = class_9.const_3029;
        this.blink_1 = _loc4_.getEmbeddedMovieClip("blink_1");
        this.blink_1.mouseEnabled = class_9.const_3029;
        this.addChild(this.blink_0);
        this.addChild(this.blink_1);
        this.blink_0.mouseChildren = this.blink_0.mouseEnabled = this.blink_1.mouseChildren = this.blink_1.mouseEnabled = false;
        this.textField = new TextField();
        var _loc5_: TextFormat = new TextFormat(class_18.const_1629.font, class_18.const_1629.size, 16777215);
        this.textField.defaultTextFormat = _loc5_;
        this.textField.embedFonts = class_18.var_620;
        this.textField.wordWrap = true;
        this.textField.antiAliasType = AntiAliasType.ADVANCED;
        this.textField.text = class_88.getItem("noSpacemapData");
        this.addChild(this.textField);
        this.update();
    }

    public function update(): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        class_215.method_5129(this.var_1194);
        var _loc1_: int = -1;
        var _loc2_: class_90 = this.guiManager.method_6185().name_47.map;
        if (_loc2_ != null) {
            _loc1_ = int(method_4544(_loc2_.mapID));
        }
        if (_loc1_ != -1) {
            this.method_3314();
            this.guiManager.method_468(GuiConstants.SPACEMAP_WINDOW).setSize(this.var_1194.x + this.var_1194.width + 12, this.var_1194.y + this.var_1194.height + 34);
            _loc3_ = int(_loc2_.method_1480());
            _loc4_ = this.name_79[_loc3_];
            if (_loc3_ == 16 || _loc3_ == 29) {
                this.blink_1.visible = true;
                this.blink_0.visible = false;
            } else {
                this.blink_1.visible = false;
                this.blink_0.visible = true;
            }
            this.textField.visible = false;
            this.blink_0.x = _loc4_.x + 10;
            this.blink_0.y = _loc4_.y;
            this.blink_1.x = _loc4_.x + 10;
            this.blink_1.y = _loc4_.y;
        } else {
            this.blink_1.visible = false;
            this.blink_0.visible = false;
            this.textField.visible = true;
            this.guiManager.method_468(GuiConstants.SPACEMAP_WINDOW).setSize(300, 150);
            this.textField.width = 280;
            this.textField.height = 100;
            this.textField.x = 8;
            this.textField.y = 8;
        }
        this.method_4521(this.var_4767, this.name_79, _loc1_);
        this.var_1194.addChild(this.var_4767);
    }

    private function method_3314(): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc1_: class_39 = class_39(ResourceManager.name_15.getFinisher("spacemap"));
        var _loc2_: class_90 = this.guiManager.method_6185().name_47.map;
        var _loc3_: int = int(method_4544(_loc2_.mapID));
        this.var_1194.addChild(_loc1_.getEmbeddedBitmap("advanced_page_" + _loc3_));
        if (_loc3_ == 0) {
            _loc8_ = this.var_1496;
        } else {
            _loc8_ = this.var_4250;
        }
        var _loc9_: int = 0;
        while (_loc9_ < _loc8_.length) {
            _loc6_ = int(_loc8_[_loc9_]);
            _loc7_ = class_73(this.name_79[_loc6_]);
            _loc5_ = _loc1_.getEmbeddedBitmap("map_" + _loc6_);
            (_loc4_ = new class_1061(_loc6_, _loc5_)).setPosition(_loc7_.x + 1, _loc7_.y + 1);
            this.var_1194.addChild(_loc4_);
            _loc9_++;
        }
        this.var_4767 = new Sprite();
        this.var_1194.addChild(this.var_4767);
    }

    private function method_4521(param1: DisplayObjectContainer, param2: Array, param3: int): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        class_215.method_5129(param1);
        var _loc6_: int = 0;
        while (_loc6_ < param2.length) {
            if (_loc6_ == 16 || _loc6_ == 29) {
                _loc4_ = 194;
                _loc5_ = 121;
            } else {
                _loc4_ = 80;
                _loc5_ = 50;
            }
            if ((_loc7_ = int(method_4544(_loc6_))) == param3) {
                if ((_loc8_ = param2[_loc6_]) != null) {
                    if (_loc9_ = this.method_1175.method_1794(_loc6_)) {
                        (_loc10_ = new class_1062(_loc9_)).x = _loc8_.x + Number(_loc9_.name_146) / 100 * _loc4_;
                        _loc10_.y = _loc8_.y + Number(_loc9_.name_102) / 100 * _loc5_;
                        param1.addChild(_loc10_);
                    }
                }
            }
            _loc6_++;
        }
    }

    private function get method_1175(): StarmapBattleStationIconProxy {
        return class_62.getInstance().retrieveProxy(StarmapBattleStationIconProxy.NAME) as StarmapBattleStationIconProxy;
    }
}
}
