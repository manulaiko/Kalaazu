package package_400 {

import flash.filters.GlowFilter;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.settings.Settings;

import package_30.class_219;

import package_33.class_93;

public class class_2529 {

    private static const const_2714: Array = [new GlowFilter(16711680, 0.5, 6, 6, 2, 1, false)];


    private var var_1707: class_93;

    private var _width: Number;

    private var _height: Number;

    private var var_348: String;

    private var var_4443: String;

    private var var_7: class_219;

    private var var_862: class_219;

    public function class_2529(param1: class_93, param2: Number, param3: Number) {
        this.var_348 = class_88.getItem("jackpot_status_window_remaining_players_message");
        this.var_4443 = class_88.getItem("jackpot_status_window_round_message");
        super();
        this._height = param3;
        this._width = param2;
        this.var_1707 = param1;
        this.method_763();
    }

    private function method_763(): void {
        this.method_3529();
        this.method_2817();
    }

    private function method_3529(): void {
        this.var_862 = new class_219(this._width, 20, class_18.const_1916);
        this.var_1707.addElement(this.var_862, class_93.const_3298);
    }

    private function method_2817(): void {
        this.var_7 = new class_219(this._width, 20, class_18.const_611);
        if (Settings.qualityExplosion.value >= Settings.QUALITY_HIGH) {
            this.var_7.filters = const_2714;
        } else {
            this.var_7.filters = [];
        }
        this.var_1707.addElement(this.var_7, class_93.const_3298);
    }

    public function method_3607(param1: int, param2: int): void {
        var _loc3_: String = this.var_348.replace(/%COUNT%/, param1).replace(/%TOTAL%/, param2);
        this.var_862.method_1455(_loc3_);
    }

    public function method_5421(param1: int): void {
        var _loc2_: String = this.var_4443.replace(/%COUNT%/, param1);
        this.var_7.method_1455(_loc2_);
    }

    public function get method_6036(): class_219 {
        return this.var_862;
    }
}
}
