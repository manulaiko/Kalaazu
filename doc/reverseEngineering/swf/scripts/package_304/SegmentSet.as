package package_304 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.Context3DVertexBufferFormat;
import flash.display3D.IndexBuffer3D;
import flash.display3D.VertexBuffer3D;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_198.class_1208;

import package_293.class_2131;

import package_294.class_2133;

import package_305.class_1767;

import package_307.class_1772;
import package_307.class_2589;

import package_372.class_2225;
import package_372.class_2590;

import package_383.class_2226;
import package_383.class_2396;

import package_463.class_2588;

public class SegmentSet extends class_1766 implements class_2133 {


    private const const_1341: uint = 196605;

    private var var_2943: SubSet;

    private var var_4296: Vector.<SubSet>;

    private var var_4111: uint;

    private var var_2446: uint;

    private var var_642: class_1772;

    private var _animator: class_2120;

    private var var_2289: Boolean;

    protected var _segments: Dictionary;

    private var var_410: uint;

    public function SegmentSet() {
        super();
        this.var_4111 = 0;
        this.var_4296 = new Vector.<SubSet>();
        this.method_4822();
        this._segments = new Dictionary();
        this.material = new class_2589();
    }

    public function method_2411(param1: class_2588): void {
        param1.arcane::method_673 = this;
        this.var_2289 = true;
        var _loc2_: uint = this.var_4296.length - 1;
        var _loc3_: SubSet = this.var_4296[_loc2_];
        if (_loc3_.vertices.length + 44 > 196605) {
            _loc3_ = this.method_4822();
            _loc2_++;
        }
        param1.arcane::index = _loc3_.vertices.length;
        param1.arcane::subSetIndex = _loc2_;
        this.arcane::method_6253(param1);
        var _loc4_: uint = _loc3_.lineCount << 2;
        _loc3_.indices.push(_loc4_, _loc4_ + 1, _loc4_ + 2, _loc4_ + 3, _loc4_ + 2, _loc4_ + 1);
        _loc3_.numVertices = _loc3_.vertices.length / 11;
        _loc3_.numIndices = _loc3_.indices.length;
        ++_loc3_.lineCount;
        var _loc5_: SegRef;
        (_loc5_ = new SegRef()).index = _loc4_;
        _loc5_.subSetIndex = _loc2_;
        _loc5_.segment = param1;
        this._segments[this.var_410] = _loc5_;
        ++this.var_410;
    }

    public function method_3076(param1: uint, param2: Boolean = false): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param1 >= this.var_410) {
            return;
        }
        if (this._segments[param1]) {
            _loc3_ = this._segments[param1];
            if (!this.var_4296[_loc3_.subSetIndex]) {
                return;
            }
            var _loc5_: int = _loc3_.subSetIndex;
            _loc4_ = this.var_4296[_loc3_.subSetIndex];
            var _loc6_: * = _loc3_.segment;
            var _loc7_: Vector.<uint> = _loc4_.indices;
            var _loc8_: uint;
            var _loc9_: uint = _loc8_ = param1 * 6;
            while (_loc9_ < _loc7_.length) {
                _loc7_[_loc9_] -= 4;
                _loc9_++;
            }
            _loc4_.indices.splice(param1 * 6, 6);
            _loc4_.vertices.splice(param1 * 44, 44);
            _loc4_.numVertices = _loc4_.vertices.length / 11;
            _loc4_.numIndices = _loc7_.length;
            _loc4_.vertexBufferDirty = true;
            _loc4_.indexBufferDirty = true;
            --_loc4_.lineCount;
            if (param2) {
                _loc6_.dispose();
                _loc6_ = null;
            } else {
                _loc6_.arcane::index = -1;
                _loc6_.arcane::method_673 = null;
            }
            if (_loc4_.lineCount == 0) {
                if (_loc5_ == 0) {
                    this.var_2289 = false;
                } else {
                    _loc4_.dispose();
                    this.var_4296[_loc5_] = null;
                    this.var_4296.splice(_loc5_, 1);
                }
            }
            this.method_5653(_loc5_, param1);
            _loc3_ = null;
            this._segments[this.var_410] = null;
            --this.var_410;
            return;
        }
    }

    public function method_3618(param1: class_2588, param2: Boolean = false): void {
        if (param1.arcane::index == -1) {
            return;
        }
        this.method_3076(Number(param1.arcane::index) / 44);
    }

    public function method_682(): void {
        var _loc1_: * = null;
        var _loc3_: * = null;
        var _loc2_: Number = 0;
        while (_loc2_ < this.var_4111) {
            _loc1_ = this.var_4296[_loc2_];
            _loc1_.vertices = null;
            _loc1_.indices = null;
            if (_loc1_.vertexBuffer) {
                _loc1_.vertexBuffer.dispose();
            }
            if (_loc1_.indexBuffer) {
                _loc1_.indexBuffer.dispose();
            }
            _loc1_ = null;
            _loc2_++;
        }
        for each(_loc3_ in this._segments) {
            _loc3_ = null;
        }
        this._segments = null;
        this.var_4111 = 0;
        this.var_2943 = null;
        this.var_410 = 0;
        this.var_4296 = new Vector.<SubSet>();
        this._segments = new Dictionary();
        this.method_4822();
        this.var_2289 = false;
    }

    public function method_2011(param1: uint): class_2588 {
        if (param1 > this.var_410 - 1) {
            return null;
        }
        return this._segments[param1].segment;
    }

    public function get method_577(): uint {
        return this.var_410;
    }

    arcane function get subSetCount(): uint {
        return this.var_4111;
    }

    arcane function method_6253(param1: class_2588): void {
        var _loc2_: Vector3D = param1.arcane::_start;
        var _loc3_: Vector3D = param1.arcane::var_1244;
        var _loc4_: Number = _loc2_.x;
        var _loc5_: Number = _loc2_.y;
        var _loc6_: Number = _loc2_.z;
        var _loc7_: Number = _loc3_.x;
        var _loc8_: Number = _loc3_.y;
        var _loc9_: Number = _loc3_.z;
        var _loc10_: Number = Number(param1.arcane::var_4656);
        var _loc11_: Number = Number(param1.arcane::var_2271);
        var _loc12_: Number = Number(param1.arcane::var_1437);
        var _loc13_: Number = Number(param1.arcane::var_5048);
        var _loc14_: Number = Number(param1.arcane::var_2916);
        var _loc15_: Number = Number(param1.arcane::var_2879);
        var _loc16_: uint = uint(param1.arcane::index);
        var _loc17_: Number = Number(param1.thickness);
        var _loc19_: Vector.<Number>;
        var _loc18_: SubSet;
        var _loc20_: *;
        (_loc19_ = (_loc18_ = this.var_4296[param1.arcane::subSetIndex]).vertices)[_loc20_ = _loc16_++] = _loc4_;
        var _loc21_: *;
        _loc19_[_loc21_ = _loc16_++] = _loc5_;
        var _loc22_: *;
        _loc19_[_loc22_ = _loc16_++] = _loc6_;
        var _loc23_: *;
        _loc19_[_loc23_ = _loc16_++] = _loc7_;
        var _loc24_: *;
        _loc19_[_loc24_ = _loc16_++] = _loc8_;
        var _loc25_: *;
        _loc19_[_loc25_ = _loc16_++] = _loc9_;
        var _loc26_: *;
        _loc19_[_loc26_ = _loc16_++] = _loc17_;
        var _loc27_: *;
        _loc19_[_loc27_ = _loc16_++] = _loc10_;
        var _loc28_: *;
        _loc19_[_loc28_ = _loc16_++] = _loc11_;
        var _loc29_: *;
        _loc19_[_loc29_ = _loc16_++] = _loc12_;
        var _loc30_: *;
        _loc19_[_loc30_ = _loc16_++] = 1;
        var _loc31_: *;
        _loc19_[_loc31_ = _loc16_++] = _loc7_;
        var _loc32_: *;
        _loc19_[_loc32_ = _loc16_++] = _loc8_;
        var _loc33_: *;
        _loc19_[_loc33_ = _loc16_++] = _loc9_;
        var _loc34_: *;
        _loc19_[_loc34_ = _loc16_++] = _loc4_;
        var _loc35_: *;
        _loc19_[_loc35_ = _loc16_++] = _loc5_;
        var _loc36_: *;
        _loc19_[_loc36_ = _loc16_++] = _loc6_;
        var _loc37_: *;
        _loc19_[_loc37_ = _loc16_++] = -_loc17_;
        var _loc38_: *;
        _loc19_[_loc38_ = _loc16_++] = _loc13_;
        var _loc39_: *;
        _loc19_[_loc39_ = _loc16_++] = _loc14_;
        var _loc40_: *;
        _loc19_[_loc40_ = _loc16_++] = _loc15_;
        var _loc41_: *;
        _loc19_[_loc41_ = _loc16_++] = 1;
        var _loc42_: *;
        _loc19_[_loc42_ = _loc16_++] = _loc4_;
        var _loc43_: *;
        _loc19_[_loc43_ = _loc16_++] = _loc5_;
        var _loc44_: *;
        _loc19_[_loc44_ = _loc16_++] = _loc6_;
        var _loc45_: *;
        _loc19_[_loc45_ = _loc16_++] = _loc7_;
        var _loc46_: *;
        _loc19_[_loc46_ = _loc16_++] = _loc8_;
        var _loc47_: *;
        _loc19_[_loc47_ = _loc16_++] = _loc9_;
        var _loc48_: *;
        _loc19_[_loc48_ = _loc16_++] = -_loc17_;
        var _loc49_: *;
        _loc19_[_loc49_ = _loc16_++] = _loc10_;
        var _loc50_: *;
        _loc19_[_loc50_ = _loc16_++] = _loc11_;
        var _loc51_: *;
        _loc19_[_loc51_ = _loc16_++] = _loc12_;
        var _loc52_: *;
        _loc19_[_loc52_ = _loc16_++] = 1;
        var _loc53_: *;
        _loc19_[_loc53_ = _loc16_++] = _loc7_;
        var _loc54_: *;
        _loc19_[_loc54_ = _loc16_++] = _loc8_;
        var _loc55_: *;
        _loc19_[_loc55_ = _loc16_++] = _loc9_;
        var _loc56_: *;
        _loc19_[_loc56_ = _loc16_++] = _loc4_;
        var _loc57_: *;
        _loc19_[_loc57_ = _loc16_++] = _loc5_;
        var _loc58_: *;
        _loc19_[_loc58_ = _loc16_++] = _loc6_;
        var _loc59_: *;
        _loc19_[_loc59_ = _loc16_++] = _loc17_;
        var _loc60_: *;
        _loc19_[_loc60_ = _loc16_++] = _loc13_;
        var _loc61_: *;
        _loc19_[_loc61_ = _loc16_++] = _loc14_;
        var _loc62_: *;
        _loc19_[_loc62_ = _loc16_++] = _loc15_;
        var _loc63_: *;
        _loc19_[_loc63_ = _loc16_++] = 1;
        _loc18_.vertexBufferDirty = true;
        method_1513();
    }

    arcane function get hasData(): Boolean {
        return this.var_2289;
    }

    public function method_612(param1: class_1208): IndexBuffer3D {
        if (this.var_2943.indexContext3D != param1.context3D || Boolean(this.var_2943.indexBufferDirty)) {
            this.var_2943.indexBuffer = param1.arcane::var_4582.createIndexBuffer(this.var_2943.numIndices);
            this.var_2943.indexBuffer.uploadFromVector(this.var_2943.indices, 0, this.var_2943.numIndices);
            this.var_2943.indexBufferDirty = false;
            this.var_2943.indexContext3D = param1.context3D;
        }
        return this.var_2943.indexBuffer;
    }

    public function method_748(param1: int, param2: class_1208): void {
        var _loc4_: * = null;
        var _loc3_: SubSet = this.var_4296[param1];
        this.var_2943 = _loc3_;
        this.var_2446 = _loc3_.numIndices;
        if (_loc3_.vertexContext3D != param2.context3D || _loc3_.vertexBufferDirty) {
            _loc3_.vertexBuffer = param2.arcane::var_4582.createVertexBuffer(_loc3_.numVertices, 11);
            _loc3_.vertexBuffer.uploadFromVector(_loc3_.vertices, 0, _loc3_.numVertices);
            _loc4_ = _loc3_.vertexBuffer;
            _loc3_.vertexBufferDirty = false;
            _loc3_.vertexContext3D = param2.context3D;
        }
        _loc4_ = _loc3_.vertexBuffer;
        var _loc5_: Context3D;
        (_loc5_ = param2.arcane::var_4582).setVertexBufferAt(0, _loc4_, 0, Context3DVertexBufferFormat.FLOAT_3);
        _loc5_.setVertexBufferAt(1, _loc4_, 3, Context3DVertexBufferFormat.FLOAT_3);
        _loc5_.setVertexBufferAt(2, _loc4_, 6, Context3DVertexBufferFormat.FLOAT_1);
        _loc5_.setVertexBufferAt(3, _loc4_, 7, Context3DVertexBufferFormat.FLOAT_4);
    }

    public function method_2801(param1: int, param2: class_1208): void {
    }

    public function method_298(param1: int, param2: class_1208): void {
    }

    public function method_4672(param1: int, param2: class_1208): void {
    }

    public function method_1094(param1: int, param2: class_1208): void {
    }

    private function method_5653(param1: uint, param2: int): void {
        var _loc3_: * = null;
        var _loc4_: uint = param2;
        while (_loc4_ < this.var_410 - 1) {
            _loc3_ = this._segments[_loc4_ + 1];
            _loc3_.index = _loc4_;
            if (_loc3_.subSetIndex == param1) {
                _loc3_.segment.arcane::index -= 44;
            }
            this._segments[_loc4_] = _loc3_;
            _loc4_++;
        }
    }

    private function method_4822(): SubSet {
        var _loc1_: SubSet = new SubSet();
        this.var_4296.push(_loc1_);
        _loc1_.vertices = new Vector.<Number>();
        _loc1_.numVertices = 0;
        _loc1_.indices = new Vector.<uint>();
        _loc1_.numIndices = 0;
        _loc1_.vertexBufferDirty = true;
        _loc1_.indexBufferDirty = true;
        _loc1_.lineCount = 0;
        ++this.var_4111;
        return _loc1_;
    }

    override public function dispose(): void {
        super.dispose();
        this.method_682();
        this._segments = null;
        this.var_642 = null;
        var _loc1_: SubSet = this.var_4296[0];
        _loc1_.vertices = null;
        _loc1_.indices = null;
        this.var_4296 = null;
    }

    override public function get mouseEnabled(): Boolean {
        return false;
    }

    override protected function method_1594(): class_2226 {
        return new class_2396();
    }

    override protected function updateBounds(): void {
        var _loc1_: * = null;
        var _loc2_: * = 0;
        var _loc3_: Number = NaN;
        var _loc4_: * = 0;
        var _loc11_: * = null;
        var _loc13_: Number = NaN;
        var _loc5_: Number = Infinity;
        var _loc6_: Number = Infinity;
        var _loc7_: Number = Infinity;
        var _loc8_: Number = -Infinity;
        var _loc9_: Number = -Infinity;
        var _loc10_: Number = -Infinity;
        var _loc12_: Number = 0;
        while (_loc12_ < this.var_4111) {
            _loc1_ = this.var_4296[_loc12_];
            _loc4_ = 0;
            _loc2_ = (_loc11_ = _loc1_.vertices).length;
            if (_loc2_ != 0) {
                while (_loc4_ < _loc2_) {
                    _loc3_ = _loc11_[_loc4_++];
                    if (_loc3_ < _loc5_) {
                        _loc5_ = _loc3_;
                    } else if (_loc3_ > _loc8_) {
                        _loc8_ = _loc3_;
                    }
                    _loc3_ = _loc11_[_loc4_++];
                    if (_loc3_ < _loc6_) {
                        _loc6_ = _loc3_;
                    } else if (_loc3_ > _loc9_) {
                        _loc9_ = _loc3_;
                    }
                    _loc3_ = _loc11_[_loc4_++];
                    if (_loc3_ < _loc7_) {
                        _loc7_ = _loc3_;
                    } else if (_loc3_ > _loc10_) {
                        _loc10_ = _loc3_;
                    }
                    _loc4_ += 8;
                }
            }
            _loc12_++;
        }
        if (_loc5_ != Infinity) {
            _bounds.method_5348(_loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_);
        } else {
            _loc13_ = 0.5;
            _bounds.method_5348(-_loc13_, -_loc13_, -_loc13_, _loc13_, _loc13_, _loc13_);
        }
        var_2006 = false;
    }

    override protected function method_1737(): class_2225 {
        return new class_2590(this);
    }

    public function get name_42(): uint {
        return Number(this.var_2446) / 3;
    }

    public function get method_1409(): class_1766 {
        return this;
    }

    public function get method_825(): Boolean {
        return false;
    }

    public function get material(): class_1772 {
        return this.var_642;
    }

    public function get animator(): class_2120 {
        return this._animator;
    }

    public function set material(param1: class_1772): void {
        if (param1 == this.var_642) {
            return;
        }
        if (this.var_642) {
            this.var_642.arcane::method_4342(this);
        }
        this.var_642 = param1;
        if (this.var_642) {
            this.var_642.arcane::method_3466(this);
        }
    }

    public function get method_2164(): Matrix {
        return null;
    }

    public function get name_104(): Vector.<Number> {
        return null;
    }

    public function get indexData(): Vector.<uint> {
        return null;
    }

    public function get method_868(): Vector.<Number> {
        return null;
    }

    public function get numVertices(): uint {
        return null;
    }

    public function get method_4110(): uint {
        return 11;
    }

    public function get method_4313(): Vector.<Number> {
        return null;
    }

    public function get method_303(): Vector.<Number> {
        return null;
    }

    public function get method_720(): int {
        return 0;
    }

    public function get method_4530(): int {
        return 0;
    }

    public function get method_4538(): int {
        return 0;
    }

    override public function get assetType(): String {
        return class_2131.const_2748;
    }

    public function method_846(param1: class_1767): Matrix3D {
        return var_2379;
    }

    public function get name_55(): Object {
        return null;
    }
}
}

import package_463.class_2588;

final class SegRef {


    public var index: uint;

    public var subSetIndex: uint;

    public var segment: class_2588;

    function SegRef() {
        super();
    }
}

import flash.display3D.Context3D;
import flash.display3D.IndexBuffer3D;
import flash.display3D.VertexBuffer3D;

final class SubSet {


    public var vertices: Vector.<Number>;

    public var numVertices: uint;

    public var indices: Vector.<uint>;

    public var numIndices: uint;

    public var vertexBufferDirty: Boolean;

    public var indexBufferDirty: Boolean;

    public var vertexContext3D: Context3D;

    public var indexContext3D: Context3D;

    public var vertexBuffer: VertexBuffer3D;

    public var indexBuffer: IndexBuffer3D;

    public var lineCount: uint;

    function SubSet() {
        super();
    }

    public function dispose(): void {
        this.vertices = null;
        if (this.vertexBuffer) {
            this.vertexBuffer.dispose();
        }
        if (this.indexBuffer) {
            this.indexBuffer.dispose();
        }
    }
}
