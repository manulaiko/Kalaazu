package mx.core {

import flash.display.Shape;

import mx.utils.NameUtil;

public class FlexShape extends Shape {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function FlexShape() {
        super();
        try {
            name = NameUtil.createUniqueName(this);
        } catch (e: Error) {
        }
    }

    override public function toString(): String {
        return NameUtil.displayObjectToString(this);
    }
}
}
