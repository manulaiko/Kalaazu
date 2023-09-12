package package_197 {

import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.utils.getTimer;

import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.settings.Settings;

public class class_1739 extends Sprite implements class_80 {

    private static const const_2706: Number = 500;


    private var var_4553: class_1743;

    private var var_101: Vector.<class_2016>;

    private var _tpf: Number = 0;

    private var var_4526: Rectangle;

    private var var_1708: Vector.<class_1205>;

    public function class_1739(param1: Vector.<class_1205>) {
        this.var_101 = new Vector.<class_2016>();
        this.var_4526 = new Rectangle(0, 0, 1, 1);
        super();
        this.var_1708 = param1;
    }

    public function set method_6305(param1: class_1743): void {
        this.var_4553 = param1;
        this.method_818 = !!this.var_4553 ? this.var_4553.method_818 : null;
    }

    private function set method_818(param1: Vector.<class_2017>): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        while (this.var_101.length > 0) {
            _loc2_ = this.var_101.pop();
            _loc2_.cleanup();
            if (contains(_loc2_)) {
                removeChild(_loc2_);
            }
        }
        if (param1) {
            for each(_loc3_ in param1) {
                _loc2_ = new class_2016(_loc3_, this.var_4526);
                this.var_101.push(_loc2_);
                addChild(_loc2_);
            }
            Settings.qualityBackground.changed.add(this.method_354);
            this.method_354();
        } else {
            Settings.qualityBackground.changed.remove(this.method_354);
        }
    }

    private function method_354(): void {
        visible = Settings.qualityBackground.high.value;
    }

    public function method_3361(param1: int, param2: int): void {
        var _loc3_: * = null;
        this.var_4526.width = param1;
        this.var_4526.height = param2;
        for each(_loc3_ in this.var_101) {
            _loc3_.rect = this.var_4526;
        }
    }

    public function updateObj(param1: Number): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        if (!visible) {
            return;
        }
        var _loc2_: int = getTimer();
        if (_loc2_ - Number(this._tpf) > const_2706) {
            this._tpf = _loc2_;
            if (this.var_4553) {
                _loc3_ = int(this.var_101.length);
                _loc4_ = 0;
                while (_loc4_ < _loc3_) {
                    this.var_101[_loc4_].method_1125(this.var_4553, this.var_1708);
                    _loc4_++;
                }
            }
            this._tpf = 0;
        }
    }
}
}
