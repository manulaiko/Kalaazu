package spark.core {

import flash.text.engine.FontLookup;
import flash.text.engine.Kerning;

import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.property.Property;
import flashx.textLayout.tlf_internal;

import mx.core.mx_internal;
import mx.styles.IStyleClient;

public class CSSTextLayoutFormat extends TextLayoutFormat {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function CSSTextLayoutFormat(param1: IStyleClient) {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = undefined;
        super();
        for each(_loc2_ in TextLayoutFormat.tlf_internal::description) {
            _loc3_ = _loc2_.name;
            if (_loc3_ == "fontLookup") {
                this[_loc3_] = convertedFontLookup(param1);
            } else if (_loc3_ == "kerning") {
                this[_loc3_] = convertedKerning(param1);
            } else if ((_loc4_ = param1.getStyle(_loc3_)) !== undefined) {
                this[_loc3_] = _loc4_;
            }
        }
    }

    private static function convertedFontLookup(param1: IStyleClient): * {
        var _loc2_: String = param1.getStyle("fontLookup");
        if (_loc2_ == "auto") {
            if (param1.mx_internal::embeddedFontContext) {
                _loc2_ = "null";
            } else {
                _loc2_ = "null";
            }
        }
        return _loc2_;
    }

    private static function convertedKerning(param1: IStyleClient): * {
        var _loc2_: Object = param1.getStyle("kerning");
        if (_loc2_ === "default") {
            _loc2_ = Kerning.AUTO;
        } else if (_loc2_ === true) {
            _loc2_ = Kerning.ON;
        } else if (_loc2_ === false) {
            _loc2_ = Kerning.OFF;
        }
        return _loc2_;
    }
}
}
