package net.bigpoint.darkorbit.map.view2D.backgrounds.view {

import com.bigpoint.utils.class_73;

import flash.geom.Rectangle;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.traits.class_1181;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.display.IDisplayObject;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.display.class_1207;
import net.bigpoint.darkorbit.mvc.display.class_1709;
import net.bigpoint.darkorbit.mvc.display.class_1720;
import net.bigpoint.darkorbit.settings.Settings;

import package_197.class_1743;
import package_197.class_2017;

import package_29.class_84;

import package_361.class_2090;
import package_361.class_2094;

import package_362.class_2095;

public class class_1744 implements class_1743 {


    private var _viewBuilder: class_1200;

    private var var_380: Vector.<class_2087>;

    private var var_781: Dictionary;

    private var _map: class_90;

    private var _view: class_1709;

    private var _viewportWidth: int;

    private var _viewportHeight: int;

    private var var_2762: class_84;

    private var var_5012: Vector.<class_2017>;

    private var _mapView: class_87;

    private var var_5055: Number = 0;

    private var var_1384: Number = 0;

    private var var_169: Number = 0;

    private var var_1985: Number = 0;

    public function class_1744(param1: class_1200, param2: class_87) {
        this.var_380 = new Vector.<class_2087>();
        this.var_781 = new Dictionary(true);
        this.var_5012 = new Vector.<class_2017>();
        super();
        this._viewBuilder = param1;
        this._mapView = param2;
        this._view = param1.method_2524();
        this._view["name"] = "BackgroundLayerView2D";
    }

    public function set map(param1: class_90): void {
        if (this._map) {
            this._map.const_1216.remove(this.reload);
            this.var_2762.name_110.remove(this.method_3184);
            this.var_2762.name_33.remove(this.method_1524);
        }
        this._map = param1;
        if (this._map) {
            this._map.const_1216.add(this.reload);
            this.var_2762 = this._map.method_328(class_1181);
            this.var_2762.name_110.add(this.method_3184);
            this.var_2762.name_33.add(this.method_1524);
        }
        this.reload();
    }

    public function method_3361(param1: int, param2: int): void {
        this._viewportWidth = param1;
        this._viewportHeight = param2;
        var _loc3_: int = this.var_380.length - 1;
        while (_loc3_ >= 0) {
            (this.var_380[_loc3_] as class_2087).method_3361(this._viewportWidth, this._viewportHeight);
            _loc3_--;
        }
    }

    private function reload(): void {
        var _loc2_: Boolean = false;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: Number = NaN;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        while (this.var_380.length > 0) {
            this.removeElement(this.var_380[0].data);
        }
        this.var_5012.length = 0;
        if (this._map == null) {
            return;
        }
        var _loc1_: XML = this._map.method_3763;
        for each(_loc10_ in _loc1_.child("backgrounds").child("background")) {
            _loc2_ = false;
            _loc9_ = null;
            if (_loc10_.attribute("isMain").length() > 0) {
                _loc2_ = ParserUtility.parseBooleanFromString(_loc10_.attribute("isMain"));
            } else if (_loc1_.child("backgrounds").child("background").length() == 1) {
                _loc2_ = true;
            }
            if (_loc10_.attribute("region").length() > 0) {
                if ((_loc17_ = _loc10_.attribute("region").toString().split(",")).length > 2) {
                    _loc9_ = new Rectangle(_loc17_[0], _loc17_[1], _loc17_[2], _loc17_[3]);
                } else {
                    _loc9_ = new Rectangle(0, 0, _loc17_[0], _loc17_[1]);
                }
            }
            _loc3_ = 10;
            if (_loc10_.attribute("pFactor").length() > 0) {
                _loc3_ = int(_loc10_.attribute("pFactor"));
            }
            _loc8_ = 0;
            if (_loc10_.attribute("layer").length() > 0) {
                _loc8_ = int(_loc10_.attribute("layer"));
            }
            _loc4_ = 0;
            if (_loc10_.attribute("shiftX").length() > 0) {
                _loc4_ = int(_loc10_.attribute("shiftX"));
            }
            _loc5_ = 0;
            if (_loc10_.attribute("shiftY").length() > 0) {
                _loc5_ = int(_loc10_.attribute("shiftY"));
            }
            _loc6_ = 1;
            if (_loc10_.attribute("scale").length() > 0) {
                _loc6_ = Number(_loc10_.attribute("scale"));
            }
            _loc7_ = -1;
            if (_loc10_.attribute("maskID").length() > 0) {
                _loc7_ = int(_loc10_.attribute("maskID"));
            }
            _loc15_ = new class_2090(int(_loc10_.attribute("typeID")), _loc2_, _loc3_, _loc8_, _loc4_, _loc5_, _loc6_, _loc7_, _loc9_);
            if (false && Boolean(class_2090(_loc15_).isBackgroundTiled(Settings.gpuSupport))) {
                _loc16_ = new class_2088(_loc15_, this._map.method_5076, this._map.method_1901);
            } else {
                _loc16_ = new class_2092(Settings.gpuSupport ? new class_1207() : new class_1720(), _loc15_);
            }
            this.addElement(_loc16_, _loc15_);
        }
        for each(_loc11_ in _loc1_.child("planets").child("planet")) {
            _loc8_ = int(_loc11_.attribute("layer"));
            _loc18_ = new class_2094(int(_loc11_.attribute("typeID")), int(_loc11_.attribute("x")), int(_loc11_.attribute("y")), int(_loc11_.attribute("rotation")), Number(_loc11_.attribute("pFactor")), _loc8_);
            this.addElement(new class_2093(this._viewBuilder.method_2524(), _loc18_), _loc18_);
        }
        for each(_loc12_ in this.var_2762.traits) {
            this.method_3184(_loc12_);
        }
        this.method_5227();
        _loc13_ = this._map.method_3763.lensflares.lensflare;
        for each(_loc14_ in _loc13_) {
            this.var_5012.push(new class_2017(int(_loc14_.attribute("id")), int(_loc14_.attribute("typeID")), new class_73(Number(_loc14_.attribute("x")) * 10, Number(_loc14_.attribute("y")) * 10, Number(_loc14_.attribute("pFactor"))), ParserUtility.parseBooleanFromString(_loc14_.attribute("star"))));
        }
    }

    public function get view(): class_1709 {
        return this._view;
    }

    public function update(param1: Number, param2: Number, param3: int, param4: int): void {
        this.var_5055 = param1;
        this.var_1384 = param2;
        this.var_169 = param3;
        this.var_1985 = param4;
        var _loc5_: int = this.var_380.length - 1;
        while (_loc5_ >= 0) {
            (this.var_380[_loc5_] as class_2087).update(param1, param2, param3, param4);
            _loc5_--;
        }
    }

    public function get backgrounds(): Vector.<class_2087> {
        return this.var_380.concat();
    }

    public function method_822(param1: int, param2: int): Boolean {
        var _loc3_: int = this.var_380.length - 1;
        while (_loc3_ >= 0) {
            if (this.var_380[_loc3_].method_822(param1, param2)) {
                return true;
            }
            _loc3_--;
        }
        return false;
    }

    public function addElement(param1: class_2087, param2: Object): void {
        if (param1) {
            param1.method_3361(this._viewportWidth, this._viewportHeight);
            this.view.addUntypedChild(param1.view);
            this.var_380.push(param1);
            this.var_781[param2] = param1;
        }
    }

    private function method_5227(): void {
        this.var_380.sort(class_2087.compare);
        var _loc1_: int = 0;
        while (_loc1_ < this.var_380.length) {
            this.view.addUntypedChild(this.var_380[_loc1_].view);
            _loc1_++;
        }
    }

    public function removeElement(param1: Object): void {
        var _loc2_: class_2087 = this.var_781[param1];
        if (_loc2_) {
            this.view.removeUntypedChild(_loc2_.view);
            _loc2_.dispose();
            this.var_380.splice(this.var_380.indexOf(_loc2_), 1);
            this.var_781[param1] = null;
            delete this.var_781[param1];
        }
    }

    private function method_3184(param1: class_1181): void {
        this.addElement(new class_2095(this._viewBuilder, param1), param1);
    }

    private function method_1524(param1: class_1181): void {
        this.removeElement(param1);
    }

    public function get method_818(): Vector.<class_2017> {
        return this.var_5012;
    }

    public function method_5468(param1: class_2017, param2: class_73): void {
        param2.x = (Number(param1.method_960.x) - Number(this.var_5055)) / Number(param1.method_960.z) + this.var_169;
        param2.y = (Number(param1.method_960.y) - Number(this.var_1384)) / Number(param1.method_960.z) + this.var_1985;
    }
}
}
