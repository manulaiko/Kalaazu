package package_463 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_304.SegmentSet;

public class class_2588 {


    arcane var var_2358: SegmentSet;

    arcane var var_125: Number;

    arcane var _start: Vector3D;

    arcane var var_1244: Vector3D;

    arcane var var_4656: Number;

    arcane var var_2271: Number;

    arcane var var_1437: Number;

    arcane var var_5048: Number;

    arcane var var_2916: Number;

    arcane var var_2879: Number;

    private var _index: int = -1;

    private var var_779: int = -1;

    private var var_2288: uint;

    private var var_148: uint;

    public function class_2588(param1: Vector3D, param2: Vector3D, param3: Vector3D, param4: uint = 3355443, param5: uint = 3355443, param6: Number = 1) {
        super();
        param3 = null;
        this.arcane::var_125 = param6 * 0.5;
        this.arcane::_start = param1;
        this.arcane::var_1244 = param2;
        this.startColor = param4;
        this.endColor = param5;
    }

    public function method_6253(param1: Vector3D, param2: Vector3D, param3: Vector3D, param4: uint = 3355443, param5: uint = 3355443, param6: Number = 1): void {
        param3 = null;
        this.arcane::_start = param1;
        this.arcane::var_1244 = param2;
        if (this.var_2288 != param4) {
            this.startColor = param4;
        }
        if (this.var_148 != param5) {
            this.endColor = param5;
        }
        this.arcane::var_125 = param6 * 0.5;
        this.update();
    }

    public function get start(): Vector3D {
        return this.arcane::_start;
    }

    public function set start(param1: Vector3D): void {
        this.arcane::_start = param1;
        this.update();
    }

    public function get end(): Vector3D {
        return this.arcane::var_1244;
    }

    public function set end(param1: Vector3D): void {
        this.arcane::var_1244 = param1;
        this.update();
    }

    public function get thickness(): Number {
        return Number(this.arcane::var_125) * 2;
    }

    public function set thickness(param1: Number): void {
        this.arcane::var_125 = param1 * 0.5;
        this.update();
    }

    public function get startColor(): uint {
        return this.var_2288;
    }

    public function set startColor(param1: uint): void {
        this.arcane::var_4656 = (param1 >> 16 & 255) / 255;
        this.arcane::var_2271 = (param1 >> 8 & 255) / 255;
        this.arcane::var_1437 = (param1 & 255) / 255;
        this.var_2288 = param1;
        this.update();
    }

    public function get endColor(): uint {
        return this.var_148;
    }

    public function set endColor(param1: uint): void {
        this.arcane::var_5048 = (param1 >> 16 & 255) / 255;
        this.arcane::var_2916 = (param1 >> 8 & 255) / 255;
        this.arcane::var_2879 = (param1 & 255) / 255;
        this.var_148 = param1;
        this.update();
    }

    public function dispose(): void {
        this.arcane::_start = null;
        this.arcane::var_1244 = null;
    }

    arcane function get index(): int {
        return this._index;
    }

    arcane function set index(param1: int): void {
        this._index = param1;
    }

    arcane function get subSetIndex(): int {
        return this.var_779;
    }

    arcane function set subSetIndex(param1: int): void {
        this.var_779 = param1;
    }

    arcane function set method_673(param1: SegmentSet): void {
        this.arcane::var_2358 = param1;
    }

    private function update(): void {
        if (!this.arcane::var_2358) {
            return;
        }
        this.arcane::var_2358.arcane::method_6253(this);
    }
}
}
