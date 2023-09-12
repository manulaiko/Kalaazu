package package_294 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.display3D.IndexBuffer3D;
import flash.geom.Matrix;
import flash.geom.Matrix3D;

import package_198.class_1208;

import package_304.class_1766;
import package_304.class_2114;

import package_305.class_1767;

import package_307.class_1772;

import package_383.class_2226;

import package_386.class_2575;

public class class_2398 implements class_2133 {


    arcane var var_642: class_1772;

    private var var_1936: class_2114;

    private var var_2331: class_2425;

    arcane var _index: uint;

    private var var_765: Matrix;

    private var var_3311: Boolean;

    private var var_1043: Number = 0;

    private var var_2261: Number = 1;

    private var var_524: Number = 1;

    private var var_4777: Number = 0;

    private var var_2513: Number = 0;

    public var var_1937: class_2575;

    public var var_399: class_2575;

    public function class_2398(param1: class_2425, param2: class_2114, param3: class_1772 = null) {
        super();
        this.var_1936 = param2;
        this.var_2331 = param1;
        this.material = param3;
    }

    public function get method_4862(): Boolean {
        return this.method_1409.method_4862;
    }

    public function get name_131(): Number {
        return this.var_4777;
    }

    public function set name_131(param1: Number): void {
        if (param1 == this.var_4777) {
            return;
        }
        this.var_4777 = param1;
        this.var_3311 = true;
    }

    public function get name_63(): Number {
        return this.var_2513;
    }

    public function set name_63(param1: Number): void {
        if (param1 == this.var_2513) {
            return;
        }
        this.var_2513 = param1;
        this.var_3311 = true;
    }

    public function get name_38(): Number {
        return this.var_2261;
    }

    public function set name_38(param1: Number): void {
        if (param1 == this.var_2261) {
            return;
        }
        this.var_2261 = param1;
        this.var_3311 = true;
    }

    public function get name_72(): Number {
        return this.var_524;
    }

    public function set name_72(param1: Number): void {
        if (param1 == this.var_524) {
            return;
        }
        this.var_524 = param1;
        this.var_3311 = true;
    }

    public function get method_2740(): Number {
        return this.var_1043;
    }

    public function set method_2740(param1: Number): void {
        if (param1 == this.var_1043) {
            return;
        }
        this.var_1043 = param1;
        this.var_3311 = true;
    }

    public function get method_1409(): class_1766 {
        return this.var_1936;
    }

    public function get subGeometry(): class_2425 {
        return this.var_2331;
    }

    public function set subGeometry(param1: class_2425): void {
        this.var_2331 = param1;
    }

    public function get material(): class_1772 {
        return this.arcane::var_642 || this.var_1936.material;
    }

    public function set material(param1: class_1772): void {
        if (this.arcane::var_642) {
            this.arcane::var_642.arcane::method_4342(this);
        }
        this.arcane::var_642 = param1;
        if (this.arcane::var_642) {
            this.arcane::var_642.arcane::method_3466(this);
        }
    }

    public function get sceneTransform(): Matrix3D {
        return this.var_1936.sceneTransform;
    }

    public function get method_2908(): Matrix3D {
        return this.var_1936.method_2908;
    }

    public function method_748(param1: int, param2: class_1208): void {
        this.var_2331.method_748(param1, param2);
    }

    public function method_298(param1: int, param2: class_1208): void {
        this.var_2331.method_298(param1, param2);
    }

    public function method_4672(param1: int, param2: class_1208): void {
        this.var_2331.method_4672(param1, param2);
    }

    public function method_2801(param1: int, param2: class_1208): void {
        this.var_2331.method_2801(param1, param2);
    }

    public function method_1094(param1: int, param2: class_1208): void {
        this.var_2331.method_1094(param1, param2);
    }

    public function method_612(param1: class_1208): IndexBuffer3D {
        return this.var_2331.method_612(param1);
    }

    public function get name_42(): uint {
        return this.var_2331.name_42;
    }

    public function get animator(): class_2120 {
        return this.var_1936.animator;
    }

    public function get mouseEnabled(): Boolean {
        return Boolean(this.var_1936.mouseEnabled) || Boolean(this.var_1936.arcane::var_3982);
    }

    public function get method_825(): Boolean {
        return this.var_1936.method_825;
    }

    arcane function get method_4295(): class_2114 {
        return this.var_1936;
    }

    arcane function set method_4295(param1: class_2114): void {
        this.var_1936 = param1;
    }

    public function get method_2164(): Matrix {
        if (this.var_3311) {
            this.method_6167();
        }
        return this.var_765;
    }

    private function method_6167(): void {
        this.var_765 = this.var_765 || new Matrix();
        this.var_765.identity();
        if (this.var_1043 != 0) {
            this.var_765.rotate(this.var_1043);
        }
        if (this.var_2261 != 1 || this.var_524 != 1) {
            this.var_765.scale(this.var_2261, this.var_524);
        }
        this.var_765.translate(this.var_4777, this.var_2513);
        this.var_3311 = false;
    }

    public function dispose(): void {
        this.material = null;
    }

    public function get name_104(): Vector.<Number> {
        return this.var_2331.name_104;
    }

    public function get indexData(): Vector.<uint> {
        return this.var_2331.indexData;
    }

    public function get method_868(): Vector.<Number> {
        return this.var_2331.method_868;
    }

    public function get bounds(): class_2226 {
        return this.var_1936.bounds;
    }

    public function get visible(): Boolean {
        return this.var_1936.visible;
    }

    public function get numVertices(): uint {
        return this.var_2331.numVertices;
    }

    public function get method_4110(): uint {
        return this.var_2331.method_4110;
    }

    public function get method_2639(): uint {
        return this.var_2331.method_2639;
    }

    public function get method_4313(): Vector.<Number> {
        return this.var_2331.method_4313;
    }

    public function get method_303(): Vector.<Number> {
        return this.var_2331.method_303;
    }

    public function get method_2585(): uint {
        return this.var_2331.method_2585;
    }

    public function get method_720(): uint {
        return this.var_2331.method_720;
    }

    public function get method_4530(): uint {
        return this.var_2331.method_4530;
    }

    public function get method_4538(): uint {
        return this.var_2331.method_4538;
    }

    public function method_846(param1: class_1767): Matrix3D {
        return this.var_1936.sceneTransform;
    }

    public function get name_55(): Object {
        return this.var_1936.name_55;
    }
}
}
