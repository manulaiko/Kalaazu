package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.builder.xml.factories.LayoutFactory;
import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

public class ContainerCreator extends AbstractCreator implements IXMLNodeCreator {


    public function ContainerCreator() {
        super();
    }

    public function create(param1: XML): ICoreponent {
        var _loc2_: ICoreponent = new Container();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }

    override protected function initializeAttributeMapping(): void {
        super.initializeAttributeMapping();
        this.attributeToMethodMap["layout"] = this.handleLayoutAttribute;
        this.attributeToMethodMap["gap"] = this.handleGapAttribute;
        this.attributeToMethodMap["autoSizeMode"] = this.handleAutoSizeModeAttribute;
    }

    private function handleAutoSizeModeAttribute(param1: Coreponent, param2: String): void {
        param1.autoSizeMode = param2;
    }

    protected function handleLayoutAttribute(param1: Coreponent, param2: String): void {
        var _loc3_: Container = param1 as Container;
        var _loc4_: int = _loc3_.layout.gap;
        var _loc5_: String = _loc3_.autoSizeMode;
        _loc3_.layout = LayoutFactory.create(param2);
        _loc3_.layout.gap = _loc4_;
        _loc3_.autoSizeMode = _loc5_;
    }

    protected function handleGapAttribute(param1: Coreponent, param2: String): void {
        var _loc3_: Container = param1 as Container;
        _loc3_.layout.gap = parseInt(param2);
    }
}
}
