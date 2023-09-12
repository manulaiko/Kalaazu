package net.bigpoint.darkorbit.fui.builder.xml.creators.custom {

import net.bigpoint.darkorbit.fui.builder.xml.creators.AbstractCreator;
import net.bigpoint.darkorbit.fui.components.custom.ResultLabel;

public class ResultLabelBuilder extends AbstractCreator {


    public function ResultLabelBuilder() {
        super();
    }

    public function create(param1: XML): ResultLabel {
        var _loc2_: ResultLabel = new ResultLabel();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }
}
}
