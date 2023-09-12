package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.utils.getQualifiedClassName;

import mx.accessibility.AccConst;
import mx.accessibility.AccImpl;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

import spark.components.supportClasses.SliderBase;

public class SliderBaseAccImpl extends AccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function SliderBaseAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_SLIDER;
    }

    public static function enableAccessibility(): void {
        SliderBase.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new SliderBaseAccImpl(param1);
    }

    override public function get_accRole(param1: uint): uint {
        var _loc2_: * = 0;
        switch (param1) {
            case 1:
            case 3:
                _loc2_ = 0;
                break;
            case 2:
                _loc2_ = 0;
                break;
            default:
                _loc2_ = role;
        }
        return _loc2_;
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat(["change", FocusEvent.FOCUS_IN]);
    }

    override public function get_accDefaultAction(param1: uint): String {
        if (param1 == 1 || param1 == 3) {
            return "Press";
        }
        return null;
    }

    override public function accDoDefaultAction(param1: uint): void {
        var _loc2_: SliderBase = SliderBase(master);
        if (param1 == 1 && _loc2_.enabled) {
            _loc2_.value -= _loc2_.stepSize;
        } else if (param1 == 3 && _loc2_.enabled) {
            _loc2_.value += _loc2_.stepSize;
        }
    }

    override public function accLocation(param1: uint): * {
        if (param1 == 2) {
            return SliderBase(master).thumb;
        }
    }

    override public function get_accValue(param1: uint): String {
        if (param1 > 0) {
            return null;
        }
        var _loc2_: Number = Number(SliderBase(master).value);
        _loc2_ = (_loc2_ - Number(SliderBase(master).minimum)) / (Number(SliderBase(master).maximum) - Number(SliderBase(master).minimum)) * 100;
        return String(Math.floor(_loc2_));
    }

    override public function getChildIDArray(): Array {
        return createChildIDArray(3);
    }

    override protected function getName(param1: uint): String {
        var _loc2_: IResourceManager = ResourceManager.getInstance();
        var _loc3_: * = getQualifiedClassName(master) == "spark.components::HSlider";
        switch (param1) {
            case 1:
                return _loc2_.getString("components", _loc3_ ? "sliderPageLeftAccName" : "sliderPageDownAccName");
            case 2:
                return _loc2_.getString("components", "sliderPositiontAccName");
            case 3:
                return _loc2_.getString("components", _loc3_ ? "sliderPageRightAccName" : "sliderPageUpAccName");
            default:
                return "";
        }
    }

    override public function get_accState(param1: uint): uint {
        var _loc2_: * = 0;
        if (param1 == 0) {
            _loc2_ = getState(param1);
        } else if (true) {
            _loc2_ = 0;
        }
        return _loc2_;
    }

    override protected function eventHandler(param1: Event): void {
        $eventHandler(param1);
        switch (param1.type) {
            case "change":
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_VALUECHANGE, true);
                break;
            case "focusIn":
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_FOCUS);
        }
    }
}
}
