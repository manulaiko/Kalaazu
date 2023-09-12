package flashx.textLayout.operations {

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.ListItemElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.formats.ListMarkerFormat;
import flashx.textLayout.tlf_internal;

public class SplitElementOperation extends FlowTextOperation {


    private var delSelOp: DeleteTextOperation;

    private var _targetMark: ElementMark;

    private var _memento: IMemento;

    private var _newElement: FlowGroupElement;

    public function SplitElementOperation(param1: SelectionState, param2: FlowGroupElement) {
        super(param1);
        this.targetElement = param2;
    }

    public function get targetElement(): FlowGroupElement {
        return this._targetMark.findElement(originalSelectionState.textFlow) as FlowGroupElement;
    }

    public function set targetElement(param1: FlowGroupElement): void {
        this._targetMark = new ElementMark(param1, 0);
    }

    public function get newElement(): FlowGroupElement {
        return this._newElement;
    }

    override public function doOperation(): Boolean {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc1_: * = this.targetElement;
        if (absoluteStart < absoluteEnd) {
            _loc2_ = _loc1_.getAbsoluteStart();
            _loc3_ = _loc2_ + _loc1_.textLength;
            this.delSelOp = new DeleteTextOperation(originalSelectionState);
            this.delSelOp.doOperation();
            if (absoluteStart <= _loc2_ && _loc3_ <= absoluteEnd) {
                if (_loc1_ is ParagraphElement) {
                    _loc1_ = textFlow.tlf_internal::findAbsoluteParagraph(absoluteStart);
                } else {
                    _loc1_ = null;
                }
            } else {
                _loc1_ = this.targetElement;
            }
        }
        if (_loc1_ != null && !(_loc1_ is SubParagraphGroupElementBase) && _loc1_.getTextFlow() == textFlow) {
            _loc4_ = 0;
            _loc5_ = absoluteStart - _loc1_.getAbsoluteStart();
            this._memento = ModelEdit.splitElement(textFlow, _loc1_, _loc5_);
            this._newElement = _loc1_.parent.getChildAt(_loc1_.parent.getChildIndex(_loc1_) + 1) as FlowGroupElement;
            if (this._newElement is ListItemElement && this._newElement.listMarkerFormat && this._newElement.listMarkerFormat.counterReset !== undefined) {
                (_loc6_ = new ListMarkerFormat(this._newElement.listMarkerFormat)).counterReset = undefined;
                this._newElement.listMarkerFormat = _loc6_;
            }
            if (false && _loc4_ != textFlow.textLength && _loc1_ is ParagraphElement) {
                textFlow.interactionManager.notifyInsertOrDelete(absoluteStart, 0 - _loc4_);
            }
        }
        return true;
    }

    override public function undo(): SelectionState {
        if (this._memento) {
            this._memento.undo();
        }
        this._newElement = null;
        return absoluteStart < absoluteEnd ? this.delSelOp.undo() : originalSelectionState;
    }

    override public function redo(): SelectionState {
        super.redo();
        return textFlow.interactionManager.getSelectionState();
    }
}
}
