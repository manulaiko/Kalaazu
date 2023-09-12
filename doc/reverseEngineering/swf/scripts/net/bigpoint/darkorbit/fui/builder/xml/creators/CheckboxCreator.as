package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;

public class CheckboxCreator extends AbstractCreator {


    public function CheckboxCreator() {
        super();
    }

    public function create(param1: XML): CheckBox {
        var _loc2_: CheckBox = new CheckBox();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
