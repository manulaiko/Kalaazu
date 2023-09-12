package flashx.textLayout.operations {

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.MementoList;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.ListElement;
import flashx.textLayout.elements.ListItemElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class CreateListOperation extends FlowTextOperation {


    private var _listParentMarker: ElementMark;

    private var _mementoList: MementoList;

    private var _listFormat: ITextLayoutFormat;

    private var _listElement: ListElement;

    private var _postOpSelectionState: SelectionState;

    public function CreateListOperation(param1: SelectionState, param2: FlowGroupElement = null, param3: ITextLayoutFormat = null) {
        super(param1);
        this.parent = param2;
        this._listFormat = param3;
        this._mementoList = new MementoList(param1.textFlow);
    }

    public function get parent(): FlowGroupElement {
        return !!this._listParentMarker ? this._listParentMarker.findElement(originalSelectionState.textFlow) as FlowGroupElement : null;
    }

    public function set parent(param1: FlowGroupElement): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        if (!param1) {
            param1 = textFlow;
            _loc2_ = this.absoluteStart;
            _loc3_ = this.absoluteEnd;
            while (true) {
                _loc4_ = param1.findChildIndexAtPosition(_loc2_);
                if ((_loc5_ = param1.getChildAt(_loc4_) as FlowGroupElement) is ParagraphElement) {
                    break;
                }
                _loc2_ -= _loc5_.parentRelativeStart;
                _loc3_ -= _loc5_.parentRelativeStart;
                if (_loc3_ >= _loc5_.textLength) {
                    break;
                }
                param1 = _loc5_;
            }
        } else if (param1 is SubParagraphGroupElementBase) {
            param1 = param1.getParagraph().parent;
        }
        this._listParentMarker = new ElementMark(param1, 0);
    }

    public function get listFormat(): ITextLayoutFormat {
        return this._listFormat;
    }

    public function set listFormat(param1: ITextLayoutFormat): void {
        this._listFormat = param1;
    }

    public function get newListElement(): ListElement {
        return this._listElement;
    }

    override public function doOperation(): Boolean {
        var _loc4_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc1_: FlowGroupElement = this.parent;
        var _loc2_: int = 0;
        var _loc3_: int = absoluteStart - _loc1_.getAbsoluteStart();
        var _loc5_: int = absoluteEnd - _loc1_.getAbsoluteStart();
        if (_loc3_ > 0) {
            _loc2_ = _loc1_.findChildIndexAtPosition(_loc3_);
            if ((_loc6_ = _loc1_.getChildAt(_loc2_) as FlowGroupElement).parentRelativeStart != _loc3_) {
                this._mementoList.push(ModelEdit.splitElement(textFlow, _loc6_, _loc3_ - _loc6_.parentRelativeStart));
                if (_loc6_ is ParagraphElement) {
                    _loc5_++;
                }
                _loc2_++;
            }
        }
        if (_loc5_ >= 0) {
            if (_loc5_ >= _loc1_.textLength - 1) {
                _loc4_ = _loc1_.numChildren;
            } else {
                _loc4_ = _loc1_.findChildIndexAtPosition(_loc5_);
                if ((_loc6_ = _loc1_.getChildAt(_loc4_) as FlowGroupElement).parentRelativeStart != _loc5_) {
                    this._mementoList.push(ModelEdit.splitElement(textFlow, _loc6_, _loc5_ - _loc6_.parentRelativeStart));
                    _loc4_++;
                }
            }
        } else {
            _loc4_ = _loc2_ + 1;
        }
        this._listElement = new ListElement();
        this._listElement.format = this.listFormat;
        if (_loc2_ == _loc1_.numChildren) {
            _loc6_ = _loc1_.getChildAt(_loc1_.numChildren - 1) as FlowGroupElement;
            this._mementoList.push(ModelEdit.splitElement(textFlow, _loc6_, _loc6_.textLength));
            this._mementoList.push(ModelEdit.addElement(textFlow, this._listElement, _loc1_, _loc1_.numChildren));
            if (!(_loc6_ is ListItemElement)) {
                _loc7_ = new ListItemElement();
                this._mementoList.push(ModelEdit.addElement(textFlow, _loc7_, this._listElement, this._listElement.numChildren));
                this._mementoList.push(ModelEdit.moveElement(textFlow, _loc6_, _loc7_, _loc7_.numChildren));
                if (_loc7_.tlf_internal::normalizeNeedsInitialParagraph()) {
                    this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc7_, 0));
                }
            } else {
                this._mementoList.push(ModelEdit.moveElement(textFlow, _loc6_, this._listElement, this._listElement.numChildren));
            }
        } else {
            this._mementoList.push(ModelEdit.addElement(textFlow, this._listElement, _loc1_, _loc4_));
            if (_loc1_ is ListItemElement && (_loc1_ as ListItemElement).tlf_internal::normalizeNeedsInitialParagraph()) {
                this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc1_, 0));
                _loc2_++;
                _loc4_++;
            }
            if (_loc2_ == _loc4_) {
                _loc7_ = new ListItemElement();
                this._mementoList.push(ModelEdit.addElement(textFlow, _loc7_, this._listElement, 0));
                this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc7_, 0));
            } else {
                while (_loc2_ < _loc4_) {
                    if ((_loc6_ = _loc1_.getChildAt(_loc2_) as FlowGroupElement) is ListItemElement) {
                        _loc7_ = _loc6_ as ListItemElement;
                        this._mementoList.push(ModelEdit.moveElement(textFlow, _loc7_, this._listElement, this._listElement.numChildren));
                        if (!(_loc7_.getChildAt(0) is ParagraphElement)) {
                            this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc7_, 0));
                        }
                    } else {
                        _loc7_ = new ListItemElement();
                        this._mementoList.push(ModelEdit.addElement(textFlow, _loc7_, this._listElement, this._listElement.numChildren));
                        this._mementoList.push(ModelEdit.moveElement(textFlow, _loc6_, _loc7_, _loc7_.numChildren));
                        if (_loc7_.tlf_internal::normalizeNeedsInitialParagraph()) {
                            this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc7_, 0));
                        }
                        _loc6_ = _loc7_;
                    }
                    _loc6_.tlf_internal::normalizeRange(0, _loc6_.textLength);
                    _loc4_--;
                }
            }
            if ((Boolean(_loc8_ = _loc1_ as ListItemElement)) && _loc8_.tlf_internal::normalizeNeedsInitialParagraph()) {
                this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc8_, 0));
            }
            if ((Boolean(_loc8_ = _loc1_.parent as ListItemElement)) && _loc8_.tlf_internal::normalizeNeedsInitialParagraph()) {
                this._mementoList.push(ModelEdit.addElement(textFlow, new ParagraphElement(), _loc8_, 0));
            }
        }
        if (false && false) {
            textFlow.tlf_internal::normalize();
            this._postOpSelectionState = new SelectionState(textFlow, this._listElement.getAbsoluteStart(), this._listElement.getAbsoluteStart() + this._listElement.textLength - 1);
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
