package package_299 {

import away3d.arcane;

import flash.events.EventDispatcher;
import flash.geom.Matrix3D;
import flash.geom.Rectangle;
import flash.geom.Vector3D;

import package_199.class_2139;

import package_371.class_2125;

import package_374.AbstractMethodError;

public class class_1757 extends EventDispatcher {


    protected var _matrix: Matrix3D;

    protected var var_2547: Rectangle;

    protected var var_657: Rectangle;

    protected var var_2628: Number = 20;

    protected var var_3375: Number = 3000;

    protected var var_2640: Number = 1;

    protected var var_585: Boolean = true;

    protected var var_4190: Vector.<Number>;

    private var var_1379: Matrix3D;

    private var var_2993: Boolean = true;

    public function class_1757() {
        this.var_2547 = new Rectangle();
        this.var_657 = new Rectangle();
        this.var_4190 = new Vector.<Number>(24, true);
        super();
        this._matrix = new Matrix3D();
    }

    public function get method_2727(): Vector.<Number> {
        return this.var_4190;
    }

    public function set method_2727(param1: Vector.<Number>): void {
        this.var_4190 = param1;
    }

    public function get matrix(): Matrix3D {
        if (this.var_585) {
            this.method_739();
            this.var_585 = false;
        }
        return this._matrix;
    }

    public function set matrix(param1: Matrix3D): void {
        this._matrix = param1;
        this.method_320();
    }

    public function get method_5049(): Number {
        return this.var_2628;
    }

    public function set method_5049(param1: Number): void {
        if (param1 == this.var_2628) {
            return;
        }
        this.var_2628 = param1;
        this.method_320();
    }

    public function get method_1840(): Number {
        return this.var_3375;
    }

    public function set method_1840(param1: Number): void {
        if (param1 == this.var_3375) {
            return;
        }
        this.var_3375 = param1;
        this.method_320();
    }

    public function method_642(param1: Vector3D, param2: Vector3D = null): Vector3D {
        if (!param2) {
            param2 = new Vector3D();
        }
        class_2125.transformVector(this.matrix, param1, param2);
        param2.x /= param2.w;
        param2.y = -param2.y / param2.w;
        param2.z = param1.z;
        return param2;
    }

    public function get method_1408(): Matrix3D {
        if (this.var_2993) {
            this.var_1379 = this.var_1379 || new Matrix3D();
            this.var_1379.copyFrom(this.matrix);
            this.var_1379.invert();
            this.var_2993 = false;
        }
        return this.var_1379;
    }

    public function method_3456(param1: Number, param2: Number, param3: Number, param4: Vector3D = null): Vector3D {
        throw new AbstractMethodError();
    }

    public function clone(): class_1757 {
        throw new AbstractMethodError();
    }

    arcane function get aspectRatio(): Number {
        return this.var_2640;
    }

    arcane function set aspectRatio(param1: Number): void {
        if (this.var_2640 == param1 || param1 * 0 != 0) {
            return;
        }
        this.var_2640 = param1;
        this.method_320();
    }

    protected function method_320(): void {
        this.var_585 = true;
        this.var_2993 = true;
        dispatchEvent(new class_2139(class_2139.const_2979, this));
    }

    protected function method_739(): void {
        throw new AbstractMethodError();
    }

    arcane function method_1090(param1: Number, param2: Number, param3: Number, param4: Number): void {
        this.var_2547.x = param1;
        this.var_2547.y = param2;
        this.var_2547.width = param3;
        this.var_2547.height = param4;
        this.method_320();
    }

    arcane function method_6149(param1: Number, param2: Number, param3: Number, param4: Number): void {
        this.var_657.x = param1;
        this.var_657.y = param2;
        this.var_657.width = param3;
        this.var_657.height = param4;
        this.method_320();
    }
}
}
