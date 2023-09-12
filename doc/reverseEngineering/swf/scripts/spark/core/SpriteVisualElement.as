package spark.core {

import flash.display.BlendMode;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.PerspectiveProjection;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Transform;
import flash.geom.Vector3D;

import mx.core.AdvancedLayoutFeatures;
import mx.core.DesignLayer;
import mx.core.FlexSprite;
import mx.core.IFlexModule;
import mx.core.IFlexModuleFactory;
import mx.core.IInvalidating;
import mx.core.ILayoutDirectionElement;
import mx.core.IMXMLObject;
import mx.core.IUIComponent;
import mx.core.IUITextField;
import mx.core.IVisualElement;
import mx.core.LayoutDirection;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.filters.BaseFilter;
import mx.filters.IBitmapFilter;
import mx.geom.Transform;
import mx.geom.TransformOffsets;
import mx.graphics.shaderClasses.ColorBurnShader;
import mx.graphics.shaderClasses.ColorDodgeShader;
import mx.graphics.shaderClasses.ColorShader;
import mx.graphics.shaderClasses.ExclusionShader;
import mx.graphics.shaderClasses.HueShader;
import mx.graphics.shaderClasses.LuminosityShader;
import mx.graphics.shaderClasses.SaturationShader;
import mx.graphics.shaderClasses.SoftLightShader;
import mx.managers.ILayoutManagerClient;
import mx.utils.MatrixUtil;
import mx.utils.TransformUtil;

import spark.components.ResizeMode;
import spark.utils.MaskUtil;

public class SpriteVisualElement extends FlexSprite implements IVisualElement, IMXMLObject, IFlexModule {

    private static const DEFAULT_MAX_WIDTH: Number = 10000;

    private static const DEFAULT_MAX_HEIGHT: Number = 10000;


    mx_internal var nestedSpriteVisualElement: Boolean;

    private var naturalWidth: Number;

    private var naturalHeight: Number;

    private var _layoutFeatures: AdvancedLayoutFeatures;

    private var hasDeltaIdentityTransform: Boolean = true;

    private var _transform: flash.geom.Transform;

    private var _alpha: Number = 1;

    private var _effectiveAlpha: Number = 1;

    private var _baseline: Object;

    private var _blendMode: String = "auto";

    private var _bottom: Object;

    private var _filters: Array;

    private var _explicitHeight: Number = NaN;

    private var _height: Number = 0;

    private var _explicitMinHeight: Number = NaN;

    private var _explicitMaxHeight: Number = NaN;

    private var _horizontalCenter: Object;

    private var _includeInLayout: Boolean = true;

    private var _depth: Number = 0;

    private var _left: Object;

    private var _id: String;

    private var _luminosityInvert: Boolean = false;

    private var _luminosityClip: Boolean = false;

    private var _moduleFactory: IFlexModuleFactory;

    private var _owner: DisplayObjectContainer;

    private var _designLayer: DesignLayer;

    private var _mask: DisplayObject;

    mx_internal var maskChanged: Boolean;

    private var _maskType: String = "clip";

    private var maskTypeChanged: Boolean;

    private var originalMaskFilters: Array;

    mx_internal var _percentHeight: Number;

    mx_internal var _percentWidth: Number;

    private var _right: Object;

    private var _top: Object;

    private var _verticalCenter: Object;

    private var _visible: Boolean = true;

    private var _explicitWidth: Number = NaN;

    private var _width: Number = 0;

    private var _explicitMinWidth: Number = NaN;

    private var _explicitMaxWidth: Number = NaN;

    private var _viewWidth: Number = NaN;

    private var _viewHeight: Number = NaN;

    private var _resizeMode: String = "scale";

    private var _layoutDirection: String = null;

    public function SpriteVisualElement() {
        super();
        this.measure();
    }

    private function initAdvancedLayoutFeatures(): AdvancedLayoutFeatures {
        var _loc1_: AdvancedLayoutFeatures = new AdvancedLayoutFeatures();
        this.hasDeltaIdentityTransform = false;
        _loc1_.layoutScaleX = this.scaleX;
        _loc1_.layoutScaleY = this.scaleY;
        _loc1_.layoutScaleZ = this.scaleZ;
        _loc1_.layoutRotationX = this.rotationX;
        _loc1_.layoutRotationY = this.rotationY;
        _loc1_.layoutRotationZ = this.rotation;
        _loc1_.layoutX = this.x;
        _loc1_.layoutY = this.y;
        _loc1_.layoutZ = this.z;
        _loc1_.layoutWidth = this._width;
        this._layoutFeatures = _loc1_;
        this.invalidateTransform();
        return _loc1_;
    }

    private function invalidateTransform(): void {
        if (Boolean(this._layoutFeatures) && this._layoutFeatures.updatePending == false) {
            this._layoutFeatures.updatePending = true;
            this.applyComputedMatrix();
        }
    }

    private function applyComputedMatrix(): void {
        this._layoutFeatures.updatePending = false;
        if (this._layoutFeatures.is3D) {
            super.transform.matrix3D = this._layoutFeatures.computedMatrix3D;
        } else {
            super.transform.matrix = this._layoutFeatures.computedMatrix;
        }
    }

    protected function nonDeltaLayoutMatrix(): Matrix {
        if (this.hasDeltaIdentityTransform) {
            return null;
        }
        if (this._layoutFeatures != null) {
            return this._layoutFeatures.layoutMatrix;
        }
        return MatrixUtil.composeMatrix(this.x, this.y, 1, 1, this.rotation, 0, 0);
    }

    private function setActualSize(param1: Number, param2: Number): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        if (this._width != param1 && Boolean(this._layoutFeatures)) {
            this._layoutFeatures.layoutWidth = param1;
            this.invalidateTransform();
        }
        this._width = param1;
        this._height = param2;
        if (this.resizeMode == ResizeMode.NO_SCALE) {
            if (this._layoutFeatures) {
                this._layoutFeatures.stretchX = 1;
                this._layoutFeatures.stretchY = 1;
                this.invalidateTransform();
            }
        } else {
            _loc3_ = isNaN(this._viewWidth) ? this.naturalWidth : this._viewWidth;
            _loc4_ = isNaN(this._viewHeight) ? this.naturalHeight : this._viewHeight;
            _loc5_ = _loc3_ != 0 ? this._width / _loc3_ : 1;
            _loc6_ = _loc4_ != 0 ? this._height / _loc4_ : 1;
            if (_loc5_ != 1 || _loc6_ != 1 || Boolean(this._layoutFeatures)) {
                if (this._layoutFeatures == null) {
                    this.initAdvancedLayoutFeatures();
                }
                this._layoutFeatures.stretchX = _loc5_;
                this._layoutFeatures.stretchY = _loc6_;
                this.invalidateTransform();
            }
        }
    }

    private function move(param1: Number, param2: Number): void {
        if (this._layoutFeatures == null) {
            super.x = param1;
            super.y = param2;
        } else {
            this._layoutFeatures.layoutX = param1;
            this._layoutFeatures.layoutY = param2;
            this.invalidateTransform();
        }
    }

    private function measure(): void {
        var _loc1_: Rectangle = getBounds(this);
        this.naturalWidth = Math.max(0, _loc1_.right);
        this.naturalHeight = Math.max(0, _loc1_.bottom);
        if (isNaN(this._explicitWidth)) {
            this._width = this.naturalWidth;
        }
        if (isNaN(this._explicitHeight)) {
            this._height = this.naturalHeight;
        }
    }

    protected function invalidateSize(): void {
        var _loc3_: * = null;
        var _loc1_: Number = this.naturalWidth;
        var _loc2_: Number = this.naturalHeight;
        this.measure();
        if (_loc1_ != this.naturalWidth || _loc2_ != this.naturalHeight) {
            _loc3_ = this.parent;
            while (this.mx_internal::nestedSpriteVisualElement) {
                if (_loc3_ is SpriteVisualElement || _loc3_ == null || _loc3_.parent == null) {
                    break;
                }
                _loc3_ = _loc3_.parent;
            }
            if (_loc3_ is SpriteVisualElement) {
                SpriteVisualElement(_loc3_).invalidateSize();
            } else {
                this.invalidateParentSizeAndDisplayList();
            }
        }
    }

    public function get postLayoutTransformOffsets(): TransformOffsets {
        return this._layoutFeatures == null ? null : this._layoutFeatures.postLayoutTransformOffsets;
    }

    public function set postLayoutTransformOffsets(param1: TransformOffsets): void {
        if (param1 != null && this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        if (this._layoutFeatures.postLayoutTransformOffsets != null) {
            this._layoutFeatures.postLayoutTransformOffsets.removeEventListener(Event.CHANGE, this.transformOffsetsChangedHandler);
        }
        this._layoutFeatures.postLayoutTransformOffsets = param1;
        if (this._layoutFeatures.postLayoutTransformOffsets != null) {
            this._layoutFeatures.postLayoutTransformOffsets.addEventListener(Event.CHANGE, this.transformOffsetsChangedHandler);
        }
    }

    override public function get alpha(): Number {
        return int(this._alpha * 256) / 256;
    }

    override public function set alpha(param1: Number): void {
        if (this._alpha != param1) {
            this._alpha = param1;
            if (this.designLayer) {
                param1 *= this.designLayer.effectiveAlpha;
            }
            super.alpha = param1;
            if (this._blendMode == "auto") {
                if (param1 > 0 && param1 < 1 && (this._effectiveAlpha == 0 || this._effectiveAlpha == 1)) {
                    super.blendMode = BlendMode.LAYER;
                } else if ((param1 == 0 || param1 == 1) && (this._effectiveAlpha > 0 && this._effectiveAlpha < 1)) {
                    super.blendMode = BlendMode.NORMAL;
                }
            }
            this._effectiveAlpha = param1;
        }
    }

    public function get baseline(): Object {
        return this._baseline;
    }

    public function set baseline(param1: Object): void {
        if (this._baseline == param1) {
            return;
        }
        this._baseline = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get baselinePosition(): Number {
        return 0;
    }

    override public function get blendMode(): String {
        return this._blendMode;
    }

    override public function set blendMode(param1: String): void {
        if (param1 == this._blendMode) {
            return;
        }
        this._blendMode = param1;
        if (param1 == "color") {
            blendShader = new ColorShader();
        } else if (param1 == "colordodge") {
            blendShader = new ColorDodgeShader();
        } else if (param1 == "colorburn") {
            blendShader = new ColorBurnShader();
        } else if (param1 == "exclusion") {
            blendShader = new ExclusionShader();
        } else if (param1 == "hue") {
            blendShader = new HueShader();
        } else if (param1 == "luminosity") {
            blendShader = new LuminosityShader();
        } else if (param1 == "saturation") {
            blendShader = new SaturationShader();
        } else if (param1 == "softlight") {
            blendShader = new SoftLightShader();
        } else if (param1 == "auto") {
            if (this.alpha == 0 || this.alpha == 1) {
                super.blendMode = BlendMode.NORMAL;
            } else {
                super.blendMode = BlendMode.LAYER;
            }
        } else {
            super.blendMode = param1;
        }
    }

    public function get bottom(): Object {
        return this._bottom;
    }

    public function set bottom(param1: Object): void {
        if (this._bottom == param1) {
            return;
        }
        this._bottom = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get filters(): Array {
        return !!this._filters ? this._filters : super.filters;
    }

    override public function set filters(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (this._filters) {
            _loc2_ = this._filters.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                if (_loc4_ = this._filters[_loc3_] as IEventDispatcher) {
                    _loc4_.removeEventListener(BaseFilter.CHANGE, this.filterChangeHandler);
                }
                _loc3_++;
            }
        }
        this._filters = param1;
        var _loc5_: * = [];
        if (this._filters) {
            _loc2_ = this._filters.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                if (this._filters[_loc3_] is IBitmapFilter) {
                    if (_loc4_ = this._filters[_loc3_] as IEventDispatcher) {
                        _loc4_.addEventListener(BaseFilter.CHANGE, this.filterChangeHandler);
                    }
                    _loc5_.push(IBitmapFilter(this._filters[_loc3_]).clone());
                } else {
                    _loc5_.push(this._filters[_loc3_]);
                }
                _loc3_++;
            }
        }
        super.filters = _loc5_;
    }

    override public function get height(): Number {
        return this._height;
    }

    override public function set height(param1: Number): void {
        this._height = param1;
        this.setActualSize(this._width, this._height);
        if (this._explicitHeight == param1) {
            return;
        }
        this._explicitHeight = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get minHeight(): Number {
        if (!isNaN(this._explicitMinHeight)) {
            return this._explicitMinHeight;
        }
        return this.resizeMode == ResizeMode.SCALE ? 0 : this.preferredHeight;
    }

    public function set minHeight(param1: Number): void {
        if (this._explicitMinHeight == param1) {
            return;
        }
        this._explicitMinHeight = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get maxHeight(): Number {
        if (!isNaN(this._explicitMaxHeight)) {
            return this._explicitMaxHeight;
        }
        return DEFAULT_MAX_HEIGHT;
    }

    public function set maxHeight(param1: Number): void {
        if (this._explicitMaxHeight == param1) {
            return;
        }
        this._explicitMaxHeight = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get horizontalCenter(): Object {
        return this._horizontalCenter;
    }

    public function set horizontalCenter(param1: Object): void {
        if (this._horizontalCenter == param1) {
            return;
        }
        this._horizontalCenter = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get includeInLayout(): Boolean {
        return this._includeInLayout;
    }

    public function set includeInLayout(param1: Boolean): void {
        if (this._includeInLayout == param1) {
            return;
        }
        this._includeInLayout = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get depth(): Number {
        return this._depth;
    }

    public function set depth(param1: Number): void {
        if (param1 == this._depth) {
            return;
        }
        this._depth = param1;
        if (parent != null && "invalidateLayering" in parent && parent["invalidateLayering"] is Function) {
            parent["invalidateLayering"]();
        }
    }

    public function get left(): Object {
        return this._left;
    }

    public function set left(param1: Object): void {
        if (this._left == param1) {
            return;
        }
        this._left = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get id(): String {
        return this._id;
    }

    public function set id(param1: String): void {
        this._id = param1;
    }

    public function get luminosityInvert(): Boolean {
        return this._luminosityInvert;
    }

    public function set luminosityInvert(param1: Boolean): void {
        this._luminosityInvert = param1;
    }

    public function get luminosityClip(): Boolean {
        return this._luminosityClip;
    }

    public function set luminosityClip(param1: Boolean): void {
        this._luminosityClip = param1;
    }

    public function get moduleFactory(): IFlexModuleFactory {
        return this._moduleFactory;
    }

    public function set moduleFactory(param1: IFlexModuleFactory): void {
        this.setModuleFactoryInChildrenOf(this, param1);
        this._moduleFactory = param1;
    }

    private function setModuleFactoryInChildrenOf(param1: DisplayObjectContainer, param2: IFlexModuleFactory): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: int = param1.numChildren;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = param1.getChildAt(_loc4_)) is IFlexModule) {
                if ((_loc6_ = IFlexModule(_loc5_)).moduleFactory == null || _loc6_.moduleFactory == this._moduleFactory) {
                    _loc6_.moduleFactory = param2;
                }
            } else if (_loc5_ is DisplayObjectContainer) {
                this.setModuleFactoryInChildrenOf(DisplayObjectContainer(_loc5_), param2);
            }
            _loc4_++;
        }
    }

    public function get owner(): DisplayObjectContainer {
        return !!this._owner ? this._owner : parent;
    }

    public function set owner(param1: DisplayObjectContainer): void {
        this._owner = param1;
    }

    public function get designLayer(): DesignLayer {
        return this._designLayer;
    }

    public function set designLayer(param1: DesignLayer): void {
        if (this._designLayer) {
            this._designLayer.removeEventListener("layerPropertyChange", this.layer_PropertyChange, false);
        }
        this._designLayer = param1;
        if (this._designLayer) {
            this._designLayer.addEventListener("layerPropertyChange", this.layer_PropertyChange, false, 0, true);
        }
        super.alpha = !!this._designLayer ? this._alpha * this._designLayer.effectiveAlpha : this._alpha;
        super.visible = !!this._designLayer ? this._visible && this._designLayer.effectiveVisibility : this._visible;
    }

    override public function get mask(): DisplayObject {
        return this._mask;
    }

    override public function set mask(param1: DisplayObject): void {
        if (this._mask !== param1) {
            if (Boolean(this._mask) && this._mask.parent === this) {
                removeChild(this._mask);
            }
            this._mask = param1;
            this.mx_internal::maskChanged = true;
            this.applyMask();
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
            this.applyMask();
        }
    }

    public function get percentHeight(): Number {
        return this.mx_internal::_percentHeight;
    }

    public function set percentHeight(param1: Number): void {
        if (this.mx_internal::_percentHeight == param1) {
            return;
        }
        this.mx_internal::_percentHeight = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get percentWidth(): Number {
        return this.mx_internal::_percentWidth;
    }

    public function set percentWidth(param1: Number): void {
        if (this.mx_internal::_percentWidth == param1) {
            return;
        }
        this.mx_internal::_percentWidth = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get right(): Object {
        return this._right;
    }

    public function set right(param1: Object): void {
        if (this._right == param1) {
            return;
        }
        this._right = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get x(): Number {
        return this._layoutFeatures == null ? super.x : this._layoutFeatures.layoutX;
    }

    override public function set x(param1: Number): void {
        if (this.x == param1) {
            return;
        }
        this.move(param1, this.y);
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get y(): Number {
        return this._layoutFeatures == null ? super.y : this._layoutFeatures.layoutY;
    }

    override public function set y(param1: Number): void {
        if (this.y == param1) {
            return;
        }
        this.move(this.x, param1);
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get z(): Number {
        return this._layoutFeatures == null ? super.z : this._layoutFeatures.layoutZ;
    }

    override public function set z(param1: Number): void {
        if (this.z == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.hasDeltaIdentityTransform = false;
        this._layoutFeatures.layoutZ = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotation(): Number {
        return this._layoutFeatures == null ? super.rotation : this._layoutFeatures.layoutRotationZ;
    }

    override public function set rotation(param1: Number): void {
        if (this.rotation == param1) {
            return;
        }
        this.hasDeltaIdentityTransform = false;
        if (this._layoutFeatures == null) {
            super.rotation = MatrixUtil.clampRotation(param1);
        } else {
            this._layoutFeatures.layoutRotationZ = param1;
        }
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotationX(): Number {
        return this._layoutFeatures == null ? super.rotationX : this._layoutFeatures.layoutRotationX;
    }

    override public function set rotationX(param1: Number): void {
        if (this.rotationX == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.layoutRotationX = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotationY(): Number {
        return this._layoutFeatures == null ? super.rotationY : this._layoutFeatures.layoutRotationY;
    }

    override public function set rotationY(param1: Number): void {
        if (this.rotationY == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.layoutRotationY = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotationZ(): Number {
        return this.rotation;
    }

    override public function set rotationZ(param1: Number): void {
        this.rotation = param1;
    }

    override public function get scaleX(): Number {
        return this._layoutFeatures == null ? 1 : this._layoutFeatures.layoutScaleX;
    }

    override public function set scaleX(param1: Number): void {
        if (param1 == this.scaleX) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.hasDeltaIdentityTransform = false;
        this._layoutFeatures.layoutScaleX = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get scaleY(): Number {
        return this._layoutFeatures == null ? 1 : this._layoutFeatures.layoutScaleY;
    }

    override public function set scaleY(param1: Number): void {
        if (param1 == this.scaleY) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.hasDeltaIdentityTransform = false;
        this._layoutFeatures.layoutScaleY = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get scaleZ(): Number {
        return this._layoutFeatures == null ? super.scaleZ : this._layoutFeatures.layoutScaleZ;
    }

    override public function set scaleZ(param1: Number): void {
        if (this.scaleZ == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.hasDeltaIdentityTransform = false;
        this._layoutFeatures.layoutScaleZ = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get top(): Object {
        return this._top;
    }

    public function set top(param1: Object): void {
        if (this._top == param1) {
            return;
        }
        this._top = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get verticalCenter(): Object {
        return this._verticalCenter;
    }

    public function set verticalCenter(param1: Object): void {
        if (this._verticalCenter == param1) {
            return;
        }
        this._verticalCenter = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get visible(): Boolean {
        return this._visible;
    }

    override public function set visible(param1: Boolean): void {
        this._visible = param1;
        if (Boolean(this.designLayer) && !this.designLayer.effectiveVisibility) {
            param1 = false;
        }
        if (super.visible == param1) {
            return;
        }
        super.visible = param1;
    }

    override public function get width(): Number {
        return this._width;
    }

    override public function set width(param1: Number): void {
        this._width = param1;
        this.setActualSize(this._width, this._height);
        if (this._explicitWidth == param1) {
            return;
        }
        this._explicitWidth = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get minWidth(): Number {
        if (!isNaN(this._explicitMinWidth)) {
            return this._explicitMinWidth;
        }
        return this.resizeMode == ResizeMode.SCALE ? 0 : this.preferredWidth;
    }

    public function set minWidth(param1: Number): void {
        if (this._explicitMinWidth == param1) {
            return;
        }
        this._explicitMinWidth = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    public function get maxWidth(): Number {
        if (!isNaN(this._explicitMaxWidth)) {
            return this._explicitMaxWidth;
        }
        return DEFAULT_MAX_WIDTH;
    }

    public function set maxWidth(param1: Number): void {
        if (this._explicitMaxWidth == param1) {
            return;
        }
        this._explicitMaxWidth = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    protected function set viewWidth(param1: Number): void {
        this._viewWidth = param1;
    }

    protected function set viewHeight(param1: Number): void {
        this._viewHeight = param1;
    }

    public function get resizeMode(): String {
        return this._resizeMode;
    }

    public function set resizeMode(param1: String): void {
        if (this._resizeMode == param1) {
            return;
        }
        this._resizeMode = param1;
        this.setActualSize(this._width, this._height);
    }

    override public function get transform(): flash.geom.Transform {
        if (this._transform == null) {
            this.setTransform(new mx.geom.Transform(this));
        }
        return this._transform;
    }

    override public function set transform(param1: flash.geom.Transform): void {
        var _loc2_: * = param1.matrix;
        var _loc3_: * = param1.matrix3D;
        var _loc4_: ColorTransform = param1.colorTransform;
        var _loc5_: PerspectiveProjection = param1.perspectiveProjection;
        var _loc6_: mx.geom.Transform;
        if (_loc6_ = param1 as mx.geom.Transform) {
            if (!_loc6_.mx_internal::applyMatrix) {
                _loc2_ = null;
            }
            if (!_loc6_.mx_internal::applyMatrix3D) {
                _loc3_ = null;
            }
        }
        this.setTransform(param1);
        if (_loc2_ != null) {
            this.setLayoutMatrix(_loc2_.clone(), true);
        } else if (_loc3_ != null) {
            this.setLayoutMatrix3D(_loc3_.clone(), true);
        }
        super.transform.colorTransform = _loc4_;
        super.transform.perspectiveProjection = _loc5_;
    }

    private function setTransform(param1: flash.geom.Transform): void {
        var _loc2_: mx.geom.Transform = this._transform as mx.geom.Transform;
        if (_loc2_) {
            _loc2_.target = null;
        }
        var _loc3_: mx.geom.Transform = param1 as mx.geom.Transform;
        if (_loc3_) {
            _loc3_.target = this;
        }
        this._transform = param1;
    }

    mx_internal function get $transform(): flash.geom.Transform {
        return super.transform;
    }

    public function get transformX(): Number {
        return this._layoutFeatures == null ? 0 : this._layoutFeatures.transformX;
    }

    public function set transformX(param1: Number): void {
        if (this.transformX == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.transformX = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get transformY(): Number {
        return this._layoutFeatures == null ? 0 : this._layoutFeatures.transformY;
    }

    public function set transformY(param1: Number): void {
        if (this.transformY == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.transformY = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get transformZ(): Number {
        return this._layoutFeatures == null ? 0 : this._layoutFeatures.transformZ;
    }

    public function set transformZ(param1: Number): void {
        if (this.transformZ == param1) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.transformZ = param1;
        this.invalidateTransform();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get layoutDirection(): String {
        if (this._layoutDirection != null) {
            return this._layoutDirection;
        }
        var _loc1_: ILayoutDirectionElement = parent as ILayoutDirectionElement;
        return !!_loc1_ ? _loc1_.layoutDirection : LayoutDirection.LTR;
    }

    public function set layoutDirection(param1: String): void {
        if (this._layoutDirection == param1) {
            return;
        }
        this._layoutDirection = param1;
        this.invalidateLayoutDirection();
    }

    public function invalidateLayoutDirection(): void {
        var _loc1_: ILayoutDirectionElement = parent as ILayoutDirectionElement;
        if (!_loc1_) {
            return;
        }
        var _loc2_: Boolean = _loc1_.layoutDirection != null && this._layoutDirection != null && this._layoutDirection != _loc1_.layoutDirection;
        if (!!this._layoutFeatures ? _loc2_ != this._layoutFeatures.mirror : _loc2_) {
            if (this._layoutFeatures == null) {
                this.initAdvancedLayoutFeatures();
            }
            this._layoutFeatures.mirror = _loc2_;
            this.invalidateTransform();
            this.invalidateParentSizeAndDisplayList();
        }
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        this.mx_internal::addingChild(param1);
        super.addChild(param1);
        this.mx_internal::childAdded(param1);
        return param1;
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        this.mx_internal::addingChild(param1);
        super.addChildAt(param1, param2);
        this.mx_internal::childAdded(param1);
        return param1;
    }

    mx_internal function addingChild(param1: DisplayObject): void {
        if (param1 is IUIComponent) {
            IUIComponent(param1).parentChanged(this);
        }
        if (param1 is ILayoutManagerClient) {
            ILayoutManagerClient(param1).nestLevel = 2;
        } else if (param1 is IUITextField) {
            IUITextField(param1).nestLevel = 2;
        }
    }

    mx_internal function childAdded(param1: DisplayObject): void {
        if (param1 is IUIComponent) {
            IUIComponent(param1).initialize();
        }
    }

    override public function globalToLocal(param1: Point): Point {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        if (this.resizeMode == ResizeMode.SCALE && this._layoutFeatures != null) {
            _loc2_ = this._layoutFeatures.stretchX;
            _loc3_ = this._layoutFeatures.stretchY;
            this._layoutFeatures.stretchX = 1;
            this._layoutFeatures.stretchY = 1;
            this.applyComputedMatrix();
            _loc4_ = super.globalToLocal(param1);
            this._layoutFeatures.stretchX = _loc2_;
            this._layoutFeatures.stretchY = _loc3_;
            this.applyComputedMatrix();
            return _loc4_;
        }
        return super.globalToLocal(param1);
    }

    override public function localToGlobal(param1: Point): Point {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        if (this.resizeMode == ResizeMode.SCALE && this._layoutFeatures != null) {
            _loc2_ = this._layoutFeatures.stretchX;
            _loc3_ = this._layoutFeatures.stretchY;
            this._layoutFeatures.stretchX = 1;
            this._layoutFeatures.stretchY = 1;
            this.applyComputedMatrix();
            _loc4_ = super.localToGlobal(param1);
            this._layoutFeatures.stretchX = _loc2_;
            this._layoutFeatures.stretchY = _loc3_;
            this.applyComputedMatrix();
            return _loc4_;
        }
        return super.localToGlobal(param1);
    }

    public function initialized(param1: Object, param2: String): void {
        this.id = param2;
    }

    private function transformOffsetsChangedHandler(param1: Event): void {
        this.invalidateTransform();
    }

    private function get preferredWidth(): Number {
        if (!isNaN(this._explicitWidth)) {
            return this._explicitWidth;
        }
        if (!isNaN(this._viewWidth)) {
            return this._viewWidth;
        }
        return this.naturalWidth;
    }

    private function get preferredHeight(): Number {
        if (!isNaN(this._explicitHeight)) {
            return this._explicitHeight;
        }
        if (!isNaN(this._viewHeight)) {
            return this._viewHeight;
        }
        return this.naturalHeight;
    }

    protected function layer_PropertyChange(param1: PropertyChangeEvent): void {
        var _loc2_: Boolean = false;
        var _loc3_: Number = NaN;
        switch (param1.property) {
            case "effectiveVisibility":
                _loc2_ = Boolean(param1.newValue) && this._visible;
                if (_loc2_ != super.visible) {
                    super.visible = _loc2_;
                    break;
                }
                break;
            case "effectiveAlpha":
                _loc3_ = Number(param1.newValue) * this._alpha;
                if (_loc3_ != super.alpha) {
                    super.alpha = _loc3_;
                    break;
                }
        }
    }

    private function filterChangeHandler(param1: Event): void {
        this.filters = this._filters;
    }

    public function getLayoutBoundsX(param1: Boolean = true): Number {
        var _loc2_: Matrix = param1 ? this.nonDeltaLayoutMatrix() : null;
        if (!_loc2_) {
            return this.x;
        }
        var _loc3_: Point = new Point(0, 0);
        MatrixUtil.transformBounds(this.width, this.height, _loc2_, _loc3_);
        return _loc3_.x;
    }

    public function getLayoutBoundsY(param1: Boolean = true): Number {
        var _loc2_: Matrix = param1 ? this.nonDeltaLayoutMatrix() : null;
        if (!_loc2_) {
            return this.y;
        }
        var _loc3_: Point = new Point(0, 0);
        MatrixUtil.transformBounds(this.width, this.height, _loc2_, _loc3_);
        return _loc3_.y;
    }

    public function getLayoutBoundsWidth(param1: Boolean = true): Number {
        return this.transformWidthForLayout(this.width, this.height, param1);
    }

    public function getLayoutBoundsHeight(param1: Boolean = true): Number {
        return this.transformHeightForLayout(this.width, this.height, param1);
    }

    public function getMaxBoundsWidth(param1: Boolean = true): Number {
        return this.transformWidthForLayout(this.maxWidth, this.maxHeight, param1);
    }

    public function getMaxBoundsHeight(param1: Boolean = true): Number {
        return this.transformHeightForLayout(this.maxWidth, this.maxHeight, param1);
    }

    public function getMinBoundsWidth(param1: Boolean = true): Number {
        return this.transformWidthForLayout(this.minWidth, this.minHeight, param1);
    }

    public function getMinBoundsHeight(param1: Boolean = true): Number {
        return this.transformHeightForLayout(this.minWidth, this.minHeight, param1);
    }

    public function getPreferredBoundsWidth(param1: Boolean = true): Number {
        return this.transformWidthForLayout(this.preferredWidth, this.preferredHeight, param1);
    }

    public function getPreferredBoundsHeight(param1: Boolean = true): Number {
        return this.transformHeightForLayout(this.preferredWidth, this.preferredHeight, param1);
    }

    public function getBoundsXAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return this.x;
    }

    public function getBoundsYAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return this.y;
    }

    protected function invalidateParentSizeAndDisplayList(): void {
        if (!this.includeInLayout) {
            return;
        }
        var _loc1_: IInvalidating = parent as IInvalidating;
        if (!_loc1_) {
            return;
        }
        _loc1_.invalidateSize();
        _loc1_.invalidateDisplayList();
    }

    public function setLayoutBoundsPosition(param1: Number, param2: Number, param3: Boolean = true): void {
        var _loc4_: Number = this.getLayoutBoundsX(param3);
        var _loc5_: Number = this.getLayoutBoundsY(param3);
        var _loc6_: Number = param1 - _loc4_;
        var _loc7_: Number = param2 - _loc5_;
        if (_loc6_ != 0 || _loc7_ != 0) {
            this.move(this.x + _loc6_, this.y + _loc7_);
        }
    }

    public function setLayoutBoundsSize(param1: Number, param2: Number, param3: Boolean = true): void {
        if (isNaN(param1)) {
            param1 = this.preferredWidth;
        }
        if (isNaN(param2)) {
            param2 = this.preferredHeight;
        }
        this.setActualSize(param1, param2);
    }

    public function getLayoutMatrix(): Matrix {
        if (this._layoutFeatures != null || super.transform.matrix == null) {
            if (this._layoutFeatures == null) {
                this.initAdvancedLayoutFeatures();
            }
            return this._layoutFeatures.layoutMatrix.clone();
        }
        return super.transform.matrix;
    }

    public function setLayoutMatrix(param1: Matrix, param2: Boolean): void {
        this.hasDeltaIdentityTransform = false;
        var _loc3_: Matrix = !!this._layoutFeatures ? this._layoutFeatures.layoutMatrix : super.transform.matrix;
        if (this._layoutFeatures == null) {
            super.transform.matrix = param1;
        } else {
            this._layoutFeatures.layoutMatrix = param1;
            this.invalidateTransform();
        }
        if (MatrixUtil.isEqual(_loc3_, !!this._layoutFeatures ? this._layoutFeatures.layoutMatrix : super.transform.matrix)) {
            return;
        }
        if (param2) {
            this.invalidateParentSizeAndDisplayList();
        }
    }

    public function get hasLayoutMatrix3D(): Boolean {
        return !!this._layoutFeatures ? this._layoutFeatures.layoutIs3D : false;
    }

    public function get is3D(): Boolean {
        return !!this._layoutFeatures ? this._layoutFeatures.is3D : false;
    }

    public function getLayoutMatrix3D(): Matrix3D {
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        return this._layoutFeatures.layoutMatrix3D.clone();
    }

    public function setLayoutMatrix3D(param1: Matrix3D, param2: Boolean): void {
        if (Boolean(this._layoutFeatures) && MatrixUtil.isEqual3D(this._layoutFeatures.layoutMatrix3D, param1)) {
            return;
        }
        if (this._layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._layoutFeatures.layoutMatrix3D = param1;
        this.invalidateTransform();
        if (param2) {
            this.invalidateParentSizeAndDisplayList();
        }
    }

    public function transformAround(param1: Vector3D, param2: Vector3D = null, param3: Vector3D = null, param4: Vector3D = null, param5: Vector3D = null, param6: Vector3D = null, param7: Vector3D = null, param8: Boolean = true): void {
        var _loc9_: Boolean = false;
        if (!param8) {
            _loc9_ = this._includeInLayout;
            this._includeInLayout = false;
        }
        TransformUtil.transformAround(this, param1, param2, param3, param4, param5, param6, param7, this._layoutFeatures, this.initAdvancedLayoutFeatures);
        if (this._layoutFeatures != null) {
            this.invalidateTransform();
            this.invalidateParentSizeAndDisplayList();
        }
        if (!param8) {
            this._includeInLayout = _loc9_;
        }
    }

    public function transformPointToParent(param1: Vector3D, param2: Vector3D, param3: Vector3D): void {
        TransformUtil.transformPointToParent(this, param1, param2, param3, this._layoutFeatures);
    }

    protected function transformWidthForLayout(param1: Number, param2: Number, param3: Boolean = true): Number {
        var _loc4_: * = null;
        if (param3) {
            if (_loc4_ = this.nonDeltaLayoutMatrix()) {
                param1 = MatrixUtil.transformSize(param1, param2, _loc4_).x;
            }
        }
        return param1;
    }

    protected function transformHeightForLayout(param1: Number, param2: Number, param3: Boolean = true): Number {
        var _loc4_: * = null;
        if (param3) {
            if (_loc4_ = this.nonDeltaLayoutMatrix()) {
                param2 = MatrixUtil.transformSize(param1, param2, _loc4_).y;
            }
        }
        return param2;
    }

    private function applyMask(): void {
        if (this.mx_internal::maskChanged) {
            this.mx_internal::maskChanged = false;
            if (this._mask) {
                this.maskTypeChanged = true;
                if (!this._mask.parent) {
                    this.addChild(this._mask);
                    MaskUtil.mx_internal::applyMask(this._mask, null);
                }
            }
        }
        if (this.maskTypeChanged) {
            this.maskTypeChanged = false;
            if (this._mask) {
                MaskUtil.mx_internal::applyMaskType(this._mask, this._maskType, this.luminosityInvert, this.luminosityClip, this);
            }
        }
    }
}
}
