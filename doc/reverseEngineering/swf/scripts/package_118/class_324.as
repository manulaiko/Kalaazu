package package_118 {

import flash.utils.Dictionary;

public class class_324 {


    private var _name: String;

    private var _content: Vector.<class_1184>;

    public function class_324(param1: String) {
        super();
        this._name = param1;
        this._content = new Vector.<class_1184>();
    }

    public function get name(): String {
        return this._name;
    }

    public function set name(param1: String): void {
        this._name = param1;
    }

    public function link(): void {
        var _loc1_: uint = uint(this._content.length);
        var _loc2_: Number = 0;
        while (_loc2_ < _loc1_) {
            this._content[_loc2_].link();
            _loc2_++;
        }
    }

    public function setContent(param1: String, param2: int = 0, param3: Boolean = true): void {
        var _loc4_: Number = 0;
        var _loc6_: int = 0;
        var _loc9_: * = null;
        var _loc5_: uint = uint(this._content.length);
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc10_: String = param1.replace(/<br>/g, "\n");
        _loc4_ = 0;
        while (_loc4_ < _loc5_) {
            _loc8_ = _loc7_ = this._content[_loc4_];
            _loc6_ = int(_loc7_.quantity);
            if (param2 == _loc6_) {
                _loc7_.setText(_loc10_);
                _loc7_.method_1672 = param3;
                return;
            }
            if (_loc6_ > param2) {
                _loc9_ = new class_1184(_loc10_, param2, param3);
                this._content.splice(_loc4_ > 0 ? _loc4_ - 1 : 0, 0, _loc9_);
                return;
            }
            _loc4_++;
        }
        _loc9_ = new class_1184(_loc10_, param2, param3);
        this._content.push(_loc9_);
    }

    public function method_2320(param1: int = 0): class_1184 {
        var _loc2_: Number = 0;
        var _loc3_: uint = uint(this._content.length);
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        _loc2_ = 0;
        while (_loc2_ < _loc3_) {
            _loc6_ = _loc5_;
            if ((_loc4_ = int((_loc5_ = this._content[_loc2_]).quantity)) == param1) {
                return _loc5_;
            }
            if (_loc4_ > param1) {
                return _loc6_ != null && Boolean(_loc6_.method_1672) ? _loc6_ : null;
            }
            _loc2_++;
        }
        return _loc5_ != null && Boolean(_loc5_.method_1672) ? _loc5_ : null;
    }

    public function getContent(param1: Dictionary = null, param2: int = 0): String {
        var _loc3_: class_1184 = this.method_2320(param2);
        var _loc4_: Dictionary;
        if ((_loc4_ = param1) == null) {
            _loc4_ = new Dictionary();
        }
        _loc4_[class_1183.method_5758] = param2;
        return _loc3_.getText(_loc4_);
    }
}
}
