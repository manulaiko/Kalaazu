package net.bigpoint.darkorbit.gui {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;

import package_9.class_50;

public class class_55 extends Sprite {

    private static const const_1173: int = 6;


    private var var_320: Array;

    private var offset: int = 0;

    private var var_4030: int;

    private var var_4267: int;

    private var _displayTime: int;

    private var _config: class_21;

    public function class_55(param1: class_21) {
        this.var_320 = [];
        super();
        this._config = param1;
        this.var_4030 = param1.width;
        this.var_4267 = param1.var_3185;
        this._displayTime = param1.displayTime;
        addEventListener(Event.ADDED_TO_STAGE, this.method_396);
        addEventListener(Event.REMOVED_FROM_STAGE, this.method_267);
    }

    private function method_396(param1: Event): void {
        class_50.getInstance().const_2351.add(this.updatePosition);
        this.updatePosition();
    }

    private function method_267(param1: Event): void {
        class_50.getInstance().const_2351.remove(this.updatePosition);
    }

    private function updatePosition(): void {
        x = class_50.var_3454;
        y = this._config.y;
    }

    public function method_4900(param1: String, param2: class_133): void {
        var _loc3_: * = null;
        _loc3_ = new class_132(param1, this.var_4030, param2.displayTime);
        _loc3_.y = this.offset + _loc3_.height + const_1173;
        _loc3_.mouseEnabled = false;
        _loc3_.mouseChildren = false;
        if (param2.var_3148) {
            _loc3_.addEventListener(class_132.const_2194, this.method_1622);
        } else {
            this.var_320.push(_loc3_);
            _loc3_.addEventListener(class_132.const_2194, this.method_1199);
        }
        _loc3_.x = -Number(_loc3_.width) * 0.5;
        addChild(_loc3_);
        this.update();
    }

    private function method_1622(param1: Event): void {
        var _loc2_: class_132 = class_132(param1.target);
        _loc2_.removeEventListener(class_132.const_2194, this.method_1622);
        _loc2_.dispose();
        this.update();
    }

    private function method_1199(param1: Event): void {
        var _loc2_: class_132 = class_132(param1.target);
        var _loc3_: int = this.var_320.length - 1;
        while (_loc3_ > -1) {
            if (_loc2_ == class_132(this.var_320[_loc3_])) {
                this.var_320.splice(_loc3_, 1);
                this.update();
                return;
            }
            _loc3_--;
        }
    }

    private function update(): void {
        var _loc1_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        while (this.var_320.length > this.var_4267) {
            _loc1_ = class_132(this.var_320[0]);
            _loc1_.removeEventListener(class_132.const_2194, this.method_1199);
            _loc1_.dispose();
            this.var_320.shift();
        }
        this.offset = 0;
        var _loc2_: int = 0;
        while (_loc2_ < this.numChildren) {
            _loc3_ = this.getChildAt(_loc2_);
            if (_loc3_ is class_132) {
                (_loc4_ = class_132(_loc3_)).moveTo(this.offset);
                this.offset += _loc4_.height + const_1173;
            }
            _loc2_++;
        }
    }

    public function get itemWidth(): int {
        return this.var_4030;
    }
}
}
