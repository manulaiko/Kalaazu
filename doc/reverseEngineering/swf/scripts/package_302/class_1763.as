package package_302 {

import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.settings.Settings;

import package_120.class_431;

import package_193.class_1197;
import package_193.class_1692;

import package_194.class_1198;
import package_194.class_1697;

import package_22.class_1066;
import package_22.class_1075;
import package_22.class_198;

import package_29.class_267;

public class class_1763 {


    private var _map: class_90;

    private var var_898: Vector.<class_431>;

    private var var_1399: Object;

    private var var_2990: Object;

    private var var_3795: Object;

    private var var_4064: Sprite;

    private var var_2533: Bitmap;

    public function class_1763(param1: Sprite) {
        this.var_898 = new Vector.<class_431>();
        this.var_1399 = {};
        this.var_2990 = {};
        this.var_3795 = {};
        this.var_2533 = new Bitmap();
        super();
        this.var_4064 = param1;
        Settings.qualityPoizone.changed.add(this.method_68);
    }

    public function set map(param1: class_90): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (this._map) {
            this._map.method_2402.ready.remove(this.method_3915);
            this._map.method_328(class_1697).name_110.remove(this.name_110);
            this._map.method_328(class_1692).name_110.remove(this.name_110);
            this._map.method_328(class_1697).name_33.remove(this.name_33);
            this._map.method_328(class_1692).name_33.remove(this.name_33);
        }
        this.var_898.length = 0;
        this.var_3795 = {};
        this.var_1399 = {};
        for (_loc2_ in this.var_2990) {
            _loc3_ = this.var_2990[_loc2_] as class_2156;
            if (_loc3_ != null) {
                _loc3_.dispose();
                if (_loc3_.parent) {
                    _loc3_.parent.removeChild(_loc3_);
                }
                this.var_2990[_loc2_] = null;
                delete this.var_2990[_loc2_];
            }
        }
        this.var_2990 = {};
        this._map = param1;
        if (this._map) {
            this._map.method_2402.ready.add(this.method_3915);
            this._map.method_328(class_1697).name_110.add(this.name_110);
            this._map.method_328(class_1692).name_110.add(this.name_110);
            this._map.method_328(class_1697).name_33.add(this.name_33);
            this._map.method_328(class_1692).name_33.add(this.name_33);
            _loc4_ = this._map.method_328(class_1697).traits.concat(this._map.method_328(class_1692).traits);
            for each(_loc5_ in _loc4_) {
                this.name_110(_loc5_);
            }
            this.method_68();
        }
    }

    private function name_110(param1: class_267): void {
        var _loc2_: class_431 = param1.owner as class_431;
        this.var_898.push(_loc2_);
        if (_loc2_.method_3350 != 0) {
            this.var_1399[_loc2_.method_3350] = true;
            this.var_3795[_loc2_.method_3350] = true;
        }
    }

    private function name_33(param1: class_267): void {
        var _loc2_: class_431 = param1.owner as class_431;
        var _loc3_: int = int(this.var_898.indexOf(_loc2_));
        if (_loc3_ != 1) {
            this.var_898.splice(_loc3_, 1);
            if (_loc2_.method_3350 != 0) {
                this.var_1399[_loc2_.method_3350] = null;
                delete this.var_1399[_loc2_.method_3350];
                this.var_3795[_loc2_.method_3350] = true;
            }
        }
    }

    private function method_3915(): void {
        var _loc1_: * = undefined;
        for (_loc1_ in this.var_3795) {
            this.method_1994(_loc1_ as int);
        }
    }

    private function method_68(): void {
        var _loc1_: * = undefined;
        for (_loc1_ in this.var_1399) {
            this.method_1994(_loc1_ as int);
        }
    }

    private function method_1994(param1: int): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: class_2156 = this.var_2990[param1] as class_2156;
        if (_loc2_ != null) {
            _loc2_.dispose();
            if (_loc2_.parent) {
                _loc2_.parent.removeChild(_loc2_);
            }
            this.var_2990[param1] = null;
            delete this.var_2990[param1];
        }
        this.var_3795[param1] = null;
        delete this.var_3795[param1];
        var _loc3_: Vector.<class_1066> = class_198.var_4779;
        var _loc4_: class_1075 = _loc3_[param1] as class_1075;
        var _loc5_: int = 0;
        if (_loc4_) {
            if (Settings.qualityPoizone.value >= Settings.QUALITY_GOOD && _loc4_.backgroundID > 0) {
                _loc5_ = int(_loc4_.backgroundID);
            } else if (_loc4_.simpleBackgroundID) {
                _loc5_ = int(_loc4_.simpleBackgroundID);
            }
        }
        if (_loc5_ > 0) {
            _loc6_ = new Rectangle(0, 0, this._map.method_5076, this._map.method_1901);
            for each(_loc7_ in this.var_898) {
                if (_loc7_.method_3350 == param1) {
                    _loc6_ = _loc6_.union(_loc7_.bounds);
                }
            }
            this.var_2990[param1] = _loc2_ = new class_2156(_loc5_, _loc6_, this._map.method_5076, this._map.method_1901);
            for each(_loc7_ in this.var_898) {
                if (_loc7_.method_3350 == param1) {
                    if (_loc7_ is class_1198) {
                        this.method_3368(_loc7_ as class_1198, _loc2_, 4278190080);
                    } else if (_loc7_ is class_1197) {
                        this.drawCircle(_loc7_ as class_1197, _loc2_, 4278190080);
                    }
                }
            }
            _loc2_.update();
            class_1210.instance.method_3528.method_1616.addChild(_loc2_);
        }
    }

    private function method_3368(param1: class_431, param2: class_2156, param3: uint): void {
        var _loc4_: class_1198 = param1 as class_1198;
        var _loc5_: Shape;
        (_loc5_ = new Shape()).graphics.beginFill(param3);
        if (param1.name_149) {
            _loc5_.graphics.drawRect(0, 0, 100000, 100000);
        }
        _loc5_.graphics.drawRect(param1.x, param1.y, _loc4_.width, _loc4_.height);
        _loc5_.graphics.endFill();
        var _loc6_: Matrix;
        (_loc6_ = new Matrix()).translate(-Number(param2.bounds.x), -Number(param2.bounds.y));
        _loc6_.scale(param2.method_4662, param2.method_4662);
        param2.method_3162.draw(_loc5_, _loc6_);
    }

    private function drawCircle(param1: class_431, param2: class_2156, param3: uint): void {
        var _loc4_: class_1197 = param1 as class_1197;
        var _loc5_: Shape;
        (_loc5_ = new Shape()).graphics.beginFill(param3);
        if (param1.name_149) {
            _loc5_.graphics.drawCircle(0, 0, 1000000);
        }
        _loc5_.graphics.drawCircle(0, 0, _loc4_.radius.value);
        _loc5_.graphics.endFill();
        var _loc6_: Matrix;
        (_loc6_ = new Matrix()).translate(-Number(param2.bounds.x), -Number(param2.bounds.y));
        _loc6_.translate(param1.position.x, param1.position.y);
        _loc6_.scale(param2.method_4662, param2.method_4662);
        param2.method_3162.draw(_loc5_, _loc6_);
    }
}
}
