package net.bigpoint.darkorbit.gui {

import flash.display.Sprite;
import flash.events.Event;

public class class_213 extends Sprite {

    private static const const_1173: int = 6;


    private var var_320: Array;

    private var offset: int = 16;

    private var var_4030: int;

    private var _displayTime: int;

    public function class_213(param1: int = 500, param2: int = 5) {
        this.var_320 = [];
        super();
        this._displayTime = param2;
        this.var_4030 = param1;
    }

    public function method_4900(param1: String): void {
        var _loc2_: * = null;
        _loc2_ = new class_1102(param1, this.var_4030, this._displayTime);
        _loc2_.y = this.offset + const_1173 + _loc2_.height;
        _loc2_.mouseEnabled = false;
        _loc2_.mouseChildren = false;
        this.var_320.push(_loc2_);
        this.update();
    }

    private function method_1199(param1: Event): void {
        var _loc2_: class_1102 = class_1102(param1.target);
        var _loc3_: int = this.var_320.length - 1;
        while (_loc3_ > -1) {
            if (_loc2_ == class_1102(this.var_320[_loc3_])) {
                this.var_320.splice(_loc3_, 1);
                this.update();
                return;
            }
            _loc3_--;
        }
    }

    private function update(): void {
        var _loc1_: * = null;
        if (this.var_320.length > 0) {
            _loc1_ = this.var_320[0] as class_1102;
            if (!contains(_loc1_)) {
                _loc1_.addEventListener(class_132.const_2194, this.method_1199);
                addChild(_loc1_);
                _loc1_.show();
                _loc1_.moveTo(this.offset);
            }
        }
    }

    public function get itemWidth(): int {
        return this.var_4030;
    }
}
}
