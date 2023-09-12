package package_65 {

import net.bigpoint.darkorbit.mvc.questWindow.model.vo.class_1055;

import package_38.class_238;
import package_38.class_486;
import package_38.class_771;
import package_38.class_778;
import package_38.class_870;

public class class_240 {

    private static const _instance: class_240 = new class_240();


    private var var_1693: int;

    private var var_64: int;

    private var var_3539: int;

    private var var_2346: class_1111;

    private var var_3144: Array;

    public function class_240() {
        super();
        if (_instance) {
            throw new Error("QuestParser is a singleton");
        }
        this.var_2346 = new class_1111();
    }

    public static function get instance(): class_240 {
        return _instance;
    }

    public function method_5892(param1: class_238): class_203 {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: Boolean = false;
        var _loc13_: Boolean = false;
        var _loc14_: Boolean = false;
        var _loc15_: * = null;
        this.method_5051();
        var _loc2_: class_870 = param1.var_2657;
        var _loc3_: class_1093 = this.method_4992(_loc2_);
        if (param1.id == 10000) {
            _loc3_.name_62 = true;
            _loc3_.method_1918 = 1;
            _loc7_ = 10000;
            _loc8_ = 10000;
            _loc9_ = new Vector.<String>();
            _loc10_ = 0;
            _loc11_ = 0;
            _loc12_ = true;
            _loc13_ = true;
            _loc14_ = false;
            _loc15_ = this.var_2346.method_1012(_loc8_, _loc7_, _loc10_, _loc11_, _loc12_, _loc13_, _loc14_, _loc9_);
            _loc2_.var_2708 = new Vector.<class_778>();
            _loc3_ = this.method_4992(_loc2_);
            _loc3_.method_242(_loc15_);
        }
        var _loc4_: * = [];
        for each(_loc5_ in param1.rewards) {
            _loc4_.push(new class_1055(_loc5_));
        }
        (_loc6_ = new class_203(param1.id, _loc3_, _loc4_, false, param1.name_19, param1.var_3107)).name_160 = param1.name_160;
        _loc6_.method_3950 = this.var_3144;
        return _loc6_;
    }

    private function method_5051(): void {
        this.var_1693 = 0;
        this.var_3539 = 0;
        this.var_64 = 0;
        this.var_3144 = [];
    }

    private function method_4992(param1: class_870): class_1093 {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: class_1093 = new class_1093();
        ++this.var_3539;
        ++this.var_1693;
        _loc2_.id = param1.id;
        _loc2_.active = param1.active;
        _loc2_.name_62 = param1.name_62;
        _loc2_.ordered = param1.ordered;
        _loc2_.method_1918 = param1.var_1979;
        var _loc6_: int = 0;
        while (_loc6_ < param1.var_2708.length) {
            _loc3_ = param1.var_2708[_loc6_];
            if (_loc3_.var_2987.id > 0) {
                _loc4_ = class_1093(this.method_4992(_loc3_.var_2987));
                _loc2_.method_4029(_loc4_);
            } else if (_loc3_.condition.id > 0) {
                _loc5_ = this.method_1344(_loc3_.condition);
                _loc2_.method_242(_loc5_);
            }
            _loc6_++;
        }
        return _loc2_;
    }

    private function method_1344(param1: class_486): class_236 {
        var _loc11_: * = null;
        ++this.var_64;
        ++this.var_1693;
        var _loc2_: int = int(param1.id);
        var _loc3_: int = int(param1.var_1284);
        var _loc4_: Vector.<String> = param1.var_4154;
        var _loc5_: int = int(param1.state.currentValue);
        var _loc6_: int = int(param1.var_2022);
        var _loc7_: Boolean = Boolean(param1.state.active);
        var _loc8_: Boolean = Boolean(param1.name_62);
        var _loc9_: Boolean = Boolean(param1.state.completed);
        var _loc10_: class_236 = this.var_2346.method_1012(_loc3_, _loc2_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc4_);
        this.var_3144[_loc2_] = _loc10_;
        var _loc12_: int = 0;
        while (_loc12_ < param1.var_3103.length) {
            (_loc11_ = this.method_1344(param1.var_3103[_loc12_])).runstate = _loc7_;
            _loc11_.completed = _loc9_;
            _loc10_.method_242(_loc11_);
            _loc11_.method_2612();
            _loc12_++;
        }
        return _loc10_;
    }
}
}
