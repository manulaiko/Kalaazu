package package_273 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.net.class_59;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_150.class_988;

import package_163.BattleStationProxy;
import package_163.class_1018;

import package_38.class_683;

import package_50.class_140;
import package_50.class_154;

import package_59.class_158;

public class class_1975 extends SimpleCommand {


    public function class_1975() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: String = String(param1.getBody());
        if (false) {
            this.method_897.method_5495.var_2469 = _loc2_;
            if (this.method_897.method_5495 == null) {
                return;
            }
            switch (this.method_897.method_5495.state) {
                case class_1018.const_2500:
                    this.method_897.method_613 = true;
                    sendNotification(GuiNotifications.OPEN_BATTLE_STATION_WINDOW, class_158.var_4374);
                    sendNotification(BattleStationNotification.const_2731, this.method_897.method_5495);
                    break;
                case class_1018.const_1368:
                    this.method_897.method_613 = true;
                    sendNotification(GuiNotifications.OPEN_BATTLE_STATION_WINDOW, class_158.var_676);
                    sendNotification(BattleStationNotification.const_2225, this.method_897.method_5495);
                    break;
                case class_1018.const_2805:
                    this.method_897.method_4147(this.method_897.method_5495);
            }
        } else {
            this.method_1085();
        }
    }

    private function method_1085(): void {
        var var_4048: class_140 = class_140(class_57.getInstance().createWindow(class_57.const_468));
        var_4048.height = 160;
        var_4048.title = class_88.getItem("popup_bswin_title_error_message");
        var_4048.method_4022(class_88.getItem(class_1023.const_2968[class_683.const_1509]));
        var_4048.method_2210(class_88.getItem("error_bswin_no_clan_confirm_btn"), class_88.getItem("popup_bswin_btn_cancel_module_removal"));
        var_4048.addEventListener(class_988.CONFIRM_BTN_CLICKED, function (): void {
            class_59.referToURL("internalNewClan", "seo_tittle_clans");
        });
    }

    public function method_4147(param1: class_1018): void {
        var _loc2_: class_154 = class_154(class_57.getInstance().createWindow(class_57.const_264));
        _loc2_.title = param1.var_2469;
        _loc2_.method_4130(class_88.getItem("popup_bswin_message_battle_station_build_time"), class_88.getItem("popup_bswin_title_battle_station_build_time"), param1.owningClanName);
        _loc2_.method_2317(param1.method_3700);
        _loc2_.method_4592(param1.name_11, 0);
    }

    private function get method_897(): BattleStationProxy {
        return facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
    }
}
}
