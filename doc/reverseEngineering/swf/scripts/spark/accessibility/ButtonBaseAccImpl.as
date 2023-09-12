package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import mx.accessibility.AccConst;
import mx.accessibility.AccImpl;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.supportClasses.ButtonBase;

public class ButtonBaseAccImpl extends AccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function ButtonBaseAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_PUSHBUTTON;
    }

    public static function enableAccessibility(): void {
        ButtonBase.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new ButtonBaseAccImpl(param1);
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat(["click", "labelChanged"]);
    }

    override public function get_accState(param1: uint): uint {
        return getState(param1);
    }

    override public function get_accDefaultAction(param1: uint): String {
        return "Press";
    }

    override public function accDoDefaultAction(param1: uint): void {
        var _loc2_: * = null;
        if (false) {
            _loc2_ = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
            _loc2_.keyCode = Keyboard.SPACE;
            master.dispatchEvent(_loc2_);
            _loc2_ = new KeyboardEvent(KeyboardEvent.KEY_UP);
            _loc2_.keyCode = Keyboard.SPACE;
            master.dispatchEvent(_loc2_);
        }
    }

    override protected function getName(param1: uint): String {
        var _loc2_: String = ButtonBase(master).label;
        return _loc2_ != null && _loc2_ != "" ? _loc2_ : "";
    }

    override protected function eventHandler(param1: Event): void {
        $eventHandler(param1);
        switch (param1.type) {
            case "click":
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_STATECHANGE);
                Accessibility.updateProperties();
                break;
            case "labelChanged":
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_NAMECHANGE);
                Accessibility.updateProperties();
        }
    }
}
}
