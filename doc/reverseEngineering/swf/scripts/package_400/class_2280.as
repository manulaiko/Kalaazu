package package_400 {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.IEventDispatcher;

import package_33.class_93;

import package_46.class_131;

import package_76.class_215;

public class class_2280 implements IEventDispatcher {

    private static const const_1320: int = 10;

    private static const const_794: int = 10;

    public static const const_1804: int = 0;

    public static const const_1031: int = 1;

    public static const const_1469: int = 2;

    public static const const_664: int = 3;


    private var var_841: class_131;

    private var var_2604: class_2527;

    private var var_3648: class_2528;

    private var var_4401: class_2529;

    public function class_2280(param1: class_131) {
        super();
        this.decorate(param1);
    }

    private function decorate(param1: class_131): void {
        this.var_841 = param1;
        this.method_2052();
    }

    public function flash(): void {
        if (!this.var_841.maximized && !this.var_841.isTweening) {
            this.var_841.method_5778(5);
        }
    }

    public function minimize(): void {
        if (this.var_841.maximized) {
            this.var_841.minimize();
        }
    }

    private function method_6213(param1: class_93): void {
        var _loc2_: int = Number(this.var_841.width) * 0.5;
        this.centerX(param1);
        param1.x += _loc2_;
    }

    private function centerX(param1: DisplayObject): void {
        param1.x = -param1.width * 0.5;
    }

    private function method_2052(): void {
        this.var_841.removeAllElements();
        var _loc1_: class_93 = this.var_841.method_3694(0);
        var _loc2_: class_93 = this.var_841.method_3694(1);
        var _loc3_: class_93 = this.var_841.method_3694(2);
        class_215.method_5129(_loc3_);
        class_215.method_5129(_loc2_);
        class_215.method_5129(_loc1_);
        this.var_4401 = new class_2529(_loc1_, this.var_841.width, this.var_841.height);
        this.var_3648 = new class_2528(_loc2_, this.var_841.width, this.var_841.height);
        _loc2_.y = _loc1_.y + _loc1_.height + const_1320;
        this.var_2604 = new class_2527(_loc3_, this.var_841.width, this.var_841.height);
        _loc3_.y = _loc2_.y + _loc2_.height + const_794;
        this.method_6213(_loc1_);
        this.method_6213(_loc2_);
        this.method_6213(_loc3_);
    }

    public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        this.var_841.addEventListener(param1, param2, param3, param4, param5);
    }

    public function dispatchEvent(param1: Event): Boolean {
        return this.var_841.dispatchEvent(param1);
    }

    public function hasEventListener(param1: String): Boolean {
        return this.var_841.hasEventListener(param1);
    }

    public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        this.var_841.removeEventListener(param1, param2, param3);
    }

    public function willTrigger(param1: String): Boolean {
        return this.var_841.willTrigger(param1);
    }

    public function get method_1400(): class_2527 {
        return this.var_2604;
    }

    public function get method_5770(): class_2528 {
        return this.var_3648;
    }

    public function get method_4232(): class_2529 {
        return this.var_4401;
    }
}
}
