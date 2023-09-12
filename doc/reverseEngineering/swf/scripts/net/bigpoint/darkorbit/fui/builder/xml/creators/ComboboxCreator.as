package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.list.combobox.ComboBox;

public class ComboboxCreator extends AbstractCreator {


    public function ComboboxCreator() {
        super();
    }

    override protected function initializeAttributeMapping(): void {
        super.initializeAttributeMapping();
        this.attributeToMethodMap["popupTemplate"] = this.handlePopupTemplate;
        this.attributeToMethodMap["popupOffsetX"] = this.handlePopupOffsetX;
        this.attributeToMethodMap["popupOffsetY"] = this.handlePopupOffsetY;
        this.attributeToMethodMap["closeListOnSelection"] = this.handleCloseListOnSelection;
    }

    public function create(param1: XML): ComboBox {
        var _loc2_: ComboBox = new ComboBox();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }

    protected function handlePopupTemplate(param1: Object, param2: Object): void {
        var _loc4_: * = null;
        var _loc3_: ComboBox = param1 as ComboBox;
        if (_loc3_) {
            if (_loc4_ = String(param2)) {
                _loc3_.popupTemplate = _loc4_;
            }
        }
    }

    protected function handlePopupOffsetX(param1: Object, param2: Object): void {
        var _loc3_: ComboBox = param1 as ComboBox;
        if (_loc3_) {
            _loc3_["popupOffsetX"] = param2;
        }
    }

    protected function handlePopupOffsetY(param1: Object, param2: Object): void {
        var _loc3_: ComboBox = param1 as ComboBox;
        if (_loc3_) {
            _loc3_["popupOffsetY"] = param2;
        }
    }

    protected function handleCloseListOnSelection(param1: Object, param2: Object): void {
        var _loc3_: ComboBox = param1 as ComboBox;
        if (_loc3_) {
            _loc3_["closeListOnSelection"] = param2;
        }
    }
}
}
