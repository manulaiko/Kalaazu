package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.display.Sprite;
import flash.events.Event;

import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.CloseEvent;

import spark.components.TitleWindow;
import spark.events.TitleWindowBoundsEvent;

public class TitleWindowAccImpl extends PanelAccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function TitleWindowAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_PANE;
    }

    public static function enableAccessibility(): void {
        TitleWindow.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        var _loc2_: TitleWindowAccImpl = new TitleWindowAccImpl(param1);
        var _loc3_: Sprite = _loc2_.mx_internal::attach();
        Accessibility.sendEvent(_loc3_, 0, AccConst.EVENT_OBJECT_CREATE);
        Accessibility.updateProperties();
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat([TitleWindowBoundsEvent.WINDOW_MOVE_END, CloseEvent.CLOSE]);
    }

    override public function get_accState(param1: uint): uint {
        var _loc2_: uint = getState(param1);
        return _loc2_ | 0;
    }

    override protected function eventHandler(param1: Event): void {
        super.eventHandler(param1);
        switch (param1.type) {
            case TitleWindowBoundsEvent.WINDOW_MOVE_END:
                Accessibility.sendEvent(mx_internal::accImplSprite, 0, AccConst.EVENT_OBJECT_LOCATIONCHANGE, true);
                Accessibility.updateProperties();
                break;
            case CloseEvent.CLOSE:
                Accessibility.sendEvent(mx_internal::accImplSprite, 0, AccConst.EVENT_OBJECT_DESTROY, true);
                Accessibility.updateProperties();
        }
    }
}
}
