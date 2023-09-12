package package_294 {

import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.VertexBuffer3D;
import flash.utils.Dictionary;

import package_198.class_1208;

public class class_2646 extends class_2602 {


    private var var_4158: String;

    private var var_3826: Vector.<Number>;

    private var var_1370: Vector.<Number>;

    private var var_68: Vector.<Number>;

    private var var_1254: Vector.<VertexBuffer3D>;

    private var var_1565: Vector.<VertexBuffer3D>;

    private var var_4766: Vector.<Boolean>;

    private var var_3634: Vector.<Boolean>;

    private var var_3875: Vector.<Context3D>;

    private var var_3550: Vector.<Context3D>;

    private var var_1066: int;

    private var var_3125: Vector.<Number>;

    private var var_4236: Vector.<uint>;

    private var var_823: uint;

    public function class_2646(param1: int) {
        this.var_1254 = new Vector.<VertexBuffer3D>(8);
        this.var_1565 = new Vector.<VertexBuffer3D>(8);
        this.var_4766 = new Vector.<Boolean>(8, true);
        this.var_3634 = new Vector.<Boolean>(8, true);
        this.var_3875 = new Vector.<Context3D>(8);
        this.var_3550 = new Vector.<Context3D>(8);
        super();
        this.var_1066 = param1;
        this.var_4158 = "float" + this.var_1066;
    }

    public function get method_5360(): Vector.<uint> {
        return this.var_4236;
    }

    public function get method_2303(): uint {
        return this.var_823;
    }

    public function get method_5897(): Vector.<Number> {
        return this.var_68 || _vertexData.concat();
    }

    public function method_5284(param1: Vector.<Number>): void {
        this.var_68 = param1;
        method_1458(var_3632);
    }

    public function method_6084(param1: int, param2: class_1208): void {
        var _loc3_: int = int(param2.arcane::var_1572);
        var _loc4_: Context3D = param2.arcane::var_4582;
        if (this.var_3875[_loc3_] != _loc4_ || !this.var_1254[_loc3_]) {
            this.var_1254[_loc3_] = _loc4_.createVertexBuffer(var_490, this.var_1066);
            this.var_3875[_loc3_] = _loc4_;
            this.var_4766[_loc3_] = true;
        }
        if (this.var_4766[_loc3_]) {
            this.var_1254[_loc3_].uploadFromVector(this.var_3826, 0, Number(this.var_3826.length) / Number(this.var_1066));
            this.var_4766[_loc3_] = false;
        }
        _loc4_.setVertexBufferAt(param1, this.var_1254[_loc3_], 0, this.var_4158);
    }

    public function method_5148(param1: int, param2: class_1208): void {
        var _loc3_: int = int(param2.arcane::var_1572);
        var _loc4_: Context3D = param2.arcane::var_4582;
        if (this.var_3550[_loc3_] != _loc4_ || !this.var_1565[_loc3_]) {
            this.var_1565[_loc3_] = _loc4_.createVertexBuffer(var_490, this.var_1066);
            this.var_3550[_loc3_] = _loc4_;
            this.var_3634[_loc3_] = true;
        }
        if (this.var_3634[_loc3_]) {
            this.var_1565[_loc3_].uploadFromVector(this.var_823 > 0 ? this.var_3125 : this.var_1370, 0, Number(this.var_1370.length) / Number(this.var_1066));
            this.var_3634[_loc3_] = false;
        }
        _loc4_.setVertexBufferAt(param1, this.var_1565[_loc3_], 0, this.var_4158);
    }

    override protected function method_1720(param1: int): void {
        if (this.var_68) {
            var_3032.uploadFromVector(this.var_68, 0, var_490);
            var_3611 = false;
            var_3632[param1] = false;
        } else {
            super.method_1720(param1);
        }
    }

    override public function clone(): class_2425 {
        var _loc1_: class_2646 = new class_2646(this.var_1066);
        _loc1_.updateData(_vertexData.concat());
        _loc1_.updateIndexData(_indices.concat());
        _loc1_.arcane::updateJointIndexData(this.var_1370.concat());
        _loc1_.arcane::updateJointWeightsData(this.var_3826.concat());
        _loc1_.var_2532 = var_2532;
        _loc1_.var_1890 = var_1890;
        _loc1_.var_823 = this.var_823;
        _loc1_.var_4236 = this.var_4236;
        _loc1_.var_3125 = this.var_3125;
        return _loc1_;
    }

    override public function dispose(): void {
        super.dispose();
        method_1214(this.var_1254);
        method_1214(this.var_1565);
    }

    arcane function method_6312(): void {
        var _loc2_: int = 0;
        var _loc1_: int = int(this.var_1370.length);
        var _loc3_: int = 0;
        var _loc4_: Dictionary = new Dictionary();
        this.var_3125 = new Vector.<Number>(_loc1_, true);
        this.var_4236 = new Vector.<uint>();
        var _loc5_: int = 0;
        while (_loc5_ < _loc1_) {
            _loc2_ = int(this.var_1370[_loc5_]);
            if (_loc4_[_loc2_] == undefined) {
                _loc4_[_loc2_] = _loc3_;
                var _loc6_: *;
                this.var_4236[_loc6_ = _loc3_++] = _loc2_;
                var _loc7_: *;
                this.var_4236[_loc7_ = _loc3_++] = _loc2_ + 1;
                var _loc8_: *;
                this.var_4236[_loc8_ = _loc3_++] = _loc2_ + 2;
            }
            this.var_3125[_loc5_] = _loc4_[_loc2_];
            _loc5_++;
        }
        this.var_823 = _loc3_ / 3;
        method_1458(this.var_3634);
    }

    arcane function get method_5549(): Vector.<Number> {
        return this.var_3826;
    }

    arcane function updateJointWeightsData(param1: Vector.<Number>): void {
        this.var_823 = 0;
        this.var_4236 = null;
        this.var_3125 = null;
        this.var_3826 = param1;
        method_1458(this.var_4766);
    }

    arcane function get method_4237(): Vector.<Number> {
        return this.var_1370;
    }

    arcane function updateJointIndexData(param1: Vector.<Number>): void {
        this.var_1370 = param1;
        method_1458(this.var_3634);
    }
}
}
