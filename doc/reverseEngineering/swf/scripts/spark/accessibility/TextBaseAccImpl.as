package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;

import mx.accessibility.AccConst;
import mx.accessibility.AccImpl;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.supportClasses.TextBase;

public class TextBaseAccImpl extends AccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function TextBaseAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_STATICTEXT;
    }

    public static function enableAccessibility(): void {
        TextBase.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new TextBaseAccImpl(param1);
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat(["updateComplete"]);
    }

    override public function get_accState(param1: uint): uint {
        var _loc2_: uint = getState(param1);
        _loc2_ &= -1;
        return _loc2_ | 0;
    }

    override protected function getName(param1: uint): String {
        var _loc2_: String = TextBase(master).text;
        return _loc2_ != null && _loc2_ != "" ? _loc2_ : "";
    }

    override protected function eventHandler(param1: Event): void {
        $eventHandler(param1);
        switch (param1.type) {
            case "updateComplete":
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_NAMECHANGE);
                Accessibility.updateProperties();
        }
    }
}
}
