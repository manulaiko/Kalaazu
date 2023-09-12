package mx.effects.effectClasses {

import mx.core.mx_internal;
import mx.effects.EffectTargetFilter;

public class AddRemoveEffectTargetFilter extends EffectTargetFilter {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public var add: Boolean = true;

    public function AddRemoveEffectTargetFilter() {
        super();
        filterProperties = ["parent"];
    }

    override protected function defaultFilterFunction(param1: Array, param2: Object): Boolean {
        var _loc5_: * = null;
        var _loc3_: int = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = param1[_loc4_]).target == param2) {
                if (this.add) {
                    return _loc5_.start["parent"] == null && _loc5_.end["parent"] != null;
                }
                return _loc5_.start["parent"] != null && _loc5_.end["parent"] == null;
            }
            _loc4_++;
        }
        return false;
    }
}
}
