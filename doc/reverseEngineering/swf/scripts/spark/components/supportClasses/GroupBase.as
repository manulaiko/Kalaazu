package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.GestureEvent;
import flash.events.MouseEvent;
import flash.events.PressAndTapGestureEvent;
import flash.events.TouchEvent;
import flash.events.TransformGestureEvent;
import flash.filters.ShaderFilter;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.shaderClasses.LuminosityMaskShader;

import spark.components.ResizeMode;
import spark.core.IViewport;
import spark.core.MaskType;
import spark.events.DisplayLayerObjectExistenceEvent;
import spark.layouts.BasicLayout;
import spark.layouts.supportClasses.LayoutBase;
import spark.utils.FTETextUtil;
import spark.utils.MaskUtil;

public class GroupBase extends UIComponent implements IViewport {


    private var _explicitAlpha: Number = 1;

    private var _explicitMouseChildren: Boolean = true;

    private var _explicitMouseEnabled: Boolean = true;

    private var _layout: LayoutBase;

    private var _layoutProperties: Object = null;

    private var layoutInvalidateSizeFlag: Boolean = false;

    private var layoutInvalidateDisplayListFlag: Boolean = false;

    private var clipAndEnableScrollingExplicitlySet: Boolean = false;

    private var _scrollRectSet: Boolean = false;

    private var _autoLayout: Boolean = true;

    mx_internal var _overlay: DisplayLayer;

    private var _resizeMode: String = "noScale";

    private var _mouseEnabledWhereTransparent: Boolean = true;

    private var mouseEventReferenceCount: int;

    private var _hasMouseListeners: Boolean = false;

    private var _contentWidth: Number = 0;

    private var _contentHeight: Number = 0;

    private var _focusPane: Sprite;

    private var _mask: DisplayObject;

    mx_internal var maskChanged: Boolean;

    private var _maskType: String = "clip";

    private var maskTypeChanged: Boolean;

    private var originalMaskFilters: Array;

    private var _luminosityInvert: Boolean = false;

    private var luminositySettingsChanged: Boolean;

    private var _luminosityClip: Boolean = false;

    public function GroupBase() {
        super();
        showInAutomationHierarchy = false;
    }

    mx_internal static function sortOnLayer(param1: Vector.<IVisualElement>): void {
        var _loc3_: * = null;
        var _loc5_: int = 0;
        var _loc2_: Number = param1.length;
        if (_loc2_ <= 1) {
            return;
        }
        var _loc4_: int = 1;
        while (_loc4_ < _loc2_) {
            _loc5_ = _loc4_;
            while (_loc5_ > 0) {
                if (param1[_loc5_].depth >= param1[_loc5_ - 1].depth) {
                    break;
                }
                _loc3_ = param1[_loc5_];
                param1[_loc5_] = param1[_loc5_ - 1];
                param1[_loc5_ - 1] = _loc3_;
                _loc5_--;
            }
            _loc4_++;
        }
    }

    override public function set alpha(param1: Number): void {
        if (enabled) {
            super.alpha = param1;
        }
        this._explicitAlpha = param1;
    }

    override public function get baselinePosition(): Number {
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        return FTETextUtil.calculateFontBaseline(this, height, moduleFactory);
    }

    override public function set mouseChildren(param1: Boolean): void {
        if (enabled) {
            super.mouseChildren = param1;
        }
        this._explicitMouseChildren = param1;
    }

    override public function set mouseEnabled(param1: Boolean): void {
        if (enabled) {
            super.mouseEnabled = param1;
        }
        this._explicitMouseEnabled = param1;
    }

    override public function set enabled(param1: Boolean): void {
        var _loc2_: Number = NaN;
        super.enabled = param1;
        super.mouseChildren = param1 ? this._explicitMouseChildren : false;
        super.mouseEnabled = param1 ? this._explicitMouseEnabled : false;
        if (param1) {
            super.alpha = this._explicitAlpha;
        } else {
            _loc2_ = getStyle("disabledAlpha");
            if (!isNaN(_loc2_)) {
                super.alpha = _loc2_;
            }
        }
    }

    public function get layout(): LayoutBase {
        return this._layout;
    }

    public function set layout(param1: LayoutBase): void {
        if (this._layout == param1) {
            return;
        }
        if (this._layout) {
            this._layout.target = null;
            this._layout.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.redispatchLayoutEvent);
            if (this.clipAndEnableScrollingExplicitlySet) {
                this._layoutProperties = {"clipAndEnableScrolling": this._layout.clipAndEnableScrolling};
            }
        }
        this._layout = param1;
        if (this._layout) {
            this._layout.target = this;
            this._layout.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.redispatchLayoutEvent);
            if (this._layoutProperties) {
                if (this._layoutProperties.clipAndEnableScrolling !== undefined) {
                    param1.clipAndEnableScrolling = this._layoutProperties.clipAndEnableScrolling;
                }
                if (this._layoutProperties.verticalScrollPosition !== undefined) {
                    param1.verticalScrollPosition = this._layoutProperties.verticalScrollPosition;
                }
                if (this._layoutProperties.horizontalScrollPosition !== undefined) {
                    param1.horizontalScrollPosition = this._layoutProperties.horizontalScrollPosition;
                }
                this._layoutProperties = null;
            }
        }
        this.invalidateSize();
        this.invalidateDisplayList();
    }

    private function redispatchLayoutEvent(param1: Event): void {
        var _loc2_: PropertyChangeEvent = param1 as PropertyChangeEvent;
        if (_loc2_) {
            switch (_loc2_.property) {
                case "verticalScrollPosition":
                case "horizontalScrollPosition":
                    dispatchEvent(param1);
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get horizontalScrollPosition(): Number {
        if (this._layout) {
            return this._layout.horizontalScrollPosition;
        }
        if (Boolean(this._layoutProperties) && this._layoutProperties.horizontalScrollPosition !== undefined) {
            return this._layoutProperties.horizontalScrollPosition;
        }
        return 0;
    }

    private function set _754184102horizontalScrollPosition(param1: Number): void {
        if (this._layout) {
            this._layout.horizontalScrollPosition = param1;
        } else if (this._layoutProperties) {
            this._layoutProperties.horizontalScrollPosition = param1;
        } else {
            this._layoutProperties = {"horizontalScrollPosition": param1};
        }
    }

    [Bindable(event="propertyChange")]
    public function get verticalScrollPosition(): Number {
        if (this._layout) {
            return this._layout.verticalScrollPosition;
        }
        if (Boolean(this._layoutProperties) && this._layoutProperties.verticalScrollPosition !== undefined) {
            return this._layoutProperties.verticalScrollPosition;
        }
        return 0;
    }

    private function set _1010846676verticalScrollPosition(param1: Number): void {
        if (this._layout) {
            this._layout.verticalScrollPosition = param1;
        } else if (this._layoutProperties) {
            this._layoutProperties.verticalScrollPosition = param1;
        } else {
            this._layoutProperties = {"verticalScrollPosition": param1};
        }
    }

    public function get clipAndEnableScrolling(): Boolean {
        if (this._layout) {
            return this._layout.clipAndEnableScrolling;
        }
        if (Boolean(this._layoutProperties) && this._layoutProperties.clipAndEnableScrolling !== undefined) {
            return this._layoutProperties.clipAndEnableScrolling;
        }
        return false;
    }

    public function set clipAndEnableScrolling(param1: Boolean): void {
        this.clipAndEnableScrollingExplicitlySet = true;
        if (this._layout) {
            this._layout.clipAndEnableScrolling = param1;
        } else if (this._layoutProperties) {
            this._layoutProperties.clipAndEnableScrolling = param1;
        } else {
            this._layoutProperties = {"clipAndEnableScrolling": param1};
        }
        this.invalidateSize();
    }

    override public function get scrollRect(): Rectangle {
        return !this._scrollRectSet ? null : super.scrollRect;
    }

    override public function set scrollRect(param1: Rectangle): void {
        if (!this._scrollRectSet && !param1) {
            return;
        }
        this._scrollRectSet = true;
        super.scrollRect = param1;
    }

    public function get autoLayout(): Boolean {
        return this._autoLayout;
    }

    public function set autoLayout(param1: Boolean): void {
        if (this._autoLayout == param1) {
            return;
        }
        this._autoLayout = param1;
        if (param1) {
            this.invalidateSize();
            this.invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
        }
    }

    public function get overlay(): DisplayLayer {
        if (!this.mx_internal::_overlay) {
            this.mx_internal::_overlay = new DisplayLayer();
            this.mx_internal::_overlay.addEventListener(DisplayLayerObjectExistenceEvent.OBJECT_ADD, this.overlay_objectAdd);
            this.mx_internal::_overlay.addEventListener(DisplayLayerObjectExistenceEvent.OBJECT_REMOVE, this.overlay_objectRemove);
            invalidateProperties();
        }
        return this.mx_internal::_overlay;
    }

    private function overlay_objectAdd(param1: DisplayLayerObjectExistenceEvent): void {
        super.addChildAt(param1.object, param1.index + numChildren - this.mx_internal::_overlay.numDisplayObjects + 1);
    }

    private function overlay_objectRemove(param1: DisplayLayerObjectExistenceEvent): void {
        super.removeChild(param1.object);
        if (this.mx_internal::_overlay.numDisplayObjects == 1) {
            invalidateProperties();
        }
    }

    private function destroyOverlay(): void {
        this.mx_internal::_overlay.removeEventListener(DisplayLayerObjectExistenceEvent.OBJECT_ADD, this.overlay_objectAdd);
        this.mx_internal::_overlay.removeEventListener(DisplayLayerObjectExistenceEvent.OBJECT_REMOVE, this.overlay_objectRemove);
        this.mx_internal::_overlay = null;
    }

    public function get resizeMode(): String {
        return this._resizeMode;
    }

    public function set resizeMode(param1: String): void {
        if (this._resizeMode == param1) {
            return;
        }
        if (this._resizeMode == ResizeMode.SCALE) {
            setStretchXY(1, 1);
        }
        this._resizeMode = param1;
        this.invalidateSize();
        this.invalidateDisplayList();
    }

    public function get mouseEnabledWhereTransparent(): Boolean {
        return this._mouseEnabledWhereTransparent;
    }

    public function set mouseEnabledWhereTransparent(param1: Boolean): void {
        if (param1 == this._mouseEnabledWhereTransparent) {
            return;
        }
        this._mouseEnabledWhereTransparent = param1;
        if (this._hasMouseListeners) {
            this.invalidateDisplayList();
        }
    }

    mx_internal function drawBackground(): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        if (!this._mouseEnabledWhereTransparent || !this._hasMouseListeners) {
            return;
        }
        var _loc1_: Number = this._resizeMode == ResizeMode.SCALE ? measuredWidth : unscaledWidth;
        var _loc2_: Number = this._resizeMode == ResizeMode.SCALE ? measuredHeight : unscaledHeight;
        if (isNaN(_loc1_) || isNaN(_loc2_)) {
            return;
        }
        graphics.clear();
        graphics.beginFill(16777215, 0);
        if (Boolean(this.layout) && this.layout.useVirtualLayout) {
            graphics.drawRect(this.horizontalScrollPosition, this.verticalScrollPosition, _loc1_, _loc2_);
        } else {
            _loc3_ = 4096;
            _loc4_ = Math.round(Math.max(_loc1_, this.contentWidth));
            _loc5_ = Math.round(Math.max(_loc2_, this.contentHeight));
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                _loc7_ = 0;
                while (_loc7_ < _loc5_) {
                    _loc8_ = Math.min(_loc4_ - _loc6_, _loc3_);
                    _loc9_ = Math.min(_loc5_ - _loc7_, _loc3_);
                    graphics.drawRect(_loc6_, _loc7_, _loc8_, _loc9_);
                    _loc7_ += _loc3_;
                }
                _loc6_ += _loc3_;
            }
        }
        graphics.endFill();
    }

    mx_internal function set hasMouseListeners(param1: Boolean): void {
        if (this._mouseEnabledWhereTransparent) {
            this.mx_internal::$invalidateDisplayList();
        }
        this._hasMouseListeners = param1;
    }

    mx_internal function get hasMouseListeners(): Boolean {
        return this._hasMouseListeners;
    }

    override protected function canSkipMeasurement(): Boolean {
        return this._resizeMode == ResizeMode.SCALE ? false : super.canSkipMeasurement();
    }

    override public function invalidateSize(): void {
        super.invalidateSize();
        this.layoutInvalidateSizeFlag = true;
    }

    override public function invalidateDisplayList(): void {
        super.invalidateDisplayList();
        this.layoutInvalidateDisplayListFlag = true;
    }

    override mx_internal function childXYChanged(): void {
        if (this.autoLayout) {
            this.invalidateSize();
            this.invalidateDisplayList();
        }
    }

    mx_internal function $invalidateSize(): void {
        super.invalidateSize();
    }

    mx_internal function $invalidateDisplayList(): void {
        super.invalidateDisplayList();
    }

    override protected function createChildren(): void {
        super.createChildren();
        if (!this.layout) {
            this.layout = new BasicLayout();
        }
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (Boolean(this.mx_internal::_overlay) && this.mx_internal::_overlay.numDisplayObjects == 0) {
            this.destroyOverlay();
        }
    }

    override protected function measure(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        if (Boolean(this._layout) && this.layoutInvalidateSizeFlag) {
            _loc1_ = measuredWidth;
            _loc2_ = measuredHeight;
            super.measure();
            this.layoutInvalidateSizeFlag = false;
            this._layout.measure();
            if (this.clipAndEnableScrolling || this.resizeMode == ResizeMode.SCALE) {
                measuredMinWidth = 0;
                measuredMinHeight = 0;
            }
            if (this._resizeMode == ResizeMode.SCALE && (measuredWidth != _loc1_ || measuredHeight != _loc2_)) {
                this.invalidateDisplayList();
            }
        }
    }

    override protected function validateMatrix(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        if (this._resizeMode == ResizeMode.SCALE) {
            _loc1_ = 1;
            _loc2_ = 1;
            if (measuredWidth != 0) {
                _loc1_ = width / measuredWidth;
            }
            if (measuredHeight != 0) {
                _loc2_ = height / measuredHeight;
            }
            setStretchXY(_loc1_, _loc2_);
        }
        super.validateMatrix();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        if (this._resizeMode == ResizeMode.SCALE) {
            param1 = measuredWidth;
            param2 = measuredHeight;
        }
        super.updateDisplayList(param1, param2);
        if (this.mx_internal::maskChanged) {
            this.mx_internal::maskChanged = false;
            if (this._mask) {
                this.maskTypeChanged = true;
                if (!this._mask.parent) {
                    this.overlay.addDisplayObject(this._mask, OverlayDepth.MASK);
                    MaskUtil.mx_internal::applyMask(this._mask, null);
                }
            }
        }
        if (this.luminositySettingsChanged) {
            this.luminositySettingsChanged = false;
            if (this._mask && this._maskType == MaskType.LUMINOSITY && this._mask.filters.length > 0) {
                _loc5_ = this._mask.filters.length;
                _loc4_ = 0;
                while (_loc4_ < _loc5_) {
                    if (this._mask.filters[_loc4_] is ShaderFilter && ShaderFilter(this._mask.filters[_loc4_]).shader is LuminosityMaskShader) {
                        _loc3_ = this._mask.filters[_loc4_];
                        break;
                    }
                    _loc4_++;
                }
                if (Boolean(_loc3_) && _loc3_.shader is LuminosityMaskShader) {
                    LuminosityMaskShader(_loc3_.shader).mode = this.calculateLuminositySettings();
                    this._mask.filters[_loc4_] = _loc3_;
                    this._mask.filters = this._mask.filters;
                }
            }
        }
        if (this.maskTypeChanged) {
            this.maskTypeChanged = false;
            if (this._mask) {
                if (this._maskType == MaskType.CLIP) {
                    this._mask.cacheAsBitmap = false;
                    this.originalMaskFilters = this._mask.filters;
                    this._mask.filters = [];
                } else if (this._maskType == MaskType.ALPHA) {
                    this._mask.cacheAsBitmap = true;
                    cacheAsBitmap = true;
                } else if (this._maskType == MaskType.LUMINOSITY) {
                    this._mask.cacheAsBitmap = true;
                    cacheAsBitmap = true;
                    (_loc6_ = new LuminosityMaskShader()).mode = this.calculateLuminositySettings();
                    _loc3_ = new ShaderFilter(_loc6_);
                    this._mask.filters = [_loc3_];
                }
            }
        }
        if (this.layoutInvalidateDisplayListFlag) {
            this.layoutInvalidateDisplayListFlag = false;
            if (this.autoLayout && Boolean(this._layout)) {
                this._layout.updateDisplayList(param1, param2);
            }
            if (this._layout) {
                this._layout.updateScrollRect(param1, param2);
            }
        }
    }

    private function calculateLuminositySettings(): int {
        var _loc1_: int = 0;
        if (this.luminosityInvert) {
            _loc1_ += 1;
        }
        if (this.luminosityClip) {
            _loc1_ += 2;
        }
        return _loc1_;
    }

    override public function styleChanged(param1: String): void {
        var _loc3_: Number = NaN;
        super.styleChanged(param1);
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        if (!enabled && (_loc2_ || param1 == "disabledAlpha")) {
            _loc3_ = getStyle("disabledAlpha");
            if (!isNaN(_loc3_)) {
                super.alpha = _loc3_;
            }
        }
    }

    override public function globalToLocal(param1: Point): Point {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        if (this.resizeMode == ResizeMode.SCALE && mx_internal::_layoutFeatures != null) {
            _loc2_ = 0;
            _loc3_ = 0;
            mx_internal::_layoutFeatures.stretchX = 1;
            mx_internal::_layoutFeatures.stretchY = 1;
            applyComputedMatrix();
            _loc4_ = super.globalToLocal(param1);
            mx_internal::_layoutFeatures.stretchX = _loc2_;
            mx_internal::_layoutFeatures.stretchY = _loc3_;
            applyComputedMatrix();
            return _loc4_;
        }
        return super.globalToLocal(param1);
    }

    override public function localToGlobal(param1: Point): Point {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        if (this.resizeMode == ResizeMode.SCALE && mx_internal::_layoutFeatures != null) {
            _loc2_ = 0;
            _loc3_ = 0;
            mx_internal::_layoutFeatures.stretchX = 1;
            mx_internal::_layoutFeatures.stretchY = 1;
            applyComputedMatrix();
            _loc4_ = super.localToGlobal(param1);
            mx_internal::_layoutFeatures.stretchX = _loc2_;
            mx_internal::_layoutFeatures.stretchY = _loc3_;
            applyComputedMatrix();
            return _loc4_;
        }
        return super.localToGlobal(param1);
    }

    public function getHorizontalScrollPositionDelta(param1: uint): Number {
        return !!this.layout ? this.layout.getHorizontalScrollPositionDelta(param1) : 0;
    }

    public function getVerticalScrollPositionDelta(param1: uint): Number {
        return !!this.layout ? this.layout.getVerticalScrollPositionDelta(param1) : 0;
    }

    mx_internal function isElementVisible(param1: ILayoutElement): Boolean {
        return Boolean(this.layout) && this.layout.mx_internal::isElementVisible(param1);
    }

    [Bindable("propertyChange")]
    public function get contentWidth(): Number {
        return this._contentWidth;
    }

    private function setContentWidth(param1: Number): void {
        if (param1 == this._contentWidth) {
            return;
        }
        var _loc2_: Number = this._contentWidth;
        this._contentWidth = param1;
        dispatchPropertyChangeEvent("contentWidth", _loc2_, param1);
    }

    [Bindable("propertyChange")]
    public function get contentHeight(): Number {
        return this._contentHeight;
    }

    private function setContentHeight(param1: Number): void {
        if (param1 == this._contentHeight) {
            return;
        }
        var _loc2_: Number = this._contentHeight;
        this._contentHeight = param1;
        dispatchPropertyChangeEvent("contentHeight", _loc2_, param1);
    }

    public function setContentSize(param1: Number, param2: Number): void {
        if (param1 == this._contentWidth && param2 == this._contentHeight) {
            return;
        }
        this.setContentWidth(param1);
        this.setContentHeight(param2);
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
        switch (param1) {
            case MouseEvent.CLICK:
            case MouseEvent.DOUBLE_CLICK:
            case MouseEvent.MOUSE_DOWN:
            case MouseEvent.MOUSE_MOVE:
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
            case MouseEvent.ROLL_OUT:
            case MouseEvent.ROLL_OVER:
            case MouseEvent.MOUSE_UP:
            case MouseEvent.MOUSE_WHEEL:
            case TouchEvent.TOUCH_BEGIN:
            case TouchEvent.TOUCH_END:
            case TouchEvent.TOUCH_MOVE:
            case TouchEvent.TOUCH_OUT:
            case TouchEvent.TOUCH_OVER:
            case TouchEvent.TOUCH_ROLL_OUT:
            case TouchEvent.TOUCH_ROLL_OVER:
            case TouchEvent.TOUCH_TAP:
            case GestureEvent.GESTURE_TWO_FINGER_TAP:
            case PressAndTapGestureEvent.GESTURE_PRESS_AND_TAP:
            case TransformGestureEvent.GESTURE_PAN:
            case TransformGestureEvent.GESTURE_ROTATE:
            case TransformGestureEvent.GESTURE_SWIPE:
            case TransformGestureEvent.GESTURE_ZOOM:
                if (this.mouseEventReferenceCount++ == 0) {
                    this.mx_internal::hasMouseListeners = true;
                    break;
                }
        }
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
        switch (param1) {
            case MouseEvent.CLICK:
            case MouseEvent.DOUBLE_CLICK:
            case MouseEvent.MOUSE_DOWN:
            case MouseEvent.MOUSE_MOVE:
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
            case MouseEvent.ROLL_OUT:
            case MouseEvent.ROLL_OVER:
            case MouseEvent.MOUSE_UP:
            case MouseEvent.MOUSE_WHEEL:
            case TouchEvent.TOUCH_BEGIN:
            case TouchEvent.TOUCH_END:
            case TouchEvent.TOUCH_MOVE:
            case TouchEvent.TOUCH_OUT:
            case TouchEvent.TOUCH_OVER:
            case TouchEvent.TOUCH_ROLL_OUT:
            case TouchEvent.TOUCH_ROLL_OVER:
            case TouchEvent.TOUCH_TAP:
            case GestureEvent.GESTURE_TWO_FINGER_TAP:
            case PressAndTapGestureEvent.GESTURE_PRESS_AND_TAP:
            case TransformGestureEvent.GESTURE_PAN:
            case TransformGestureEvent.GESTURE_ROTATE:
            case TransformGestureEvent.GESTURE_SWIPE:
            case TransformGestureEvent.GESTURE_ZOOM:
                if (--this.mouseEventReferenceCount == 0) {
                    this.mx_internal::hasMouseListeners = false;
                    break;
                }
        }
    }

    mx_internal function $addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
    }

    mx_internal function $removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
    }

    override public function get focusPane(): Sprite {
        return this._focusPane;
    }

    override public function set focusPane(param1: Sprite): void {
        if (param1) {
            this.overlay.addDisplayObject(param1, OverlayDepth.FOCUS_PANE);
            param1.x = 0;
            param1.y = 0;
            param1.scrollRect = null;
            this._focusPane = param1;
        } else {
            this.overlay.removeDisplayObject(this._focusPane);
            this._focusPane = null;
        }
    }

    public function get numElements(): int {
        return -1;
    }

    public function getElementAt(param1: int): IVisualElement {
        return null;
    }

    public function getVirtualElementAt(param1: int, param2: Number = NaN, param3: Number = NaN): IVisualElement {
        return this.getElementAt(param1);
    }

    public function getElementIndex(param1: IVisualElement): int {
        return -1;
    }

    public function containsElement(param1: IVisualElement): Boolean {
        while (param1) {
            if (param1 == this) {
                return true;
            }
            if (!(param1.parent is IVisualElement)) {
                return false;
            }
            param1 = IVisualElement(param1.parent);
        }
        return false;
    }

    override public function get mask(): DisplayObject {
        return this._mask;
    }

    override public function set mask(param1: DisplayObject): void {
        if (this._mask !== param1) {
            if (Boolean(this._mask) && this._mask.parent === this) {
                this.overlay.removeDisplayObject(this._mask);
            }
            this._mask = param1;
            this.mx_internal::maskChanged = true;
            this.invalidateDisplayList();
        }
        super.mask = param1;
    }

    [Bindable("propertyChange")]
    public function get maskType(): String {
        return this._maskType;
    }

    public function set maskType(param1: String): void {
        if (this._maskType != param1) {
            this._maskType = param1;
            this.maskTypeChanged = true;
            this.invalidateDisplayList();
        }
    }

    public function get luminosityInvert(): Boolean {
        return this._luminosityInvert;
    }

    public function set luminosityInvert(param1: Boolean): void {
        if (this._luminosityInvert == param1) {
            return;
        }
        this._luminosityInvert = param1;
        this.luminositySettingsChanged = true;
        this.invalidateDisplayList();
    }

    public function get luminosityClip(): Boolean {
        return this._luminosityClip;
    }

    public function set luminosityClip(param1: Boolean): void {
        if (this._luminosityClip == param1) {
            return;
        }
        this._luminosityClip = param1;
        this.luminositySettingsChanged = true;
        this.invalidateDisplayList();
    }

    public function set verticalScrollPosition(param1: Number): void {
        var _loc2_: Object = this.verticalScrollPosition;
        if (_loc2_ !== param1) {
            this._1010846676verticalScrollPosition = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalScrollPosition", _loc2_, param1));
            }
        }
    }

    public function set horizontalScrollPosition(param1: Number): void {
        var _loc2_: Object = this.horizontalScrollPosition;
        if (_loc2_ !== param1) {
            this._754184102horizontalScrollPosition = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalScrollPosition", _loc2_, param1));
            }
        }
    }
}
}
