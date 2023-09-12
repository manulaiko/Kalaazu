package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_433 extends class_432 implements ICommand {

    public static const const_2770: uint = 173;

    public static const const_1514: uint = 61;

    public static const const_710: uint = 169;

    public static const const_614: uint = 69;

    public static const SPECTRUM: uint = 33;

    public static const const_2474: uint = 64;

    public static const const_293: uint = 149;

    public static const const_933: uint = 119;

    public static const const_1352: uint = 141;

    public static const const_1922: uint = 51;

    public static const const_3020: uint = 54;

    public static const const_323: uint = 82;

    public static const const_2411: uint = 48;

    public static const GOLD: uint = 194;

    public static const const_33: uint = 22;

    public static const LIBERATOR: uint = 6;

    public static const const_568: uint = 100;

    public static const const_157: uint = 180;

    public static const const_2165: uint = 50;

    public static const const_2700: uint = 53;

    public static const const_2086: uint = 138;

    public static const const_3091: uint = 95;

    public static const const_1914: uint = 132;

    public static const const_1816: uint = 43;

    public static const const_291: uint = 120;

    public static const const_3201: uint = 9;

    public static const PET: uint = 162;

    public static const const_2786: uint = 37;

    public static const const_5: uint = 190;

    public static const const_1005: uint = 175;

    public static const DEFAULT: uint = 1;

    public static const const_1422: uint = 147;

    public static const UFONIT: uint = 72;

    public static const const_772: uint = 38;

    public static const const_1088: uint = 98;

    public static const const_624: uint = 97;

    public static const const_1454: uint = 96;

    public static const SENTINEL: uint = 34;

    public static const const_1477: uint = 39;

    public static const const_657: uint = 107;

    public static const const_1608: uint = 160;

    public static const const_3156: uint = 104;

    public static const ADEPT: uint = 12;

    public static const const_3070: uint = 87;

    public static const const_720: uint = 113;

    public static const const_3172: uint = 40;

    public static const const_2150: uint = 60;

    public static const const_2998: uint = 178;

    public static const const_1532: uint = 81;

    public static const const_2064: uint = 108;

    public static const UFO: uint = 73;

    public static const const_1550: uint = 57;

    public static const const_992: uint = 111;

    public static const const_1217: uint = 145;

    public static const const_1164: uint = 115;

    public static const const_3251: uint = 159;

    public static const const_3229: uint = 118;

    public static const EXALTED: uint = 30;

    public static const const_2420: uint = 85;

    public static const WRECK: uint = 165;

    public static const const_1030: uint = 7;

    public static const const_3005: uint = 92;

    public static const const_286: uint = 117;

    public static const LIGHTNING: uint = 14;

    public static const const_158: uint = 126;

    public static const const_2785: uint = 140;

    public static const SOLACE: uint = 31;

    public static const const_985: uint = 143;

    public static const const_135: uint = 21;

    public static const AVENGER: uint = 28;

    public static const const_1558: uint = 183;

    public static const const_928: uint = 109;

    public static const StreuneR: uint = 58;

    public static const const_1605: uint = 103;

    public static const const_1931: uint = 193;

    public static const const_578: uint = 197;

    public static const const_2800: uint = 67;

    public static const const_668: uint = 52;

    public static const const_299: uint = 114;

    public static const const_111: uint = 181;

    public static const const_1424: uint = 144;

    public static const const_750: uint = 17;

    public static const const_164: uint = 137;

    public static const CENTAUR: uint = 47;

    public static const const_392: uint = 176;

    public static const const_423: uint = 68;

    public static const const_696: uint = 121;

    public static const const_405: uint = 74;

    public static const SATURN: uint = 46;

    public static const const_1409: uint = 66;

    public static const const_1870: uint = 44;

    public static const const_236: uint = 188;

    public static const const_1061: uint = 71;

    public static const const_49: uint = 55;

    public static const const_3235: uint = 84;

    public static const const_1654: uint = 177;

    public static const const_103: uint = 63;

    public static const const_3064: uint = 133;

    public static const VETERAN: uint = 29;

    public static const const_2883: uint = 135;

    public static const const_1043: uint = 106;

    public static const const_2642: uint = 110;

    public static const NONE: uint = 0;

    public static const const_1720: uint = 79;

    public static const const_783: uint = 91;

    public static const const_419: uint = 11;

    public static const const_2405: uint = 76;

    public static const const_1640: uint = 186;

    public static const const_2744: uint = 146;

    public static const const_319: uint = 187;

    public static const const_1203: uint = 101;

    public static const const_770: uint = 23;

    public static const const_791: uint = 80;

    public static const const_644: uint = 130;

    public static const const_2204: uint = 179;

    public static const const_2100: uint = 171;

    public static const const_2034: uint = 161;

    public static const BRONZE: uint = 196;

    public static const const_1372: uint = 105;

    public static const const_109: uint = 45;

    public static const AEGIS: uint = 18;

    public static const const_2838: uint = 156;

    public static const const_14: uint = 136;

    public static const const_3232: uint = 86;

    public static const const_2476: uint = 128;

    public static const const_656: uint = 157;

    public static const const_1759: uint = 163;

    public static const const_1273: uint = 192;

    public static const const_3266: uint = 139;

    public static const const_2769: uint = 2;

    public static const const_245: uint = 90;

    public static const const_923: uint = 166;

    public static const const_2144: uint = 127;

    public static const const_2678: uint = 189;

    public static const const_3030: uint = 112;

    public static const const_1790: uint = 164;

    public static const const_2783: uint = 62;

    public static const const_1703: uint = 93;

    public static const const_2124: uint = 167;

    public static const const_389: uint = 77;

    public static const const_1721: uint = 172;

    public static const const_499: uint = 125;

    public static const const_2429: uint = 134;

    public static const const_1162: uint = 83;

    public static const const_55: uint = 151;

    public static const const_2941: uint = 170;

    public static const const_2717: uint = 59;

    public static const const_1497: uint = 155;

    public static const const_3125: uint = 99;

    public static const const_853: uint = 191;

    public static const REVENGE: uint = 26;

    public static const const_3016: uint = 65;

    public static const const_1128: uint = 78;

    public static const const_50: uint = 150;

    public static const const_987: uint = 20;

    public static const const_1317: uint = 116;

    public static const const_1542: uint = 124;

    public static const const_3179: uint = 8;

    public static const const_186: uint = 129;

    public static const const_1613: uint = 88;

    public static const const_875: uint = 102;

    public static const const_2990: uint = 182;

    public static const CORSAIR: uint = 13;

    public static const const_2028: uint = 94;

    public static const const_2609: uint = 89;

    public static const const_518: uint = 184;

    public static const const_2665: uint = 122;

    public static const BASTION: uint = 27;

    public static const const_878: uint = 49;

    public static const const_2948: uint = 16;

    public static const SILVER: uint = 195;

    public static const const_1993: uint = 152;

    public static const const_2187: uint = 154;

    public static const const_1196: uint = 153;

    public static const const_3002: uint = 4;

    public static const const_254: uint = 25;

    public static const const_2441: uint = 15;

    public static const const_3226: uint = 5;

    public static const DIMINISHER: uint = 32;

    public static const const_1999: uint = 19;

    public static const const_3212: uint = 148;

    public static const SPEARHEAD: uint = 42;

    public static const const_2461: uint = 158;

    public static const const_2400: uint = 3;

    public static const const_2116: uint = 75;

    public static const const_1006: uint = 142;

    public static const const_1362: uint = 70;

    public static const const_958: uint = 185;

    public static const const_2181: uint = 56;

    public static const const_3310: uint = 123;

    public static const VENOM: uint = 35;

    public static const const_1660: uint = 36;

    public static const const_1189: uint = 10;

    public static const CITADEL: uint = 41;

    public static const ENFORCER: uint = 24;

    public static const const_2278: uint = 131;

    public static const const_2468: uint = 174;

    public static const const_1140: uint = 168;

    public static const ID: int = 27619;


    public var var_2971: uint = 0;

    public function class_433(param1: uint = 0) {
        super();
        this.var_2971 = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 0;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.var_2971 = param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(this.var_2971);
    }
}
}
