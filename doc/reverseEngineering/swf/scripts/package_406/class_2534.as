package package_406 {

import flash.utils.Dictionary;

import package_191.FocusChatCommand;
import package_191.PetRepairShipCommand;
import package_191.ToggleCategoryBarCommand;
import package_191.ZoomInCommand;
import package_191.ZoomOutCommand;
import package_191.class_1158;
import package_191.class_1159;
import package_191.class_1160;
import package_191.class_1161;
import package_191.class_1163;
import package_191.class_1164;
import package_191.class_1165;
import package_191.class_1166;
import package_191.class_1167;
import package_191.class_1168;
import package_191.class_1169;
import package_191.class_1170;

public class class_2534 {

    public static const const_3304: int = -1;

    public static const const_660: int = 5001;

    public static const const_2872: int = 5002;

    public static const const_168: int = 5003;

    public static const const_2346: int = 5004;

    public static const const_2562: int = 5005;

    public static const const_1580: int = 5006;

    public static const const_726: int = 5007;

    public static const const_2247: int = 5008;

    public static const const_1989: int = 5009;

    public static const const_2619: int = 5010;

    public static const const_855: int = 5011;

    public static const const_790: int = 5012;

    public static const const_1225: int = 5013;

    public static const const_3153: int = 5014;

    public static const const_1412: int = 5015;

    public static const const_1699: int = 5016;

    public static const const_1604: int = 5017;

    public static const const_2056: int = 5018;

    public static const const_171: int = 5019;

    public static const const_671: int = 5034;

    public static const const_2504: int = 5020;

    public static const const_1957: int = 5021;

    public static const const_1736: int = 5022;

    public static const const_1805: int = 5023;

    public static const const_2590: int = 5024;

    public static const const_1705: int = 5025;

    public static const const_2550: int = 5026;

    public static const const_1950: int = 5027;

    public static const const_2599: int = 5028;

    public static const const_538: int = 5029;

    public static const const_2964: int = 5030;

    public static const const_2781: int = 5031;

    public static const const_3144: int = 5032;

    public static const const_1824: int = 5033;

    public static const const_2439: int = 5044;


    private var var_1033: int;

    private var var_4878: String;

    private var var_3428: int;

    private var var_4712: int;

    public function class_2534(param1: int, param2: String, param3: int = -1, param4: int = -1) {
        super();
        this.var_1033 = param1;
        this.var_4878 = param2;
        this.var_3428 = param3;
        this.var_4712 = param4;
    }

    public static function method_3622(param1: int): String {
        var _loc2_: Dictionary = new Dictionary();
        _loc2_[const_2504] = class_1161.NAME;
        _loc2_[const_1824] = ToggleCategoryBarCommand.NAME;
        _loc2_[const_3144] = FocusChatCommand.NAME;
        _loc2_[const_1736] = class_1169.NAME;
        _loc2_[const_1950] = class_1164.NAME;
        _loc2_[const_2599] = class_1170.NAME;
        _loc2_[const_2590] = class_1163.NAME;
        _loc2_[const_1705] = class_1159.NAME;
        _loc2_[const_2550] = PetRepairShipCommand.NAME;
        _loc2_[const_2619] = class_1158.NAME;
        _loc2_[const_660] = class_1158.NAME;
        _loc2_[const_2872] = class_1158.NAME;
        _loc2_[const_168] = class_1158.NAME;
        _loc2_[const_2346] = class_1158.NAME;
        _loc2_[const_2562] = class_1158.NAME;
        _loc2_[const_1580] = class_1158.NAME;
        _loc2_[const_726] = class_1158.NAME;
        _loc2_[const_2247] = class_1158.NAME;
        _loc2_[const_1989] = class_1158.NAME;
        _loc2_[const_671] = class_1168.NAME;
        _loc2_[const_855] = class_1168.NAME;
        _loc2_[const_790] = class_1168.NAME;
        _loc2_[const_1225] = class_1168.NAME;
        _loc2_[const_3153] = class_1168.NAME;
        _loc2_[const_1412] = class_1168.NAME;
        _loc2_[const_1699] = class_1168.NAME;
        _loc2_[const_1604] = class_1168.NAME;
        _loc2_[const_2056] = class_1168.NAME;
        _loc2_[const_171] = class_1168.NAME;
        _loc2_[const_1805] = class_1165.NAME;
        _loc2_[const_1957] = class_1167.NAME;
        _loc2_[const_538] = class_1160.NAME;
        _loc2_[const_2964] = ZoomInCommand.NAME;
        _loc2_[const_2781] = ZoomOutCommand.NAME;
        _loc2_[const_2439] = class_1166.NAME;
        return _loc2_[param1];
    }

    public static function method_1459(param1: String): Vector.<int> {
        var _loc2_: Dictionary = new Dictionary();
        _loc2_[class_1161.NAME] = new <int>[const_2504];
        _loc2_[ToggleCategoryBarCommand.NAME] = new <int>[const_1824];
        _loc2_[FocusChatCommand.NAME] = new <int>[const_3144];
        _loc2_[class_1169.NAME] = new <int>[const_1736];
        _loc2_[class_1164.NAME] = new <int>[const_1950];
        _loc2_[class_1170.NAME] = new <int>[const_2599];
        _loc2_[class_1163.NAME] = new <int>[const_2590];
        _loc2_[class_1159.NAME] = new <int>[const_1705];
        _loc2_[PetRepairShipCommand.NAME] = new <int>[const_2550];
        _loc2_[class_1158.NAME] = new <int>[const_660, const_2872, const_168, const_2346, const_2562, const_1580, const_726, const_2247, const_1989, const_2619];
        _loc2_[class_1168.NAME] = new <int>[const_855, const_790, const_1225, const_3153, const_1412, const_1699, const_1604, const_2056, const_171, const_671];
        _loc2_[class_1165.NAME] = new <int>[const_1805];
        _loc2_[class_1167.NAME] = new <int>[const_1957];
        _loc2_[class_1160.NAME] = new <int>[const_538];
        _loc2_[ZoomInCommand.NAME] = new <int>[const_2964];
        _loc2_[ZoomOutCommand.NAME] = new <int>[const_2781];
        _loc2_[class_1166.NAME] = new <int>[const_2439];
        return _loc2_[param1];
    }

    public function get method_3976(): int {
        return this.var_1033;
    }

    public function set method_3976(param1: int): void {
        this.var_1033 = param1;
    }

    public function get method_1361(): String {
        return this.var_4878;
    }

    public function set method_1361(param1: String): void {
        this.var_4878 = param1;
    }

    public function get method_4918(): int {
        return this.var_3428;
    }

    public function set method_4918(param1: int): void {
        this.var_3428 = param1;
    }

    public function get method_5655(): int {
        return this.var_4712;
    }
}
}
