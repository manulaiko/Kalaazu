package net.bigpoint.darkorbit.fui.builder.xml.creators {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
import net.bigpoint.darkorbit.fui.components.list.layouts.HorizontalItemListLayout;
import net.bigpoint.darkorbit.fui.components.list.layouts.VerticalItemListLayout;

public class ItemlistCreator extends AbstractCreator {

    protected static var nodeNameToMethodMap: Dictionary = new Dictionary();

    {
        nodeNameToMethodMap["itemrenderer"] = createItemlistRenderer;
    }

    public function ItemlistCreator() {
        super();
    }

    protected static function createItemlistRenderer(param1: ItemList, param2: XML): void {
        param1.itemRendererTemplate = param2;
    }

    protected static function assignItemlistLayout(param1: ItemList, param2: String): void {
        switch (param2) {
            case "vertical":
                param1.layout = new VerticalItemListLayout();
                break;
            case "horizontal":
                param1.layout = new HorizontalItemListLayout();
        }
    }

    override protected function initializeAttributeMapping(): void {
        super.initializeAttributeMapping();
        attributeToMethodMap["layout"] = assignItemlistLayout;
        attributeToMethodMap["autoSizeMode"] = this.handleAutoSizeModeAttribute;
    }

    private function handleAutoSizeModeAttribute(param1: ItemList, param2: String): void {
        param1.autoSizeMode = param2;
    }

    public function create(param1: XML): ICoreponent {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: ItemList = new ItemList();
        mapXMLNodeAttributes(_loc2_, param1);
        var _loc3_: XMLList = param1.children();
        for each(_loc4_ in _loc3_) {
            _loc5_ = _loc4_.name();
            if ((_loc6_ = nodeNameToMethodMap[_loc5_]) != null) {
                _loc6_(_loc2_, _loc4_);
            }
        }
        return _loc2_;
    }
}
}
