package package_436 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.display3D.IndexBuffer3D;
import flash.geom.Matrix;
import flash.geom.Matrix3D;

import package_198.class_1208;

import package_293.class_2131;

import package_294.class_2133;
import package_294.class_2427;

import package_304.class_1766;

import package_305.class_1767;

import package_307.class_1772;
import package_307.class_2587;

import package_369.class_2570;

import package_372.class_2225;
import package_372.class_2586;

import package_374.AbstractMethodError;

import package_383.class_2226;
import package_383.class_2231;

public class class_2417 extends class_1766 implements class_2133 {


    private var name_69: class_2427;

    private var var_642: class_2587;

    private var var_765: Matrix;

    private var _animator: class_2120;

    public function class_2417(param1: class_2570) {
        this.var_765 = new Matrix();
        super();
        this.var_642 = new class_2587(param1);
        this.var_642.arcane::method_3466(this);
        this.name_69 = new class_2427();
        this.method_389(this.name_69);
    }

    public function get animator(): class_2120 {
        return this._animator;
    }

    override protected function method_1594(): class_2226 {
        return new class_2231();
    }

    public function get name_55(): Object {
        return null;
    }

    public function method_748(param1: int, param2: class_1208): void {
        this.name_69.method_748(param1, param2);
    }

    public function method_2801(param1: int, param2: class_1208): void {
    }

    public function method_298(param1: int, param2: class_1208): void {
    }

    public function method_4672(param1: int, param2: class_1208): void {
    }

    public function method_1094(param1: int, param2: class_1208): void {
    }

    public function method_612(param1: class_1208): IndexBuffer3D {
        return this.name_69.method_612(param1);
    }

    public function get name_42(): uint {
        return this.name_69.name_42;
    }

    public function get method_1409(): class_1766 {
        return null;
    }

    public function get material(): class_1772 {
        return this.var_642;
    }

    public function set material(param1: class_1772): void {
        throw new AbstractMethodError("Unsupported method!");
    }

    override public function get assetType(): String {
        return class_2131.const_563;
    }

    override protected function method_1513(): void {
    }

    override protected function method_1737(): class_2225 {
        return new class_2586(this);
    }

    override protected function updateBounds(): void {
        var_2006 = false;
    }

    private function method_389(param1: class_2427): void {
        var _loc2_: Vector.<Number> = new <Number>[-1, 1, -1, 1, 1, -1, 1, 1, 1, -1, 1, 1, -1, -1, -1, 1, -1, -1, 1, -1, 1, -1, -1, 1];
        _loc2_.fixed = true;
        var _loc3_: Vector.<uint> = new <uint>[0, 1, 2, 2, 3, 0, 6, 5, 4, 4, 7, 6, 2, 6, 7, 7, 3, 2, 4, 5, 1, 1, 0, 4, 4, 0, 3, 3, 7, 4, 2, 1, 5, 5, 6, 2];
        param1.updateVertexData(_loc2_);
        param1.updateIndexData(_loc3_);
    }

    public function get method_825(): Boolean {
        return false;
    }

    public function get method_2164(): Matrix {
        return this.var_765;
    }

    public function get name_104(): Vector.<Number> {
        return this.name_69.name_104;
    }

    public function get indexData(): Vector.<uint> {
        return this.name_69.indexData;
    }

    public function get method_868(): Vector.<Number> {
        return this.name_69.method_868;
    }

    public function get numVertices(): uint {
        return this.name_69.numVertices;
    }

    public function get method_4110(): uint {
        return this.name_69.method_4110;
    }

    public function get method_4313(): Vector.<Number> {
        return this.name_69.method_4313;
    }

    public function get method_303(): Vector.<Number> {
        return this.name_69.method_303;
    }

    public function get method_720(): int {
        return this.name_69.method_720;
    }

    public function get method_4530(): int {
        return this.name_69.method_4530;
    }

    public function get method_4538(): int {
        return this.name_69.method_4538;
    }

    public function method_846(param1: class_1767): Matrix3D {
        return var_2379;
    }
}
}
