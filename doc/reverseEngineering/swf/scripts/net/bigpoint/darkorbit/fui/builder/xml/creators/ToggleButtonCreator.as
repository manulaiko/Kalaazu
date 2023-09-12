package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.buttons.toggle.ToggleButton;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

public class ToggleButtonCreator extends AbstractCreator {


    public function ToggleButtonCreator() {
        super();
    }

    public function create(param1: XML): ICoreponent {
        var _loc2_: ToggleButton = new ToggleButton();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
