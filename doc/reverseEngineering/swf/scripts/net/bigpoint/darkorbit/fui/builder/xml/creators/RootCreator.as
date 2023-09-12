package net.bigpoint.darkorbit.fui.builder.xml.creators {

import flash.display.DisplayObjectContainer;

public class RootCreator extends AbstractCreator {


    public function RootCreator() {
        super();
    }

    public function mapAttributes(param1: XML, param2: DisplayObjectContainer): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (param2) {
            _loc3_ = param2;
            _loc4_ = param1.attributes();
            for each(_loc5_ in _loc4_) {
                _loc6_ = _loc5_.name();
                if ((_loc7_ = _loc3_ as Object).hasOwnProperty(_loc6_)) {
                    _loc8_ = (_loc8_ = _loc5_.valueOf()) == "true" ? true : (_loc8_ == "false" ? false : _loc8_);
                    _loc7_[_loc6_] = _loc8_;
                }
            }
        }
    }
}
}
