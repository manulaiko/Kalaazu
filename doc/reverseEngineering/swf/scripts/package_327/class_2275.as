package package_327 {

import package_10.class_1920;
import package_10.class_1921;

import package_38.class_456;
import package_38.class_540;
import package_38.class_856;

public class class_2275 {


    public const name_11: class_1920 = new class_1920(0);

    public const currentState: class_1921 = new class_1921();

    private var var_1415: Object;

    private var _states: Object;

    private var var_3276: int;

    private var var_706: int;

    private var var_792: Boolean;

    private var var_2455: int;

    public function class_2275() {
        this.var_1415 = {};
        this._states = {};
        super();
        this.var_1415[class_856.const_2280] = new class_2524(new <int>[3, 4, 7, 8, 11, 12]);
        this.var_1415[class_856.const_2603] = new class_2524(new <int>[17, 18, 19, 21, 22, 23, 25, 26, 27]);
        this.var_1415[class_856.const_380] = new class_2524(new <int>[13, 14, 15, 16, 29]);
        this._states[class_2522] = new class_2522();
        this._states[class_2521] = new class_2521();
        this._states[class_2523] = new class_2523();
        this._states[class_2525] = new class_2525();
        this.setState(class_2525);
    }

    public function get infected(): Boolean {
        return this.var_792;
    }

    public function get name_112(): int {
        return this.var_3276;
    }

    public function get method_2335(): int {
        return this.var_706;
    }

    private function get method_1781(): class_2521 {
        return this._states[class_2521] as class_2521;
    }

    private function get method_3949(): class_2525 {
        return this._states[class_2525] as class_2525;
    }

    public function method_2173(param1: int): void {
        this.var_2455 = param1;
        this.method_200();
    }

    public function method_2659(param1: Vector.<class_856>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: int = param1.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            _loc4_ = param1[_loc3_];
            _loc5_ = this.var_1415[_loc4_.var_95] as class_2524;
            if (_loc4_.var_3308.active) {
                _loc5_.method_217 = _loc4_.var_3308.active;
                _loc5_.counter = _loc4_.var_3308.currentValue;
                _loc5_.method_1078 = _loc4_.var_3308.maxValue;
                _loc5_.active = _loc4_.var_3308.active;
            } else {
                _loc5_.method_217 = false;
                _loc5_.active = _loc4_.var_4471.active;
                _loc5_.counter = _loc4_.var_4471.currentValue;
                _loc5_.method_1078 = _loc4_.var_4471.maxValue;
            }
            _loc3_++;
        }
        this.method_200();
    }

    public function method_1131(param1: class_456): void {
        this.var_792 = param1.infected;
        this.name_11.value = param1.var_3175;
    }

    public function method_5449(param1: class_540): void {
        this.var_3276 = param1.name_112;
        this.var_706 = param1.var_1629;
    }

    private function method_200(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = undefined;
        var _loc1_: class_2524 = this.method_7();
        if (_loc1_) {
            this.method_1781.method_3546 = _loc1_;
            this.setState(class_2521);
        } else {
            _loc3_ = new Vector.<int>(0);
            for (_loc4_ in this.var_1415) {
                _loc2_ = this.var_1415[_loc4_] as class_2524;
                if (_loc2_.active) {
                    _loc3_ = _loc3_.concat(_loc2_.method_4796);
                }
            }
            if (_loc3_.length > 0) {
                this.method_3949.maps = _loc3_;
                this.setState(class_2525);
            } else {
                this.setState(class_2523);
            }
        }
    }

    private function method_7(): class_2524 {
        var _loc1_: * = undefined;
        var _loc2_: * = null;
        for (_loc1_ in this.var_1415) {
            _loc2_ = this.var_1415[_loc1_] as class_2524;
            if (Boolean(_loc2_.active) && Boolean(_loc2_.method_2098(this.var_2455))) {
                return _loc2_;
            }
        }
        return null;
    }

    private function setState(param1: Class): void {
        this.currentState.value = this._states[param1];
    }
}
}
