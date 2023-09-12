package net.bigpoint.darkorbit.fui.builder.repository {

import flash.filters.ColorMatrixFilter;
import flash.text.StyleSheet;
import flash.text.TextField;
import flash.text.TextFormat;

public class TextStyleVO {


    private var _name: String;

    private var _align: String = "left";

    private var _textFormat: TextFormat;

    private var _antiAliasType: String = "advanced";

    private var _autoSize: String;

    private var _background: Boolean = false;

    private var _backgroundColor: uint = 4473924;

    private var _border: Boolean = false;

    private var _borderColor: uint = 4473924;

    private var _embedFonts: Boolean = true;

    private var _fontName: String;

    private var _fontSize: uint;

    private var _marginLeft: int = 2147483647;

    private var _marginRight: int = 2147483647;

    private var _multiline: Boolean = false;

    private var _selectable: Boolean = false;

    private var _textColor: uint = 14606079;

    private var _type: String = "dynamic";

    private var _wordWrap: Boolean = false;

    private var _styleSheet: StyleSheet;

    private var _selectionTextColor: int = -1;

    private var _maxChars: uint = 0;

    public function TextStyleVO(param1: String, param2: TextFormat = null) {
        this._textFormat = new TextFormat("Arial", 12);
        super();
        this._name = param1;
        if (param2) {
            this._textFormat = param2;
        }
    }

    private static function splitRGB(param1: uint): Array {
        return [param1 >> 16 & 255, param1 >> 8 & 255, param1 & 255];
    }

    public function assign(param1: TextField): void {
        param1.antiAliasType = this._antiAliasType;
        param1.autoSize = !!this._autoSize ? this._autoSize : param1.autoSize;
        param1.background = this._background;
        param1.backgroundColor = this._backgroundColor;
        param1.border = this._border;
        param1.borderColor = this._borderColor;
        param1.embedFonts = this._embedFonts;
        param1.multiline = this._multiline;
        param1.selectable = this._selectable;
        param1.textColor = this._textColor;
        param1.type = this._type;
        param1.wordWrap = this._wordWrap;
        if (this._maxChars > 0) {
            param1.maxChars = this._maxChars;
        }
        if (this._fontName) {
            this._textFormat.font = this._fontName;
        }
        if (this._fontSize) {
            this._textFormat.size = this._fontSize;
        }
        if (this._marginLeft != int.MAX_VALUE) {
            this._textFormat.leftMargin = this._marginLeft;
        }
        if (this._marginRight != int.MAX_VALUE) {
            this._textFormat.rightMargin = this._marginRight;
        }
        param1.defaultTextFormat = this._textFormat;
        if (this._styleSheet) {
            param1.styleSheet = this._styleSheet;
        }
        if (this._selectionTextColor >= 0) {
            this._setSelectionTextColor(param1);
        }
    }

    private function _setSelectionTextColor(param1: TextField): void {
        var _loc2_: * = this._selectionTextColor;
        var _loc3_: * = param1.textColor;
        var _loc4_: * = _loc3_ & 255;
        var _loc5_: * = _loc2_ & 255;
        var _loc6_: int = int((_loc5_ - _loc4_) * 100 / 255);
        _loc2_ >>= 8;
        _loc3_ >>= 8;
        var _loc7_: * = _loc3_ & 255;
        var _loc8_: * = _loc2_ & 255;
        var _loc9_: int = int((_loc8_ - _loc7_) * 100 / 255);
        _loc2_ >>= 8;
        _loc3_ >>= 8;
        var _loc10_: * = _loc3_ & 255;
        var _loc11_: * = _loc2_ & 255;
        var _loc12_: int = int((_loc11_ - _loc10_) * 100 / 255);
        var _loc13_: ColorMatrixFilter;
        (_loc13_ = new ColorMatrixFilter()).matrix = [_loc12_ * 0.01, 0, 0, 0, _loc10_, 0, _loc9_ * 0.01, 0, 0, _loc7_, 0, 0, _loc6_ * 0.01, 0, _loc4_, 0, 0, 0, 1, 0];
        param1.filters = [_loc13_];
        param1.textColor = 0;
        if (param1.background) {
            param1.backgroundColor = 16777215;
        }
    }

    public function get name(): String {
        return this._name;
    }

    public function set name(param1: String): void {
        this._name = param1;
    }

    public function set textFormat(param1: TextFormat): void {
        this._textFormat = param1;
    }

    public function set fontSize(param1: uint): void {
        this._fontSize = param1;
    }

    public function set antiAliasType(param1: String): void {
        this._antiAliasType = param1;
    }

    public function set autoSize(param1: String): void {
        this._autoSize = param1;
    }

    public function get autoSize(): String {
        return this._autoSize;
    }

    public function set background(param1: Boolean): void {
        this._background = param1;
    }

    public function set backgroundColor(param1: uint): void {
        this._backgroundColor = param1;
    }

    public function set border(param1: Boolean): void {
        this._border = param1;
    }

    public function set borderColor(param1: uint): void {
        this._borderColor = param1;
    }

    public function set embedFonts(param1: Boolean): void {
        this._embedFonts = param1;
    }

    public function set fontName(param1: String): void {
        this._fontName = param1;
    }

    public function set marginLeft(param1: int): void {
        this._marginLeft = param1;
    }

    public function set marginRight(param1: int): void {
        this._marginRight = param1;
    }

    public function set multiline(param1: Boolean): void {
        this._multiline = param1;
    }

    public function set selectable(param1: Boolean): void {
        this._selectable = param1;
    }

    public function set textColor(param1: uint): void {
        this._textColor = param1;
    }

    public function set type(param1: String): void {
        this._type = param1;
    }

    public function set wordWrap(param1: Boolean): void {
        this._wordWrap = param1;
    }

    public function set styleSheet(param1: StyleSheet): void {
        this._styleSheet = param1;
    }

    public function set align(param1: String): void {
        this._textFormat.align = param1;
    }

    public function set maxChars(param1: uint): void {
        this._maxChars = param1;
    }

    public function set selectionTextColor(param1: uint): void {
        this._selectionTextColor = param1;
    }
}
}
