package flashx.textLayout.compose {

import flash.text.engine.TextLine;

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.Direction;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.VerticalAlign;
import flashx.textLayout.tlf_internal;

public class SimpleCompose extends BaseCompose {


    protected var workingLine: TextFlowLine;

    public var _lines: Array;

    private var _vjLines: Array;

    private var vjBeginLineIndex: int = 0;

    private var vjDisableThisParcel: Boolean = false;

    private var vjType: String;

    private var _totalLength: Number;

    private var _resetLineHandler: Function;

    public function SimpleCompose() {
        this.workingLine = new TextFlowLine(null, null);
        super();
        this._lines = new Array();
        this._vjLines = new Array();
    }

    override protected function createParcelList(): ParcelList {
        return ParcelList.tlf_internal::getParcelList();
    }

    override protected function releaseParcelList(param1: ParcelList): void {
        ParcelList.tlf_internal::releaseParcelList(param1);
    }

    override protected function initializeForComposer(param1: IFlowComposer, param2: int, param3: int, param4: int): void {
        _startController = param1.getControllerAt(0);
        _startComposePosition = 0;
        super.initializeForComposer(param1, param2, 0, param4);
        this._vjLines.splice(0);
        this.vjBeginLineIndex = 0;
        this.vjDisableThisParcel = false;
        this.vjType = _startController.computedFormat.verticalAlign;
    }

    override public function composeTextFlow(param1: TextFlow, param2: int, param3: int): int {
        _flowComposer = param1.flowComposer as StandardFlowComposer;
        _curLine = this.workingLine;
        this._lines.splice(0);
        this._totalLength = 0;
        return super.composeTextFlow(param1, param2, param3);
    }

    override protected function doVerticalAlignment(param1: Boolean, param2: Parcel): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc3_: Parcel = parcelList.currentParcel;
        if (param1 && this.vjType != VerticalAlign.TOP && this.vjBeginLineIndex != this._lines.length && !this.vjDisableThisParcel) {
            _loc4_ = _curParcel.controller;
            _loc5_ = 0;
            _loc6_ = 0;
            if (_loc4_.tlf_internal::numFloats > 0) {
                _loc5_ = _loc4_.tlf_internal::findFloatIndexAtOrAfter(_curParcelStart);
                _loc6_ = _loc4_.tlf_internal::findFloatIndexAfter(_curElementStart + _curElementOffset);
            }
            applyVerticalAlignmentToColumn(_loc3_.controller, this.vjType, this._vjLines, 0, this._vjLines.length, _loc5_, _loc6_);
        }
        this._vjLines.splice(0);
        this.vjBeginLineIndex = this._lines.length;
        this.vjDisableThisParcel = false;
        if (param2) {
            this.vjType = param2.controller.computedFormat.verticalAlign;
        }
    }

    override protected function isLineVisible(param1: TextLine): Boolean {
        return param1 != null;
    }

    override protected function endLine(param1: TextLine): void {
        super.endLine(param1);
        _curLine.tlf_internal::createShape(_blockProgression, param1);
        if (this.textFlow.tlf_internal::backgroundManager) {
            this.textFlow.tlf_internal::backgroundManager.finalizeLine(_curLine);
        }
        param1.userData = this._totalLength;
        this._totalLength += param1.rawTextLength;
        this._lines.push(param1);
        if (this.vjType != VerticalAlign.TOP) {
            this._vjLines.push(new VJHelper(param1, _curLine.height));
        }
        commitLastLineState(_curLine);
    }

    public function get textFlow(): TextFlow {
        return _textFlow;
    }

    public function get resetLineHandler(): Function {
        return this._resetLineHandler;
    }

    public function set resetLineHandler(param1: Function): void {
        this._resetLineHandler = param1;
    }

    override protected function resetLine(param1: TextLine): void {
        super.resetLine(param1);
        if (this._resetLineHandler != null) {
            this._resetLineHandler(param1);
        }
    }

    override protected function composeNextLine(): TextLine {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = false;
        var _loc4_: Number = NaN;
        if (Boolean(_listItemElement) && _listItemElement.getAbsoluteStart() == _curElementStart + _curElementOffset) {
            _loc3_ = _curParaElement.computedFormat.direction == Direction.RTL;
            _loc1_ = TextFlowLine.tlf_internal::createNumberLine(_listItemElement, _curParaElement, _flowComposer.swfContext, _loc3_ ? 0 : _parcelList.leftMargin);
            pushInsideListItemMargins(_loc1_);
        }
        if (!_parcelList.getLineSlug(_lineSlug, 0, 0, _textIndent, true)) {
            return null;
        }
        loop0:
            while (true) {
                while (true) {
                    _loc2_ = createTextLine(_lineSlug.width, true);
                    if (_loc2_) {
                        if (fitLineToParcel(_loc2_, true, _loc1_)) {
                            break loop0;
                        }
                        continue loop0;
                    }
                    if ((_loc4_ = _curParcel.findNextTransition(_lineSlug.depth)) < Number.MAX_VALUE) {
                        _parcelList.addTotalDepth(_loc4_ - 0);
                        _parcelList.getLineSlug(_lineSlug, 0, 1, _textIndent, true);
                    } else {
                        advanceToNextParcel();
                        if (_parcelList.atEnd()) {
                            break;
                        }
                        if (!_parcelList.getLineSlug(_lineSlug, 0, 1, _textIndent, true)) {
                            break;
                        }
                    }
                }
                popInsideListItemMargins(_loc1_);
                return null;
            }
        popInsideListItemMargins(_loc1_);
        return _loc2_;
    }

    tlf_internal function swapLines(param1: Array): Array {
        var _loc2_: Array = this._lines;
        this._lines = param1;
        return _loc2_;
    }

    override protected function finalParcelAdjustment(param1: ContainerController): void {
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: Number = NaN;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: int = 0;
        var _loc22_: Number = NaN;
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        var _loc5_: * = _blockProgression == BlockProgression.RL;
        if (!isNaN(_parcelLogicalTop)) {
            if (_loc5_) {
                _loc4_ = _parcelLogicalTop;
            } else {
                _loc3_ = _parcelLogicalTop;
            }
        }
        if (!_measuring) {
            if (_loc5_) {
                _loc3_ = _accumulatedMinimumStart;
            } else {
                _loc2_ = _accumulatedMinimumStart;
            }
        } else {
            _loc7_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
            _loc15_ = null;
            for each(_loc6_ in this._lines) {
                if ((_loc17_ = (_loc16_ = param1.textFlow.findLeaf(_loc7_)).getParagraph()) != _loc15_) {
                    _loc13_ = 0;
                    _loc14_ = 0;
                    _loc20_ = _loc17_;
                    while (Boolean(_loc20_) && Boolean(_loc20_.parent)) {
                        if (_loc5_) {
                            _loc13_ += _loc20_.tlf_internal::getEffectivePaddingRight();
                            _loc14_ += _loc20_.tlf_internal::getEffectivePaddingTop();
                        } else {
                            _loc13_ += _loc20_.tlf_internal::getEffectivePaddingTop();
                            _loc14_ += _loc20_.tlf_internal::getEffectivePaddingLeft();
                        }
                        _loc20_ = _loc20_.parent;
                    }
                    _loc15_ = _loc17_;
                }
                _loc18_ = 0;
                if (_loc6_.numChildren > 0) {
                    _loc21_ = _loc16_.getAbsoluteStart();
                    _loc18_ = TextFlowLine.tlf_internal::getTextLineTypographicAscent(_loc6_, _loc16_, _loc21_, _loc7_ + _loc6_.rawTextLength);
                }
                if (null != _loc17_) {
                    if ((_loc12_ = _loc17_.computedFormat).direction == Direction.LTR) {
                        _loc8_ = Math.max(_loc12_.textIndent, 0);
                        _loc9_ = _loc12_.paragraphStartIndent;
                    } else {
                        _loc8_ = 0;
                        _loc9_ = _loc12_.paragraphEndIndent;
                    }
                }
                _loc9_ += _loc14_;
                _loc10_ = _loc6_.textBlockBeginIndex == 0 ? _loc9_ + _loc8_ : _loc9_;
                _loc10_ = _loc5_ ? _loc6_.y - _loc10_ : _loc6_.x - _loc10_;
                if (_loc19_ = TextFlowLine.tlf_internal::findNumberLine(_loc6_)) {
                    _loc22_ = _loc5_ ? _loc19_.y + _loc6_.y : _loc19_.x + _loc6_.x;
                    _loc10_ = Math.min(_loc10_, _loc22_);
                }
                if (_loc5_) {
                    _loc3_ = Math.min(_loc10_, _loc3_);
                    _loc4_ = Math.max(_loc6_.x + Math.max(_loc18_, _loc6_.ascent) + _loc13_, _loc4_);
                } else {
                    _loc2_ = Math.min(_loc10_, _loc2_);
                    if (_loc18_ < _loc6_.ascent) {
                        _loc18_ = _loc6_.ascent;
                    }
                    _loc3_ = Math.min(_loc6_.y - (_loc18_ + _loc13_), _loc3_);
                }
                _loc7_ += _loc6_.rawTextLength;
            }
        }
        if (_loc2_ != TextLine.MAX_LINE_WIDTH && Math.abs(_loc2_ - _parcelLeft) >= 1) {
            _parcelLeft = _loc2_;
        }
        if (_loc4_ != 0 && Math.abs(_loc4_ - _parcelRight) >= 1) {
            _parcelRight = _loc4_;
        }
        if (_loc3_ != TextLine.MAX_LINE_WIDTH && Math.abs(_loc3_ - _parcelTop) >= 1) {
            _parcelTop = _loc3_;
        }
    }

    override tlf_internal function releaseAnyReferences(): void {
        super.tlf_internal::releaseAnyReferences();
        this.workingLine.tlf_internal::initialize(null, 0, 0, 0, 0, null);
        this.resetLineHandler = null;
    }
}
}

import flash.text.engine.TextLine;

import flashx.textLayout.compose.IVerticalJustificationLine;

class VJHelper implements IVerticalJustificationLine {


    private var _line: TextLine;

    private var _height: Number;

    function VJHelper(param1: TextLine, param2: Number) {
        super();
        this._line = param1;
        this._height = param2;
    }

    public function get x(): Number {
        return this._line.x;
    }

    public function set x(param1: Number): void {
        this._line.x = param1;
    }

    public function get y(): Number {
        return this._line.y;
    }

    public function set y(param1: Number): void {
        this._line.y = param1;
    }

    public function get ascent(): Number {
        return this._line.ascent;
    }

    public function get descent(): Number {
        return this._line.descent;
    }

    public function get height(): Number {
        return this._height;
    }
}
