package mx.controls {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.text.StyleSheet;
import flash.text.TextLineMetrics;

import mx.controls.listClasses.BaseListData;
import mx.controls.listClasses.IDropInListItemRenderer;
import mx.controls.listClasses.IListItemRenderer;
import mx.core.IDataRenderer;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IUITextField;
import mx.core.UIComponent;
import mx.core.UITextField;
import mx.core.mx_internal;
import mx.events.FlexEvent;

public class Label extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer, IFontContextComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static var createAccessibilityImplementation: Function;


    private var textSet: Boolean;

    private var enabledChanged: Boolean = false;

    protected var textField: IUITextField;

    private var toolTipSet: Boolean = false;

    private var _condenseWhite: Boolean = false;

    private var condenseWhiteChanged: Boolean = false;

    private var _data: Object;

    private var _htmlText: String = "";

    mx_internal var htmlTextChanged: Boolean = false;

    private var explicitHTMLText: String = null;

    private var _listData: BaseListData;

    private var _selectable: Boolean = false;

    private var selectableChanged: Boolean;

    private var styleSheetChanged: Boolean = false;

    private var _styleSheet: StyleSheet;

    private var _tabIndex: int = -1;

    private var _text: String = "";

    mx_internal var textChanged: Boolean = false;

    private var _textHeight: Number;

    private var _textWidth: Number;

    public var truncateToFit: Boolean = true;

    public function Label() {
        super();
    }

    override public function get baselinePosition(): Number {
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        return this.textField.y + this.textField.baselinePosition;
    }

    override public function set enabled(param1: Boolean): void {
        if (param1 == enabled) {
            return;
        }
        super.enabled = param1;
        this.enabledChanged = true;
        invalidateProperties();
    }

    override public function set toolTip(param1: String): void {
        super.toolTip = param1;
        this.toolTipSet = param1 != null;
    }

    [Bindable("condenseWhiteChanged")]
    public function get condenseWhite(): Boolean {
        return this._condenseWhite;
    }

    public function set condenseWhite(param1: Boolean): void {
        if (param1 == this._condenseWhite) {
            return;
        }
        this._condenseWhite = param1;
        this.condenseWhiteChanged = true;
        if (this.isHTML) {
            this.mx_internal::htmlTextChanged = true;
        }
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
        dispatchEvent(new Event("condenseWhiteChanged"));
    }

    [Bindable("dataChange")]
    public function get data(): Object {
        return this._data;
    }

    public function set data(param1: Object): void {
        var _loc2_: * = undefined;
        this._data = param1;
        if (this._listData) {
            _loc2_ = this._listData.label;
        } else if (this._data != null) {
            if (this._data is String) {
                _loc2_ = String(this._data);
            } else {
                _loc2_ = this._data.toString();
            }
        }
        if (_loc2_ !== undefined && !this.textSet) {
            this.text = _loc2_;
            this.textSet = false;
        }
        dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
    }

    public function get fontContext(): IFlexModuleFactory {
        return moduleFactory;
    }

    public function set fontContext(param1: IFlexModuleFactory): void {
        this.moduleFactory = param1;
    }

    [Bindable("htmlTextChanged")]
    public function get htmlText(): String {
        return this._htmlText;
    }

    public function set htmlText(param1: String): void {
        this.textSet = true;
        if (!param1) {
            param1 = "";
        }
        if (this.isHTML && param1 == this.explicitHTMLText) {
            return;
        }
        this._htmlText = param1;
        this.mx_internal::htmlTextChanged = true;
        this._text = null;
        this.explicitHTMLText = param1;
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
        dispatchEvent(new Event("htmlTextChanged"));
    }

    private function get isHTML(): Boolean {
        return this.explicitHTMLText != null;
    }

    [Bindable("dataChange")]
    public function get listData(): BaseListData {
        return this._listData;
    }

    public function set listData(param1: BaseListData): void {
        this._listData = param1;
    }

    public function get selectable(): Boolean {
        return this._selectable;
    }

    public function set selectable(param1: Boolean): void {
        if (param1 == this.selectable) {
            return;
        }
        this._selectable = param1;
        this.selectableChanged = true;
        invalidateProperties();
    }

    public function get styleSheet(): StyleSheet {
        return this._styleSheet;
    }

    public function set styleSheet(param1: StyleSheet): void {
        this._styleSheet = param1;
        this.styleSheetChanged = true;
        this.mx_internal::htmlTextChanged = true;
        invalidateProperties();
    }

    override public function get tabIndex(): int {
        return this._tabIndex;
    }

    override public function set tabIndex(param1: int): void {
        this._tabIndex = param1;
        invalidateProperties();
    }

    [Bindable("valueCommit")]
    public function get text(): String {
        return this._text;
    }

    public function set text(param1: String): void {
        this.textSet = true;
        if (!param1) {
            param1 = "";
        }
        if (!this.isHTML && param1 == this._text) {
            return;
        }
        this._text = param1;
        this.mx_internal::textChanged = true;
        this._htmlText = null;
        this.explicitHTMLText = null;
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
        dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
    }

    public function get textHeight(): Number {
        return this._textHeight;
    }

    public function get textWidth(): Number {
        return this._textWidth;
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            Label.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function createChildren(): void {
        super.createChildren();
        if (!this.textField) {
            this.mx_internal::createTextField(-1);
        }
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (hasFontContextChanged() && this.textField != null) {
            this.mx_internal::removeTextField();
            this.condenseWhiteChanged = true;
            this.enabledChanged = true;
            this.selectableChanged = true;
            this.mx_internal::textChanged = true;
        }
        if (!this.textField) {
            this.mx_internal::createTextField(-1);
        }
        if (this.condenseWhiteChanged) {
            this.textField.condenseWhite = this._condenseWhite;
            this.condenseWhiteChanged = false;
        }
        this.textField.tabIndex = this.tabIndex;
        if (this.enabledChanged) {
            this.textField.enabled = enabled;
            this.enabledChanged = false;
        }
        if (this.selectableChanged) {
            this.textField.selectable = this._selectable;
            this.selectableChanged = false;
        }
        if (this.styleSheetChanged) {
            this.textField.styleSheet = this._styleSheet;
            this.styleSheetChanged = false;
        }
        if (this.mx_internal::textChanged || this.mx_internal::htmlTextChanged) {
            if (this.isHTML) {
                this.textField.htmlText = this.explicitHTMLText;
            } else {
                this.textField.text = this._text;
            }
            this.textFieldChanged(false);
            this.mx_internal::textChanged = false;
            this.mx_internal::htmlTextChanged = false;
        }
    }

    override protected function measure(): void {
        super.measure();
        var _loc1_: String = this.isHTML ? this.explicitHTMLText : this.text;
        _loc1_ = this.mx_internal::getMinimumText(_loc1_);
        var _loc2_: Rectangle = this.measureTextFieldBounds(_loc1_);
        var _loc3_: * = _loc2_.width + getStyle("paddingLeft") + getStyle("paddingRight");
        measuredWidth = _loc2_.width + getStyle("paddingLeft") + getStyle("paddingRight");
        measuredMinWidth = _loc3_;
        _loc3_ = _loc2_.height + getStyle("paddingTop") + getStyle("paddingBottom");
        measuredHeight = _loc2_.height + getStyle("paddingTop") + getStyle("paddingBottom");
        measuredMinHeight = _loc3_;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc9_: * = false;
        super.updateDisplayList(param1, param2);
        var _loc3_: Number = getStyle("paddingLeft");
        var _loc4_: Number = getStyle("paddingTop");
        var _loc5_: Number = getStyle("paddingRight");
        var _loc6_: Number = getStyle("paddingBottom");
        this.textField.setActualSize(param1 - _loc3_ - _loc5_, param2 - _loc4_ - _loc6_);
        this.textField.x = _loc3_;
        this.textField.y = _loc4_;
        var _loc7_: String = this.isHTML ? this.explicitHTMLText : this.text;
        var _loc8_: Rectangle = this.measureTextFieldBounds(_loc7_);
        if (this.truncateToFit) {
            if (this.isHTML) {
                _loc9_ = _loc8_.width > this.textField.width;
            } else {
                this.textField.text = this._text;
                _loc9_ = this.textField.truncateToFit();
            }
            if (!this.toolTipSet) {
                super.toolTip = _loc9_ ? this.text : null;
            }
        }
    }

    mx_internal function createTextField(param1: int): void {
        if (!this.textField) {
            this.textField = IUITextField(createInFontContext(UITextField));
            this.textField.enabled = enabled;
            this.textField.ignorePadding = true;
            this.textField.selectable = this.selectable;
            this.textField.styleName = this;
            this.textField.addEventListener("textFieldStyleChange", this.textField_textFieldStyleChangeHandler);
            this.textField.addEventListener("textInsert", this.textField_textModifiedHandler);
            this.textField.addEventListener("textReplace", this.textField_textModifiedHandler);
            this.textField.addEventListener("textFieldWidthChange", this.textField_textFieldWidthChangeHandler);
            if (param1 == -1) {
                addChild(DisplayObject(this.textField));
            } else {
                addChildAt(DisplayObject(this.textField), param1);
            }
        }
    }

    mx_internal function removeTextField(): void {
        if (this.textField) {
            this.textField.removeEventListener("textFieldStyleChange", this.textField_textFieldStyleChangeHandler);
            this.textField.removeEventListener("textInsert", this.textField_textModifiedHandler);
            this.textField.removeEventListener("textReplace", this.textField_textModifiedHandler);
            this.textField.removeEventListener("textFieldWidthChange", this.textField_textFieldWidthChangeHandler);
            removeChild(DisplayObject(this.textField));
            this.textField = null;
        }
    }

    public function getLineMetrics(param1: int): TextLineMetrics {
        return !!this.textField ? this.textField.getLineMetrics(param1) : null;
    }

    private function textFieldChanged(param1: Boolean): void {
        var _loc2_: * = false;
        var _loc3_: * = false;
        if (!param1) {
            _loc2_ = this._text != this.textField.text;
            this._text = this.textField.text;
        }
        _loc3_ = this._htmlText != this.textField.htmlText;
        this._htmlText = this.textField.htmlText;
        if (_loc2_) {
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
        }
        if (_loc3_) {
            dispatchEvent(new Event("htmlTextChanged"));
        }
        this._textWidth = this.textField.textWidth;
        this._textHeight = this.textField.textHeight;
    }

    private function measureTextFieldBounds(param1: String): Rectangle {
        var _loc2_: TextLineMetrics = this.isHTML ? measureHTMLText(param1) : measureText(param1);
        return new Rectangle(0, 0, _loc2_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING, _loc2_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
    }

    mx_internal function getTextField(): IUITextField {
        return this.textField;
    }

    mx_internal function getMinimumText(param1: String): String {
        if (!param1 || param1.length < 2) {
            param1 = "Wj";
        }
        return param1;
    }

    private function textField_textFieldStyleChangeHandler(param1: Event): void {
        this.textFieldChanged(true);
    }

    private function textField_textModifiedHandler(param1: Event): void {
        this.textFieldChanged(false);
    }

    private function textField_textFieldWidthChangeHandler(param1: Event): void {
        this.textFieldChanged(true);
    }
}
}
