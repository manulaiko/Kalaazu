package package_65 {

import package_183.Condition;
import package_183.class_1108;
import package_183.class_1576;
import package_183.class_1577;
import package_183.class_1578;
import package_183.class_1579;
import package_183.class_1580;
import package_183.class_1581;
import package_183.class_1582;
import package_183.class_1583;
import package_183.class_1584;
import package_183.class_1585;
import package_183.class_1586;
import package_183.class_1587;
import package_183.class_1588;
import package_183.class_1589;
import package_183.class_1590;
import package_183.class_1591;
import package_183.class_1592;
import package_183.class_1593;
import package_183.class_1594;
import package_183.class_1595;
import package_183.class_1596;
import package_183.class_1597;
import package_183.class_1598;
import package_183.class_1599;
import package_183.class_1600;
import package_183.class_1601;
import package_183.class_1602;
import package_183.class_1603;
import package_183.class_1604;
import package_183.class_1605;
import package_183.class_1606;
import package_183.class_1607;
import package_183.class_1608;
import package_183.class_1609;
import package_183.class_1610;
import package_183.class_1611;
import package_183.class_1612;
import package_183.class_1613;
import package_183.class_1614;
import package_183.class_1615;
import package_183.class_1616;
import package_183.class_1617;
import package_183.class_1618;
import package_183.class_1619;
import package_183.class_1620;
import package_183.class_1621;
import package_183.class_1622;
import package_183.class_1623;
import package_183.class_1624;
import package_183.class_1625;
import package_183.class_1626;
import package_183.class_1627;
import package_183.class_1628;
import package_183.class_1629;
import package_183.class_1630;
import package_183.class_1631;
import package_183.class_1632;
import package_183.class_1633;
import package_183.class_1634;
import package_183.class_1635;
import package_183.class_1636;
import package_183.class_1637;
import package_183.class_1638;
import package_183.class_1639;
import package_183.class_1640;
import package_183.class_1641;
import package_183.class_1642;
import package_183.class_1643;
import package_183.class_1645;
import package_183.class_1646;
import package_183.class_1647;

import package_38.class_486;

public class class_1111 {

    private static const const_1500: int = -1;


    private var var_4314: Array;

    public function class_1111() {
        super();
        this.method_2992();
    }

    public function method_1012(param1: int, param2: int, param3: int, param4: int, param5: Boolean, param6: Boolean, param7: Boolean, param8: Vector.<String> = null): class_236 {
        if (!this.var_4314[param1]) {
            param1 = int(const_1500);
        }
        var _loc10_: class_236;
        var _loc9_: Class;
        (_loc10_ = new (_loc9_ = (this.var_4314[param1] as class_1108).CLASS)()).definition = this.var_4314[param1];
        _loc10_.init(param2, param3, param4, param5, param6, param7, param8);
        return _loc10_;
    }

    private function method_2992(): void {
        this.var_4314 = [];
        this.var_4314[const_1500] = new class_1108(const_1500, "UNKNOWN", Condition, false);
        this.var_4314[class_486.TIMER] = new class_1108(class_486.TIMER, "TIMER", class_1578, false);
        this.var_4314[class_486.HASTE] = new class_1108(class_486.HASTE, "HASTE", class_1622, false);
        this.var_4314[class_486.ENDURANCE] = new class_1108(class_486.ENDURANCE, "ENDURANCE", class_1647, true);
        this.var_4314[class_486.COUNTDOWN] = new class_1108(class_486.COUNTDOWN, "COUNTDOWN", class_1611, true);
        this.var_4314[class_486.COLLECT] = new class_1108(class_486.COLLECT, "COLLECT", class_1602, true);
        this.var_4314[class_486.KILL_NPC] = new class_1108(class_486.KILL_NPC, "KILL_NPC", class_1618, false);
        this.var_4314[class_486.DAMAGE] = new class_1108(class_486.DAMAGE, "DAMAGE", class_1625, false);
        this.var_4314[class_486.AVOID_DAMAGE] = new class_1108(class_486.AVOID_DAMAGE, "AVOID_DAMAGE", class_1640, false);
        this.var_4314[class_486.TAKE_DAMAGE] = new class_1108(class_486.TAKE_DAMAGE, "TAKE_DAMAGE", class_1639, true);
        this.var_4314[class_486.AVOID_DEATH] = new class_1108(class_486.AVOID_DEATH, "AVOID_DEATH", class_1579, false);
        this.var_4314[class_486.COORDINATES] = new class_1108(class_486.COORDINATES, "COORDINATES", class_1632, true);
        this.var_4314[class_486.DISTANCE] = new class_1108(class_486.DISTANCE, "DISTANCE", class_1576, false);
        this.var_4314[class_486.TRAVEL] = new class_1108(class_486.TRAVEL, "TRAVEL", class_1582, true);
        this.var_4314[class_486.FUEL_SHORTAGE] = new class_1108(class_486.FUEL_SHORTAGE, "FUEL_SHORTAGE", class_1614, false);
        this.var_4314[class_486.PROXIMITY] = new class_1108(class_486.PROXIMITY, "PROXIMITY", class_1588, true);
        this.var_4314[class_486.MAP] = new class_1108(class_486.MAP, "MAP", class_1595, true);
        this.var_4314[class_486.MAP_DIVERSE] = new class_1108(class_486.MAP_DIVERSE, "MAP_DIVERSE", class_1590, true);
        this.var_4314[class_486.EMPTY] = new class_1108(class_486.EMPTY, "EMPTY", class_1601, true);
        this.var_4314[class_486.MISCELLANEOUS] = new class_1108(class_486.MISCELLANEOUS, "MISCELLANEOUS", class_1577, true);
        this.var_4314[class_486.AMMUNITION] = new class_1108(class_486.AMMUNITION, "AMMUNITION", class_1589, false);
        this.var_4314[class_486.SAVE_AMMUNITION] = new class_1108(class_486.SAVE_AMMUNITION, "SAVE_AMMUNITION", class_1629, false);
        this.var_4314[class_486.SPEND_AMMUNITION] = new class_1108(class_486.SPEND_AMMUNITION, "SPEND_AMMUNITION", class_1581, true);
        this.var_4314[class_486.SALVAGE] = new class_1108(class_486.SALVAGE, "SALVAGE", class_1583, true);
        this.var_4314[class_486.STEAL] = new class_1108(class_486.STEAL, "STEAL", class_1641, true);
        this.var_4314[class_486.KILL_NPCS] = new class_1108(class_486.KILL_NPCS, "KILL_NPCS", class_1609, true);
        this.var_4314[class_486.KILL_PLAYERS] = new class_1108(class_486.KILL_PLAYERS, "KILL_PLAYERS", class_1584, true);
        this.var_4314[class_486.DAMAGE_NPCS] = new class_1108(class_486.DAMAGE_NPCS, "DAMAGE_NPCS", class_1580, true);
        this.var_4314[class_486.DAMAGE_PLAYERS] = new class_1108(class_486.DAMAGE_PLAYERS, "DAMAGE_PLAYERS", class_1604, true);
        this.var_4314[class_486.VISIT_MAP] = new class_1108(class_486.VISIT_MAP, "VISIT_MAP", class_1636, true);
        this.var_4314[class_486.DIE] = new class_1108(class_486.DIE, "DIE", class_1615, false);
        this.var_4314[class_486.AVOID_KILL_NPC] = new class_1108(class_486.AVOID_KILL_NPC, "AVOID_KILL_NPC", class_1630, false);
        this.var_4314[class_486.AVOID_KILL_NPCS] = new class_1108(class_486.AVOID_KILL_NPCS, "AVOID_KILL_NPCS", class_1620, false);
        this.var_4314[class_486.AVOID_KILL_PLAYERS] = new class_1108(class_486.AVOID_KILL_PLAYERS, "AVOID_KILL_PLAYERS", class_1612, false);
        this.var_4314[class_486.AVOID_DAMAGE_NPCS] = new class_1108(class_486.AVOID_DAMAGE_NPCS, "AVOID_DAMAGE_NPCS", class_1624, false);
        this.var_4314[class_486.AVOID_DAMAGE_PLAYERS] = new class_1108(class_486.AVOID_DAMAGE_PLAYERS, "AVOID_DAMAGE_PLAYERS", class_1627, false);
        this.var_4314[class_486.PREVENT] = new class_1108(class_486.PREVENT, "PREVENT", class_1616, false);
        this.var_4314[class_486.JUMP] = new class_1108(class_486.JUMP, "JUMP", class_1605, true);
        this.var_4314[class_486.AVOID_JUMP] = new class_1108(class_486.AVOID_JUMP, "AVOID_JUMP", class_1635, false);
        this.var_4314[class_486.STEADINESS] = new class_1108(class_486.STEADINESS, "STEADINESS", class_1621, true);
        this.var_4314[class_486.MULTIPLIER] = new class_1108(class_486.MULTIPLIER, "MULTIPLIER", class_1598, false);
        this.var_4314[class_486.STAY_AWAY] = new class_1108(class_486.STAY_AWAY, "STAY_AWAY", class_1646, true);
        this.var_4314[class_486.IN_GROUP] = new class_1108(class_486.IN_GROUP, "IN_GROUP", class_1643, true);
        this.var_4314[class_486.KILL_ANY] = new class_1108(class_486.KILL_ANY, "KILL_ANY", class_1637, true);
        this.var_4314[class_486.WEB] = new class_1108(class_486.WEB, "WEB", class_1638, true);
        this.var_4314[class_486.CLIENT] = new class_1108(class_486.CLIENT, "CLIENT", class_1642, true);
        this.var_4314[class_486.CARGO] = new class_1108(class_486.CARGO, "CARGO", class_1593, true);
        this.var_4314[class_486.SELL_ORE] = new class_1108(class_486.SELL_ORE, "SELL_ORE", class_1617, true);
        this.var_4314[class_486.LEVEL] = new class_1108(class_486.LEVEL, "LEVEL", class_1586, true);
        this.var_4314[class_486.GAIN_INFLUENCE] = new class_1108(class_486.GAIN_INFLUENCE, "GAIN_INFLUENCE", class_1610, true);
        this.var_4314[class_486.RESTRICT_AMMUNITION_KILL_NPC] = new class_1108(class_486.RESTRICT_AMMUNITION_KILL_NPC, "RESTRICT_AMMUNITION_KILL_NPC", class_1603, true);
        this.var_4314[class_486.RESTRICT_AMMUNITION_KILL_PLAYER] = new class_1108(class_486.RESTRICT_AMMUNITION_KILL_PLAYER, "RESTRICT_AMMUNITION_KILL_PLAYER", class_1634, true);
        this.var_4314[class_1644.HONOR_REDEMPTION] = new class_1108(class_1644.HONOR_REDEMPTION, "HONOR_REDEMPTION", class_1645, true);
        this.var_4314[class_486.VISIT_QUEST_GIVER] = new class_1108(class_486.VISIT_QUEST_GIVER, "VISIT_QUEST_GIVER", class_1599, true);
        this.var_4314[class_486.COLLECT_BONUS_BOX] = new class_1108(class_486.COLLECT_BONUS_BOX, "COLLECT_BONUS_BOX", class_1626, true);
        this.var_4314[class_486.QUICK_BUY] = new class_1108(class_486.QUICK_BUY, "QUICK_BUY", class_1606, true);
        this.var_4314[class_486.ENTER_GROUP] = new class_1108(class_486.ENTER_GROUP, "ENTER_GROUP", class_1587, true);
        this.var_4314[class_486.REAL_TIME_HASTE] = new class_1108(class_486.REAL_TIME_HASTE, "REAL_TIME_HASTE", class_1591, false);
        this.var_4314[class_486.ACTIVATE_MAP_ASSET_TYPE] = new class_1108(class_486.ACTIVATE_MAP_ASSET_TYPE, "ACTIVATE_MAP_ASSET_TYPE", class_1594, true);
        this.var_4314[class_486.VISIT_JUMP_GATE_TO_MAP_TYPE] = new class_1108(class_486.VISIT_JUMP_GATE_TO_MAP_TYPE, "VISIT_JUMP_GATE_TO_MAP_TYPE", class_1613, true);
        this.var_4314[class_486.const_3100] = new class_1108(class_486.const_3100, "VISIT_MULTIPLE_MAPS", class_1633, true);
        this.var_4314[class_486.COLLECT_LOOT] = new class_1108(class_486.COLLECT_LOOT, "COLLECT_LOOT", class_1623, true);
        this.var_4314[class_486.FINISH_STARTER_GATE] = new class_1108(class_486.FINISH_STARTER_GATE, "FINISH_STARTER_GATE", class_1619, true);
        this.var_4314[class_486.FINISH_GALAXY_GATE] = new class_1108(class_486.FINISH_GALAXY_GATE, "FINISH_GALAXY_GATE", class_1592, true);
        this.var_4314[class_486.IN_CLAN] = new class_1108(class_486.IN_CLAN, "IN_CLAN", class_1597, true);
        this.var_4314[class_486.REFINE_ORE] = new class_1108(class_486.REFINE_ORE, "REFINE_ORE", class_1596, true);
        this.var_4314[class_486.PUT_ITEM_IN_SLOT_BAR] = new class_1108(class_486.PUT_ITEM_IN_SLOT_BAR, "PUT_ITEM_IN_SLOT_BAR", class_1628, true);
        this.var_4314[class_486.USE_ORE_UPDATE] = new class_1108(class_486.USE_ORE_UPDATE, "USE_ORE_UPDATE", class_1607, true);
        this.var_4314[class_486.VISIT_MAP_ASSET] = new class_1108(class_486.VISIT_MAP_ASSET, "VISIT_MAP_ASSET", class_1608, true);
        this.var_4314[class_486.UPDATE_SKYLAB_TO_LEVEL] = new class_1108(class_486.UPDATE_SKYLAB_TO_LEVEL, "UPDATE_SKYLAB_TO_LEVEL", class_1585, true);
        this.var_4314[class_486.const_856] = new class_1108(class_486.const_856, "MAP", class_1595, false);
        this.var_4314[class_486.BEACON_TAKEOVER] = new class_1108(class_486.const_856, "BEACON_TAKEOVER", class_1631, true);
        this.var_4314[class_486.const_1818] = new class_1108(class_486.const_1818, "", class_1600, true);
    }
}
}
