package net.bigpoint.darkorbit {

import flash.text.Font;

public class class_60 {

    private static var var_170: Class = class_229;

    private static var var_4012: Class = class_228;

    private static var var_4909: Class = class_230;

    private static var var_2010: Class = class_231;


    public function class_60() {
        super();
    }

    public static function initialize(): Boolean {
        Font.registerFont(var_170);
        Font.registerFont(var_4012);
        Font.registerFont(var_4909);
        Font.registerFont(var_2010);
        return true;
    }

    public static function method_5276(): String {
        var _loc4_: * = null;
        var _loc1_: * = "";
        var _loc2_: Array = Font.enumerateFonts(true);
        _loc1_ += "Fonts: \n";
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            if ((_loc4_ = _loc2_[_loc3_]).fontType == "embeddedCFF" || _loc4_.fontType == "embedded") {
                _loc1_ += "FONT " + _loc3_ + ":: name: " + _loc4_.fontName + "; typeface: " + _loc4_.fontStyle + "; type: " + _loc4_.fontType;
                _loc1_ += "package_1";
            }
            _loc1_ += "\n";
            _loc3_++;
        }
        return _loc1_;
    }
}
}
