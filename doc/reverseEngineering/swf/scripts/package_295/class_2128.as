package package_295 {

import away3d.arcane;

import flash.events.EventDispatcher;

import package_199.class_2129;

import package_304.class_1766;

import package_372.class_2130;
import package_372.class_2224;

import package_376.class_2144;

public class class_2128 extends EventDispatcher {


    arcane var var_4020: class_1752;

    private var var_2108: Vector.<class_2130>;

    public function class_2128() {
        super();
        this.var_2108 = new Vector.<class_2130>();
        this.arcane::var_4020 = new class_1752();
        this.arcane::var_4020.scene = this;
        this.arcane::var_4020.arcane::var_1342 = true;
        this.arcane::var_4020.method_4119 = new class_2130(new class_2224());
    }

    public function method_2653(param1: class_2144): void {
        var _loc2_: Number = 0;
        var _loc3_: uint = uint(this.var_2108.length);
        param1.scene = this;
        while (_loc2_ < _loc3_) {
            this.var_2108[_loc2_++].traverse(param1);
        }
    }

    public function get method_4119(): class_2130 {
        return this.arcane::var_4020.method_4119;
    }

    public function set method_4119(param1: class_2130): void {
        this.arcane::var_4020.method_4119 = param1;
        dispatchEvent(new class_2129(class_2129.const_244, this.arcane::var_4020));
    }

    public function contains(param1: class_1752): Boolean {
        return this.arcane::var_4020.contains(param1);
    }

    public function addChild(param1: class_1752): class_1752 {
        return this.arcane::var_4020.addChild(param1);
    }

    public function removeChild(param1: class_1752): void {
        this.arcane::var_4020.removeChild(param1);
    }

    public function removeChildAt(param1: uint): void {
        this.arcane::var_4020.removeChildAt(param1);
    }

    public function getChildAt(param1: uint): class_1752 {
        return this.arcane::var_4020.getChildAt(param1);
    }

    public function get numChildren(): uint {
        return this.arcane::var_4020.numChildren;
    }

    arcane function method_3966(param1: class_1766): void {
        var _loc2_: class_2130 = param1.arcane::implicitPartition;
        this.method_518(_loc2_);
        _loc2_.arcane::markForUpdate(param1);
    }

    arcane function method_5195(param1: class_1766): void {
        param1.arcane::implicitPartition.arcane::removeEntity(param1);
    }

    arcane function method_6509(param1: class_1766): void {
        param1.arcane::implicitPartition.arcane::markForUpdate(param1);
    }

    arcane function method_6485(param1: class_1766): void {
        this.method_518(param1.arcane::implicitPartition);
    }

    arcane function method_2077(param1: class_1766): void {
        param1.arcane::implicitPartition.arcane::removeEntity(param1);
    }

    protected function method_518(param1: class_2130): void {
        if (this.var_2108.indexOf(param1) == -1) {
            this.var_2108.push(param1);
        }
    }
}
}
