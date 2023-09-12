package package_307 {

import away3d.arcane;

import package_369.class_2116;

public class class_2449 extends class_2445 {


    private var var_416: Boolean;

    public function class_2449(param1: class_2116 = null, param2: Boolean = true, param3: Boolean = false, param4: Boolean = true) {
        super();
        this.texture = param1;
        this.smooth = param2;
        this.repeat = param3;
        this.mipmap = param4;
    }

    public function get animateUVs(): Boolean {
        return this.var_416;
    }

    public function set animateUVs(param1: Boolean): void {
        this.var_416 = param1;
        method_1082();
    }

    public function get texture(): class_2116 {
        return diffuseMethod.texture;
    }

    public function set texture(param1: class_2116): void {
        diffuseMethod.texture = param1;
    }

    public function get ambientTexture(): class_2116 {
        return ambientMethod.texture;
    }

    public function set ambientTexture(param1: class_2116): void {
        ambientMethod.texture = param1;
        diffuseMethod.arcane::method_555 = Boolean(param1);
    }

    override protected function method_1072(): void {
        var _loc1_: Number = 0;
        var _loc2_: Number = 0;
        super.method_1072();
        if (Boolean(var_3402) && name_108 == 0) {
            var_3402.animateUVs = this.var_416;
        }
        if (var_38) {
            var_38.animateUVs = this.var_416;
        }
        if (var_3658) {
            _loc1_ = 0;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                var_3658[_loc2_].animateUVs = this.var_416;
                _loc2_++;
            }
        }
    }
}
}
