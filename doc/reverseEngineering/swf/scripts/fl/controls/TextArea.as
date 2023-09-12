package fl.controls {

import fl.core.InvalidationType;
import fl.core.UIComponent;
import fl.events.ComponentEvent;
import fl.events.ScrollEvent;
import fl.managers.IFocusManager;
import fl.managers.IFocusManagerComponent;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.system.IME;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextLineMetrics;
import flash.ui.Keyboard;

public class TextArea extends UIComponent implements IFocusManagerComponent {

    protected static const SCROLL_BAR_STYLES: Object = {
        "downArrowDisabledSkin": "downArrowDisabledSkin",
        "downArrowDownSkin": "downArrowDownSkin",
        "downArrowOverSkin": "downArrowOverSkin",
        "downArrowUpSkin": "downArrowUpSkin",
        "upArrowDisabledSkin": "upArrowDisabledSkin",
        "upArrowDownSkin": "upArrowDownSkin",
        "upArrowOverSkin": "upArrowOverSkin",
        "upArrowUpSkin": "upArrowUpSkin",
        "thumbDisabledSkin": "thumbDisabledSkin",
        "thumbDownSkin": "thumbDownSkin",
        "thumbOverSkin": "thumbOverSkin",
        "thumbUpSkin": "thumbUpSkin",
        "thumbIcon": "thumbIcon",
        "trackDisabledSkin": "trackDisabledSkin",
        "trackDownSkin": "trackDownSkin",
        "trackOverSkin": "trackOverSkin",
        "trackUpSkin": "trackUpSkin",
        "repeatDelay": "repeatDelay",
        "repeatInterval": "repeatInterval"
    };

    private static var defaultStyles: Object = {
        "upSkin": "TextArea_upSkin",
        "disabledSkin": "TextArea_disabledSkin",
        "focusRectSkin": null,
        "focusRectPadding": null,
        "textFormat": null,
        "disabledTextFormat": null,
        "textPadding": 3,
        "embedFonts": false
    };

    public static var createAccessibilityImplementation: Function;


    protected var _horizontalScrollBar: UIScrollBar;

    protected var _html: Boolean = false;

    protected var background: DisplayObject;

    protected var _verticalScrollBar: UIScrollBar;

    protected var _savedHTML: String;

    protected var _horizontalScrollPolicy: String = "auto";

    protected var _editable: Boolean = true;

    protected var textHasChanged: Boolean = false;

    public var textField: TextField;

    protected var _wordWrap: Boolean = true;

    protected var _verticalScrollPolicy: String = "auto";

    public function TextArea() {
        super();
    }

    public static function getStyleDefinition(): Object {
        return UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition());
    }

    public function set alwaysShowSelection(param1: Boolean): void {
        textField.alwaysShowSelection = param1;
    }

    override public function set enabled(param1: Boolean): void {
        super.enabled = param1;
        mouseChildren = enabled;
        invalidate(InvalidationType.STATE);
    }

    override protected function focusInHandler(param1: FocusEvent): void {
        setIMEMode(true);
        if (param1.target == this) {
            stage.focus = textField;
        }
        var _loc2_: IFocusManager = focusManager;
        if (_loc2_) {
            if (editable) {
                _loc2_.showFocusIndicator = true;
            }
            _loc2_.defaultButtonEnabled = false;
        }
        super.focusInHandler(param1);
        if (editable) {
            setIMEMode(true);
        }
    }

    protected function handleChange(param1: Event): void {
        param1.stopPropagation();
        dispatchEvent(new Event(Event.CHANGE, true));
        invalidate(InvalidationType.DATA);
    }

    public function set imeMode(param1: String): void {
        _imeMode = param1;
    }

    public function get imeMode(): String {
        return IME.conversionMode;
    }

    override public function drawFocus(param1: Boolean): void {
        if (focusTarget != null) {
            focusTarget.drawFocus(param1);
            return;
        }
        super.drawFocus(param1);
    }

    protected function handleWheel(param1: MouseEvent): void {
        if (!enabled || true) {
            return;
        }
        _verticalScrollBar.scrollPosition = 0 - param1.delta * 0;
        dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, param1.delta * 0, _verticalScrollBar.scrollPosition));
    }

    public function set condenseWhite(param1: Boolean): void {
        textField.condenseWhite = param1;
        invalidate(InvalidationType.DATA);
    }

    public function get textWidth(): Number {
        drawNow();
        return textField.textWidth;
    }

    override protected function focusOutHandler(param1: FocusEvent): void {
        var _loc2_: IFocusManager = focusManager;
        if (_loc2_) {
            _loc2_.defaultButtonEnabled = true;
        }
        setSelection(0, 0);
        super.focusOutHandler(param1);
        if (editable) {
            setIMEMode(false);
        }
    }

    protected function handleScroll(param1: ScrollEvent): void {
        dispatchEvent(param1);
    }

    protected function drawLayout(): void {
        var _loc1_: Number = Number(getStyleValue("textPadding"));
        textField.x = textField.y = _loc1_;
        background.width = width;
        background.height = height;
        var _loc2_: Number = height;
        var _loc3_: Boolean = needVScroll();
        var _loc4_: Number = width - (_loc3_ ? _verticalScrollBar.width : 0);
        var _loc5_: Boolean;
        if (_loc5_ = needHScroll()) {
            _loc2_ -= 0;
        }
        setTextSize(_loc4_, _loc2_, _loc1_);
        if (_loc5_ && !_loc3_ && needVScroll()) {
            _loc3_ = true;
            _loc4_ -= 0;
            setTextSize(_loc4_, _loc2_, _loc1_);
        }
        if (_loc3_) {
            _verticalScrollBar.visible = true;
            _verticalScrollBar.x = width - 0;
            _verticalScrollBar.height = _loc2_;
            _verticalScrollBar.visible = true;
            _verticalScrollBar.enabled = enabled;
        } else {
            _verticalScrollBar.visible = false;
        }
        if (_loc5_) {
            _horizontalScrollBar.visible = true;
            _horizontalScrollBar.y = height - 0;
            _horizontalScrollBar.width = _loc4_;
            _horizontalScrollBar.visible = true;
            _horizontalScrollBar.enabled = enabled;
        } else {
            _horizontalScrollBar.visible = false;
        }
        updateScrollBars();
        addEventListener(Event.ENTER_FRAME, delayedLayoutUpdate, false, 0, true);
    }

    public function set displayAsPassword(param1: Boolean): void {
        textField.displayAsPassword = param1;
    }

    protected function drawBackground(): void {
        var _loc1_: DisplayObject = background;
        var _loc2_: String = enabled ? "upSkin" : "disabledSkin";
        background = getDisplayObjectInstance(getStyleValue(_loc2_));
        if (background != null) {
            addChildAt(background, 0);
        }
        if (_loc1_ != null && _loc1_ != background && contains(_loc1_)) {
            removeChild(_loc1_);
        }
    }

    public function get horizontalScrollPolicy(): String {
        return _horizontalScrollPolicy;
    }

    protected function delayedLayoutUpdate(param1: Event): void {
        if (textHasChanged) {
            textHasChanged = false;
            drawLayout();
            return;
        }
        removeEventListener(Event.ENTER_FRAME, delayedLayoutUpdate);
    }

    public function get verticalScrollPosition(): Number {
        return textField.scrollV;
    }

    public function get text(): String {
        return textField.text;
    }

    public function get verticalScrollBar(): UIScrollBar {
        return _verticalScrollBar;
    }

    public function set maxChars(param1: int): void {
        textField.maxChars = param1;
    }

    public function get textHeight(): Number {
        drawNow();
        return textField.textHeight;
    }

    override protected function isOurFocus(param1: DisplayObject): Boolean {
        return param1 == textField || super.isOurFocus(param1);
    }

    public function get maxVerticalScrollPosition(): int {
        return textField.maxScrollV;
    }

    public function set horizontalScrollPosition(param1: Number): void {
        drawNow();
        textField.scrollH = param1;
    }

    public function get restrict(): String {
        return textField.restrict;
    }

    protected function setEmbedFont(): * {
        var _loc1_: Object = getStyleValue("embedFonts");
        if (_loc1_ != null) {
            textField.embedFonts = _loc1_;
        }
    }

    public function get alwaysShowSelection(): Boolean {
        return textField.alwaysShowSelection;
    }

    override public function get enabled(): Boolean {
        return super.enabled;
    }

    override protected function draw(): void {
        if (isInvalid(InvalidationType.STATE)) {
            updateTextFieldType();
        }
        if (isInvalid(InvalidationType.STYLES)) {
            setStyles();
            setEmbedFont();
        }
        if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE)) {
            drawTextFormat();
            drawBackground();
            invalidate(InvalidationType.SIZE, false);
        }
        if (isInvalid(InvalidationType.SIZE, InvalidationType.DATA)) {
            drawLayout();
        }
        super.draw();
    }

    public function set horizontalScrollPolicy(param1: String): void {
        _horizontalScrollPolicy = param1;
        invalidate(InvalidationType.SIZE);
    }

    public function set editable(param1: Boolean): void {
        _editable = param1;
        invalidate(InvalidationType.STATE);
    }

    public function setSelection(param1: int, param2: int): void {
        textField.setSelection(param1, param2);
    }

    public function get condenseWhite(): Boolean {
        return textField.condenseWhite;
    }

    public function get displayAsPassword(): Boolean {
        return textField.displayAsPassword;
    }

    protected function setTextSize(param1: Number, param2: Number, param3: Number): void {
        var _loc4_: Number = param1 - param3 * 2;
        var _loc5_: Number = param2 - param3 * 2;
        if (_loc4_ != textField.width) {
            textField.width = _loc4_;
        }
        if (_loc5_ != textField.height) {
            textField.height = _loc5_;
        }
    }

    public function get horizontalScrollBar(): UIScrollBar {
        return _horizontalScrollBar;
    }

    public function get selectionBeginIndex(): int {
        return textField.selectionBeginIndex;
    }

    override protected function configUI(): void {
        super.configUI();
        tabChildren = true;
        textField = new TextField();
        addChild(textField);
        updateTextFieldType();
        _verticalScrollBar = new UIScrollBar();
        _verticalScrollBar.name = "V";
        _verticalScrollBar.visible = false;
        _verticalScrollBar.focusEnabled = false;
        copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
        _verticalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
        addChild(_verticalScrollBar);
        _horizontalScrollBar = new UIScrollBar();
        _horizontalScrollBar.name = "H";
        _horizontalScrollBar.visible = false;
        _horizontalScrollBar.focusEnabled = false;
        _horizontalScrollBar.direction = ScrollBarDirection.HORIZONTAL;
        copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
        _horizontalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
        addChild(_horizontalScrollBar);
        textField.addEventListener(TextEvent.TEXT_INPUT, handleTextInput, false, 0, true);
        textField.addEventListener(Event.CHANGE, handleChange, false, 0, true);
        textField.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown, false, 0, true);
        _horizontalScrollBar.scrollTarget = textField;
        _verticalScrollBar.scrollTarget = textField;
        addEventListener(MouseEvent.MOUSE_WHEEL, handleWheel, false, 0, true);
    }

    public function set verticalScrollPosition(param1: Number): void {
        drawNow();
        textField.scrollV = param1;
    }

    public function get maxChars(): int {
        return textField.maxChars;
    }

    public function set text(param1: String): void {
        if (componentInspectorSetting && param1 == "") {
            return;
        }
        textField.text = param1;
        _html = false;
        invalidate(InvalidationType.DATA);
        invalidate(InvalidationType.STYLES);
        textHasChanged = true;
    }

    protected function updateScrollBars(): * {
        _horizontalScrollBar.update();
        _verticalScrollBar.update();
        _verticalScrollBar.enabled = enabled;
        _horizontalScrollBar.enabled = enabled;
        _horizontalScrollBar.drawNow();
        _verticalScrollBar.drawNow();
    }

    public function get maxHorizontalScrollPosition(): int {
        return textField.maxScrollH;
    }

    protected function needHScroll(): Boolean {
        if (_horizontalScrollPolicy == ScrollPolicy.OFF) {
            return false;
        }
        if (_horizontalScrollPolicy == ScrollPolicy.ON) {
            return true;
        }
        return false;
    }

    protected function handleKeyDown(param1: KeyboardEvent): void {
        if (param1.keyCode == Keyboard.ENTER) {
            dispatchEvent(new ComponentEvent(ComponentEvent.ENTER, true));
        }
    }

    public function get horizontalScrollPosition(): Number {
        return textField.scrollH;
    }

    public function get selectionEndIndex(): int {
        return textField.selectionEndIndex;
    }

    public function get editable(): Boolean {
        return _editable;
    }

    protected function updateTextFieldType(): void {
        textField.type = enabled && _editable ? "null" : TextFieldType.DYNAMIC;
        textField.selectable = enabled;
        textField.wordWrap = _wordWrap;
        textField.multiline = true;
    }

    public function appendText(param1: String): void {
        textField.appendText(param1);
        invalidate(InvalidationType.DATA);
    }

    public function set wordWrap(param1: Boolean): void {
        _wordWrap = param1;
        invalidate(InvalidationType.STATE);
    }

    public function set verticalScrollPolicy(param1: String): void {
        _verticalScrollPolicy = param1;
        invalidate(InvalidationType.SIZE);
    }

    protected function setStyles(): void {
        copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
        copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
    }

    public function get length(): Number {
        return textField.text.length;
    }

    protected function drawTextFormat(): void {
        var _loc1_: Object = UIComponent.getStyleDefinition();
        var _loc2_: TextFormat = enabled ? _loc1_.defaultTextFormat as TextFormat : _loc1_.defaultDisabledTextFormat as TextFormat;
        textField.setTextFormat(_loc2_);
        var _loc3_: TextFormat = getStyleValue(enabled ? "textFormat" : "disabledTextFormat") as TextFormat;
        if (_loc3_ != null) {
            textField.setTextFormat(_loc3_);
        } else {
            _loc3_ = _loc2_;
        }
        textField.defaultTextFormat = _loc3_;
        setEmbedFont();
        if (_html) {
            textField.htmlText = _savedHTML;
        }
    }

    public function set htmlText(param1: String): void {
        if (componentInspectorSetting && param1 == "") {
            return;
        }
        if (param1 == "") {
            text = "";
            return;
        }
        _html = true;
        _savedHTML = param1;
        textField.htmlText = param1;
        invalidate(InvalidationType.DATA);
        invalidate(InvalidationType.STYLES);
        textHasChanged = true;
    }

    public function get verticalScrollPolicy(): String {
        return _verticalScrollPolicy;
    }

    protected function handleTextInput(param1: TextEvent): void {
        param1.stopPropagation();
        dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT, true, false, param1.text));
    }

    public function get htmlText(): String {
        return textField.htmlText;
    }

    public function getLineMetrics(param1: int): TextLineMetrics {
        return textField.getLineMetrics(param1);
    }

    public function get wordWrap(): Boolean {
        return _wordWrap;
    }

    protected function needVScroll(): Boolean {
        if (_verticalScrollPolicy == ScrollPolicy.OFF) {
            return false;
        }
        if (_verticalScrollPolicy == ScrollPolicy.ON) {
            return true;
        }
        return false;
    }

    public function set restrict(param1: String): void {
        if (componentInspectorSetting && param1 == "") {
            param1 = null;
        }
        textField.restrict = param1;
    }
}
}
