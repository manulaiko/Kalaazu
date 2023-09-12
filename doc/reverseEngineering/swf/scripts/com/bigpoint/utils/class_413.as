package com.bigpoint.utils {

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_413 {

    private static var _instance: class_413;


    private var price: Number;

    private var currency: String;

    public function class_413(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("PriceFormatter is a Singleton and can only be accessed through priceFormatter.getInstance()");
        }
    }

    private static function method_336(): void {
    }

    public static function get instance(): class_413 {
        if (_instance == null) {
            _instance = new class_413(method_336);
        }
        return _instance;
    }

    public function format(param1: Number, param2: String, param3: RegExp, param4: String): String {
        this.price = param1;
        this.currency = param2;
        return param4.replace(param3, this.method_842);
    }

    private function method_842(): String {
        var _loc2_: * = null;
        var _loc8_: Boolean = false;
        var _loc3_: * = "isoprice";
        var _loc4_: String = "%CODE%";
        var _loc5_: * = "isocode";
        var _loc6_: String = "";
        var _loc7_: String;
        if ((_loc7_ = arguments[1]).length > 0) {
            if (_loc7_.charAt(0) == "|") {
                _loc7_ = _loc7_.substring(1, _loc7_.length);
            }
            if ((_loc6_ = _loc7_).search(/WORD/) > -1) {
                _loc3_ = "price_word";
                _loc4_ = "%WORD%";
                _loc5_ = "word";
                if (_loc6_.search(/CAPS/) > -1) {
                    _loc8_ = true;
                }
            } else if (_loc6_.search(/ISO/) > -1) {
                _loc3_ = "isoprice";
                _loc4_ = "%CODE%";
                _loc5_ = "isocode";
            } else if (_loc6_.search(/SYMBOL/) > -1) {
                _loc3_ = "pricetag_symbol";
                _loc4_ = "%SYMBOL%";
                _loc5_ = "symbol";
            }
        }
        if (this.price < 1 && _loc4_ != "%CODE%") {
            _loc3_ += "_sub";
            _loc5_ += "sub";
        }
        if (_loc8_) {
            _loc5_ += "caps";
        }
        _loc2_ = class_88.getItem(_loc3_);
        var _loc9_: String = "currency_" + _loc5_ + "_" + this.currency;
        _loc2_ = _loc2_.replace(_loc4_, class_88.getItem(_loc9_));
        _loc2_ = _loc2_.replace(/%FULL%/, class_122.method_98(Math.floor(this.price)));
        var _loc10_: String = this.price.toFixed(2);
        return _loc2_.replace(/%SUB%/, _loc10_.substring(_loc10_.indexOf(".") + 1, _loc10_.length));
    }
}
}
