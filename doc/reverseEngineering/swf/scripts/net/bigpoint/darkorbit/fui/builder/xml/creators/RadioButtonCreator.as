package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.buttons.radio.RadioButton;

public class RadioButtonCreator extends AbstractCreator {


    public function RadioButtonCreator() {
        super();
    }

    public function create(param1: XML): RadioButton {
        var _loc2_: RadioButton = new RadioButton();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
