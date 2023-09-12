package package_199 {

import away3d.arcane;

import flash.events.Event;
import flash.geom.Point;
import flash.geom.Vector3D;

import package_294.class_2133;

import package_295.class_1752;
import package_295.class_1762;

import package_307.class_1772;

public class class_2097 extends Event {

    public static const TOUCH_END: String = "touchEnd3d";

    public static const TOUCH_BEGIN: String = "touchBegin3d";

    public static const TOUCH_MOVE: String = "touchMove3d";

    public static const TOUCH_OUT: String = "touchOut3d";

    public static const TOUCH_OVER: String = "touchOver3d";


    arcane var var_2498: Boolean = true;

    arcane var var_1046: class_2097;

    public var var_4548: Number;

    public var var_2761: Number;

    public var view: class_1762;

    public var object: class_1752;

    public var var_3785: class_2133;

    public var material: class_1772;

    public var var_247: Point;

    public var index: uint;

    public var var_4499: uint;

    public var name_53: Vector3D;

    public var var_2450: Vector3D;

    public var ctrlKey: Boolean;

    public var altKey: Boolean;

    public var shiftKey: Boolean;

    public var touchPointID: int;

    public function class_2097(param1: String) {
        super(param1, true, true);
    }

    override public function get bubbles(): Boolean {
        return super.bubbles && Boolean(this.arcane::var_2498);
    }

    override public function stopPropagation(): void {
        super.stopPropagation();
        this.arcane::var_2498 = false;
        if (this.arcane::var_1046) {
            this.arcane::var_1046.arcane::var_2498 = false;
        }
    }

    override public function stopImmediatePropagation(): void {
        super.stopImmediatePropagation();
        this.arcane::var_2498 = false;
        if (this.arcane::var_1046) {
            this.arcane::var_1046.arcane::var_2498 = false;
        }
    }

    override public function clone(): Event {
        var _loc1_: class_2097 = new class_2097(type);
        if (isDefaultPrevented()) {
            _loc1_.preventDefault();
        }
        _loc1_.var_4548 = this.var_4548;
        _loc1_.var_2761 = this.var_2761;
        _loc1_.view = this.view;
        _loc1_.object = this.object;
        _loc1_.var_3785 = this.var_3785;
        _loc1_.material = this.material;
        _loc1_.var_247 = this.var_247;
        _loc1_.name_53 = this.name_53;
        _loc1_.var_2450 = this.var_2450;
        _loc1_.index = this.index;
        _loc1_.var_4499 = this.var_4499;
        _loc1_.ctrlKey = this.ctrlKey;
        _loc1_.shiftKey = this.shiftKey;
        _loc1_.arcane::var_1046 = this;
        return _loc1_;
    }

    public function get method_3037(): Vector3D {
        if (this.object is class_1752) {
            return class_1752(this.object).sceneTransform.transformVector(this.name_53);
        }
        return this.name_53;
    }

    public function get method_5753(): Vector3D {
        var _loc1_: * = null;
        if (this.object is class_1752) {
            _loc1_ = class_1752(this.object).sceneTransform.deltaTransformVector(this.var_2450);
            _loc1_.normalize();
            return _loc1_;
        }
        return this.var_2450;
    }
}
}
