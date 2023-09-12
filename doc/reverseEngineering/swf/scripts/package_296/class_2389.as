package package_296 {

import away3d.arcane;

import com.adobe.utils.*;

import flash.display.*;
import flash.display3D.*;
import flash.display3D.textures.*;
import flash.geom.*;

import package_198.*;

import package_294.*;

import package_295.*;

import package_304.*;

import package_305.*;

import package_371.*;

import package_376.*;

import package_377.*;

import package_434.class_2450;

public class class_2389 implements class_2096 {

    private static const const_2412: Rectangle = new Rectangle(0, 0, 1, 1);


    private var _stage3DProxy: class_1208;

    private var _context: Context3D;

    private var var_3350: Boolean = true;

    private var var_4182: Program3D;

    private var var_791: Program3D;

    private var _bitmapData: BitmapData;

    private var var_1886: Vector.<Number>;

    private var var_3254: Vector.<Number>;

    private var _id: Vector.<Number>;

    private var var_1896: Vector.<class_2133>;

    private var var_453: uint;

    private var var_22: uint;

    private var var_3942: Number;

    private var var_1603: Number;

    private var var_4768: class_2133;

    private var var_3621: class_1766;

    private var var_1967: Vector3D;

    private var var_1518: Point;

    private var var_5006: uint;

    private var var_3541: uint;

    private var var_326: Vector3D;

    private var var_826: Vector3D;

    private var var_5029: Vector3D;

    private var var_935: Boolean;

    public function class_2389() {
        this.var_1896 = new Vector.<class_2133>();
        this.var_1967 = new Vector3D();
        this.var_1518 = new Point();
        this.var_326 = new Vector3D();
        this.var_826 = new Vector3D();
        this.var_5029 = new Vector3D();
        super();
        this._id = new Vector.<Number>(4, true);
        this.var_1886 = new Vector.<Number>(4, true);
        this.var_3254 = new Vector.<Number>(8, true);
        this.var_3254[3] = 0;
        this.var_3254[7] = 1;
    }

    public function get method_3139(): Boolean {
        return this.var_3350;
    }

    public function set method_3139(param1: Boolean): void {
        this.var_3350 = param1;
    }

    public function method_3281(param1: Number, param2: Number, param3: class_1762): class_1754 {
        var _loc4_: class_2145 = param3.arcane::method_924;
        this._stage3DProxy = param3.stage3DProxy;
        if (!this._stage3DProxy) {
            return null;
        }
        this._context = this._stage3DProxy.arcane::var_4582;
        this.var_1886[0] = param3.width;
        this.var_1886[1] = param3.height;
        this.var_1886[2] = -(this.var_3942 = 2 * param1 / Number(param3.width) - 1);
        this.var_1886[3] = this.var_1603 = 2 * param2 / Number(param3.height) - 1;
        this.var_935 = false;
        this.draw(_loc4_, null);
        this._context.setVertexBufferAt(0, null);
        if (!this._context || !this.var_935) {
            return null;
        }
        if (!this._bitmapData) {
            this._bitmapData = new BitmapData(1, 1, false, 0);
        }
        this._context.drawToBitmapData(this._bitmapData);
        this.var_22 = this._bitmapData.getPixel(0, 0);
        if (!this.var_22) {
            this._context.present();
            return null;
        }
        this.var_4768 = this.var_1896[this.var_22 - 1];
        this.var_3621 = this.var_4768.method_1409;
        if (Boolean(this.var_3350) && (!this.var_3621.arcane::var_3982 || !this.var_3621.mouseEnabled)) {
            return null;
        }
        var _loc5_: class_1754 = this.var_3621.method_3450;
        if (this.var_4768.method_4862) {
            this.method_1270(param3.camera);
            _loc5_.name_53 = this.var_1967;
            _loc5_.var_2450 = this.var_326;
            _loc5_.var_247 = this.var_1518;
            _loc5_.index = this.var_5006;
            _loc5_.var_4499 = this.var_3541;
        } else {
            _loc5_.name_53 = null;
            _loc5_.var_2450 = null;
            _loc5_.var_247 = null;
            _loc5_.index = 0;
            _loc5_.var_4499 = 0;
        }
        return _loc5_;
    }

    public function method_2787(param1: Vector3D, param2: Vector3D, param3: class_2128): class_1754 {
        return null;
    }

    protected function draw(param1: class_2145, param2: TextureBase): void {
        var _loc3_: class_1767 = param1.camera;
        this._context.clear(0, 0, 0, 1);
        this._stage3DProxy.method_2358 = const_2412;
        this.var_453 = 0;
        this.var_1896.length = 0;
        if (!this.var_4182) {
            this.method_3451();
        }
        this._context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        this._context.setDepthTest(true, Context3DCompareMode.LESS);
        this._context.setProgram(this.var_4182);
        this._context.setProgramConstantsFromVector(Context3DProgramType.VERTEX, 4, this.var_1886, 1);
        this.method_2676(param1.method_6033, _loc3_);
        this.method_2676(param1.method_51, _loc3_);
    }

    private function method_2676(param1: class_2146, param2: class_1767): void {
        var _loc4_: * = null;
        var _loc3_: Matrix3D = class_2125.const_1289;
        var _loc5_: Matrix3D = param2.method_2785;
        while (param1) {
            if (!(_loc4_ = param1.var_3785).method_1409.scene || !_loc4_.mouseEnabled && Boolean(this.var_3350)) {
                param1 = param1.next;
            } else {
                this.var_935 = true;
                this._context.setCulling(Boolean(_loc4_.material) && Boolean(_loc4_.material.bothSides) ? "null" : Context3DTriangleFace.BACK);
                var _loc6_: *;
                this.var_1896[_loc6_ = this.var_453++] = _loc4_;
                this._id[1] = (Number(this.var_453) >> 8) / 255;
                this._id[2] = (Number(this.var_453) & 255) / 255;
                _loc3_.copyFrom(_loc4_.method_846(param2));
                _loc3_.append(_loc5_);
                this._context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, _loc3_, true);
                this._context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._id, 1);
                _loc4_.method_748(0, this._stage3DProxy);
                this._context.drawTriangles(_loc4_.method_612(this._stage3DProxy), 0, _loc4_.name_42);
                param1 = param1.next;
            }
        }
    }

    private function method_5729(param1: class_1767): void {
        this.var_826 = param1.method_3037;
        this.var_5029 = param1.method_6082(this.var_3942, this.var_1603, 1);
        this.var_5029.normalize();
    }

    private function method_3451(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        this.var_4182 = this._context.createProgram();
        _loc1_ = "m44 vt0, va0, vc0\t\t\t\nmul vt1.xy, vt0.w, vc4.zw\t\nadd vt0.xy, vt0.xy, vt1.xy\t\nmul vt0.xy, vt0.xy, vc4.xy\t\nmov op, vt0\t\n";
        _loc2_ = "mov oc, fc0";
        this.var_4182.upload(new AGALMiniAssembler().assemble(Context3DProgramType.VERTEX, _loc1_), new AGALMiniAssembler().assemble(Context3DProgramType.FRAGMENT, _loc2_));
    }

    private function method_3067(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        this.var_791 = this._context.createProgram();
        _loc1_ = "add vt0, va0, vc5 \t\t\t\nmul vt0, vt0, vc6 \t\t\t\nmov v0, vt0\t\t\t\t\nm44 vt0, va0, vc0\t\t\t\nmul vt1.xy, vt0.w, vc4.zw\t\nadd vt0.xy, vt0.xy, vt1.xy\t\nmul vt0.xy, vt0.xy, vc4.xy\t\nmov op, vt0\t\n";
        _loc2_ = "mov oc, v0";
        this.var_791.upload(new AGALMiniAssembler().assemble(Context3DProgramType.VERTEX, _loc1_), new AGALMiniAssembler().assemble(Context3DProgramType.FRAGMENT, _loc2_));
    }

    private function method_1270(param1: class_1767): void {
        this.method_3055(param1);
        this.method_2716(param1);
    }

    private function method_3055(param1: class_1767): void {
        var _loc3_: * = 0;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc2_: class_1766 = this.var_4768.method_1409;
        var _loc10_: Matrix3D;
        (_loc10_ = class_2125.const_1289).copyFrom(this.var_4768.method_846(param1));
        _loc10_.append(param1.method_2785);
        if (!this.var_791) {
            this.method_3067();
        }
        var _loc11_: * = Number(_loc2_.method_976) - Number(_loc2_.method_2548);
        _loc4_ = Number(_loc2_.method_976) - Number(_loc2_.method_2548);
        this.var_3254[4] = 1 / _loc11_;
        _loc11_ = Number(_loc2_.method_4138) - Number(_loc2_.method_5180);
        _loc5_ = Number(_loc2_.method_4138) - Number(_loc2_.method_5180);
        this.var_3254[5] = 1 / _loc11_;
        _loc11_ = Number(_loc2_.method_2429) - Number(_loc2_.method_329);
        _loc6_ = Number(_loc2_.method_2429) - Number(_loc2_.method_329);
        this.var_3254[6] = 1 / _loc11_;
        _loc11_ = -Number(_loc2_.method_2548);
        _loc7_ = -Number(_loc2_.method_2548);
        this.var_3254[0] = _loc11_;
        _loc11_ = -Number(_loc2_.method_5180);
        _loc8_ = -Number(_loc2_.method_5180);
        this.var_3254[1] = _loc11_;
        _loc11_ = -Number(_loc2_.method_329);
        _loc9_ = -Number(_loc2_.method_329);
        this.var_3254[2] = _loc11_;
        this._context.setProgram(this.var_791);
        this._context.clear(0, 0, 0, 0, 1, 0, Context3DClearMask.DEPTH);
        this._context.setScissorRectangle(const_2412);
        this._context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, _loc10_, true);
        this._context.setProgramConstantsFromVector(Context3DProgramType.VERTEX, 5, this.var_3254, 2);
        this.var_4768.method_748(0, this._stage3DProxy);
        this._context.drawTriangles(this.var_4768.method_612(this._stage3DProxy), 0, this.var_4768.name_42);
        this._context.drawToBitmapData(this._bitmapData);
        _loc3_ = uint(this._bitmapData.getPixel(0, 0));
        this.var_1967.x = (_loc3_ >> 16 & 255) * _loc4_ / 255 - _loc7_;
        this.var_1967.y = (_loc3_ >> 8 & 255) * _loc5_ / 255 - _loc8_;
        this.var_1967.z = (_loc3_ & 255) * _loc6_ / 255 - _loc9_;
    }

    private function method_2716(param1: class_1767): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc18_: * = 0;
        var _loc19_: * = 0;
        var _loc20_: * = 0;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: Number = NaN;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: Number = NaN;
        var _loc28_: Number = NaN;
        var _loc29_: Number = NaN;
        var _loc30_: Number = NaN;
        var _loc31_: Number = NaN;
        var _loc32_: Number = NaN;
        var _loc33_: Number = NaN;
        var _loc34_: Number = NaN;
        var _loc35_: Number = NaN;
        var _loc36_: Number = NaN;
        var _loc37_: Number = NaN;
        var _loc43_: Number = NaN;
        var _loc44_: Number = NaN;
        var _loc45_: * = 0;
        var _loc46_: * = 0;
        var _loc47_: * = 0;
        var _loc48_: Number = NaN;
        var _loc49_: Number = NaN;
        var _loc50_: Number = NaN;
        var _loc51_: Number = NaN;
        var _loc52_: Number = NaN;
        var _loc53_: Number = NaN;
        var _loc54_: Number = NaN;
        var _loc2_: class_2425 = class_2398(this.var_4768).subGeometry;
        var _loc3_: Vector.<uint> = _loc2_.indexData;
        var _loc4_: Vector.<Number> = _loc2_.name_104;
        var _loc5_: int = _loc3_.length;
        var _loc15_: * = 0;
        var _loc16_: * = 1;
        var _loc17_: * = 2;
        var _loc38_: Vector.<Number> = _loc2_.method_868;
        var _loc39_: Vector.<Number> = _loc2_.method_2565;
        var _loc40_: Number = Number(this.var_1967.x);
        var _loc41_: Number = Number(this.var_1967.y);
        var _loc42_: Number = Number(this.var_1967.z);
        var _loc55_: int = int(_loc2_.method_4110);
        var _loc56_: int = int(_loc2_.method_720);
        this.method_5729(param1);
        while (_loc15_ < _loc5_) {
            _loc18_ = _loc56_ + _loc3_[_loc15_] * _loc55_;
            _loc19_ = _loc56_ + _loc3_[_loc16_] * _loc55_;
            _loc20_ = _loc56_ + _loc3_[_loc17_] * _loc55_;
            _loc6_ = _loc4_[_loc18_];
            _loc7_ = _loc4_[_loc18_ + 1];
            _loc8_ = _loc4_[_loc18_ + 2];
            _loc9_ = _loc4_[_loc19_];
            _loc10_ = _loc4_[_loc19_ + 1];
            _loc11_ = _loc4_[_loc19_ + 2];
            _loc12_ = _loc4_[_loc20_];
            _loc13_ = _loc4_[_loc20_ + 1];
            _loc14_ = _loc4_[_loc20_ + 2];
            if (!(_loc40_ < _loc6_ && _loc40_ < _loc9_ && _loc40_ < _loc12_ || _loc41_ < _loc7_ && _loc41_ < _loc10_ && _loc41_ < _loc13_ || _loc42_ < _loc8_ && _loc42_ < _loc11_ && _loc42_ < _loc14_ || _loc40_ > _loc6_ && _loc40_ > _loc9_ && _loc40_ > _loc12_ || _loc41_ > _loc7_ && _loc41_ > _loc10_ && _loc41_ > _loc13_ || _loc42_ > _loc8_ && _loc42_ > _loc11_ && _loc42_ > _loc14_)) {
                _loc21_ = _loc12_ - _loc6_;
                _loc22_ = _loc13_ - _loc7_;
                _loc23_ = _loc14_ - _loc8_;
                _loc24_ = _loc9_ - _loc6_;
                _loc25_ = _loc10_ - _loc7_;
                _loc26_ = _loc11_ - _loc8_;
                _loc27_ = _loc40_ - _loc6_;
                _loc28_ = _loc41_ - _loc7_;
                _loc29_ = _loc42_ - _loc8_;
                _loc30_ = _loc21_ * _loc21_ + _loc22_ * _loc22_ + _loc23_ * _loc23_;
                _loc31_ = _loc21_ * _loc24_ + _loc22_ * _loc25_ + _loc23_ * _loc26_;
                _loc32_ = _loc21_ * _loc27_ + _loc22_ * _loc28_ + _loc23_ * _loc29_;
                _loc33_ = _loc24_ * _loc24_ + _loc25_ * _loc25_ + _loc26_ * _loc26_;
                _loc34_ = _loc24_ * _loc27_ + _loc25_ * _loc28_ + _loc26_ * _loc29_;
                _loc37_ = 1 / (_loc30_ * _loc33_ - _loc31_ * _loc31_);
                _loc35_ = (_loc33_ * _loc32_ - _loc31_ * _loc34_) * _loc37_;
                _loc36_ = (_loc30_ * _loc34_ - _loc31_ * _loc32_) * _loc37_;
                if (_loc35_ >= 0 && _loc36_ >= 0 && _loc35_ + _loc36_ <= 1) {
                    this.method_6182(this.var_4768.method_2908, _loc39_[_loc15_], _loc39_[_loc15_ + 1], _loc39_[_loc15_ + 2], _loc6_, _loc7_, _loc8_);
                    _loc27_ = Number(this.var_1967.x) - _loc6_;
                    _loc28_ = Number(this.var_1967.y) - _loc7_;
                    _loc29_ = Number(this.var_1967.z) - _loc8_;
                    _loc48_ = _loc9_ - _loc6_;
                    _loc49_ = _loc10_ - _loc7_;
                    _loc50_ = _loc11_ - _loc8_;
                    _loc51_ = _loc12_ - _loc6_;
                    _loc52_ = _loc13_ - _loc7_;
                    _loc53_ = _loc14_ - _loc8_;
                    this.var_326.x = _loc49_ * _loc53_ - _loc50_ * _loc52_;
                    this.var_326.y = _loc50_ * _loc51_ - _loc48_ * _loc53_;
                    this.var_326.z = _loc48_ * _loc52_ - _loc49_ * _loc51_;
                    _loc54_ = 1 / Math.sqrt(Number(this.var_326.x) * Number(this.var_326.x) + Number(this.var_326.y) * Number(this.var_326.y) + Number(this.var_326.z) * Number(this.var_326.z));
                    this.var_326.x *= _loc54_;
                    this.var_326.y *= _loc54_;
                    this.var_326.z *= _loc54_;
                    _loc32_ = _loc21_ * _loc27_ + _loc22_ * _loc28_ + _loc23_ * _loc29_;
                    _loc34_ = _loc24_ * _loc27_ + _loc25_ * _loc28_ + _loc26_ * _loc29_;
                    _loc35_ = (_loc33_ * _loc32_ - _loc31_ * _loc34_) * _loc37_;
                    _loc36_ = (_loc30_ * _loc34_ - _loc31_ * _loc32_) * _loc37_;
                    _loc45_ = _loc3_[_loc15_] << 1;
                    _loc46_ = _loc3_[_loc16_] << 1;
                    _loc47_ = _loc3_[_loc17_] << 1;
                    _loc43_ = _loc38_[_loc45_];
                    _loc44_ = _loc38_[_loc45_ + 1];
                    this.var_1518.x = _loc43_ + _loc36_ * (_loc38_[_loc46_] - _loc43_) + _loc35_ * (_loc38_[_loc47_] - _loc43_);
                    this.var_1518.y = _loc44_ + _loc36_ * (_loc38_[_loc46_ + 1] - _loc44_) + _loc35_ * (_loc38_[_loc47_ + 1] - _loc44_);
                    this.var_5006 = _loc15_;
                    this.var_3541 = class_2450.method_1832(class_2398(this.var_4768));
                    return;
                }
            }
            _loc15_ += 3;
            _loc16_ += 3;
            _loc17_ += 3;
        }
    }

    private function method_6182(param1: Matrix3D, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number): void {
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Vector.<Number> = class_2125.const_2368;
        var _loc16_: Number = Number(this.var_826.x);
        var _loc17_: Number = Number(this.var_826.y);
        var _loc18_: Number = Number(this.var_826.z);
        _loc11_ = Number(this.var_5029.x);
        _loc12_ = Number(this.var_5029.y);
        _loc13_ = Number(this.var_5029.z);
        param1.copyRawDataTo(_loc15_);
        _loc8_ = _loc15_[0] * _loc11_ + _loc15_[4] * _loc12_ + _loc15_[8] * _loc13_;
        _loc9_ = _loc15_[1] * _loc11_ + _loc15_[5] * _loc12_ + _loc15_[9] * _loc13_;
        _loc10_ = _loc15_[2] * _loc11_ + _loc15_[6] * _loc12_ + _loc15_[10] * _loc13_;
        _loc11_ = _loc15_[0] * _loc16_ + _loc15_[4] * _loc17_ + _loc15_[8] * _loc18_ + _loc15_[12];
        _loc12_ = _loc15_[1] * _loc16_ + _loc15_[5] * _loc17_ + _loc15_[9] * _loc18_ + _loc15_[13];
        _loc13_ = _loc15_[2] * _loc16_ + _loc15_[6] * _loc17_ + _loc15_[10] * _loc18_ + _loc15_[14];
        _loc14_ = ((param5 - _loc11_) * param2 + (param6 - _loc12_) * param3 + (param7 - _loc13_) * param4) / (_loc8_ * param2 + _loc9_ * param3 + _loc10_ * param4);
        this.var_1967.x = _loc11_ + _loc8_ * _loc14_;
        this.var_1967.y = _loc12_ + _loc9_ * _loc14_;
        this.var_1967.z = _loc13_ + _loc10_ * _loc14_;
    }

    public function dispose(): void {
        this._bitmapData.dispose();
        if (this.var_791) {
            this.var_791.dispose();
        }
        if (this.var_4182) {
            this.var_4182.dispose();
        }
        this.var_791 = null;
        this.var_4182 = null;
        this._bitmapData = null;
        this.var_4768 = null;
        this.var_3621 = null;
    }
}
}
