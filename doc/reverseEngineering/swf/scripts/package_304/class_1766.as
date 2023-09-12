package package_304 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_293.class_2131;

import package_295.class_1752;
import package_295.class_2128;

import package_296.class_1754;
import package_296.class_2228;

import package_371.class_2125;

import package_372.class_2130;
import package_372.class_2225;

import package_374.AbstractMethodError;

import package_383.class_2226;
import package_383.class_2227;

public class class_1766 extends class_1752 {


    private var var_1580: Boolean;

    private var var_3882: class_2225;

    private var var_1891: Boolean = false;

    private var var_4333: Boolean;

    arcane var var_643: class_1754;

    arcane var var_1365: class_2228;

    arcane var var_1940: Boolean;

    protected var _bounds: class_2226;

    protected var var_2006: Boolean = true;

    private var var_1097: class_2226;

    arcane var var_2055: Boolean = true;

    public function class_1766() {
        super();
        this._bounds = this.method_1594();
        this.var_1097 = this.method_1594();
    }

    override public function set ignoreTransform(param1: Boolean): void {
        if (var_1927) {
            var_1927.arcane::method_6509(this);
        }
        super.ignoreTransform = param1;
    }

    public function get method_4862(): Boolean {
        return this.var_4333;
    }

    public function set method_4862(param1: Boolean): void {
        this.var_4333 = param1;
    }

    public function get method_3760(): Boolean {
        return this.arcane::var_1940;
    }

    public function set method_3760(param1: Boolean): void {
        this.arcane::var_1940 = param1;
    }

    public function get method_3450(): class_1754 {
        if (!this.arcane::var_643) {
            this.arcane::var_643 = new class_1754(this);
        }
        return this.arcane::var_643;
    }

    arcane function method_2840(param1: Number, param2: Boolean): Boolean {
        param1 = param1;
        param2 = param2;
        return true;
    }

    public function get method_669(): Boolean {
        return this.var_1580;
    }

    public function set method_669(param1: Boolean): void {
        if (param1 == this.var_1580) {
            return;
        }
        this.var_1580 = param1;
        if (this.var_1580) {
            this.method_2848();
        } else {
            this.method_3386();
        }
    }

    override public function get method_2548(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.min.x;
    }

    override public function get method_5180(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.min.y;
    }

    override public function get method_329(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.min.z;
    }

    override public function get method_976(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.max.x;
    }

    override public function get method_4138(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.max.y;
    }

    override public function get method_2429(): Number {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds.max.z;
    }

    public function get bounds(): class_2226 {
        if (this.var_2006) {
            this.updateBounds();
        }
        return this._bounds;
    }

    public function set bounds(param1: class_2226): void {
        this.method_3386();
        this._bounds = param1;
        this.var_1097 = param1.clone();
        this.method_1513();
        if (this.var_1580) {
            this.method_2848();
        }
    }

    public function get method_5720(): class_2226 {
        if (this.arcane::var_2055) {
            this.method_2498();
        }
        return this.var_1097;
    }

    private function method_2498(): void {
        this.var_1097.method_2232(this.bounds, sceneTransform);
        this.arcane::var_2055 = false;
    }

    override arcane function set implicitPartition(param1: class_2130): void {
        if (param1 == var_89) {
            return;
        }
        if (var_89) {
            this.method_2218();
        }
        super.arcane::implicitPartition = param1;
        this.method_2216();
    }

    override public function set scene(param1: class_2128): void {
        if (param1 == var_1927) {
            return;
        }
        if (var_1927) {
            var_1927.arcane::method_5195(this);
        }
        if (param1) {
            param1.arcane::method_3966(this);
        }
        super.scene = param1;
    }

    override public function get assetType(): String {
        return class_2131.const_2930;
    }

    public function get pickingCollider(): class_2228 {
        return this.arcane::var_1365;
    }

    public function set pickingCollider(param1: class_2228): void {
        this.arcane::var_1365 = param1;
    }

    public function method_2492(): class_2225 {
        var _loc1_: * = this.var_3882 || this.method_1737();
        this.var_3882 = this.var_3882 || this.method_1737();
        return _loc1_;
    }

    public function method_4598(param1: Vector3D, param2: Vector3D): Boolean {
        if (!this.method_3450.var_2096) {
            this.method_3450.var_2096 = new Vector3D();
        }
        if (!this.method_3450.var_2996) {
            this.method_3450.var_2996 = new Vector3D();
        }
        if (!this.method_3450.var_2450) {
            this.method_3450.var_2450 = new Vector3D();
        }
        var _loc3_: Vector3D = this.method_3450.var_2096;
        var _loc4_: Vector3D = this.method_3450.var_2996;
        class_2125.transformVector(method_2908, param1, _loc3_);
        class_2125.deltaTransformVector(method_2908, param2, _loc4_);
        var _loc5_: Number;
        if ((_loc5_ = Number(this.bounds.method_2610(_loc3_, _loc4_, this.method_3450.var_2450))) < 0) {
            return false;
        }
        this.method_3450.var_2865 = _loc5_;
        this.method_3450.name_34 = param1;
        this.method_3450.rayDirection = param2;
        this.method_3450.var_3447 = _loc5_ == 0;
        return true;
    }

    protected function method_1737(): class_2225 {
        throw new AbstractMethodError();
    }

    protected function method_1594(): class_2226 {
        return new class_2227();
    }

    protected function updateBounds(): void {
        throw new AbstractMethodError();
    }

    override protected function method_3172(): void {
        if (!var_3684) {
            super.method_3172();
            this.arcane::var_2055 = true;
            this.method_1132();
        }
    }

    protected function method_1513(): void {
        this.var_2006 = true;
        this.arcane::var_2055 = true;
        this.method_1132();
    }

    override protected function method_434(): void {
        var _loc1_: * = null;
        if (Boolean(_parent) && !this.pickingCollider) {
            if (_parent is class_1766) {
                _loc1_ = class_1766(_parent).pickingCollider;
                if (_loc1_) {
                    this.pickingCollider = _loc1_;
                }
            }
        }
        super.method_434();
    }

    private function method_1132(): void {
        if (var_1927) {
            var_1927.arcane::method_6509(this);
        }
    }

    private function method_2216(): void {
        if (var_1927) {
            var_1927.arcane::method_6485(this);
        }
    }

    private function method_2218(): void {
        if (var_1927) {
            var_1927.arcane::method_2077(this);
        }
    }

    private function method_2848(): void {
        if (!this.var_1891) {
            this.var_1891 = true;
            addChild(this._bounds.method_2861);
        }
    }

    private function method_3386(): void {
        if (this.var_1891) {
            this.var_1891 = false;
            removeChild(this._bounds.method_2861);
            this._bounds.method_4969();
        }
    }

    arcane function method_6458(): void {
        if (arcane::_controller) {
            arcane::_controller.update();
        }
    }
}
}
