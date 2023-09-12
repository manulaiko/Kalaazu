package flashx.textLayout.operations {

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.MementoList;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.SubParagraphGroupElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class CreateSubParagraphGroupOperation extends FlowTextOperation {


    private var _spgeParentMarker: ElementMark;

    private var _format: ITextLayoutFormat;

    private var _mementoList: MementoList;

    private var _spgeElement: SubParagraphGroupElement;

    private var _postOpSelectionState: SelectionState;

    public function CreateSubParagraphGroupOperation(param1: SelectionState, param2: FlowGroupElement = null, param3: ITextLayoutFormat = null) {
        super(param1);
        this._format = param3;
        this.parent = param2;
        this._mementoList = new MementoList(param1.textFlow);
    }

    public function get parent(): FlowGroupElement {
        return !!this._spgeParentMarker ? this._spgeParentMarker.findElement(originalSelectionState.textFlow) as FlowGroupElement : null;
    }

    public function set parent(param1: FlowGroupElement): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        if (!param1) {
            _loc2_ = this.absoluteStart;
            _loc3_ = this.absoluteEnd;
            _loc5_ = (_loc4_ = textFlow.findLeaf(_loc2_).getParagraph()).getAbsoluteStart();
            if (_loc2_ < _loc5_ + _loc4_.textLength - 1) {
                if (_loc3_ >= _loc5_ + _loc4_.textLength - 1) {
                    _loc3_ = _loc5_ + _loc4_.textLength;
                }
                param1 = _loc4_;
                while (true) {
                    _loc6_ = param1.findChildIndexAtPosition(_loc2_);
                    if ((_loc7_ = param1.getChildAt(_loc6_) as FlowGroupElement) == null) {
                        break;
                    }
                    _loc2_ -= _loc7_.parentRelativeStart;
                    _loc3_ -= _loc7_.parentRelativeStart;
                    if (_loc3_ > _loc7_.textLength) {
                        break;
                    }
                    param1 = _loc7_;
                }
            }
        } else if (!(param1 is SubParagraphGroupElementBase) || !(param1 is ParagraphElement)) {
            param1 = null;
        }
        this._spgeParentMarker = !!param1 ? new ElementMark(param1, 0) : null;
    }

    public function get format(): ITextLayoutFormat {
        return this._format;
    }

    public function set format(param1: ITextLayoutFormat): void {
        this._format = param1;
    }

    public function get newSubParagraphGroupElement(): SubParagraphGroupElement {
        return this._spgeElement;
    }

    override public function doOperation(): Boolean {
        var _loc4_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (absoluteStart == absoluteEnd) {
            return false;
        }
        var _loc1_: FlowGroupElement = this.parent;
        if (!_loc1_) {
            return false;
        }
        var _loc2_: int = 0;
        var _loc3_: int = absoluteStart - _loc1_.getAbsoluteStart();
        var _loc5_: int;
        if ((_loc5_ = absoluteEnd - _loc1_.getAbsoluteStart()) >= _loc1_.getAbsoluteStart() + _loc1_.textLength - 1) {
            _loc5_ = _loc1_.getAbsoluteStart() + _loc1_.textLength;
        }
        if (_loc3_ > 0) {
            _loc2_ = _loc1_.findChildIndexAtPosition(_loc3_);
            if ((_loc6_ = _loc1_.getChildAt(_loc2_)).parentRelativeStart != _loc3_) {
                if (_loc6_ is FlowGroupElement) {
                    this._mementoList.push(ModelEdit.splitElement(textFlow, _loc6_ as FlowGroupElement, _loc3_ - _loc6_.parentRelativeStart));
                } else {
                    _loc6_.splitAtPosition(_loc3_ - _loc6_.parentRelativeStart);
                }
                _loc2_++;
            }
        }
        if (_loc5_ >= 0) {
            if (_loc5_ >= _loc1_.textLength - 1) {
                if ((_loc4_ = _loc1_.numChildren) != 0) {
                    if ((_loc7_ = _loc1_.getChildAt(_loc4_ - 1)) is SpanElement && _loc7_.textLength == 1 && (_loc7_ as SpanElement).tlf_internal::hasParagraphTerminator) {
                        _loc4_--;
                    }
                }
            } else {
                _loc4_ = _loc1_.findChildIndexAtPosition(_loc5_);
                if ((_loc6_ = _loc1_.getChildAt(_loc4_)).parentRelativeStart != _loc5_) {
                    if (_loc6_ is FlowGroupElement) {
                        this._mementoList.push(ModelEdit.splitElement(textFlow, _loc6_ as FlowGroupElement, _loc5_ - _loc6_.parentRelativeStart));
                    } else {
                        _loc6_.splitAtPosition(_loc5_ - _loc6_.parentRelativeStart);
                    }
                    _loc4_++;
                }
            }
        } else {
            _loc4_ = _loc2_ + 1;
        }
        this._spgeElement = new SubParagraphGroupElement();
        this._spgeElement.format = this.format;
        this._mementoList.push(ModelEdit.addElement(textFlow, this._spgeElement, _loc1_, _loc4_));
        while (_loc2_ < _loc4_) {
            if ((_loc6_ = _loc1_.getChildAt(_loc2_)).textLength == 0) {
                _loc2_++;
            } else {
                this._mementoList.push(ModelEdit.moveElement(textFlow, _loc6_, this._spgeElement, this._spgeElement.numChildren));
                _loc4_--;
            }
        }
        if (false && false) {
            textFlow.tlf_internal::normalize();
            this._postOpSelectionState = new SelectionState(textFlow, this._spgeElement.getAbsoluteStart(), this._spgeElement.getAbsoluteStart() + this._spgeElement.textLength);
            textFlow.interactionManager.setSelectionState(this._postOpSelectionState);
        }
        return true;
    }

    override public function undo(): SelectionState {
        this._mementoList.undo();
        return originalSelectionState;
    }

    override public function redo(): SelectionState {
        this._mementoList.redo();
        return this._postOpSelectionState;
    }
}
}
