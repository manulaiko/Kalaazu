package package_307 {

import away3d.arcane;

import package_369.class_2116;

public class class_2708 extends class_1776 {


    private var var_262: Vector.<class_2116>;

    private var var_3270: Vector.<class_2116>;

    private var var_624: Vector.<class_2116>;

    private var var_4090: class_2116;

    private var var_3101: class_2116;

    private var var_4391: class_2116;

    private var var_3241: uint;

    public function class_2708(param1: Vector.<class_2116>, param2: Vector.<class_2116> = null, param3: Vector.<class_2116> = null, param4: Boolean = true, param5: Boolean = false, param6: Boolean = true) {
        this.var_262 = param1;
        this.var_3270 = param2;
        this.var_624 = param3;
        this.method_3355();
        super(this.var_4090, param4, param5, param6);
        if (this.var_3101) {
            this.normalMap = this.var_3101;
        }
        if (this.var_4391) {
            this.specularMap = this.var_4391;
        }
    }

    private function method_3355(): void {
        if (!this.var_262 || this.var_262.length == 0) {
            throw new Error("you must pass at least one bitmapdata into diffuses param!");
        }
        this.var_4090 = this.var_262[0];
        if (Boolean(this.var_3270) && this.var_3270.length > 0) {
            if (this.var_3270.length != this.var_262.length) {
                throw new Error("The amount of normals bitmapDatas must be same as the amount of diffuses param!");
            }
            this.var_3101 = this.var_3270[0];
        }
        if (Boolean(this.var_624) && this.var_624.length > 0) {
            if (this.var_624.length != this.var_262.length) {
                throw new Error("The amount of normals bitmapDatas must be same as the amount of diffuses param!");
            }
            this.var_4391 = this.var_624[0];
        }
        this.var_3241 = 0;
    }

    arcane function swap(param1: uint = 0): Boolean {
        if (this.var_3241 != param1) {
            this.var_3241 = param1;
            this.var_4090 = this.var_262[param1];
            this.texture = this.var_4090;
            if (this.var_3101) {
                this.normalMap = this.var_3101 = this.var_3270[param1];
            }
            if (this.var_4391) {
                this.specularMap = this.var_4391 = this.var_624[param1];
            }
            return true;
        }
        return false;
    }
}
}
