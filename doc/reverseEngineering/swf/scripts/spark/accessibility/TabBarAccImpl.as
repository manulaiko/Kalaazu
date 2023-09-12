package spark.accessibility {

import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.TabBar;

public class TabBarAccImpl extends ButtonBarBaseAccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function TabBarAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_PAGETABLIST;
    }

    public static function enableAccessibility(): void {
        TabBar.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new TabBarAccImpl(param1);
    }

    override public function get_accRole(param1: uint): uint {
        return param1 == 0 ? role : AccConst.ROLE_SYSTEM_PAGETAB;
    }

    override public function get_accDefaultAction(param1: uint): String {
        if (param1 == 0) {
            return null;
        }
        return "Switch";
    }
}
}
