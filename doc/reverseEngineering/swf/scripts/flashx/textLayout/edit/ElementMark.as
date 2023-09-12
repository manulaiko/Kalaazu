package flashx.textLayout.edit {

import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

public class ElementMark {


    tlf_internal var _elemStart: int;

    tlf_internal var _indexChain: Array;

    public function ElementMark(param1: FlowElement, param2: int) {
        super();
        this.tlf_internal::_elemStart = param2;
        this.tlf_internal::_indexChain = [];
        var _loc3_: FlowGroupElement = param1.parent;
        while (_loc3_ != null) {
            this.tlf_internal::_indexChain.splice(0, 0, _loc3_.getChildIndex(param1));
            param1 = _loc3_;
            _loc3_ = _loc3_.parent;
        }
    }

    public function get elemStart(): int {
        return this.tlf_internal::_elemStart;
    }

    public function findElement(param1: TextFlow): FlowElement {
        var _loc3_: int = 0;
        var _loc2_: FlowElement = param1;
        for each(_loc3_ in this.tlf_internal::_indexChain) {
            _loc2_ = (_loc2_ as FlowGroupElement).getChildAt(_loc3_);
        }
        return _loc2_;
    }
}
}
