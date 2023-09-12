package mx.controls.sliderClasses {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;

import mx.core.IFlexDisplayObject;
import mx.core.IUIComponent;
import mx.core.LayoutDirection;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.effects.Tween;
import mx.events.FlexEvent;
import mx.events.SliderEvent;
import mx.events.SliderEventClickTarget;
import mx.formatters.NumberFormatter;
import mx.styles.ISimpleStyleClient;
import mx.styles.StyleProxy;

public class Slider extends UIComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static var createAccessibilityImplementation: Function;


    private var track: IFlexDisplayObject;

    private var thumbs: UIComponent;

    private var thumbsChanged: Boolean = true;

    private var ticks: UIComponent;

    private var ticksChanged: Boolean = false;

    private var labelObjects: UIComponent;

    private var highlightTrack: IFlexDisplayObject;

    mx_internal var innerSlider: UIComponent;

    private var trackHitArea: UIComponent;

    mx_internal var dataTip: SliderDataTip;

    private var trackHighlightChanged: Boolean = true;

    private var initValues: Boolean = true;

    private var dataFormatter: NumberFormatter;

    private var interactionClickTarget: String;

    private var labelStyleChanged: Boolean = false;

    mx_internal var keyInteraction: Boolean = false;

    private var _enabled: Boolean;

    private var enabledChanged: Boolean = false;

    private var _tabIndex: Number;

    private var tabIndexChanged: Boolean;

    public var allowThumbOverlap: Boolean = false;

    public var allowTrackClick: Boolean = true;

    private var _dataTipFormatFunction: Function;

    private var _direction: String = "horizontal";

    private var directionChanged: Boolean = false;

    private var _labels: Array;

    private var labelsChanged: Boolean = false;

    public var liveDragging: Boolean = false;

    private var _maximum: Number = 10;

    private var _minimum: Number = 0;

    private var minimumSet: Boolean = false;

    public var showDataTip: Boolean = true;

    private var _thumbClass: Class;

    private var _sliderDataTipClass: Class;

    private var _snapInterval: Number = 0;

    private var snapIntervalPrecision: int = -1;

    private var snapIntervalChanged: Boolean = false;

    private var _thumbCount: int = 1;

    private var _tickInterval: Number = 0;

    private var _tickValues: Array;

    private var _values: Array;

    private var valuesChanged: Boolean = false;

    public function Slider() {
        this._labels = [];
        this._thumbClass = SliderThumb;
        this._sliderDataTipClass = SliderDataTip;
        this._tickValues = [];
        this._values = [0, 0];
        super();
    }

    override public function get baselinePosition(): Number {
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        return int(0.75 * height);
    }

    override public function get enabled(): Boolean {
        return this._enabled;
    }

    override public function set enabled(param1: Boolean): void {
        this._enabled = param1;
        this.enabledChanged = true;
        invalidateProperties();
    }

    override public function set tabIndex(param1: int): void {
        super.tabIndex = param1;
        this._tabIndex = param1;
        this.tabIndexChanged = true;
        invalidateProperties();
    }

    public function get dataTipFormatFunction(): Function {
        return this._dataTipFormatFunction;
    }

    public function set dataTipFormatFunction(param1: Function): void {
        this._dataTipFormatFunction = param1;
    }

    public function get direction(): String {
        return this._direction;
    }

    public function set direction(param1: String): void {
        this._direction = param1;
        this.directionChanged = true;
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
    }

    public function get labels(): Array {
        return this._labels;
    }

    public function set labels(param1: Array): void {
        this._labels = param1;
        this.labelsChanged = true;
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
    }

    public function get maximum(): Number {
        return this._maximum;
    }

    public function set maximum(param1: Number): void {
        this._maximum = param1;
        this.ticksChanged = true;
        if (!this.initValues) {
            this.valuesChanged = true;
        }
        invalidateProperties();
        invalidateDisplayList();
    }

    public function get minimum(): Number {
        return this._minimum;
    }

    public function set minimum(param1: Number): void {
        this._minimum = param1;
        this.ticksChanged = true;
        if (!this.initValues) {
            this.valuesChanged = true;
        }
        invalidateProperties();
        invalidateDisplayList();
    }

    public function get sliderThumbClass(): Class {
        return this._thumbClass;
    }

    public function set sliderThumbClass(param1: Class): void {
        this._thumbClass = param1;
        this.thumbsChanged = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    public function get sliderDataTipClass(): Class {
        return this._sliderDataTipClass;
    }

    public function set sliderDataTipClass(param1: Class): void {
        this._sliderDataTipClass = param1;
        invalidateProperties();
    }

    public function get snapInterval(): Number {
        return this._snapInterval;
    }

    public function set snapInterval(param1: Number): void {
        this._snapInterval = param1;
        var _loc2_: Array = new String(1 + param1).split(".");
        if (_loc2_.length == 2) {
            this.snapIntervalPrecision = _loc2_[1].length;
        } else {
            this.snapIntervalPrecision = -1;
        }
        if (!isNaN(param1) && param1 != 0) {
            this.snapIntervalChanged = true;
            invalidateProperties();
            invalidateDisplayList();
        }
    }

    public function get thumbCount(): int {
        return this._thumbCount;
    }

    public function set thumbCount(param1: int): void {
        var _loc2_: int = param1 > 2 ? 2 : param1;
        _loc2_ = param1 < 1 ? 1 : param1;
        if (_loc2_ != this._thumbCount) {
            this._thumbCount = _loc2_;
            this.thumbsChanged = true;
            this.initValues = true;
            invalidateProperties();
            invalidateDisplayList();
        }
    }

    protected function get thumbStyleFilters(): Object {
        return null;
    }

    public function get tickInterval(): Number {
        return this._tickInterval;
    }

    public function set tickInterval(param1: Number): void {
        this._tickInterval = param1;
        this.ticksChanged = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    public function get tickValues(): Array {
        return this._tickValues;
    }

    public function set tickValues(param1: Array): void {
        this._tickValues = param1;
        this.ticksChanged = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    [Bindable("valueCommit")]
    [Bindable("change")]
    public function get value(): Number {
        return this._values[0];
    }

    public function set value(param1: Number): void {
        this.setValueAt(param1, 0, true);
        this.valuesChanged = true;
        this.minimumSet = true;
        invalidateProperties();
        invalidateDisplayList();
        dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
    }

    [Bindable("change")]
    public function get values(): Array {
        return this._values;
    }

    public function set values(param1: Array): void {
        this._values = param1;
        this.valuesChanged = true;
        this.minimumSet = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            Slider.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function createChildren(): void {
        super.createChildren();
        if (!this.mx_internal::innerSlider) {
            this.mx_internal::innerSlider = new UIComponent();
            UIComponent(this.mx_internal::innerSlider).tabChildren = true;
            addChild(this.mx_internal::innerSlider);
        }
        this.createBackgroundTrack();
        if (!this.trackHitArea) {
            this.trackHitArea = new UIComponent();
            this.mx_internal::innerSlider.addChild(this.trackHitArea);
            this.trackHitArea.addEventListener(MouseEvent.MOUSE_DOWN, this.track_mouseDownHandler);
        }
        invalidateProperties();
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        super.styleChanged(param1);
        if (param1 == "showTrackHighlight" || _loc2_) {
            this.trackHighlightChanged = true;
            invalidateProperties();
        }
        if (param1 == "trackHighlightSkin" || _loc2_) {
            if (Boolean(this.mx_internal::innerSlider) && Boolean(this.highlightTrack)) {
                this.mx_internal::innerSlider.removeChild(DisplayObject(this.highlightTrack));
                this.highlightTrack = null;
            }
            this.trackHighlightChanged = true;
            invalidateProperties();
        }
        if (param1 == "labelStyleName" || _loc2_) {
            this.labelStyleChanged = true;
            invalidateProperties();
        }
        if (param1 == "trackMargin" || _loc2_) {
            invalidateSize();
        }
        if (param1 == "trackSkin" || _loc2_) {
            if (this.track) {
                this.mx_internal::innerSlider.removeChild(DisplayObject(this.track));
                this.track = null;
                this.createBackgroundTrack();
            }
        }
        invalidateDisplayList();
    }

    override protected function commitProperties(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        var _loc3_: * = false;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: Number = NaN;
        super.commitProperties();
        if (this.trackHighlightChanged) {
            this.trackHighlightChanged = false;
            if (getStyle("showTrackHighlight")) {
                this.createHighlightTrack();
            } else if (this.highlightTrack) {
                this.mx_internal::innerSlider.removeChild(DisplayObject(this.highlightTrack));
                this.highlightTrack = null;
            }
        }
        if (this.directionChanged) {
            this.directionChanged = false;
            _loc3_ = this._direction == SliderDirection.HORIZONTAL;
            if (_loc3_) {
                DisplayObject(this.mx_internal::innerSlider).rotation = 0;
            } else {
                DisplayObject(this.mx_internal::innerSlider).rotation = -90;
                this.mx_internal::innerSlider.y = unscaledHeight;
            }
            if (this.labelObjects) {
                _loc4_ = this.labelObjects.numChildren - 1;
                while (_loc4_ >= 0) {
                    (_loc5_ = SliderLabel(this.labelObjects.getChildAt(_loc4_))).rotation = _loc3_ ? 0 : 90;
                    _loc4_--;
                }
            }
        }
        if (this.labelStyleChanged && !this.labelsChanged) {
            this.labelStyleChanged = false;
            if (this.labelObjects) {
                _loc6_ = getStyle("labelStyleName");
                _loc1_ = this.labelObjects.numChildren;
                _loc2_ = 0;
                while (_loc2_ < _loc1_) {
                    ISimpleStyleClient(this.labelObjects.getChildAt(_loc2_)).styleName = _loc6_;
                    _loc2_++;
                }
            }
        }
        if (this.ticksChanged) {
            this.ticksChanged = false;
            this.createTicks();
        }
        if (this.labelsChanged) {
            this.labelsChanged = false;
            this.createLabels();
        }
        if (this.thumbsChanged) {
            this.thumbsChanged = false;
            this.createThumbs();
        }
        if (this.initValues) {
            this.initValues = false;
            if (!this.valuesChanged) {
                _loc7_ = this.minimum;
                _loc1_ = this._thumbCount;
                _loc2_ = 0;
                while (_loc2_ < _loc1_) {
                    this._values[_loc2_] = _loc7_;
                    this.setValueAt(_loc7_, _loc2_);
                    if (Boolean(this._snapInterval) && this._snapInterval != 0) {
                        _loc7_ += this.snapInterval;
                    } else {
                        _loc7_++;
                    }
                    _loc2_++;
                }
                this.snapIntervalChanged = false;
            }
        }
        if (this.snapIntervalChanged) {
            this.snapIntervalChanged = false;
            if (!this.valuesChanged) {
                _loc1_ = this.thumbs.numChildren;
                _loc2_ = 0;
                while (_loc2_ < _loc1_) {
                    this.setValueAt(this.mx_internal::getValueFromX(SliderThumb(this.thumbs.getChildAt(_loc2_)).xPosition), _loc2_);
                    _loc2_++;
                }
            }
        }
        if (this.valuesChanged) {
            this.valuesChanged = false;
            _loc1_ = this._thumbCount;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                this.setValueAt(this.mx_internal::getValueFromX(this.mx_internal::getXFromValue(Math.min(Math.max(this.values[_loc2_], this.minimum), this.maximum))), _loc2_);
                _loc2_++;
            }
        }
        if (this.enabledChanged) {
            this.enabledChanged = false;
            _loc1_ = this.thumbs.numChildren;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                SliderThumb(this.thumbs.getChildAt(_loc2_)).enabled = this.enabled;
                _loc2_++;
            }
            _loc1_ = !!this.labelObjects ? this.labelObjects.numChildren : 0;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                SliderLabel(this.labelObjects.getChildAt(_loc2_)).enabled = this.enabled;
                _loc2_++;
            }
            if (this.track is IUIComponent) {
                IUIComponent(this.track).enabled = this.enabled;
            }
            if (Boolean(this.highlightTrack) && this.highlightTrack is IUIComponent) {
                IUIComponent(this.highlightTrack).enabled = this.enabled;
            }
        }
        if (this.tabIndexChanged) {
            this.tabIndexChanged = false;
            _loc1_ = this.thumbs.numChildren;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                SliderThumb(this.thumbs.getChildAt(_loc2_)).tabIndex = this._tabIndex;
                _loc2_++;
            }
        }
    }

    override protected function measure(): void {
        var _loc4_: Number = NaN;
        var _loc6_: Number = NaN;
        super.measure();
        var _loc1_: * = this.direction == SliderDirection.HORIZONTAL;
        var _loc2_: int = !!this.labelObjects ? this.labelObjects.numChildren : 0;
        var _loc3_: Number = getStyle("trackMargin");
        _loc4_ = DEFAULT_MEASURED_WIDTH;
        if (!isNaN(_loc3_)) {
            if (_loc2_ > 0) {
                _loc4_ += _loc1_ ? Number(SliderLabel(this.labelObjects.getChildAt(0)).getExplicitOrMeasuredWidth()) / 2 : Number(SliderLabel(this.labelObjects.getChildAt(0)).getExplicitOrMeasuredHeight()) / 2;
            }
            if (_loc2_ > 1) {
                _loc4_ += _loc1_ ? Number(SliderLabel(this.labelObjects.getChildAt(_loc2_ - 1)).getExplicitOrMeasuredWidth()) / 2 : Number(SliderLabel(this.labelObjects.getChildAt(_loc2_ - 1)).getExplicitOrMeasuredHeight()) / 2;
            }
        }
        var _loc5_: Object;
        _loc6_ = Number((_loc5_ = this.getComponentBounds()).lower) - Number(_loc5_.upper);
        measuredMinWidth = measuredWidth = _loc1_ ? _loc4_ : _loc6_;
        measuredMinHeight = measuredHeight = _loc1_ ? _loc6_ : _loc4_;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc11_: Number = NaN;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc25_: * = null;
        super.updateDisplayList(param1, param2);
        var _loc3_: * = this._direction == SliderDirection.HORIZONTAL;
        var _loc4_: int = !!this.labelObjects ? this.labelObjects.numChildren : 0;
        var _loc5_: int = !!this.thumbs ? this.thumbs.numChildren : 0;
        var _loc6_: Number = getStyle("trackMargin");
        var _loc7_: Number = 6;
        var _loc8_: SliderThumb = SliderThumb(this.thumbs.getChildAt(0));
        if (Boolean(this.thumbs) && Boolean(_loc8_)) {
            _loc7_ = _loc8_.getExplicitOrMeasuredWidth();
        }
        var _loc9_: Number;
        var _loc10_: Number = _loc9_ = _loc7_ / 2;
        var _loc12_: Number = 0;
        if (_loc4_ > 0) {
            _loc23_ = SliderLabel(this.labelObjects.getChildAt(0));
            _loc12_ = _loc3_ ? _loc23_.getExplicitOrMeasuredWidth() : _loc23_.getExplicitOrMeasuredHeight();
        }
        var _loc13_: Number = 0;
        if (_loc4_ > 1) {
            _loc24_ = SliderLabel(this.labelObjects.getChildAt(_loc4_ - 1));
            _loc13_ = _loc3_ ? _loc24_.getExplicitOrMeasuredWidth() : _loc24_.getExplicitOrMeasuredHeight();
        }
        if (!isNaN(_loc6_)) {
            _loc11_ = _loc6_;
        } else {
            _loc11_ = (_loc12_ + _loc13_) / 2;
        }
        if (_loc4_ > 0) {
            if (!isNaN(_loc6_)) {
                _loc9_ = Math.max(_loc9_, _loc11_ / (_loc4_ > 1 ? 2 : 1));
            } else {
                _loc9_ = Math.max(_loc9_, _loc12_ / 2);
            }
        } else {
            _loc9_ = Math.max(_loc9_, _loc11_ / 2);
        }
        var _loc14_: Object = this.getComponentBounds();
        var _loc15_: Number = ((_loc3_ ? param2 : param1) - (Number(_loc14_.lower) - Number(_loc14_.upper))) / 2 - Number(_loc14_.upper);
        this.track.move(Math.round(_loc9_), Math.round(_loc15_));
        this.track.setActualSize((_loc3_ ? param1 : param2) - _loc9_ * 2, this.track.height);
        var _loc16_: Number = this.track.y + (Number(this.track.height) - _loc8_.getExplicitOrMeasuredHeight()) / 2 + getStyle("thumbOffset");
        var _loc17_: int = this._thumbCount;
        var _loc18_: int = 0;
        while (_loc18_ < _loc17_) {
            _loc25_ = SliderThumb(this.thumbs.getChildAt(_loc18_));
            _loc25_.move(_loc25_.x, _loc16_);
            _loc25_.visible = true;
            _loc25_.setActualSize(_loc25_.getExplicitOrMeasuredWidth(), _loc25_.getExplicitOrMeasuredHeight());
            _loc18_++;
        }
        var _loc19_: Graphics = this.trackHitArea.graphics;
        var _loc20_: Number = 0;
        if (this._tickInterval > 0 || this._tickValues && this._tickValues.length > 0) {
            _loc20_ = getStyle("tickLength");
        }
        _loc19_.clear();
        _loc19_.beginFill(0, 0);
        var _loc21_: Number;
        var _loc22_: Number = !(_loc21_ = _loc8_.getExplicitOrMeasuredHeight()) ? 0 : _loc21_ / 2;
        _loc19_.drawRect(this.track.x, Number(this.track.y) - _loc22_ - _loc20_, this.track.width, this.track.height + _loc21_ + _loc20_);
        _loc19_.endFill();
        if (this._direction != SliderDirection.HORIZONTAL) {
            this.mx_internal::innerSlider.y = param2;
        }
        this.layoutTicks();
        this.layoutLabels();
        this.setPosFromValue();
        this.mx_internal::drawTrackHighlight();
    }

    private function createBackgroundTrack(): void {
        var _loc1_: * = null;
        if (!this.track) {
            _loc1_ = getStyle("trackSkin");
            this.track = new _loc1_();
            if (this.track is ISimpleStyleClient) {
                ISimpleStyleClient(this.track).styleName = this;
            }
            if (this.track is IUIComponent) {
                IUIComponent(this.track).enabled = this.enabled;
            }
            this.mx_internal::innerSlider.addChildAt(DisplayObject(this.track), 0);
        }
    }

    private function createHighlightTrack(): void {
        var _loc2_: * = null;
        var _loc1_: Boolean = getStyle("showTrackHighlight");
        if (!this.highlightTrack && _loc1_) {
            _loc2_ = getStyle("trackHighlightSkin");
            this.highlightTrack = new _loc2_();
            if (this.highlightTrack is ISimpleStyleClient) {
                ISimpleStyleClient(this.highlightTrack).styleName = this;
            }
            if (this.highlightTrack is IUIComponent) {
                IUIComponent(this.highlightTrack).enabled = this.enabled;
            }
            this.mx_internal::innerSlider.addChildAt(DisplayObject(this.highlightTrack), this.mx_internal::innerSlider.getChildIndex(DisplayObject(this.track)) + 1);
        }
    }

    private function createThumbs(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        if (this.thumbs) {
            _loc1_ = this.thumbs.numChildren;
            _loc2_ = _loc1_ - 1;
            while (_loc2_ >= 0) {
                this.thumbs.removeChildAt(_loc2_);
                _loc2_--;
            }
        } else {
            this.thumbs = new UIComponent();
            this.thumbs.tabChildren = true;
            this.thumbs.tabEnabled = false;
            this.thumbs.tabFocusEnabled = false;
            this.mx_internal::innerSlider.addChild(this.thumbs);
        }
        _loc1_ = this._thumbCount;
        _loc2_ = 0;
        while (_loc2_ < _loc1_) {
            _loc3_ = SliderThumb(new this._thumbClass());
            _loc3_.owner = this;
            _loc3_.styleName = new StyleProxy(this, this.thumbStyleFilters);
            _loc3_.mx_internal::thumbIndex = _loc2_;
            _loc3_.visible = true;
            _loc3_.enabled = this.enabled;
            _loc3_.mx_internal::upSkinName = "thumbUpSkin";
            _loc3_.mx_internal::downSkinName = "thumbDownSkin";
            _loc3_.mx_internal::disabledSkinName = "thumbDisabledSkin";
            _loc3_.mx_internal::overSkinName = "thumbOverSkin";
            _loc3_.mx_internal::skinName = "thumbSkin";
            this.thumbs.addChild(_loc3_);
            _loc3_.addEventListener(FocusEvent.FOCUS_IN, this.thumb_focusInHandler);
            _loc3_.addEventListener(FocusEvent.FOCUS_OUT, this.thumb_focusOutHandler);
            _loc2_++;
        }
    }

    private function createLabels(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        if (this.labelObjects) {
            _loc2_ = this.labelObjects.numChildren - 1;
            while (_loc2_ >= 0) {
                this.labelObjects.removeChildAt(_loc2_);
                _loc2_--;
            }
        } else {
            this.labelObjects = new UIComponent();
            this.mx_internal::innerSlider.addChildAt(this.labelObjects, this.mx_internal::innerSlider.getChildIndex(this.trackHitArea));
        }
        if (this._labels) {
            _loc3_ = this._labels.length;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                _loc1_ = new SliderLabel();
                _loc1_.text = this._labels[_loc4_] is String ? this._labels[_loc4_] : this._labels[_loc4_].toString();
                if (this._direction != SliderDirection.HORIZONTAL) {
                    _loc1_.rotation = 90;
                }
                if (_loc5_ = getStyle("labelStyleName")) {
                    _loc1_.styleName = _loc5_;
                }
                this.labelObjects.addChild(_loc1_);
                _loc4_++;
            }
        }
    }

    private function createTicks(): void {
        if (!this.ticks) {
            this.ticks = new UIComponent();
            this.mx_internal::innerSlider.addChild(this.ticks);
        }
    }

    private function getComponentBounds(): Object {
        var _loc3_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: int = 0;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc1_: * = this.direction == SliderDirection.HORIZONTAL;
        var _loc2_: int = !!this.labelObjects ? this.labelObjects.numChildren : 0;
        var _loc4_: Number = 0;
        var _loc6_: Number = 0;
        var _loc7_: Number = Number(this.track.height);
        if (_loc2_ > 0) {
            _loc8_ = SliderLabel(this.labelObjects.getChildAt(0));
            if (_loc1_) {
                _loc4_ = _loc8_.getExplicitOrMeasuredHeight();
            } else {
                _loc10_ = 0;
                while (_loc10_ < _loc2_) {
                    _loc8_ = SliderLabel(this.labelObjects.getChildAt(_loc10_));
                    _loc4_ = Math.max(_loc4_, _loc8_.getExplicitOrMeasuredWidth());
                    _loc10_++;
                }
            }
            _loc9_ = getStyle("labelOffset");
            _loc3_ = _loc9_ - (_loc9_ > 0 ? 0 : _loc4_);
            _loc6_ = Math.min(_loc6_, _loc3_);
            _loc7_ = Math.max(_loc7_, _loc9_ + (_loc9_ > 0 ? _loc4_ : 0));
        }
        if (this.ticks) {
            _loc11_ = getStyle("tickLength");
            _loc12_ = getStyle("tickOffset");
            _loc6_ = Math.min(_loc6_, _loc12_ - _loc11_);
            _loc7_ = Math.max(_loc7_, _loc12_);
        }
        if (this.thumbs.numChildren > 0) {
            _loc5_ = (Number(this.track.height) - Number(SliderThumb(this.thumbs.getChildAt(0)).getExplicitOrMeasuredHeight())) / 2 + getStyle("thumbOffset");
            _loc6_ = Math.min(_loc6_, _loc5_);
            _loc7_ = Math.max(_loc7_, _loc5_ + SliderThumb(this.thumbs.getChildAt(0)).getExplicitOrMeasuredHeight());
        }
        return {
            "lower": _loc7_,
            "upper": _loc6_
        };
    }

    private function layoutTicks(): void {
        var _loc1_: * = null;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Boolean = false;
        var _loc8_: int = 0;
        var _loc9_: Number = NaN;
        if (this.ticks) {
            _loc1_ = this.ticks.graphics;
            _loc2_ = getStyle("tickLength");
            _loc3_ = getStyle("tickOffset");
            _loc4_ = getStyle("tickThickness");
            _loc6_ = getStyle("tickColor");
            _loc7_ = Boolean(this._tickValues) && this._tickValues.length > 0 ? true : false;
            _loc8_ = 0;
            _loc9_ = _loc7_ ? Number(this._tickValues[_loc8_++]) : this.minimum;
            _loc1_.clear();
            if (this._tickInterval > 0 || _loc7_) {
                _loc1_.lineStyle(_loc4_, _loc6_, 100);
                do {
                    _loc5_ = Math.round(this.mx_internal::getXFromValue(_loc9_));
                    _loc1_.moveTo(_loc5_, _loc2_);
                    _loc1_.lineTo(_loc5_, 0);
                }
                while ((_loc9_ = _loc7_ ? (_loc8_ < this._tickValues.length ? Number(this._tickValues[_loc8_++]) : NaN) : this._tickInterval + _loc9_) < this.maximum || _loc7_ && _loc8_ < this._tickValues.length);

                if (!_loc7_ || _loc9_ == this.maximum) {
                    _loc5_ = this.track.x + this.track.width - 1;
                    _loc1_.moveTo(_loc5_, _loc2_);
                    _loc1_.lineTo(_loc5_, 0);
                }
                this.ticks.y = Math.round(this.track.y + _loc3_ - _loc2_);
            }
        }
    }

    private function layoutLabels(): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc1_: Number = !!this.labelObjects ? this.labelObjects.numChildren : 0;
        if (_loc1_ > 0) {
            _loc3_ = this.track.width / (_loc1_ - 1);
            _loc2_ = Math.max((this._direction == SliderDirection.HORIZONTAL ? unscaledWidth : unscaledHeight) - Number(this.track.width), SliderThumb(this.thumbs.getChildAt(0)).getExplicitOrMeasuredWidth());
            _loc5_ = Number(this.track.x);
            _loc7_ = 0;
            while (_loc7_ < _loc1_) {
                _loc6_ = this.labelObjects.getChildAt(_loc7_);
                _loc6_.setActualSize(_loc6_.getExplicitOrMeasuredWidth(), _loc6_.getExplicitOrMeasuredHeight());
                _loc8_ = Number(this.track.y) - Number(_loc6_.height) + getStyle("labelOffset");
                if (this._direction == SliderDirection.HORIZONTAL) {
                    _loc4_ = Number(_loc6_.getExplicitOrMeasuredWidth()) / 2;
                    if (_loc7_ == 0) {
                        _loc4_ = Math.min(_loc4_, _loc2_ / (_loc1_ > Number(1) ? Number(2) : Number(1)));
                    } else if (_loc7_ == _loc1_ - 1) {
                        _loc4_ = Math.max(_loc4_, Number(_loc6_.getExplicitOrMeasuredWidth()) - _loc2_ / 2);
                    }
                    _loc6_.move(_loc5_ - _loc4_, _loc8_);
                } else {
                    _loc9_ = getStyle("labelOffset");
                    _loc4_ = Number(_loc6_.getExplicitOrMeasuredHeight()) / 2;
                    if (_loc7_ == 0) {
                        _loc4_ = Math.max(_loc4_, Number(_loc6_.getExplicitOrMeasuredHeight()) - _loc2_ / (_loc1_ > Number(1) ? Number(2) : Number(1)));
                    } else if (_loc7_ == _loc1_ - 1) {
                        _loc4_ = Math.min(_loc4_, _loc2_ / 2);
                    }
                    _loc6_.move(_loc5_ + _loc4_, this.track.y + _loc9_ + (_loc9_ > 0 ? 0 : -Number(_loc6_.getExplicitOrMeasuredWidth())));
                }
                _loc5_ += _loc3_;
                _loc7_++;
            }
        }
    }

    mx_internal function drawTrackHighlight(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.highlightTrack) {
            _loc3_ = SliderThumb(this.thumbs.getChildAt(0));
            if (this._thumbCount > 1) {
                _loc1_ = _loc3_.xPosition;
                _loc2_ = (_loc4_ = SliderThumb(this.thumbs.getChildAt(1))).xPosition - _loc3_.xPosition;
            } else {
                _loc1_ = Number(this.track.x);
                _loc2_ = _loc3_.xPosition - _loc1_;
            }
            this.highlightTrack.move(_loc1_, this.track.y + 1);
            this.highlightTrack.setActualSize(_loc2_ > 0 ? _loc2_ : 0, this.highlightTrack.height);
        }
    }

    mx_internal function onThumbPress(param1: Object): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.showDataTip) {
            this.dataFormatter = new NumberFormatter();
            this.dataFormatter.precision = getStyle("dataTipPrecision");
            if (!this.mx_internal::dataTip) {
                this.mx_internal::dataTip = SliderDataTip(new this.sliderDataTipClass());
                systemManager.toolTipChildren.addChild(this.mx_internal::dataTip);
                if (_loc4_ = getStyle("dataTipStyleName")) {
                    this.mx_internal::dataTip.styleName = _loc4_;
                }
            }
            if (this._dataTipFormatFunction != null) {
                _loc3_ = this._dataTipFormatFunction(this.mx_internal::getValueFromX(param1.xPosition));
            } else {
                _loc3_ = this.dataFormatter.format(this.mx_internal::getValueFromX(param1.xPosition));
            }
            this.mx_internal::dataTip.text = _loc3_;
            this.mx_internal::dataTip.validateNow();
            this.mx_internal::dataTip.setActualSize(this.mx_internal::dataTip.getExplicitOrMeasuredWidth(), this.mx_internal::dataTip.getExplicitOrMeasuredHeight());
            this.positionDataTip(param1);
        }
        this.mx_internal::keyInteraction = false;
        var _loc2_: SliderEvent = new SliderEvent(SliderEvent.THUMB_PRESS);
        _loc2_.value = this.mx_internal::getValueFromX(param1.xPosition);
        _loc2_.thumbIndex = param1.thumbIndex;
        dispatchEvent(_loc2_);
    }

    mx_internal function onThumbRelease(param1: Object): void {
        this.interactionClickTarget = SliderEventClickTarget.THUMB;
        this.destroyDataTip();
        this.setValueFromPos(param1.thumbIndex);
        this.dataFormatter = null;
        var _loc2_: SliderEvent = new SliderEvent(SliderEvent.THUMB_RELEASE);
        _loc2_.value = this.mx_internal::getValueFromX(param1.xPosition);
        _loc2_.thumbIndex = param1.thumbIndex;
        dispatchEvent(_loc2_);
    }

    mx_internal function onThumbMove(param1: Object): void {
        var _loc2_: Number = this.mx_internal::getValueFromX(param1.xPosition);
        if (this.showDataTip) {
            this.mx_internal::dataTip.text = this._dataTipFormatFunction != null ? this._dataTipFormatFunction(_loc2_) : this.dataFormatter.format(_loc2_);
            this.mx_internal::dataTip.setActualSize(this.mx_internal::dataTip.getExplicitOrMeasuredWidth(), this.mx_internal::dataTip.getExplicitOrMeasuredHeight());
            this.positionDataTip(param1);
        }
        if (this.liveDragging) {
            this.interactionClickTarget = SliderEventClickTarget.THUMB;
            this.setValueAt(_loc2_, param1.thumbIndex);
        }
        var _loc3_: SliderEvent = new SliderEvent(SliderEvent.THUMB_DRAG);
        _loc3_.value = _loc2_;
        _loc3_.thumbIndex = param1.thumbIndex;
        dispatchEvent(_loc3_);
    }

    private function positionDataTip(param1: Object): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = Number(param1.x);
        var _loc5_: Number = Number(param1.y);
        var _loc6_: String = getStyle("dataTipPlacement");
        var _loc7_: Number = getStyle("dataTipOffset");
        if (layoutDirection == LayoutDirection.RTL) {
            if (_loc6_ == "left") {
                _loc6_ = "right";
            } else if (_loc6_ == "right") {
                _loc6_ = "left";
            }
        }
        if (this._direction == SliderDirection.HORIZONTAL) {
            _loc2_ = _loc4_;
            _loc3_ = _loc5_;
            if (_loc6_ == "left") {
                _loc2_ -= _loc7_ + this.mx_internal::dataTip.width;
                _loc3_ += (Number(param1.height) - this.mx_internal::dataTip.height) / 2;
            } else if (_loc6_ == "right") {
                _loc2_ += _loc7_ + param1.width;
                _loc3_ += (Number(param1.height) - this.mx_internal::dataTip.height) / 2;
            } else if (_loc6_ == "top") {
                _loc3_ -= _loc7_ + this.mx_internal::dataTip.height;
                _loc2_ -= (this.mx_internal::dataTip.width - Number(param1.width)) / 2;
            } else if (_loc6_ == "bottom") {
                _loc3_ += _loc7_ + param1.height;
                _loc2_ -= (this.mx_internal::dataTip.width - Number(param1.width)) / 2;
            }
        } else {
            _loc2_ = _loc5_;
            _loc3_ = unscaledHeight - _loc4_ - (this.mx_internal::dataTip.height + param1.width) / 2;
            if (_loc6_ == "left") {
                _loc2_ -= _loc7_ + this.mx_internal::dataTip.width;
            } else if (_loc6_ == "right") {
                _loc2_ += _loc7_ + param1.height;
            } else if (_loc6_ == "top") {
                _loc3_ -= _loc7_ + (this.mx_internal::dataTip.height + param1.width) / 2;
                _loc2_ -= (this.mx_internal::dataTip.width - Number(param1.height)) / 2;
            } else if (_loc6_ == "bottom") {
                _loc3_ += _loc7_ + (this.mx_internal::dataTip.height + param1.width) / 2;
                _loc2_ -= (this.mx_internal::dataTip.width - Number(param1.height)) / 2;
            }
        }
        if (layoutDirection == LayoutDirection.RTL) {
            _loc2_ += this.mx_internal::dataTip.width;
        }
        var _loc8_: Point = new Point(_loc2_, _loc3_);
        var _loc9_: Point = localToGlobal(_loc8_);
        _loc9_ = this.mx_internal::dataTip.parent.globalToLocal(_loc9_);
        this.mx_internal::dataTip.x = _loc9_.x < 0 ? 0 : _loc9_.x;
        this.mx_internal::dataTip.y = _loc9_.y < 0 ? 0 : _loc9_.y;
    }

    private function destroyDataTip(): void {
        if (this.mx_internal::dataTip) {
            systemManager.toolTipChildren.removeChild(this.mx_internal::dataTip);
            this.mx_internal::dataTip = null;
        }
    }

    mx_internal function getXFromValue(param1: Number): Number {
        var _loc2_: Number = NaN;
        if (param1 == this.minimum) {
            _loc2_ = Number(this.track.x);
        } else if (param1 == this.maximum) {
            _loc2_ = this.track.x + this.track.width;
        } else {
            _loc2_ = this.track.x + (param1 - this.minimum) * Number(this.track.width) / (this.maximum - this.minimum);
        }
        return _loc2_;
    }

    mx_internal function getXBounds(param1: int): Object {
        var _loc2_: Number = this.track.x + this.track.width;
        var _loc3_: Number = Number(this.track.x);
        if (this.allowThumbOverlap) {
            return {
                "max": _loc2_,
                "min": _loc3_
            };
        }
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: SliderThumb = param1 > 0 ? SliderThumb(this.thumbs.getChildAt(param1 - 1)) : null;
        var _loc7_: SliderThumb = param1 + 1 < this.thumbs.numChildren ? SliderThumb(this.thumbs.getChildAt(param1 + 1)) : null;
        if (_loc6_) {
            _loc4_ = _loc6_.xPosition + _loc6_.width / 2;
        }
        if (_loc7_) {
            _loc5_ = _loc7_.xPosition - _loc7_.width / 2;
        }
        if (isNaN(_loc4_)) {
            _loc4_ = _loc3_;
        } else {
            _loc4_ = Math.min(Math.max(_loc3_, _loc4_), _loc2_);
        }
        if (isNaN(_loc5_)) {
            _loc5_ = _loc2_;
        } else {
            _loc5_ = Math.max(Math.min(_loc2_, _loc5_), _loc3_);
        }
        return {
            "max": _loc5_,
            "min": _loc4_
        };
    }

    private function setPosFromValue(): void {
        var _loc3_: * = null;
        var _loc1_: int = this._thumbCount;
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            _loc3_ = SliderThumb(this.thumbs.getChildAt(_loc2_));
            _loc3_.xPosition = this.mx_internal::getXFromValue(this.values[_loc2_]);
            _loc2_++;
        }
    }

    mx_internal function getValueFromX(param1: Number): Number {
        var _loc2_: Number = (param1 - Number(this.track.x)) * (this.maximum - this.minimum) / Number(this.track.width) + this.minimum;
        if (_loc2_ - this.minimum <= 0.002) {
            _loc2_ = this.minimum;
        } else if (this.maximum - _loc2_ <= 0.002) {
            _loc2_ = this.maximum;
        } else if (!isNaN(this._snapInterval) && this._snapInterval != 0) {
            _loc2_ = Math.round((_loc2_ - this.minimum) / this._snapInterval) * this._snapInterval + this.minimum;
        }
        return _loc2_;
    }

    private function setValueFromPos(param1: int): void {
        var _loc2_: SliderThumb = SliderThumb(this.thumbs.getChildAt(param1));
        this.setValueAt(this.mx_internal::getValueFromX(_loc2_.xPosition), param1);
    }

    mx_internal function getSnapValue(param1: Number, param2: SliderThumb = null): Number {
        var _loc3_: Number = NaN;
        var _loc4_: Boolean = false;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (!isNaN(this._snapInterval) && this._snapInterval != 0) {
            _loc3_ = this.mx_internal::getValueFromX(param1);
            if (param2 && this.thumbs.numChildren > 1 && !this.allowThumbOverlap) {
                _loc4_ = true;
                _loc5_ = this.mx_internal::getXBounds(param2.mx_internal::thumbIndex);
                _loc6_ = param2.mx_internal::thumbIndex > 0 ? SliderThumb(this.thumbs.getChildAt(param2.mx_internal::thumbIndex - 1)) : null;
                _loc7_ = param2.mx_internal::thumbIndex + 1 < this.thumbs.numChildren ? SliderThumb(this.thumbs.getChildAt(param2.mx_internal::thumbIndex + 1)) : null;
                if (_loc6_) {
                    _loc5_.min -= _loc6_.width / 2;
                    if (_loc3_ == this.minimum) {
                        if (this.mx_internal::getValueFromX(_loc6_.xPosition - _loc6_.width / 2) != this.minimum) {
                            _loc4_ = false;
                        }
                    }
                } else if (_loc3_ == this.minimum) {
                    _loc4_ = false;
                }
                if (_loc7_) {
                    _loc5_.max += _loc7_.width / 2;
                    if (_loc3_ == this.maximum) {
                        if (this.mx_internal::getValueFromX(_loc7_.xPosition + _loc7_.width / 2) != this.maximum) {
                            _loc4_ = false;
                        }
                    }
                } else if (_loc3_ == this.maximum) {
                    _loc4_ = false;
                }
                if (_loc4_) {
                    _loc3_ = Math.min(Math.max(_loc3_, this.mx_internal::getValueFromX(Math.round(_loc5_.min)) + this._snapInterval), this.mx_internal::getValueFromX(Math.round(_loc5_.max)) - this._snapInterval);
                }
            }
            return this.mx_internal::getXFromValue(_loc3_);
        }
        return param1;
    }

    mx_internal function getSnapIntervalWidth(): Number {
        return this._snapInterval * Number(this.track.width) / (this.maximum - this.minimum);
    }

    mx_internal function updateThumbValue(param1: int): void {
        this.setValueFromPos(param1);
    }

    public function getThumbAt(param1: int): SliderThumb {
        return param1 >= 0 && param1 < this.thumbs.numChildren ? SliderThumb(this.thumbs.getChildAt(param1)) : null;
    }

    public function setThumbValueAt(param1: int, param2: Number): void {
        this.setValueAt(param2, param1, true);
        this.valuesChanged = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    private function setValueAt(param1: Number, param2: int, param3: Boolean = false): void {
        var _loc5_: Number = NaN;
        var _loc6_: * = null;
        var _loc4_: Number = Number(this._values[param2]);
        if (this.snapIntervalPrecision != -1) {
            _loc5_ = Math.pow(10, this.snapIntervalPrecision);
            param1 = Math.round(param1 * _loc5_) / _loc5_;
        }
        this._values[param2] = param1;
        if (!param3) {
            (_loc6_ = new SliderEvent(SliderEvent.CHANGE)).value = param1;
            _loc6_.thumbIndex = param2;
            _loc6_.clickTarget = this.interactionClickTarget;
            if (this.mx_internal::keyInteraction) {
                _loc6_.triggerEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
                this.mx_internal::keyInteraction = false;
            } else {
                _loc6_.triggerEvent = new MouseEvent(MouseEvent.CLICK);
            }
            if (!isNaN(_loc4_)) {
                if (Math.abs(_loc4_ - param1) > 0.002) {
                    dispatchEvent(_loc6_);
                }
            } else if (!isNaN(param1)) {
                dispatchEvent(_loc6_);
            }
        }
        invalidateDisplayList();
    }

    mx_internal function registerMouseMove(param1: Function): void {
        this.mx_internal::innerSlider.addEventListener(MouseEvent.MOUSE_MOVE, param1);
    }

    mx_internal function unRegisterMouseMove(param1: Function): void {
        this.mx_internal::innerSlider.removeEventListener(MouseEvent.MOUSE_MOVE, param1);
    }

    private function track_mouseDownHandler(param1: MouseEvent): void {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: Number = NaN;
        if (param1.target != this.trackHitArea && param1.target != this.ticks) {
            return;
        }
        if (this.enabled && this.allowTrackClick) {
            this.interactionClickTarget = SliderEventClickTarget.TRACK;
            this.mx_internal::keyInteraction = false;
            _loc2_ = new Point(param1.localX, param1.localY);
            _loc3_ = _loc2_.x;
            _loc4_ = 0;
            _loc5_ = 10000000;
            _loc6_ = this._thumbCount;
            _loc7_ = 0;
            while (_loc7_ < _loc6_) {
                if ((_loc12_ = Math.abs(Number(SliderThumb(this.thumbs.getChildAt(_loc7_)).xPosition) - _loc3_)) < _loc5_) {
                    _loc4_ = _loc7_;
                    _loc5_ = _loc12_;
                }
                _loc7_++;
            }
            _loc8_ = SliderThumb(this.thumbs.getChildAt(_loc4_));
            if (!isNaN(this._snapInterval) && this._snapInterval != 0) {
                _loc3_ = this.mx_internal::getXFromValue(this.mx_internal::getValueFromX(_loc3_));
            }
            _loc9_ = getStyle("slideDuration");
            _loc10_ = new Tween(_loc8_, _loc8_.xPosition, _loc3_, _loc9_);
            if ((_loc11_ = getStyle("slideEasingFunction") as Function) != null) {
                _loc10_.easingFunction = _loc11_;
            }
            this.mx_internal::drawTrackHighlight();
        }
    }

    private function thumb_focusInHandler(param1: FocusEvent): void {
        dispatchEvent(param1);
    }

    private function thumb_focusOutHandler(param1: FocusEvent): void {
        dispatchEvent(param1);
    }

    mx_internal function getTrackHitArea(): UIComponent {
        return this.trackHitArea;
    }
}
}
