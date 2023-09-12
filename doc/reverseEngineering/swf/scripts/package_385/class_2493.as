package package_385 {

import flash.utils.Dictionary;

class class_2493 {

    private static const const_3025: Dictionary = new Dictionary();

    private static const const_1714: Dictionary = new Dictionary();


    private var var_4906: Vector.<class_2251>;

    private var var_4245: Array;

    private var var_145: String;

    private var var_3588: Vector.<Vector.<uint>>;

    private var var_2467: Vector.<uint>;

    private var var_2864: int;

    private var var_2820: Boolean;

    function class_2493(param1: String, param2: int, param3: Boolean = true) {
        super();
        this.var_145 = param1;
        this.var_2864 = param2;
        this.var_2820 = param3;
        this.method_3019(param1, param2);
    }

    private static function method_5930(param1: String, param2: int): String {
        var _loc7_: int = 0;
        var _loc3_: String = param1 + param2;
        if (const_3025[_loc3_] != undefined) {
            return _loc3_;
        }
        var _loc4_: Vector.<class_2251> = new Vector.<class_2251>(param2, true);
        const_3025[_loc3_] = _loc4_;
        var _loc5_: * = [[], [], [], []];
        const_1714[_loc3_] = _loc5_;
        var _loc6_: int = 0;
        while (_loc6_ < param2) {
            _loc4_[_loc6_] = new class_2251(param1, _loc6_);
            _loc7_ = 0;
            while (_loc7_ < 4) {
                _loc5_[_loc7_][_loc6_] = new class_2251(param1, _loc6_, _loc7_);
                _loc7_++;
            }
            _loc6_++;
        }
        return _loc3_;
    }

    public function method_2312(): class_2251 {
        var _loc1_: int = 0;
        while (_loc1_ < this.var_2864) {
            if (!this.method_3978(_loc1_)) {
                if (this.var_2820) {
                    ++this.var_2467[_loc1_];
                }
                return this.var_4906[_loc1_];
            }
            _loc1_++;
        }
        throw new Error("Register overflow!");
    }

    public function method_2117(): class_2251 {
        var _loc2_: int = 0;
        var _loc1_: int = 0;
        while (_loc1_ < this.var_2864) {
            if (this.var_2467[_loc1_] <= 0) {
                _loc2_ = 0;
                while (_loc2_ < 4) {
                    if (this.var_3588[_loc2_][_loc1_] == 0) {
                        if (this.var_2820) {
                            ++this.var_3588[_loc2_][_loc1_];
                        }
                        return this.var_4245[_loc2_][_loc1_];
                    }
                    _loc2_++;
                }
            }
            _loc1_++;
        }
        throw new Error("Register overflow!");
    }

    public function method_56(param1: class_2251, param2: int): void {
        if (param1.var_2135 > -1) {
            this.var_3588[param1.var_2135][param1.index] += param2;
        } else {
            this.var_2467[param1.index] += param2;
        }
    }

    public function method_3188(param1: class_2251): void {
        if (param1.var_2135 > -1) {
            if (--this.var_3588[param1.var_2135][param1.index] < 0) {
                throw new Error("More usages removed than exist!");
            }
        } else if (--this.var_2467[param1.index] < 0) {
            throw new Error("More usages removed than exist!");
        }
    }

    public function dispose(): void {
        this.var_4906 = null;
        this.var_4245 = null;
        this.var_3588 = null;
        this.var_2467 = null;
    }

    public function method_1793(): Boolean {
        var _loc1_: int = 0;
        while (_loc1_ < this.var_2864) {
            if (this.method_3978(_loc1_)) {
                return true;
            }
            _loc1_++;
        }
        return false;
    }

    private function method_3019(param1: String, param2: int): void {
        var _loc3_: String = class_2493.method_5930(param1, param2);
        this.var_4906 = class_2493.const_3025[_loc3_];
        this.var_4245 = class_2493.const_1714[_loc3_];
        this.var_2467 = new Vector.<uint>(param2, true);
        this.var_3588 = new Vector.<Vector.<uint>>(4, true);
        this.var_3588[0] = new Vector.<uint>(param2, true);
        this.var_3588[1] = new Vector.<uint>(param2, true);
        this.var_3588[2] = new Vector.<uint>(param2, true);
        this.var_3588[3] = new Vector.<uint>(param2, true);
    }

    private function method_3978(param1: int): Boolean {
        if (this.var_2467[param1] > 0) {
            return true;
        }
        var _loc2_: int = 0;
        while (_loc2_ < 4) {
            if (this.var_3588[_loc2_][param1] > 0) {
                return true;
            }
            _loc2_++;
        }
        return false;
    }
}
}
