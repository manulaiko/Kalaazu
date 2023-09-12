package net.bigpoint.darkorbit {

import flash.utils.ByteArray;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_120.class_431;

import package_127.class_356;

import package_139.class_428;

import package_19.class_68;
import package_19.class_70;

import package_22.class_426;

import package_30.VideoElement;

import package_38.class_163;
import package_38.class_429;
import package_38.class_430;
import package_38.class_433;
import package_38.class_435;
import package_38.class_437;
import package_38.class_439;
import package_38.class_440;
import package_38.class_441;
import package_38.class_442;
import package_38.class_443;
import package_38.class_444;
import package_38.class_445;

public class class_126 {

    private static const PVP: String = "PVP";

    private static const UBER: String = "UBER";

    private static const GALAXY_GATE: String = "GG";

    private static const const_1890: String = "JP";

    private static const const_3047: String = "TA";

    private static const const_463: String = "Pirates";

    public static const const_828: int = 1000;

    public static const const_576: int = 0;

    public static const const_955: int = 1;

    public static const const_1641: int = 2;

    public static const const_2471: int = 0;

    public static const const_1952: int = 1;

    public static const const_1583: int = 2;

    public static const const_1124: int = 3;

    public static const const_1779: int = 4;

    public static const const_1250: int = 5;

    public static const const_80: int = 6;

    public static const const_2657: int = 7;

    public static const const_1423: int = 101;

    public static const const_806: int = 104;

    public static const const_1361: int = 105;

    public static const const_437: int = 102;

    public static const const_448: int = 107;

    public static const const_3104: int = 108;

    public static const const_1508: int = 109;

    public static const const_1752: int = 103;

    public static const const_3217: int = 106;

    public static const const_545: int = 110;

    public static const const_1685: int = 111;

    public static const const_128: int = 1000;

    public static const const_839: int = 1001;

    public static const const_1401: int = 0;

    public static const const_3249: int = 1;

    public static const const_1072: int = 4;

    public static const const_2212: int = 5;

    public static const const_2261: int = 6;

    public static const const_757: int = 14;

    public static const const_2472: int = 18;

    public static const const_1498: int = 20;

    public static const const_175: int = 21;

    public static const const_623: int = 22;

    public static const const_9: int = 23;

    public static const const_906: int = 24;

    public static const const_2727: int = 25;

    public static const const_829: int = 26;

    public static const const_76: int = 27;

    public static const const_2136: int = 28;

    public static const const_3037: int = 29;

    public static const const_2575: int = 30;

    public static const const_2174: int = 31;

    public static const const_532: int = 33;

    public static const const_1374: int = 34;

    public static const const_1798: int = 35;

    public static const const_781: int = 36;

    public static const const_2157: int = 37;

    public static const const_2639: int = 38;

    public static const const_1493: int = 40;

    public static const const_3018: int = 41;

    public static const const_2053: int = 42;

    public static const const_1932: int = 43;

    public static const const_426: int = 46;

    public static const const_689: int = 47;

    public static const const_2347: int = 48;

    public static const const_1044: int = 51;

    public static const const_1920: int = 67;

    public static const const_756: int = 68;

    public static const const_2950: int = 69;

    public static const const_176: int = 70;

    public static const const_585: int = 71;

    public static const const_1814: int = 72;

    public static const const_182: int = 73;

    public static const const_3316: int = 75;

    public static const const_1325: int = 76;

    public static const const_521: int = 77;

    public static const const_2078: int = 78;

    public static const const_592: int = 79;

    public static const const_2552: int = 80;

    public static const const_367: int = 81;

    public static const const_2367: int = 82;

    public static const const_1308: int = 83;

    public static const const_702: int = 84;

    public static const const_2534: int = 85;

    public static const const_961: int = 86;

    public static const const_2818: int = 90;

    public static const const_2464: int = 91;

    public static const const_2942: int = 92;

    public static const const_974: int = 93;

    public static const const_834: int = 95;

    public static const const_1259: int = 96;

    public static const const_1610: int = 97;

    public static const const_2773: int = 98;

    public static const const_2529: int = 99;

    public static const const_1571: int = 100;

    public static const const_3128: int = 101;

    public static const const_1312: int = 102;

    public static const const_1536: int = 103;

    public static const const_1856: int = 104;

    public static const const_1158: int = 110;

    public static const const_2929: int = 111;

    public static const const_2025: int = 113;

    public static const const_2891: int = 115;

    public static const const_354: int = 116;

    public static const const_3308: int = 117;

    public static const const_1134: int = 118;

    public static const const_3323: int = 119;

    public static const const_2542: int = 120;

    public static const const_1749: int = 121;

    public static const const_1001: int = 122;

    public static const const_3122: int = 123;

    public static const const_139: int = 124;

    public static const const_3202: int = 125;

    public static const const_3000: int = 104;

    public static const const_1435: int = 104;

    public static const const_2728: int = 104;

    public static const const_1753: int = 129;

    public static const const_3241: int = 130;

    public static const const_2208: int = 131;

    public static const const_2808: int = 132;

    public static const const_1621: int = 134;

    public static const const_1041: int = 1000001;

    public static const const_537: Array = [const_1952, const_1583, const_1124, const_1779, const_1250, const_80, const_2657, const_1423, const_806, const_1361, const_437, const_1508, const_3104, const_448, const_1752, const_3217, const_545, const_1685];

    public static const const_3198: Vector.<int> = new <int>[51, 52, 53, 54, 55, 56, 57, 58, 70, 71, 72, 73, 74, 75, 76, 77, 78, 223];

    private static var _instance: class_126;

    private static var var_3739: Array = new Array();

    private static const const_1842: Class = class_438;

    private static const const_812: Object = method_4439();


    public const const_1548: class_68 = new class_70();

    public var var_1524: Array;

    public var var_2195: Array;

    public var var_680: Array;

    public var var_4819: Array;

    public var var_3029: Array;

    public var var_1638: Array;

    public var var_3377: Array;

    public var var_3905: Array;

    public var var_4603: Array;

    public var var_4928: Array;

    public var var_109: Array;

    public var var_2033: Dictionary;

    public var var_3943: Dictionary;

    public var var_51: Dictionary;

    public var var_1044: Dictionary;

    private var var_778: Array;

    private var var_1395: Array;

    private var var_2866: Array;

    private var var_2153: Array;

    private var var_1495: Array;

    private var var_890: Array;

    private var var_909: Array;

    private var var_4069: Array;

    private var var_4722: Array;

    private var var_3292: Array;

    private var var_4737: Array;

    private var var_1756: Array;

    private var var_4620: Array;

    private var var_4964: Array;

    private var var_4361: Array;

    private var var_1549: Array;

    private var var_3063: Dictionary;

    private var var_4083: Dictionary;

    private var var_892: Array;

    private var var_4951: Array;

    private var var_1750: Array;

    private var var_4425: Array;

    private var var_1218: Array;

    private var var_4161: Array;

    private var var_1941: Array;

    private var var_2157: Dictionary;

    private var var_4593: Array;

    private var var_406: Array;

    private var var_368: Array;

    private var var_3584: Array;

    private var var_3538: Array;

    private var var_3486: Dictionary;

    private var var_2903: Array;

    private var var_5002: Array;

    private var var_4926: Array;

    private var var_4180: String = "default";

    public function class_126(param1: Function) {
        this.var_4928 = [];
        this.var_109 = [];
        this.var_3943 = new Dictionary();
        this.var_51 = new Dictionary();
        this.var_1044 = new Dictionary();
        this.var_5002 = new Array();
        this.var_4926 = new Array();
        super();
        if (param1 !== method_336) {
            throw new Error("IngameCatalog is a Singleton and can only be accessed through ingameCatalog.getInstance()");
        }
        this.var_3292 = [];
        this.var_3292[0] = "any";
        this.var_3292[1] = "laser";
        this.var_3292[2] = "rocket";
        this.var_3292[3] = "mine";
        this.var_3292[4] = "radiation";
        this.var_3292[5] = "direct";
        this.var_4928[1] = "HST-1";
        this.var_4928[2] = "HST-2";
        this.var_109[1] = "AJP-01";
        this.var_1941 = [];
        this.var_1941[1] = class_163.const_98;
        this.var_1941[2] = class_163.const_225;
        this.var_1941[3] = class_163.const_2375;
        this.var_1941[4] = class_163.const_1025;
        this.var_1941[11] = class_163.const_763;
        this.var_1941[12] = class_163.const_2322;
        this.var_1941[13] = class_163.PROMERIUM;
        this.var_1941[14] = class_163.SEPROM;
        this.var_1941[15] = class_163.PALLADIUM;
        this.var_909 = [];
        this.var_909[class_163.const_98] = class_88.getItem("ore_prometium");
        this.var_909[class_163.const_225] = class_88.getItem("ore_endurium");
        this.var_909[class_163.const_2375] = class_88.getItem("ore_terbium");
        this.var_909[class_163.const_1025] = class_88.getItem("ore_xenomit");
        this.var_909[class_163.const_763] = class_88.getItem("ore_prometid");
        this.var_909[class_163.const_2322] = class_88.getItem("ore_duranium");
        this.var_909[class_163.PROMERIUM] = class_88.getItem("ore_promerium");
        this.var_909[class_163.SEPROM] = class_88.getItem("ore_seprom");
        this.var_909[class_163.PALLADIUM] = class_88.getItem("ore_palladium");
        this.var_4161 = [];
        this.var_4161[class_163.const_98] = "ore_1.png";
        this.var_4161[class_163.const_225] = "ore_2.png";
        this.var_4161[class_163.const_2375] = "ore_3.png";
        this.var_4161[class_163.PALLADIUM] = "ore_15.png";
        this.var_4069 = [];
        this.var_4069[1] = "MMO";
        this.var_4069[2] = "EIC";
        this.var_4069[3] = "VRU";
        this.var_4069[4] = "SAT";
        this.var_368 = [];
        this.var_368[class_439.NONE] = "NONE";
        this.var_368[class_439.MMO] = "MMO";
        this.var_368[class_439.EIC] = "EIC";
        this.var_368[class_439.VRU] = "VRU";
        var_3739["mmo"] = class_439.MMO;
        var_3739["eic"] = class_439.EIC;
        var_3739["vru"] = class_439.VRU;
        this.var_4722 = [];
        this.var_4722[class_439.NONE] = 4294967295;
        this.var_4722[class_439.MMO] = 4294911269;
        this.var_4722[class_439.EIC] = 4284994303;
        this.var_4722[class_439.VRU] = 4288282402;
        this.var_4722[4] = 16776960;
        this.var_4593 = [];
        this.var_4593[1] = "mmo";
        this.var_4593[2] = "eic";
        this.var_4593[3] = "vru";
        this.var_4593[4] = "sat";
        this.var_2866 = [];
        this.var_2866[1] = "Phoenix";
        this.var_2866[2] = "Yamato";
        this.var_2866[3] = "Leonov";
        this.var_2866[4] = "Defcom";
        this.var_2866[5] = "Liberator";
        this.var_2866[6] = "Piranha";
        this.var_2866[7] = "Nostromo";
        this.var_2866[8] = "Vengeance";
        this.var_2866[9] = "Bigboy";
        this.var_2866[10] = "Goliath";
        this.var_2866[11] = "Citadel";
        this.var_2866[12] = "Aegis";
        this.var_2866[13] = "Spearhead";
        this.var_890 = [];
        this.var_890[1] = "Streuner";
        this.var_890[2] = "Lordakia";
        this.var_890[3] = "Devolarium";
        this.var_890[4] = "Mordon";
        this.var_890[5] = "Sibelon";
        this.var_890[6] = "Saimon";
        this.var_890[7] = "Sibelonit";
        this.var_890[8] = "Lordakium";
        this.var_890[9] = "Kristallin";
        this.var_890[10] = "Kristallon";
        this.var_890[11] = "StreuneR";
        this.var_890[12] = "Protegit";
        this.var_890[13] = "Cubikon";
        this.var_890[14] = "Boss Streuner";
        this.var_890[15] = "Boss Lordakia";
        this.var_890[16] = "Boss Mordon";
        this.var_890[17] = "Boss Saimon";
        this.var_890[18] = "Boss Devolarium";
        this.var_890[19] = "Boss Sibelonit";
        this.var_890[20] = "Boss Sibelon";
        this.var_890[21] = "Boss Lordakium";
        this.var_890[22] = "Boss Kristallin";
        this.var_890[23] = "Boss Kristallon";
        this.var_890[24] = "Boss StreuneR";
        this.var_890[25] = "UFO";
        this.var_890[26] = "UFONIT";
        this.var_890[27] = "Aggro-Streuner";
        this.var_890[28] = "UberStreuner";
        this.var_890[29] = "UberLordakia";
        this.var_890[30] = "UberMordon";
        this.var_890[31] = "UberSaimon";
        this.var_890[32] = "UberDevolarium";
        this.var_890[33] = "UberSibelonit";
        this.var_890[34] = "UberSibelon";
        this.var_890[35] = "UberLordakium";
        this.var_890[36] = "UberKristallin";
        this.var_890[37] = "UberKristallon";
        this.var_890[38] = "UberStreuneR";
        this.var_890[39] = "Demaner";
        this.var_890[40] = "Kucurbium";
        this.var_890[41] = "BossKucurbium";
        this.var_890[42] = "Vagrant";
        this.var_890[43] = "Marauder";
        this.var_890[44] = "Outcast";
        this.var_890[45] = "Corsair";
        this.var_890[46] = "Hooligan";
        this.var_890[47] = "Ravager";
        this.var_890[48] = "Convict";
        this.var_890[49] = "Century Falcon";
        this.var_890[50] = "Unidentified Destroyer";
        this.var_890[51] = "Unidentified Dreadnought";
        this.var_890[52] = "Cubikon";
        this.var_890[53] = "UberProtegit";
        this.var_890[54] = "Ice Meteoroid";
        this.var_890[55] = "Super Ice Meteoroid";
        this.var_890[56] = "Icy";
        this.var_890[57] = "1100101";
        this.var_890[58] = "Interceptor";
        this.var_890[59] = "Barracuda";
        this.var_890[60] = "Saboteur";
        this.var_890[61] = "Annihilator";
        this.var_890[62] = "Battleray";
        this.var_890[63] = "Infernal";
        this.var_890[64] = "Scorcher";
        this.var_890[65] = "Melter";
        this.var_890[66] = "Devourer";
        this.var_890[67] = "Vagrant";
        this.var_890[68] = "Marauder";
        this.var_890[69] = "Outcast";
        this.var_890[70] = "Corsair";
        this.var_890[71] = "Hooligan";
        this.var_890[72] = "Ravager";
        this.var_890[73] = "Convict";
        this.var_890[74] = "Santa-1100101";
        this.var_890[75] = "Referee-Bot";
        this.var_890[76] = "Sunburst Lordakium";
        this.var_890[77] = "Saturn Phoenix";
        this.var_890[78] = "Saturn Yamato";
        this.var_890[79] = "Saturn Defcom";
        this.var_890[80] = "Saturn Liberator";
        this.var_890[81] = "Saturn Nostromo";
        this.var_890[82] = "Saturn Piranha";
        this.var_890[83] = "Saturn Bigboy";
        this.var_890[84] = "Saturn Vengeance";
        this.var_890[85] = "Saturn Goliath";
        this.var_890[86] = "Saturn Leonov";
        this.var_890[87] = "Saturn Venom";
        this.var_890[88] = "Saturn Sentinel";
        this.var_890[89] = "Saturn Spectrum";
        this.var_890[90] = "Saturn Diminisher";
        this.var_890[91] = "Saturn Solace";
        this.var_890[92] = "Saturn Revenge";
        this.var_890[93] = "Saturn Lightning";
        this.var_890[94] = "Saturn Avenger";
        this.var_890[95] = "Saturn Bastion";
        this.var_890[96] = "Saturn Enforcer";
        this.var_890[97] = "Saturn Spearhead";
        this.var_890[98] = "Saturn Citadel";
        this.var_890[99] = "Saturn Aegis";
        this.var_890[100] = "Saturn Crimson";
        this.var_890[101] = "Saturn Jade";
        this.var_890[102] = "Saturn Sapphire";
        this.var_890[103] = "Evil You";
        this.var_890[104] = "Evil Iris";
        this.var_890[105] = "Hitac-Minion";
        this.var_890[106] = "Hitac 2.0";
        this.var_890[107] = "Crazy Ufo";
        this.var_890[108] = "Boss Curcubitor";
        this.var_890[109] = "Curcubitor";
        this.var_890[110] = "Disguisor";
        this.var_890[111] = "Protekid";
        this.var_890[112] = "Cubikid";
        this.var_890[113] = "Emperor Sibelon";
        this.var_890[114] = "Emperor Lordakium";
        this.var_890[115] = "Emperor Kristallon";
        this.var_890[116] = "Demaner Freighter";
        this.var_890[117] = "Demaner Escort";
        this.var_890[118] = "Skoll";
        this.var_890[120] = "Century Falcon";
        this.var_890[121] = "Deadly Battleray";
        this.var_890[122] = "Gygerim";
        this.var_890[123] = "Gygerthralls";
        this.var_2157 = new Dictionary();
        this.var_2157["master_of_the_orbit"] = "title_1";
        this.var_2157["space_cleaner"] = "title_2";
        this.var_2157["dark_pilot"] = "title_3";
        this.var_2157["imperator"] = "title_4";
        this.var_2157["beginner"] = "title_5";
        this.var_2157["goli_hunter"] = "title_6";
        this.var_2157["boss"] = "title_7";
        this.var_2157["alien_hunter"] = "title_8";
        this.var_2157["champion_rifleman"] = "title_9";
        this.var_2157["ace_of_space"] = "title_10";
        this.var_2157["orbit_king"] = "title_11";
        this.var_2157["phoenix_frightener"] = "title_12";
        this.var_2157["chaos_pilot"] = "title_13";
        this.var_2157["most_wanted"] = "title_14";
        this.var_2157["portal_guard"] = "title_15";
        this.var_2157["battlemaster"] = "title_16";
        this.var_2157["system_lord"] = "title_17";
        this.var_2157["the_legend"] = "title_18";
        this.var_2157["hunter_of_the_day"] = "title_19";
        this.var_2157["bounty_hunter"] = "title_20";
        this.var_2157["spring_mmo_2"] = "title_21";
        this.var_2157["spring_eic_2"] = "title_22";
        this.var_2157["spring_vru_2"] = "title_23";
        this.var_2157["spring_mmo"] = "title_100";
        this.var_2157["spring_vru"] = "title_101";
        this.var_2157["spring_eic"] = "title_102";
        this.var_2157["spring_mmo_2"] = "title_104";
        this.var_2157["spring_vru_2"] = "title_105";
        this.var_2157["spring_eic_2"] = "title_106";
        this.var_2157["spring_mmo_3"] = "title_107";
        this.var_2157["spring_eic_3"] = "title_108";
        this.var_2157["spring_vru_3"] = "title_109";
        this.var_2157["pirate_hunt_champion"] = "title_200";
        this.var_2157["pirate_hunters"] = "title_201";
        this.var_2157["pirate_destroyer"] = "title_202";
        this.var_2157["pirate_slayers"] = "title_203";
        this.var_2157["gg-kappa"] = "title_204";
        this.var_2157["gg-lambda"] = "title_205";
        this.var_2157["lord_of_like"] = "title_222";
        this.var_2157["football_official"] = "title_410";
        this.var_1750 = [];
        this.var_1750[0] = "ship_0";
        this.var_1750[1] = "ship_1";
        this.var_1750[2] = "ship_2";
        this.var_1750[3] = "ship_3";
        this.var_1750[4] = "ship_4";
        this.var_1750[5] = "ship_5";
        this.var_1750[6] = "ship_6";
        this.var_1750[7] = "ship_7";
        this.var_1750[8] = "ship_8";
        this.var_1750[9] = "ship_9";
        this.var_1750[10] = "ship_10";
        this.var_1750[30] = "ship_3";
        this.var_1750[50] = "ship_9";
        this.var_1750[52] = "ship_52";
        this.var_1750[53] = "ship_53";
        this.var_1750[54] = "ship_54";
        this.var_1750[55] = "ship_55";
        this.var_1750[56] = "ship_56";
        this.var_1750[57] = "ship_57";
        this.var_1750[58] = "ship_58";
        this.var_1750[59] = "ship_59";
        this.var_1750[60] = "ship_60";
        this.var_1750[61] = "ship_61";
        this.var_1750[62] = "ship_62";
        this.var_1750[63] = "ship_63";
        this.var_1750[64] = "ship_64";
        this.var_1750[65] = "ship_65";
        this.var_1750[66] = "ship_66";
        this.var_1750[67] = "ship_67";
        this.var_1750[11] = "ship_69";
        this.var_1750[69] = "ship_69";
        this.var_1750[12] = "ship_49";
        this.var_1750[49] = "ship_49";
        this.var_1750[13] = "ship_70";
        this.var_1750[70] = "ship_70";
        this.var_4951 = [];
        this.var_4951[1] = "npc_84";
        this.var_4951[2] = "npc_71";
        this.var_4951[3] = "npc_72";
        this.var_4951[4] = "npc_73";
        this.var_4951[5] = "npc_74";
        this.var_4951[6] = "npc_75";
        this.var_4951[7] = "npc_76";
        this.var_4951[8] = "npc_77";
        this.var_4951[9] = "npc_78";
        this.var_4951[10] = "npc_79";
        this.var_4951[11] = "npc_85";
        this.var_4951[12] = "npc_81";
        this.var_4951[13] = "npc_80";
        this.var_4951[14] = "npc_23";
        this.var_4951[15] = "npc_24";
        this.var_4951[16] = "npc_31";
        this.var_4951[17] = "npc_25";
        this.var_4951[18] = "npc_26";
        this.var_4951[19] = "npc_27";
        this.var_4951[20] = "npc_46";
        this.var_4951[21] = "npc_28";
        this.var_4951[22] = "npc_29";
        this.var_4951[23] = "npc_35";
        this.var_4951[24] = "npc_34";
        this.var_4951[25] = "ship_0";
        this.var_4951[26] = "ship_0";
        this.var_4951[27] = "npc_84";
        this.var_4951[28] = "npc_85";
        this.var_4951[29] = "npc_24";
        this.var_4951[30] = "npc_31";
        this.var_4951[31] = "npc_25";
        this.var_4951[32] = "npc_26";
        this.var_4951[33] = "npc_27";
        this.var_4951[34] = "npc_46";
        this.var_4951[35] = "npc_28";
        this.var_4951[36] = "npc_42";
        this.var_4951[37] = "npc_45";
        this.var_4951[38] = "npc_34";
        this.var_4951[39] = "npc_11";
        this.var_4951[40] = "npc_82";
        this.var_4951[41] = "npc_84";
        this.var_4951[42] = "npc_94";
        this.var_4951[43] = "npc_93";
        this.var_4951[44] = "npc_92";
        this.var_4951[45] = "npc_91";
        this.var_4951[46] = "npc_96";
        this.var_4951[47] = "npc_97";
        this.var_4951[48] = "npc_95";
        this.var_4951[49] = "npc_90";
        this.var_4951[50] = "npc_100";
        this.var_4951[51] = "npc_99";
        this.var_4951[52] = "npc_80";
        this.var_4951[53] = "npc_81";
        this.var_4951[54] = "npc_101";
        this.var_4951[55] = "npc_33";
        this.var_4951[56] = "npc_103";
        this.var_4951[57] = "npc_104";
        this.var_4951[58] = "npc_111";
        this.var_4951[59] = "npc_112";
        this.var_4951[60] = "npc_113";
        this.var_4951[61] = "npc_114";
        this.var_4951[62] = "npc_115";
        this.var_4951[63] = "npc_100";
        this.var_4951[64] = "npc_99";
        this.var_4951[65] = "npc_102";
        this.var_4951[66] = "npc_105";
        this.var_4951[67] = "npc_94";
        this.var_4951[68] = "npc_93";
        this.var_4951[69] = "npc_92";
        this.var_4951[70] = "npc_91";
        this.var_4951[71] = "npc_96";
        this.var_4951[72] = "npc_97";
        this.var_4951[73] = "npc_95";
        this.var_4951[74] = "npc_32";
        this.var_4951[75] = "npc_89";
        this.var_4951[76] = "npc_107";
        this.var_4951[77] = "ship_1";
        this.var_4951[78] = "ship_2";
        this.var_4951[79] = "ship_4";
        this.var_4951[80] = "ship_5";
        this.var_4951[81] = "ship_7";
        this.var_4951[82] = "ship_6";
        this.var_4951[83] = "ship_9";
        this.var_4951[84] = "ship_8";
        this.var_4951[85] = "ship_10";
        this.var_4951[86] = "ship_3";
        this.var_4951[87] = "ship_67";
        this.var_4951[88] = "ship_66";
        this.var_4951[89] = "ship_65";
        this.var_4951[90] = "ship_64";
        this.var_4951[91] = "ship_63";
        this.var_4951[92] = "ship_58";
        this.var_4951[93] = "ship_18";
        this.var_4951[94] = "ship_60";
        this.var_4951[95] = "ship_59";
        this.var_4951[96] = "ship_56";
        this.var_4951[97] = "ship_70";
        this.var_4951[98] = "ship_69";
        this.var_4951[99] = "ship_49";
        this.var_4951[100] = "ship_53";
        this.var_4951[101] = "ship_19";
        this.var_4951[102] = "ship_54";
        this.var_4951[103] = "ship_103";
        this.var_4951[104] = "npc_108";
        this.var_4951[105] = "npc_117";
        this.var_4951[106] = "npc_116";
        this.var_4951[107] = "ship_0";
        this.var_4951[108] = "npc_118";
        this.var_4951[109] = "npc_119";
        this.var_4951[110] = "npc_120";
        this.var_4951[111] = "npc_81";
        this.var_4951[112] = "npc_80";
        this.var_4951[113] = "npc_124";
        this.var_4951[114] = "npc_123";
        this.var_4951[115] = "npc_122";
        this.var_4951[116] = "npc_126";
        this.var_4951[117] = "npc_11";
        this.var_4951[118] = "npc_127";
        this.var_4951[120] = this.var_4951[49];
        this.var_4951[121] = "npc_115";
        this.var_4951[123] = "npc_128";
        this.var_4951[122] = "npc_129";
        this.method_2028();
        this.var_1495 = [];
        this.var_1495["title_222"] = 3889560;
        this.var_1495["title_achievement_event_solarclash-2012-completegold-3"] = 11184640;
        this.var_1495["title_achievement_event_solarclash-2012-completesilver-2"] = 13421772;
        this.var_1495["title_achievement_event_solarclash-2012-completebronze-1"] = 13467442;
        this.var_4603 = [];
        this.var_4603[11] = 69;
        this.var_4603[12] = 49;
        this.var_4603[13] = 70;
        this.var_4425 = [];
        this.var_4425[0] = "drone_formation0_simple.png";
        this.var_4425[1] = "drone_formation1_simple.png";
        this.var_4425[2] = "drone_formation2_simple.png";
        this.var_4425[3] = "drone_formation3_simple.png";
        this.var_4425[4] = "drone_formation4_simple.png";
        this.var_4425[5] = "drone_formation5_simple.png";
        this.var_4425[6] = "drone_formation6_simple.png";
        this.var_4425[7] = "drone_formation7_simple.png";
        this.var_4425[8] = "drone_formation8_simple.png";
        this.var_4425[9] = "drone_formation9_simple.png";
        this.var_4425[10] = "drone_formation10_simple.png";
        this.var_4425[11] = "drone_formation11_simple.png";
        this.var_4425[12] = "drone_formation12_simple.png";
        this.var_4425[13] = "drone_formation13_simple.png";
        this.var_4425[14] = "drone_formation14_simple.png";
        this.var_4425[15] = "drone_formation15_simple.png";
        this.var_4425[16] = "drone_formation16_simple.png";
        this.var_4425[17] = "drone_formation17_simple.png";
        this.var_4425[18] = "drone_formation18_simple.png";
        this.var_4425[19] = "drone_formation19_simple.png";
        this.var_4425[20] = "drone_formation20_simple.png";
        this.var_4425[21] = "drone_formation21_simple.png";
        this.var_4425[42] = "drone_formation42_simple.png";
        this.var_680 = [];
        this.var_680[1] = "LCB-10";
        this.var_680[2] = "MCB-25";
        this.var_680[3] = "MCB-50";
        this.var_680[4] = "UCB-100";
        this.var_680[5] = "SAB-50";
        this.var_680[6] = "RSB-75";
        this.var_680[7] = "CBO-100";
        this.var_680[8] = "JOB-100";
        this.var_680[9] = "JOB-100";
        this.var_680[10] = "RB-214";
        this.var_680[109] = "PIB-100";
        this.var_2195 = [];
        this.var_2195[class_426.const_2352] = "R-310";
        this.var_2195[class_426.const_2768] = "PLT-2026";
        this.var_2195[class_426.const_3242] = "PLT-2021";
        this.var_2195[class_426.const_1251] = "PLT-3030";
        this.var_2195[class_426.const_2987] = "PLD-8";
        this.var_2195[class_426.const_2854] = "DCR-250";
        this.var_2195[class_426.WIZ] = "WIZ-X";
        this.var_2195[class_426.const_959] = "R-IC3";
        this.var_2195[class_426.const_2290] = "HSTRM-01";
        this.var_2195[class_426.const_1908] = "UBR-100";
        this.var_2195[class_426.const_3215] = "ECO-10";
        this.var_2195[class_426.const_2142] = "ECO-10";
        this.var_2195[class_426.const_1911] = "BDR-1211";
        this.var_2195[class_426.const_349] = "SAR-01";
        this.var_2195[class_426.const_1758] = "SAR-02";
        this.var_2195[class_426.CBR] = "CBR";
        this.var_2195[class_426.const_1360] = "BDR-1212";
        this.var_4737 = [];
        this.var_4737[1] = "ACM-01";
        this.var_4737[2] = "SMB-01";
        this.var_4737[3] = "ISH-01";
        this.var_4737[4] = "EMP-01";
        this.var_4737[5] = "FWX-S";
        this.var_4737[6] = "FWX-M";
        this.var_4737[7] = "FWX-L";
        this.var_4737[8] = "FWX-COM";
        this.var_4737[9] = "FWX-RZ";
        this.var_4737[10] = "EMPM-01";
        this.var_4737[11] = "SABM-01";
        this.var_4737[12] = "DDM-01";
        this.var_4737[13] = "SL-M01";
        this.var_1756 = [];
        this.var_1756[1] = "REP-1";
        this.var_1756[2] = "REP-2";
        this.var_1756[3] = "REP-3";
        this.var_1756[4] = "REP-4";
        this.var_1756[9] = "REP-S";
        this.var_4620 = [];
        this.var_4620[1] = "JP-01";
        this.var_4620[2] = "JP-02";
        this.var_1549 = [];
        this.var_1549[1] = "AROL-X";
        this.var_892 = [];
        this.var_892[1] = "RL-LB1";
        this.var_3029 = [];
        this.var_3029[1] = "CL04K";
        this.var_3029[2] = "CL04K XL";
        this.var_4361 = [];
        this.var_4361[1] = "AIM-01";
        this.var_4361[2] = "AIM-02";
        this.var_4964 = [];
        this.var_4964[1] = "HM7";
        this.var_4819 = [];
        this.var_4819[1] = "DR001";
        this.var_4819[2] = "DR002";
        this.var_1638 = [];
        this.var_1638[1] = "XP-B01";
        this.var_1638[2] = "HON-B01";
        this.var_1638[3] = "DMG-B01";
        this.var_1638[4] = "SHD-B01";
        this.var_1638[5] = "REP-B01";
        this.var_1638[6] = "SREG-B01";
        this.var_1638[7] = "RES-B01";
        this.var_1638[8] = "HP-B01";
        this.var_1638[9] = "NQR-B01";
        this.var_1638[10] = "NBX-B01";
        this.var_1638[11] = "XP-B02";
        this.var_1638[12] = "HON-B02";
        this.var_1638[13] = "DMG-B02";
        this.var_1638[14] = "SHD-B02";
        this.var_1638[15] = "REP-B02";
        this.var_1638[16] = "SREG-B02";
        this.var_1638[17] = "RES-B02";
        this.var_1638[18] = "HP-B02";
        this.var_1638[19] = "NQR-B02";
        this.var_1638[20] = "NBX-B02";
        this.var_1638[21] = "CD-B01";
        this.var_1638[22] = "CD-B02";
        this.var_1638[23] = "HON-B50";
        this.var_1638[24] = "XP-B50";
        this.var_1638[25] = "MUL-B03";
        this.var_1638[26] = "HONM-1";
        this.var_1638[27] = "XPM-1";
        this.var_1638[28] = "DMGM-1";
        this.var_1638[29] = "REP-S01";
        this.var_3377 = [];
        this.var_3377[class_441.const_1761] = 1;
        this.var_3377[class_441.const_2348] = 2;
        this.var_3377[class_441.const_1046] = 3;
        this.var_3377[class_441.const_2565] = 4;
        this.var_3377[class_441.const_2617] = 5;
        this.var_3377[class_441.const_2395] = 6;
        this.var_3377[class_441.const_2912] = 7;
        this.var_3377[class_441.const_1837] = 8;
        this.var_3377[class_441.const_240] = 9;
        this.var_3377[class_441.const_2763] = 10;
        this.var_3377[class_441.const_2988] = 11;
        this.var_3377[class_441.const_3133] = 12;
        this.var_3377[class_441.const_2612] = 13;
        this.var_3377[class_441.const_476] = 14;
        this.var_3377[class_441.const_1106] = 15;
        this.var_3377[class_441.const_864] = 16;
        this.var_3377[class_441.const_1143] = 17;
        this.var_3377[class_441.const_799] = 18;
        this.var_3377[class_441.const_2963] = 21;
        this.var_3377[class_441.const_1688] = 22;
        this.var_3377[class_441.const_1298] = 23;
        this.var_3377[class_441.const_2082] = 24;
        this.var_3377[class_441.const_1618] = 25;
        this.var_3377[class_441.const_2712] = 26;
        this.var_3377[class_441.const_2922] = 27;
        this.var_3377[class_441.const_1584] = 28;
        this.var_3377[class_441.const_2626] = 29;
        this.var_3905 = [];
        this.var_3905[class_429.EP] = 1;
        this.var_3905[class_429.HONOUR] = 2;
        this.var_3905[class_429.DAMAGE] = 3;
        this.var_3905[class_429.SHIELD] = 4;
        this.var_3905[class_429.REPAIR] = 5;
        this.var_3905[class_429.const_541] = 6;
        this.var_3905[class_429.const_73] = 7;
        this.var_3905[class_429.const_1020] = 8;
        this.var_3905[class_429.const_1018] = 9;
        this.var_3905[class_429.const_120] = 10;
        this.var_3905[class_429.const_1982] = 21;
        this.var_1218 = [];
        this.var_1218[0] = "npc";
        this.var_1218[1] = "pirate";
        this.var_2153 = [];
        this.var_2153[0] = "Nyx";
        this.var_2153[1] = "Morgus Petterson";
        this.var_2153[2] = "Reginald Crowley";
        this.var_2153[3] = "Vanessa Arkadium";
        this.var_2033 = new Dictionary();
        this.var_2033["ammunition_rocketlauncher_sar-01"] = new class_356("sar-01", "SAR-01", "ammunition.rocketlauncher", "rocketlauncher");
        this.var_2033["ammunition_rocketlauncher_sar-02"] = new class_356("sar-02", "SAR-02", "ammunition.rocketlauncher", "rocketlauncher");
        this.var_2033["ammunition_mine_acm-01"] = new class_356("acm-01", "ACM-01", "ammunition.mine", "acm");
        this.var_2033["ammunition_mine_empm-01"] = new class_356("empm-01", "EMP-M01", "ammunition.mine", "empm");
        this.var_2033["ammunition_specialammo_emp-01"] = new class_356("emp-01", "EMP-01", "ammunition.specialammo", "emp");
        this.var_2033["ammunition_laser_cbo-100"] = new class_356("cbo-100", "CBO-100", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_lcb-10"] = new class_356("lcb-10", "LCB-10", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_mcb-25"] = new class_356("mcb-25", "MCB-25", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_mcb-50"] = new class_356("mcb-50", "MCB-50", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_sab-50"] = new class_356("sab-50", "SAB-50", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_rocket_plt-2021"] = new class_356("plt-2021", "PLT-2021", "ammunition.rocket", "rocket");
        this.var_2033["ammunition_rocket_plt-2026"] = new class_356("plt-2026", "PLT-2026", "ammunition.rocket", "rocket");
        this.var_2033["ammunition_rocket_plt-2030"] = new class_356("plt-3030", "PLT-3030", "ammunition.rocket", "rocket");
        this.var_2033["ammunition_specialammo_dcr-250"] = new class_356("dcr-250", "DCR-250", "ammunition.specialammo", "rocket");
        this.var_2033["ammunition_specialammo_wiz-x"] = new class_356("wiz-x", "WIZ-X", "ammunition.specialammo", "rocket");
        this.var_2033["ammunition_laser_ucb-100"] = new class_356("ucb-100", "UCB-100", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_rb-214"] = new class_356("rb-214", "RB-214", "ammunition.laser", "laserammo");
        this.var_2033["ammunition_laser_pib-100"] = new class_356("pib-100", "PIB-100", "ammunition.laser", "laserammo");
        this.var_2033["equipment_extra_cpu_ajp-01"] = new class_356("ajp-01", "AJP-01", "equipment.extra.cpu", "jump-cpu");
        this.var_2033["equipment_extra_cpu_dr-01"] = new class_356("dr-01", "DR-01", "equipment.extra.cpu", "drone-repair-cpu");
        this.var_2033["equipment_extra_cpu_cl04k-m"] = new class_356("cl04k-m", "CL04K-M", "equipment.extra.cpu", "cloak-cpu");
        this.var_2033["equipment_extra_cpu_cl04k-xl"] = new class_356("cl04k-xl", "CL04K-XL", "equipment.extra.cpu", "cloak-cpu");
        this.var_2033["equipment_extra_cpu_fb-x"] = new class_356("fb-x", "FB-X", "equipment.extra.cpu", "cpu");
        this.var_2033["equipment_extra_cpu_nc-rrb-x"] = new class_356("nc-rrb-x", "NC-RRB", "equipment.extra.cpu", "auto-cpu");
        this.var_2033["equipment_extra_cpu_nc-awr-x"] = new class_356("nc-awr-x", "NC-AWR", "equipment.extra.cpu", "auto-cpu");
        this.var_2033["equipment_extra_cpu_jp-01"] = new class_356("jp-01", "JP-01", "equipment.extra.cpu", "jump-cpu");
        this.var_2033["equipment_extra_cpu_sle-01"] = new class_356("sle-01", "SLE-01", "equipment.extra.cpu", "cpu");
        this.var_2033["equipment_extra_cpu_min-t01"] = new class_356("min-t01", "MIN-T01", "equipment.extra.cpu", "cpu");
        this.var_2033["equipment_generator_shield_sg3n-a02"] = new class_356("sg3n-a02", "SG3N-A02", "equipment.generator.shield", "shield-generator");
        this.var_2033["equipment_generator_speed_g3n-3310"] = new class_356("g3n-3310", "G3N-3310", "equipment.generator.speed", "speed-generator");
        this.var_2033["equipment_generator_speed_g3n-6900"] = new class_356("g3n-6900", "G3N-6900", "equipment.generator.speed", "speed-generator");
        this.var_2033["equipment_generator_speed_g3n-7900"] = new class_356("g3n-7900", "G3N-7900", "equipment.generator.speed", "speed-generator");
        this.var_2033["equipment_generator_shield_sg3n-b01"] = new class_356("sg3n-b01", "SG3N-B01", "equipment.generator.shield", "shield-generator");
        this.var_2033["equipment_generator_shield_sg3n-b02"] = new class_356("sg3n-b02", "SG3N-B02", "equipment.generator.shield", "shield-generator");
        this.var_2033["equipment_weapon_laser_lf-2"] = new class_356("lf-2", "LF-2", "equipment.weapons.laser", "laser");
        this.var_2033["equipment_weapon_laser_lf-3"] = new class_356("lf-3", "LF-3", "equipment.weapons.laser", "laser");
        this.var_2033["equipment_weapon_laser_lf-4"] = new class_356("lf-4", "LF-4", "equipment.weapons.laser", "laser");
        this.var_2033["ship_goliath_design_venom"] = new class_356("venom", "VENOM", "ship.goliath.design", "skill-design");
        this.var_2033["ship_goliath_design_solace"] = new class_356("solace", "SOLACE", "ship.goliath.design", "skill-design");
        this.var_2033["ship_goliath_design_spectrum"] = new class_356("spectrum", "SPECTRUM", "ship.goliath.design", "skill-design");
        this.var_2033["ship_goliath_design_diminisher"] = new class_356("diminsher", "DIMINISHER", "ship.goliath.design", "skill-design");
        this.var_2033["ship_goliath_design_sentinel"] = new class_356("sentinel", "SENTINEL", "ship.goliath.design", "skill-design");
        this.var_2033["ship_vengeance_design_adept"] = new class_356("adept", "ADEPT", "ship.vengeance.design", "vengeance-design");
        this.var_2033["ship_vengeance_design_avenger"] = new class_356("avenger", "AVENGER", "ship.vengeance.design", "vengeance-design");
        this.var_2033["ship_vengeance_design_corsair"] = new class_356("corsair", "CORSAIR", "ship.vengeance.design", "vengeance-design");
        this.var_2033["ship_vengeance_design_lightning"] = new class_356("lightning", "LIGHTNING", "ship.vengeance.design", "vengeance-design");
        this.var_2033["ship_vengeance_design_revenge"] = new class_356("revenge", "REVENGE", "ship.vengeance.design", "vengeance-design");
        this.var_2033["ship_goliath_design_bastion"] = new class_356("bastion", "BASTION", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_enforcer"] = new class_356("enforcer", "ENFORCER", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_exalted"] = new class_356("exalted", "EXALTED", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_veteran"] = new class_356("veteran", "VETERAN", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_saturn"] = new class_356("saturn", "SATURN", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_centaur"] = new class_356("centaur", "CENTAUR", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_bronze"] = new class_356("bronze", "BRONZE", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_silver"] = new class_356("silver", "SILVER", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_goliath_design_gold"] = new class_356("gold", "GOLD", "ship.goliath.design", "goliath-design");
        this.var_2033["ship_aegis"] = new class_356("aegis", "AEGIS", "ship", "ship");
        this.var_2033["ship_citadel"] = new class_356("citadel", "CITADEL", "ship", "ship");
        this.var_2033["ship_spearhead"] = new class_356("spearhead", "SPEARHEAD", "ship", "ship");
        this.var_2033["ship_liberator"] = new class_356("liberator", "LIBERATOR", "ship", "ship");
        this.var_2033["ship_spearhead_design_spearhead-elite"] = new class_356("spearhead-elite", "SPEARHEAD-VETERAN", "ship.spearhead.design", "ship-design");
        this.var_2033["ship_aegis_design_aegis-elite"] = new class_356("aegis-elite", "AEGIS-VETERAN", "ship.aegis.design", "ship-design");
        this.var_2033["ship_citadel_design_citadel-elite"] = new class_356("citadel-elite", "CITADEL-VETERAN", "ship.citadel.design", "ship-design");
        this.var_2033["resource_ore_seprom"] = new class_356("seprom", "SEPROM", "resource.ore", "ore");
        this.var_2033["resource_ore_palladium"] = new class_356("palladium", "PALLADIUM", "resource.ore", "ore");
        this.var_2033["resource_logfile"] = new class_356("logfile", "LOGFILE", "resource.logfile", "log-file");
        this.var_2033["ship_spearhead_design_spearhead-superelite"] = new class_356("spearhead-superelite", "SPEARHEAD-ELITE", "ship.spearhead.design", "ship-design");
        this.var_2033["ship_aegis_design_aegis-superelite"] = new class_356("aegis-superelite", "AEGIS-ELITE", "ship.aegis.design", "ship-design");
        this.var_2033["ship_citadel_design_citadel-superelite"] = new class_356("citadel-superelite", "CITADEL-ELITE", "ship.citadel.design", "ship-design");
        this.var_2033["resource_key_access-hsg"] = new class_356("access-hsg", "ACCESS-HSG", "resource.key", "key-access-hsg");
        this.var_2033["resource_key_access-scg"] = new class_356("access-hsg", "ACCESS-HSG", "resource.key", "key-access-hsg");
        this.var_2033["resource_blueprint_apis-part"] = new class_356("apis-part", "03A-P01", "resource.blueprint", "drone-apis-part");
        this.var_2033["resource_blueprint_zeus-part"] = new class_356("zeus-part", "04Z-P02", "resource.blueprint", "drone-zeus-part");
        this.var_2033["resource_ore_promerium"] = new class_356("promerium", "PROMERIUM", "resource.ore", "ore");
        this.var_2033["resource_lottery-capsule"] = new class_356("lottery-capsule", "LOTTERY-CAPSULE", "resource.lottery-capsule", "capsule");
        this.var_2033["resource_repairvoucher"] = new class_356("repair-voucher", "REPAIR-VOUCHER", "resource.voucher", "repairvoucher");
        this.var_2033["resource_extra-energy"] = new class_356("extra-energy", "EXTRA-ENERGY", "resource.extra-energy", "extra energy");
        this.var_2033["drone_apis"] = new class_356("apis", "ED-03A", "drone", "drone-apis");
        this.var_2033["drone_designs_havoc"] = new class_356("havoc", "HAVOC", "drone_designs", "drone-design");
        this.var_2033["drone_flax"] = new class_356("flax", "FLAX", "drone", "drone");
        this.var_2033["drone_zeus"] = new class_356("zeus", "ED-04Z", "drone", "drone-zeus");
        this.var_2033["drone_designs_hercules"] = new class_356("hercules", "HERCULES", "drone_designs", "drone-design");
        this.var_2033["module_defm-1"] = new class_356("defm-1", "DEFM-1", "module", "module");
        this.var_2033["module_dmgm-1"] = new class_356("dmgm-1", "DMGM-1", "module", "module");
        this.var_2033["module_honm-1"] = new class_356("honm-1", "HONM-1", "module", "module");
        this.var_2033["module_hulm-1"] = new class_356("hulm-1", "HULM-1", "module", "module");
        this.var_2033["module_ltm-hr"] = new class_356("ltm-hr", "LTM-HR", "module", "module");
        this.var_2033["module_ltm-lr"] = new class_356("ltm-lr", "LTM-LR", "module", "module");
        this.var_2033["module_ltm-mr"] = new class_356("ltm-mr", "LTM-MR", "module", "module");
        this.var_2033["module_ram-la"] = new class_356("ram-la", "RAM-LA", "module", "module");
        this.var_2033["module_ram-ma"] = new class_356("ram-ma", "RAM-MA", "module", "module");
        this.var_2033["module_repm-1"] = new class_356("repm-1", "REPM-1", "module", "module");
        this.var_2033["module_xpm-1"] = new class_356("xpm-1", "XPM-1", "module", "module");
        this.var_2033["currency_credits"] = new class_356("credits", "CREDITS", "currency", "credits");
        this.var_2033["currency_uridium"] = new class_356("uridium", "URIDIUM", "currency", "uridium");
        this.var_2033["currency_experience"] = new class_356("experience", "EXPERIENCE", "currency", "experience");
        this.var_2033["currency_honour"] = new class_356("honour", "HONOUR", "currency", "honour");
        this.var_2033["currency_jackpotmoney"] = new class_356("jackpotmoney", "JACKPOT MONEY", "jackpotmoney");
        this.method_2842();
        this.var_3063 = new Dictionary();
        this.var_3063[class_443.const_1334] = class_431.const_2513;
        this.var_3063[class_443.const_1995] = class_431.const_2513;
        this.var_3063[class_443.const_621] = class_431.const_2821;
        this.var_3063[class_443.DAMAGE] = class_431.const_32;
        this.var_3063[class_443.const_2340] = class_431.const_1780;
        this.var_3063[class_443.RADIATION] = class_431.const_62;
        this.var_3063[class_443.const_335] = class_431.const_1212;
        this.var_3063[class_443.const_1593] = class_431.const_1104;
        this.var_3063[class_443.const_1417] = class_431.const_16;
        this.var_3063[class_443.const_1991] = class_431.const_1709;
        this.var_3063[class_443.const_697] = class_431.const_1881;
        this.var_3063[class_443.const_1771] = null;
        this.var_3063[class_443.const_2532] = null;
        this.var_3063[class_443.const_1923] = null;
        this.var_3063[class_443.const_1400] = null;
        this.var_3063[class_443.const_1632] = null;
        this.var_3063[class_443.const_29] = class_431.const_1382;
        this.var_4083 = new Dictionary();
        this.var_4083[class_442.CIRCLE] = class_431.const_1783;
        this.var_4083[class_442.const_173] = class_431.const_900;
        this.var_4083[class_442.const_597] = class_431.const_2027;
        this.method_2928();
        this.method_97();
        this.method_869();
        this.method_4802();
        this.method_4170();
        this.method_6178();
        this.method_5241();
        this.method_5138();
        this.method_5338();
    }

    public static function get instance(): class_126 {
        if (_instance == null) {
            _instance = new class_126(method_336);
        }
        return _instance;
    }

    public static function getInstance(): class_126 {
        if (_instance == null) {
            _instance = new class_126(method_336);
        }
        return _instance;
    }

    public static function method_4731(param1: String): int {
        param1 = !!param1 ? param1.toLowerCase() : param1;
        return !true ? 0 : -1;
    }

    private static function method_336(): void {
    }

    private static function method_4439(): Object {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc1_: ByteArray = new const_1842() as ByteArray;
        var _loc2_: XML = new XML(_loc1_.readUTFBytes(_loc1_.length));
        var _loc3_: * = {};
        for each(_loc4_ in _loc2_.change_quests_portraits) {
            _loc5_ = {};
            for each(_loc6_ in _loc4_.portrait) {
                _loc5_[String(_loc6_.@faction)] = String(_loc6_.text());
            }
            _loc7_ = new Vector.<int>();
            for each(_loc8_ in _loc4_.affected_quests.quest) {
                _loc7_.push(int(_loc8_.@id));
            }
            _loc3_[String(_loc4_.@id)] = {
                "portraits": _loc5_,
                "affectedQuests": _loc7_
            };
        }
        return _loc3_;
    }

    public function get method_1221(): Array {
        return this.var_2866;
    }

    public function get method_3731(): Array {
        return this.var_2153;
    }

    public function get method_1789(): Array {
        return this.var_890;
    }

    public function get method_6484(): Array {
        return this.var_909;
    }

    public function get method_3780(): Array {
        return this.var_1941;
    }

    public function get method_1158(): Array {
        return this.var_4161;
    }

    public function get method_2919(): Array {
        return this.var_4069;
    }

    public function get method_6115(): Array {
        return this.var_4722;
    }

    public function get method_1595(): Array {
        return this.var_3292;
    }

    public function get method_6283(): Array {
        return this.var_680;
    }

    public function get method_3582(): Array {
        return this.var_4951;
    }

    public function get method_758(): Array {
        return this.var_1750;
    }

    public function get method_2227(): Array {
        return this.var_4425;
    }

    public function get method_4980(): Array {
        return this.var_1218;
    }

    public function get method_1709(): Array {
        return this.var_4593;
    }

    public function get method_2008(): Array {
        var _loc1_: * = [];
        var _loc2_: int = 0;
        while (_loc2_ < 10) {
            _loc1_.push(class_88.getItem("company_hierarchy_rank_position_" + _loc2_));
            _loc2_++;
        }
        return _loc1_;
    }

    public function get method_437(): Array {
        return this.var_406;
    }

    public function get method_2276(): Array {
        return this.var_368;
    }

    public function get method_2351(): Dictionary {
        return this.var_3486;
    }

    public function get method_2318(): Array {
        return this.var_4926;
    }

    public function get method_3229(): Array {
        return this.var_5002;
    }

    public function method_3088(param1: String = "default"): void {
        if (true) {
            param1 = "default";
        }
        if (this.var_4180 != param1) {
            this.var_4180 = param1;
            this.const_1548.dispatch();
        }
    }

    public function method_2408(param1: int = 0): String {
        var _loc2_: Object = const_812[this.var_4180];
        if (param1 == 0 || _loc2_.affectedQuests.length == 0 || _loc2_.affectedQuests.indexOf(param1) != -1) {
            return _loc2_.portraits[class_81.method_2322];
        }
        return const_812["default"].portraits[class_81.method_2322];
    }

    public function method_3327(param1: int): String {
        return "questfm_" + this.method_2408(param1);
    }

    public function method_371(param1: int): String {
        return this.var_3063[param1];
    }

    public function method_1265(param1: int): String {
        return this.var_4083[param1];
    }

    public function method_4856(param1: int): String {
        var _loc2_: String = this.var_778[param1];
        return !!_loc2_ ? _loc2_ : "?";
    }

    public function method_535(param1: int): String {
        var _loc2_: String = this.var_1395[param1];
        return !!_loc2_ ? _loc2_ : "?";
    }

    public function method_402(param1: int): uint {
        return !!this.var_3584[param1] ? uint(this.var_3584[param1]) : 0;
    }

    public function method_2994(param1: uint): uint {
        return !!this.var_3538[param1] ? uint(this.var_3538[param1]) : uint(VideoElement.const_1684);
    }

    public function method_6272(param1: int): String {
        return !!this.var_2903[param1] ? this.var_2903[param1] : "-";
    }

    public function method_3790(param1: String): uint {
        return uint(this.var_1495[param1]) || true;
    }

    public function method_2829(param1: String): String {
        return this.var_2157[param1] || param1;
    }

    private function method_5338(): void {
        this.var_1044[class_435.const_1501] = "log_msg_traininggrounds_usage_forbidden_feature";
        this.var_1044[class_435.const_3033] = "label_traininggrounds_not_available_maintenance";
        this.var_1044[class_435.const_1810] = "label_traininggrounds_not_available_prepare_jpa";
    }

    private function method_5138(): void {
        this.var_3943[class_437.const_1750] = " YOU WIN ";
        this.var_3943[class_437.const_131] = " YOU LOSE ";
        this.var_3943[class_437.const_474] = " DRAW ";
        this.var_3943[class_437.const_616] = " FINAL ROUND ";
        this.var_3943[class_437.const_1387] = " FIGHT! ";
        this.var_3943[class_437.const_967] = " DOUBLE KO ";
        this.var_3943[class_437.const_3306] = " ROUND OVER ";
        this.var_51[class_444.const_89] = " ROUND %NUMBER% ";
        this.var_51[class_444.const_2272] = " %NUMBER% ";
        this.var_51[class_444.const_1686] = " ROUND ENDS IN %NUMBER% SECONDS ";
        this.var_51[class_444.const_2222] = " ROUND ENDS IN %NUMBER% MINUTES ";
    }

    private function method_5241(): void {
        this.var_4926[class_445.const_2477] = "mapasset_company_hq_home";
        this.var_4926[class_445.const_1965] = "mapasset_company_hq_outpost";
        this.var_4926[class_445.const_1178] = "mapasset_questgiver";
        this.var_4926[class_445.const_2838] = "mapasset_asteroid";
        this.var_4926[class_445.const_942] = "mapasset_battlestation";
        this.var_4926[class_445.const_603] = "mapasset_hangar_home";
        this.var_4926[class_445.const_784] = "mapasset_hangar_outpost";
        this.var_4926[class_445.const_2448] = "mapasset_instant_repair_home";
        this.var_4926[class_445.const_1208] = "mapasset_instant_repair_outpost";
        this.var_4926[class_445.const_3031] = "mapasset_ore_trade_home";
        this.var_4926[class_445.const_229] = "mapasset_ore_trade_outpost";
        this.var_4926[class_445.const_3199] = "mapasset_tdm_beacon";
        this.var_4926[class_445.const_715] = "mapasset_sector_control_beacon";
        this.var_4926[class_445.const_3251] = "mapasset_billbord";
    }

    private function method_2028(): void {
        this.var_5002["resource_ore_terbium"] = "ore_3.png";
        this.var_5002["resource_ore_prometium"] = "ore_1.png";
        this.var_5002["resource_ore_palladium"] = "ore_15.png";
        this.var_5002["resource_ore_endurium"] = "ore_2.png";
    }

    private function method_2928(): void {
        this.var_3486 = new Dictionary();
        this.var_3486[class_430.const_106] = "msg_grp_inv_err_group_full";
        this.var_3486[class_430.const_1242] = "msg_grp_inv_err_candidate_in_group";
        this.var_3486[class_430.const_1836] = "msg_grp_inv_err_candidate_nonexistant";
        this.var_3486[class_430.const_1366] = "msg_grp_inv_err_inviter_nonexistant";
        this.var_3486[class_430.const_512] = "msg_grp_inv_err_no_invitation";
        this.var_3486[class_430.const_145] = "msg_grp_inv_err_boss_only";
        this.var_3486[class_430.const_2143] = "msg_grp_inv_err_max_invitations_inviter";
        this.var_3486[class_430.const_907] = "msg_grp_inv_err_max_invitations_candidate";
        this.var_3486[class_430.const_2330] = "msg_grp_inv_err_candidate_blocking";
        this.var_3486[class_430.const_609] = "msg_grp_inv_err_duplicate_invitation";
    }

    private function method_97(): void {
        this.var_3538 = [];
        this.var_3538[class_440.const_2913] = VideoElement.const_1684;
        this.var_3538[class_440.const_352] = VideoElement.const_2648;
    }

    private function method_6178(): void {
        this.var_3584 = [];
        this.var_3584[class_428.const_2825] = 4294967040;
        this.var_3584[class_428.const_156] = 4294901760;
        this.var_3584[class_428.const_1016] = 4278255360;
        this.var_2903 = [];
        this.var_2903[class_428.const_2825] = "ttip_raidGateStatusBG_diff";
        this.var_2903[class_428.const_156] = "ttip_raidGateStatusBG_hero_no_gate";
        this.var_2903[class_428.const_1016] = "ttip_raidGateStatusBG_same";
    }

    private function method_869(): void {
        this.var_1524 = ["¿", "1-1", "1-2", "1-3", "1-4", "2-1", "2-2", "2-3", "2-4", "3-1", "3-2", "3-3", "3-4", "4-1", "4-2", "4-3", "4-4", "1-5", "1-6", "1-7", "1-8", "2-5", "2-6", "2-7", "2-8", "3-5", "3-6", "3-7", "3-8", "4-5"];
        this.var_1524[42] = "???";
        this.var_1524[50] = "GG";
        this.var_1524[51] = "GG " + String.fromCharCode(945);
        this.var_1524[52] = "GG " + String.fromCharCode(946);
        this.var_1524[53] = "GG " + String.fromCharCode(947);
        this.var_1524[54] = "GG NC";
        this.var_1524[55] = "GG " + String.fromCharCode(948);
        this.var_1524[56] = "GG Orb";
        this.var_1524[57] = "GG Y6";
        this.var_1524[58] = "HSG";
        this.var_1524[70] = "GG " + String.fromCharCode(949);
        this.var_1524[71] = "GG " + String.fromCharCode(950) + " 1";
        this.var_1524[72] = "GG " + String.fromCharCode(950) + " 2";
        this.var_1524[73] = "GG " + String.fromCharCode(950) + " 3";
        this.var_1524[74] = "GG " + String.fromCharCode(954);
        this.var_1524[75] = "GG " + String.fromCharCode(955);
        this.var_1524[76] = "GG Kronos";
        this.var_1524[77] = "GG Cold Wave (Easy)";
        this.var_1524[78] = "GG Cold Wave (Hard)";
        this.var_1524[61] = "MMO Invasion";
        this.var_1524[62] = "EIC Invasion";
        this.var_1524[63] = "VRU Invasion";
        this.var_1524[64] = "MMO Invasion";
        this.var_1524[65] = "EIC Invasion";
        this.var_1524[66] = "VRU Invasion";
        this.var_1524[67] = "MMO Invasion";
        this.var_1524[68] = "EIC Invasion";
        this.var_1524[69] = "VRU Invasion";
        this.var_1524[81] = "TDM I";
        this.var_1524[82] = "TDM II";
        this.var_1524[91] = "5-1";
        this.var_1524[92] = "5-2";
        this.var_1524[93] = "5-3";
        this.var_1524[101] = const_1890;
        this.var_1524[102] = const_1890;
        this.var_1524[103] = const_1890;
        this.var_1524[104] = const_1890;
        this.var_1524[105] = const_1890;
        this.var_1524[106] = const_1890;
        this.var_1524[107] = const_1890;
        this.var_1524[108] = const_1890;
        this.var_1524[109] = const_1890;
        this.var_1524[110] = const_1890;
        this.var_1524[111] = const_1890;
        this.var_1524[112] = const_3047;
        this.var_1524[113] = const_3047;
        this.var_1524[114] = const_3047;
        this.var_1524[115] = const_3047;
        this.var_1524[116] = const_3047;
        this.var_1524[117] = const_3047;
        this.var_1524[118] = const_3047;
        this.var_1524[119] = const_3047;
        this.var_1524[120] = const_3047;
        this.var_1524[121] = const_3047;
        this.var_1524[122] = const_1890;
        this.var_1524[123] = const_1890;
        this.var_1524[124] = const_1890;
        this.var_1524[125] = const_1890;
        this.var_1524[126] = const_1890;
        this.var_1524[200] = "LoW";
        this.var_1524[201] = "SC-1";
        this.var_1524[202] = "SC-2";
        this.var_1524[203] = "GG Hades";
        this.var_1524[223] = "Devolarium Attack";
        this.var_1524[224] = "Custom Tournament";
        this.var_1524[-1] = "Invasion";
    }

    private function method_4170(): void {
        this.var_1395 = ["¿", "1-1 - " + this.var_4069[1], "1-2 - " + this.var_4069[1], "1-3 - " + this.var_4069[1], "1-4 - " + this.var_4069[1], "2-1 - " + this.var_4069[2], "2-2 - " + this.var_4069[2], "2-3 - " + this.var_4069[2], "2-4 - " + this.var_4069[2], "3-1 - " + this.var_4069[3], "3-2 - " + this.var_4069[3], "3-3 - " + this.var_4069[3], "3-4 - " + this.var_4069[3], "4-1 - " + PVP, "4-2 - " + PVP, "4-3 - " + PVP, "4-4 - " + PVP, "1-5 - " + this.var_4069[1], "1-6 - " + this.var_4069[1], "1-7 - " + this.var_4069[1], "1-8 - " + this.var_4069[1], "2-5 - " + this.var_4069[2], "2-6 - " + this.var_4069[2], "2-7 - " + this.var_4069[2], "2-8 - " + this.var_4069[2], "3-5 - " + this.var_4069[3], "3-6 - " + this.var_4069[3], "3-7 - " + this.var_4069[3], "3-8 - " + this.var_4069[3], "4-5 - " + UBER];
        this.var_1395[42] = "???";
        this.var_1395[50] = GALAXY_GATE;
        this.var_1395[51] = GALAXY_GATE + String.fromCharCode(945);
        this.var_1395[52] = GALAXY_GATE + String.fromCharCode(946);
        this.var_1395[53] = GALAXY_GATE + String.fromCharCode(947);
        this.var_1395[54] = GALAXY_GATE + " NC";
        this.var_1395[55] = GALAXY_GATE + String.fromCharCode(948);
        this.var_1395[56] = GALAXY_GATE + " Orb";
        this.var_1395[57] = GALAXY_GATE + " Y6";
        this.var_1395[58] = "HSG";
        this.var_1395[70] = GALAXY_GATE + String.fromCharCode(949);
        this.var_1395[71] = GALAXY_GATE + String.fromCharCode(950) + " 1";
        this.var_1395[72] = GALAXY_GATE + String.fromCharCode(950) + " 2";
        this.var_1395[73] = GALAXY_GATE + String.fromCharCode(950) + " 3";
        this.var_1395[74] = GALAXY_GATE + String.fromCharCode(954);
        this.var_1395[75] = GALAXY_GATE + String.fromCharCode(955);
        this.var_1395[76] = GALAXY_GATE + " Kronos";
        this.var_1395[77] = GALAXY_GATE + "Cold Wave (Easy)";
        this.var_1395[78] = GALAXY_GATE + "Cold Wave (Hard)";
        this.var_1395[61] = "MMO Invasion";
        this.var_1395[62] = "EIC Invasion";
        this.var_1395[63] = "VRU Invasion";
        this.var_1395[64] = "MMO Invasion";
        this.var_1395[65] = "EIC Invasion";
        this.var_1395[66] = "VRU Invasion";
        this.var_1395[67] = "MMO Invasion";
        this.var_1395[68] = "EIC Invasion";
        this.var_1395[69] = "VRU Invasion";
        this.var_1395[81] = "TDM I";
        this.var_1395[82] = "TDM II";
        this.var_1395[91] = "5-1 " + const_463;
        this.var_1395[92] = "5-2 " + const_463;
        this.var_1395[93] = "5-3 " + const_463;
        this.var_1395[101] = const_1890;
        this.var_1395[102] = const_1890;
        this.var_1395[103] = const_1890;
        this.var_1395[104] = const_1890;
        this.var_1395[105] = const_1890;
        this.var_1395[106] = const_1890;
        this.var_1395[107] = const_1890;
        this.var_1395[108] = const_1890;
        this.var_1395[109] = const_1890;
        this.var_1395[110] = const_1890;
        this.var_1395[111] = const_1890;
        this.var_1395[112] = const_3047;
        this.var_1395[113] = const_3047;
        this.var_1395[114] = const_3047;
        this.var_1395[115] = const_3047;
        this.var_1395[116] = const_3047;
        this.var_1395[117] = const_3047;
        this.var_1395[118] = const_3047;
        this.var_1395[119] = const_3047;
        this.var_1395[120] = const_3047;
        this.var_1395[121] = const_3047;
        this.var_1395[122] = const_1890;
        this.var_1395[123] = const_1890;
        this.var_1395[124] = const_1890;
        this.var_1395[125] = const_1890;
        this.var_1395[126] = const_1890;
        this.var_1395[200] = "LoW";
        this.var_1395[201] = "SC-1";
        this.var_1395[202] = "SC-2";
        this.var_1395[203] = "Hades Gate";
        this.var_1395[223] = "GG Starter Gate";
        this.var_1395[224] = "Custom Tournament";
    }

    private function method_4802(): void {
        this.var_778 = ["¿", "1-1", "1-2", "1-3", "1-4", "2-1", "2-2", "2-3", "2-4", "3-1", "3-2", "3-3", "3-4", "4-1", "4-2", "4-3", "4-4", "1-5", "1-6", "1-7", "1-8", "2-5", "2-6", "2-7", "2-8", "3-5", "3-6", "3-7", "3-8", "4-5"];
        this.var_778[42] = "???";
        this.var_778[50] = "GG";
        this.var_778[51] = "GG";
        this.var_778[52] = "GG";
        this.var_778[53] = "GG";
        this.var_778[54] = "GG";
        this.var_778[55] = "GG";
        this.var_778[56] = "GG";
        this.var_778[57] = "GG";
        this.var_778[58] = "HSG";
        this.var_778[70] = "GG";
        this.var_778[71] = "GG";
        this.var_778[72] = "GG";
        this.var_778[73] = "GG";
        this.var_778[74] = "GG";
        this.var_778[75] = "GG";
        this.var_778[76] = "GG";
        this.var_778[77] = "GG";
        this.var_778[78] = "GG";
        this.var_778[61] = "MMO Invasion";
        this.var_778[62] = "EIC Invasion";
        this.var_778[63] = "VRU Invasion";
        this.var_778[64] = "MMO Invasion";
        this.var_778[65] = "EIC Invasion";
        this.var_778[66] = "VRU Invasion";
        this.var_778[67] = "MMO Invasion";
        this.var_778[68] = "EIC Invasion";
        this.var_778[69] = "VRU Invasion";
        this.var_778[81] = "TDM";
        this.var_778[82] = "TDM";
        this.var_778[91] = "5-1";
        this.var_778[92] = "5-2";
        this.var_778[93] = "5-3";
        this.var_778[101] = const_1890;
        this.var_778[102] = const_1890;
        this.var_778[103] = const_1890;
        this.var_778[104] = const_1890;
        this.var_778[105] = const_1890;
        this.var_778[106] = const_1890;
        this.var_778[107] = const_1890;
        this.var_778[108] = const_1890;
        this.var_778[109] = const_1890;
        this.var_778[110] = const_1890;
        this.var_778[111] = const_1890;
        this.var_778[112] = const_1890;
        this.var_778[113] = const_1890;
        this.var_778[114] = const_1890;
        this.var_778[115] = const_1890;
        this.var_778[116] = const_1890;
        this.var_778[117] = const_1890;
        this.var_778[118] = const_1890;
        this.var_778[119] = const_1890;
        this.var_778[120] = const_1890;
        this.var_778[121] = const_1890;
        this.var_778[122] = const_1890;
        this.var_778[123] = const_1890;
        this.var_778[124] = const_1890;
        this.var_778[125] = const_1890;
        this.var_778[126] = const_1890;
        this.var_778[200] = "LoW";
        this.var_778[201] = "SC-1";
        this.var_778[202] = "SC-2";
        this.var_778[203] = "HG";
        this.var_778[223] = "SG";
        this.var_778[224] = "C-T";
    }

    private function method_2842(): void {
        this.var_406 = [];
        this.var_406[class_433.NONE] = "iconShipNull";
        this.var_406[class_433.DEFAULT] = "iconShip0";
        this.var_406[class_433.const_2769] = "iconShip1";
        this.var_406[class_433.const_2400] = "iconShip2";
        this.var_406[class_433.const_3002] = "iconShip3";
        this.var_406[class_433.const_3226] = "iconShip4";
        this.var_406[class_433.LIBERATOR] = "iconShip5";
        this.var_406[class_433.const_1030] = "iconShip6";
        this.var_406[class_433.const_3179] = "iconShip7";
        this.var_406[class_433.const_3201] = "iconShip8";
        this.var_406[class_433.const_1189] = "iconShip9";
        this.var_406[class_433.const_419] = "iconShip10";
        this.var_406[class_433.const_3232] = "iconShip11";
        this.var_406[class_433.AEGIS] = "iconShip49";
        this.var_406[class_433.CITADEL] = "iconShip69";
        this.var_406[class_433.SPEARHEAD] = "iconShip70";
        this.var_406[class_433.const_878] = "iconShip71";
        this.var_406[class_433.const_2165] = "iconShip72";
        this.var_406[class_433.const_1922] = "iconShip73";
        this.var_406[class_433.const_668] = "iconShip74";
        this.var_406[class_433.const_2700] = "iconShip75";
        this.var_406[class_433.const_3020] = "iconShip76";
        this.var_406[class_433.const_49] = "iconShip77";
        this.var_406[class_433.const_2181] = "iconShip78";
        this.var_406[class_433.const_1550] = "iconShip79";
        this.var_406[class_433.const_2717] = "iconShip80";
        this.var_406[class_433.const_3125] = "iconShip81";
        this.var_406[class_433.const_3070] = "iconShip82";
        this.var_406[class_433.const_783] = "iconShip90";
        this.var_406[class_433.const_3005] = "iconShip91";
        this.var_406[class_433.const_245] = "iconShip93";
        this.var_406[class_433.const_2948] = "iconShip98";
        this.var_406[class_433.const_2642] = "iconShip99";
        this.var_406[class_433.const_928] = "iconShip100";
        this.var_406[class_433.const_1203] = "iconShip101";
        this.var_406[class_433.const_992] = "iconShip102";
        this.var_406[class_433.const_1605] = "iconShip104";
        this.var_406[class_433.const_3030] = "iconShip105";
        this.var_406[class_433.const_3156] = "iconShip111";
        this.var_406[class_433.const_1140] = "iconShip_EmperorSibelon";
        this.var_406[class_433.const_710] = "iconShip_EmperorLordakium";
        this.var_406[class_433.const_2941] = "iconShip_EmperorKristallon";
        this.var_406[class_433.const_1931] = "iconShip_PlagueMinion";
        this.var_406[class_433.const_1273] = "iconShip_PlagueBoss";
        this.var_406[class_433.CORSAIR] = this.var_406[class_433.const_3201];
        this.var_406[class_433.const_1454] = this.var_406[class_433.const_928];
        this.var_406[class_433.const_624] = this.var_406[class_433.const_2642];
        this.var_406[class_433.const_55] = this.var_406[class_433.const_3156];
        this.var_406[class_433.ADEPT] = this.var_406[class_433.const_3201];
        this.var_406[class_433.LIGHTNING] = this.var_406[class_433.const_3201];
        this.var_406[class_433.const_2441] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_750] = this.var_406[class_433.const_3002];
        this.var_406[class_433.const_1999] = this.var_406[class_433.const_1189];
        this.var_406[class_433.const_987] = this.var_406[class_433.const_1189];
        this.var_406[class_433.const_392] = this.var_406[class_433.const_1189];
        this.var_406[class_433.const_135] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_33] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_770] = this.var_406[class_433.const_419];
        this.var_406[class_433.ENFORCER] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_254] = this.var_406[class_433.const_419];
        this.var_406[class_433.REVENGE] = this.var_406[class_433.const_3201];
        this.var_406[class_433.BASTION] = this.var_406[class_433.const_419];
        this.var_406[class_433.AVENGER] = this.var_406[class_433.const_3201];
        this.var_406[class_433.VETERAN] = this.var_406[class_433.const_419];
        this.var_406[class_433.EXALTED] = this.var_406[class_433.const_419];
        this.var_406[class_433.SOLACE] = this.var_406[class_433.const_419];
        this.var_406[class_433.DIMINISHER] = this.var_406[class_433.const_419];
        this.var_406[class_433.SPECTRUM] = this.var_406[class_433.const_419];
        this.var_406[class_433.SENTINEL] = this.var_406[class_433.const_419];
        this.var_406[class_433.VENOM] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_1660] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_2786] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_772] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1477] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_3172] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_1816] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_1870] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_109] = this.var_406[class_433.const_419];
        this.var_406[class_433.SATURN] = this.var_406[class_433.const_419];
        this.var_406[class_433.CENTAUR] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_2411] = this.var_406[class_433.const_2400];
        this.var_406[class_433.StreuneR] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_2150] = this.var_406[class_433.const_2717];
        this.var_406[class_433.const_1514] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_2783] = this.var_406[class_433.const_878];
        this.var_406[class_433.const_103] = this.var_406[class_433.const_1922];
        this.var_406[class_433.const_2474] = this.var_406[class_433.const_668];
        this.var_406[class_433.const_3016] = this.var_406[class_433.const_2165];
        this.var_406[class_433.const_1409] = this.var_406[class_433.const_3020];
        this.var_406[class_433.const_2800] = this.var_406[class_433.const_668];
        this.var_406[class_433.const_423] = this.var_406[class_433.const_49];
        this.var_406[class_433.const_614] = this.var_406[class_433.const_2181];
        this.var_406[class_433.const_1362] = this.var_406[class_433.const_1550];
        this.var_406[class_433.const_1061] = this.var_406[class_433.const_2400];
        this.var_406[class_433.UFONIT] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.UFO] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_405] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_2116] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_2405] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_389] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1128] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1720] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_791] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1532] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_323] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1162] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_3235] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_2420] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_1613] = this.var_406[class_433.const_3070];
        this.var_406[class_433.const_2609] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1703] = this.var_406[class_433.const_3005];
        this.var_406[class_433.const_2028] = this.var_406[class_433.const_3005];
        this.var_406[class_433.const_3091] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1088] = this.var_406[class_433.const_2717];
        this.var_406[class_433.const_568] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_875] = this.var_406[class_433.const_1203];
        this.var_406[class_433.const_1372] = this.var_406[class_433.const_3156];
        this.var_406[class_433.const_1043] = this.var_406[class_433.const_3156];
        this.var_406[class_433.const_657] = this.var_406[class_433.const_3156];
        this.var_406[class_433.const_2064] = this.var_406[class_433.const_3156];
        this.var_406[class_433.const_720] = this.var_406[class_433.const_2609];
        this.var_406[class_433.const_299] = this.var_406[class_433.const_245];
        this.var_406[class_433.const_1164] = this.var_406[class_433.const_783];
        this.var_406[class_433.const_1317] = this.var_406[class_433.CORSAIR];
        this.var_406[class_433.const_286] = this.var_406[class_433.const_3005];
        this.var_406[class_433.const_3229] = this.var_406[class_433.const_1703];
        this.var_406[class_433.const_933] = this.var_406[class_433.const_2028];
        this.var_406[class_433.const_291] = this.var_406[class_433.const_1605];
        this.var_406[class_433.const_696] = this.var_406[class_433.const_1605];
        this.var_406[class_433.const_2665] = this.var_406[class_433.const_1605];
        this.var_406[class_433.const_3310] = this.var_406[class_433.const_2769];
        this.var_406[class_433.const_1542] = this.var_406[class_433.const_2400];
        this.var_406[class_433.const_499] = this.var_406[class_433.const_3226];
        this.var_406[class_433.const_158] = this.var_406[class_433.LIBERATOR];
        this.var_406[class_433.const_2144] = this.var_406[class_433.const_3179];
        this.var_406[class_433.const_2476] = this.var_406[class_433.const_1030];
        this.var_406[class_433.const_186] = this.var_406[class_433.const_1189];
        this.var_406[class_433.const_644] = this.var_406[class_433.const_3201];
        this.var_406[class_433.const_2278] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_1914] = this.var_406[class_433.const_3002];
        this.var_406[class_433.const_3064] = this.var_406[class_433.VENOM];
        this.var_406[class_433.const_2429] = this.var_406[class_433.SENTINEL];
        this.var_406[class_433.const_2883] = this.var_406[class_433.SPECTRUM];
        this.var_406[class_433.const_14] = this.var_406[class_433.DIMINISHER];
        this.var_406[class_433.const_164] = this.var_406[class_433.SOLACE];
        this.var_406[class_433.const_2086] = this.var_406[class_433.REVENGE];
        this.var_406[class_433.const_3266] = this.var_406[class_433.LIGHTNING];
        this.var_406[class_433.const_2785] = this.var_406[class_433.AVENGER];
        this.var_406[class_433.const_1352] = this.var_406[class_433.BASTION];
        this.var_406[class_433.const_1006] = this.var_406[class_433.ENFORCER];
        this.var_406[class_433.const_985] = this.var_406[class_433.SPEARHEAD];
        this.var_406[class_433.const_1424] = this.var_406[class_433.CITADEL];
        this.var_406[class_433.const_1217] = this.var_406[class_433.AEGIS];
        this.var_406[class_433.const_2744] = this.var_406[class_433.const_33];
        this.var_406[class_433.const_1422] = this.var_406[class_433.const_2441];
        this.var_406[class_433.const_3212] = this.var_406[class_433.const_770];
        this.var_406[class_433.const_293] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_50] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1993] = this.var_406[class_433.const_55];
        this.var_406[class_433.const_1196] = this.var_406[class_433.const_1922];
        this.var_406[class_433.const_2187] = this.var_406[class_433.const_49];
        this.var_406[class_433.const_1497] = this.var_406[class_433.const_49];
        this.var_406[class_433.const_2838] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_656] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_2461] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_3251] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1608] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_2034] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.PET] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1759] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1790] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.WRECK] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_2100] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1721] = this.var_406[class_433.DEFAULT];
        this.var_406[class_433.const_1005] = this.var_406[class_433.SPEARHEAD];
        this.var_406[class_433.const_2468] = this.var_406[class_433.AEGIS];
        this.var_406[class_433.const_2770] = this.var_406[class_433.CITADEL];
        this.var_406[class_433.const_2204] = this.var_406[class_433.SPEARHEAD];
        this.var_406[class_433.const_2998] = this.var_406[class_433.AEGIS];
        this.var_406[class_433.const_1654] = this.var_406[class_433.CITADEL];
        this.var_406[class_433.const_157] = this.var_406[class_433.const_3179];
        this.var_406[class_433.const_111] = this.var_406[class_433.const_3179];
        this.var_406[class_433.const_2990] = this.var_406[class_433.const_3179];
        this.var_406[class_433.const_1558] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_518] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_958] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_1640] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_319] = this.var_406[class_433.const_3179];
        this.var_406[class_433.const_236] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_853] = this.var_406[class_433.const_3201];
        this.var_406[class_433.const_2678] = this.var_406[class_433.const_668];
        this.var_406[class_433.const_5] = this.var_406[class_433.const_1203];
        this.var_406[class_433.GOLD] = this.var_406[class_433.const_419];
        this.var_406[class_433.SILVER] = this.var_406[class_433.const_419];
        this.var_406[class_433.BRONZE] = this.var_406[class_433.const_419];
        this.var_406[class_433.const_578] = this.var_406[class_433.const_419];
    }
}
}
