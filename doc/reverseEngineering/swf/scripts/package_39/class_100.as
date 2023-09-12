package package_39 {

import com.bigpoint.utils.class_122;
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.net.class_59;
import net.bigpoint.darkorbit.settings.Settings;

import package_122.class_340;
import package_122.class_341;

import package_123.class_342;
import package_123.class_343;

import package_124.class_344;

import package_14.class_52;

import package_38.class_345;
import package_38.class_346;
import package_38.class_347;

import package_9.class_50;

import package_99.class_266;

public final class class_100 implements class_52 {

    public static const const_682: int = 0;

    public static const const_1245: int = 1;

    public static const RADIATION: int = 2;

    public static const MINE: int = 3;

    public static const const_57: int = 4;

    private static var _instance: class_100 = new class_100();

    private static const const_2896: Dictionary = new Dictionary();

    {
        const_2896[const_682] = "head_killscreen_destroyer_player";
        const_2896[const_1245] = "head_killscreen_destroyer_npc";
        const_2896[RADIATION] = "head_killscreen_destroyer_radiation_zone";
        const_2896[MINE] = "head_killscreen_destroyer_mine";
        const_2896[const_57] = "head_killscreen_destroyer_unknown";
    }

    private var var_3624: class_342;

    private var var_2638: int;

    private var guiManager: class_58;

    private var var_574: class_9;

    private var var_1104: Sprite;

    private var var_4329: Dictionary;

    private var var_4026: int;

    private var var_4533: Array;

    private var var_1086: Vector.<class_340>;

    private var var_2057: Boolean = false;

    private var var_1864: String;

    private var var_4996: String;

    private var var_827: Timer;

    private var _tpf: Number = 0;

    public function class_100() {
        this.var_4329 = new Dictionary();
        super();
        if (_instance) {
            throw new Error("Singleton and can only access with Singleton.getInstance()");
        }
    }

    public static function getInstance(): class_100 {
        return _instance;
    }

    private function method_1376(): void {
        this.method_2279();
        this.var_3624 = new class_342(this.var_1086);
        this.method_4660("btn_killscreen_default", 0);
        this.method_2057();
    }

    private function method_2279(): void {
        this.var_1086 = new Vector.<class_340>(10, true);
        this.var_1086[class_345.const_1445] = new class_340("icon_freeRepair", "ttip_killscreen_basic_repair", class_18.const_1319, "", "");
        this.var_1086[class_345.const_1510] = new class_340("icon_freeRepair", "ttip_killscreen_basic_repair", class_18.const_1319, "", "");
        this.var_1086[class_345.const_1505] = new class_340("icon_gate", "ttip_killscreen_repair_jumpgate", class_18.const_3252, "", "");
        this.var_1086[class_345.const_598] = new class_340("icon_location", "ttip_killscreen_repair_location", class_18.const_3252, "", "");
        this.var_1086[class_345.const_2655] = new class_340("icon_spawnPoint", "ttip_killscreen_repair_spawnpoint", class_18.const_1319, "", "");
        this.var_1086[class_345.const_263] = new class_340("icon_freeRepair", "ttip_killscreen_basic_repair", class_18.const_1319, "", "");
        this.var_1086[class_345.const_347] = new class_340("icon_freeRepair", "ttip_killscreen_basic_repair", class_18.const_1319, "", "");
        this.var_1086[class_345.const_2251] = new class_340("icon_spawnPoint", "ttip_killscreen_repair_hadesgate", class_18.const_1319, "", "");
        this.var_1086[class_345.const_667] = new class_340("icon_spawnPoint", "ttip_killscreen_repair_tdm", class_18.const_1319, "", "");
        this.var_1086[class_345.const_3192] = new class_340("icon_payment", "ttip_killscreen_linkTo_payment", class_18.const_302, "", "");
    }

    private function method_1177(param1: class_343): void {
        var _loc2_: * = null;
        switch (this.var_2638) {
            case class_345.const_1445:
                this.method_5844();
                this.logout(param1);
                break;
            case class_345.const_3192:
                this.method_1396();
                this.logout(param1);
                break;
            case class_345.const_1510:
            case class_345.const_1505:
            case class_345.const_598:
            case class_345.const_2655:
            case class_345.const_2251:
            case class_345.const_667:
            default:
                Settings.nextMapID = this.var_4329[this.var_4026];
                _loc2_ = new class_347();
                _loc2_.selection.var_1785 = this.var_2638;
                _loc2_.var_2890.userID = class_81.userID;
                _loc2_.var_2890.sessionID = class_81.sessionID;
                _loc2_.var_2890.factionID = class_81.factionID;
                Settings.lastMapID = -1;
                this.var_574.method_6154().sendRequest(_loc2_);
        }
        this.cleanup();
    }

    private function method_5844(): void {
        class_59.referToURL("internalDock", "seo_tittle_ships", "internalDockShips");
    }

    private function method_948(param1: class_343): void {
        var _loc2_: String = this.var_4996 + "/?lang=" + Settings.language;
        class_59.call(class_59.const_1998, [Settings.dynamicHost + _loc2_, true]);
    }

    private function method_1396(): void {
        class_59.referToURL("internalPayment", "seo_tittle_uridium");
    }

    private function logout(param1: class_343): void {
        this.guiManager.method_4593();
    }

    private function setSelected(param1: class_343): void {
        this.var_2638 = param1.var_702;
        if (Boolean(this.var_1086[this.var_2638].method_5478) || !this.method_3299(this.var_1086[this.var_2638])) {
            this.method_4660(this.var_1086[this.var_2638].name_29, this.var_1086[this.var_2638].method_4246, this.var_1086[this.var_2638].currency);
        } else {
            this.var_3624.method_2190();
        }
        this.var_3624.method_5164(this.var_1086[this.var_2638].method_3245.replace(/%COUNTDOWN%/, "<font color=\'#FF0000\' size=\'+6\'>" + this.var_1086[this.var_2638].cooldown + "</font>"));
    }

    private function method_3299(param1: class_340): Boolean {
        return param1.currency == class_344.method_4307(class_346.CREDITS);
    }

    private function method_48(param1: String, param2: int): String {
        if (param1.length <= param2) {
            return param1;
        }
        return param1.substring(0, param2) + "...";
    }

    private function method_2057(): void {
        this.var_3624.addEventListener(class_343.SET_SELECTED, this.setSelected);
        this.var_3624.addEventListener(class_343.LOGOUT, this.logout);
        this.var_3624.addEventListener(class_343.REPAIR, this.method_1177);
        this.var_3624.addEventListener(class_343.OPEN_PROFILE_PAGE, this.method_948);
        this.var_3624.method_5813();
    }

    private function method_2240(param1: TimerEvent): void {
        this.var_827.stop();
        this.var_827.reset();
        this.var_827.removeEventListener(TimerEvent.TIMER, this.method_2240);
        this.var_3624.alpha = 0;
        this.var_2057 = true;
        if (!this.var_574.name_47.method_6313().contains(this.var_3624)) {
            this.var_574.name_47.method_6313().addChild(this.var_3624);
        }
        this.method_3556();
        TweenLite.to(this.var_3624, 1, {"alpha": 1});
    }

    public function method_3556(): void {
        if (this.var_3624) {
            this.var_3624.x = class_50.method_1849() - (Number(this.var_3624.width) >> 1);
            this.var_3624.y = class_50.method_5866() - (Number(this.var_3624.height) >> 1);
        }
    }

    public function method_5056(param1: class_9, param2: String, param3: String = "", param4: String = ""): void {
        this.var_4533 = [];
        this.method_1376();
        this.var_574 = param1;
        this.setTitle(param2);
        this.var_1864 = param3;
        this.var_4996 = param4;
        this.guiManager = param1.method_4489();
        if (this.var_574.name_47.map) {
            if (this.var_1104 != null && Boolean(this.var_1104.parent)) {
                this.var_1104.parent.removeChild(this.var_1104);
            }
            this.var_1104 = new Sprite();
            this.var_1104.graphics.beginFill(4278190080);
            this.var_1104.graphics.drawRect(0, 0, class_50.method_6533(), class_50.method_1269());
            this.var_1104.alpha = 0;
            TweenLite.to(this.var_1104, 6, {"alpha": 0.85});
            this.var_574.name_47.method_6313().addChild(this.var_1104);
        }
        if (this.var_574.name_47.map) {
            this.var_827 = new Timer(4000, 1);
        } else {
            this.var_827 = new Timer(20, 1);
        }
        this.var_827.addEventListener(TimerEvent.TIMER, this.method_2240);
        this.var_827.start();
    }

    public function method_4332(): void {
        if (this.var_3624) {
            if (Boolean(this.var_827) && Boolean(this.var_827.running)) {
                this.method_2240(new TimerEvent(TimerEvent.TIMER));
            }
            if (class_50.getInstance().method_6313().contains(this.var_3624)) {
                class_50.getInstance().method_6313().removeChild(this.var_3624);
            }
            if (Boolean(this.var_1104) && Boolean(class_50.getInstance().method_6313().contains(this.var_1104))) {
                class_50.getInstance().method_6313().removeChild(this.var_1104);
            }
            this.var_3624.removeEventListener(class_343.SET_SELECTED, this.setSelected);
            this.var_3624.removeEventListener(class_343.LOGOUT, this.logout);
            this.var_3624.removeEventListener(class_343.REPAIR, this.method_1177);
            this.var_3624.removeEventListener(class_343.OPEN_PROFILE_PAGE, this.method_948);
            this.var_3624.method_25();
            this.var_3624 = null;
        }
        this.var_2057 = false;
    }

    public function method_3317(): void {
        this.var_3624.method_313(this.var_4533);
    }

    public function method_1253(): void {
        if (class_50.method_5546(this)) {
            class_50.removeObserver(this);
        }
        this.var_4533 = [];
        this.var_3624.method_5203();
    }

    public function method_2530(param1: int, param2: int, param3: int, param4: String, param5: String, param6: Boolean, param7: int, param8: int): void {
        var _loc9_: String = class_344.method_4307(param3);
        if (param6 == true) {
            if (param2 == 0) {
                this.var_1086[param1].method_1472 = class_18.const_1319;
            } else {
                this.var_1086[param1].method_1472 = class_18.const_3252;
            }
        } else {
            this.var_1086[param1].method_1472 = class_18.const_302;
        }
        this.var_1086[param1].method_5292 = param8;
        this.var_1086[param1].name_29 = param4;
        this.var_1086[param1].wildcard = param5;
        this.var_1086[param1].method_5478 = param6;
        this.var_1086[param1].method_4246 = param2;
        this.var_1086[param1].cooldown = param7;
        this.var_1086[param1].currency = _loc9_;
        this.var_4533.push(param1);
        if (param7 > 0 && !class_50.method_5546(this)) {
            class_50.method_5621(this);
        }
    }

    public function method_2278(param1: int, param2: class_341 = null, param3: class_341 = null): void {
        var _loc7_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc4_: String = "";
        var _loc5_: String = "";
        var _loc6_: String = "";
        if (Boolean(param2) && param2.baseKey != "") {
            _loc9_ = class_88.getItem(param2.baseKey);
            if (class_266.method_900(param2.replacement)) {
                _loc7_ = class_122.method_98(parseInt(param2.replacement));
            } else {
                _loc7_ = param2.replacement;
            }
            _loc4_ = _loc9_.replace(param2.wildcard, _loc7_).replace("%CURRENCY%", param2.currency);
        }
        if (Boolean(param3) && param3.baseKey != "") {
            _loc10_ = class_88.getItem(param3.baseKey);
            if (class_266.method_900(param3.replacement)) {
                _loc7_ = class_122.method_98(parseInt(param3.replacement));
            } else {
                _loc7_ = param3.replacement;
            }
            _loc5_ = _loc10_.replace(param3.wildcard, _loc7_).replace("%CURRENCY%", param3.currency);
        } else if (param1 == class_345.const_2655) {
            _loc5_ = "\n" + class_88.getItem("desc_killscreen_option_available_countdown_spawnpoint");
        } else if (param1 == class_345.const_2251) {
            _loc5_ = "\n" + class_88.getItem("desc_killscreen_option_available_countdown_hadesgate");
        } else if (param1 == class_345.const_667) {
            _loc5_ = "\n" + class_88.getItem("desc_killscreen_option_available_countdown_tdm");
        }
        if (param1 == class_345.const_1505 || param1 == class_345.const_598) {
            _loc6_ = class_88.getItem("ttip_killscreen_logout_1");
        } else if (param1 == class_345.const_2655) {
            _loc6_ = class_88.getItem("ttip_killscreen_logout_spawnpoint");
        } else if (param1 == class_345.const_2251) {
            _loc6_ = class_88.getItem("ttip_killscreen_logout_hadesgate");
        } else if (param1 == class_345.const_667) {
            _loc6_ = class_88.getItem("ttip_killscreen_logout_tdm");
        }
        var _loc8_: String = _loc4_ + " " + _loc5_ + "\n \n" + _loc6_;
        this.var_1086[param1].method_3245 = _loc8_;
    }

    public function setTitle(param1: String): void {
        var _loc2_: String = class_88.getItem("head_killscreen_you_have_been_destroyed");
        var _loc3_: String = _loc2_.replace("%SHIP%", param1);
        this.var_3624.setTitle(_loc3_);
        this.var_3624.method_4318(class_88.getItem("subhead_killscreen_repair_now"));
    }

    public function get method_503(): Boolean {
        return this.var_2057;
    }

    public function method_4660(param1: String, param2: int, param3: String = ""): void {
        var _loc4_: String;
        var _loc5_: String = (_loc4_ = class_88.getItem(param1)).replace("%COUNT%", class_122.method_98(param2)).replace("%CURRENCY%", param3);
        var _loc6_: String = this.method_48(_loc5_, 37);
        this.var_3624.method_4045(_loc6_, _loc5_);
    }

    public function method_5370(param1: int): void {
        var _loc4_: Boolean = false;
        var _loc2_: String = class_88.getItem(const_2896[param1]);
        var _loc3_: String = "";
        var _loc5_: Array;
        var _loc6_: Array = ((_loc5_ = _loc2_.split("<b>"))[1] as String).split("</b>");
        var _loc7_: String = "";
        _loc7_ = _loc5_[0] + _loc6_[1];
        var _loc8_: String = "";
        _loc8_ = _loc6_[0];
        if (param1 == const_682 || param1 == const_1245) {
            _loc3_ = _loc8_.replace("%VALUE%", this.var_1864);
            if (param1 == const_682) {
                _loc4_ = true;
            } else {
                _loc4_ = false;
            }
        } else {
            _loc3_ = _loc8_;
            _loc4_ = false;
        }
        this.var_3624.method_3804(_loc7_, _loc3_, _loc4_);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        this._tpf += param1;
        if (this._tpf > 1000) {
            _loc3_ = 0;
            while (_loc3_ < this.var_1086.length) {
                _loc2_ = this.var_1086[_loc3_];
                if (_loc2_.cooldown > 0) {
                    --_loc2_.cooldown;
                    if (_loc3_ == this.var_2638 && (this.var_2638 == class_345.const_2655 || this.var_2638 == class_345.const_2251 || this.var_2638 == class_345.const_667)) {
                        this.var_3624.method_5164(_loc2_.method_3245.replace(/%COUNTDOWN%/, "<font color=\'#FF0000\' size=\'+6\'>" + _loc2_.cooldown + "</font>"));
                    }
                }
                _loc3_++;
            }
            this._tpf = 0;
        }
    }

    private function cleanup(): void {
        if (this.var_574.name_47.map) {
            this.var_574.name_47.map.cleanup();
        }
        this.method_1253();
        this.var_3624.cleanup();
    }

    public function method_6200(param1: Boolean): void {
        this.var_2057 = param1;
    }
}
}
