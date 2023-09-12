package package_295 {

import away3d.arcane;

import flash.events.Event;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_199.class_2126;
import package_199.class_2129;

import package_293.class_1751;
import package_293.class_2131;

import package_294.class_1750;

import package_372.class_2130;

public class class_1752 extends class_1750 implements class_1751 {


    arcane var var_3982: Boolean;

    arcane var var_1342: Boolean;

    protected var var_1927: class_2128;

    protected var _parent: class_1752;

    protected var var_2379: Matrix3D;

    protected var var_4750: Boolean = true;

    protected var var_2953: class_2130;

    protected var var_89: class_2130;

    protected var _mouseEnabled: Boolean;

    private var var_2898: class_2126;

    private var var_2684: class_2126;

    private var _children: Vector.<class_1752>;

    private var var_4651: Boolean = true;

    private var var_4757: class_2128;

    private var var_2960: Matrix3D;

    private var var_2192: Boolean = true;

    private var var_2827: Vector3D;

    private var var_3950: Boolean = true;

    private var var_2019: Boolean = true;

    private var var_327: Boolean = true;

    private var var_1158: Boolean;

    private var var_3081: Boolean;

    protected var var_3684: Boolean = false;

    public function class_1752() {
        this.var_2379 = new Matrix3D();
        this._children = new Vector.<class_1752>();
        this.var_2960 = new Matrix3D();
        this.var_2827 = new Vector3D();
        super();
    }

    public function get ignoreTransform(): Boolean {
        return this.var_3684;
    }

    public function set ignoreTransform(param1: Boolean): void {
        this.var_3684 = param1;
        this.var_4750 = !param1;
        this.var_2192 = !param1;
        this.var_3950 = !param1;
        if (!param1) {
            this.var_2379.identity();
            this.var_2827.setTo(0, 0, 0);
        }
    }

    arcane function get implicitPartition(): class_2130 {
        return this.var_89;
    }

    arcane function set implicitPartition(param1: class_2130): void {
        var _loc2_: Number = 0;
        var _loc4_: * = null;
        if (param1 == this.var_89) {
            return;
        }
        var _loc3_: uint = uint(this._children.length);
        this.var_89 = param1;
        while (_loc2_ < _loc3_) {
            if (!(_loc4_ = this._children[_loc2_++]).var_2953) {
                _loc4_.arcane::implicitPartition = param1;
            }
        }
    }

    arcane function get isVisible(): Boolean {
        return Boolean(this.var_327) && Boolean(this.var_2019);
    }

    arcane function setParent(param1: class_1752): void {
        this._parent = param1;
        this.method_434();
        if (param1 == null) {
            this.scene = null;
            return;
        }
        this.method_5197();
        this.method_1669();
    }

    private function method_5197(): void {
        var _loc1_: Number = 0;
        if (Boolean(this.var_4750) || Boolean(this.var_3684)) {
            return;
        }
        this.method_3172();
        var _loc2_: uint = uint(this._children.length);
        while (_loc1_ < _loc2_) {
            this._children[_loc1_++].method_5197();
        }
        if (this.var_1158) {
            if (!this.var_2898) {
                this.var_2898 = new class_2126(class_2126.const_2488, this);
            }
            this.dispatchEvent(this.var_2898);
        }
    }

    private function method_1669(): void {
        var _loc1_: Number = 0;
        this.method_5197();
        var _loc2_: uint = uint(this._children.length);
        while (_loc1_ < _loc2_) {
            this._children[_loc1_++].method_1669();
        }
        if (this.var_3081) {
            if (!this.var_2684) {
                this.var_2684 = new class_2126(class_2126.const_579, this);
            }
            this.dispatchEvent(this.var_2684);
        }
    }

    protected function method_434(): void {
        if (Boolean(this._parent) && !this._parent.arcane::var_1342) {
            this.arcane::var_3982 = Boolean(this.parent.arcane::var_3982) && Boolean(this._parent.mouseChildren);
        } else {
            this.arcane::var_3982 = this.mouseChildren;
        }
        var _loc1_: uint = uint(this._children.length);
        var _loc2_: Number = 0;
        while (_loc2_ < _loc1_) {
            this._children[_loc2_].method_434();
            _loc2_++;
        }
    }

    public function get mouseEnabled(): Boolean {
        return this._mouseEnabled;
    }

    public function set mouseEnabled(param1: Boolean): void {
        this._mouseEnabled = param1;
        this.method_434();
    }

    override arcane function invalidateTransform(): void {
        super.arcane::invalidateTransform();
        this.method_5197();
    }

    protected function method_3172(): void {
        this.var_4750 = !this.var_3684;
        this.var_2192 = !this.var_3684;
        this.var_3950 = !this.var_3684;
    }

    protected function method_1607(): void {
        if (Boolean(this._parent) && !this._parent.arcane::var_1342) {
            this.var_2379.copyFrom(this._parent.sceneTransform);
            this.var_2379.prepend(transform);
        } else {
            this.var_2379.copyFrom(transform);
        }
        this.var_4750 = false;
    }

    public function get mouseChildren(): Boolean {
        return this.var_4651;
    }

    public function set mouseChildren(param1: Boolean): void {
        this.var_4651 = param1;
        this.method_434();
    }

    public function get visible(): Boolean {
        return this.var_2019;
    }

    public function set visible(param1: Boolean): void {
        var _loc2_: uint = uint(this._children.length);
        this.var_2019 = param1;
        var _loc3_: Number = 0;
        while (_loc3_ < _loc2_) {
            this._children[_loc3_].method_4709();
            _loc3_++;
        }
    }

    public function get assetType(): String {
        return class_2131.CONTAINER;
    }

    public function get method_3037(): Vector3D {
        if (this.var_3950) {
            this.sceneTransform.copyColumnTo(3, this.var_2827);
            this.var_3950 = false;
        }
        return this.var_2827;
    }

    public function get method_2548(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_2548 + _loc5_.x) < _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_5180(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_5180 + _loc5_.y) < _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_329(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_329 + _loc5_.z) < _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_976(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_976 + _loc5_.x) > _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_4138(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_4138 + _loc5_.y) > _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_2429(): Number {
        var _loc1_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc1_ < _loc2_) {
            if ((_loc4_ = (_loc5_ = this._children[_loc1_++]).method_2429 + _loc5_.z) > _loc3_) {
                _loc3_ = _loc4_;
            }
        }
        return _loc3_;
    }

    public function get method_4119(): class_2130 {
        return this.var_2953;
    }

    public function set method_4119(param1: class_2130): void {
        this.var_2953 = param1;
        this.arcane::implicitPartition = !!param1 ? param1 : (!!this._parent ? this._parent.arcane::implicitPartition : null);
    }

    public function get sceneTransform(): Matrix3D {
        if (this.var_4750) {
            this.method_1607();
        }
        return this.var_2379;
    }

    public function get scene(): class_2128 {
        return this.var_1927;
    }

    public function set scene(param1: class_2128): void {
        var _loc2_: Number = 0;
        var _loc3_: uint = uint(this._children.length);
        while (_loc2_ < _loc3_) {
            this._children[_loc2_++].scene = param1;
        }
        if (this.var_1927 == param1) {
            return;
        }
        if (param1 == null) {
            this.var_4757 = this.var_1927;
        }
        if (this.var_2953 && this.var_4757 && this.var_4757 != this.var_1927) {
            this.method_4119 = null;
        }
        if (param1) {
            this.var_4757 = null;
        }
        this.var_1927 = param1;
        if (this.var_1927) {
            this.var_1927.dispatchEvent(new class_2129(class_2129.const_2610, this));
        } else if (this.var_4757) {
            this.var_4757.dispatchEvent(new class_2129(class_2129.const_1997, this));
        }
    }

    public function get method_2908(): Matrix3D {
        if (this.var_2192) {
            this.var_2960.copyFrom(this.sceneTransform);
            this.var_2960.invert();
            this.var_2192 = false;
        }
        return this.var_2960;
    }

    public function get parent(): class_1752 {
        return this._parent;
    }

    public function contains(param1: class_1752): Boolean {
        return this._children.indexOf(param1) >= 0;
    }

    public function addChild(param1: class_1752): class_1752 {
        if (param1 == null) {
            throw new Error("Parameter child cannot be null.");
        }
        if (param1._parent) {
            param1._parent.removeChild(param1);
        }
        if (!param1.var_2953) {
            param1.arcane::implicitPartition = this.var_89;
        }
        param1.arcane::setParent(this);
        param1.scene = this.var_1927;
        param1.method_5197();
        param1.method_434();
        param1.method_4709();
        this._children.push(param1);
        return param1;
    }

    public function method_3447(...rest): void {
        var _loc2_: * = null;
        for each(_loc2_ in rest) {
            this.addChild(_loc2_);
        }
    }

    public function removeChild(param1: class_1752): void {
        if (param1 == null) {
            throw new Error("Parameter child cannot be null");
        }
        var _loc2_: int = int(this._children.indexOf(param1));
        if (_loc2_ == -1) {
            throw new Error("Parameter is not a child of the caller");
        }
        this.method_5453(_loc2_, param1);
    }

    public function removeChildAt(param1: uint): void {
        var _loc2_: class_1752 = this._children[param1];
        this.method_5453(param1, _loc2_);
    }

    private function method_5453(param1: uint, param2: class_1752): void {
        this._children.splice(param1, 1);
        param2.arcane::setParent(null);
        if (!param2.var_2953) {
            param2.arcane::implicitPartition = null;
        }
    }

    public function getChildAt(param1: uint): class_1752 {
        return this._children[param1];
    }

    public function get numChildren(): uint {
        return this._children.length;
    }

    override public function method_1154(param1: Vector3D, param2: Vector3D = null): void {
        super.method_1154(param1, param2);
        this.method_5197();
    }

    override public function method_3564(param1: Vector3D, param2: Number): void {
        super.method_3564(param1, param2);
        this.method_5197();
    }

    override public function dispose(): void {
        if (this.parent) {
            this.parent.removeChild(this);
        }
    }

    public function method_729(): void {
        this.dispose();
        while (this.numChildren > 0) {
            this.getChildAt(0).dispose();
        }
    }

    override public function clone(): class_1750 {
        var _loc1_: class_1752 = new class_1752();
        _loc1_.method_1773 = method_1773;
        _loc1_.transform = transform;
        _loc1_.method_4119 = this.method_4119;
        _loc1_.name = name;
        var _loc2_: uint = uint(this._children.length);
        var _loc3_: Number = 0;
        while (_loc3_ < _loc2_) {
            _loc1_.addChild(class_1752(this._children[_loc3_].clone()));
            _loc3_++;
        }
        return _loc1_;
    }

    override public function rotate(param1: Vector3D, param2: Number): void {
        super.rotate(param1, param2);
        this.method_5197();
    }

    override public function dispatchEvent(param1: Event): Boolean {
        var _loc2_: Boolean = super.dispatchEvent(param1);
        if (param1.bubbles) {
            if (this._parent) {
                this._parent.dispatchEvent(param1);
            } else if (this.var_1927) {
                this.var_1927.dispatchEvent(param1);
            }
        }
        return _loc2_;
    }

    public function method_4709(): void {
        var _loc1_: uint = uint(this._children.length);
        this.var_327 = Boolean(this._parent.var_2019) && Boolean(this._parent.var_327);
        var _loc2_: Number = 0;
        while (_loc2_ < _loc1_) {
            this._children[_loc2_].method_4709();
            _loc2_++;
        }
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
        switch (param1) {
            case class_2126.const_2488:
                this.var_1158 = true;
                break;
            case class_2126.const_579:
                this.var_3081 = true;
        }
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
        if (hasEventListener(param1)) {
            return;
        }
        switch (param1) {
            case class_2126.const_2488:
                this.var_1158 = false;
                break;
            case class_2126.const_579:
                this.var_3081 = false;
        }
    }
}
}
