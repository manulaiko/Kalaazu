package package_373 {

import com.greensock.easing.Quad;

import flash.geom.Vector3D;
import flash.utils.Dictionary;
import flash.utils.getTimer;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.view3D.display3D.*;

import package_19.class_1199;
import package_19.class_68;
import package_19.class_70;

import package_199.class_2453;

import package_297.class_2483;

import package_304.class_2104;

public class class_2159 implements class_80, IDisposable {

    private static const const_298: String = "light";

    private static const UP: Vector3D = new Vector3D(0, -1, 0);


    public const ready: class_68 = new class_70();

    public const completed: class_68 = new class_70();

    public var scale: Number = 1;

    private const const_1516: Vector.<Number> = new Vector.<Number>(3, true);

    private const name_35: Vector3D = new Vector3D();

    private var var_492: Dictionary;

    private var var_506: class_1199;

    private var var_4136: Boolean = false;

    private var var_3197: Boolean = false;

    private var var_560: Number = 0;

    private var var_5037: Boolean = true;

    private var _path: String;

    private var var_1242: Number = 1;

    private var var_697: Boolean = false;

    private var var_4103: int;

    private var var_4910: int = 0;

    private var _view: class_2104;

    public function class_2159(param1: String, param2: Boolean = false, param3: Number = 0, param4: Boolean = true) {
        this.var_492 = new Dictionary();
        super();
        this._path = param1;
        this.var_697 = param2;
        this.var_4910 = param3 * 1000;
        this.var_4103 = getTimer();
        if (param1) {
            this.method_3722("end", this.method_2015);
            this.var_506 = class_1210.instance.method_659.method_1811(param1, class_1210.const_2984, param4);
            this.var_506.addOnce(this.method_310);
        }
    }

    protected function method_2015(): void {
        this.disposeView();
    }

    public function get view(): class_2104 {
        return this._view;
    }

    public function updateObj(param1: Number): void {
        var _loc3_: * = null;
        if (this._view == null) {
            return;
        }
        if (this.var_4136) {
            _loc3_ = class_1210.instance.method_3528.camera.position;
            this.method_1154(_loc3_.x, _loc3_.y, _loc3_.z);
        }
        var _loc2_: Number = 0;
        if (this.var_3197) {
            _loc2_ = 0;
        } else if (this._view.method_5430.scalable !== 0) {
            _loc2_ = Number(this.scale);
            if (Number(this._view.method_5430.maxScale)) {
                _loc2_ = Math.min(_loc2_, Number(this._view.method_5430.maxScale));
            }
        }
        if (this.var_1242 != _loc2_ && !isNaN(_loc2_)) {
            this.var_1242 = _loc2_;
            this.var_560 = 0;
        }
        this.var_560 += param1;
        this._view.scaleX = this._view.scaleY = this._view.scaleZ = !!this.var_5037 ? Quad.easeInOut(Math.min(this.var_560, 0.5), this._view.scaleX, Number(this.var_1242) - Number(this._view.scaleX), 0.5) : Number(this.var_1242);
        if (this.var_560 > 0.5 && Boolean(this.var_3197)) {
            this.method_2298();
        } else {
            this._view.animator.time += param1 * 1000 * Number(this._view.animator.playbackSpeed);
        }
    }

    public function disposeView(param1: Boolean = false): void {
        if (!param1 && this._view && this._view.method_5430.dispose == "scaleDown") {
            this.var_3197 = true;
        } else {
            this.method_2298();
        }
    }

    protected function method_3722(param1: String, param2: Function): void {
        this.var_492[param1] = param2;
    }

    protected function method_1460(): void {
        if (this._view.method_5430.billboard === 1) {
            this.var_4136 = true;
        }
        this._view.animator.time = 0;
        this._view.animator.addEventListener(class_2453.const_786, this.method_1694);
        this.updateObj(0);
        setTimeout(this.ready.dispatch, 1);
    }

    protected function method_2298(): void {
        this.var_506.remove(this.method_310);
        if (this._view) {
            if (this._view.parent) {
                this._view.parent.removeChild(this._view);
            }
            this._view.animator.removeEventListener(class_2453.const_786, this.method_1694);
            if (this.var_697) {
                class_2483.method_3917(this._view, "Particle3D_" + this._path);
            } else {
                this._view.animator.dispose();
                this._view.dispose();
            }
            this._view = null;
        }
        this.completed.dispatch();
    }

    private function method_310(param1: class_2104): void {
        if (Boolean(this.var_4910) && getTimer() - Number(this.var_4103) > this.var_4910) {
            this.completed.dispatch();
            return;
        }
        if (this.var_697) {
            this._view = class_2483.retrieve("Particle3D_" + this._path) as class_2104;
        }
        if (this._view == null) {
            this._view = param1.clone() as class_2104;
        }
        this.method_1460();
    }

    protected function method_1154(param1: Number, param2: Number, param3: Number): void {
        if (this._view.parent) {
            this.const_1516[0] = param1;
            this.const_1516[1] = param2;
            this.const_1516[2] = param3;
            this._view.parent.method_2908.transformVectors(this.const_1516, this.const_1516);
            this.name_35.setTo(this.const_1516[0], this.const_1516[1], this.const_1516[2]);
            this._view.method_1154(this.name_35, UP);
            this._view.rotationX += 90;
        }
    }

    private function method_974(param1: String): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: * = 0;
        var _loc2_: Object = this._view.method_5430[param1];
        if (_loc2_) {
            _loc3_ = Number(Number(_loc2_.radius) || true);
            _loc4_ = Number(Number(_loc2_.duration) || true);
            _loc5_ = Number(Number(_loc2_.fading) || true);
            _loc6_ = 16777215;
            if (_loc2_.color) {
                _loc6_ = uint("0x" + _loc2_.color.substr(1));
            }
            class_1210.instance.name_10.method_6370(this._view.x, this._view.y, this._view.z, _loc6_, _loc3_, 0, 20, _loc4_, _loc5_);
        }
    }

    private function method_1694(param1: class_2453): void {
        var _loc3_: * = null;
        var _loc2_: String = param1.method_6196.method_137;
        if (_loc2_.toLowerCase().indexOf(const_298) == 0) {
            this.method_974(_loc2_);
        } else {
            _loc3_ = this.var_492[_loc2_];
            if (_loc3_ != null) {
                _loc3_();
            }
        }
    }

    public function set method_450(param1: Boolean): void {
        this.var_5037 = param1;
    }
}
}
