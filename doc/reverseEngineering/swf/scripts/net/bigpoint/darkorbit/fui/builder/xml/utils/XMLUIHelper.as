package net.bigpoint.darkorbit.fui.builder.xml.utils {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.MappingInstanceNames;
import net.bigpoint.darkorbit.fui.builder.repository.XMLUITemplateRepository;

public class XMLUIHelper {

    private static const SEARCH_ATTRIBUTE__NAME: String = "name";


    public function XMLUIHelper() {
        super();
    }

    public static function __template__(param1: XML): XML {
        var _loc2_: String = param1.attribute(MappingInstanceNames.TEMPLATE);
        if (_loc2_) {
            return overridesTemplate(param1, _loc2_);
        }
        return param1;
    }

    public static function overridesTemplate(param1: XML, param2: String): XML {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = 0;
        var _loc15_: int = 0;
        var _loc16_: * = null;
        var _loc3_: XML = XMLUITemplateRepository.getInstance().getTemplateByName(param2) as XML;
        if (_loc3_ == null) {
            return null;
        }
        var _loc4_: Dictionary = new Dictionary();
        var _loc5_: XMLList = param1..@name;
        for each(_loc6_ in _loc5_) {
            _loc9_ = _loc6_.toString();
            _loc4_[_loc9_] = null;
        }
        for (_loc7_ in _loc4_) {
            if (_loc10_ = getXMLElementByAttributeName(_loc3_, _loc7_)) {
                _loc4_[_loc7_] = _loc10_;
            }
        }
        for each(_loc8_ in _loc4_) {
            if (_loc8_ != null) {
                _loc11_ = _loc8_.@name;
                if ((_loc12_ = getXMLElementByAttributeName(param1, _loc11_)) != null) {
                    _loc14_ = (_loc13_ = _loc12_.attributes()).length();
                    _loc15_ = 0;
                    while (_loc15_ < _loc14_) {
                        _loc16_ = _loc13_[_loc15_].name();
                        _loc8_[_loc16_] = _loc13_[_loc15_].valueOf();
                        _loc15_++;
                    }
                }
            } else {
                UISystem.log("MERGE ERROR !!! ", UISystem.LOG_LEVEL_WARN);
            }
        }
        return _loc3_;
    }

    protected static function getXMLElementByAttributeName(param1: XML, param2: String): XML {
        var xmlList: XMLList = null;
        var filtered: XMLList = null;
        var node: XML = param1;
        var searchValue: String = param2;
        xmlList = node..package_1.(hasOwnProperty("@name"));
        filtered = xmlList.(attribute(SEARCH_ATTRIBUTE__NAME) == searchValue);
        if (filtered == null) {
            return null;
        }
        if (filtered.length() == 1) {
            return filtered[0];
        }
        UISystem.log("Error.Couldn´t find node for name = " + searchValue, UISystem.LOG_LEVEL_WARN);
        return null;
    }
}
}
