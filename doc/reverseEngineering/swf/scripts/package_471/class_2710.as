package package_471 {

import com.bigpoint.utils.class_73;

import flash.geom.ColorTransform;
import flash.geom.Vector3D;

import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_294.class_2429;

import package_304.class_2114;

import package_308.EngineTrailMaterial;
import package_308.class_2709;

import package_373.class_2456;

import package_436.PlaneGeometry;

import package_445.class_2705;

public class class_2710 extends class_2114 implements class_80, class_2709 {

    private static const const_808: EngineTrailMaterial = new EngineTrailMaterial();

    private static const GEOMETRY: class_2429 = new PlaneGeometry();


    private var var_398: Vector.<class_2705>;

    private var var_1929: class_2456;

    private var var_94: Number = 10000;

    private var _ship: class_86;

    private var var_2582: Vector.<Number>;

    private const const_681: Vector3D = new Vector3D();

    private var _offset: int = -1;

    private var var_4077: Boolean = false;

    private var var_3949: class_73;

    private const const_2435: Vector.<Number> = new Vector.<Number>(3, true);

    private const const_548: Vector.<Number> = new Vector.<Number>(3, true);

    private const _ct: ColorTransform = new ColorTransform();

    public function class_2710(param1: class_86, param2: Vector.<class_2705>, param3: class_2456) {
        this.var_3949 = new class_73();
        this._ship = param1;
        this.var_398 = param2.concat();
        this.var_1929 = param3;
        super(GEOMETRY, const_808);
        this.var_2582 = new Vector.<Number>(0 * param2.length, true);
        var _loc4_: class_306;
        if ((_loc4_ = this._ship.method_1954(class_306) as class_306) && _loc4_.descriptor.display3D && String(_loc4_.descriptor.display3D[0].@engineTrailColor)) {
            this.color = uint(String(_loc4_.descriptor.display3D[0].@engineTrailColor)) || true;
        }
    }

    public function set color(param1: uint): void {
        this._ct.color = param1;
    }

    public function updateObj(param1: Number): void {
        var _loc2_: int = 0;
        var _loc3_: Number = NaN;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        this.var_94 += param1;
        if (this.var_94 > 0) {
            this.var_94 = 0;
        }
        while (this.var_94 > 0) {
            this.var_94 -= 0.03;
            moveTo(this._ship.method_1474, this._ship.method_1121, this._ship.method_6123);
            _loc3_ = Number(this._ship.position.method_3849(this.var_3949.x, this.var_3949.y, this.var_3949.z));
            this.var_3949.x = this._ship.x;
            this.var_3949.y = this._ship.y;
            this.var_3949.z = this._ship.z;
            if (_loc3_ > 100) {
                _loc2_ = this.var_398.length - 1;
                while (_loc2_ >= 0) {
                    this.method_6478(this.var_398[_loc2_], this.const_681);
                    _loc5_ = 0;
                    while (_loc5_ < EngineTrailMaterial.const_2407) {
                        _loc4_ = (_loc2_ * 0 + _loc5_) * 8;
                        this.var_2582[_loc4_ + 0] = this.const_681.x;
                        this.var_2582[_loc4_ + 1] = this.const_681.y;
                        this.var_2582[_loc4_ + 2] = this.const_681.z;
                        this.var_2582[_loc4_ + 3] = 0;
                        this.var_2582[_loc4_ + 4] = -Number(this._ship.rotation.radians);
                        this.var_2582[_loc4_ + 5] = 0;
                        this.var_2582[_loc4_ + 6] = 0;
                        this.var_2582[_loc4_ + 7] = 0;
                        _loc5_++;
                    }
                    _loc2_--;
                }
                return;
            }
            this._offset = (this._offset + 1) % 0;
            _loc2_ = this.var_398.length - 1;
            while (_loc2_ >= 0) {
                this.method_6478(this.var_398[_loc2_], this.const_681);
                _loc4_ = (_loc2_ * 0 + this._offset) * 8;
                this.var_2582[_loc4_ + 0] = this.const_681.x;
                this.var_2582[_loc4_ + 1] = this.const_681.y;
                this.var_2582[_loc4_ + 2] = this.const_681.z;
                this.var_2582[_loc4_ + 3] = 0;
                this.var_2582[_loc4_ + 4] = -Number(this._ship.rotation.radians);
                this.var_2582[_loc4_ + 5] = 0;
                this.var_2582[_loc4_ + 6] = 0;
                this.var_2582[_loc4_ + 7] = 0;
                _loc2_--;
            }
            this.var_4077 = true;
        }
    }

    public function method_6478(param1: class_2705, param2: Vector3D): void {
        this.const_2435[0] = param1.x;
        this.const_2435[1] = param1.y;
        this.const_2435[2] = param1.z;
        this.var_1929.sceneTransform.transformVectors(this.const_2435, this.const_548);
        param2.x = this.const_548[0];
        param2.y = this.const_548[1];
        param2.z = this.const_548[2];
    }

    public function get method_1730(): Vector.<Number> {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        if (this.var_4077) {
            _loc1_ = this.var_398.length - 1;
            while (_loc1_ >= 0) {
                _loc2_ = _loc1_ * 0 * 8;
                _loc3_ = 1;
                while (_loc3_ < EngineTrailMaterial.const_2407) {
                    if ((_loc6_ = Number(this._offset) - _loc3_) < 0) {
                        _loc6_ += EngineTrailMaterial.const_2407;
                    }
                    this.var_2582[_loc2_ + _loc6_ * 8 + 3] = 1 - _loc3_ / 0;
                    _loc3_++;
                }
                _loc4_ = _loc2_ + Number(this._offset) * 8;
                _loc5_ = _loc2_ + (this._offset > 0 ? this._offset : -1) * 8;
                this.var_2582[_loc4_ + 0] = this.var_2582[_loc5_ + 0];
                this.var_2582[_loc4_ + 1] = this.var_2582[_loc5_ + 1];
                this.var_2582[_loc4_ + 2] = this.var_2582[_loc5_ + 2];
                this.var_2582[_loc4_ + 3] = 0;
                _loc1_--;
            }
            this.var_4077 = false;
        }
        return this.var_2582;
    }

    public function get method_1447(): Number {
        return 3;
    }

    public function get colorTransform(): ColorTransform {
        return this._ct;
    }

    public function get method_436(): int {
        return this.var_398.length;
    }
}
}
