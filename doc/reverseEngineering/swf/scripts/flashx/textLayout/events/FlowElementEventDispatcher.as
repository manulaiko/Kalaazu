package flashx.textLayout.events {

import flash.events.EventDispatcher;

import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

public class FlowElementEventDispatcher extends EventDispatcher {


    tlf_internal var _listenerCount: int = 0;

    tlf_internal var _element: FlowElement;

    public function FlowElementEventDispatcher(param1: FlowElement) {
        this.tlf_internal::_element = param1;
        super(null);
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        var _loc6_: * = null;
        super.addEventListener(param1, param2, param3, param4, param5);
        ++this.tlf_internal::_listenerCount;
        if (this.tlf_internal::_listenerCount == 1) {
            if (_loc6_ = this.tlf_internal::_element.getTextFlow()) {
                _loc6_.tlf_internal::incInteractiveObjectCount();
            }
        }
        this.tlf_internal::_element.tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this.tlf_internal::_element, 0, this.tlf_internal::_element.textLength);
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        var _loc4_: * = null;
        super.removeEventListener(param1, param2, param3);
        --this.tlf_internal::_listenerCount;
        if (this.tlf_internal::_listenerCount == 0) {
            if (_loc4_ = this.tlf_internal::_element.getTextFlow()) {
                _loc4_.tlf_internal::decInteractiveObjectCount();
            }
        }
        this.tlf_internal::_element.tlf_internal::modelChanged(ModelChange.ELEMENT_MODIFIED, this.tlf_internal::_element, 0, this.tlf_internal::_element.textLength);
    }
}
}
