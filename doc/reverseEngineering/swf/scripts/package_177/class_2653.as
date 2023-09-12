package package_177 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import flash.geom.Vector3D;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_10.class_314;

import package_116.class_1178;

import package_295.class_1752;

import package_373.class_2134;

public class class_2653 extends class_1752 implements class_80, IDisposable {


    public const name_67: Vector3D = new Vector3D();

    public var var_2364: class_1752;

    public var var_3298: Vector3D;

    private var var_569: class_1178;

    private var var_1788: class_314;

    private var _view: class_2134;

    private var _owner: class_86;

    private var var_4826: class_73;

    private var _delay: Number = 0.3;

    public function class_2653(param1: class_1178, param2: class_86) {
        super();
        this.var_569 = param1;
        this._owner = param2;
        this.var_4826 = new class_73();
        this.name_67.setTo(param2.method_1474, param2.method_1121, param2.method_6123);
        this.method_2447 = param2.rotation;
        this.update();
        this._owner.cloaked.changed.add(this.method_5507);
        this.method_5507();
    }

    private function method_5507(): void {
        if (this._view) {
            TweenLite.to(this._view, 0.2, {"alpha": (!!this._owner.cloaked.value ? 0.5 : 1)});
        }
    }

    private function update(): void {
        if (this._view) {
            removeChild(this._view);
            this._view = null;
        }
        this._view = new class_2134(UberAssetsLib.instance.getDescriptor(this.var_569.pattern.name_115, UberAssetsLib.LIB_DRONES).display3D[0], null, null, false, "drone " + this.var_569.pattern.name_115 + " uid: " + this._owner.id);
        addChild(this._view);
        this.method_5507();
    }

    private function set method_2447(param1: class_314): void {
        this.var_1788 = param1;
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_2447 = null;
        this._owner.cloaked.changed.remove(this.method_5507);
        if (parent) {
            parent.removeChild(this);
        }
        if (this._view) {
            this._view.disposeView();
            this._view = null;
        }
    }

    public function updateObj(param1: Number): void {
        x = this._delay > 0 ? Quad.easeOut(param1, x, Number(this.name_67.x) - Number(x), this._delay) : Number(this.name_67.x);
        y = this._delay > 0 ? Quad.easeOut(param1, y, Number(this.name_67.y) - Number(y), this._delay) : Number(this.name_67.y);
        z = this._delay > 0 ? Quad.easeOut(param1, z, Number(this.name_67.z) - Number(z), this._delay) : Number(this.name_67.z);
    }

    private function method_2166(param1: Number, param2: Number): Number {
        var _loc3_: Number = (param2 - param1) % 360;
        if (_loc3_ != _loc3_ % 180) {
            _loc3_ = _loc3_ < 0 ? _loc3_ + 360 : _loc3_ - 360;
        }
        return _loc3_;
    }

    public function get method_4574(): class_73 {
        return this.var_4826;
    }

    public function get drone(): class_1178 {
        return this.var_569;
    }

    public function get view(): class_2134 {
        return this._view;
    }
}
}
