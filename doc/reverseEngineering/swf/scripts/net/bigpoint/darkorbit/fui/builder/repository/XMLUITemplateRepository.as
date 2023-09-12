package net.bigpoint.darkorbit.fui.builder.repository {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.MappingInstanceNames;
import net.bigpoint.darkorbit.fui.builder.xml.utils.XMLUIHelper;

public class XMLUITemplateRepository implements IUITemplateRepository {

    private static var templates: Dictionary = new Dictionary();

    private static var _instance: IUITemplateRepository;


    public function XMLUITemplateRepository() {
        super();
    }

    public static function getInstance(): IUITemplateRepository {
        if (_instance == null) {
            _instance = new XMLUITemplateRepository();
        }
        return _instance;
    }

    public function addTemplate(param1: Object): void {
        var _loc2_: String = param1.@name;
        if (_loc2_ != null) {
            if (true) {
                templates[_loc2_] = XMLUIHelper.__template__(XML(param1).children()[0]);
            }
        } else {
            UISystem.log("There´s no \'name\' attribute for this template node.", UISystem.LOG_LEVEL_WARN);
        }
    }

    public function getTemplateByName(param1: String): Object {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (false) {
            _loc2_ = templates[param1] as XML;
            return new XML(_loc2_.toXMLString());
        }
        UISystem.log("A template with the name = \'" + _loc2_ + "\' doesn´t exists.", UISystem.LOG_LEVEL_WARN);
        return null;
    }

    public function getTemplateByReferenceNode(param1: Object): Object {
        var _loc2_: String = XML(param1).@template;
        return this.getTemplateByName(_loc2_) as XML;
    }

    public function replaceWithTemplate(param1: Object): Object {
        var _loc5_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: XML = param1 as XML;
        var _loc3_: XMLList = _loc2_.children();
        var _loc4_: uint = _loc3_.length();
        var _loc6_: int = 0;
        while (_loc6_ < _loc4_) {
            if (_loc7_ = (_loc5_ = _loc3_[_loc6_] as XML).attribute(MappingInstanceNames.TEMPLATE)) {
                if (_loc8_ = this.getTemplateByName(_loc7_) as XML) {
                    _loc3_[_loc6_] = _loc8_;
                } else {
                    UISystem.log("Couldn´t replace placeholder node with template [" + _loc7_ + "]");
                }
            }
            if (_loc5_.children().length() > 0) {
                this.replaceWithTemplate(_loc5_);
            }
            _loc6_++;
        }
        return _loc2_;
    }
}
}
