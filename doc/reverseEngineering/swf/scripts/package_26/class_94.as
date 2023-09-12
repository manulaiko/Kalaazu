package package_26 {

import flash.display.DisplayObject;
import flash.display.InteractiveObject;
import flash.geom.Rectangle;

import package_14.class_52;

import package_46.class_131;

import package_9.class_50;

public class class_94 implements class_52 {

    private static var _instance: class_94;


    private var var_4679: Array;

    private var var_583: Array;

    private var var_3427: Boolean;

    private var bounds: Rectangle;

    private var scaleFactor: Number;

    private var _tpf: Number = 0;

    public function class_94(param1: Function) {
        var _loc2_: * = null;
        super();
        if (param1 !== method_336) {
            _loc2_ = "TooltipControl is a Singleton and can only be accessed through TooltipControl.getInstance()";
            throw new Error(_loc2_);
        }
        this.init();
    }

    private static function method_336(): void {
    }

    public static function getInstance(): class_94 {
        if (_instance == null) {
            _instance = new class_94(method_336);
        }
        return _instance;
    }

    private function init(): void {
        this.var_4679 = [];
        this.var_583 = [];
    }

    public function method_1211(param1: InteractiveObject, param2: String, param3: Boolean = false): class_333 {
        if (!param2 || param2.length < 1) {
            return null;
        }
        if (this.method_6181(param1)) {
            this.method_4247(param1);
        }
        var _loc4_: class_333;
        (_loc4_ = new class_333(param1, param2, param3)).method_2670(this.bounds);
        _loc4_.addEventListeners();
        this.var_4679.push(_loc4_);
        return _loc4_;
    }

    public function method_6181(param1: InteractiveObject): class_333 {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_4679.length) {
            _loc3_ = this.var_4679[_loc2_];
            if (param1 == _loc3_.getTargetObject()) {
                return _loc3_;
            }
            _loc2_++;
        }
        return null;
    }

    public function method_4605(param1: DisplayObject, param2: String, param3: int, param4: int, param5: int = 220, param6: Boolean = false): class_334 {
        if (param2 == null) {
            return null;
        }
        if (param2.length < 1) {
            return null;
        }
        var _loc7_: class_334;
        (_loc7_ = new class_334(param1, param2, param3, param4, param5, param6)).method_2670(this.bounds);
        this.var_583.push(_loc7_);
        return _loc7_;
    }

    public function method_2670(param1: Rectangle): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.bounds = param1;
        for each(_loc2_ in this.var_4679) {
            _loc2_.method_2670(param1);
        }
        for each(_loc3_ in this.var_583) {
            _loc3_.method_2670(param1);
        }
    }

    public function method_3325(param1: Number): void {
        this.scaleFactor = param1;
    }

    public function method_4247(param1: InteractiveObject): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.var_4679.length) {
            if (class_333(this.var_4679[_loc2_]).getTargetObject() == param1) {
                class_333(this.var_4679[_loc2_]).suicide();
                this.var_4679.splice(_loc2_, 1);
            }
            _loc2_++;
        }
    }

    public function method_4106(param1: InteractiveObject): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.var_583.length) {
            if (class_334(this.var_583[_loc2_]).getTargetObject() == param1) {
                class_334(this.var_583[_loc2_]).suicide();
                this.var_583.splice(_loc2_, 1);
            }
            _loc2_++;
        }
    }

    public function method_6247(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this.var_4679.length) {
            if (this.var_4679[_loc1_] != undefined && this.var_4679[_loc1_] != null) {
                class_333(this.var_4679[_loc1_]).hideTooltip();
            }
            _loc1_++;
        }
    }

    public function method_6461(): void {
        class_50.method_5621(this);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        this._tpf += param1;
        if (this._tpf > 999) {
            _loc2_ = 0;
            while (_loc2_ < this.var_583.length) {
                _loc3_ = class_334(this.var_583[_loc2_]);
                if ((_loc4_ = _loc3_.getTargetObject()) is class_131) {
                    if (Boolean((_loc5_ = class_131(_loc4_)).maximized) && !_loc5_.method_5591) {
                        class_334(this.var_583[_loc2_]).showTooltip();
                    }
                } else {
                    class_334(this.var_583[_loc2_]).showTooltip();
                }
                _loc2_++;
            }
            this.method_1028();
        }
    }

    private function method_1028(): void {
        class_50.removeObserver(this);
        this._tpf = 0;
    }

    public function method_5847(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this.var_583.length) {
            class_334(this.var_583[_loc1_]).hideTooltip();
            _loc1_++;
        }
        this.method_1028();
    }

    public function method_6214(): Number {
        return this.scaleFactor;
    }
}
}
