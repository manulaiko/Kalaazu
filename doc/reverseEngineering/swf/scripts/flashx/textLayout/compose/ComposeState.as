package flashx.textLayout.compose {

import flash.text.engine.TextLine;

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.Direction;
import flashx.textLayout.formats.Float;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.VerticalAlign;
import flashx.textLayout.tlf_internal;
import flashx.textLayout.utils.Twips;

public class ComposeState extends BaseCompose {

    private static var _sharedComposeState: ComposeState;


    protected var _curLineIndex: int;

    protected var vjBeginLineIndex: int;

    protected var vjDisableThisParcel: Boolean;

    protected var _useExistingLine: Boolean;

    public function ComposeState() {
        super();
    }

    tlf_internal static function getComposeState(): ComposeState {
        var _loc1_: ComposeState = _sharedComposeState;
        if (_loc1_) {
            _sharedComposeState = null;
            return _loc1_;
        }
        return new ComposeState();
    }

    tlf_internal static function releaseComposeState(param1: ComposeState): void {
        param1.tlf_internal::releaseAnyReferences();
        _sharedComposeState = param1;
    }

    override protected function createParcelList(): ParcelList {
        return ParcelList.tlf_internal::getParcelList();
    }

    override protected function releaseParcelList(param1: ParcelList): void {
        ParcelList.tlf_internal::releaseParcelList(param1);
    }

    override public function composeTextFlow(param1: TextFlow, param2: int, param3: int): int {
        this._curLineIndex = -1;
        _curLine = null;
        this.vjBeginLineIndex = 0;
        this.vjDisableThisParcel = false;
        return super.composeTextFlow(param1, param2, param3);
    }

    override protected function initializeForComposer(param1: IFlowComposer, param2: int, param3: int, param4: int): void {
        var _loc5_: int = 0;
        _startComposePosition = param1.damageAbsoluteStart;
        if (param3 == -1) {
            if ((_loc5_ = param1.findControllerIndexAtPosition(_startComposePosition)) == -1) {
                _loc5_ = param1.numControllers - 1;
                while (_loc5_ != 0 && param1.getControllerAt(_loc5_).textLength == 0) {
                    _loc5_--;
                }
            }
        }
        _startController = param1.getControllerAt(_loc5_);
        if (_startController.computedFormat.verticalAlign != VerticalAlign.TOP) {
            _startComposePosition = _startController.absoluteStart;
        }
        super.initializeForComposer(param1, param2, _loc5_, param4);
    }

    override protected function composeInternal(param1: FlowGroupElement, param2: int): void {
        var _loc3_: int = 0;
        super.composeInternal(param1, param2);
        if (_curElement) {
            _loc3_ = this._curLineIndex;
            while (_loc3_ < _flowComposer.numLines) {
                _flowComposer.getLineAt(_loc3_++).tlf_internal::setController(null, -1);
            }
        }
    }

    override protected function doVerticalAlignment(param1: Boolean, param2: Parcel): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: * = null;
        if (param1 && _curParcel && this.vjBeginLineIndex != this._curLineIndex && !this.vjDisableThisParcel) {
            _loc3_ = _curParcel.controller;
            if ((_loc4_ = _loc3_.computedFormat.verticalAlign) == VerticalAlign.JUSTIFY) {
                _loc5_ = _loc3_.tlf_internal::numFloats - 1;
                while (_loc5_ >= 0 && param1) {
                    if ((_loc6_ = _loc3_.tlf_internal::getFloatAt(_loc5_)).floatType != Float.NONE) {
                        param1 = false;
                    }
                    _loc5_--;
                }
            }
            if (param1 && _loc4_ != VerticalAlign.TOP) {
                _loc7_ = _flowComposer.findLineIndexAtPosition(_curElementStart + _curElementOffset);
                if (this.vjBeginLineIndex < _loc7_) {
                    _loc8_ = 0;
                    _loc9_ = 0;
                    _loc10_ = (_flowComposer as StandardFlowComposer).lines;
                    if (_loc3_.tlf_internal::numFloats > 0) {
                        _loc8_ = _loc3_.tlf_internal::findFloatIndexAtOrAfter(_loc10_[this.vjBeginLineIndex].absoluteStart);
                        _loc9_ = _loc3_.tlf_internal::findFloatIndexAfter(_curElementStart + _curElementOffset);
                    }
                    this.applyVerticalAlignmentToColumn(_loc3_, _loc4_, _loc10_, this.vjBeginLineIndex, _loc7_ - this.vjBeginLineIndex, _loc8_, _loc9_);
                }
            }
        }
        this.vjDisableThisParcel = false;
        this.vjBeginLineIndex = this._curLineIndex;
    }

    override protected function applyVerticalAlignmentToColumn(param1: ContainerController, param2: String, param3: Array, param4: int, param5: int, param6: int, param7: int): void {
        var _loc8_: * = null;
        var _loc9_: * = null;
        super.applyVerticalAlignmentToColumn(param1, param2, param3, param4, param5, param6, param7);
        for each(_loc8_ in param1.tlf_internal::composedLines) {
            (_loc9_ = _loc8_.userData as TextFlowLine).tlf_internal::createShape(_blockProgression, _loc8_);
        }
    }

    override protected function finalParcelAdjustment(param1: ContainerController): void {
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
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
            _loc10_ = _flowComposer.findLineIndexAtPosition(_curParcelStart);
            while (_loc10_ < this._curLineIndex) {
                if ((_loc11_ = _flowComposer.getLineAt(_loc10_)).paragraph != _loc7_) {
                    if ((_loc9_ = (_loc8_ = (_loc7_ = _loc11_.paragraph).computedFormat).direction) != Direction.LTR) {
                        _loc6_ = _loc8_.paragraphEndIndent;
                    }
                }
                if (_loc9_ == Direction.LTR) {
                    _loc6_ = Math.max(_loc11_.lineOffset, 0);
                }
                _loc6_ = _loc5_ ? _loc11_.y - _loc6_ : _loc11_.x - _loc6_;
                if (_loc12_ = TextFlowLine.tlf_internal::findNumberLine(_loc11_.getTextLine(true))) {
                    _loc13_ = _loc5_ ? _loc12_.y + _loc11_.y : _loc12_.x + _loc11_.x;
                    _loc6_ = Math.min(_loc6_, _loc13_);
                }
                if (_loc5_) {
                    _loc3_ = Math.min(_loc6_, _loc3_);
                } else {
                    _loc2_ = Math.min(_loc6_, _loc2_);
                }
                _loc10_++;
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

    override protected function endLine(param1: TextLine): void {
        super.endLine(param1);
        if (!this._useExistingLine) {
            (_flowComposer as StandardFlowComposer).addLine(_curLine, this._curLineIndex);
        }
        commitLastLineState(_curLine);
        ++this._curLineIndex;
    }

    override protected function composeParagraphElement(param1: ParagraphElement, param2: int): Boolean {
        if (this._curLineIndex < 0) {
            this._curLineIndex = _flowComposer.findLineIndexAtPosition(_curElementStart + _curElementOffset);
        }
        return super.composeParagraphElement(param1, param2);
    }

    override protected function composeNextLine(): TextLine {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = false;
        var _loc8_: Number = NaN;
        var _loc1_: int = _curElementStart + _curElementOffset - _curParaStart;
        var _loc2_: TextFlowLine = this._curLineIndex < _flowComposer.numLines ? (_flowComposer as StandardFlowComposer).lines[this._curLineIndex] : null;
        var _loc3_: Boolean = Boolean(_loc2_) && (!_loc2_.tlf_internal::isDamaged() || _loc2_.validity == FlowDamageType.GEOMETRY);
        if (Boolean(_listItemElement) && _listItemElement.getAbsoluteStart() == _curElementStart + _curElementOffset) {
            if (_loc3_ && (_loc6_ = _loc2_.tlf_internal::peekTextLine()) != null) {
                _loc4_ = TextFlowLine.tlf_internal::findNumberLine(_loc6_);
            } else {
                _loc7_ = _curParaElement.computedFormat.direction == Direction.RTL;
                _loc4_ = TextFlowLine.tlf_internal::createNumberLine(_listItemElement, _curParaElement, _flowComposer.swfContext, _loc7_ ? 0 : _parcelList.leftMargin);
            }
            pushInsideListItemMargins(_loc4_);
        }
        _parcelList.getLineSlug(_lineSlug, 0, 1, _textIndent, true);
        if (_loc3_ && Twips.to(_lineSlug.width) != _loc2_.tlf_internal::outerTargetWidthTW) {
            _loc3_ = false;
        }
        _curLine = _loc3_ ? _loc2_ : null;
        while (true) {
            while (!_curLine) {
                _loc3_ = false;
                if (_loc5_ = this.createTextLine(_lineSlug.width, true)) {
                    break;
                }
                if ((_loc8_ = _curParcel.findNextTransition(_lineSlug.depth)) >= Number.MAX_VALUE) {
                    advanceToNextParcel();
                    if (!_parcelList.atEnd()) {
                        if (_parcelList.getLineSlug(_lineSlug, 0, 1, _textIndent, true)) {
                            continue;
                        }
                    }
                    popInsideListItemMargins(_loc4_);
                    return null;
                }
                _parcelList.addTotalDepth(_loc8_ - 0);
                if (!_parcelList.getLineSlug(_lineSlug, 0, 1, _textIndent, true)) {
                    return null;
                }
            }
            if (!_loc5_) {
                _loc5_ = _curLine.getTextLine(true);
            }
            if (fitLineToParcel(_loc5_, !_loc3_, _loc4_)) {
                break;
            }
            _curLine = null;
            if (_parcelList.atEnd()) {
                popInsideListItemMargins(_loc4_);
                return null;
            }
        }
        if (true) {
            _curLine.tlf_internal::clearDamage();
        }
        this._useExistingLine = _loc3_;
        popInsideListItemMargins(_loc4_);
        return _loc5_;
    }

    override protected function createTextLine(param1: Number, param2: Boolean): TextLine {
        _curLine = new TextFlowLine(null, null);
        var _loc3_: TextLine = super.createTextLine(param1, param2);
        if (_loc3_) {
            _loc3_.doubleClickEnabled = true;
        } else {
            _curLine = null;
        }
        return _loc3_;
    }
}
}
