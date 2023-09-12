package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.list.dropdownbox.DropDownBox;

public class DropDownBoxCreator extends AbstractCreator {


    public function DropDownBoxCreator() {
        super();
    }

    public function create(param1: XML): ICoreponent {
        var _loc2_: ICoreponent = new DropDownBox();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
