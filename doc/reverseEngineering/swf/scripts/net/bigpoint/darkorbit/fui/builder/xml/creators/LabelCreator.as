package net.bigpoint.darkorbit.fui.builder.xml.creators {

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.text.label.Label;

public class LabelCreator extends AbstractCreator implements IXMLNodeCreator {


    public function LabelCreator() {
        super();
    }

    public function create(param1: XML): ICoreponent {
        var _loc2_: Label = new Label();
        mapXMLNodeAttributes(_loc2_, param1);
        return _loc2_;
    }

    override protected function initializeAttributeMapping(): void {
        super.initializeAttributeMapping();
        this.attributeToMethodMap["registeredTextStyleName"] = this.handleTextStyleAttribute;
        this.attributeToMethodMap["text"] = this.attemptTolocalizeTextOnComponent;
        this.attributeToMethodMap["useHTML"] = this.handleHTMLAttribute;
    }

    protected function handleTextStyleAttribute(param1: Coreponent, param2: String): void {
        var _loc3_: Label = param1 as Label;
        _loc3_.registeredTextStyleName = param2;
    }

    protected function attemptTolocalizeTextOnComponent(param1: Coreponent, param2: String): void {
        var _loc3_: Label = param1 as Label;
        _loc3_.text = attemptTolocalizeText(param2);
    }

    protected function handleHTMLAttribute(param1: Coreponent, param2: String): void {
        var _loc3_: Label = param1 as Label;
        _loc3_.useHTML = param2 == "true";
    }
}
}
