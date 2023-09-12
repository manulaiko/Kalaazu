package flashx.textLayout.factory {

import flash.geom.Rectangle;
import flash.text.engine.TextLine;

import flashx.textLayout.compose.FlowComposerBase;
import flashx.textLayout.compose.SimpleCompose;
import flashx.textLayout.container.ScrollPolicy;
import flashx.textLayout.elements.Configuration;
import flashx.textLayout.elements.IConfiguration;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.LineBreak;
import flashx.textLayout.tlf_internal;

public class StringTextLineFactory extends TextLineFactoryBase {

    private static var _defaultConfiguration: Configuration = null;

    private static var _measurementFactory: StringTextLineFactory = null;

    private static var _measurementLines: Array = null;


    private var _tf: TextFlow;

    private var _para: ParagraphElement;

    private var _span: SpanElement;

    private var _formatsChanged: Boolean;

    private var _configuration: IConfiguration;

    private var _truncatedText: String;

    public function StringTextLineFactory(param1: IConfiguration = null) {
        super();
        this.initialize(param1);
    }

    public static function get defaultConfiguration(): IConfiguration {
        if (!_defaultConfiguration) {
            _defaultConfiguration = TextFlow.defaultConfiguration.clone();
            _defaultConfiguration.flowComposerClass = tlf_internal::getDefaultFlowComposerClass();
            _defaultConfiguration.textFlowInitialFormat = null;
        }
        return _defaultConfiguration;
    }

    private static function measurementFactory(): StringTextLineFactory {
        if (_measurementFactory == null) {
            _measurementFactory = new StringTextLineFactory();
        }
        return _measurementFactory;
    }

    private static function measurementLines(): Array {
        if (_measurementLines == null) {
            _measurementLines = new Array();
        }
        return _measurementLines;
    }

    private static function noopfunction(param1: Object): void {
    }

    public function get configuration(): IConfiguration {
        return this._configuration;
    }

    private function initialize(param1: IConfiguration): void {
        this._configuration = Configuration(!!param1 ? param1 : defaultConfiguration).tlf_internal::getImmutableClone();
        this._tf = new TextFlow(this._configuration);
        this._para = new ParagraphElement();
        this._span = new SpanElement();
        this._para.replaceChildren(0, 0, this._span);
        this._tf.replaceChildren(0, 0, this._para);
        this._tf.flowComposer.addController(containerController);
        this._formatsChanged = true;
    }

    public function get spanFormat(): ITextLayoutFormat {
        return this._span.format;
    }

    public function set spanFormat(param1: ITextLayoutFormat): void {
        this._span.format = param1;
        this._formatsChanged = true;
    }

    public function get paragraphFormat(): ITextLayoutFormat {
        return this._para.format;
    }

    public function set paragraphFormat(param1: ITextLayoutFormat): void {
        this._para.format = param1;
        this._formatsChanged = true;
    }

    public function get textFlowFormat(): ITextLayoutFormat {
        return this._tf.format;
    }

    public function set textFlowFormat(param1: ITextLayoutFormat): void {
        this._tf.format = param1;
        this._formatsChanged = true;
    }

    public function get text(): String {
        return this._span.text;
    }

    public function set text(param1: String): void {
        this._span.text = param1;
    }

    public function createTextLines(param1: Function): void {
        var var_1000: Function = param1;
        var saved: SimpleCompose = TextLineFactoryBase.tlf_internal::beginFactoryCompose();
        try {
            this.createTextLinesInternal(var_1000);
        } finally {
            tlf_internal::_factoryComposer._lines.splice(0);
            if (_pass0Lines) {
                _pass0Lines.splice(0);
            }
            TextLineFactoryBase.tlf_internal::endFactoryCompose(saved);
        }
    }

    private function createTextLinesInternal(param1: Function): void {
        var _loc2_: Boolean = !compositionBounds || isNaN(compositionBounds.width);
        var _loc3_: Boolean = !compositionBounds || isNaN(compositionBounds.height);
        var _loc4_: String = this._tf.computedFormat.blockProgression;
        containerController.setCompositionSize(compositionBounds.width, compositionBounds.height);
        containerController.verticalScrollPolicy = !!truncationOptions ? "null" : verticalScrollPolicy;
        containerController.horizontalScrollPolicy = !!truncationOptions ? "null" : horizontalScrollPolicy;
        _isTruncated = false;
        this._truncatedText = this.text;
        if (!this._formatsChanged && FlowComposerBase.tlf_internal::computeBaseSWFContext(this._tf.flowComposer.swfContext) != FlowComposerBase.tlf_internal::computeBaseSWFContext(swfContext)) {
            this._formatsChanged = true;
        }
        this._tf.flowComposer.swfContext = swfContext;
        if (this._formatsChanged) {
            this._tf.tlf_internal::normalize();
            this._formatsChanged = false;
        }
        this._tf.flowComposer.compose();
        if (truncationOptions) {
            this.tlf_internal::doTruncation(_loc4_, _loc2_, _loc3_);
        }
        var _loc5_: Number = 0;
        var _loc6_: Rectangle = containerController.getContentBounds();
        if (_loc4_ == BlockProgression.RL) {
            _loc5_ += _loc2_ ? _loc6_.width : compositionBounds.width;
        }
        _loc6_.left += _loc5_;
        _loc6_.right += _loc5_;
        _loc6_.top += compositionBounds.y;
        _loc6_.bottom += compositionBounds.y;
        if (this._tf.tlf_internal::backgroundManager) {
            tlf_internal::processBackgroundColors(this._tf, param1, _loc5_, compositionBounds.y, containerController.compositionWidth, containerController.compositionHeight);
        }
        callbackWithTextLines(param1, _loc5_, compositionBounds.y);
        setContentBounds(_loc6_);
        containerController.tlf_internal::clearCompositionResults();
    }

    tlf_internal function doTruncation(param1: String, param2: Boolean, param3: Boolean): void {
        var _loc4_: Boolean = false;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: int = 0;
        param1 = this._tf.computedFormat.blockProgression;
        if (!doesComposedTextFit(truncationOptions.lineCountLimit, this._tf.textLength, param1)) {
            _isTruncated = true;
            _loc4_ = false;
            _loc5_ = this._span.text;
            tlf_internal::computeLastAllowedLineIndex(truncationOptions.lineCountLimit);
            if (_truncationLineIndex >= 0) {
                this.measureTruncationIndicator(compositionBounds, truncationOptions.truncationIndicator);
                _truncationLineIndex -= -1;
                if (_truncationLineIndex >= 0) {
                    if (this._tf.computedFormat.lineBreak == LineBreak.EXPLICIT || (param1 == BlockProgression.TB ? param2 : param3)) {
                        _loc6_ = (_loc7_ = tlf_internal::_factoryComposer._lines[_truncationLineIndex] as TextLine).userData + _loc7_.rawTextLength;
                    } else {
                        _loc8_ = param1 == BlockProgression.TB ? 0 : compositionBounds.height;
                        if (this.paragraphFormat) {
                            _loc8_ -= Number(this.paragraphFormat.paragraphSpaceAfter) + Number(this.paragraphFormat.paragraphSpaceBefore);
                            if (_truncationLineIndex == 0) {
                                _loc8_ -= this.paragraphFormat.textIndent;
                            }
                        }
                        _loc9_ = _loc8_ - (_measurementLines[-1] as TextLine).unjustifiedTextWidth;
                        _loc6_ = this.getTruncationPosition(tlf_internal::_factoryComposer._lines[_truncationLineIndex], _loc9_);
                    }
                    if (!_pass0Lines) {
                        _pass0Lines = new Array();
                    }
                    _pass0Lines = tlf_internal::_factoryComposer.tlf_internal::swapLines(_pass0Lines);
                    this._para = this._para.deepCopy() as ParagraphElement;
                    this._span = this._para.getChildAt(0) as SpanElement;
                    this._tf.replaceChildren(0, 1, this._para);
                    this._tf.tlf_internal::normalize();
                    this._span.replaceText(_loc6_, this._span.textLength, truncationOptions.truncationIndicator);
                    while (true) {
                        this._tf.flowComposer.compose();
                        if (doesComposedTextFit(truncationOptions.lineCountLimit, this._tf.textLength, param1)) {
                            _loc4_ = true;
                            break;
                        }
                        if (_loc6_ == 0) {
                            break;
                        }
                        _loc10_ = getNextTruncationPosition(_loc6_);
                        this._span.replaceText(_loc10_, _loc6_, null);
                        _loc6_ = _loc10_;
                    }
                }
                _measurementLines.splice(0);
            }
            if (_loc4_) {
                this._truncatedText = this._span.text;
            } else {
                this._truncatedText = "";
                tlf_internal::_factoryComposer._lines.splice(0);
            }
            this._span.text = _loc5_;
        }
    }

    tlf_internal function get truncatedText(): String {
        return this._truncatedText;
    }

    private function measureTruncationIndicator(param1: Rectangle, param2: String): void {
        var _loc3_: Array = tlf_internal::_factoryComposer.tlf_internal::swapLines(measurementLines());
        var _loc4_: StringTextLineFactory;
        (_loc4_ = measurementFactory()).compositionBounds = param1;
        _loc4_.text = param2;
        _loc4_.spanFormat = this.spanFormat;
        _loc4_.paragraphFormat = this.paragraphFormat;
        _loc4_.textFlowFormat = this.textFlowFormat;
        _loc4_.truncationOptions = null;
        _loc4_.createTextLinesInternal(noopfunction);
        tlf_internal::_factoryComposer.tlf_internal::swapLines(_loc3_);
    }

    private function getTruncationPosition(param1: TextLine, param2: Number): uint {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc3_: Number = 0;
        var _loc4_: int = param1.userData;
        while (_loc4_ < param1.userData + param1.rawTextLength) {
            _loc5_ = param1.getAtomIndexAtCharIndex(_loc4_);
            _loc6_ = param1.getAtomBounds(_loc5_);
            _loc3_ += _loc6_.width;
            if (_loc3_ > param2) {
                break;
            }
            _loc4_ = param1.getAtomTextBlockEndIndex(_loc5_);
        }
        param1.flushAtomData();
        return _loc4_;
    }
}
}
