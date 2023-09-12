package net.bigpoint.darkorbit.net {

import flash.events.Event;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.class_58;

import package_46.class_131;

import package_70.SimpleWindowEvent;

public class class_419 {


    private var var_841: class_131;

    private var var_12: class_53;

    public function class_419(param1: class_53, param2: class_131) {
        super();
        this.var_12 = param1;
        this.var_841 = param2;
    }

    public function activate(): void {
        this.var_841.addEventListener(SimpleWindowEvent.const_1770, this.method_5657);
        this.var_841.method_1081();
        this.var_841.maximize();
        this.var_841.method_6107("title_trade");
        class_58.instance.method_4627();
    }

    private function method_5657(param1: Event): void {
        this.var_841.removeEventListener(SimpleWindowEvent.const_1770, this.method_5657);
        if (true) {
            this.var_841.method_5120();
            this.var_841.method_6107("ttip_trade_inactive");
        }
    }
}
}
