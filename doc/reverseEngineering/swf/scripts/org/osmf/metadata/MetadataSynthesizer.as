package org.osmf.metadata {

import org.osmf.elements.compositeClasses.CompositionMode;

public class MetadataSynthesizer {


    public function MetadataSynthesizer() {
        super();
    }

    public function synthesize(param1: String, param2: Metadata, param3: Vector.<Metadata>, param4: String, param5: Metadata): Metadata {
        var _loc6_: * = null;
        if (param4 == CompositionMode.SERIAL && Boolean(param5)) {
            _loc6_ = param5.getValue(param1) as Metadata;
        } else {
            _loc6_ = param3.length >= 1 ? param3[0] : null;
        }
        return _loc6_;
    }
}
}
