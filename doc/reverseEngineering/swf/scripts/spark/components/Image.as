package spark.components {

import flash.display.BitmapData;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.graphics.BitmapScaleMode;
import mx.utils.BitFlagUtil;

import spark.components.supportClasses.Range;
import spark.components.supportClasses.SkinnableComponent;
import spark.core.IContentLoader;
import spark.primitives.BitmapImage;

public class Image extends SkinnableComponent {

    mx_internal static const CLEAR_ON_LOAD_PROPERTY_FLAG: uint = 1;

    mx_internal static const CONTENT_LOADER_PROPERTY_FLAG: uint = 2;

    mx_internal static const CONTENT_LOADER_GROUPING_PROPERTY_FLAG: uint = 4;

    mx_internal static const FILL_MODE_PROPERTY_FLAG: uint = 8;

    mx_internal static const PRELIMINARY_WIDTH_PROPERTY_FLAG: uint = 16;

    mx_internal static const PRELIMINARY_HEIGHT_PROPERTY_FLAG: uint = 32;

    mx_internal static const HORIZONTAL_ALIGN_PROPERTY_FLAG: uint = 64;

    mx_internal static const SCALE_MODE_PROPERTY_FLAG: uint = 128;

    mx_internal static const SMOOTH_PROPERTY_FLAG: uint = 256;

    mx_internal static const SMOOTHING_QUALITY_PROPERTY_FLAG: uint = 512;

    mx_internal static const SOURCE_PROPERTY_FLAG: uint = 1024;

    mx_internal static const SOURCE_WIDTH_PROPERTY_FLAG: uint = 2048;

    mx_internal static const SOURCE_HEIGHT_PROPERTY_FLAG: uint = 4096;

    mx_internal static const TRUSTED_SOURCE_PROPERTY_FLAG: uint = 8192;

    mx_internal static const VERTICAL_ALIGN_PROPERTY_FLAG: uint = 16384;


    protected var _loading: Boolean = false;

    protected var _ready: Boolean = false;

    protected var _invalid: Boolean = false;

    mx_internal var imageDisplayProperties: Object;

    [SkinPart(required="true")]
    public var imageDisplay: BitmapImage;

    [SkinPart(required="false")]
    public var progressIndicator: Range;

    public function Image() {
        this.mx_internal::imageDisplayProperties = {
            "visible": true,
            "scaleMode": BitmapScaleMode.LETTERBOX,
            "trustedSource": true
        };
        super();
    }

    public function get bitmapData(): BitmapData {
        return !!this.imageDisplay ? this.imageDisplay.bitmapData : null;
    }

    public function get bytesLoaded(): Number {
        return !!this.imageDisplay ? this.imageDisplay.bytesLoaded : NaN;
    }

    public function get bytesTotal(): Number {
        return !!this.imageDisplay ? this.imageDisplay.bytesTotal : NaN;
    }

    public function get clearOnLoad(): Boolean {
        if (this.imageDisplay) {
            return this.imageDisplay.clearOnLoad;
        }
        return this.mx_internal::imageDisplayProperties.clearOnLoad;
    }

    public function set clearOnLoad(param1: Boolean): void {
        if (this.imageDisplay) {
            this.imageDisplay.clearOnLoad = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::CLEAR_ON_LOAD_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.clearOnLoad = param1;
        }
    }

    public function get contentLoader(): IContentLoader {
        if (this.imageDisplay) {
            return this.imageDisplay.contentLoader;
        }
        return this.mx_internal::imageDisplayProperties.contentLoader;
    }

    public function set contentLoader(param1: IContentLoader): void {
        if (this.imageDisplay) {
            this.imageDisplay.contentLoader = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::CONTENT_LOADER_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.contentLoader = param1;
        }
    }

    public function get contentLoaderGrouping(): String {
        if (this.imageDisplay) {
            return this.imageDisplay.contentLoaderGrouping;
        }
        return this.mx_internal::imageDisplayProperties.contentLoaderGrouping;
    }

    public function set contentLoaderGrouping(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.contentLoaderGrouping = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::CONTENT_LOADER_GROUPING_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.contentLoaderGrouping = param1;
        }
    }

    public function get fillMode(): String {
        if (this.imageDisplay) {
            return this.imageDisplay.fillMode;
        }
        return this.mx_internal::imageDisplayProperties.fillMode;
    }

    public function set fillMode(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.fillMode = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::FILL_MODE_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.fillMode = param1;
        }
    }

    public function get horizontalAlign(): String {
        if (this.imageDisplay) {
            return this.imageDisplay.horizontalAlign;
        }
        return this.mx_internal::imageDisplayProperties.horizontalAlign;
    }

    public function set horizontalAlign(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.horizontalAlign = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::HORIZONTAL_ALIGN_PROPERTY_FLAG, param1 != null);
        } else {
            this.mx_internal::imageDisplayProperties.horizontalAlign = param1;
        }
    }

    public function get preliminaryHeight(): Number {
        if (this.imageDisplay) {
            return this.imageDisplay.preliminaryHeight;
        }
        return this.mx_internal::imageDisplayProperties.preliminaryHeight;
    }

    public function set preliminaryHeight(param1: Number): void {
        if (this.imageDisplay) {
            this.imageDisplay.preliminaryHeight = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::PRELIMINARY_HEIGHT_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.preliminaryHeight = param1;
        }
    }

    public function get preliminaryWidth(): Number {
        if (this.imageDisplay) {
            return this.imageDisplay.preliminaryWidth;
        }
        return this.mx_internal::imageDisplayProperties.preliminaryWidth;
    }

    public function set preliminaryWidth(param1: Number): void {
        if (this.imageDisplay) {
            this.imageDisplay.preliminaryWidth = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::PRELIMINARY_WIDTH_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.preliminaryWidth = param1;
        }
    }

    public function get scaleMode(): String {
        if (this.imageDisplay) {
            return this.imageDisplay.scaleMode;
        }
        return this.mx_internal::imageDisplayProperties.scaleMode;
    }

    public function set scaleMode(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.scaleMode = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::SCALE_MODE_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.scaleMode = param1;
        }
    }

    public function set smooth(param1: Boolean): void {
        if (this.imageDisplay) {
            this.imageDisplay.smooth = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::SMOOTH_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::imageDisplayProperties.smooth = param1;
        }
    }

    public function get smooth(): Boolean {
        if (this.imageDisplay) {
            return this.imageDisplay.smooth;
        }
        return this.mx_internal::imageDisplayProperties.smooth;
    }

    [Bindable("sourceChanged")]
    public function get source(): Object {
        if (this.imageDisplay) {
            return this.imageDisplay.source;
        }
        return this.mx_internal::imageDisplayProperties.source;
    }

    public function set source(param1: Object): void {
        if (this.source == param1) {
            return;
        }
        this._loading = false;
        this._invalid = false;
        this._ready = false;
        if (this.imageDisplay) {
            this.imageDisplay.source = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::SOURCE_PROPERTY_FLAG, param1 != null);
        } else {
            this.mx_internal::imageDisplayProperties.source = param1;
        }
        invalidateSkinState();
        dispatchEvent(new Event("sourceChanged"));
    }

    public function get sourceHeight(): Number {
        if (this.imageDisplay) {
            return this.imageDisplay.sourceHeight;
        }
        return NaN;
    }

    public function get sourceWidth(): Number {
        if (this.imageDisplay) {
            return this.imageDisplay.sourceWidth;
        }
        return NaN;
    }

    public function get trustedSource(): Boolean {
        if (this.imageDisplay) {
            return this.imageDisplay.trustedSource;
        }
        return this.mx_internal::imageDisplayProperties.trustedSource;
    }

    public function get verticalAlign(): String {
        if (this.imageDisplay) {
            return this.imageDisplay.verticalAlign;
        }
        return this.mx_internal::imageDisplayProperties.verticalAlign;
    }

    public function set verticalAlign(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.verticalAlign = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::VERTICAL_ALIGN_PROPERTY_FLAG, param1 != null);
        } else {
            this.mx_internal::imageDisplayProperties.verticalAlign = param1;
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: * = 0;
        super.partAdded(param1, param2);
        if (param2 == this.imageDisplay) {
            this.imageDisplay.addEventListener(IOErrorEvent.IO_ERROR, this.imageDisplay_ioErrorHandler, false, 0, true);
            this.imageDisplay.addEventListener(ProgressEvent.PROGRESS, this.imageDisplay_progressHandler, false, 0, true);
            this.imageDisplay.addEventListener(FlexEvent.READY, this.imageDisplay_readyHandler, false, 0, true);
            this.imageDisplay.addEventListener(Event.COMPLETE, dispatchEvent, false, 0, true);
            this.imageDisplay.addEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatchEvent, false, 0, true);
            this.imageDisplay.addEventListener(HTTPStatusEvent.HTTP_STATUS, dispatchEvent, false, 0, true);
            _loc3_ = 0;
            if (this.mx_internal::imageDisplayProperties.clearOnLoad !== undefined) {
                this.imageDisplay.clearOnLoad = this.mx_internal::imageDisplayProperties.clearOnLoad;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::CLEAR_ON_LOAD_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.contentLoader !== undefined) {
                this.imageDisplay.contentLoader = this.mx_internal::imageDisplayProperties.contentLoader;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::CONTENT_LOADER_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.contentLoaderGrouping !== undefined) {
                this.imageDisplay.contentLoaderGrouping = this.mx_internal::imageDisplayProperties.contentLoaderGrouping;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::CONTENT_LOADER_GROUPING_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.fillMode !== undefined) {
                this.imageDisplay.fillMode = this.mx_internal::imageDisplayProperties.fillMode;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::FILL_MODE_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.preliminaryHeight !== undefined) {
                this.imageDisplay.preliminaryHeight = this.mx_internal::imageDisplayProperties.preliminaryHeight;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::PRELIMINARY_HEIGHT_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.preliminaryWidth !== undefined) {
                this.imageDisplay.preliminaryWidth = this.mx_internal::imageDisplayProperties.preliminaryWidth;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::PRELIMINARY_WIDTH_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.smooth !== undefined) {
                this.imageDisplay.smooth = this.mx_internal::imageDisplayProperties.smooth;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::SMOOTH_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.source !== undefined) {
                this.imageDisplay.source = this.mx_internal::imageDisplayProperties.source;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::SOURCE_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.smoothingQuality !== undefined) {
                this.imageDisplay.smoothingQuality = this.mx_internal::imageDisplayProperties.smoothingQuality;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::SMOOTHING_QUALITY_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.scaleMode !== undefined) {
                this.imageDisplay.scaleMode = this.mx_internal::imageDisplayProperties.scaleMode;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::SCALE_MODE_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.verticalAlign !== undefined) {
                this.imageDisplay.verticalAlign = this.mx_internal::imageDisplayProperties.verticalAlign;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::VERTICAL_ALIGN_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::imageDisplayProperties.horizontalAlign !== undefined) {
                this.imageDisplay.horizontalAlign = this.mx_internal::imageDisplayProperties.horizontalAlign;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::HORIZONTAL_ALIGN_PROPERTY_FLAG, true);
            }
            this.mx_internal::imageDisplayProperties = _loc3_;
            this.imageDisplay.mx_internal::validateSource();
        } else if (param2 == this.progressIndicator) {
            if (this._loading && this.progressIndicator && Boolean(this.imageDisplay)) {
                this.progressIndicator.value = this.percentComplete(this.imageDisplay.bytesLoaded, this.imageDisplay.bytesTotal);
            }
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        var _loc3_: * = null;
        super.partRemoved(param1, param2);
        if (param2 == this.imageDisplay) {
            this.imageDisplay.removeEventListener(IOErrorEvent.IO_ERROR, this.imageDisplay_ioErrorHandler);
            this.imageDisplay.removeEventListener(ProgressEvent.PROGRESS, this.imageDisplay_progressHandler);
            this.imageDisplay.removeEventListener(FlexEvent.READY, this.imageDisplay_readyHandler);
            this.imageDisplay.removeEventListener(Event.COMPLETE, dispatchEvent);
            this.imageDisplay.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatchEvent);
            this.imageDisplay.removeEventListener(HTTPStatusEvent.HTTP_STATUS, dispatchEvent);
            _loc3_ = {};
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::CLEAR_ON_LOAD_PROPERTY_FLAG)) {
                _loc3_.clearOnLoad = this.imageDisplay.clearOnLoad;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::CONTENT_LOADER_PROPERTY_FLAG)) {
                _loc3_.contentLoader = this.imageDisplay.contentLoader;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::CONTENT_LOADER_GROUPING_PROPERTY_FLAG)) {
                _loc3_.contentLoaderGrouping = this.imageDisplay.contentLoaderGrouping;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::FILL_MODE_PROPERTY_FLAG)) {
                _loc3_.fillMode = this.imageDisplay.fillMode;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::PRELIMINARY_HEIGHT_PROPERTY_FLAG)) {
                _loc3_.preliminaryHeight = this.imageDisplay.preliminaryHeight;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::PRELIMINARY_WIDTH_PROPERTY_FLAG)) {
                _loc3_.preliminaryWidth = this.imageDisplay.preliminaryWidth;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::SOURCE_PROPERTY_FLAG)) {
                _loc3_.source = this.imageDisplay.source;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::SMOOTH_PROPERTY_FLAG)) {
                _loc3_.smooth = this.imageDisplay.smooth;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::SMOOTHING_QUALITY_PROPERTY_FLAG)) {
                _loc3_.smoothingQuality = this.imageDisplay.smoothingQuality;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::SCALE_MODE_PROPERTY_FLAG)) {
                _loc3_.scaleMode = this.imageDisplay.scaleMode;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::TRUSTED_SOURCE_PROPERTY_FLAG)) {
                _loc3_.trustedSource = this.imageDisplay.trustedSource;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::VERTICAL_ALIGN_PROPERTY_FLAG)) {
                _loc3_.verticalAlign = this.imageDisplay.verticalAlign;
            }
            if (BitFlagUtil.isSet(this.mx_internal::imageDisplayProperties as uint, mx_internal::HORIZONTAL_ALIGN_PROPERTY_FLAG)) {
                _loc3_.horizontalAlign = this.imageDisplay.horizontalAlign;
            }
            this.imageDisplay.source = null;
            this.mx_internal::imageDisplayProperties = _loc3_;
        }
    }

    override protected function getCurrentSkinState(): String {
        var _loc1_: Boolean = getStyle("enableLoadingState");
        if (this._invalid) {
            return "invalid";
        }
        if (!enabled) {
            return "disabled";
        }
        if (this._loading && _loc1_) {
            return "loading";
        }
        if (this.imageDisplay && this.imageDisplay.source && this._ready) {
            return "ready";
        }
        return "uninitialized";
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        super.styleChanged(param1);
        if (_loc2_ || param1 == "enableLoadingState") {
            invalidateSkinState();
        }
        if (_loc2_ || param1 == "smoothingQuality") {
            this.smoothQuality = getStyle("smoothingQuality");
        }
    }

    private function set smoothQuality(param1: String): void {
        if (this.imageDisplay) {
            this.imageDisplay.smoothingQuality = param1;
            this.mx_internal::imageDisplayProperties = BitFlagUtil.update(this.mx_internal::imageDisplayProperties as uint, mx_internal::SMOOTHING_QUALITY_PROPERTY_FLAG, param1 != null);
        } else {
            this.mx_internal::imageDisplayProperties.smoothingQuality = param1;
        }
    }

    private function percentComplete(param1: Number, param2: Number): Number {
        var _loc3_: Number = Math.ceil(param1 / param2 * 100);
        return isNaN(_loc3_) ? 0 : _loc3_;
    }

    private function imageDisplay_ioErrorHandler(param1: IOErrorEvent): void {
        this._invalid = true;
        this._loading = false;
        invalidateSkinState();
        if (hasEventListener(param1.type)) {
            dispatchEvent(param1);
        }
    }

    private function imageDisplay_progressHandler(param1: ProgressEvent): void {
        if (!this._loading) {
            invalidateSkinState();
        }
        if (this.progressIndicator) {
            this.progressIndicator.value = this.percentComplete(param1.bytesLoaded, param1.bytesTotal);
        }
        this._loading = true;
        dispatchEvent(param1);
    }

    private function imageDisplay_readyHandler(param1: Event): void {
        invalidateSkinState();
        this._loading = false;
        this._ready = true;
        dispatchEvent(param1);
    }
}
}
