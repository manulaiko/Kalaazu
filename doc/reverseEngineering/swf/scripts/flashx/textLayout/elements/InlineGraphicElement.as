package flashx.textLayout.elements {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.system.Capabilities;
import flash.text.engine.ContentElement;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontMetrics;
import flash.text.engine.GraphicElement;
import flash.text.engine.TextBaseline;
import flash.text.engine.TextLine;
import flash.text.engine.TextRotation;

import flashx.textLayout.compose.ISWFContext;
import flashx.textLayout.compose.TextFlowLine;
import flashx.textLayout.events.ModelChange;
import flashx.textLayout.events.StatusChangeEvent;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.Float;
import flashx.textLayout.formats.FormatValue;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.JustificationRule;
import flashx.textLayout.property.Property;
import flashx.textLayout.tlf_internal;

public final class InlineGraphicElement extends FlowLeafElement {

    private static const graphicElementText: String = String.fromCharCode(ContentElement.GRAPHIC_ELEMENT);

    private static const LOAD_INITIATED: String = "loadInitiated";

    private static const OPEN_RECEIVED: String = "openReceived";

    private static const LOAD_COMPLETE: String = "loadComplete";

    private static const EMBED_LOADED: String = "embedLoaded";

    private static const DISPLAY_OBJECT: String = "displayObject";

    private static const NULL_GRAPHIC: String = "nullGraphic";

    private static var isMac: Boolean = Capabilities.os.search("Mac OS") > -1;

    tlf_internal static const heightPropertyDefinition: Property = Property.NewNumberOrPercentOrEnumProperty("height", FormatValue.AUTO, false, null, 0, 32000, "0%", "1000000%", FormatValue.AUTO);

    tlf_internal static const widthPropertyDefinition: Property = Property.NewNumberOrPercentOrEnumProperty("width", FormatValue.AUTO, false, null, 0, 32000, "0%", "1000000%", FormatValue.AUTO);

    tlf_internal static const rotationPropertyDefinition: Property = Property.NewEnumStringProperty("rotation", TextRotation.ROTATE_0, false, null, TextRotation.ROTATE_0, TextRotation.ROTATE_90, TextRotation.ROTATE_180, TextRotation.ROTATE_270);

    tlf_internal static const floatPropertyDefinition: Property = Property.NewEnumStringProperty("float", Float.NONE, false, null, Float.NONE, Float.LEFT, Float.RIGHT, Float.START, Float.END);


    private var _source: Object;

    private var _graphic: DisplayObject;

    private var _placeholderGraphic: Sprite;

    private var _elementWidth: Number;

    private var _elementHeight: Number;

    private var _graphicStatus: Object;

    private var okToUpdateHeightAndWidth: Boolean;

    private var _width;

    private var _height;

    private var _measuredWidth: Number;

    private var _measuredHeight: Number;

    private var _float;

    private var _effectiveFloat: String;

    public function InlineGraphicElement() {
        super();
        this.okToUpdateHeightAndWidth = false;
        this._measuredWidth = 0;
        this._measuredHeight = 0;
        this.internalSetWidth(undefined);
        this.internalSetHeight(undefined);
        this._graphicStatus = InlineGraphicElementStatus.LOAD_PENDING;
        tlf_internal::setTextLength(1);
        _text = graphicElementText;
    }

    private static function recursiveShutDownGraphic(param1: DisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        if (param1 is Loader) {
            Loader(param1).unloadAndStop();
        } else if (param1) {
            _loc2_ = param1 as DisplayObjectContainer;
            if (_loc2_) {
                _loc3_ = 0;
                while (_loc3_ < _loc2_.numChildren) {
                    recursiveShutDownGraphic(_loc2_.getChildAt(_loc3_));
                    _loc3_++;
                }
            }
            if (param1 is MovieClip) {
                MovieClip(param1).stop();
            }
        }
    }

    override tlf_internal function createContentElement(): void {
        if (_blockElement) {
            return;
        }
        this.computedFormat;
        var _loc1_: GraphicElement = new GraphicElement();
        _blockElement = _loc1_;
        this.updateContentElement();
        super.tlf_internal::createContentElement();
    }

    private function updateContentElement(): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc1_: GraphicElement = _blockElement as GraphicElement;
        if (!this._placeholderGraphic) {
            this._placeholderGraphic = new Sprite();
        }
        _loc1_.graphic = this._placeholderGraphic;
        if (this.tlf_internal::effectiveFloat != Float.NONE) {
            if (_loc1_.elementHeight != 0) {
                _loc1_.elementHeight = 0;
            }
            if (_loc1_.elementWidth != 0) {
                _loc1_.elementWidth = 0;
            }
        } else {
            _loc2_ = this.tlf_internal::elementHeightWithMarginsAndPadding();
            if (_loc1_.elementHeight != _loc2_) {
                _loc1_.elementHeight = _loc2_;
            }
            _loc3_ = this.tlf_internal::elementWidthWithMarginsAndPadding();
            if (_loc1_.elementWidth != _loc3_) {
                _loc1_.elementWidth = _loc3_;
            }
        }
    }

    override public function get computedFormat(): ITextLayoutFormat {
        var _loc1_: * = _computedFormat == null;
        super.computedFormat;
        if (_loc1_ && Boolean(_blockElement)) {
            this.updateContentElement();
        }
        return _computedFormat;
    }

    tlf_internal function elementWidthWithMarginsAndPadding(): Number {
        var _loc1_: TextFlow = getTextFlow();
        if (!_loc1_) {
            return this.tlf_internal::elementWidth;
        }
        var _loc2_: Number = _loc1_.computedFormat.blockProgression == BlockProgression.RL ? tlf_internal::getEffectivePaddingTop() + tlf_internal::getEffectivePaddingBottom() : tlf_internal::getEffectivePaddingLeft() + tlf_internal::getEffectivePaddingRight();
        return this.tlf_internal::elementWidth + _loc2_;
    }

    tlf_internal function elementHeightWithMarginsAndPadding(): Number {
        var _loc1_: TextFlow = getTextFlow();
        if (!_loc1_) {
            return this.tlf_internal::elementWidth;
        }
        var _loc2_: Number = _loc1_.computedFormat.blockProgression == BlockProgression.RL ? tlf_internal::getEffectivePaddingLeft() + tlf_internal::getEffectivePaddingRight() : tlf_internal::getEffectivePaddingTop() + tlf_internal::getEffectivePaddingBottom();
        return this.tlf_internal::elementHeight + _loc2_;
    }

    public function get graphic(): DisplayObject {
        return this._graphic;
    }

    private function setGraphic(param1: DisplayObject): void {
        this._graphic = param1;
    }

    tlf_internal function get placeholderGraphic(): Sprite {
        return this._placeholderGraphic;
    }

    tlf_internal function get elementWidth(): Number {
        return this._elementWidth;
    }

    tlf_internal function set elementWidth(param1: Number): void {
        this._elementWidth = param1;
        if (_blockElement) {
            (_blockElement as GraphicElement).elementWidth = this.tlf_internal::effectiveFloat != Float.NONE ? 0 : this.tlf_internal::elementWidthWithMarginsAndPadding();
        }
        tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength, true, false);
    }

    tlf_internal function get elementHeight(): Number {
        return this._elementHeight;
    }

    tlf_internal function set elementHeight(param1: Number): void {
        this._elementHeight = param1;
        if (_blockElement) {
            (_blockElement as GraphicElement).elementHeight = this.tlf_internal::effectiveFloat != Float.NONE ? 0 : this.tlf_internal::elementHeightWithMarginsAndPadding();
        }
        tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength, true, false);
    }

    public function get status(): String {
        switch (this._graphicStatus) {
            case LOAD_INITIATED:
            case OPEN_RECEIVED:
                return InlineGraphicElementStatus.LOADING;
            case LOAD_COMPLETE:
            case EMBED_LOADED:
            case DISPLAY_OBJECT:
            case NULL_GRAPHIC:
                return InlineGraphicElementStatus.READY;
            case InlineGraphicElementStatus.LOAD_PENDING:
            case InlineGraphicElementStatus.SIZE_PENDING:
                return String(this._graphicStatus);
            default:
                return InlineGraphicElementStatus.ERROR;
        }
    }

    private function changeGraphicStatus(param1: Object): void {
        var _loc4_: * = null;
        var _loc2_: String = this.status;
        this._graphicStatus = param1;
        var _loc3_: String = this.status;
        if (_loc2_ != _loc3_ || param1 is ErrorEvent) {
            if (_loc4_ = getTextFlow()) {
                if (_loc3_ == InlineGraphicElementStatus.SIZE_PENDING) {
                    _loc4_.tlf_internal::processAutoSizeImageLoaded(this);
                }
                _loc4_.dispatchEvent(new StatusChangeEvent(StatusChangeEvent.INLINE_GRAPHIC_STATUS_CHANGE, false, false, this, _loc3_, param1 as ErrorEvent));
            }
        }
    }

    public function get width(): * {
        return this._width;
    }

    public function set width(param1: *): void {
        this.internalSetWidth(param1);
        tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength);
    }

    public function get measuredWidth(): Number {
        return this._measuredWidth;
    }

    public function get actualWidth(): Number {
        return this.tlf_internal::elementWidth;
    }

    private function widthIsComputed(): Boolean {
        return this.internalWidth is String;
    }

    private function get internalWidth(): Object {
        return this._width === undefined ? tlf_internal::widthPropertyDefinition.defaultValue : this._width;
    }

    private function computeWidth(): Number {
        var _loc1_: Number = NaN;
        if (this.internalWidth == FormatValue.AUTO) {
            if (this.internalHeight == FormatValue.AUTO) {
                return this._measuredWidth;
            }
            if (this._measuredHeight == 0 || this._measuredWidth == 0) {
                return 0;
            }
            _loc1_ = this.heightIsComputed() ? this.computeHeight() : Number(this.internalHeight);
            return _loc1_ / this._measuredHeight * this._measuredWidth;
        }
        return tlf_internal::widthPropertyDefinition.computeActualPropertyValue(this.internalWidth, this._measuredWidth);
    }

    private function internalSetWidth(param1: *): void {
        this._width = tlf_internal::widthPropertyDefinition.setHelper(this.width, param1);
        this.tlf_internal::elementWidth = this.widthIsComputed() ? 0 : Number(this.internalWidth);
        if (this.okToUpdateHeightAndWidth && Boolean(this.graphic)) {
            if (this.widthIsComputed()) {
                this.tlf_internal::elementWidth = this.computeWidth();
            }
            this.graphic.width = this.tlf_internal::elementWidth;
            if (this.internalHeight == FormatValue.AUTO) {
                this.tlf_internal::elementHeight = this.computeHeight();
                this.graphic.height = this.tlf_internal::elementHeight;
            }
        }
    }

    public function get height(): * {
        return this._height;
    }

    public function set height(param1: *): void {
        this.internalSetHeight(param1);
        tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength);
    }

    private function get internalHeight(): Object {
        return this._height === undefined ? tlf_internal::heightPropertyDefinition.defaultValue : this._height;
    }

    tlf_internal function get computedFloat(): * {
        if (this._float === undefined) {
            return tlf_internal::floatPropertyDefinition.defaultValue;
        }
        return this._float;
    }

    tlf_internal function get effectiveFloat(): * {
        return !!this._effectiveFloat ? this._effectiveFloat : this.tlf_internal::computedFloat;
    }

    tlf_internal function setEffectiveFloat(param1: String): void {
        if (this._effectiveFloat != param1) {
            this._effectiveFloat = param1;
            if (_blockElement) {
                this.updateContentElement();
            }
        }
    }

    public function get float(): * {
        return this._float;
    }

    public function set float(param1: *): * {
        param1 = tlf_internal::floatPropertyDefinition.setHelper(this.float, param1) as String;
        if (this._float != param1) {
            this._float = param1;
            if (_blockElement) {
                this.updateContentElement();
            }
            tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength);
        }
    }

    public function get measuredHeight(): Number {
        return this._measuredHeight;
    }

    public function get actualHeight(): Number {
        return this.tlf_internal::elementHeight;
    }

    private function heightIsComputed(): Boolean {
        return this.internalHeight is String;
    }

    private function computeHeight(): Number {
        var _loc1_: Number = NaN;
        if (this.internalHeight == FormatValue.AUTO) {
            if (this.internalWidth == FormatValue.AUTO) {
                return this._measuredHeight;
            }
            if (this._measuredHeight == 0 || this._measuredWidth == 0) {
                return 0;
            }
            _loc1_ = this.widthIsComputed() ? this.computeWidth() : Number(this.internalWidth);
            return _loc1_ / this._measuredWidth * this._measuredHeight;
        }
        return tlf_internal::heightPropertyDefinition.computeActualPropertyValue(this.internalHeight, this._measuredHeight);
    }

    private function internalSetHeight(param1: *): void {
        this._height = tlf_internal::heightPropertyDefinition.setHelper(this.height, param1);
        this.tlf_internal::elementHeight = this.heightIsComputed() ? 0 : Number(this.internalHeight);
        if (this.okToUpdateHeightAndWidth && this.graphic != null) {
            if (this.heightIsComputed()) {
                this.tlf_internal::elementHeight = this.computeHeight();
            }
            this.graphic.height = this.tlf_internal::elementHeight;
            if (this.internalWidth == FormatValue.AUTO) {
                this.tlf_internal::elementWidth = this.computeWidth();
                this.graphic.width = this.tlf_internal::elementWidth;
            }
        }
    }

    private function loadCompleteHandler(param1: Event): void {
        this.removeDefaultLoadHandlers(this.graphic as Loader);
        this.okToUpdateHeightAndWidth = true;
        var _loc2_: DisplayObject = this.graphic;
        this._measuredWidth = _loc2_.width;
        this._measuredHeight = _loc2_.height;
        if (!this.widthIsComputed()) {
            _loc2_.width = this.tlf_internal::elementWidth;
        }
        if (!this.heightIsComputed()) {
            _loc2_.height = this.tlf_internal::elementHeight;
        }
        if (param1 is IOErrorEvent) {
            this.changeGraphicStatus(param1);
        } else if (this.widthIsComputed() || this.heightIsComputed()) {
            _loc2_.visible = false;
            this.changeGraphicStatus(InlineGraphicElementStatus.SIZE_PENDING);
        } else {
            this.changeGraphicStatus(LOAD_COMPLETE);
        }
    }

    private function openHandler(param1: Event): void {
        this.changeGraphicStatus(OPEN_RECEIVED);
    }

    private function addDefaultLoadHandlers(param1: Loader): void {
        var _loc2_: LoaderInfo = param1.contentLoaderInfo;
        _loc2_.addEventListener(Event.OPEN, this.openHandler, false, 0, true);
        _loc2_.addEventListener(Event.COMPLETE, this.loadCompleteHandler, false, 0, true);
        _loc2_.addEventListener(IOErrorEvent.IO_ERROR, this.loadCompleteHandler, false, 0, true);
    }

    private function removeDefaultLoadHandlers(param1: Loader): void {
        param1.contentLoaderInfo.removeEventListener(Event.OPEN, this.openHandler);
        param1.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loadCompleteHandler);
        param1.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.loadCompleteHandler);
    }

    public function get source(): Object {
        return this._source;
    }

    public function set source(param1: Object): void {
        this.tlf_internal::stop(true);
        this._source = param1;
        this.changeGraphicStatus(InlineGraphicElementStatus.LOAD_PENDING);
        tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this, 0, textLength);
    }

    override tlf_internal function applyDelayedElementUpdate(param1: TextFlow, param2: Boolean, param3: Boolean): void {
        var source: Object = null;
        var elem: DisplayObject = null;
        var inlineGraphicResolver: Function = null;
        var var_338: Loader = null;
        var myPattern: RegExp = null;
        var src: String = null;
        var pictURLReq: URLRequest = null;
        var cls: Class = null;
        var textFlow: TextFlow = param1;
        var okToUnloadGraphics: Boolean = param2;
        var hasController: Boolean = param3;
        if (textFlow != this.getTextFlow()) {
            hasController = false;
        }
        if (this._graphicStatus == InlineGraphicElementStatus.LOAD_PENDING) {
            if (hasController) {
                source = this._source;
                if (source is String) {
                    inlineGraphicResolver = textFlow.configuration.inlineGraphicResolverFunction;
                    if (inlineGraphicResolver != null) {
                        source = inlineGraphicResolver(this);
                    }
                }
                if (source is String || source is URLRequest) {
                    this.okToUpdateHeightAndWidth = false;
                    var_338 = new Loader();
                    try {
                        this.addDefaultLoadHandlers(var_338);
                        if (source is String) {
                            myPattern = /\\/g;
                            src = source as String;
                            src = src.replace(myPattern, "/");
                            if (isMac) {
                                pictURLReq = new URLRequest(encodeURI(src));
                            } else {
                                pictURLReq = new URLRequest(src);
                            }
                            var_338.load(pictURLReq);
                        } else {
                            var_338.load(URLRequest(source));
                        }
                        this.setGraphic(var_338);
                        this.changeGraphicStatus(LOAD_INITIATED);
                    } catch (e: Error) {
                        removeDefaultLoadHandlers(var_338);
                        elem = new Shape();
                        changeGraphicStatus(NULL_GRAPHIC);
                    }
                } else if (source is Class) {
                    cls = source as Class;
                    elem = DisplayObject(new cls());
                    this.changeGraphicStatus(EMBED_LOADED);
                } else if (source is DisplayObject) {
                    elem = DisplayObject(source);
                    this.changeGraphicStatus(DISPLAY_OBJECT);
                } else {
                    elem = new Shape();
                    this.changeGraphicStatus(NULL_GRAPHIC);
                }
                if (this._graphicStatus != LOAD_INITIATED) {
                    this.okToUpdateHeightAndWidth = true;
                    this._measuredWidth = !!elem ? elem.width : 0;
                    this._measuredHeight = !!elem ? elem.height : 0;
                    if (this.widthIsComputed()) {
                        if (elem) {
                            elem.width = this.tlf_internal::elementWidth = this.computeWidth();
                        } else {
                            this.tlf_internal::elementWidth = 0;
                        }
                    } else {
                        elem.width = Number(this.width);
                    }
                    if (this.heightIsComputed()) {
                        if (elem) {
                            elem.height = this.tlf_internal::elementHeight = this.computeHeight();
                        } else {
                            this.tlf_internal::elementHeight = 0;
                        }
                    } else {
                        elem.height = Number(this.height);
                    }
                    this.setGraphic(elem);
                }
            }
        } else {
            if (this._graphicStatus == InlineGraphicElementStatus.SIZE_PENDING) {
                this.updateAutoSizes();
                this.graphic.visible = true;
                this.changeGraphicStatus(LOAD_COMPLETE);
            }
            if (!hasController) {
                this.tlf_internal::stop(okToUnloadGraphics);
            }
        }
    }

    override tlf_internal function updateForMustUseComposer(param1: TextFlow): Boolean {
        this.tlf_internal::applyDelayedElementUpdate(param1, false, true);
        return this.status != InlineGraphicElementStatus.READY;
    }

    private function updateAutoSizes(): void {
        if (this.widthIsComputed()) {
            this.tlf_internal::elementWidth = this.computeWidth();
            this.graphic.width = this.tlf_internal::elementWidth;
        }
        if (this.heightIsComputed()) {
            this.tlf_internal::elementHeight = this.computeHeight();
            this.graphic.height = this.tlf_internal::elementHeight;
        }
    }

    tlf_internal function stop(param1: Boolean): Boolean {
        var var_338: Loader = null;
        var okToUnloadGraphics: Boolean = param1;
        if (this._graphicStatus == OPEN_RECEIVED || this._graphicStatus == LOAD_INITIATED) {
            var_338 = this.graphic as Loader;
            try {
                var_338.close();
            } catch (e: Error) {
            }
            this.removeDefaultLoadHandlers(var_338);
        }
        if (this._graphicStatus != DISPLAY_OBJECT) {
            if (okToUnloadGraphics) {
                recursiveShutDownGraphic(this.graphic);
                this.setGraphic(null);
            }
            if (this.widthIsComputed()) {
                this.tlf_internal::elementWidth = 0;
            }
            if (this.heightIsComputed()) {
                this.tlf_internal::elementHeight = 0;
            }
            this.changeGraphicStatus(InlineGraphicElementStatus.LOAD_PENDING);
        }
        return true;
    }

    override tlf_internal function getEffectiveFontSize(): Number {
        if (this.tlf_internal::effectiveFloat != Float.NONE) {
            return 0;
        }
        var _loc1_: Number = super.tlf_internal::getEffectiveFontSize();
        return Math.max(_loc1_, this.tlf_internal::elementHeightWithMarginsAndPadding());
    }

    override tlf_internal function getEffectiveLineHeight(param1: String): Number {
        if (this.tlf_internal::effectiveFloat != Float.NONE) {
            return 0;
        }
        return super.tlf_internal::getEffectiveLineHeight(param1);
    }

    tlf_internal function getTypographicAscent(param1: TextLine): Number {
        var _loc3_: * = null;
        if (this.tlf_internal::effectiveFloat != Float.NONE) {
            return 0;
        }
        var _loc2_: Number = this.tlf_internal::elementHeightWithMarginsAndPadding();
        if (this._computedFormat.dominantBaseline != FormatValue.AUTO) {
            _loc3_ = this._computedFormat.dominantBaseline;
        } else {
            _loc3_ = this.getParagraph().tlf_internal::getEffectiveDominantBaseline();
        }
        var _loc4_: ElementFormat;
        var _loc5_: String = (_loc4_ = !!_blockElement ? _blockElement.elementFormat : tlf_internal::computeElementFormat()).alignmentBaseline == TextBaseline.USE_DOMINANT_BASELINE ? _loc3_ : _loc4_.alignmentBaseline;
        var _loc6_: Number = 0;
        if (_loc3_ == TextBaseline.IDEOGRAPHIC_CENTER) {
            _loc6_ += _loc2_ / 2;
        } else if (_loc3_ == TextBaseline.IDEOGRAPHIC_BOTTOM || _loc3_ == TextBaseline.DESCENT || _loc3_ == TextBaseline.ROMAN) {
            _loc6_ += _loc2_;
        }
        return (_loc6_ += param1.getBaselinePosition(TextBaseline.ROMAN) - param1.getBaselinePosition(_loc5_)) + _loc4_.baselineShift;
    }

    override tlf_internal function getCSSInlineBox(param1: String, param2: TextLine, param3: ParagraphElement = null, param4: ISWFContext = null): Rectangle {
        if (this.tlf_internal::effectiveFloat != Float.NONE) {
            return null;
        }
        var _loc5_: Rectangle;
        (_loc5_ = new Rectangle()).top = -this.tlf_internal::getTypographicAscent(param2);
        _loc5_.height = this.tlf_internal::elementHeightWithMarginsAndPadding();
        _loc5_.width = this.tlf_internal::elementWidth;
        return _loc5_;
    }

    override tlf_internal function updateIMEAdornments(param1: TextLine, param2: String, param3: String): void {
        if (this.tlf_internal::effectiveFloat == Float.NONE) {
            super.tlf_internal::updateIMEAdornments(param1, param2, param3);
        }
    }

    override tlf_internal function updateAdornments(param1: TextLine, param2: String): int {
        if (this.tlf_internal::effectiveFloat == Float.NONE) {
            return super.tlf_internal::updateAdornments(param1, param2);
        }
        return 0;
    }

    override public function shallowCopy(param1: int = 0, param2: int = -1): FlowElement {
        if (param2 == -1) {
            param2 = textLength;
        }
        var _loc3_: InlineGraphicElement = super.shallowCopy(param1, param2) as InlineGraphicElement;
        _loc3_.source = this.source;
        _loc3_.width = this.width;
        _loc3_.height = this.height;
        _loc3_.float = this.float;
        return _loc3_;
    }

    override protected function get abstract(): Boolean {
        return false;
    }

    override tlf_internal function get defaultTypeName(): String {
        return "img";
    }

    override tlf_internal function appendElementsForDelayedUpdate(param1: TextFlow, param2: String): void {
        if (param2 == ModelChange.ELEMENT_ADDED) {
            param1.tlf_internal::incGraphicObjectCount();
        } else if (param2 == ModelChange.ELEMENT_REMOVAL) {
            param1.tlf_internal::decGraphicObjectCount();
        }
        if (this.status != InlineGraphicElementStatus.READY || param2 == ModelChange.ELEMENT_REMOVAL) {
            param1.tlf_internal::appendOneElementForUpdate(this);
        }
    }

    override tlf_internal function calculateStrikeThrough(param1: TextLine, param2: String, param3: FontMetrics): Number {
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        if (!this.graphic || this.status != InlineGraphicElementStatus.READY) {
            return super.tlf_internal::calculateStrikeThrough(param1, param2, param3);
        }
        var _loc4_: Number = 0;
        var _loc5_: DisplayObjectContainer;
        if (_loc5_ = this._placeholderGraphic.parent) {
            if (param2 != BlockProgression.RL) {
                _loc4_ = this.tlf_internal::placeholderGraphic.parent.y + (this.tlf_internal::elementHeight / 2 + Number(tlf_internal::getEffectivePaddingTop()));
            } else {
                _loc6_ = Number(tlf_internal::getEffectivePaddingRight());
                _loc7_ = param1.userData as TextFlowLine;
                _loc8_ = this.getAbsoluteStart() - _loc7_.absoluteStart;
                if (param1.getAtomTextRotation(_loc8_) != TextRotation.ROTATE_0) {
                    _loc4_ = this._placeholderGraphic.parent.x - (this.tlf_internal::elementHeight / 2 + _loc6_);
                } else {
                    _loc4_ = this._placeholderGraphic.parent.x - (this.tlf_internal::elementWidth / 2 + _loc6_);
                }
            }
        }
        return param2 == BlockProgression.TB ? _loc4_ : -_loc4_;
    }

    override tlf_internal function calculateUnderlineOffset(param1: Number, param2: String, param3: FontMetrics, param4: TextLine): Number {
        if (!this.graphic || this.status != InlineGraphicElementStatus.READY) {
            return super.tlf_internal::calculateUnderlineOffset(param1, param2, param3, param4);
        }
        var _loc5_: ParagraphElement = this.getParagraph();
        var _loc6_: Number = 0;
        var _loc7_: DisplayObjectContainer;
        if (_loc7_ = this._placeholderGraphic.parent) {
            if (param2 == BlockProgression.TB) {
                _loc6_ = _loc7_.y + this.tlf_internal::elementHeightWithMarginsAndPadding();
            } else {
                if (_loc5_.computedFormat.locale.toLowerCase().indexOf("zh") == 0) {
                    return (_loc6_ = _loc7_.x - this.tlf_internal::elementHeightWithMarginsAndPadding()) - (param3.underlineOffset + param3.underlineThickness / 2);
                }
                _loc6_ = _loc7_.x - Number(tlf_internal::getEffectivePaddingLeft());
            }
        }
        _loc6_ += param3.underlineOffset + param3.underlineThickness / 2;
        var _loc8_: String;
        if ((_loc8_ = _loc5_.tlf_internal::getEffectiveJustificationRule()) == JustificationRule.EAST_ASIAN) {
            _loc6_ += 1;
        }
        return _loc6_;
    }
}
}
