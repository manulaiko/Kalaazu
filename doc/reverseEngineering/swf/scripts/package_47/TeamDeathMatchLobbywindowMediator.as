package package_47 {

import flash.events.Event;

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.tdm.lobbyWindow.TeamDeathMatchLobbywindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_143.class_979;

import package_38.class_449;
import package_38.class_478;
import package_38.class_775;
import package_38.class_776;
import package_38.class_924;

public class TeamDeathMatchLobbywindowMediator extends Mediator {

    public static const NAME: String = "TeamDeathMatchLobbywindowMediator";


    protected var var_3946: Function;

    public function TeamDeathMatchLobbywindowMediator() {
        super(NAME);
    }

    public function method_3297(param1: Object, param2: Function = null): void {
        this.var_3946 = param2;
        this.removeEventListeners();
        super.setViewComponent(param1);
        this.addEventListeners();
    }

    public function get window(): class_134 {
        return viewComponent as class_134;
    }

    override public function onRegister(): void {
        this.addEventListeners();
    }

    override public function onRemove(): void {
        this.removeEventListeners();
    }

    override public function listNotificationInterests(): Array {
        return [TeamDeathMatchLobbywindowNotifications.const_1996, TeamDeathMatchLobbywindowNotifications.const_975, TeamDeathMatchLobbywindowNotifications.const_2907, TeamDeathMatchLobbywindowNotifications.const_2257, TeamDeathMatchLobbywindowNotifications.const_986, TeamDeathMatchLobbywindowNotifications.SET_UI_INTERACTIVITY, GuiNotifications.CLOSE_ALL_FLEX_WINDOWS, GuiNotifications.CLOSE_WINDOW_BY_TYPE];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: Boolean = false;
        var _loc8_: * = null;
        super.handleNotification(param1);
        var _loc2_: String = param1.getName();
        switch (_loc2_) {
            case TeamDeathMatchLobbywindowNotifications.const_1996:
                _loc3_ = param1.getBody() as class_924;
                this.method_3096(_loc3_);
                break;
            case TeamDeathMatchLobbywindowNotifications.const_975:
                _loc4_ = param1.getBody() as class_776;
                this.method_194(_loc4_);
                break;
            case TeamDeathMatchLobbywindowNotifications.const_2907:
                _loc5_ = param1.getBody() as Array;
                this.method_722(_loc5_[0], _loc5_[1]);
                break;
            case TeamDeathMatchLobbywindowNotifications.const_2257:
                _loc6_ = param1.getBody() as String;
                this.updateMatchTime(_loc6_);
                break;
            case TeamDeathMatchLobbywindowNotifications.const_986:
                this.clearMatchTime();
                break;
            case TeamDeathMatchLobbywindowNotifications.SET_UI_INTERACTIVITY:
                _loc7_ = param1.getBody() as Boolean;
                this.method_5515(_loc7_);
                break;
            case GuiNotifications.CLOSE_ALL_FLEX_WINDOWS:
                this.method_2555();
                break;
            case GuiNotifications.CLOSE_WINDOW_BY_TYPE:
                if ((_loc8_ = param1.getBody() as String) == class_57.const_378) {
                    this.method_2555();
                    break;
                }
        }
    }

    private function method_194(param1: class_776): void {
        if (this.window) {
            this.window.method_194(param1);
        }
    }

    private function method_3096(param1: class_924): void {
        if (this.window) {
            this.window.method_3096(param1);
        }
    }

    private function method_722(param1: uint, param2: uint): void {
        if (this.window) {
            this.window.method_722(param1, param2);
        }
    }

    private function method_5515(param1: Boolean): void {
        if (this.window) {
            this.window.method_1304(param1);
        }
    }

    private function clearMatchTime(): void {
        if (this.window) {
            this.window.clearMatchTime();
        }
    }

    private function updateMatchTime(param1: String): void {
        if (this.window) {
            this.window.updateMatchTime(param1);
        }
    }

    private function addEventListeners(): void {
        if (this.window) {
            this.window.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_2555);
            this.window.addEventListener(class_979.const_3289, this.method_999);
            this.window.addEventListener(class_979.const_1519, this.method_1612);
            this.window.addEventListener(class_979.const_935, this.method_483);
            this.window.addEventListener(class_979.const_1817, this.method_3285);
            this.window.addEventListener(class_979.const_3011, this.method_1217);
        }
    }

    private function removeEventListeners(): void {
        if (this.window) {
            this.window.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_2555);
            this.window.removeEventListener(class_979.const_3289, this.method_999);
            this.window.removeEventListener(class_979.const_1519, this.method_1612);
            this.window.removeEventListener(class_979.const_935, this.method_483);
            this.window.removeEventListener(class_979.const_1817, this.method_3285);
            this.window.removeEventListener(class_979.const_3011, this.method_1217);
        }
    }

    private function method_2555(param1: Event = null): void {
        this.method_2292();
    }

    private function method_2292(): void {
        facade.removeMediator(getMediatorName());
    }

    private function method_999(param1: Event): void {
        if (this.var_3946 != null) {
            this.var_3946();
        }
    }

    private function method_1612(param1: class_979): void {
    }

    private function method_483(param1: class_979): void {
        var _loc2_: uint = uint(param1.name_93);
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_449(_loc2_));
    }

    private function method_3285(param1: class_979): void {
        var _loc2_: uint = uint(param1.name_93);
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_775());
    }

    private function method_1217(param1: class_979): void {
        var _loc2_: uint = uint(param1.name_93);
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_478(_loc2_));
    }
}
}
