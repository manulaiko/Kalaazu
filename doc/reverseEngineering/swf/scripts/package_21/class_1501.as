package package_21 {

import mx.core.IFlexModuleFactory;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_38.class_787;

import package_47.class_976;

public class class_1501 extends class_977 {


    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1501() {
        super();
        mx_internal::_document = this;
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    override protected function createChildren(): void {
        super.createChildren();
    }

    override public function set data(param1: Object): void {
        super.data = param1;
        if (param1 == null) {
            return;
        }
        this.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_queued");
        var _loc2_: String = "null";
        var _loc3_: class_787 = param1 as class_787;
        rowLabel.htmlText = "<font size=\'12\' color=\'#" + _loc2_ + "\'>" + _loc3_.var_3699.toString() + "</font>";
    }
}
}
