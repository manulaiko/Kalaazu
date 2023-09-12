package mx.core {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.StyleSheet;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextLineMetrics;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;
import flash.text.engine.FontLookup;
import flash.text.engine.FontMetrics;
import flash.text.engine.FontPosture;
import flash.text.engine.FontWeight;
import flash.text.engine.Kerning;
import flash.text.engine.LineJustification;
import flash.text.engine.SpaceJustifier;
import flash.text.engine.TextBlock;
import flash.text.engine.TextElement;
import flash.text.engine.TextLine;
import flash.utils.Dictionary;

import flashx.textLayout.compose.ISWFContext;
import flashx.textLayout.compose.TextLineRecycler;
import flashx.textLayout.formats.LeadingModel;
import flashx.textLayout.formats.LineBreak;
import flashx.textLayout.formats.TextDecoration;
import flashx.textLayout.formats.TextLayoutFormat;

import mx.managers.SystemManager;
import mx.managers.SystemManagerGlobals;

import spark.utils.TextUtil;

public class FTETextField extends Sprite implements IFontContextComponent {

    private static var invalidFields: Dictionary = new Dictionary();

    private static var initialized: Boolean = false;

    private static var staticHandlersAdded: Boolean = false;

    mx_internal static const PADDING_LEFT: Number = 2;

    mx_internal static const PADDING_TOP: Number = 2;

    mx_internal static const PADDING_RIGHT: Number = 2;

    mx_internal static const PADDING_BOTTOM: Number = 2;

    private static const ALL_LINEFEEDS: RegExp = /\n/g;

    private static const FLAG_BACKGROUND: uint = 1;

    private static const FLAG_BORDER: uint = 2;

    private static const FLAG_CONDENSE_WHITE: uint = 4;

    private static const FLAG_EMBED_FONTS: uint = 8;

    private static const FLAG_MULTILINE: uint = 16;

    private static const FLAG_WORD_WRAP: uint = 32;

    private static const FLAG_TEXT_SET: uint = 64;

    private static const FLAG_HTML_TEXT_SET: uint = 128;

    private static const FLAG_TEXT_LINES_INVALID: uint = 256;

    private static const FLAG_GRAPHICS_INVALID: uint = 512;

    mx_internal static const FLAG_EFFECTIVE_CONDENSE_WHITE: uint = 1024;

    private static const FLAG_VALIDATE_IN_PROGRESS: uint = 2048;

    private static const FLAG_HAS_SCROLL_RECT: uint = 4096;

    private static const ALL_INVALIDATION_FLAGS: uint = FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID;

    private static var textField: TextField = new TextField();

    private static var staticTextBlockAllButLast: TextBlock;

    private static var staticTextBlockUnjustified: TextBlock;

    private static var staticTextElement: TextElement = new TextElement();

    private static var nextLineIndex: int;


    mx_internal var clipWidth: Number;

    private var _htmlHelper: HTMLHelper;

    private var flags: uint = 0;

    private var elementFormat: ElementFormat;

    private var _height: Number = 100;

    private var _width: Number = 100;

    private var _autoSize: String = "none";

    private var _backgroundColor: uint = 16777215;

    private var _borderColor: uint = 0;

    mx_internal var _defaultTextFormat: TextFormat;

    private var _text: String = "";

    mx_internal var _textHeight: Number = 0;

    mx_internal var _textWidth: Number = 0;

    private var _direction: String = "ltr";

    private var _fontContext: IFlexModuleFactory;

    private var _locale: String = "en";

    public function FTETextField() {
        super();
        initClass();
        mouseChildren = false;
        doubleClickEnabled = false;
        tabChildren = false;
        this.mx_internal::_defaultTextFormat = textField.defaultTextFormat;
        addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
    }

    private static function initClass(): void {
        if (initialized) {
            return;
        }
        staticTextBlockAllButLast = new TextBlock();
        staticTextBlockAllButLast.textJustifier = new SpaceJustifier("en", LineJustification.ALL_BUT_LAST);
        staticTextBlockUnjustified = new TextBlock();
        staticTextBlockUnjustified.textJustifier = new SpaceJustifier("en", LineJustification.UNJUSTIFIED);
        initialized = true;
    }

    private static function addStaticHandlers(): void {
        if (staticHandlersAdded) {
            return;
        }
        var _loc1_: SystemManager = SystemManagerGlobals.topLevelSystemManagers[0];
        if (_loc1_) {
            _loc1_.addEventListener(Event.RENDER, mx_internal::staticRenderHandler);
            _loc1_.addEventListener(Event.ENTER_FRAME, mx_internal::staticRenderHandler);
            staticHandlersAdded = true;
        }
    }

    mx_internal static function staticRenderHandler(param1: Event): void {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        for (_loc3_ in invalidFields) {
            (_loc3_ as FTETextField).validateNow();
            _loc2_++;
        }
        if (_loc2_) {
            invalidFields = new Dictionary();
        }
    }

    private static function rint(param1: Number): Number {
        var _loc2_: Number = Math.round(param1);
        if (_loc2_ - 0.5 == param1 && Boolean(_loc2_ & 1)) {
            _loc2_--;
        }
        return _loc2_;
    }

    private static function cloneTextFormat(param1: TextFormat): TextFormat {
        var _loc2_: TextFormat = new TextFormat(param1.font, param1.size, param1.color, param1.bold, param1.italic, param1.underline, param1.url, param1.target, param1.align, param1.leftMargin, param1.rightMargin, param1.indent, param1.leading);
        _loc2_.blockIndent = param1.blockIndent;
        _loc2_.bullet = param1.bullet;
        _loc2_.kerning = param1.kerning;
        _loc2_.letterSpacing = param1.letterSpacing;
        _loc2_.tabStops = param1.tabStops;
        return _loc2_;
    }

    private static function applyTextFormat(param1: TextFormat, param2: TextFormat): void {
        if (param1.align != null) {
            param2.align = param1.align;
        }
        if (param1.blockIndent != null) {
            param2.blockIndent = param1.blockIndent;
        }
        if (param1.bold != null) {
            param2.bold = param1.bold;
        }
        if (param1.bullet != null) {
            param2.bullet = param1.bullet;
        }
        if (param1.color != null) {
            param2.color = param1.color;
        }
        if (param1.font != null) {
            param2.font = param1.font;
        }
        if (param1.indent != null) {
            param2.indent = param1.indent;
        }
        if (param1.italic != null) {
            param2.italic = param1.italic;
        }
        if (param1.kerning != null) {
            param2.kerning != param1.kerning;
        }
        if (param1.leading != null) {
            param2.leading = param1.leading;
        }
        if (param1.leftMargin != null) {
            param2.leftMargin = param1.leftMargin;
        }
        if (param1.letterSpacing != null) {
            param2.letterSpacing = param1.letterSpacing;
        }
        if (param1.rightMargin != null) {
            param2.rightMargin = param1.rightMargin;
        }
        if (param1.size != null) {
            param2.size = param1.size;
        }
        if (param1.tabStops != null) {
            param2.tabStops = param1.tabStops;
        }
        if (param1.target != null) {
            param2.target = param1.target;
        }
        if (param1.underline != null) {
            param2.underline = param1.underline;
        }
        if (param1.url != null) {
            param2.url = param1.url;
        }
    }

    override public function get height(): Number {
        if (this.autoSize != TextFieldAutoSize.NONE) {
            this.validateNow();
        }
        return this._height;
    }

    override public function set height(param1: Number): void {
        if (isNaN(param1) || param1 < 0) {
            return;
        }
        if (param1 == this._height) {
            return;
        }
        this._height = param1;
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    override public function get scrollRect(): Rectangle {
        return this.mx_internal::testFlag(FLAG_HAS_SCROLL_RECT) ? super.scrollRect : null;
    }

    override public function set scrollRect(param1: Rectangle): void {
        if (!this.mx_internal::testFlag(FLAG_HAS_SCROLL_RECT) && !param1) {
            return;
        }
        this.mx_internal::setFlag(FLAG_HAS_SCROLL_RECT);
        super.scrollRect = param1;
    }

    override public function get width(): Number {
        if (this.autoSize != TextFieldAutoSize.NONE) {
            this.validateNow();
        }
        return this._width;
    }

    override public function set width(param1: Number): void {
        if (isNaN(param1) || param1 < 0) {
            return;
        }
        if (param1 == this._width) {
            return;
        }
        this._width = param1;
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get alwaysShowSelection(): Boolean {
        throw new Error(this.notImplemented("alwaysShowSelection"));
    }

    public function set alwaysShowSelection(param1: Boolean): void {
        throw new Error(this.notImplemented("alwaysShowSelection"));
    }

    public function get antiAliasType(): String {
        return null;
    }

    public function set antiAliasType(param1: String): void {
    }

    public function get autoSize(): String {
        return this._autoSize;
    }

    public function set autoSize(param1: String): void {
        var _loc2_: * = null;
        if (param1 != TextFieldAutoSize.NONE && param1 != TextFieldAutoSize.LEFT && param1 != TextFieldAutoSize.CENTER && param1 != TextFieldAutoSize.RIGHT) {
            _loc2_ = this.mx_internal::getErrorMessage("badParameter", "autoSize");
            throw new ArgumentError(_loc2_);
        }
        if (param1 == this.autoSize) {
            return;
        }
        this._autoSize = param1;
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get background(): Boolean {
        return this.mx_internal::testFlag(FLAG_BACKGROUND);
    }

    public function set background(param1: Boolean): void {
        if (param1 == this.background) {
            return;
        }
        this.setFlagToValue(FLAG_BACKGROUND, param1);
        this.mx_internal::setFlag(FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get backgroundColor(): uint {
        return this._backgroundColor;
    }

    public function set backgroundColor(param1: uint): void {
        if (param1 == this._backgroundColor) {
            return;
        }
        this._backgroundColor = param1;
        this.mx_internal::setFlag(FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get border(): Boolean {
        return this.mx_internal::testFlag(FLAG_BORDER);
    }

    public function set border(param1: Boolean): void {
        if (param1 == this.border) {
            return;
        }
        this.setFlagToValue(FLAG_BORDER, param1);
        this.mx_internal::setFlag(FLAG_GRAPHICS_INVALID);
        if (this.mx_internal::testFlag(FLAG_TEXT_SET | FLAG_HTML_TEXT_SET)) {
            this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID);
        }
        this.invalidate();
    }

    public function get borderColor(): uint {
        return this._borderColor;
    }

    public function set borderColor(param1: uint): void {
        if (param1 == this._borderColor) {
            return;
        }
        this._borderColor = param1;
        this.mx_internal::setFlag(FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get bottomScrollV(): int {
        throw new Error(this.notImplemented("bottomScrollV"));
    }

    public function get caretIndex(): int {
        throw new Error(this.notImplemented("caretIndex"));
    }

    public function get condenseWhite(): Boolean {
        return this.mx_internal::testFlag(FLAG_CONDENSE_WHITE);
    }

    public function set condenseWhite(param1: Boolean): void {
        this.setFlagToValue(FLAG_CONDENSE_WHITE, param1);
    }

    public function get defaultTextFormat(): TextFormat {
        return cloneTextFormat(this.mx_internal::_defaultTextFormat);
    }

    public function set defaultTextFormat(param1: TextFormat): void {
        var _loc2_: * = null;
        if (!param1) {
            _loc2_ = this.mx_internal::getErrorMessage("nullParameter", "format");
            throw new TypeError(_loc2_);
        }
        applyTextFormat(param1, this.mx_internal::_defaultTextFormat);
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
    }

    public function get displayAsPassword(): Boolean {
        throw new Error(this.notImplemented("displayAsPassword"));
    }

    public function set displayAsPassword(param1: Boolean): void {
        throw new Error(this.notImplemented("displayAsPassword"));
    }

    public function get embedFonts(): Boolean {
        return this.mx_internal::testFlag(FLAG_EMBED_FONTS);
    }

    public function set embedFonts(param1: Boolean): void {
        if (param1 == this.embedFonts) {
            return;
        }
        this.setFlagToValue(FLAG_EMBED_FONTS, param1);
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get gridFitType(): String {
        return null;
    }

    public function set gridFitType(param1: String): void {
    }

    public function get htmlText(): String {
        this.validateNow();
        if (!this._htmlHelper) {
            this._htmlHelper = new HTMLHelper(this);
        }
        return this._htmlHelper.getHtmlText(this._text);
    }

    public function set htmlText(param1: String): void {
        var _loc2_: * = null;
        if (param1 == null) {
            _loc2_ = this.mx_internal::getErrorMessage("nullParameter", "text");
            throw new TypeError(_loc2_);
        }
        this.setFlagToValue(mx_internal::FLAG_EFFECTIVE_CONDENSE_WHITE, this.mx_internal::testFlag(FLAG_CONDENSE_WHITE));
        if (!this._htmlHelper) {
            this._htmlHelper = new HTMLHelper(this);
        }
        this._htmlHelper.mx_internal::htmlText = param1;
        this._htmlHelper.mx_internal::explicitHTMLText = param1;
        this._text = null;
        this.clearFlag(FLAG_TEXT_SET);
        this.mx_internal::setFlag(FLAG_HTML_TEXT_SET | FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get length(): int {
        return this.text.length;
    }

    public function get maxChars(): int {
        throw new Error(this.notImplemented("maxChars"));
    }

    public function set maxChars(param1: int): void {
        throw new Error(this.notImplemented("maxChars"));
    }

    public function get maxScrollH(): int {
        throw new Error(this.notImplemented("maxScrollH"));
    }

    public function get maxScrollV(): int {
        throw new Error(this.notImplemented("maxScrollV"));
    }

    public function get mouseWheelEnabled(): Boolean {
        return false;
    }

    public function set mouseWheelEnabled(param1: Boolean): void {
    }

    public function get multiline(): Boolean {
        return this.mx_internal::testFlag(FLAG_MULTILINE);
    }

    public function set multiline(param1: Boolean): void {
        this.setFlagToValue(FLAG_MULTILINE, param1);
    }

    public function get numLines(): int {
        this.validateNow();
        return numChildren;
    }

    public function get restrict(): String {
        throw new Error(this.notImplemented("restrict"));
    }

    public function set restrict(param1: String): void {
        throw new Error(this.notImplemented("restrict"));
    }

    public function get scrollH(): int {
        throw new Error(this.notImplemented("scrollH"));
    }

    public function set scrollH(param1: int): void {
        throw new Error(this.notImplemented("scrollH"));
    }

    public function get scrollV(): int {
        throw new Error(this.notImplemented("scrollV"));
    }

    public function set scrollV(param1: int): void {
        throw new Error(this.notImplemented("scrollV"));
    }

    public function get selectable(): Boolean {
        return false;
    }

    public function set selectable(param1: Boolean): void {
    }

    public function get selectionBeginIndex(): int {
        throw new Error(this.notImplemented("selectionBeginIndex"));
    }

    public function get selectionEndIndex(): int {
        throw new Error(this.notImplemented("selectionEndIndex"));
    }

    public function get sharpness(): Number {
        return NaN;
    }

    public function set sharpness(param1: Number): void {
    }

    public function get styleSheet(): StyleSheet {
        return !!this._htmlHelper ? this._htmlHelper.mx_internal::styleSheet : null;
    }

    public function set styleSheet(param1: StyleSheet): void {
        if (!this._htmlHelper) {
            this._htmlHelper = new HTMLHelper(this);
        }
        this._htmlHelper.setStyleSheet(param1);
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get text(): String {
        if (this._text == null && Boolean(this._htmlHelper)) {
            this._text = this._htmlHelper.getText().replace(ALL_LINEFEEDS, "\r");
        }
        return this._text;
    }

    public function set text(param1: String): void {
        var _loc2_: * = null;
        if (param1 == null) {
            _loc2_ = this.mx_internal::getErrorMessage("nullParameter", "text");
            throw new TypeError(_loc2_);
        }
        this._text = param1.replace(ALL_LINEFEEDS, "\r");
        this.clearFlag(FLAG_HTML_TEXT_SET);
        this.mx_internal::setFlag(FLAG_TEXT_SET | FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get textColor(): uint {
        return uint(this.mx_internal::_defaultTextFormat.color);
    }

    public function set textColor(param1: uint): void {
        if (param1 == this.textColor) {
            return;
        }
        this.mx_internal::_defaultTextFormat.color = param1;
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID);
        this.invalidate();
    }

    public function get textHeight(): Number {
        this.validateNow();
        return this.mx_internal::_textHeight;
    }

    public function get textWidth(): Number {
        this.validateNow();
        return this.mx_internal::_textWidth;
    }

    public function get thickness(): Number {
        return NaN;
    }

    public function set thickness(param1: Number): void {
    }

    public function get type(): String {
        return TextFieldType.DYNAMIC;
    }

    public function set type(param1: String): void {
        var _loc2_: * = null;
        if (param1 != TextFieldType.DYNAMIC && param1 != TextFieldType.INPUT) {
            _loc2_ = this.mx_internal::getErrorMessage("badParameter", "type");
            throw new ArgumentError(_loc2_);
        }
        if (param1 == TextFieldType.INPUT) {
            _loc2_ = this.mx_internal::getErrorMessage("unsupportedTypeInFTETextField");
            throw new Error(_loc2_);
        }
    }

    public function get useRichTextClipboard(): Boolean {
        throw new Error(this.notImplemented("useRichTextClipboard"));
    }

    public function set useRichTextClipboard(param1: Boolean): void {
        throw new Error(this.notImplemented("useRichTextClipboard"));
    }

    public function get wordWrap(): Boolean {
        return this.mx_internal::testFlag(FLAG_WORD_WRAP);
    }

    public function set wordWrap(param1: Boolean): void {
        if (param1 == this.wordWrap) {
            return;
        }
        this.setFlagToValue(FLAG_WORD_WRAP, param1);
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get direction(): String {
        return this._direction;
    }

    public function set direction(param1: String): void {
        var _loc2_: * = null;
        if (param1 != "ltr" && param1 != "rtl") {
            _loc2_ = this.mx_internal::getErrorMessage("badParameter", "direction");
            throw new ArgumentError(_loc2_);
        }
        if (param1 == this._direction) {
            return;
        }
        this._direction = param1;
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get fontContext(): IFlexModuleFactory {
        return this._fontContext;
    }

    public function set fontContext(param1: IFlexModuleFactory): void {
        if (param1 == this._fontContext) {
            return;
        }
        this._fontContext = param1;
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    public function get locale(): String {
        return this._locale;
    }

    public function set locale(param1: String): void {
        if (param1 == this._locale) {
            return;
        }
        this._locale = param1;
        this.elementFormat = null;
        if (this._htmlHelper) {
            this._htmlHelper.mx_internal::hostFormat = null;
        }
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }

    private function get leftMargin(): Number {
        return this.direction == "ltr" ? Number(this.mx_internal::_defaultTextFormat.leftMargin) : Number(this.mx_internal::_defaultTextFormat.rightMargin);
    }

    private function get rightMargin(): Number {
        return this.direction == "ltr" ? Number(this.mx_internal::_defaultTextFormat.rightMargin) : Number(this.mx_internal::_defaultTextFormat.leftMargin);
    }

    public function appendText(param1: String): void {
        throw new Error(this.notImplemented("appendText()"));
    }

    public function getCharBoundaries(param1: int): Rectangle {
        throw new Error(this.notImplemented("getCharBoundaries()"));
    }

    public function getCharIndexAtPoint(param1: Number, param2: Number): int {
        throw new Error(this.notImplemented("getCharIndexAtPoint()"));
    }

    public function getFirstCharInParagraph(param1: int): int {
        throw new Error(this.notImplemented("getFirstCharInParagraph()"));
    }

    public function getLineIndexAtPoint(param1: Number, param2: Number): int {
        throw new Error(this.notImplemented("getLineIndexAtPoint()"));
    }

    public function getLineIndexOfChar(param1: int): int {
        throw new Error(this.notImplemented("getLineIndexOfChar()"));
    }

    public function getLineLength(param1: int): int {
        throw new Error(this.notImplemented("getLineLength()"));
    }

    public function getLineMetrics(param1: int): TextLineMetrics {
        var _loc9_: * = null;
        this.validateNow();
        if (param1 < 0 || param1 >= numChildren) {
            _loc9_ = this.mx_internal::getErrorMessage("badIndex");
            throw new RangeError(_loc9_);
        }
        var _loc2_: TextLine = TextLine(getChildAt(param1));
        var _loc3_: Number = Math.round(_loc2_.localToGlobal(new Point(0, 0)).x);
        var _loc4_: Number = Math.round(_loc2_.textWidth);
        var _loc5_: Number = Math.round(_loc2_.ascent) + Math.round(_loc2_.descent);
        var _loc6_: Number = Math.round(_loc2_.descent);
        var _loc7_: Number = Math.round(Number(this.mx_internal::_defaultTextFormat.leading));
        var _loc8_: Number = _loc5_ + _loc6_ + _loc7_;
        return new TextLineMetrics(_loc3_, _loc4_, _loc8_, _loc5_, _loc6_, _loc7_);
    }

    public function getLineOffset(param1: int): int {
        throw new Error(this.notImplemented("getLineOffset()"));
    }

    public function getLineText(param1: int): String {
        throw new Error(this.notImplemented("getLineText()"));
    }

    public function getParagraphLength(param1: int): int {
        throw new Error(this.notImplemented("getParagraphLength()"));
    }

    public function getTextFormat(param1: int = -1, param2: int = -1): TextFormat {
        return cloneTextFormat(this.mx_internal::_defaultTextFormat);
    }

    public function replaceSelectedText(param1: String): void {
        throw new Error(this.notImplemented("replaceSelectedText()"));
    }

    public function replaceText(param1: int, param2: int, param3: String): void {
        throw new Error(this.notImplemented("replaceText()"));
    }

    public function setSelection(param1: int, param2: int): void {
        throw new Error(this.notImplemented("setSelection()"));
    }

    public function setTextFormat(param1: TextFormat, param2: int = -1, param3: int = -1): void {
        if (param2 == -1 && param3 == -1) {
            this.defaultTextFormat = param1;
            this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
            this.validateNow();
        }
    }

    public function getImageReference(param1: String): DisplayObject {
        throw new Error(this.notImplemented("getImageReference()"));
    }

    mx_internal function testFlag(param1: uint): Boolean {
        return (this.flags & param1) != 0;
    }

    mx_internal function setFlag(param1: uint): void {
        this.flags |= param1;
    }

    private function clearFlag(param1: uint): void {
        this.flags &= ~param1;
    }

    private function setFlagToValue(param1: uint, param2: Boolean): void {
        if (param2) {
            this.flags |= param1;
        } else {
            this.flags &= ~param1;
        }
    }

    private function invalidate(): void {
        if (!staticHandlersAdded) {
            addStaticHandlers();
        }
        if (stage) {
            stage.invalidate();
        }
        invalidFields[this] = 0;
    }

    private function validateNow(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        if (!this.mx_internal::testFlag(ALL_INVALIDATION_FLAGS) || this.mx_internal::testFlag(FLAG_VALIDATE_IN_PROGRESS)) {
            return;
        }
        this.mx_internal::setFlag(FLAG_VALIDATE_IN_PROGRESS);
        if (this.mx_internal::testFlag(FLAG_TEXT_LINES_INVALID)) {
            if (this.mx_internal::testFlag(FLAG_HTML_TEXT_SET)) {
                if (nextLineIndex > 0) {
                    nextLineIndex = 0;
                    this.removeExcessTextLines();
                }
            } else if (this.mx_internal::testFlag(FLAG_TEXT_SET)) {
                if (this._htmlHelper) {
                    this._htmlHelper.clearContainerChildren();
                }
                this._htmlHelper = null;
            }
            this.mx_internal::_textWidth = 0;
            this.mx_internal::_textHeight = 0;
            this.mx_internal::clipWidth = 0;
            _loc1_ = NaN;
            _loc2_ = NaN;
            if (this._autoSize == TextFieldAutoSize.NONE) {
                _loc1_ = this._width;
                _loc2_ = this._height;
            } else if (this.wordWrap) {
                _loc1_ = this._width;
            }
            if (this.mx_internal::testFlag(FLAG_HTML_TEXT_SET)) {
                if (!this._htmlHelper.mx_internal::hostFormat) {
                    this.createHostFormat();
                }
                this._htmlHelper.composeHTMLText(_loc1_, _loc2_);
            } else {
                if (!this.elementFormat) {
                    this.createElementFormat();
                }
                this.composeText(_loc1_, _loc2_);
            }
            _loc3_ = x;
            _loc4_ = this._width;
            _loc5_ = this._height;
            if (this._autoSize != TextFieldAutoSize.NONE) {
                this._height = this.mx_internal::_textHeight + mx_internal::PADDING_TOP + mx_internal::PADDING_BOTTOM;
                if (!this.wordWrap) {
                    this._width = this.mx_internal::_textWidth + mx_internal::PADDING_LEFT + mx_internal::PADDING_RIGHT;
                    _loc6_ = Number(this.mx_internal::_defaultTextFormat.blockIndent);
                    _loc7_ = Number(this.mx_internal::_defaultTextFormat.indent);
                    if (_loc6_ + _loc7_ + this.leftMargin > 0) {
                        this._width += _loc6_ + _loc7_ + this.leftMargin;
                    }
                    this._width += this.rightMargin;
                    if (this.rightMargin > 0) {
                        this.mx_internal::clipWidth = this._width;
                    } else {
                        if (this._width - mx_internal::PADDING_LEFT - mx_internal::PADDING_RIGHT < this.mx_internal::_textWidth) {
                            this._width = this.mx_internal::_textWidth + mx_internal::PADDING_LEFT + mx_internal::PADDING_RIGHT;
                        }
                        this.mx_internal::clipWidth = _loc4_ + 1;
                    }
                    if (this._autoSize == TextFieldAutoSize.RIGHT) {
                        x += _loc4_ - this._width;
                    } else if (this._autoSize == TextFieldAutoSize.CENTER) {
                        x += (_loc4_ - this._width) / 2;
                    }
                }
                if (this._height != _loc5_ || this._width != _loc4_ || x != _loc3_) {
                    this.mx_internal::setFlag(FLAG_GRAPHICS_INVALID);
                }
            }
            if (this.mx_internal::clipWidth > _loc4_ || this.mx_internal::_textHeight > _loc5_) {
                if (!(_loc8_ = this.scrollRect)) {
                    _loc8_ = new Rectangle();
                }
                _loc8_.left = 0;
                _loc8_.top = 0;
                _loc8_.right = this._width;
                _loc8_.bottom = this._height;
                if (this.mx_internal::testFlag(FLAG_GRAPHICS_INVALID) && this.border) {
                    ++_loc8_.width;
                    ++_loc8_.height;
                }
                this.scrollRect = _loc8_;
            } else {
                this.scrollRect = null;
            }
        }
        if (this.mx_internal::testFlag(FLAG_GRAPHICS_INVALID)) {
            (_loc9_ = graphics).clear();
            _loc10_ = rint(this._width);
            _loc11_ = rint(this._height);
            _loc9_.beginFill(this.backgroundColor, this.background ? 1 : 0);
            _loc9_.drawRect(0, 0, _loc10_, _loc11_);
            _loc9_.endFill();
            if (this.border) {
                _loc9_.lineStyle(1, this.borderColor);
                _loc9_.drawRect(0.5, 0.5, this._width, this._height);
            }
        }
        this.clearFlag(ALL_INVALIDATION_FLAGS | FLAG_VALIDATE_IN_PROGRESS);
    }

    private function createElementFormat(): void {
        var _loc1_: FontDescription = new FontDescription();
        _loc1_.fontLookup = this.embedFonts ? "null" : FontLookup.DEVICE;
        _loc1_.fontName = this.mx_internal::_defaultTextFormat.font;
        _loc1_.fontPosture = !!this.mx_internal::_defaultTextFormat.italic ? "null" : FontPosture.NORMAL;
        _loc1_.fontWeight = !!this.mx_internal::_defaultTextFormat.bold ? "null" : FontWeight.NORMAL;
        this.elementFormat = new ElementFormat();
        this.elementFormat.color = uint(this.mx_internal::_defaultTextFormat.color);
        this.elementFormat.fontDescription = _loc1_;
        this.elementFormat.fontSize = Number(this.mx_internal::_defaultTextFormat.size);
        this.elementFormat.kerning = !!this.mx_internal::_defaultTextFormat.kerning ? "null" : Kerning.OFF;
        this.elementFormat.locale = this.locale;
        this.elementFormat.trackingRight = Number(this.mx_internal::_defaultTextFormat.letterSpacing);
    }

    private function createHostFormat(): void {
        var _loc1_: TextLayoutFormat = new TextLayoutFormat();
        _loc1_.color = this.mx_internal::_defaultTextFormat.color;
        _loc1_.direction = this.direction;
        _loc1_.fontFamily = this.mx_internal::_defaultTextFormat.font;
        _loc1_.fontLookup = this.embedFonts ? FontLookup.EMBEDDED_CFF : FontLookup.DEVICE;
        _loc1_.fontSize = this.mx_internal::_defaultTextFormat.size;
        _loc1_.fontStyle = !!this.mx_internal::_defaultTextFormat.italic ? FontPosture.ITALIC : FontPosture.NORMAL;
        _loc1_.fontWeight = !!this.mx_internal::_defaultTextFormat.bold ? FontWeight.BOLD : FontWeight.NORMAL;
        _loc1_.kerning = !!this.mx_internal::_defaultTextFormat.kerning ? Kerning.AUTO : Kerning.OFF;
        _loc1_.leadingModel = LeadingModel.APPROXIMATE_TEXT_FIELD;
        _loc1_.lineBreak = this.wordWrap ? LineBreak.TO_FIT : LineBreak.EXPLICIT;
        _loc1_.lineHeight = this.mx_internal::_defaultTextFormat.leading;
        _loc1_.locale = this.locale;
        _loc1_.paddingBottom = FTETextField.mx_internal::PADDING_BOTTOM;
        _loc1_.paddingLeft = FTETextField.mx_internal::PADDING_LEFT;
        _loc1_.paddingRight = FTETextField.mx_internal::PADDING_RIGHT;
        _loc1_.paddingTop = FTETextField.mx_internal::PADDING_TOP;
        _loc1_.paragraphEndIndent = this.mx_internal::_defaultTextFormat.rightMargin;
        _loc1_.paragraphStartIndent = this.mx_internal::_defaultTextFormat.leftMargin;
        _loc1_.textAlign = this.mx_internal::_defaultTextFormat.align;
        _loc1_.textAlignLast = this.mx_internal::_defaultTextFormat.align;
        _loc1_.textDecoration = !!this.mx_internal::_defaultTextFormat.underline ? TextDecoration.UNDERLINE : TextDecoration.NONE;
        _loc1_.textIndent = this.mx_internal::_defaultTextFormat.indent;
        _loc1_.trackingRight = this.mx_internal::_defaultTextFormat.letterSpacing;
        this._htmlHelper.mx_internal::hostFormat = _loc1_;
    }

    private function removeExcessTextLines(): void {
        var _loc3_: * = null;
        var _loc1_: int = numChildren;
        var _loc2_: int = nextLineIndex;
        while (_loc2_ < _loc1_) {
            _loc3_ = TextLine(removeChildAt(nextLineIndex));
            TextUtil.recycleTextLine(_loc3_);
            _loc2_++;
        }
    }

    private function composeText(param1: Number, param2: Number): void {
        var _loc5_: * = null;
        var _loc12_: int = 0;
        var _loc13_: * = null;
        var _loc3_: Number = param1 - mx_internal::PADDING_LEFT - mx_internal::PADDING_RIGHT;
        var _loc4_: Number = param2 - mx_internal::PADDING_TOP - mx_internal::PADDING_BOTTOM;
        if (this.fontContext) {
            _loc5_ = this.fontContext.callInContext(this.elementFormat.getFontMetrics, this.elementFormat, []).emBox;
        } else {
            _loc5_ = this.elementFormat.getFontMetrics().emBox;
        }
        var _loc6_: int = Math.round(-_loc5_.top) + Math.round(_loc5_.bottom);
        var _loc7_: int = Math.round(_loc5_.bottom);
        var _loc8_: Number = Math.round(Number(this.mx_internal::_defaultTextFormat.leading));
        var _loc9_: int = 0;
        var _loc10_: int = this.text.length;
        var _loc11_: int = 0;
        nextLineIndex = 0;
        do {
            if ((_loc12_ = this.text.indexOf("\r", _loc11_)) == -1) {
                _loc12_ = _loc10_;
            }
            _loc13_ = _loc11_ == 0 && _loc12_ == _loc10_ ? this.text : this.text.substring(_loc11_, _loc12_);
            _loc9_ = (_loc9_ = this.createTextLines(_loc3_, _loc4_, _loc13_, _loc9_, _loc6_, _loc7_)) + _loc8_;
            _loc11_ = _loc12_ + 1;
        }
        while (_loc12_ < _loc10_);

        this.removeExcessTextLines();
        this.alignTextLines(_loc3_);
        this.mx_internal::_textWidth = Math.round(this.mx_internal::_textWidth);
        this.mx_internal::_textHeight = Math.round(numChildren * (_loc6_ + _loc7_) + (numChildren - 1) * Number(this.mx_internal::_defaultTextFormat.leading));
        this.mx_internal::clipWidth = Math.round(this.mx_internal::clipWidth);
    }

    private function createTextLines(param1: Number, param2: Number, param3: String, param4: int, param5: int, param6: int): int {
        var _loc7_: TextBlock = this.mx_internal::_defaultTextFormat.align == "justify" ? staticTextBlockAllButLast : staticTextBlockUnjustified;
        staticTextElement.text = param3.length > 0 ? param3 : " ";
        staticTextElement.elementFormat = this.elementFormat;
        _loc7_.content = staticTextElement;
        _loc7_.bidiLevel = this.direction == "ltr" ? 0 : 1;
        param4 = this.createTextLinesFromTextBlock(param1, param2, _loc7_, staticTextElement.text.length, param4, param5, param6);
        var _loc8_: TextLine;
        if (_loc8_ = _loc7_.firstLine) {
            _loc7_.releaseLines(_loc8_, _loc7_.lastLine);
        }
        return param4;
    }

    private function createTextLinesFromTextBlock(param1: Number, param2: Number, param3: TextBlock, param4: int, param5: int, param6: int, param7: int): int {
        var _loc13_: * = null;
        var _loc15_: * = null;
        var _loc20_: * = null;
        var _loc21_: Number = NaN;
        var _loc22_: * = null;
        var _loc23_: * = null;
        var _loc24_: * = null;
        if (param1 < 0 || param2 < 0) {
            return param5;
        }
        var _loc8_: Number = Number(this.mx_internal::_defaultTextFormat.blockIndent);
        var _loc9_: Number = Number(this.mx_internal::_defaultTextFormat.indent);
        var _loc10_: Number;
        var _loc11_: Number = _loc10_ = this.wordWrap ? param1 : TextLine.MAX_LINE_WIDTH;
        var _loc12_: int = 0;
        var _loc14_: int = param5;
        var _loc16_: Number = this.leftMargin;
        var _loc17_: Number = this.rightMargin;
        var _loc19_: int = 0;
        while (_loc19_ < param4) {
            if (_loc12_ <= 1) {
                _loc21_ = _loc8_ + _loc16_;
                if (_loc12_ == 0) {
                    _loc21_ += _loc9_;
                }
                if (_loc21_ < 0) {
                    _loc21_ = 0;
                } else if (_loc21_ > this._width - mx_internal::PADDING_LEFT - mx_internal::PADDING_RIGHT) {
                    _loc21_ = this._width - mx_internal::PADDING_LEFT - mx_internal::PADDING_RIGHT;
                }
                _loc11_ = _loc10_ - _loc21_;
                if (this.wordWrap) {
                    _loc10_ -= _loc17_;
                }
                if (_loc11_ > TextLine.MAX_LINE_WIDTH) {
                    _loc11_ = 0;
                }
            }
            if (_loc20_ = nextLineIndex < numChildren ? getChildAt(nextLineIndex) as TextLine : TextLineRecycler.getLineForReuse()) {
                if (this.fontContext as ISWFContext) {
                    _loc13_ = this.fontContext.callInContext(param3.recreateTextLine, param3, [_loc20_, _loc15_, _loc11_, 0, true]);
                } else {
                    _loc13_ = param3.recreateTextLine(_loc20_, _loc15_, _loc11_, 0, true);
                }
            } else if (this.fontContext as ISWFContext) {
                _loc13_ = this.fontContext.callInContext(param3.createTextLine, param3, [_loc15_, _loc11_, 0, true]);
            } else {
                _loc13_ = param3.createTextLine(_loc15_, _loc11_, 0, true);
            }
            _loc13_.doubleClickEnabled = false;
            _loc19_ += _loc13_.rawTextLength;
            if (_loc12_ == 0) {
                _loc14_ += param6;
            } else {
                _loc14_ += param7 + this.mx_internal::_defaultTextFormat.leading + param6;
            }
            _loc15_ = _loc13_;
            _loc12_++;
            _loc15_.y = _loc14_;
            _loc15_.x = _loc21_;
            if (this.mx_internal::_defaultTextFormat.underline) {
                if (this.fontContext) {
                    _loc22_ = this.fontContext.callInContext(this.elementFormat.getFontMetrics, this.elementFormat, []);
                } else {
                    _loc22_ = this.elementFormat.getFontMetrics();
                }
                (_loc24_ = (_loc23_ = new Shape()).graphics).lineStyle(_loc22_.underlineThickness, this.elementFormat.color, this.elementFormat.alpha);
                _loc24_.moveTo(0, _loc22_.underlineOffset);
                _loc24_.lineTo(_loc15_.textWidth, _loc22_.underlineOffset);
                _loc15_.addChild(_loc23_);
            }
            if (nextLineIndex == numChildren) {
                addChild(_loc15_);
            }
            ++nextLineIndex;
        }
        return _loc14_ + param7;
    }

    private function alignTextLines(param1: Number): void {
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        if (isNaN(param1)) {
            param1 = 0;
        }
        var _loc2_: String = this.mx_internal::_defaultTextFormat.align;
        var _loc3_: Boolean = _loc2_ == "left" || _loc2_ == "justify" && this.direction == "ltr";
        var _loc4_: * = _loc2_ == "center";
        var _loc5_: Boolean = _loc2_ == "right" || _loc2_ == "justify" && this.direction == "rtl";
        var _loc6_: Number;
        var _loc7_: Number = (_loc6_ = mx_internal::PADDING_LEFT) + param1 / 2;
        var _loc8_: Number = _loc6_ + param1;
        var _loc9_: Number = this.rightMargin;
        var _loc10_: int = numChildren;
        var _loc11_: int = 0;
        while (_loc11_ < _loc10_) {
            _loc12_ = TextLine(getChildAt(_loc11_));
            this.mx_internal::_textWidth = Math.max(this.mx_internal::_textWidth, _loc12_.textWidth);
            _loc13_ = _loc12_.x + _loc12_.textWidth + _loc9_;
            if (_loc3_ || _loc13_ >= param1 && this.direction == "ltr") {
                _loc12_.x += _loc6_;
            } else if (_loc5_ || _loc13_ >= param1 && this.direction == "rtl") {
                _loc12_.x += _loc8_ - _loc13_;
            } else if (_loc4_) {
                _loc12_.x += _loc7_ - _loc13_ / 2;
            }
            if (_loc12_.x < 0) {
                this.mx_internal::clipWidth = int.MAX_VALUE;
            } else {
                this.mx_internal::clipWidth = Math.max(this.mx_internal::clipWidth, _loc12_.x + _loc12_.textWidth);
            }
            _loc12_.y += mx_internal::PADDING_TOP;
            _loc11_++;
        }
    }

    mx_internal function getErrorMessage(param1: String, param2: String = null): String {
        var _loc3_: * = "";
        switch (param1) {
            case "badParameter":
                _loc3_ = "Parameter " + param2 + " must be one of the accepted values.";
                break;
            case "nullParameter":
                _loc3_ = "Parameter " + param2 + " must be non-null.";
                break;
            case "badIndex":
                _loc3_ = "The supplied index is out of bounds.";
                break;
            case "notImplementedInFTETextField":
                _loc3_ = "\'" + param2 + "\' is not implemented in FTETextField.";
                break;
            case "unsupportedTypeInFTETextField":
                _loc3_ = "FTETextField does not support setting type to \"input\".";
        }
        return _loc3_;
    }

    private function notImplemented(param1: String): String {
        return this.mx_internal::getErrorMessage("notImplementedInFTETextField", param1);
    }

    private function addedToStageHandler(param1: Event): void {
        this.invalidate();
    }

    mx_internal function inlineGraphicStatusChangeHandler(param1: Event): void {
        this.mx_internal::setFlag(FLAG_TEXT_LINES_INVALID | FLAG_GRAPHICS_INVALID);
        this.invalidate();
    }
}
}

import flash.display.Sprite;

import flashx.textLayout.container.TextContainerManager;
import flashx.textLayout.elements.IConfiguration;

class FTETextFieldTextContainerManager extends TextContainerManager {


    function FTETextFieldTextContainerManager(param1: Sprite, param2: IConfiguration = null) {
        super(param1, param2);
    }

    override public function drawBackgroundAndSetScrollRect(param1: Number, param2: Number): Boolean {
        return true;
    }
}

import flash.text.StyleSheet;
import flash.text.engine.Kerning;

import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.IFormatResolver;
import flashx.textLayout.elements.LinkElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

import mx.core.mx_internal;

class FTETextFieldStyleResolver implements IFormatResolver {

    private static const textFieldToTLFStyleMap: Object = {
        "leading": "lineHeight",
        "letterSpacing": "trackingRight",
        "marginLeft": "paragraphStartIndent",
        "marginRight": "paragraphEndIndent"
    };


    private var _styleSheet: StyleSheet;

    function FTETextFieldStyleResolver(param1: StyleSheet) {
        super();
        this._styleSheet = param1;
    }

    public function resolveFormat(param1: Object): ITextLayoutFormat {
        var _loc2_: * = null;
        if (param1 is FlowElement) {
            if (param1 is TextFlow) {
                _loc2_ = this.addStyleAttributes(_loc2_, "body");
            } else if (param1 is ParagraphElement) {
                _loc2_ = this.addStyleAttributes(_loc2_, "p");
            } else if (param1 is SpanElement) {
                _loc2_ = this.addStyleAttributes(_loc2_, "span");
            }
            if (param1.styleName != null) {
                _loc2_ = this.addStyleAttributes(_loc2_, "." + param1.styleName);
            }
        }
        return _loc2_;
    }

    public function resolveUserFormat(param1: Object, param2: String): * {
        var _loc4_: * = null;
        var _loc3_: FlowElement = param1 as FlowElement;
        if (_loc3_) {
            if (_loc3_.styleName) {
                _loc4_ = this.addStyleAttributes(null, "." + _loc3_.styleName);
            } else if (_loc3_ is LinkElement) {
                if (param2 == "linkNormalFormat") {
                    _loc4_ = this.addStyleAttributes(null, "a:link");
                } else if (param2 == "linkHoverFormat") {
                    _loc4_ = this.addStyleAttributes(null, "a:hover");
                } else if (param2 == "linkActiveFormat") {
                    _loc4_ = this.addStyleAttributes(null, "a:active");
                }
            } else {
                _loc4_ = this.addStyleAttributes(null, param2);
            }
        }
        return _loc4_ != null ? _loc4_ : undefined;
    }

    public function invalidateAll(param1: TextFlow): void {
    }

    public function invalidate(param1: Object): void {
    }

    public function getResolverForNewFlow(param1: TextFlow, param2: TextFlow): IFormatResolver {
        return this;
    }

    private function addStyleAttributes(param1: TextLayoutFormat, param2: String): TextLayoutFormat {
        var _loc4_: * = undefined;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc3_: Object = this._styleSheet.getStyle(param2);
        if (_loc3_ != null) {
            for (_loc4_ in _loc3_) {
                _loc5_ = _loc3_[_loc4_];
                if (param1 == null) {
                    param1 = new TextLayoutFormat();
                }
                if (false) {
                    _loc6_ = "null";
                    param1[_loc6_] = _loc5_;
                } else if (_loc4_ == "color") {
                    if ((Boolean(_loc7_ = String(_loc5_))) && _loc7_.charAt(0) == "#") {
                        param1.color = "0x" + _loc7_.substring(1);
                    }
                } else if (_loc4_ != "display") {
                    if (_loc4_ == "kerning") {
                        if (Boolean(_loc5_)) {
                            param1.kerning = Kerning.ON;
                        } else {
                            param1.kerning = Kerning.OFF;
                        }
                    } else {
                        param1[_loc4_] = _loc5_;
                    }
                }
            }
        }
        return param1;
    }
}

import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.geom.Rectangle;
import flash.text.StyleSheet;

import flashx.textLayout.compose.ISWFContext;
import flashx.textLayout.container.TextContainerManager;
import flashx.textLayout.conversion.ConversionType;
import flashx.textLayout.conversion.ITextExporter;
import flashx.textLayout.conversion.ITextImporter;
import flashx.textLayout.conversion.TextConverter;
import flashx.textLayout.edit.EditingMode;
import flashx.textLayout.elements.Configuration;
import flashx.textLayout.elements.LinkElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.events.FlowElementMouseEvent;
import flashx.textLayout.events.StatusChangeEvent;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

import mx.core.FTETextField;
import mx.core.mx_internal;

class HTMLHelper {

    private static var plainTextImporter: ITextImporter;

    private static var plainTextExporter: ITextExporter;

    private static var collapsingHTMLImporter: ITextImporter;

    private static var preservingHTMLImporter: ITextImporter;

    private static var htmlExporter: ITextExporter;


    private var textField: FTETextField;

    mx_internal var explicitHTMLText: String = null;

    mx_internal var hostFormat: ITextLayoutFormat;

    private var textFlow: TextFlow;

    private var textContainerManager: TextContainerManager;

    mx_internal var htmlText: String = null;

    mx_internal var styleSheet: StyleSheet = null;

    function HTMLHelper(param1: FTETextField) {
        super();
        this.textField = param1;
    }

    private function get htmlImporter(): ITextImporter {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.textField.mx_internal::testFlag(FTETextField.mx_internal::FLAG_EFFECTIVE_CONDENSE_WHITE)) {
            if (!collapsingHTMLImporter) {
                _loc2_ = new Configuration();
                _loc1_ = new TextLayoutFormat(_loc2_.textFlowInitialFormat);
                _loc1_.whiteSpaceCollapse = "collapse";
                _loc2_.textFlowInitialFormat = _loc1_;
                collapsingHTMLImporter = TextConverter.getImporter(TextConverter.TEXT_FIELD_HTML_FORMAT, _loc2_);
                collapsingHTMLImporter.throwOnError = false;
            }
            return collapsingHTMLImporter;
        }
        if (!preservingHTMLImporter) {
            _loc2_ = new Configuration();
            _loc1_ = new TextLayoutFormat(_loc2_.textFlowInitialFormat);
            _loc1_.whiteSpaceCollapse = "preserve";
            _loc2_.textFlowInitialFormat = _loc1_;
            preservingHTMLImporter = TextConverter.getImporter(TextConverter.TEXT_FIELD_HTML_FORMAT, _loc2_);
            preservingHTMLImporter.throwOnError = false;
        }
        return preservingHTMLImporter;
    }

    public function clearContainerChildren(): void {
        if (this.textContainerManager) {
            this.textContainerManager.tlf_internal::clearContainerChildren(true);
            this.textContainerManager.tlf_internal::clearComposedLines();
        }
    }

    public function composeHTMLText(param1: Number, param2: Number): void {
        this.textFlow = this.htmlImporter.importToFlow(this.mx_internal::explicitHTMLText);
        if (!this.mx_internal::styleSheet) {
            this.mx_internal::htmlText = null;
        }
        if (!this.textFlow) {
            return;
        }
        this.textFlow.addEventListener(MouseEvent.CLICK, this.linkClickHandler);
        this.textFlow.addEventListener(StatusChangeEvent.INLINE_GRAPHIC_STATUS_CHANGE, this.textField.mx_internal::inlineGraphicStatusChangeHandler);
        if (!this.textContainerManager) {
            this.textContainerManager = new FTETextFieldTextContainerManager(this.textField);
        }
        this.textContainerManager.compositionWidth = param1;
        this.textContainerManager.compositionHeight = param2;
        this.textContainerManager.editingMode = EditingMode.READ_ONLY;
        this.textContainerManager.hostFormat = this.mx_internal::hostFormat;
        this.textContainerManager.swfContext = this.textField.fontContext as ISWFContext;
        this.textContainerManager.setTextFlow(this.textFlow);
        if (Boolean(this.mx_internal::styleSheet) && !this.textFlow.formatResolver) {
            this.textFlow.formatResolver = new FTETextFieldStyleResolver(this.mx_internal::styleSheet);
            this.textContainerManager.beginInteraction();
            this.textContainerManager.endInteraction();
        }
        this.textContainerManager.updateContainer();
        var _loc3_: Rectangle = this.textContainerManager.getContentBounds();
        this.textField.mx_internal::_textWidth = Math.round(_loc3_.width);
        this.textField.mx_internal::_textHeight = Math.round(_loc3_.height);
        this.textField.mx_internal::clipWidth = this.textField.mx_internal::_textWidth;
    }

    private function linkClickHandler(param1: FlowElementMouseEvent): void {
        var _loc3_: * = null;
        var _loc2_: String = LinkElement(param1.flowElement).href;
        if (_loc2_.indexOf("event:") == 0) {
            _loc3_ = new TextEvent(TextEvent.LINK);
            _loc3_.text = _loc2_.substring(6);
            this.textField.dispatchEvent(_loc3_);
        }
    }

    public function getHtmlText(param1: String): String {
        if (this.mx_internal::htmlText == null) {
            if (param1 == "") {
                this.mx_internal::htmlText = "";
            } else {
                if (!this.textFlow) {
                    if (!plainTextImporter) {
                        plainTextImporter = TextConverter.getImporter(TextConverter.PLAIN_TEXT_FORMAT);
                    }
                    this.textFlow = plainTextImporter.importToFlow(param1);
                }
                if (!htmlExporter) {
                    htmlExporter = TextConverter.getExporter(TextConverter.TEXT_FIELD_HTML_FORMAT);
                }
                this.mx_internal::htmlText = String(htmlExporter.export(this.textFlow, ConversionType.STRING_TYPE));
            }
        }
        return this.mx_internal::htmlText;
    }

    public function setStyleSheet(param1: StyleSheet): void {
        this.mx_internal::styleSheet = param1;
        if (Boolean(this.textFlow) && Boolean(this.textFlow.formatResolver)) {
            this.textFlow.formatResolver = null;
        }
    }

    public function getText(): String {
        if (!this.textFlow) {
            this.textFlow = this.htmlImporter.importToFlow(this.mx_internal::htmlText);
        }
        if (!plainTextExporter) {
            plainTextExporter = TextConverter.getExporter(TextConverter.PLAIN_TEXT_FORMAT);
        }
        return String(plainTextExporter.export(this.textFlow, ConversionType.STRING_TYPE));
    }
}
