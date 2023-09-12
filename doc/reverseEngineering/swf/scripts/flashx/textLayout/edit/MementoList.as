package flashx.textLayout.edit {

import flashx.textLayout.elements.TextFlow;

public class MementoList implements IMemento {


    private var _mementoList: Array;

    public function MementoList(param1: TextFlow) {
        super();
    }

    public function push(param1: IMemento): void {
        if (param1) {
            this.mementoList.push(param1);
        }
    }

    private function get mementoList(): Array {
        if (!this._mementoList) {
            this._mementoList = [];
        }
        return this._mementoList;
    }

    public function undo(): * {
        var _loc2_: * = null;
        var _loc1_: * = [];
        if (this._mementoList) {
            this._mementoList.reverse();
            for each(_loc2_ in this._mementoList) {
                _loc1_.push(_loc2_.undo());
            }
            this._mementoList.reverse();
        }
        return _loc1_;
    }

    public function redo(): * {
        var _loc2_: * = null;
        var _loc1_: * = [];
        for each(_loc2_ in this._mementoList) {
            _loc1_.push(_loc2_.redo());
        }
        return _loc1_;
    }
}
}
