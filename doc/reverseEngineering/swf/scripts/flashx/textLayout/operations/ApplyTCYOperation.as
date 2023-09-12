package flashx.textLayout.operations {

import flashx.textLayout.edit.IMemento;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.edit.TextFlowEdit;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.TCYElement;

public class ApplyTCYOperation extends FlowTextOperation {


    private var makeBegIdx: int;

    private var makeEndIdx: int;

    private var removeBegIdx: int;

    private var removeEndIdx: int;

    private var removeRedoBegIdx: int;

    private var removeRedoEndIdx: int;

    private var _memento: IMemento;

    private var _tcyOn: Boolean;

    private var _tcyElement: TCYElement;

    public function ApplyTCYOperation(param1: SelectionState, param2: Boolean) {
        super(param1);
        if (param2) {
            this.makeBegIdx = param1.absoluteStart;
            this.makeEndIdx = param1.absoluteEnd;
        } else {
            this.removeBegIdx = param1.absoluteStart;
            this.removeEndIdx = param1.absoluteEnd;
        }
        this._tcyOn = param2;
    }

    public function get tcyOn(): Boolean {
        return this._tcyOn;
    }

    public function set tcyOn(param1: Boolean): void {
        this._tcyOn = param1;
    }

    public function get newTCYElement(): TCYElement {
        return this._tcyElement;
    }

    override public function doOperation(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this._tcyOn && this.makeEndIdx <= this.makeBegIdx) {
            return false;
        }
        if (!this._tcyOn && this.removeEndIdx <= this.removeBegIdx) {
            return false;
        }
        if (this._tcyOn) {
            this._memento = ModelEdit.saveCurrentState(textFlow, this.makeBegIdx, this.makeEndIdx);
            if (TextFlowEdit.makeTCY(textFlow, this.makeBegIdx, this.makeEndIdx)) {
                _loc1_ = textFlow.findLeaf(this.makeBegIdx);
                this._tcyElement = _loc1_.getParentByType(TCYElement) as TCYElement;
            }
        } else {
            _loc1_ = textFlow.findLeaf(this.removeBegIdx);
            _loc2_ = _loc1_.getParentByType(TCYElement) as TCYElement;
            this.removeRedoBegIdx = this.removeBegIdx;
            this.removeRedoEndIdx = this.removeEndIdx;
            this.removeBegIdx = _loc2_.getAbsoluteStart();
            this.removeEndIdx = this.removeBegIdx + _loc2_.textLength;
            this._memento = ModelEdit.saveCurrentState(textFlow, this.removeBegIdx, this.removeEndIdx);
            TextFlowEdit.removeTCY(textFlow, this.removeRedoBegIdx, this.removeRedoEndIdx);
        }
        return true;
    }

    override public function undo(): SelectionState {
        this._memento.undo();
        return originalSelectionState;
    }

    override public function redo(): SelectionState {
        if (this._tcyOn) {
            TextFlowEdit.makeTCY(textFlow, this.makeBegIdx, this.makeEndIdx);
        } else {
            TextFlowEdit.removeTCY(textFlow, this.removeRedoBegIdx, this.removeRedoEndIdx);
        }
        return originalSelectionState;
    }
}
}
