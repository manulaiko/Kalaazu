package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2251;

public class class_2246 extends class_2240 {


    private var var_3804: Boolean;

    protected var _useTexture: Boolean;

    var var_800: class_2251;

    protected var var_3489: class_2251;

    private var _texture: class_2116;

    private var var_1871: uint = 16777215;

    private var var_3866: Number = 1;

    private var var_2970: Number = 1;

    private var var_1455: Number = 1;

    private var var_3327: Number = 1;

    protected var var_712: class_2251;

    protected var var_1893: Number = 0;

    protected var var_3130: Boolean;

    public function class_2246() {
        super();
    }

    arcane function get method_555(): Boolean {
        return this.var_3804;
    }

    arcane function set method_555(param1: Boolean): void {
        if (this.var_3804 == param1) {
            return;
        }
        this.var_3804 = param1;
        method_220();
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_3859 = this._useTexture;
        param1.var_10 = param1.name_108 > 0;
    }

    public function method_2149(param1: class_1208): void {
        if (this._useTexture) {
            this._texture.method_6425(param1);
        }
    }

    public function get method_111(): Number {
        return this.var_3327;
    }

    public function set method_111(param1: Number): void {
        this.var_3327 = param1;
    }

    public function get method_5048(): uint {
        return this.var_1871;
    }

    public function set method_5048(param1: uint): void {
        this.var_1871 = param1;
        this.method_5316();
    }

    public function get texture(): class_2116 {
        return this._texture;
    }

    public function set texture(param1: class_2116): void {
        if (Boolean(param1) != this._useTexture || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            method_220();
        }
        this._useTexture = Boolean(param1);
        this._texture = param1;
    }

    public function get alphaThreshold(): Number {
        return this.var_1893;
    }

    public function set alphaThreshold(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        } else if (param1 > 1) {
            param1 = 1;
        }
        if (param1 == this.var_1893) {
            return;
        }
        if (param1 == 0 || this.var_1893 == 0) {
            method_220();
        }
        this.var_1893 = param1;
    }

    override public function dispose(): void {
        this._texture = null;
    }

    override public function copyFrom(param1: class_1779): void {
        var _loc2_: class_2246 = class_2246(param1);
        this.alphaThreshold = _loc2_.alphaThreshold;
        this.texture = _loc2_.texture;
        this.arcane::method_555 = _loc2_.arcane::method_555;
        this.method_111 = _loc2_.method_111;
        this.method_5048 = _loc2_.method_5048;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_712 = null;
        this.var_800 = null;
        this.var_3489 = null;
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        this.var_3130 = true;
        if (param1.name_108 > 0) {
            this.var_800 = param2.method_4834();
            param2.method_4539(this.var_800, 1);
        }
        return "";
    }

    override arcane function method_4161(param1: class_2252, param2: class_2251, param3: class_2251, param4: class_2237): String {
        var _loc6_: * = null;
        var _loc5_: String = "";
        if (this.var_3130) {
            _loc6_ = this.var_800;
        } else {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_, 1);
        }
        _loc5_ += "dp3 " + _loc6_ + ".x, " + param2 + ", " + var_1283.var_3779 + "\n" + "max " + _loc6_ + ".w, " + _loc6_ + ".x, " + var_1283.var_1569 + ".y\n";
        if (param1.var_4198) {
            _loc5_ += "mul " + _loc6_ + ".w, " + _loc6_ + ".w, " + param2 + ".w\n";
        }
        if (arcane::var_366 != null) {
            _loc5_ += arcane::var_366(param1, _loc6_, param4, var_1283);
        }
        _loc5_ += "mul " + _loc6_ + ", " + _loc6_ + ".w, " + param3 + "\n";
        if (!this.var_3130) {
            _loc5_ += "add " + this.var_800 + ".xyz, " + this.var_800 + ", " + _loc6_ + "\n";
            param4.method_771(_loc6_);
        }
        this.var_3130 = false;
        return _loc5_;
    }

    override arcane function method_1573(param1: class_2252, param2: class_2251, param3: String, param4: class_2237): String {
        var _loc6_: * = null;
        var _loc5_: String = "";
        if (this.var_3130) {
            _loc6_ = this.var_800;
        } else {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_, 1);
        }
        _loc5_ += "tex " + _loc6_ + ", " + var_1283.var_3779 + ", " + param2 + " <cube,linear,miplinear>\n" + "mul " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + param3 + "\n";
        if (arcane::var_366 != null) {
            _loc5_ += arcane::var_366(param1, _loc6_, param4, var_1283);
        }
        if (!this.var_3130) {
            _loc5_ += "add " + this.var_800 + ".xyz, " + this.var_800 + ", " + _loc6_ + "\n";
            param4.method_771(_loc6_);
        }
        this.var_3130 = false;
        return _loc5_;
    }

    override arcane function method_5951(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc4_: String = "";
        if (param1.name_108 > 0) {
            if (this.var_712) {
                _loc4_ += this.method_4878(param1, param2);
            }
            _loc5_ = param2.method_4834();
            param2.method_4539(_loc5_, 1);
        } else {
            _loc5_ = param3;
        }
        if (this._useTexture) {
            this.var_3489 = param2.method_3238();
            param1.var_2852 = this.var_3489.index;
            _loc4_ += getTex2DSampleCode(param1, _loc5_, this.var_3489, this._texture);
            if (this.var_1893 > 0) {
                _loc6_ = param2.method_1853();
                param1.var_2676 = Number(_loc6_.index) * 4;
                _loc4_ += "sub " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc6_ + ".x\n" + "kil " + _loc5_ + ".w\n" + "add " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc6_ + ".x\n";
            }
        } else {
            this.var_3489 = param2.method_1853();
            param1.var_2676 = Number(this.var_3489.index) * 4;
            _loc4_ += "mov " + _loc5_ + ", " + this.var_3489 + "\n";
        }
        if (param1.name_108 == 0) {
            return _loc4_;
        }
        _loc4_ += "sat " + this.var_800 + ", " + this.var_800 + "\n";
        if (this.var_3804) {
            _loc4_ += "mul " + _loc5_ + ".xyz, " + _loc5_ + ", " + this.var_800 + "\n" + "mul " + this.var_800 + ".xyz, " + param3 + ", " + this.var_800 + "\n" + "sub " + param3 + ".xyz, " + param3 + ", " + this.var_800 + "\n" + "add " + param3 + ".xyz, " + _loc5_ + ", " + param3 + "\n";
        } else {
            _loc4_ += "add " + param3 + ".xyz, " + this.var_800 + ", " + param3 + "\n";
            if (this._useTexture) {
                _loc4_ += "mul " + param3 + ".xyz, " + _loc5_ + ", " + param3 + "\n" + "mov " + param3 + ".w, " + _loc5_ + ".w\n";
            } else {
                _loc4_ += "mul " + param3 + ".xyz, " + this.var_3489 + ", " + param3 + "\n" + "mov " + param3 + ".w, " + this.var_3489 + ".w\n";
            }
        }
        param2.method_771(this.var_800);
        param2.method_771(_loc5_);
        return _loc4_;
    }

    protected function method_4878(param1: class_2252, param2: class_2237): String {
        return "mul " + this.var_800 + ".xyz, " + this.var_800 + ", " + this.var_712 + ".w\n";
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (this._useTexture) {
            param2.arcane::var_4582.setTextureAt(param1.var_2852, this._texture.method_6425(param2));
            if (this.var_1893 > 0) {
                param1.var_3329[param1.var_2676] = this.var_1893;
            }
        } else {
            _loc3_ = int(param1.var_2676);
            (_loc4_ = param1.var_3329)[_loc3_] = this.var_3866;
            _loc4_[_loc3_ + 1] = this.var_2970;
            _loc4_[_loc3_ + 2] = this.var_1455;
            _loc4_[_loc3_ + 3] = this.var_3327;
        }
    }

    private function method_5316(): void {
        this.var_3866 = (Number(this.var_1871) >> 16 & 255) / 255;
        this.var_2970 = (Number(this.var_1871) >> 8 & 255) / 255;
        this.var_1455 = (Number(this.var_1871) & 255) / 255;
    }

    arcane function set shadowRegister(param1: class_2251): void {
        this.var_712 = param1;
    }
}
}
