package flashx.textLayout.edit {

import flash.desktop.Clipboard;
import flash.system.System;

import flashx.textLayout.conversion.ConversionType;
import flashx.textLayout.conversion.ConverterBase;
import flashx.textLayout.conversion.FormatDescriptor;
import flashx.textLayout.conversion.ITextExporter;
import flashx.textLayout.conversion.ITextImporter;
import flashx.textLayout.conversion.TextConverter;
import flashx.textLayout.elements.Configuration;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

public class TextClipboard {

    tlf_internal static const TEXT_LAYOUT_MARKUP: String = "TEXT_LAYOUT_MARKUP";


    public function TextClipboard() {
        super();
    }

    public static function getContents(): TextScrap {
        var systemClipboard: Clipboard = null;
        var getFromClipboard: Function = null;
        getFromClipboard = function (param1: String): String {
            return systemClipboard.hasFormat(param1) ? String(systemClipboard.getData(param1)) : null;
        };
        systemClipboard = Clipboard.generalClipboard;
        return tlf_internal::importScrap(getFromClipboard);
    }

    tlf_internal static function importScrap(param1: Function): TextScrap {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc6_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_ && !_loc2_) {
            _loc6_ = TextConverter.getFormatDescriptorAt(_loc5_);
            _loc3_ = param1(_loc6_.clipboardFormat);
            if (Boolean(_loc3_) && _loc3_ != "") {
                _loc2_ = tlf_internal::importToScrap(_loc3_, _loc6_.format);
            }
            _loc5_++;
        }
        return _loc2_;
    }

    public static function setContents(param1: TextScrap): void {
        var systemClipboard: Clipboard = null;
        var addToClipboard: Function = null;
        var textScrap: TextScrap = param1;
        addToClipboard = function (param1: String, param2: String): void {
            systemClipboard.setData(param1, param2);
        };
        if (!textScrap) {
            return;
        }
        systemClipboard = Clipboard.generalClipboard;
        systemClipboard.clear();
        tlf_internal::exportScrap(textScrap, addToClipboard);
    }

    tlf_internal static function exportScrap(param1: TextScrap, param2: Function): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc3_: * = [];
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (Boolean((_loc6_ = TextConverter.getFormatDescriptorAt(_loc5_)).clipboardFormat) && _loc3_.indexOf(_loc6_.clipboardFormat) < 0) {
                if (_loc7_ = tlf_internal::exportForClipboard(param1, _loc6_.format)) {
                    param2(_loc6_.clipboardFormat, _loc7_);
                    _loc3_.push(_loc6_.clipboardFormat);
                }
            }
            _loc5_++;
        }
    }

    tlf_internal static function importToScrap(param1: String, param2: String): TextScrap {
        var _loc3_: * = null;
        var _loc5_: * = null;
        var _loc4_: ITextImporter;
        if (_loc4_ = TextConverter.getImporter(param2)) {
            _loc4_.useClipboardAnnotations = true;
            if (_loc5_ = _loc4_.importToFlow(param1)) {
                _loc3_ = new TextScrap(_loc5_);
            }
            if (param2 == TextConverter.PLAIN_TEXT_FORMAT) {
                _loc3_.tlf_internal::setPlainText(true);
            } else if (param2 == TextConverter.TEXT_LAYOUT_FORMAT) {
                _loc3_.tlf_internal::setPlainText(false);
            }
            if (!_loc3_ && param2 == TextConverter.TEXT_LAYOUT_FORMAT) {
                _loc3_ = tlf_internal::importOldTextLayoutFormatToScrap(param1);
            }
        }
        return _loc3_;
    }

    tlf_internal static function importOldTextLayoutFormatToScrap(param1: String): TextScrap {
        var textScrap: TextScrap = null;
        var xmlTree: XML = null;
        var beginArrayChild: XML = null;
        var endArrayChild: XML = null;
        var textLayoutMarkup: XML = null;
        var textFlow: TextFlow = null;
        var element: FlowElement = null;
        var endMissingArray: Array = null;
        var textOnClipboard: String = param1;
        var originalSettings: Object = XML.settings();
        try {
            XML.ignoreProcessingInstructions = false;
            XML.ignoreWhitespace = false;
            xmlTree = new XML(textOnClipboard);
            if (xmlTree.localName() == "TextScrap") {
                beginArrayChild = xmlTree..BeginMissingElements[0];
                endArrayChild = xmlTree..EndMissingElements[0];
                textLayoutMarkup = xmlTree..TextFlow[0];
                textFlow = TextConverter.importToFlow(textLayoutMarkup, TextConverter.TEXT_LAYOUT_FORMAT);
                if (textFlow) {
                    textScrap = new TextScrap(textFlow);
                    endMissingArray = getEndArray(endArrayChild, textFlow);
                    for each(element in endMissingArray) {
                        element.setStyle(ConverterBase.MERGE_TO_NEXT_ON_PASTE, "true");
                    }
                }
            }
            if (false) {
                System["disposeXML"](xmlTree);
            }
        } finally {
            XML.setSettings(originalSettings);
        }
        return textScrap;
    }

    tlf_internal static function exportForClipboard(param1: TextScrap, param2: String): String {
        var _loc3_: ITextExporter = TextConverter.getExporter(param2);
        if (_loc3_) {
            _loc3_.useClipboardAnnotations = true;
            return _loc3_.export(param1.textFlow, ConversionType.STRING_TYPE) as String;
        }
        return null;
    }

    private static function getBeginArray(param1: XML, param2: TextFlow): Array {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc3_: Array = new Array();
        var _loc4_: FlowElement = param2;
        if (param1 != null) {
            _loc5_ = param1.@value != undefined ? String(param1.@value) : "";
            _loc3_.push(param2);
            _loc6_ = _loc5_.indexOf(",");
            while (_loc6_ >= 0) {
                _loc7_ = _loc6_ + 1;
                if ((_loc6_ = _loc5_.indexOf(",", _loc7_)) >= 0) {
                    _loc8_ = _loc6_;
                } else {
                    _loc8_ = _loc5_.length;
                }
                if ((_loc9_ = _loc5_.substring(_loc7_, _loc8_)).length > 0) {
                    _loc10_ = parseInt(_loc9_);
                    if (_loc4_ is FlowGroupElement) {
                        _loc4_ = (_loc4_ as FlowGroupElement).getChildAt(_loc10_);
                        _loc3_.push(_loc4_);
                    }
                }
            }
        }
        return _loc3_.reverse();
    }

    private static function getEndArray(param1: XML, param2: TextFlow): Array {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc3_: Array = new Array();
        var _loc4_: FlowElement = param2;
        if (param1 != null) {
            _loc5_ = param1.@value != undefined ? String(param1.@value) : "";
            _loc3_.push(param2);
            _loc6_ = _loc5_.indexOf(",");
            while (_loc6_ >= 0) {
                _loc7_ = _loc6_ + 1;
                if ((_loc6_ = _loc5_.indexOf(",", _loc7_)) >= 0) {
                    _loc8_ = _loc6_;
                } else {
                    _loc8_ = _loc5_.length;
                }
                if ((_loc9_ = _loc5_.substring(_loc7_, _loc8_)).length > 0) {
                    _loc10_ = parseInt(_loc9_);
                    if (_loc4_ is FlowGroupElement) {
                        _loc4_ = (_loc4_ as FlowGroupElement).getChildAt(_loc10_);
                        _loc3_.push(_loc4_);
                    }
                }
            }
        }
        return _loc3_.reverse();
    }
}
}

class TextClipboardSingletonEnforcer {


    function TextClipboardSingletonEnforcer() {
        super();
    }
}
