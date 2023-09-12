package package_370 {

import away3d.arcane;

import package_304.class_1766;

import package_374.AbstractMethodError;

public class class_2124 {


    protected var var_1786: Boolean = true;

    protected var var_3975: class_1766;

    public function class_2124(param1: class_1766 = null) {
        super();
        this.name_22 = param1;
    }

    protected function method_1391(): void {
        if (this.var_3975 && this.var_3975.arcane::implicitPartition && Boolean(this.var_1786)) {
            this.var_3975.arcane::implicitPartition.arcane::markForUpdate(this.var_3975);
        }
    }

    public function get name_22(): class_1766 {
        return this.var_3975;
    }

    public function set name_22(param1: class_1766): void {
        if (this.var_3975 == param1) {
            return;
        }
        if (Boolean(this.var_3975) && Boolean(this.var_1786)) {
            this.var_3975.arcane::_controller = null;
        }
        this.var_3975 = param1;
        if (Boolean(this.var_3975) && Boolean(this.var_1786)) {
            this.var_3975.arcane::_controller = this;
        }
        this.method_1391();
    }

    public function get method_4101(): Boolean {
        return this.var_1786;
    }

    public function set method_4101(param1: Boolean): void {
        if (this.var_1786 == param1) {
            return;
        }
        this.var_1786 = param1;
        if (this.var_3975) {
            if (this.var_1786) {
                this.var_3975.arcane::_controller = this;
            } else {
                this.var_3975.arcane::_controller = null;
            }
        }
    }

    public function update(param1: Boolean = true): void {
        throw new AbstractMethodError();
    }
}
}
