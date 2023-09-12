package net.bigpoint.darkorbit.mvc.battleStation {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_100.class_313;

import package_113.class_310;

import package_17.class_62;

import package_19.class_68;
import package_19.class_70;

import package_29.class_85;

import package_38.class_750;
import package_38.class_868;
import package_38.class_930;

import package_99.class_266;

public class BattleStation extends class_85 {


    private var _info: class_310;

    private var _deflectorShildID: int;

    private var _hullID: int;

    private var _deflectorShildExpansion: Number;

    private var _hullExpansion: Number;

    public const changed: class_68 = new class_70();

    public function BattleStation(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295, -200));
        UberAssetsLib.instance.fillTraits(this, "battleStation", UberAssetsLib.LIB_BATTLE_STATION, this.handleIconClick);
        addTrait(this._info = new class_310());
        this._info.name_148.value = param1.var_3438;
        this._info.name_145.value = param1.name_145;
        this._info.name_32.value = param1.name_45;
        this._info.factionID.value = param1.factionId;
        this._info.name_155.value = param1.name_98.type;
        this.updateVisuals(param1.name_164, param1.name_127);
        (method_1954(class_287) as class_287).lockType.value = class_287.method_5240(param1.name_98.type);
        (method_1954(class_313) as class_313).resKey = this.getMinimapResKey(param1);
    }

    public static function getMiniMapColorByClanAndFaction(param1: int, param2: int, param3: int = 0): uint {
        var _loc4_: Number = 0;
        if (param1 == class_81.name_32) {
            _loc4_ = 4281597747;
        } else if (param3 == class_930.const_754 || param3 == class_930.const_1930 || class_81.factionID == param2) {
            _loc4_ = 4294890119;
        } else {
            _loc4_ = 4294901760;
        }
        return _loc4_;
    }

    public function updateVisuals(param1: int, param2: int): void {
        this._deflectorShildID = class_266.method_4478(param1);
        this._hullID = class_266.method_4516(param1);
        this._deflectorShildExpansion = class_266.method_4516(param2);
        this._hullExpansion = class_266.method_4478(param2);
        this.changed.dispatch();
    }

    private function handleIconClick(): void {
        class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_750(id));
        class_62.getInstance().sendNotification(BattleStationNotification.const_2108, [id, this._info.name_148.value]);
    }

    private function getMinimapResKey(param1: class_868): String {
        var _loc2_: * = null;
        if (param1.name_45 == class_81.name_32) {
            _loc2_ = "mapIcon_battlestation_green";
        } else if (param1.name_98.type == class_930.const_754 || param1.name_98.type == class_930.const_1930 || class_81.factionID == param1.factionId) {
            _loc2_ = "mapIcon_battlestation_white";
        } else {
            _loc2_ = "mapIcon_battlestation_red";
        }
        return _loc2_;
    }

    public function get deflectorShildExpansion(): Number {
        return this._deflectorShildExpansion;
    }

    public function get hullExpansion(): Number {
        return this._hullExpansion;
    }
}
}
