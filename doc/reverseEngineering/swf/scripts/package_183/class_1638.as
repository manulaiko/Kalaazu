package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_1638 extends Condition {

    public static const const_3203: int = 0;

    public static const const_648: int = 1;

    public static const const_1064: int = 2;

    public static const const_2180: int = 3;

    public static const const_1667: int = 4;

    public static const const_1136: int = 5;

    public static const const_1283: int = 6;

    public static const const_3319: int = 7;

    public static const const_1175: int = 8;

    public static const const_549: int = 9;


    private var var_2908: int;

    public function class_1638() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: * = [];
        _loc2_[const_3203] = "buyLaser_single";
        _loc2_[const_648] = "buyShip_bigger";
        _loc2_[const_1064] = "buyGenSpeed_single";
        _loc2_[const_2180] = "equipGenSpeed_single";
        _loc2_[const_1667] = "buyAmmoLeastUridium";
        _loc2_[const_1136] = "refinePromerium";
        _loc2_[const_1283] = "upgrade_any_promerium";
        _loc2_[const_3319] = "useGalaxyGatesEnergy";
        _loc2_[const_1175] = "verifyMail";
        _loc2_[const_549] = "applyToClan";
        this.var_2908 = parseInt(param1.pop());
        _description = class_88.getItem("q2_condition_undefined_" + _loc2_[this.var_2908]);
        if (this.var_2908 == const_648) {
            _description = _description.replace(/%ship%/, "Phoenix");
        }
        if (this.var_2908 == const_1667) {
            _description = _description.replace(/%count%/, _target);
            var_106 = "/" + _target;
        }
    }

    override public function get method_1303(): String {
        if (this.var_2908 == const_1667) {
            return String(_current);
        }
        return "";
    }
}
}
