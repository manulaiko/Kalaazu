package package_445 {

import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.settings.Settings;

import package_294.class_2429;

import package_297.class_2157;
import package_297.class_2486;

import package_304.class_2114;

import package_371.class_2125;
import package_371.class_2127;

import package_373.class_2134;

import package_436.PlaneGeometry;

import package_443.class_2461;

import package_471.class_2655;

import package_472.class_2656;

import package_9.ResourceManager;

public class class_2469 implements class_2461, IDisposable, class_80 {

    private static const const_2286: Matrix3D = new Matrix3D();

    private static var var_2732: class_2429;


    private var var_2788: class_2654;

    private var var_347: class_2655;

    private var var_127: class_2134;

    private var var_176: class_306;

    private var var_2858: Boolean = true;

    private var var_3664: Boolean = true;

    private var var_93: Boolean = true;

    protected var _ship: class_86;

    private var var_4518: class_2114;

    private var var_4615: uint;

    private var _rotationY: Number = 0;

    private var _rotationZ: Number = 0;

    public function class_2469() {
        super();
    }

    public function get ship(): class_86 {
        return this._ship;
    }

    public function get view(): class_2134 {
        return this.var_127;
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this.var_176 = param1;
        this._ship = param1.owner as class_86;
        this.var_127 = param2;
        this.var_4615 = setTimeout(this.method_2622, !!this._ship.method_6225() ? 2500 : 1000);
        Settings.hoverShips.changed.add(this.method_1229);
    }

    private function method_2622(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc1_: class_306 = this.var_176.owner.method_1954(class_306) as class_306;
        if (Boolean(_loc1_) && Boolean(_loc1_.descriptor)) {
            if (var_2732 == null || var_2732.subGeometries.length == 0) {
                (_loc4_ = new class_2114(new PlaneGeometry(1, 1, 1, 1, true, true))).rotationY = 90;
                class_2656.method_5615(_loc4_);
                var_2732 = _loc4_.geometry;
            }
            _loc2_ = _loc1_.descriptor.display2D[0].@srcKey;
            _loc3_ = ResourceManager.getMovieClip("replacementShips", _loc2_);
            if (_loc3_) {
                _loc6_ = _loc3_.numChildren - 1;
                while (_loc6_ >= 0) {
                    if ((_loc5_ = _loc3_.getChildAt(_loc6_)).name.search("laser") != -1 || _loc5_.name.search("engine") != -1) {
                        _loc5_.visible = false;
                    }
                    _loc6_--;
                }
                this.var_4518 = class_2486.method_6114("replacementShips_" + _loc2_, _loc3_, var_2732);
                this.var_4518.scaleX = _loc3_.height;
                this.var_4518.scaleZ = _loc3_.width;
                this.var_127.addChild(this.var_4518);
                this.method_1382(0);
            }
        }
    }

    public function decorate(): void {
        this.method_1805();
        this.var_2788 = new class_2654(this.var_176.owner.method_1954(class_299) as class_299, this);
        this.var_347 = new class_2655(this);
        this.var_2858 = String(this.var_176.descriptor.display3D.@rotatable) != "false";
        this.var_93 = String(this.var_176.descriptor.display3D.@floating) != "false";
        this.var_3664 = String(this.var_176.descriptor.display3D.@tilting) != "false";
        this.ship.cloaked.changed.add(this.method_513);
        this.method_513();
        this.var_127.const_2015.setTo(5, 5, 5);
        this.var_127.const_172.setTo(5, 5, 5);
        this._ship.name_21.add(this.method_2788);
        this._ship.name_39.add(this.method_4400);
        if (this._ship.method_6406) {
            this.method_4400();
        } else {
            this.method_2788();
        }
        this.method_1382(0);
    }

    private function method_1229(): void {
        if (this._ship.method_6406 == false) {
            if (Settings.hoverShips.value == false) {
                this.method_4400();
            } else if (Settings.hoverShips.value == true) {
                this.method_2788();
            }
        }
    }

    private function method_2788(): void {
        if (Settings.hoverShips.value && Boolean(this.var_93)) {
            this.var_127.method_2788();
        }
    }

    private function method_4400(): void {
        this.var_127.method_4400();
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_1805();
        this.ship.cloaked.changed.remove(this.method_513);
        this._ship.name_21.remove(this.method_2788);
        this._ship.name_39.remove(this.method_4400);
        if (this.var_347) {
            this.var_347.disposeView();
        }
        if (this.var_2788) {
            this.var_2788.dispose();
        }
        TweenLite.killTweensOf(this.var_127);
    }

    private function method_1805(): void {
        clearTimeout(this.var_4615);
        if (this.var_4518) {
            this.var_4518.parent.removeChild(this.var_4518);
            this.var_4518.dispose();
            this.var_4518 = null;
        }
    }

    public function updateObj(param1: Number): void {
        this.var_127.moveTo(this._ship.method_1474, this._ship.method_1121, this._ship.method_6123);
        this.method_1382(param1);
        if (this.var_347) {
            this.var_347.updateObj(param1);
        }
    }

    private function method_513(): void {
        if (this.ship.cloaked.value) {
            TweenLite.to(this.var_127, 0.2, {"alpha": 0.5});
        } else {
            TweenLite.to(this.var_127, 0.2, {"alpha": 1});
        }
    }

    private function method_1382(param1: Number): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        if (Boolean(this.var_2858) || Boolean(this.var_3664)) {
            _loc2_ = Number(this._ship.rotation.degrees) - 90;
            _loc3_ = 0;
            if (param1 > 0) {
                _loc5_ = Number(class_2157.method_2166(this._rotationY, _loc2_));
                this._rotationY = Quad.easeOut(param1, this._rotationY, _loc5_, 0.2);
                _loc7_ = 20;
                _loc8_ = 0.2;
                if (Boolean(this._ship.method_6406) && this._ship.method_2517.target != null) {
                    _loc8_ = 0.08;
                    _loc7_ = 10;
                    _loc6_ = Number(class_2157.method_2166(this._rotationZ, -_loc5_ * 2));
                } else {
                    _loc6_ = Number(class_2157.method_2166(this._rotationZ, _loc5_ * 1));
                }
                this._rotationZ = Math.max(-_loc7_, Math.min(Quad.easeOut(param1, this._rotationZ, _loc6_, _loc8_), _loc7_));
            } else {
                this._rotationY = _loc2_;
                this._rotationZ = _loc3_;
            }
            const_2286.identity();
            if (this.var_2858) {
                if (this.var_3664) {
                    const_2286.appendRotation(-Number(this._rotationZ), Vector3D.Z_AXIS);
                }
                const_2286.appendRotation(this._rotationY, Vector3D.Y_AXIS);
            }
            _loc4_ = class_2125.decompose(const_2286)[1];
            this.var_127.method_1973(_loc4_.x * 0, _loc4_.y * 0, _loc4_.z * 0);
            if (this.var_347) {
                this.var_347.tilt = -Number(this._rotationZ);
            }
        } else {
            this.var_127.rotationX = this.var_127.rotationY = this.var_127.rotationZ = 0;
        }
    }
}
}
