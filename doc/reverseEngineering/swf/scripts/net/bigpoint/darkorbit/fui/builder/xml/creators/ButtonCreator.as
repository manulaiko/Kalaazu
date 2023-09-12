package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

public class ButtonCreator extends AbstractCreator implements IXMLNodeCreator {


    public function ButtonCreator() {
        super();
    }

    public function create(param1: XML): ICoreponent {
        var _loc2_: Button = new Button();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
