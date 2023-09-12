package net.bigpoint.darkorbit.gui {

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_26.class_94;

import package_33.class_183;
import package_33.class_93;

import package_39.class_1052;
import package_39.class_1053;

import package_46.class_131;

public class class_188 {


    private var guiManager: class_58;

    private var var_4638: uint = 15793557;

    private var var_178: uint = 16777215;

    private var var_20: uint = 12255232;

    public function class_188(param1: class_58) {
        super();
        this.guiManager = param1;
    }

    public function decorate(param1: class_131): void {
        this.method_2052(param1);
    }

    private function method_2052(param1: class_131): void {
        var _loc2_: class_183 = param1.method_3694(class_93.const_809) as class_183;
        var _loc3_: class_1053 = new class_1053();
        _loc3_.var_2862 = param1.method_2876();
        _loc3_.method_4656(5, 5);
        _loc2_.component = _loc3_;
        _loc3_.x = 30;
        _loc3_.y = 7;
        var _loc4_: class_183 = param1.method_3694(class_93.const_2070) as class_183;
        var _loc5_: class_1052 = new class_1052(this.var_178);
        class_94.getInstance().method_1211(_loc5_, class_88.getItem("ttip_scoreevent_combo"));
        _loc5_.method_3166();
        _loc4_.component = _loc5_;
        _loc5_.method_6527(this.var_20);
        _loc5_.x = 30;
        _loc5_.y = 8;
        _loc5_.setSize(150, 15);
        _loc5_.method_177();
        var _loc6_: class_183 = param1.method_3694(class_93.const_2926) as class_183;
        var _loc7_: class_1052 = new class_1052(this.var_4638);
        class_94.getInstance().method_1211(_loc7_, class_88.getItem("ttip_scoreevent_combotimer"));
        _loc7_.method_3166();
        _loc6_.component = _loc7_;
        _loc7_.x = 30;
        _loc7_.y = 8;
        _loc7_.setSize(150, 6);
    }
}
}
