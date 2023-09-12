package package_385 {

import away3d.arcane;

public class class_2498 extends class_2495 {


    public var var_3744: Vector.<class_2251>;

    public var var_519: Vector.<class_2251>;

    public function class_2498(param1: String) {
        super(param1);
    }

    override protected function method_17(): void {
        super.method_17();
        this.var_3744 = new Vector.<class_2251>(Number(var_1458) * 3, true);
        this.var_519 = new Vector.<class_2251>(Number(var_231) * 3, true);
    }

    override protected function method_1869(): void {
        super.method_1869();
        var_3743.method_6352(true);
    }

    override protected function method_1462(): void {
        var _loc1_: Vector.<class_2251> = new Vector.<class_2251>(3, true);
        var_1283.var_3779 = var_4305.method_4834();
        var_4305.method_4539(var_1283.var_3779, var_3743.method_2419);
        if (Boolean(var_1738.arcane::var_491.arcane::method_5395) && !var_1738.arcane::var_491.arcane::tangentSpace) {
            var_595 += var_1738.arcane::var_491.arcane::getVertexCode(var_1738.arcane::var_1294, var_4305);
            var_2468 += var_1738.arcane::var_491.arcane::getFragmentCode(var_1738.arcane::var_1294, var_4305, var_1283.var_3779);
            return;
        }
        var_1283.var_3038 = var_4305.method_5601();
        _loc1_[0] = var_4305.method_5384();
        _loc1_[1] = var_4305.method_5384();
        _loc1_[2] = var_4305.method_5384();
        var_4305.method_5384();
        var_1163 = Number(_loc1_[0].index) * 4;
        if (var_1738.arcane::var_491.arcane::method_5395) {
            this.method_5037(_loc1_);
            this.method_5570();
        } else {
            var_595 += "m33 undefined.xyz, undefined, " + _loc1_[0] + "\n" + "mov " + var_1283.var_3038 + ".w, " + var_1283.var_2573 + ".w\t\n";
            var_2468 += "nrm undefined.xyz, undefined\nmov undefined.w, undefined.w\t\t\n";
            if (false) {
                var_1283.var_723 = var_4305.method_723();
                var_2060 = var_1283.var_723.index;
                var_1283.var_1141 = var_4305.method_5601();
                var_595 += "mov undefined, undefined\n";
            }
        }
        var_4305.method_5694(var_1283.var_2573);
    }

    override protected function method_2506(): void {
        if (false) {
            var_1283.var_4037 = var_4305.method_723();
            var_3008 = var_1283.var_4037.index;
            var_1283.var_2573 = var_4305.method_3118();
            var_4305.method_588(var_1283.var_2573, 1);
            var_16.push(var_1283.var_4037.toString());
            var_2915.push(var_1283.var_2573.toString());
        }
        if (var_1738.arcane::var_491.arcane::method_5395) {
            var_1283.var_723 = var_4305.method_723();
            var_2060 = var_1283.var_723.index;
            var_1283.var_2367 = var_4305.method_3118();
            var_4305.method_588(var_1283.var_2367, 1);
            var_16.push(var_1283.var_723.toString());
            var_2915.push(var_1283.var_2367.toString());
        }
    }

    private function method_5037(param1: Vector.<class_2251>): void {
        var_1283.var_1141 = var_4305.method_5601();
        var_1283.var_2952 = var_4305.method_5601();
        var_595 += "m33 undefined.xyz, undefined, " + param1[0] + "\n" + "nrm " + var_1283.var_2573 + ".xyz, " + var_1283.var_2573 + "\n";
        var_595 += "m33 undefined.xyz, undefined, " + param1[0] + "\n" + "nrm " + var_1283.var_2367 + ".xyz, " + var_1283.var_2367 + "\n";
        var _loc2_: class_2251 = var_4305.method_3118();
        var_595 += "mov undefined.x, undefined.x  \nmov undefined.z, undefined.x  \nmov undefined.w, undefined.w  \nmov undefined.x, undefined.y  \nmov undefined.z, undefined.y  \nmov undefined.w, undefined.w  \nmov undefined.x, undefined.z  \nmov undefined.z, undefined.z  \nmov undefined.w, undefined.w  \ncrs " + _loc2_ + ".xyz, " + var_1283.var_2573 + ", " + var_1283.var_2367 + "\n" + "mov " + var_1283.var_1141 + ".y, " + _loc2_ + ".x    \n" + "mov " + var_1283.var_2952 + ".y, " + _loc2_ + ".y  \n" + "mov " + var_1283.var_3038 + ".y, " + _loc2_ + ".z    \n";
        var_4305.method_5694(var_1283.var_2367);
    }

    private function method_5570(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        _loc1_ = var_4305.method_4834();
        var_4305.method_4539(_loc1_, 1);
        _loc2_ = var_4305.method_4834();
        var_4305.method_4539(_loc2_, 1);
        _loc3_ = var_4305.method_4834();
        var_4305.method_4539(_loc3_, 1);
        var_2468 += "nrm " + _loc1_ + ".xyz, " + var_1283.var_1141 + "\n" + "mov " + _loc1_ + ".w, " + var_1283.var_1141 + ".w\t\n" + "nrm " + _loc2_ + ".xyz, " + var_1283.var_2952 + "\n" + "nrm " + _loc3_ + ".xyz, " + var_1283.var_3038 + "\n";
        var _loc4_: class_2251 = var_4305.method_4834();
        var_4305.method_4539(_loc4_, 1);
        var_2468 += var_1738.arcane::var_491.arcane::getFragmentCode(var_1738.arcane::var_1294, var_4305, _loc4_) + "m33 " + var_1283.var_3779 + ".xyz, " + _loc4_ + ", " + _loc1_ + "\t\n" + "mov " + var_1283.var_3779 + ".w,   " + var_1283.var_3038 + ".w\t\t\t\n";
        var_4305.method_771(_loc4_);
        if (var_1738.arcane::var_1294.var_3475) {
            var_4305.method_771(var_1283.var_4238);
        }
        if (Boolean(var_1738.arcane::var_1294.var_4475) || Boolean(var_1738.arcane::var_1294.var_4342)) {
            var_4305.method_5694(var_1283.var_1070);
        }
        var_4305.method_771(_loc2_);
        var_4305.method_771(_loc1_);
        var_4305.method_771(_loc3_);
    }

    override protected function method_2124(): void {
        var _loc1_: class_2251 = var_4305.method_5384();
        var_1283.var_4419 = var_4305.method_5601();
        var_1283.var_4238 = var_4305.method_4834();
        var_4305.method_4539(var_1283.var_4238, var_3743.method_2081);
        var_3169 = Number(_loc1_.index) * 4;
        var_595 += "sub undefined, " + _loc1_ + ", " + var_1283.var_1070 + "\n";
        var_2468 += "nrm undefined.xyz, undefined\nmov undefined.w,   undefined.w \t\t\n";
        var_4305.method_5694(var_1283.var_1070);
    }

    override protected function method_1661(): void {
        var _loc1_: * = null;
        var_1283.name_28 = var_4305.method_4834();
        var_4305.method_4539(var_1283.name_28, 1);
        var_595 += var_1738.arcane::var_2753.arcane::getVertexCode(var_1738.arcane::var_2698, var_4305);
        var_2468 += var_1738.arcane::var_2753.arcane::method_1029(var_1738.arcane::var_2698, var_4305);
        if (var_2991) {
            var_595 += var_1738.arcane::var_1906.arcane::getVertexCode(var_1738.arcane::var_3165, var_4305);
            var_2468 += var_1738.arcane::var_1906.arcane::method_1029(var_1738.arcane::var_3165, var_4305);
        }
        if (method_71()) {
            this.method_2949();
            this.method_1010();
            this.method_1194();
        }
        if (method_564()) {
            this.method_4973();
        }
        var_595 += var_1738.arcane::var_2401.arcane::getVertexCode(var_1738.arcane::var_4870, var_4305);
        var_2468 += var_1738.arcane::var_2401.arcane::getFragmentCode(var_1738.arcane::var_4870, var_4305, var_1283.name_28);
        if (var_1738.arcane::var_4870.var_10) {
            var_4305.method_771(var_1283.var_3779);
        }
        if (var_1738.arcane::var_4870.var_3475) {
            var_4305.method_771(var_1283.var_4238);
        }
        if (false) {
            var_595 += var_1738.arcane::var_2047.arcane::getVertexCode(var_1738.arcane::var_1078, var_4305);
            if (false) {
                _loc1_ = var_4305.method_4834();
                var_4305.method_4539(_loc1_, 1);
            } else {
                _loc1_ = var_1283.var_3779;
            }
            var_1738.arcane::var_2753.arcane::shadowRegister = _loc1_;
            var_2468 += var_1738.arcane::var_2047.arcane::getFragmentCode(var_1738.arcane::var_1078, var_4305, _loc1_);
        }
        var_2468 += var_1738.arcane::var_2753.arcane::method_5951(var_1738.arcane::var_2698, var_4305, var_1283.name_28);
        if (var_3218) {
            var_2468 += "add undefined.w, undefined.w, undefined.z\ndiv undefined.xyz, undefined, undefined.w\nsub undefined.w, undefined.w, undefined.z\nsat undefined.xyz, undefined\n";
        }
        if (var_1738.arcane::var_2698.var_10) {
            var_4305.method_771(var_1283.var_3779);
        }
        if (var_1738.arcane::var_2698.var_3475) {
            var_4305.method_771(var_1283.var_4238);
        }
        if (var_2991) {
            var_1738.arcane::var_1906.arcane::shadowRegister = _loc1_;
            var_2468 += var_1738.arcane::var_1906.arcane::method_5951(var_1738.arcane::var_3165, var_4305, var_1283.name_28);
            if (var_1738.arcane::var_3165.var_10) {
                var_4305.method_771(var_1283.var_3779);
            }
            if (var_1738.arcane::var_3165.var_3475) {
                var_4305.method_771(var_1283.var_4238);
            }
        }
    }

    private function method_2949(): void {
        var _loc1_: Number = 0;
        var _loc2_: * = 0;
        _loc2_ = uint(this.var_519.length);
        _loc1_ = 0;
        while (_loc1_ < _loc2_) {
            this.var_519[_loc1_] = var_4305.method_1853();
            if (var_2296 == -1) {
                var_2296 = Number(this.var_519[_loc1_].index) * 4;
            }
            _loc1_++;
        }
        _loc2_ = uint(this.var_3744.length);
        _loc1_ = 0;
        while (_loc1_ < _loc2_) {
            this.var_3744[_loc1_] = var_4305.method_1853();
            if (var_2296 == -1) {
                var_2296 = Number(this.var_3744[_loc1_].index) * 4;
            }
            _loc1_++;
        }
    }

    private function method_1010(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: Boolean = Boolean(var_2991) && Boolean(method_5632());
        var _loc6_: Boolean = Boolean(method_1538());
        if (!(_loc5_ || _loc6_)) {
            return;
        }
        var _loc7_: Number = 0;
        while (_loc7_ < var_231) {
            _loc3_ = this.var_519[_loc4_++];
            _loc1_ = this.var_519[_loc4_++];
            _loc2_ = this.var_519[_loc4_++];
            if (_loc6_) {
                var_2468 += var_1738.arcane::var_2753.arcane::method_4161(var_1738.arcane::var_2698, _loc3_, _loc1_, var_4305);
            }
            if (_loc5_) {
                var_2468 += var_1738.arcane::var_1906.arcane::method_4161(var_1738.arcane::var_3165, _loc3_, _loc2_, var_4305);
            }
            _loc7_++;
        }
    }

    private function method_1194(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: Boolean = Boolean(var_2991) && Boolean(method_5632());
        var _loc7_: Boolean = Boolean(method_1538());
        if (!(_loc6_ || _loc7_)) {
            return;
        }
        var _loc8_: Number = 0;
        while (_loc8_ < var_1458) {
            _loc3_ = this.var_3744[_loc5_++];
            _loc1_ = this.var_3744[_loc5_++];
            _loc2_ = this.var_3744[_loc5_++];
            _loc4_ = var_4305.method_4834();
            var_4305.method_4539(_loc4_, 1);
            var_2468 += "sub " + _loc4_ + ", " + _loc3_ + ", " + var_1283.var_1489 + "\n" + "dp3 " + _loc4_ + ".w, " + _loc4_ + ", " + _loc4_ + "\n" + "sub " + _loc4_ + ".w, " + _loc4_ + ".w, " + _loc1_ + ".w\n" + "mul " + _loc4_ + ".w, " + _loc4_ + ".w, " + _loc2_ + ".w\n" + "sat " + _loc4_ + ".w, " + _loc4_ + ".w\n" + "sub " + _loc4_ + ".w, " + _loc3_ + ".w, " + _loc4_ + ".w\n" + "nrm " + _loc4_ + ".xyz, " + _loc4_ + "\n";
            if (var_2296 == -1) {
                var_2296 = Number(_loc3_.index) * 4;
            }
            if (_loc7_) {
                var_2468 += var_1738.arcane::var_2753.arcane::method_4161(var_1738.arcane::var_2698, _loc4_, _loc1_, var_4305);
            }
            if (_loc6_) {
                var_2468 += var_1738.arcane::var_1906.arcane::method_4161(var_1738.arcane::var_3165, _loc4_, _loc2_, var_4305);
            }
            var_4305.method_771(_loc4_);
            _loc8_++;
        }
    }

    private function method_4973(): void {
        var _loc1_: * = null;
        var _loc4_: Number = 0;
        var _loc5_: * = null;
        var _loc2_: * = [".x", ".y", ".z", ".w"];
        var _loc3_: Vector.<class_2251> = new Vector.<class_2251>();
        var _loc6_: Boolean = Boolean(var_2991) && Boolean(method_2381());
        var _loc7_: Boolean = Boolean(method_2490());
        if (!(_loc6_ || _loc7_)) {
            return;
        }
        if (_loc7_) {
            var_553 = new Vector.<uint>();
        }
        if (_loc6_) {
            var_1335 = new Vector.<uint>();
        }
        _loc4_ = 0;
        while (_loc4_ < var_1687) {
            _loc3_[_loc4_] = var_4305.method_1853();
            if (_loc4_ == 0) {
                var_1468 = Number(_loc3_[_loc4_].index) * 4;
            }
            _loc4_++;
        }
        _loc4_ = 0;
        while (_loc4_ < var_1052) {
            _loc1_ = _loc3_[Math.floor(_loc4_ / 4)].toString() + _loc2_[_loc4_ % 4];
            if (_loc7_) {
                _loc5_ = var_4305.method_3238();
                var_553[_loc4_] = _loc5_.index;
                var_2468 += var_1738.arcane::var_2753.arcane::method_1573(var_1738.arcane::var_2698, _loc5_, _loc1_, var_4305);
            }
            if (_loc6_) {
                _loc5_ = var_4305.method_3238();
                var_1335[_loc4_] = _loc5_.index;
                var_2468 += var_1738.arcane::var_1906.arcane::method_1573(var_1738.arcane::var_3165, _loc5_, _loc1_, var_4305);
            }
            _loc4_++;
        }
    }
}
}
