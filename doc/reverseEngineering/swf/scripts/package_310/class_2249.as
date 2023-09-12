package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2251;

public class class_2249 extends class_1780 {

    public static const ADD: String = "add";

    public static const MULTIPLY: String = "multiply";

    public static const const_1264: String = "mix";


    private var _color: uint;

    private var _blendMode: String;

    private var var_2418: Number;

    private var var_1505: Number;

    private var var_607: Number;

    private var _strength: Number;

    private var var_667: Number;

    public function class_2249(param1: uint = 16777215, param2: Number = 0.4, param3: Number = 2, param4: String = "mix") {
        super();
        this._blendMode = param4;
        this._strength = param2;
        this.var_667 = param3;
        this.color = param1;
    }

    override arcane function method_4956(param1: class_2252): void {
        param1.var_3329[param1.var_2676 + 3] = 1;
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_10 = true;
        param1.var_3475 = true;
    }

    public function get blendMode(): String {
        return this._blendMode;
    }

    public function set blendMode(param1: String): void {
        if (this._blendMode == param1) {
            return;
        }
        this._blendMode = param1;
        method_220();
    }

    public function get color(): uint {
        return this._color;
    }

    public function set color(param1: uint): void {
        this._color = param1;
        this.var_2418 = (param1 >> 16 & 255) / 255;
        this.var_1505 = (param1 >> 8 & 255) / 255;
        this.var_607 = (param1 & 255) / 255;
    }

    public function get strength(): Number {
        return this._strength;
    }

    public function set strength(param1: Number): void {
        this._strength = param1;
    }

    public function get power(): Number {
        return this.var_667;
    }

    public function set power(param1: Number): void {
        this.var_667 = param1;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        var _loc3_: int = int(param1.var_2676);
        var _loc4_: Vector.<Number>;
        (_loc4_ = param1.var_3329)[_loc3_] = this.var_2418;
        _loc4_[_loc3_ + 1] = this.var_1505;
        _loc4_[_loc3_ + 2] = this.var_607;
        _loc4_[_loc3_ + 4] = this._strength;
        _loc4_[_loc3_ + 5] = this.var_667;
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: class_2251 = param2.method_1853();
        var _loc5_: class_2251 = param2.method_1853();
        var _loc6_: class_2251 = param2.method_4834();
        var _loc7_: String = "";
        param1.var_2676 = Number(_loc4_.index) * 4;
        _loc7_ += "dp3 " + _loc6_ + ".x, " + var_1283.var_4238 + ".xyz, " + var_1283.var_3779 + ".xyz\t\n" + "sat " + _loc6_ + ".x, " + _loc6_ + ".x\t\t\t\t\t\t\t\t\t\t\t\t\t\t\n" + "sub " + _loc6_ + ".x, " + _loc4_ + ".w, " + _loc6_ + ".x\t\t\t\t\t\t\t\t\n" + "pow " + _loc6_ + ".x, " + _loc6_ + ".x, " + _loc5_ + ".y\t\t\t\t\t\t\t\n" + "mul " + _loc6_ + ".x, " + _loc6_ + ".x, " + _loc5_ + ".x\t\t\t\t\t\t\t\n" + "sub " + _loc6_ + ".x, " + _loc4_ + ".w, " + _loc6_ + ".x\t\t\t\t\t\t\t\t\n" + "mul " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".x\t\t\t\t\t\t\n" + "sub " + _loc6_ + ".w, " + _loc4_ + ".w, " + _loc6_ + ".x\t\t\t\t\t\t\t\t\n";
        if (this._blendMode == ADD) {
            _loc7_ += "mul " + _loc6_ + ".xyz, " + _loc6_ + ".w, " + _loc4_ + ".xyz\t\t\t\t\t\t\t\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\t\t\t\n";
        } else if (this._blendMode == MULTIPLY) {
            _loc7_ += "mul " + _loc6_ + ".xyz, " + _loc6_ + ".w, " + _loc4_ + ".xyz\t\t\t\t\t\t\t\n" + "mul " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\t\t\t\n";
        } else {
            _loc7_ += "sub " + _loc6_ + ".xyz, " + _loc4_ + ".xyz, " + param3 + ".xyz\t\t\t\t\n" + "mul " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + _loc6_ + ".w\t\t\t\t\t\t\t\t\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\t\t\n";
        }
        return _loc7_;
    }
}
}
