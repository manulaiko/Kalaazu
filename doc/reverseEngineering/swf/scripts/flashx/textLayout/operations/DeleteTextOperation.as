package flashx.textLayout.operations {

import flashx.textLayout.edit.IMemento;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.PointFormat;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.tlf_internal;

public class DeleteTextOperation extends FlowTextOperation {


    private var _memento: IMemento;

    private var _allowMerge: Boolean;

    private var _pendingFormat: PointFormat;

    private var _deleteSelectionState: SelectionState = null;

    public function DeleteTextOperation(param1: SelectionState, param2: SelectionState = null, param3: Boolean = false) {
        this._deleteSelectionState = !!param2 ? param2 : param1;
        super(this._deleteSelectionState);
        originalSelectionState = param1;
        this._allowMerge = param3;
    }

    public function get allowMerge(): Boolean {
        return this._allowMerge;
    }

    public function set allowMerge(param1: Boolean): void {
        this._allowMerge = param1;
    }

    public function get deleteSelectionState(): SelectionState {
        return this._deleteSelectionState;
    }

    public function set deleteSelectionState(param1: SelectionState): void {
        this._deleteSelectionState = param1;
    }

    override public function doOperation(): Boolean {
        var _loc1_: * = null;
        if (absoluteStart == absoluteEnd) {
            return false;
        }
        this._pendingFormat = PointFormat.tlf_internal::createFromFlowElement(textFlow.findLeaf(absoluteStart));
        if (this._pendingFormat.linkElement) {
            this._pendingFormat.linkElement = null;
        }
        if (this._pendingFormat.tcyElement) {
            this._pendingFormat.tcyElement = null;
        }
        this._memento = ModelEdit.deleteText(textFlow, absoluteStart, absoluteEnd, true);
        if (false && false) {
            _loc1_ = textFlow.interactionManager.getSelectionState();
            if (_loc1_.anchorPosition == _loc1_.activePosition) {
                _loc1_.pointFormat = PointFormat.tlf_internal::clone(this._pendingFormat);
                textFlow.interactionManager.setSelectionState(_loc1_);
            }
        }
        return true;
    }

    override public function undo(): SelectionState {
        if (this._memento) {
            this._memento.undo();
        }
        return originalSelectionState;
    }

    override public function redo(): SelectionState {
        if (this._memento) {
            this._memento.redo();
        }
        return new SelectionState(textFlow, absoluteStart, absoluteStart, this._pendingFormat);
    }

    override tlf_internal function merge(param1: FlowOperation): FlowOperation {
        if (this.endGeneration != param1.beginGeneration) {
            return null;
        }
        var _loc2_: DeleteTextOperation = param1 as DeleteTextOperation;
        if (_loc2_ == null || !_loc2_.allowMerge || !this._allowMerge) {
            return null;
        }
        return new CompositeOperation([this, param1]);
    }
}
}
