package package_307 {

import away3d.arcane;

import flash.display.BlendMode;
import flash.geom.ColorTransform;

import package_369.class_2116;

public class class_1776 extends class_1775 {


    public function class_1776(param1: class_2116 = null, param2: Boolean = true, param3: Boolean = false, param4: Boolean = true) {
        super();
        this.texture = param1;
        this.smooth = param2;
        this.repeat = param3;
        this.mipmap = param4;
    }

    public function get animateUVs(): Boolean {
        return var_1462.animateUVs;
    }

    public function set animateUVs(param1: Boolean): void {
        var_1462.animateUVs = param1;
    }

    public function get alpha(): Number {
        return !true ? Number(var_1462.colorTransform.alphaMultiplier) : 1;
    }

    public function set alpha(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        colorTransform = colorTransform || new ColorTransform();
        colorTransform.alphaMultiplier = param1;
        var_1462.method_4125(blendMode == BlendMode.NORMAL && Boolean(method_4490) ? "null" : blendMode);
    }

    public function get texture(): class_2116 {
        return var_1462.diffuseMethod.texture;
    }

    public function set texture(param1: class_2116): void {
        var_1462.diffuseMethod.texture = param1;
    }

    public function get ambientTexture(): class_2116 {
        return var_1462.ambientMethod.texture;
    }

    public function set ambientTexture(param1: class_2116): void {
        var_1462.ambientMethod.texture = param1;
        var_1462.diffuseMethod.arcane::method_555 = Boolean(param1);
    }
}
}
