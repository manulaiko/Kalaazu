package package_117 {

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_322 implements class_320 {

    private static const const_564: String = "key";

    private static const const_782: String = "decimalMark";

    private static const const_1941: String = "thousandsSeparator";

    private static const const_2588: String = "separatorPattern";

    private static const const_2131: String = "currencyRatio";

    private static const const_544: String = "category";

    private static const const_2501: String = "name";

    private static const const_456: String = "item";

    private static const const_28: String = "name";

    private static const const_246: String = "content";

    private static const const_2823: String = "case";

    private static const const_428: String = "quantity";

    private static const const_525: String = "+";

    private static const const_651: RegExp = /,\s*/g;


    public function class_322() {
        super();
    }

    public function method_2367(param1: XML): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = 0;
        var _loc14_: Number = 0;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: int = 0;
        var _loc18_: Boolean = false;
        var _loc19_: * = null;
        var _loc2_: XMLList = param1.elements(const_544);
        if ((_loc9_ = param1.attribute(const_782)).length() > 0) {
            class_88.var_4795 = _loc9_[0];
        }
        if ((_loc9_ = param1.attribute(const_1941)).length() > 0) {
            class_88.var_3200 = _loc9_[0];
        }
        if ((_loc9_ = param1.attribute(const_2131)).length() > 0) {
            class_88.var_4049 = Number(_loc9_[0]);
        }
        if ((_loc9_ = param1.attribute(const_2588)).length() > 0) {
            _loc13_ = (_loc12_ = (_loc11_ = _loc9_[0]).split(const_651)).length;
            class_88.var_2537 = new Vector.<int>(_loc13_, true);
            _loc14_ = 0;
            while (_loc14_ < _loc13_) {
                class_88.var_2537[_loc14_] = int(_loc12_[_loc14_]);
                _loc14_++;
            }
        }
        if ((_loc9_ = param1.attribute(const_564)).length() > 0) {
            class_88.method_6168 = String(_loc9_[0]);
        }
        for each(_loc10_ in _loc2_) {
            _loc3_ = _loc10_.attribute(const_2501);
            _loc4_ = _loc10_.elements(const_456);
            for each(_loc15_ in _loc4_) {
                _loc7_ = "";
                if ((_loc5_ = _loc15_.attribute(const_28)).length <= 0) {
                    throw new Error("An item in the category " + _loc3_ + " has no name. " + "Check if the name attributes for all items in this category are set.");
                }
                if (_loc15_.hasSimpleContent()) {
                    _loc7_ = _loc15_.text();
                    class_88.method_1639(_loc3_, _loc5_, _loc7_);
                } else {
                    if ((_loc6_ = _loc15_.child(const_246)).length() <= 0) {
                        throw new Error("The item " + _loc3_ + "." + _loc5_ + " has no content. " + "There is neither a <content> tag nor any text inside the <item> tag directly.");
                    }
                    if (_loc6_.hasSimpleContent()) {
                        _loc7_ = (_loc6_[0] as XML).text();
                        class_88.method_1639(_loc3_, _loc5_, _loc7_);
                    } else {
                        _loc8_ = _loc6_.elements(const_2823);
                        for each(_loc19_ in _loc8_) {
                            _loc7_ = _loc19_.text();
                            _loc16_ = _loc19_.attribute(const_428);
                            _loc18_ = false;
                            if (_loc16_.charAt(_loc16_.length - 1) == const_525) {
                                _loc16_ = _loc16_.substr(0, _loc16_.length - 1);
                                _loc18_ = true;
                            }
                            _loc17_ = int(_loc16_);
                            class_88.method_1639(_loc3_, _loc5_, _loc7_, _loc17_, _loc18_);
                        }
                    }
                }
            }
        }
    }
}
}
