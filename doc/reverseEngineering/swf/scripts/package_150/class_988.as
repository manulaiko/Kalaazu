package package_150 {

import flash.events.Event;

import package_155.class_999;

public class class_988 extends Event {

    public static const EQUIP_MODULE: String = "EQUIP_MODULE";

    public static const CONFIRM_BTN_CLICKED: String = "CONFIRM_BTN_CLICKED";

    public static const const_1634: String = "CONSTRUCTION_TIME_SELECTED";

    public static const SHOW_BUILD_TIME_SELECTION_POPUP: String = "SHOW_BUILD_TIME_SELECTION_POPUP";

    public static const SHOW_DEFLECTOR_DEACTIVATION_POPUP: String = "SHOW_DEFLECTOR_DEACTIVATION_POPUP";

    public static const ACTIVATE_BUTTON_CLICKED: String = "ACTIVATE_BUTTON_CLICKED";

    public static const BATTLE_STATION_MODULE_CLICKED: String = "BATTLE_STATION_MODULE_CLICKED";

    public static const BATTLE_STATION_MODULE_ROLLED_IN: String = "BATTLE_STATION_MODULE_ROLLED_IN";

    public static const BATTLE_STATION_MODULE_ROLLED_OUT: String = "BATTLE_STATION_MODULE_ROLLED_OUT";

    public static const SHOW_INVENTORY_FILTER_POPUP: String = "SHOW_INVENTORY_FILTER_POPUP";


    public var itemId: int;

    public var slotId: int;

    public var moduleType: int;

    public var var_1959: Boolean = false;

    public var var_381: int;

    public var moduleItem: class_999;

    public var var_4567: String;

    public function class_988(param1: String = "", param2: Boolean = false, param3: Boolean = false) {
        super(param1, param2, param3);
    }

    override public function clone(): Event {
        var _loc1_: class_988 = new class_988(type);
        _loc1_.itemId = this.itemId;
        _loc1_.slotId = this.slotId;
        _loc1_.var_1959 = this.var_1959;
        _loc1_.moduleItem = this.moduleItem;
        _loc1_.var_4567 = this.var_4567;
        return _loc1_;
    }
}
}
