package package_76 {

public class XMLUtils {


    public function XMLUtils() {
        super();
    }

    public static function method_388(param1: XMLList, param2: String, param3: String): XMLList {
        var _loc6_: * = null;
        var _loc8_: int = 0;
        var _loc4_: XMLList;
        var _loc5_: int = (_loc4_ = param1).length();
        var _loc7_: XMLList = new XMLList();
        var _loc9_: int = 0;
        while (_loc9_ < _loc5_) {
            if ((_loc6_ = _loc4_[_loc9_]).attribute(param2) == param3) {
                _loc7_[_loc8_] = _loc6_;
                _loc8_++;
            }
            _loc9_++;
        }
        return _loc7_;
    }

    public static function method_6292(param1: XMLList, param2: String, param3: String): XML {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc4_: XMLList;
        var _loc5_: int = (_loc4_ = param1.children()).length();
        var _loc8_: int = 0;
        while (_loc8_ < _loc5_) {
            if ((_loc6_ = _loc4_[_loc8_]).children().length() > 0) {
                if (_loc7_ = method_6292(_loc6_.children(), param2, param3)) {
                    return _loc7_;
                }
            }
            if (_loc6_.attribute(param2) == param3) {
                return _loc6_;
            }
            _loc8_++;
        }
        return null;
    }

    public static function method_925(param1: XML, param2: String): XMLList {
        var _loc3_: Array = param2.split(".");
        var _loc4_: int = _loc3_.length;
        var _loc5_: XMLList = XMLList(param1);
        var _loc6_: int = 0;
        while (_loc6_ < _loc4_) {
            _loc5_ = _loc5_.child(_loc3_[_loc6_]);
            _loc6_++;
        }
        return _loc5_;
    }

    public static function method_5922(param1: XML): XML {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        param1 = param1.copy();
        var _loc2_: XMLList = param1.descendants("reference");
        for each(_loc3_ in _loc2_) {
            _loc4_ = method_2418(param1, _loc3_.attribute("selector"), false);
            for each(_loc5_ in _loc4_) {
                _loc6_ = method_4406(_loc5_, _loc3_);
                for each(_loc7_ in _loc6_.children()) {
                    _loc3_.parent().appendChild(_loc7_);
                }
            }
            delete _loc3_.parent().children()[_loc3_.childIndex()];
        }
        return param1;
    }

    private static function method_4406(param1: XML, param2: XML): XML {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        var _loc3_: XML = param1.copy();
        var _loc6_: XMLList = param2.child("replace");
        for each(_loc7_ in _loc6_) {
            _loc4_ = method_2418(_loc3_, _loc7_.attribute("selector"), false);
            for each(_loc5_ in _loc4_) {
                _loc10_ = _loc7_.attribute("attributes").toString().split(",");
                _loc11_ = _loc7_.attribute("values").toString().split(",");
                if (_loc10_.length == _loc11_.length) {
                    _loc12_ = _loc11_.length;
                    _loc13_ = 0;
                    while (_loc13_ < _loc12_) {
                        _loc5_[_loc10_[_loc13_]] = _loc11_[_loc13_];
                        _loc13_++;
                    }
                }
            }
        }
        _loc8_ = param2.child("append");
        for each(_loc9_ in _loc8_) {
            _loc4_ = method_2418(_loc3_, _loc9_.attribute("selector"), false);
            for each(_loc5_ in _loc4_) {
                for each(_loc14_ in _loc9_.children()) {
                    _loc5_.appendChild(_loc14_.copy());
                }
            }
        }
        return _loc3_;
    }

    private static function method_2418(param1: XML, param2: String, param3: Boolean): XMLList {
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc4_: Array = param2.split("WHERE");
        var _loc5_: Array = String(_loc4_[0]).split(">");
        var _loc6_: Condition = new Condition(_loc4_[1]);
        var _loc7_: int = _loc5_.length;
        var _loc8_: XMLList = XMLList(param1);
        var _loc9_: int = 0;
        while (_loc9_ < _loc7_) {
            _loc13_ = String(_loc5_[_loc9_]).replace(" ", "");
            _loc8_ = _loc8_.child(_loc13_);
            _loc9_++;
        }
        var _loc10_: XMLList = new XMLList();
        var _loc11_: int = 0;
        for each(_loc12_ in _loc8_) {
            if (_loc6_.check(_loc12_)) {
                var _loc16_: *;
                _loc10_[_loc16_ = _loc11_++] = param3 ? _loc12_.children() : _loc12_;
            }
        }
        return _loc10_;
    }
}
}

class Condition {


    private var _condition: String;

    function Condition(param1: String) {
        super();
        this._condition = !!param1 ? param1.replace(" ", "") : "package_1";
    }

    public function check(param1: XML): Boolean {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this._condition == "package_1") {
            return true;
        }
        _loc2_ = String(this._condition).split("==");
        _loc3_ = String(_loc2_[0]);
        _loc4_ = String(_loc2_[1]);
        return String(param1.attribute(_loc3_)) == _loc4_;
    }
}
