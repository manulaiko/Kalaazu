package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;

public class ScrollContainerCreator extends ContainerCreator implements IXMLNodeCreator {


    public function ScrollContainerCreator() {
        super();
    }

    override public function create(param1: XML): ICoreponent {
        var _loc2_: ScrollContainer = new ScrollContainer();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
