package net.bigpoint.darkorbit.net {

import flash.display.StageDisplayState;
import flash.external.ExternalInterface;

import net.bigpoint.darkorbit.mvc.common.JavaScriptCallNotification;
import net.bigpoint.darkorbit.mvc.common.view.ScreenNotifications;

import package_17.class_62;

import package_9.class_50;

public class class_59 {

    public static const const_2017: String = "clientError";

    public static const const_2242: String = "clientEvent";

    public static const const_2306: String = "showPetFuel";

    public static const const_2495: String = "InternalMapRevolution.referToURL";

    public static const const_339: String = "bpCloseWindow";

    public static const const_68: String = "onTechExpired";

    public static const const_3092: String = "clientResolutionChanged";

    public static const const_2459: String = "InternalMapRevolution.closeChildWindow";

    public static const const_2372: String = "showHangar";

    public static const const_1747: String = "openPayment";

    public static const const_1998: String = "do_redirect";

    public static const const_397: String = "document.location.reload";

    public static const const_1192: String = "referToExternalURLInNewWindow";

    public static const const_1892: String = "openPaymentFromExternal";

    public static const const_1040: String = "InternalMapRevolution.detectPepper";

    public static const const_2093: String = "tradePossible";

    public static const const_1482: String = "tradeNotPossible";

    public static const const_195: String = "questCompleteFinished";

    public static const const_2089: String = "jumpPossible";

    public static const const_2860: String = "jumpNotPossible";

    public static const const_1647: String = "userLowHP";

    public static const const_510: String = "userLevelUp";

    public static const const_627: String = "cargoFull";

    public static const const_2232: String = "laserAmmoEmpty";

    public static const const_1395: String = "rocketsEmpty";

    public static const ACHIEVEMENT: String = "ACHIEVEMENT";

    public static const SPECIALOFFER: String = "SPECIALOFFER";

    public static const const_3051: String = "internalDock";

    public static const const_388: String = "dataLayer.push";

    public static const const_1316: String = "internalDockEquipment";


    public function class_59() {
        super();
    }

    public static function call(param1: String, param2: Array, param3: Function = null, param4: Array = null): void {
        if (true) {
            if (param3 != null) {
                param3(param4[0]);
            }
            return;
        }
        loop0:
            switch (param1) {
                case const_2495:
                case const_1747:
                    class_62.getInstance().sendNotification(JavaScriptCallNotification.ADD_DELAYED_CALLBACK, param2, param1);
                    class_62.getInstance().sendNotification(ScreenNotifications.FULLSCREEN_CHANGE);
                    break;
                default:
                    switch (param2.length) {
                        case 0:
                            ExternalInterface.call(param1);
                            break loop0;
                        case 1:
                            ExternalInterface.call(param1, param2[0]);
                            break loop0;
                        case 2:
                            ExternalInterface.call(param1, param2[0], param2[1]);
                            break loop0;
                        case 3:
                            ExternalInterface.call(param1, param2[0], param2[1], param2[2]);
                    }
            }
    }

    public static function referToURL(param1: String, param2: String, param3: String = null, param4: Boolean = true, param5: String = null, param6: Function = null, param7: Array = null, param8: Boolean = true, param9: String = ""): void {
        var _loc10_: class_50 = class_50.getInstance();
        if (param4 && _loc10_.stage && _loc10_.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE) {
            _loc10_.method_3501();
        }
        if (true) {
            if (param6 != null) {
                param6(param7[0]);
            }
            return;
        }
        ExternalInterface.call(const_2495, param1, param2, param3, param4, param5, param9, param8);
    }

    public static function method_958(param1: class_227): void {
        referToURL(param1.action, param1.method_6534, param1.template, param1.focus, param1.category, param1.method_3329, param1.method_1436, param1.name_87, param1.method_2070);
    }
}
}
