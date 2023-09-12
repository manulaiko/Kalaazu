package package_445 {

import flash.geom.Vector3D;

import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_299;

import package_114.class_1177;
import package_114.class_312;

import package_115.class_1085;

import package_22.class_198;

import package_373.class_2456;

import package_379.class_2648;

public class class_2654 implements class_1177 {


    private var _ship: class_86;

    private var var_2625: class_312;

    private var var_127: class_2469;

    private var var_432: class_2648;

    private const const_2435: Vector.<Number> = new Vector.<Number>(3, true);

    private const const_548: Vector.<Number> = new Vector.<Number>(3, true);

    public function class_2654(param1: class_299, param2: class_2469) {
        super();
        this._ship = param1.owner as class_86;
        this.var_127 = param2;
        this.var_2625 = (this._ship.method_1954(class_299) as class_299).laser;
        this.var_2625.var_3526 = this;
        this.method_5510();
    }

    public function dispose(): void {
        if (this.var_2625.var_3526 == this) {
            this.var_2625.var_3526 = null;
        }
    }

    private function method_5510(): void {
        if (Boolean(this._ship.shipPattern.method_6389()) && Boolean(this.method_2294)) {
            this.var_432 = this.method_2294.mesh as class_2648;
        } else {
            this.var_432 = null;
        }
    }

    public function method_1470(): Vector.<Vector.<String>> {
        return !!this.method_2941 ? this.method_2941.method_1178 : null;
    }

    public function method_3101(param1: String): Vector3D {
        return !!this.var_432 ? this.var_432.method_1144(param1) : null;
    }

    public function get method_2294(): class_2456 {
        return !!this.var_127.view ? (this.var_127.view.method_3287.length > 0 ? this.var_127.view.method_3287[0] : null) : null;
    }

    public function method_1051(param1: String, param2: Vector3D): void {
        var _loc3_: class_2705 = !!this.var_432 ? this.var_432.method_1144(param1) : null;
        if (_loc3_) {
            this.const_2435[0] = _loc3_.x;
            this.const_2435[1] = _loc3_.y;
            this.const_2435[2] = _loc3_.z;
            this.method_2294.sceneTransform.transformVectors(this.const_2435, this.const_548);
            param2.x = Number(this.const_548[0]) - Number(this._ship.method_1474);
            param2.y = Number(this.const_548[1]) - Number(this._ship.method_1121);
            param2.z = Number(this.const_548[2]) - Number(this._ship.method_6123);
        } else {
            param2.x = 0;
            param2.y = 0;
            param2.z = 0;
        }
    }

    private function get method_2941(): class_1085 {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        if (this._ship.shipPattern.method_6389()) {
            _loc1_ = 0;
            for each(_loc2_ in class_198.var_4079[this._ship.shipPattern.expansionClassID]) {
                if (_loc2_.getPatternID() < 1000) {
                    _loc1_++;
                }
            }
            return class_198.method_2454(this._ship.shipPattern.expansionClassID, Math.max(_loc1_ - 1, 1));
        }
        return null;
    }
}
}
