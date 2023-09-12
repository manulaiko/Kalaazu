package package_364 {

import away3d.arcane;

import flash.geom.Matrix3D;

import package_199.class_2391;

import package_293.class_2131;

import package_294.class_2133;

import package_304.class_1766;

import package_372.class_2225;
import package_372.class_2392;

import package_374.AbstractMethodError;

import package_429.class_2393;

public class class_2102 extends class_1766 {


    private var _color: uint = 16777215;

    private var var_2418: Number = 1;

    private var var_1505: Number = 1;

    private var var_607: Number = 1;

    private var var_1434: uint = 16777215;

    private var var_3307: Number = 0;

    arcane var var_1211: Number = 0;

    arcane var var_1656: Number = 0;

    arcane var var_363: Number = 0;

    private var var_2344: Number = 1;

    arcane var var_3500: Number = 1;

    arcane var var_1919: Number = 1;

    arcane var var_2424: Number = 1;

    private var var_830: Number = 1;

    arcane var var_3866: Number = 1;

    arcane var var_2970: Number = 1;

    arcane var var_1455: Number = 1;

    private var var_3249: Boolean;

    private var var_2517: class_2393;

    public function class_2102() {
        super();
    }

    public function get method_825(): Boolean {
        return this.var_3249;
    }

    public function set method_825(param1: Boolean): void {
        if (this.var_3249 == param1) {
            return;
        }
        this.var_3249 = param1;
        if (param1) {
            this.var_2517 = this.var_2517 || this.method_970();
            this.var_2517.light = this;
        } else {
            this.var_2517.dispose();
            this.var_2517 = null;
        }
        dispatchEvent(new class_2391(class_2391.const_2614));
    }

    protected function method_970(): class_2393 {
        throw new AbstractMethodError();
    }

    public function get specular(): Number {
        return this.var_2344;
    }

    public function set specular(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        }
        this.var_2344 = param1;
        this.method_861();
    }

    public function get diffuse(): Number {
        return this.var_830;
    }

    public function set diffuse(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        }
        this.var_830 = param1;
        this.method_5316();
    }

    public function get color(): uint {
        return this._color;
    }

    public function set color(param1: uint): void {
        this._color = param1;
        this.var_2418 = (Number(this._color) >> 16 & 255) / 255;
        this.var_1505 = (Number(this._color) >> 8 & 255) / 255;
        this.var_607 = (Number(this._color) & 255) / 255;
        this.method_5316();
        this.method_861();
    }

    public function get ambient(): Number {
        return this.var_3307;
    }

    public function set ambient(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        } else if (param1 > 1) {
            param1 = 1;
        }
        this.var_3307 = param1;
        this.method_860();
    }

    public function get ambientColor(): uint {
        return this.var_1434;
    }

    public function set ambientColor(param1: uint): void {
        this.var_1434 = param1;
        this.method_860();
    }

    private function method_860(): void {
        this.arcane::var_1211 = (Number(this.var_1434) >> 16 & 255) / 255 * Number(this.var_3307);
        this.arcane::var_1656 = (Number(this.var_1434) >> 8 & 255) / 255 * Number(this.var_3307);
        this.arcane::var_363 = (Number(this.var_1434) & 255) / 255 * Number(this.var_3307);
    }

    arcane function method_3242(param1: class_2133, param2: Matrix3D = null): Matrix3D {
        throw new AbstractMethodError();
    }

    override protected function method_1737(): class_2225 {
        return new class_2392(this);
    }

    override public function get assetType(): String {
        return class_2131.const_1414;
    }

    private function method_861(): void {
        this.arcane::var_3500 = Number(this.var_2418) * Number(this.var_2344);
        this.arcane::var_1919 = Number(this.var_1505) * Number(this.var_2344);
        this.arcane::var_2424 = Number(this.var_607) * Number(this.var_2344);
    }

    private function method_5316(): void {
        this.arcane::var_3866 = Number(this.var_2418) * Number(this.var_830);
        this.arcane::var_2970 = Number(this.var_1505) * Number(this.var_830);
        this.arcane::var_1455 = Number(this.var_607) * Number(this.var_830);
    }

    public function get method_493(): class_2393 {
        return this.var_2517;
    }

    public function set method_493(param1: class_2393): void {
        this.var_2517 = param1;
        this.var_2517.light = this;
    }
}
}
