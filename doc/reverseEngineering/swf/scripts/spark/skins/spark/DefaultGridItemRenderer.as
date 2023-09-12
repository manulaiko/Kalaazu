package spark.skins.spark {

import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.text.TextFieldAutoSize;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

import mx.core.DesignLayer;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModuleFactory;
import mx.core.UIFTETextField;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.ToolTipEvent;
import mx.geom.TransformOffsets;
import mx.styles.CSSStyleDeclaration;
import mx.styles.IStyleClient;
import mx.styles.StyleProtoChain;

import spark.components.Grid;
import spark.components.gridClasses.GridColumn;
import spark.components.gridClasses.GridItemRenderer;
import spark.components.gridClasses.IGridItemRenderer;

public class DefaultGridItemRenderer extends UIFTETextField implements IGridItemRenderer, IStyleClient {

    private static const LEFT_PADDING: Number = 5;

    private static const RIGHT_PADDING: Number = 5;

    private static const TOP_PADDING: Number = 4;

    private static const BOTTOM_PADDING: Number = 3;


    private var preferredSizeInvalid: Boolean = false;

    private var preferredWidth: Number;

    private var preferredHeight: Number;

    private var enableValidateNow: Boolean = true;

    private var inSetLayoutBoundsSize: Boolean = false;

    private var deferredSetStyles: Object = null;

    private var _column: GridColumn = null;

    private var _data: Object = null;

    private var _down: Boolean = false;

    private var _hovered: Boolean = false;

    private var _rowIndex: int = -1;

    private var _showsCaret: Boolean = false;

    private var _selected: Boolean = false;

    private var _dragging: Boolean = false;

    private var _label: String = "";

    private var multilineSet: Boolean = false;

    private var wordWrapSet: Boolean = false;

    private var _styleDeclaration: CSSStyleDeclaration;

    public function DefaultGridItemRenderer() {
        super();
        autoSize = TextFieldAutoSize.NONE;
        inheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        nonInheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        addEventListener(ToolTipEvent.TOOL_TIP_SHOW, GridItemRenderer.mx_internal::toolTipShowHandler);
    }

    override public function set direction(param1: String): void {
        this.setStyle("direction", param1);
    }

    override public function set locale(param1: String): void {
        this.setStyle("locale", param1);
    }

    override public function set enabled(param1: Boolean): void {
        if (!param1 && super.enabled) {
            this.setStyle("disabledColor", this.getStyle("color"));
        }
        super.enabled = param1;
    }

    private function dispatchChangeEvent(param1: String): void {
        if (hasEventListener(param1)) {
            dispatchEvent(new Event(param1));
        }
    }

    [Bindable("columnChanged")]
    public function get column(): GridColumn {
        return this._column;
    }

    public function set column(param1: GridColumn): void {
        if (this._column == param1) {
            return;
        }
        this._column = param1;
        this.dispatchChangeEvent("columnChanged");
    }

    public function get columnIndex(): int {
        return !!this._column ? this._column.columnIndex : -1;
    }

    [Bindable("dataChange")]
    public function get data(): Object {
        return this._data;
    }

    public function set data(param1: Object): void {
        if (this._data == param1) {
            return;
        }
        this._data = param1;
        if (hasEventListener("dataChange")) {
            dispatchEvent(new FlexEvent("dataChange"));
        }
    }

    [Bindable("downChanged")]
    public function get down(): Boolean {
        return this._down;
    }

    public function set down(param1: Boolean): void {
        if (this._down == param1) {
            return;
        }
        this._down = param1;
        this.dispatchChangeEvent("downChanged");
    }

    public function get grid(): Grid {
        return !!this._column ? this._column.grid : null;
    }

    [Bindable("hoveredChanged")]
    public function get hovered(): Boolean {
        return this._hovered;
    }

    public function set hovered(param1: Boolean): void {
        if (this._hovered == param1) {
            return;
        }
        this._hovered = param1;
        this.dispatchChangeEvent("hoveredChanged");
    }

    [Bindable("rowIndexChanged")]
    public function get rowIndex(): int {
        return this._rowIndex;
    }

    public function set rowIndex(param1: int): void {
        if (this._rowIndex == param1) {
            return;
        }
        this._rowIndex = param1;
        this.dispatchChangeEvent("rowIndexChanged");
    }

    [Bindable("showsCaretChanged")]
    public function get showsCaret(): Boolean {
        return this._showsCaret;
    }

    public function set showsCaret(param1: Boolean): void {
        if (this._showsCaret == param1) {
            return;
        }
        this._showsCaret = param1;
        this.dispatchChangeEvent("labelDisplayChanged");
    }

    [Bindable("selectedChanged")]
    public function get selected(): Boolean {
        return this._selected;
    }

    public function set selected(param1: Boolean): void {
        if (this._selected == param1) {
            return;
        }
        this._selected = param1;
        this.dispatchChangeEvent("selectedChanged");
    }

    [Bindable("draggingChanged")]
    public function get dragging(): Boolean {
        return this._dragging;
    }

    public function set dragging(param1: Boolean): void {
        if (this._dragging == param1) {
            return;
        }
        this._dragging = param1;
        this.dispatchChangeEvent("draggingChanged");
    }

    [Bindable("labelChanged")]
    public function get label(): String {
        return this._label;
    }

    public function set label(param1: String): void {
        if (this._label == param1) {
            return;
        }
        this._label = param1;
        this.preferredSizeInvalid = true;
        this.dispatchChangeEvent("labelChanged");
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        var _loc2_: * = null;
        super.moduleFactory = param1;
        if (this.deferredSetStyles) {
            for (_loc2_ in this.deferredSetStyles) {
                StyleProtoChain.setStyle(this, _loc2_, this.deferredSetStyles[_loc2_]);
            }
            this.deferredSetStyles = null;
        }
    }

    override public function set multiline(param1: Boolean): void {
        super.multiline = param1;
        this.multilineSet = true;
    }

    override public function set text(param1: String): void {
        this.enableValidateNow = false;
        super.text = param1;
        this.preferredSizeInvalid = true;
        this.enableValidateNow = true;
    }

    override public function set wordWrap(param1: Boolean): void {
        super.wordWrap = param1;
        this.wordWrapSet = true;
    }

    [Bindable(style="true")]
    override public function getStyle(param1: String): * {
        if (!moduleFactory) {
            if (Boolean(this.deferredSetStyles) && this.deferredSetStyles[param1] !== undefined) {
                return this.deferredSetStyles[param1];
            }
        }
        return super.getStyle(param1);
    }

    override public function setStyle(param1: String, param2: *): void {
        if (moduleFactory) {
            StyleProtoChain.setStyle(this, param1, param2);
        } else {
            if (!this.deferredSetStyles) {
                this.deferredSetStyles = new Object();
            }
            this.deferredSetStyles[param1] = param2;
        }
    }

    override public function styleChanged(param1: String): void {
        super.styleChanged(param1);
        this.preferredSizeInvalid = true;
    }

    private function updatePreferredSize(): void {
        var _loc3_: * = null;
        if (!this.preferredSizeInvalid) {
            return;
        }
        if (!this.wordWrapSet && this.column && Boolean(this.column.grid)) {
            super.wordWrap = this.column.grid.variableRowHeight;
        }
        if (!this.multilineSet && this.getStyle("lineBreak") == "explicit") {
            super.multiline = this._label.indexOf("\n") != -1;
        }
        this.text = this._label;
        super.validateNow();
        var _loc1_: Number = isNaN(explicitWidth) ? textWidth + LEFT_PADDING + RIGHT_PADDING + mx_internal::TEXT_WIDTH_PADDING : Math.max(explicitWidth, 4, LEFT_PADDING + RIGHT_PADDING + mx_internal::TEXT_WIDTH_PADDING);
        var _loc2_: Number = isNaN(explicitHeight) ? textHeight + TOP_PADDING + BOTTOM_PADDING + mx_internal::TEXT_HEIGHT_PADDING : Math.max(explicitHeight, TOP_PADDING + BOTTOM_PADDING + mx_internal::TEXT_HEIGHT_PADDING);
        if (!stage || embedFonts) {
            this.preferredWidth = _loc1_;
            this.preferredHeight = _loc2_;
        } else {
            _loc3_ = transform.concatenatedMatrix;
            this.preferredWidth = Math.abs(_loc1_ * _loc3_.a / _loc3_.d);
            this.preferredHeight = Math.abs(_loc2_ * _loc3_.a / _loc3_.d);
        }
        GridItemRenderer.mx_internal::initializeRendererToolTip(this);
        this.preferredSizeInvalid = false;
    }

    override public function validateNow(): void {
        if (!this.enableValidateNow || !parent) {
            return;
        }
        this.updatePreferredSize();
    }

    public function prepare(param1: Boolean): void {
    }

    public function discard(param1: Boolean): void {
        if (!this.multilineSet) {
            super.multiline = false;
        }
        if (!this.wordWrapSet) {
            super.wordWrap = false;
        }
    }

    override public function set width(param1: Number): void {
        super.width = param1;
        if (!this.inSetLayoutBoundsSize) {
            explicitWidth = param1;
            this.preferredSizeInvalid = true;
        }
    }

    override public function set height(param1: Number): void {
        super.height = param1;
        if (!this.inSetLayoutBoundsSize) {
            explicitHeight = param1;
            this.preferredSizeInvalid = true;
        }
    }

    public function get depth(): Number {
        return 0;
    }

    public function set depth(param1: Number): void {
    }

    public function get designLayer(): DesignLayer {
        return null;
    }

    public function set designLayer(param1: DesignLayer): void {
    }

    public function get postLayoutTransformOffsets(): TransformOffsets {
        return null;
    }

    public function set postLayoutTransformOffsets(param1: TransformOffsets): void {
    }

    public function get is3D(): Boolean {
        return false;
    }

    public function get left(): Object {
        return null;
    }

    public function set left(param1: Object): void {
    }

    public function get right(): Object {
        return null;
    }

    public function set right(param1: Object): void {
    }

    public function get top(): Object {
        return null;
    }

    public function set top(param1: Object): void {
    }

    public function get bottom(): Object {
        return null;
    }

    public function set bottom(param1: Object): void {
    }

    public function get horizontalCenter(): Object {
        return null;
    }

    public function set horizontalCenter(param1: Object): void {
    }

    public function get verticalCenter(): Object {
        return null;
    }

    public function set verticalCenter(param1: Object): void {
    }

    public function get baseline(): Object {
        return null;
    }

    public function set baseline(param1: Object): void {
    }

    public function getPreferredBoundsWidth(param1: Boolean = true): Number {
        this.updatePreferredSize();
        return this.preferredWidth;
    }

    public function getPreferredBoundsHeight(param1: Boolean = true): Number {
        this.updatePreferredSize();
        return this.preferredHeight;
    }

    public function getMinBoundsWidth(param1: Boolean = true): Number {
        return minWidth;
    }

    public function getMinBoundsHeight(param1: Boolean = true): Number {
        return minHeight;
    }

    public function getMaxBoundsWidth(param1: Boolean = true): Number {
        return maxWidth;
    }

    public function getMaxBoundsHeight(param1: Boolean = true): Number {
        return maxHeight;
    }

    public function getBoundsXAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return x - LEFT_PADDING;
    }

    public function getBoundsYAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return y - TOP_PADDING;
    }

    public function getLayoutBoundsWidth(param1: Boolean = true): Number {
        return width + LEFT_PADDING + RIGHT_PADDING;
    }

    public function getLayoutBoundsHeight(param1: Boolean = true): Number {
        return height + TOP_PADDING + BOTTOM_PADDING;
    }

    public function getLayoutBoundsX(param1: Boolean = true): Number {
        return x - LEFT_PADDING;
    }

    public function getLayoutBoundsY(param1: Boolean = true): Number {
        return y - TOP_PADDING;
    }

    public function setLayoutBoundsPosition(param1: Number, param2: Number, param3: Boolean = true): void {
        move(param1 + LEFT_PADDING, param2 + TOP_PADDING);
    }

    public function setLayoutBoundsSize(param1: Number, param2: Number, param3: Boolean = true): void {
        this.inSetLayoutBoundsSize = true;
        setActualSize(param1 - (LEFT_PADDING + RIGHT_PADDING), param2 - (TOP_PADDING + BOTTOM_PADDING));
        this.preferredSizeInvalid = true;
        this.inSetLayoutBoundsSize = false;
    }

    public function getLayoutMatrix(): Matrix {
        return null;
    }

    public function setLayoutMatrix(param1: Matrix, param2: Boolean): void {
    }

    public function get hasLayoutMatrix3D(): Boolean {
        return false;
    }

    public function getLayoutMatrix3D(): Matrix3D {
        return null;
    }

    public function setLayoutMatrix3D(param1: Matrix3D, param2: Boolean): void {
    }

    public function transformAround(param1: Vector3D, param2: Vector3D = null, param3: Vector3D = null, param4: Vector3D = null, param5: Vector3D = null, param6: Vector3D = null, param7: Vector3D = null, param8: Boolean = true): void {
    }

    public function get layoutDirection(): String {
        return this.getStyle("layoutDirection");
    }

    public function set layoutDirection(param1: String): void {
    }

    public function invalidateLayoutDirection(): void {
    }

    public function getClassStyleDeclarations(): Array {
        var styleDeclaration: CSSStyleDeclaration = null;
        var className: String = getQualifiedClassName(this).replace("::", ".");
        var styleDeclarations: Array = [];
        while (className != "mx.core.UIFTETextField" && className != "mx.core.UITextField") {
            styleDeclaration = styleManager.getMergedStyleDeclaration(className);
            if (styleDeclaration) {
                styleDeclarations.unshift(styleDeclaration);
            }
            try {
                className = getQualifiedSuperclassName(getDefinitionByName(className)).replace("::", ".");
            } catch (e: ReferenceError) {
                break;
            }
        }
        return styleDeclarations;
    }

    public function initProtoChain(): void {
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        mx_internal::styleChangedFlag = true;
        var _loc1_: * = [];
        if (styleName) {
            if (styleName is CSSStyleDeclaration) {
                _loc1_.push(CSSStyleDeclaration(styleName));
            } else {
                if (styleName is IFlexDisplayObject) {
                    StyleProtoChain.initProtoChainForUIComponentStyleName(this);
                    return;
                }
                if (styleName is String) {
                    _loc7_ = styleName.split(/\s+/);
                    _loc8_ = 0;
                    while (_loc8_ < _loc7_.length) {
                        if (_loc7_[_loc8_].length) {
                            _loc1_.push(styleManager.getMergedStyleDeclaration("." + _loc7_[_loc8_]));
                        }
                        _loc8_++;
                    }
                }
            }
        }
        var _loc2_: Object = styleManager.stylesRoot;
        var _loc3_: IStyleClient = parent as IStyleClient;
        if (_loc3_) {
            if ((_loc9_ = _loc3_.inheritingStyles) == StyleProtoChain.STYLE_UNINITIALIZED) {
                _loc9_ = _loc2_;
            }
        } else {
            _loc9_ = styleManager.stylesRoot;
        }
        var _loc4_: Array;
        var _loc5_: int = (_loc4_ = this.getClassStyleDeclarations()).length;
        var _loc6_: int = 0;
        while (_loc6_ < _loc5_) {
            _loc9_ = (_loc10_ = _loc4_[_loc6_]).mx_internal::addStyleToProtoChain(_loc9_, this);
            _loc2_ = _loc10_.mx_internal::addStyleToProtoChain(_loc2_, this);
            _loc6_++;
        }
        _loc6_ = 0;
        while (_loc6_ < _loc1_.length) {
            if (_loc11_ = _loc1_[_loc6_]) {
                _loc9_ = _loc11_.mx_internal::addStyleToProtoChain(_loc9_, this);
                _loc2_ = _loc11_.mx_internal::addStyleToProtoChain(_loc2_, this);
            }
            _loc6_++;
        }
        inheritingStyles = !!this.styleDeclaration ? this.styleDeclaration.mx_internal::addStyleToProtoChain(_loc9_, this) : _loc9_;
        nonInheritingStyles = !!this.styleDeclaration ? this.styleDeclaration.mx_internal::addStyleToProtoChain(_loc2_, this) : _loc2_;
    }

    public function clearStyle(param1: String): void {
        this.setStyle(param1, undefined);
    }

    public function regenerateStyleCache(param1: Boolean): void {
        this.initProtoChain();
    }

    public function notifyStyleChangeInChildren(param1: String, param2: Boolean): void {
    }

    public function registerEffects(param1: Array): void {
    }

    public function get styleDeclaration(): CSSStyleDeclaration {
        return this._styleDeclaration;
    }

    public function set styleDeclaration(param1: CSSStyleDeclaration): void {
        this._styleDeclaration = param1;
    }
}
}
