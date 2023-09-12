package net.bigpoint.darkorbit.gui {

import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;
import net.bigpoint.darkorbit.net.class_53;

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

import package_37.ICommand;

import package_38.class_510;
import package_38.class_617;

public class class_1555 {

    private static const const_1369: int = -1;


    private var var_12: class_53;

    private var var_4224: Vector.<class_1554>;

    private var name_95: Object;

    private var var_2922: Vector.<class_1554>;

    public function class_1555(param1: class_53) {
        this.var_4224 = new Vector.<class_1554>();
        this.var_2922 = new Vector.<class_1554>();
        super();
        this.var_12 = param1;
        this.name_95 = new Object();
        this.name_95[class_1169.NAME] = class_617.const_1882;
        this.name_95[class_1167.NAME] = class_617.const_1219;
        this.name_95[class_1161.NAME] = class_617.JUMP;
        this.name_95[class_1165.NAME] = class_617.const_1566;
        this.name_95[class_1163.NAME] = class_617.const_1107;
        this.name_95[class_1159.NAME] = class_617.const_2005;
        this.name_95[class_1158.NAME] = class_617.const_1199;
        this.name_95[class_1168.NAME] = class_617.const_795;
        this.name_95[class_1164.NAME] = class_617.LOGOUT;
        this.name_95[class_1160.NAME] = class_617.const_1234;
        this.name_95[class_1170.NAME] = class_617.const_995;
        this.name_95[ZoomInCommand.NAME] = class_617.const_402;
        this.name_95[ZoomOutCommand.NAME] = class_617.const_705;
        this.name_95[PetRepairShipCommand.NAME] = class_617.const_2160;
        this.name_95[FocusChatCommand.NAME] = class_617.const_1027;
        this.name_95[ToggleCategoryBarCommand.NAME] = class_617.const_1789;
        this.name_95[class_1166.NAME] = class_617.const_1391;
    }

    public function method_980(param1: class_1554): void {
        this.var_4224.push(param1);
    }

    public function method_2039(param1: class_1554): void {
        this.var_2922.push(param1);
    }

    public function method_1900(): void {
        var _loc1_: * = null;
        if (this.var_2922.length > 0) {
            _loc1_ = this.method_4936();
            this.var_2922.length = 0;
            this.var_12.sendRequest(_loc1_);
        }
    }

    private function method_4936(): ICommand {
        var _loc1_: Vector.<class_617> = new Vector.<class_617>();
        var _loc2_: int = 0;
        while (_loc2_ < this.var_2922.length) {
            _loc1_.push(new class_617(this.name_95[this.var_2922[_loc2_].name], this.var_2922[_loc2_].keys, int(this.var_2922[_loc2_].args[0])));
            _loc2_++;
        }
        return new class_510(_loc1_);
    }

    public function method_5159(): void {
        var _loc1_: * = null;
        if (this.var_4224.length > 0) {
            _loc1_ = this.method_4236();
            this.var_4224.length = 0;
            this.var_12.sendRequest(_loc1_);
        }
    }

    private function method_4236(): ICommand {
        var _loc1_: Vector.<class_617> = new Vector.<class_617>();
        var _loc2_: int = 0;
        while (_loc2_ < this.var_4224.length) {
            _loc1_.push(new class_617(this.name_95[this.var_4224[_loc2_].name], new <int>[const_1369], int(this.var_4224[_loc2_].args[0])));
            _loc2_++;
        }
        return new class_510(_loc1_);
    }
}
}
