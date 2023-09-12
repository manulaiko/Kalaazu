package package_360 {

import com.bigpoint.utils.class_73;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.view2D.class_1206;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_115.class_1063;
import package_115.class_1087;
import package_115.class_316;

import package_14.class_52;

import package_181.class_1104;

import package_22.class_198;
import package_22.class_221;

import package_27.class_82;

import package_9.ResourceManager;
import package_9.class_2314;
import package_9.class_50;

public class class_2384 extends Sprite implements class_52, IDisposable {


    private const DEGTORAD: Number = 0.017453292519943295;

    private const RADTODEG: Number = 57.29577951308232;

    private var var_4560: int = 16;

    private var var_418: Vector.<MovieClip>;

    private var _ship: class_86;

    private var var_2138: Boolean = false;

    private var _tpf: Number = 0;

    private var var_2116: Number = 0;

    private var var_1297: class_2381;

    public function class_2384(param1: class_86, param2: class_2381) {
        this.var_418 = new Vector.<MovieClip>();
        super();
        this._ship = param1;
        this.var_1297 = param2;
        this.var_1297.changed.add(this.update);
        class_50.method_5621(this);
        Settings.qualityEngine.changed.add(this.method_1699);
        Settings.autoQualityReduction.changed.add(this.method_1699);
        this.method_1699();
    }

    public function disposeView(param1: Boolean = false): void {
        this.var_1297.changed.remove(this.update);
        class_50.removeObserver(this);
        Settings.qualityEngine.changed.remove(this.method_1699);
        Settings.autoQualityReduction.changed.remove(this.method_1699);
        class_82.method_3212(this.method_1615.method_3142(), true);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        this._tpf += param1;
        if (this._tpf > 50) {
            this._tpf = 0;
            if (Boolean(this.var_418) && this.var_418.length > 0) {
                _loc2_ = int(this.var_418[0].framesLoaded);
                if (this._ship.method_6406) {
                    if (this.var_4560 > -1) {
                        --this.var_4560;
                    }
                } else if (this.var_4560 < _loc2_ + 1) {
                    ++this.var_4560;
                }
                for each(_loc3_ in this.var_418) {
                    _loc3_.gotoAndStop(this.var_4560);
                }
            }
            if (this._ship.method_6225()) {
                this.method_770();
            }
        }
        if (Boolean(this.var_2138) && this.var_4560 < 10 && Boolean(this._ship.method_6406)) {
            this.var_2116 += param1;
            if (this.var_2116 > 80) {
                this.method_6013();
                this.var_2116 = 0;
            }
        }
    }

    private function method_770(): void {
        if (this.method_1615.method_3142() == -1) {
            return;
        }
        if (this._ship.method_6406) {
            class_82.playSoundEffect(this.method_1615.method_3142(), true, true, -1, -1, true, true);
        } else {
            class_82.method_3212(this.method_1615.method_3142(), true);
        }
    }

    private function update(): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc1_: MovieClip = this.var_1297.clip;
        if (_loc1_ == null) {
            this.method_5109(0);
            return;
        }
        var _loc2_: class_1087 = class_198.method_620(this.shipPattern.method_3225());
        if (_loc1_.framesLoaded == 1) {
            _loc4_ = int(this.var_1297.clipRotation);
            this.method_4206(_loc1_);
            _loc3_ = this.shipPattern.var_2888;
        } else if (_loc2_ != null) {
            _loc4_ = _loc1_.currentFrame - 1;
            if (Settings.qualityEngine.value >= Settings.QUALITY_MEDIUM || _loc2_.var_2183 == null) {
                _loc3_ = _loc2_.enginePositions;
            } else {
                _loc3_ = _loc2_.var_2183;
            }
        }
        if (_loc3_ == null) {
            _loc3_ = new Vector.<Vector.<class_73>>();
        }
        if (this.var_418.length != _loc3_.length) {
            this.method_5109(_loc3_.length);
        }
        var _loc7_: int = 0;
        while (_loc7_ < this.var_418.length) {
            _loc5_ = this.var_418[_loc7_];
            _loc4_ %= _loc3_[_loc7_].length;
            _loc6_ = _loc3_[_loc7_][_loc4_];
            _loc5_.x = _loc6_.x;
            _loc5_.y = _loc6_.y;
            _loc5_.rotation = this._ship.rotation.degrees;
            _loc7_++;
        }
    }

    private function method_4206(param1: MovieClip): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        if (this.shipPattern.var_2888 == null) {
            this.shipPattern.var_2888 = new Vector.<Vector.<class_73>>();
            _loc2_ = param1.numChildren - 1;
            while (_loc2_ >= 0) {
                _loc3_ = param1.getChildAt(_loc2_);
                if (_loc3_.name.search("engine") != -1) {
                    _loc4_ = Math.sqrt(_loc3_.x * _loc3_.x + _loc3_.y * _loc3_.y);
                    _loc5_ = Math.round(Math.atan2(_loc3_.y, _loc3_.x) * 57.29577951308232);
                    _loc7_ = new Vector.<class_73>(360, true);
                    _loc8_ = 0;
                    while (_loc8_ < 360) {
                        _loc6_ = new class_73(int(_loc4_ * Math.cos((_loc8_ + _loc5_) * 0.017453292519943295)), int(_loc4_ * Math.sin((_loc8_ + _loc5_) * 0.017453292519943295)));
                        _loc7_[_loc8_] = _loc6_;
                        _loc8_++;
                    }
                    this.shipPattern.var_2888.push(_loc7_);
                }
                _loc2_--;
            }
        }
        _loc2_ = param1.numChildren - 1;
        while (_loc2_ >= 0) {
            _loc3_ = param1.getChildAt(_loc2_);
            if (_loc3_.name.search("engine") != -1) {
                param1.removeChild(_loc3_);
            }
            _loc2_--;
        }
    }

    private function method_5109(param1: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        while (this.var_418.length) {
            removeChild(this.var_418.pop());
        }
        var _loc2_: int = int(this.shipPattern.method_3225());
        if (_loc2_ != -1) {
            _loc3_ = null;
            if (this.method_1615.getResKey() != "") {
                _loc3_ = class_39(ResourceManager.name_15.getFinisher(this.method_1615.getResKey()));
            }
            _loc5_ = 0;
            while (_loc5_ < param1) {
                if (_loc3_ != null) {
                    _loc4_ = MovieClip(_loc3_.getEmbeddedMovieClip("mc"));
                } else {
                    _loc4_ = new MovieClip();
                }
                this.var_418.push(_loc4_);
                addChild(_loc4_);
                _loc5_++;
            }
        }
    }

    private function get shipPattern(): class_316 {
        return this._ship.shipPattern;
    }

    private function get method_1615(): class_221 {
        return class_198.var_441[this.shipPattern.method_2493()];
    }

    private function method_1699(): void {
        if (Settings.qualityEngine.value < Settings.QUALITY_GOOD || false && Settings.autoQualityReduction.value >= Settings.AQ_NO_ENGINE_SMOKE_LIMIT) {
            this.var_2138 = false;
        } else {
            this.var_2138 = true;
        }
    }

    private function method_6013(): void {
        var _loc1_: * = null;
        var _loc3_: * = null;
        if (Boolean(this._ship.cloaked.value) && !this._ship.method_6225()) {
            return;
        }
        var _loc2_: class_1063 = class_198.var_2598[this.shipPattern.method_4746()];
        for each(_loc3_ in this.var_418) {
            _loc1_ = class_2314.method_2243(_loc2_.resKey);
            if (_loc1_ != null) {
                _loc1_.x = this._ship.position.x + _loc3_.x;
                _loc1_.y = this._ship.position.y + _loc3_.y;
                _loc1_.alpha = !!this._ship.cloaked.value ? 0.3 : 1;
                class_1206.fxLayer.addChildAt(_loc1_, 0);
                _loc1_.frame = 1;
                _loc1_.fps = 45;
                _loc1_.method_693 = true;
                _loc1_.method_4572();
                setTimeout(class_2314.method_4047, 1000 * Number(_loc1_.framesLoaded) / Number(_loc1_.fps), _loc1_);
            }
        }
    }

    public function get method_2839(): Vector.<MovieClip> {
        return this.var_418;
    }
}
}
