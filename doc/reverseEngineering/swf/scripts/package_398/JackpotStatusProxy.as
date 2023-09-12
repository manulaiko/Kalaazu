package package_398 {

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_14.class_52;

import package_328.JackpotBattleNotification;

import package_9.class_50;

public class JackpotStatusProxy extends Proxy implements class_52 {

    public static const NAME: String = "JackpotStatusProxy";


    private var var_3470: Number = 0;

    private var var_3388: Boolean;

    public function JackpotStatusProxy() {
        super(NAME);
    }

    override public function onRemove(): void {
        class_50.removeObserver(this);
        super.onRemove();
    }

    override public function setData(param1: Object): void {
        super.setData(param1);
        class_50.method_5621(this);
        sendNotification(JackpotBattleNotification.SET_LABLES_VISIBILITY, true);
    }

    private function get method_6360(): class_2281 {
        return data as class_2281;
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: Boolean = false;
        this.var_3470 += param1;
        while (this.var_3470 > 1000) {
            this.var_3470 -= 1000;
            --this.method_6360.time;
            _loc2_ = true;
        }
        if (_loc2_) {
            if (this.method_6360.time >= 0) {
                sendNotification(JackpotBattleNotification.UPDATE_REMAINING_TIME, this.method_6360.time);
                this.method_1242();
            } else {
                sendNotification(JackpotBattleNotification.SET_LABLES_VISIBILITY, false);
                class_50.removeObserver(this);
            }
        }
    }

    private function method_1242(): void {
        var _loc1_: Boolean = this.method_6360.timeOffset >= this.method_6360.time ? true : false;
        if (_loc1_ != this.var_3388) {
            this.var_3388 = _loc1_;
            if (this.var_3388) {
                sendNotification(JackpotBattleNotification.SHOW_WARNING);
            } else {
                sendNotification(JackpotBattleNotification.HIDE_WARNING);
            }
        }
    }
}
}
