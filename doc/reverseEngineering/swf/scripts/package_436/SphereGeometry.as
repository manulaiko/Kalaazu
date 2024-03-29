package package_436 {

import away3d.arcane;

import package_294.class_2602;

public class SphereGeometry extends class_2474 {


    private var var_126: Number;

    private var var_1685: uint;

    private var var_177: uint;

    private var var_1296: Boolean;

    public function SphereGeometry(param1: Number = 50, param2: uint = 16, param3: uint = 12, param4: Boolean = true) {
        super();
        this.var_126 = param1;
        this.var_1685 = param2;
        this.var_177 = param3;
        this.var_1296 = param4;
    }

    override protected function method_389(param1: class_2602): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: Number = 0;
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        var _loc10_: * = 0;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: int = 0;
        var _loc25_: int = 0;
        var _loc26_: int = 0;
        var _loc27_: int = 0;
        var _loc7_: uint = (this.var_177 + 1) * (this.var_1685 + 1);
        var _loc8_: uint;
        var _loc9_: uint = (_loc8_ = uint(param1.method_4110)) - 9;
        if (_loc7_ == param1.numVertices) {
            _loc2_ = param1.name_104;
            _loc3_ = param1.indexData || new Vector.<uint>((this.var_177 - 1) * Number(this.var_1685) * 6, true);
        } else {
            _loc2_ = new Vector.<Number>(_loc7_ * _loc8_, true);
            _loc3_ = new Vector.<uint>((this.var_177 - 1) * Number(this.var_1685) * 6, true);
            method_2121();
        }
        var _loc11_: uint = uint(param1.method_720);
        _loc5_ = 0;
        while (_loc5_ <= this.var_177) {
            _loc10_ = _loc11_;
            _loc16_ = 0 * _loc5_ / Number(this.var_177);
            _loc17_ = -Number(this.var_126) * Math.cos(_loc16_);
            _loc18_ = Number(this.var_126) * Math.sin(_loc16_);
            _loc4_ = 0;
            while (_loc4_ <= this.var_1685) {
                _loc19_ = 0 * _loc4_ / Number(this.var_1685);
                _loc20_ = _loc18_ * Math.cos(_loc19_);
                _loc21_ = _loc18_ * Math.sin(_loc19_);
                _loc22_ = 1 / Math.sqrt(_loc20_ * _loc20_ + _loc21_ * _loc21_ + _loc17_ * _loc17_);
                _loc23_ = Math.sqrt(_loc21_ * _loc21_ + _loc20_ * _loc20_);
                if (this.var_1296) {
                    _loc14_ = 0;
                    _loc15_ = _loc23_ > 0.007 ? _loc20_ / _loc23_ : 0;
                    _loc12_ = -_loc17_;
                    _loc13_ = _loc21_;
                } else {
                    _loc14_ = _loc23_ > 0.007 ? _loc20_ / _loc23_ : 0;
                    _loc15_ = 0;
                    _loc12_ = _loc21_;
                    _loc13_ = _loc17_;
                }
                if (_loc4_ == this.var_1685) {
                    var _loc28_: *;
                    _loc2_[_loc28_ = _loc11_++] = _loc2_[_loc10_];
                    var _loc29_: *;
                    _loc2_[_loc29_ = _loc11_++] = _loc2_[_loc10_ + 1];
                    var _loc30_: *;
                    _loc2_[_loc30_ = _loc11_++] = _loc2_[_loc10_ + 2];
                    var _loc31_: *;
                    _loc2_[_loc31_ = _loc11_++] = _loc2_[_loc10_ + 3] + _loc20_ * _loc22_ * 0.5;
                    var _loc32_: *;
                    _loc2_[_loc32_ = _loc11_++] = _loc2_[_loc10_ + 4] + _loc12_ * _loc22_ * 0.5;
                    var _loc33_: *;
                    _loc2_[_loc33_ = _loc11_++] = _loc2_[_loc10_ + 5] + _loc13_ * _loc22_ * 0.5;
                    var _loc34_: *;
                    _loc2_[_loc34_ = _loc11_++] = _loc23_ > 0.007 ? -_loc21_ / _loc23_ : 1;
                    var _loc35_: *;
                    _loc2_[_loc35_ = _loc11_++] = _loc14_;
                    var _loc36_: *;
                    _loc2_[_loc36_ = _loc11_++] = _loc15_;
                } else {
                    _loc2_[_loc28_ = _loc11_++] = _loc20_;
                    _loc2_[_loc29_ = _loc11_++] = _loc12_;
                    _loc2_[_loc30_ = _loc11_++] = _loc13_;
                    _loc2_[_loc31_ = _loc11_++] = _loc20_ * _loc22_;
                    _loc2_[_loc32_ = _loc11_++] = _loc12_ * _loc22_;
                    _loc2_[_loc33_ = _loc11_++] = _loc13_ * _loc22_;
                    _loc2_[_loc34_ = _loc11_++] = _loc23_ > 0.007 ? -_loc21_ / _loc23_ : 1;
                    _loc2_[_loc35_ = _loc11_++] = _loc14_;
                    _loc2_[_loc36_ = _loc11_++] = _loc15_;
                }
                if (_loc4_ > 0 && _loc5_ > 0) {
                    _loc24_ = (this.var_1685 + 1) * _loc5_ + _loc4_;
                    _loc25_ = (this.var_1685 + 1) * _loc5_ + _loc4_ - 1;
                    _loc26_ = (this.var_1685 + 1) * (_loc5_ - 1) + _loc4_ - 1;
                    _loc27_ = (this.var_1685 + 1) * (_loc5_ - 1) + _loc4_;
                    if (_loc5_ == this.var_177) {
                        _loc2_[_loc11_ - 9] = _loc2_[_loc10_];
                        _loc2_[_loc11_ - 8] = _loc2_[_loc10_ + 1];
                        _loc2_[_loc11_ - 7] = _loc2_[_loc10_ + 2];
                        _loc3_[_loc28_ = _loc6_++] = _loc24_;
                        _loc3_[_loc29_ = _loc6_++] = _loc26_;
                        _loc3_[_loc30_ = _loc6_++] = _loc27_;
                    } else if (_loc5_ == 1) {
                        _loc3_[_loc28_ = _loc6_++] = _loc24_;
                        _loc3_[_loc29_ = _loc6_++] = _loc25_;
                        _loc3_[_loc30_ = _loc6_++] = _loc26_;
                    } else {
                        _loc3_[_loc28_ = _loc6_++] = _loc24_;
                        _loc3_[_loc29_ = _loc6_++] = _loc25_;
                        _loc3_[_loc30_ = _loc6_++] = _loc26_;
                        _loc3_[_loc31_ = _loc6_++] = _loc24_;
                        _loc3_[_loc32_ = _loc6_++] = _loc26_;
                        _loc3_[_loc33_ = _loc6_++] = _loc27_;
                    }
                }
                _loc11_ += _loc9_;
                _loc4_++;
            }
            _loc5_++;
        }
        param1.updateData(_loc2_);
        param1.updateIndexData(_loc3_);
    }

    override protected function method_1765(param1: class_2602): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc6_: * = null;
        var _loc4_: uint = uint(param1.method_2639);
        var _loc5_: uint = (this.var_177 + 1) * (this.var_1685 + 1) * _loc4_;
        var _loc7_: uint = _loc4_ - 2;
        if (Boolean(param1.method_868) && _loc5_ == param1.method_868.length) {
            _loc6_ = param1.method_868;
        } else {
            _loc6_ = new Vector.<Number>(_loc5_, true);
            method_2121();
        }
        var _loc8_: int = int(param1.method_2585);
        _loc3_ = 0;
        while (_loc3_ <= this.var_177) {
            _loc2_ = 0;
            while (_loc2_ <= this.var_1685) {
                var _loc9_: *;
                _loc6_[_loc9_ = _loc8_++] = _loc2_ / Number(this.var_1685) * Number(param1.name_38);
                var _loc10_: *;
                _loc6_[_loc10_ = _loc8_++] = _loc3_ / Number(this.var_177) * Number(param1.name_72);
                _loc8_ += _loc7_;
                _loc2_++;
            }
            _loc3_++;
        }
        param1.updateData(_loc6_);
    }

    public function get radius(): Number {
        return this.var_126;
    }

    public function set radius(param1: Number): void {
        this.var_126 = param1;
        method_2121();
    }

    public function get segmentsW(): uint {
        return this.var_1685;
    }

    public function set segmentsW(param1: uint): void {
        this.var_1685 = param1;
        method_2121();
        method_596();
    }

    public function get segmentsH(): uint {
        return this.var_177;
    }

    public function set segmentsH(param1: uint): void {
        this.var_177 = param1;
        method_2121();
        method_596();
    }

    public function get yUp(): Boolean {
        return this.var_1296;
    }

    public function set yUp(param1: Boolean): void {
        this.var_1296 = param1;
        method_2121();
    }
}
}
