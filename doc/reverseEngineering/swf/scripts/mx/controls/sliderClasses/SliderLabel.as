package mx.controls.sliderClasses {

import mx.controls.Label;
import mx.core.mx_internal;

public class SliderLabel extends Label {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function SliderLabel() {
        super();
    }

    override mx_internal function getMinimumText(param1: String): String {
        if (!param1 || param1.length < 1) {
            param1 = "W";
        }
        return param1;
    }
}
}
