package mx.controls {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.ProgressEvent;
import flash.events.TimerEvent;
import flash.text.TextLineMetrics;
import flash.utils.Timer;

import mx.core.IFlexDisplayObject;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IUITextField;
import mx.core.UIComponent;
import mx.core.UITextField;
import mx.core.mx_internal;
import mx.styles.ISimpleStyleClient;

public class ProgressBar extends UIComponent implements IFontContextComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";


    mx_internal var _content: UIComponent;

    mx_internal var _bar: UIComponent;

    mx_internal var _indeterminateBar: IFlexDisplayObject;

    mx_internal var _determinateBar: IFlexDisplayObject;

    mx_internal var _track: IFlexDisplayObject;

    mx_internal var _barMask: IFlexDisplayObject;

    mx_internal var _labelField: IUITextField;

    private var pollTimer: Timer;

    private var _interval: Number = 30;

    private var indeterminatePlaying: Boolean = false;

    private var stopPolledMode: Boolean = false;

    private var barSkinChanged: Boolean = false;

    private var trackSkinChanged: Boolean = false;

    private var indeterminateSkinChanged: Boolean = false;

    private var visibleChanged: Boolean = false;

    private var _conversion: Number = 1;

    private var _direction: String = "right";

    private var _indeterminate: Boolean = false;

    private var indeterminateChanged: Boolean = true;

    private var _label: String;

    private var labelOverride: String;

    private var _labelPlacement: String = "bottom";

    private var _maximum: Number = 0;

    private var _minimum: Number = 0;

    private var _mode: String = "event";

    private var modeChanged: Boolean = false;

    private var _source: Object;

    private var _stringSource: String;

    private var sourceChanged: Boolean = false;

    private var stringSourceChanged: Boolean = false;

    private var _value: Number = 0;

    public function ProgressBar() {
        super();
        this.pollTimer = new Timer(this._interval);
        cacheAsBitmap = true;
    }

    [Bindable("conversionChanged")]
    public function get conversion(): Number {
        return this._conversion;
    }

    public function set conversion(param1: Number): void {
        if (!isNaN(param1) && Number(param1) > 0 && param1 != this._conversion) {
            this._conversion = Number(param1);
            invalidateDisplayList();
            dispatchEvent(new Event("conversionChanged"));
        }
    }

    [Bindable("directionChanged")]
    public function get direction(): String {
        return this._direction;
    }

    public function set direction(param1: String): void {
        if (param1 == ProgressBarDirection.LEFT || param1 == ProgressBarDirection.RIGHT) {
            this._direction = param1;
        }
        invalidateDisplayList();
        dispatchEvent(new Event("directionChanged"));
    }

    public function get fontContext(): IFlexModuleFactory {
        return moduleFactory;
    }

    public function set fontContext(param1: IFlexModuleFactory): void {
        this.moduleFactory = param1;
    }

    [Bindable("indeterminateChanged")]
    public function get indeterminate(): Boolean {
        return this._indeterminate;
    }

    public function set indeterminate(param1: Boolean): void {
        this._indeterminate = param1;
        this.indeterminateChanged = true;
        invalidateProperties();
        invalidateDisplayList();
        dispatchEvent(new Event("indeterminateChanged"));
    }

    [Bindable("labelChanged")]
    public function get label(): String {
        return this._label;
    }

    public function set label(param1: String): void {
        this.labelOverride = param1;
        this._label = param1 != null ? param1 : resourceManager.getString("controls", "label");
        invalidateDisplayList();
        dispatchEvent(new Event("labelChanged"));
    }

    [Bindable("labelPlacementChanged")]
    public function get labelPlacement(): String {
        return this._labelPlacement;
    }

    public function set labelPlacement(param1: String): void {
        if (param1 != this._labelPlacement) {
            this._labelPlacement = param1;
        }
        invalidateSize();
        invalidateDisplayList();
        dispatchEvent(new Event("labelPlacementChanged"));
    }

    [Bindable("maximumChanged")]
    public function get maximum(): Number {
        return this._maximum;
    }

    public function set maximum(param1: Number): void {
        if (!isNaN(param1) && this._mode == ProgressBarMode.MANUAL && param1 != this._maximum) {
            this._maximum = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("maximumChanged"));
        }
    }

    [Bindable("minimumChanged")]
    public function get minimum(): Number {
        return this._minimum;
    }

    public function set minimum(param1: Number): void {
        if (!isNaN(param1) && this._mode == ProgressBarMode.MANUAL && param1 != this._minimum) {
            this._minimum = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("minimumChanged"));
        }
    }

    [Bindable("modeChanged")]
    public function get mode(): String {
        return this._mode;
    }

    public function set mode(param1: String): void {
        if (param1 != this._mode) {
            if (this._mode == ProgressBarMode.POLLED) {
                this.stopPolledMode = true;
            }
            this._mode = param1;
            this.modeChanged = true;
            this.indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
        }
    }

    [Bindable("progress")]
    public function get percentComplete(): Number {
        if (this._value < this._minimum || this._maximum < this._minimum) {
            return 0;
        }
        if (this._maximum - this._minimum == 0) {
            return 0;
        }
        var _loc1_: Number = 100 * (this._value - this._minimum) / (this._maximum - this._minimum);
        if (isNaN(_loc1_) || _loc1_ < 0) {
            return 0;
        }
        if (_loc1_ > 100) {
            return 100;
        }
        return _loc1_;
    }

    [Bindable("sourceChanged")]
    public function get source(): Object {
        return this._source;
    }

    public function set source(param1: Object): void {
        var value: Object = param1;
        if (value is String) {
            this._stringSource = String(value);
            try {
                value = document[this._stringSource];
            } catch (e: Error) {
                stringSourceChanged = true;
            }
        }
        if (Boolean(this._source) && this._source is IEventDispatcher) {
            this.removeSourceListeners();
        }
        if (value) {
            this._source = value;
            this.sourceChanged = true;
            this.modeChanged = true;
            this.indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
        } else if (this._source != null) {
            this._source = null;
            this.sourceChanged = true;
            this.indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            this.pollTimer.reset();
        }
    }

    [Bindable("change")]
    public function get value(): Number {
        return this._value;
    }

    override public function set visible(param1: Boolean): void {
        super.visible = param1;
        this.visibleChanged = true;
        invalidateDisplayList();
    }

    override protected function createChildren(): void {
        var _loc1_: * = null;
        super.createChildren();
        if (!this.mx_internal::_content) {
            this.mx_internal::_content = new UIComponent();
            addChild(this.mx_internal::_content);
        }
        if (!this.mx_internal::_bar) {
            this.mx_internal::_bar = new UIComponent();
            this.mx_internal::_content.addChild(this.mx_internal::_bar);
        }
        if (!this.mx_internal::_barMask) {
            _loc1_ = getStyle("maskSkin");
            this.mx_internal::_barMask = new _loc1_();
            this.mx_internal::_barMask.visible = true;
            this.mx_internal::_bar.addChild(DisplayObject(this.mx_internal::_barMask));
            UIComponent(this.mx_internal::_bar).mask = DisplayObject(this.mx_internal::_barMask);
        }
        if (!this.mx_internal::_labelField) {
            this.mx_internal::_labelField = IUITextField(createInFontContext(UITextField));
            this.mx_internal::_labelField.styleName = this;
            addChild(DisplayObject(this.mx_internal::_labelField));
        }
    }

    override protected function childrenCreated(): void {
        super.childrenCreated();
        this.trackSkinChanged = true;
        this.barSkinChanged = true;
        this.indeterminateSkinChanged = true;
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = false;
        super.styleChanged(param1);
        if (param1 == null || param1 == "styleName") {
            this.barSkinChanged = this.trackSkinChanged = this.indeterminateSkinChanged = true;
            _loc2_ = true;
        } else if (param1 == "barSkin") {
            this.barSkinChanged = true;
            _loc2_ = true;
        } else if (param1 == "trackSkin") {
            this.trackSkinChanged = true;
            _loc2_ = true;
        } else if (param1 == "indeterminateSkin") {
            this.indeterminateSkinChanged = true;
            _loc2_ = true;
        }
        if (_loc2_) {
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
        }
    }

    override protected function commitProperties(): void {
        var _loc1_: int = 0;
        super.commitProperties();
        if (hasFontContextChanged() && this.mx_internal::_labelField != null) {
            _loc1_ = getChildIndex(DisplayObject(this.mx_internal::_labelField));
            removeChild(DisplayObject(this.mx_internal::_labelField));
            this.mx_internal::_labelField = IUITextField(createInFontContext(UITextField));
            this.mx_internal::_labelField.styleName = this;
            addChildAt(DisplayObject(this.mx_internal::_labelField), _loc1_);
        }
        if (this.trackSkinChanged) {
            this.trackSkinChanged = false;
            this.createTrack();
        }
        if (this.barSkinChanged) {
            this.barSkinChanged = false;
            this.createBar();
        }
        if (this.indeterminateSkinChanged) {
            this.indeterminateSkinChanged = false;
            this.createIndeterminateBar();
        }
        if (this.stringSourceChanged) {
            this.stringSourceChanged = false;
            try {
                this._source = document[this._stringSource];
            } catch (e: Error) {
            }
        }
        if (this.sourceChanged) {
            this.sourceChanged = false;
            dispatchEvent(new Event("sourceChanged"));
        }
        if (this.modeChanged) {
            this.modeChanged = false;
            if (this._source) {
                if (this._mode == ProgressBarMode.EVENT) {
                    if (this._source is IEventDispatcher) {
                        this.addSourceListeners();
                    } else {
                        this._source = null;
                    }
                } else if (this._source is IEventDispatcher) {
                    this.removeSourceListeners();
                }
            }
            if (this._mode == ProgressBarMode.POLLED) {
                this.pollTimer.addEventListener(TimerEvent.TIMER, this.updatePolledHandler, false, 0, true);
                this.pollTimer.start();
            } else if (this.stopPolledMode) {
                this.stopPolledMode = false;
                this.pollTimer.removeEventListener(TimerEvent.TIMER, this.updatePolledHandler);
                this.pollTimer.reset();
            }
            dispatchEvent(new Event("modeChanged"));
        }
    }

    override protected function measure(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        super.measure();
        _loc3_ = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = getStyle("trackHeight");
        var _loc6_: Number = Number(this.mx_internal::_track.measuredWidth);
        var _loc7_: Number = isNaN(_loc5_) ? Number(this.mx_internal::_track.measuredHeight) : _loc5_;
        var _loc8_: Number = getStyle("horizontalGap");
        var _loc9_: Number = getStyle("verticalGap");
        var _loc10_: Number = getStyle("paddingLeft");
        var _loc11_: Number = getStyle("paddingRight");
        var _loc12_: Number = getStyle("paddingTop");
        var _loc13_: Number = getStyle("paddingBottom");
        var _loc14_: Number = getStyle("labelWidth");
        var _loc15_: TextLineMetrics = measureText(this.predictLabelText());
        var _loc16_: Number = isNaN(_loc14_) ? _loc15_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING : _loc14_;
        var _loc17_: Number = _loc15_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
        switch (this.labelPlacement) {
            case ProgressBarLabelPlacement.LEFT:
            case ProgressBarLabelPlacement.RIGHT:
                _loc1_ = _loc16_ + _loc6_ + _loc10_ + _loc11_ + _loc8_;
                _loc2_ = Math.max(_loc17_, _loc7_) + _loc12_ + _loc13_;
                measuredMinWidth = _loc1_;
                break;
            case ProgressBarLabelPlacement.CENTER:
                _loc1_ = Math.max(_loc16_, _loc6_) + _loc10_ + _loc11_ + _loc8_;
                _loc2_ = Math.max(_loc17_, _loc7_) + _loc12_ + _loc13_;
                measuredMinWidth = _loc16_;
                break;
            default:
                _loc1_ = Math.max(_loc16_, _loc6_) + _loc10_ + _loc11_;
                _loc2_ = _loc17_ + _loc7_ + _loc12_ + _loc13_ + _loc9_;
                measuredMinWidth = _loc16_;
        }
        measuredWidth = _loc1_;
        measuredMinHeight = measuredHeight = _loc2_;
        if (!isNaN(_loc3_)) {
            measuredMinWidth = _loc3_;
        }
        if (!isNaN(_loc4_)) {
            measuredMinHeight = _loc4_;
        }
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        super.updateDisplayList(param1, param2);
        var _loc3_: Number = getStyle("horizontalGap");
        var _loc4_: Number = getStyle("verticalGap");
        var _loc5_: Number = getStyle("paddingLeft");
        var _loc6_: Number = getStyle("paddingRight");
        var _loc7_: Number = getStyle("paddingTop");
        var _loc8_: Number = getStyle("paddingBottom");
        var _loc9_: Number = _loc5_;
        var _loc10_: Number = _loc7_;
        var _loc11_: Number = getStyle("labelWidth");
        var _loc12_: Number = getStyle("trackHeight");
        _loc12_ = isNaN(_loc12_) ? Number(this.mx_internal::_track.measuredHeight) : _loc12_;
        var _loc13_: TextLineMetrics = measureText(this.predictLabelText());
        var _loc14_: Number = isNaN(_loc11_) ? _loc13_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING : _loc11_;
        var _loc15_: Number = _loc13_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
        switch (this.labelPlacement) {
            case ProgressBarLabelPlacement.TOP:
                this.mx_internal::_labelField.move(_loc9_, _loc10_);
                this.mx_internal::_labelField.setActualSize(_loc14_, _loc15_);
                this.mx_internal::_content.move(_loc9_, _loc10_ + _loc15_ + _loc4_);
                this.layoutContent(param1 - _loc9_ - _loc6_, _loc12_);
                break;
            case ProgressBarLabelPlacement.RIGHT:
                _loc16_ = param1 - _loc9_ - _loc6_ - _loc14_ - _loc3_;
                this.mx_internal::_labelField.move(_loc9_ + _loc16_ + _loc3_, (param2 - _loc15_) / 2);
                this.mx_internal::_labelField.setActualSize(_loc14_, _loc15_);
                this.mx_internal::_content.move(_loc9_, _loc10_ + (_loc15_ - _loc12_) / 2);
                this.layoutContent(_loc16_, _loc12_);
                break;
            case ProgressBarLabelPlacement.LEFT:
                this.mx_internal::_labelField.move(_loc9_, _loc10_ + (param2 - _loc15_) / 2);
                this.mx_internal::_labelField.setActualSize(_loc14_, _loc15_);
                this.mx_internal::_content.move(_loc9_ + _loc14_ + _loc3_, _loc10_ + (_loc15_ - _loc12_) / 2);
                this.layoutContent(param1 - _loc9_ - _loc14_ - _loc4_ - _loc6_, _loc12_);
                break;
            case ProgressBarLabelPlacement.CENTER:
                this.mx_internal::_labelField.move((param1 - _loc14_) / 2, (param2 - _loc15_) / 2);
                this.mx_internal::_labelField.setActualSize(_loc14_, _loc15_);
                this.mx_internal::_content.move(_loc9_, _loc10_);
                this.layoutContent(param1 - _loc6_, param2 - _loc8_);
                break;
            default:
                this.mx_internal::_labelField.move(_loc9_, _loc10_ + _loc12_ + _loc4_);
                this.mx_internal::_labelField.setActualSize(_loc14_, _loc15_);
                this.mx_internal::_content.move(_loc9_, _loc10_);
                this.layoutContent(param1 - _loc9_ - _loc6_, _loc12_);
        }
        if (this.mx_internal::_barMask) {
            this.mx_internal::_barMask.move(0, 0);
            this.mx_internal::_barMask.setActualSize(this.mx_internal::_track.width, this.mx_internal::_track.height);
        }
        this.mx_internal::_labelField.text = this.getFullLabelText();
        this.mx_internal::_indeterminateBar.visible = this._indeterminate;
        if (this.indeterminateChanged || this.visibleChanged) {
            this.indeterminateChanged = false;
            this.visibleChanged = false;
            this.mx_internal::_indeterminateBar.visible = this._indeterminate;
            if (this._indeterminate && this._source == null && this._mode == ProgressBarMode.EVENT && visible) {
                this.startPlayingIndeterminate();
            } else {
                this.stopPlayingIndeterminate();
            }
        }
        if (this._indeterminate) {
            this.mx_internal::_determinateBar.setActualSize(this.mx_internal::_track.width, this.mx_internal::_track.height);
        } else {
            _loc17_ = Math.max(0, Number(this.mx_internal::_track.width) * this.percentComplete / 100);
            this.mx_internal::_determinateBar.setActualSize(_loc17_, this.mx_internal::_track.height);
            this.mx_internal::_determinateBar.x = this.direction == ProgressBarDirection.RIGHT ? 0 : Number(this.mx_internal::_track.width) - _loc17_;
        }
    }

    override protected function resourcesChanged(): void {
        super.resourcesChanged();
        this.label = this.labelOverride;
    }

    public function setProgress(param1: Number, param2: Number): void {
        if (this._mode == ProgressBarMode.MANUAL) {
            this._setProgress(param1, param2);
        }
    }

    private function _setProgress(param1: Number, param2: Number): void {
        var _loc3_: * = null;
        if (enabled && !isNaN(param1) && !isNaN(param2)) {
            this._value = param1;
            this._maximum = param2;
            dispatchEvent(new Event(Event.CHANGE));
            _loc3_ = new ProgressEvent(ProgressEvent.PROGRESS);
            _loc3_.bytesLoaded = param1;
            _loc3_.bytesTotal = param2;
            dispatchEvent(_loc3_);
            if (this._indeterminate) {
                this.startPlayingIndeterminate();
            }
            if (this._value == this._maximum && this._value > 0) {
                if (this._indeterminate) {
                    this.stopPlayingIndeterminate();
                }
                if (this.mode != ProgressBarMode.EVENT) {
                    dispatchEvent(new Event(Event.COMPLETE));
                }
            }
            invalidateDisplayList();
        }
    }

    private function createTrack(): void {
        if (this.mx_internal::_track) {
            this.mx_internal::_content.removeChild(DisplayObject(this.mx_internal::_track));
            this.mx_internal::_track = null;
        }
        var _loc1_: Class = getStyle("trackSkin");
        if (_loc1_) {
            this.mx_internal::_track = new _loc1_();
            if (this.mx_internal::_track is ISimpleStyleClient) {
                ISimpleStyleClient(this.mx_internal::_track).styleName = this;
            }
            this.mx_internal::_content.addChildAt(DisplayObject(this.mx_internal::_track), 0);
        }
    }

    private function createBar(): void {
        if (this.mx_internal::_determinateBar) {
            this.mx_internal::_bar.removeChild(DisplayObject(this.mx_internal::_determinateBar));
            this.mx_internal::_determinateBar = null;
        }
        var _loc1_: Class = getStyle("barSkin");
        if (_loc1_) {
            this.mx_internal::_determinateBar = new _loc1_();
            if (this.mx_internal::_determinateBar is ISimpleStyleClient) {
                ISimpleStyleClient(this.mx_internal::_determinateBar).styleName = this;
            }
            this.mx_internal::_bar.addChild(DisplayObject(this.mx_internal::_determinateBar));
        }
    }

    private function createIndeterminateBar(): void {
        if (this.mx_internal::_indeterminateBar) {
            this.mx_internal::_bar.removeChild(DisplayObject(this.mx_internal::_indeterminateBar));
            this.mx_internal::_indeterminateBar = null;
        }
        var _loc1_: Class = getStyle("indeterminateSkin");
        if (_loc1_) {
            this.mx_internal::_indeterminateBar = new _loc1_();
            if (this.mx_internal::_indeterminateBar is ISimpleStyleClient) {
                ISimpleStyleClient(this.mx_internal::_indeterminateBar).styleName = this;
            }
            this.mx_internal::_indeterminateBar.visible = false;
            this.mx_internal::_bar.addChild(DisplayObject(this.mx_internal::_indeterminateBar));
        }
    }

    private function layoutContent(param1: Number, param2: Number): void {
        this.mx_internal::_track.move(0, 0);
        this.mx_internal::_track.setActualSize(param1, param2);
        this.mx_internal::_bar.move(0, 0);
        this.mx_internal::_determinateBar.move(0, 0);
        this.mx_internal::_indeterminateBar.setActualSize(param1 + getStyle("indeterminateMoveInterval"), param2);
    }

    private function getFullLabelText(): String {
        var _loc1_: Number = Math.max(this._value, 0);
        var _loc2_: Number = Math.max(this._maximum, 0);
        var _loc3_: String = this.label;
        if (_loc3_) {
            if (this._indeterminate) {
                _loc3_ = _loc3_.replace("%1", String(Math.floor(_loc1_ / this._conversion)));
                _loc3_ = _loc3_.replace("%2", "??");
                _loc3_ = _loc3_.replace("%3", "");
                _loc3_ = _loc3_.replace("%%", "");
            } else {
                _loc3_ = _loc3_.replace("%1", String(Math.floor(_loc1_ / this._conversion)));
                _loc3_ = _loc3_.replace("%2", String(Math.floor(_loc2_ / this._conversion)));
                _loc3_ = _loc3_.replace("%3", String(Math.floor(this.percentComplete)));
                _loc3_ = _loc3_.replace("%%", "%");
            }
        }
        return _loc3_;
    }

    private function predictLabelText(): String {
        var _loc2_: Number = NaN;
        if (this.label == null) {
            return "";
        }
        var _loc1_: String = this.label;
        if (this._maximum != 0) {
            _loc2_ = this._maximum;
        } else {
            _loc2_ = 100000;
        }
        if (_loc1_) {
            if (this._indeterminate) {
                _loc1_ = _loc1_.replace("%1", String(Math.floor(_loc2_ / this._conversion)));
                _loc1_ = _loc1_.replace("%2", "??");
                _loc1_ = _loc1_.replace("%3", "");
                _loc1_ = _loc1_.replace("%%", "");
            } else {
                _loc1_ = _loc1_.replace("%1", String(Math.floor(_loc2_ / this._conversion)));
                _loc1_ = _loc1_.replace("%2", String(Math.floor(_loc2_ / this._conversion)));
                _loc1_ = _loc1_.replace("%3", "100");
                _loc1_ = _loc1_.replace("%%", "%");
            }
        }
        var _loc3_: String = this.getFullLabelText();
        if (_loc1_.length > _loc3_.length) {
            return _loc1_;
        }
        return _loc3_;
    }

    private function startPlayingIndeterminate(): void {
        if (!this.indeterminatePlaying) {
            this.indeterminatePlaying = true;
            this.pollTimer.addEventListener(TimerEvent.TIMER, this.updateIndeterminateHandler, false, 0, true);
            this.pollTimer.start();
        }
    }

    private function stopPlayingIndeterminate(): void {
        if (this.indeterminatePlaying) {
            this.indeterminatePlaying = false;
            this.pollTimer.removeEventListener(TimerEvent.TIMER, this.updateIndeterminateHandler);
            if (this._mode != ProgressBarMode.POLLED) {
                this.pollTimer.reset();
            }
        }
    }

    private function addSourceListeners(): void {
        this._source.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
        this._source.addEventListener(Event.COMPLETE, this.completeHandler);
    }

    private function removeSourceListeners(): void {
        this._source.removeEventListener(ProgressEvent.PROGRESS, this.progressHandler);
        this._source.removeEventListener(Event.COMPLETE, this.completeHandler);
    }

    private function progressHandler(param1: ProgressEvent): void {
        this._setProgress(param1.bytesLoaded, param1.bytesTotal);
    }

    private function completeHandler(param1: Event): void {
        dispatchEvent(param1);
        invalidateDisplayList();
    }

    private function updateIndeterminateHandler(param1: Event): void {
        if (this.mx_internal::_indeterminateBar.x < 1) {
            this.mx_internal::_indeterminateBar.x += 1;
        } else {
            this.mx_internal::_indeterminateBar.x = -(getStyle("indeterminateMoveInterval") - 2);
        }
    }

    private function updatePolledHandler(param1: Event): void {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        if (this._source) {
            _loc2_ = this._source;
            _loc3_ = Number(_loc2_.bytesLoaded);
            _loc4_ = Number(_loc2_.bytesTotal);
            if (!isNaN(_loc3_) && !isNaN(_loc4_)) {
                this._setProgress(_loc3_, _loc4_);
                if (this.percentComplete >= 100 && this._value > 0) {
                    this.pollTimer.reset();
                }
            }
        }
    }
}
}
