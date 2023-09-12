package package_396 {

import flash.events.TimerEvent;
import flash.utils.Timer;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.tdm.lobbyWindow.TeamDeathMatchLobbywindowNotifications;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_38.class_776;
import package_38.class_924;

public class TeamDeathMatchLobbywindowProxy extends Proxy {

    public static const NAME: String = "TeamDeathMatchLobbywindowProxy";


    private var var_1952: class_924;

    private var var_4230: class_776;

    private var var_80: int = -1;

    private var var_2130: uint;

    private var var_1735: uint;

    private var var_2630: uint;

    private var _timer: Timer;

    public function TeamDeathMatchLobbywindowProxy() {
        super(NAME);
    }

    public function method_5353(param1: class_924, param2: Boolean = true): void {
        this.var_1952 = param1;
        if (!param2) {
            return;
        }
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_1996, this.var_1952);
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_2907, [this.var_1952.minLevel, this.var_1952.name_119]);
    }

    public function method_1608(): class_924 {
        return this.var_1952;
    }

    public function method_3535(param1: class_776): void {
        this.var_4230 = param1;
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_975, this.var_4230);
        if (this.var_80 != this.var_4230.name_93) {
            this.var_80 = this.var_4230.name_93;
            this.var_2130 = this.var_4230.var_376;
            this.method_2937(this.var_4230.var_2140);
        }
    }

    public function method_2662(): class_776 {
        return this.var_4230;
    }

    public function method_5444(): void {
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_1996, this.var_1952);
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_975, this.var_4230);
        sendNotification(TeamDeathMatchLobbywindowNotifications.const_2907, [this.var_1952.minLevel, this.var_1952.name_119]);
    }

    public function method_1454(): Boolean {
        var _loc1_: class_924 = this.method_1608();
        var _loc2_: Number = 0;
        var _loc3_: uint = uint(_loc1_.minLevel);
        var _loc4_: uint = uint(_loc1_.name_119);
        return _loc2_ >= _loc3_ && _loc2_ <= _loc4_ ? true : false;
    }

    private function method_2937(param1: int): void {
        this.method_1026();
        if (param1 > 0) {
            this.method_4409(param1);
            this.startTimer();
            this.method_2059();
        }
    }

    public function startTimer(): void {
        if (this._timer) {
            this._timer.start();
        }
    }

    public function method_1026(): void {
        if (this._timer) {
            this._timer.stop();
        }
        facade.sendNotification(TeamDeathMatchLobbywindowNotifications.const_986);
    }

    public function method_864(): void {
        this.method_1026();
        this.var_1735 = this.var_2630;
        this.startTimer();
    }

    public function method_849(): void {
        this.method_1026();
        this.method_1028();
    }

    public function method_4409(param1: uint): void {
        this.var_2630 = param1;
        this.var_1735 = param1;
        if (this._timer == null) {
            this._timer = new Timer(1000);
            this._timer.addEventListener(TimerEvent.TIMER, this.method_2059);
        }
    }

    protected function method_1028(): void {
        if (this._timer) {
            this._timer.removeEventListener(TimerEvent.TIMER, this.method_2059);
            this._timer = null;
        }
    }

    protected function method_2059(param1: TimerEvent = null): void {
        if (this.var_1735 > 0) {
            if (this.var_1735 < this.var_2130) {
                ++this.var_1735;
                facade.sendNotification(TeamDeathMatchLobbywindowNotifications.const_2257, this.method_4388);
            }
        }
    }

    public function get method_4388(): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc6_: * = null;
        var _loc1_: String = "";
        var _loc2_: uint = Number(this.var_1735) % 60;
        if (_loc2_ < 10) {
            _loc3_ = "0" + _loc2_.toString();
        } else {
            _loc3_ = _loc2_.toString();
        }
        var _loc5_: uint;
        if ((_loc5_ = Math.floor(Number(this.var_1735) / 60)) < 10) {
            _loc4_ = "0" + _loc5_.toString();
        } else {
            _loc4_ = _loc5_.toString();
        }
        var _loc7_: uint;
        if ((_loc7_ = Math.floor(Number(this.var_1735) / 3600)) > 24) {
            _loc7_ %= 24;
        }
        if (_loc7_ < 10) {
            _loc6_ = "0" + _loc7_.toString();
        } else {
            _loc6_ = _loc7_.toString();
        }
        return _loc6_ + ":" + _loc4_ + ":" + _loc3_;
    }
}
}
