package package_67 {

import com.greensock.TweenMax;

import flash.utils.Dictionary;

import mx.logging.ILogger;
import mx.logging.Log;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_1051;
import net.bigpoint.darkorbit.net.class_112;

import package_134.class_385;

public class AbilitiesModel {

    private static const const_1494: ILogger = Log.getLogger("AbilitiesModel");


    public var var_1780: Dictionary;

    public var var_3972: Dictionary;

    public var main: class_9;

    public function AbilitiesModel(param1: class_9) {
        var _loc2_: int = 0;
        this.var_1780 = new Dictionary();
        this.var_3972 = new Dictionary();
        super();
        this.main = param1;
        for each(_loc2_ in class_126.const_537) {
            this.var_1780[_loc2_] = new class_385(_loc2_, param1);
            this.var_3972[_loc2_] = new class_1051(_loc2_, 0);
        }
    }

    public function method_2609(param1: int, param2: Boolean): void {
        class_385(this.var_1780[param1]).setEquipped();
        if (param2) {
            class_385(this.var_1780[param1]).setReady();
        } else {
            class_385(this.var_1780[param1]).status = class_385.const_999;
        }
    }

    public function method_6522(): void {
        var _loc1_: int = 0;
        for each(_loc1_ in class_126.const_537) {
            class_385(this.var_1780[_loc1_]).unEquip();
        }
    }

    public function method_1530(param1: int, param2: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        _loc3_ = this.var_3972[param1] as class_1051;
        _loc3_.seconds = param2;
        _loc3_.var_531 = param2;
        _loc3_.update();
        _loc3_.onCompleteCallback = this.method_4178;
        if (this.var_1780 == null) {
            return;
        }
        (_loc4_ = this.var_1780[param1] as class_385).var_2403 = param2;
        _loc4_.var_4031 = param2 > 0;
        _loc5_ = _loc4_;
    }

    private function method_4178(param1: int): void {
        var _loc2_: * = null;
        var _loc3_: Boolean = false;
        if (this.var_1780 == null) {
            return;
        }
        _loc2_ = this.var_1780[param1] as class_385;
        if (_loc2_ != null && _loc2_.var_4031 == true) {
            _loc2_.var_4031 = false;
            _loc3_ = true;
        }
        class_112.getInstance().method_3219(class_81.userID, param1, true);
        TweenMax.delayedCall(0.5, class_112.getInstance().method_3219, [class_81.userID, param1, false]);
    }

    public function method_4289(param1: int, param2: Boolean): void {
        switch (param1) {
            case class_126.const_1952:
                this.main.method_4489().writeToLog(class_88.getItem("msg_instant_healed_as_activator"));
                break;
            case class_126.const_1583:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_targets_shields_weakened"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_targets_shields_recovered"));
                break;
            case class_126.const_1124:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_prismatic_shielding_activated"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_prismatic_shielding_stopped"));
                break;
            case class_126.const_1779:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_fortress_activated"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_fortress_stopped"));
                break;
            case class_126.const_1250:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_singularity_activated"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_singularity_stopped"));
                break;
            case class_126.const_80:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_afterburner_activated"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_afterburner_stopped"));
                break;
        }
    }

    public function method_5312(param1: int, param2: Boolean): void {
        switch (param1) {
            case class_126.const_1583:
                if (param2) {
                    this.main.method_4489().writeToLog(class_88.getItem("msg_shields_weakened"));
                    break;
                }
                this.main.method_4489().writeToLog(class_88.getItem("msg_shields_recovered"));
                break;
        }
    }
}
}
