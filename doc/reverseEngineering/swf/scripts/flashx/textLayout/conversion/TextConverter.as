package flashx.textLayout.conversion {

import flashx.textLayout.elements.IConfiguration;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

public class TextConverter {

    public static const TEXT_FIELD_HTML_FORMAT: String = "textFieldHTMLFormat";

    public static const PLAIN_TEXT_FORMAT: String = "plainTextFormat";

    public static const TEXT_LAYOUT_FORMAT: String = "textLayoutFormat";

    tlf_internal static var _descriptors: Array = [];

    {
        tlf_internal::setFormatsToDefault();
    }

    public function TextConverter() {
        super();
    }

    tlf_internal static function setFormatsToDefault(): void {
        tlf_internal::_descriptors = [];
        addFormat(TEXT_LAYOUT_FORMAT, TextLayoutImporter, TextLayoutExporter, TEXT_LAYOUT_FORMAT);
        addFormat(TEXT_FIELD_HTML_FORMAT, TextFieldHtmlImporter, TextFieldHtmlExporter, null);
        addFormat(PLAIN_TEXT_FORMAT, PlainTextImporter, PlainTextExporter, "air:text");
    }

    public static function importToFlow(param1: Object, param2: String, param3: IConfiguration = null): TextFlow {
        var _loc4_: ITextImporter;
        if (!(_loc4_ = getImporter(param2, param3))) {
            return null;
        }
        _loc4_.throwOnError = false;
        return _loc4_.importToFlow(param1);
    }

    public static function export(param1: TextFlow, param2: String, param3: String): Object {
        var _loc4_: ITextExporter;
        if (!(_loc4_ = getExporter(param2))) {
            return null;
        }
        _loc4_.throwOnError = false;
        return _loc4_.export(param1, param3);
    }

    public static function getImporter(param1: String, param2: IConfiguration = null): ITextImporter {
        var _loc5_: * = null;
        var _loc3_: * = null;
        var _loc4_: int;
        if ((_loc4_ = findFormatIndex(param1)) >= 0) {
            if ((Boolean(_loc5_ = tlf_internal::_descriptors[_loc4_])) && Boolean(_loc5_.importerClass)) {
                _loc3_ = new _loc5_.importerClass();
                _loc3_.configuration = param2;
            }
        }
        return _loc3_;
    }

    public static function getExporter(param1: String): ITextExporter {
        var _loc4_: * = null;
        var _loc2_: * = null;
        var _loc3_: int = findFormatIndex(param1);
        if (_loc3_ >= 0) {
            if ((Boolean(_loc4_ = tlf_internal::_descriptors[_loc3_])) && Boolean(_loc4_.exporterClass)) {
                _loc2_ = new _loc4_.exporterClass();
            }
        }
        return _loc2_;
    }

    public static function addFormatAt(param1: int, param2: String, param3: Class, param4: Class = null, param5: String = null): void {
        var _loc6_: FormatDescriptor = new FormatDescriptor(param2, param3, param4, param5);
        tlf_internal::_descriptors.splice(param1, 0, _loc6_);
    }

    public static function addFormat(param1: String, param2: Class, param3: Class, param4: String): void {
        addFormatAt(tlf_internal::_descriptors.length, param1, param2, param3, param4);
    }

    public static function removeFormatAt(param1: int): void {
        if (param1 >= 0 && param1 < tlf_internal::_descriptors.length) {
            tlf_internal::_descriptors.splice(param1, 1);
        }
    }

    private static function findFormatIndex(param1: String): int {
        var _loc2_: int = 0;
        while (_loc2_ < numFormats) {
            if (tlf_internal::_descriptors[_loc2_].format == param1) {
                return _loc2_;
            }
            _loc2_++;
        }
        return -1;
    }

    public static function removeFormat(param1: String): void {
        removeFormatAt(findFormatIndex(param1));
    }

    public static function getFormatAt(param1: int): String {
        return tlf_internal::_descriptors[param1].format;
    }

    public static function getFormatDescriptorAt(param1: int): FormatDescriptor {
        return tlf_internal::_descriptors[param1];
    }

    public static function get numFormats(): int {
        return tlf_internal::_descriptors.length;
    }
}
}
