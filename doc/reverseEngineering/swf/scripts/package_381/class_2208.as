package package_381 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_373.class_2134;

import package_75.class_1876;

public class class_2208 implements class_80, IDisposable {


    private var var_2976: class_2134;

    private var var_4557: class_2134;

    private var _effect: class_1876;

    private var var_4523: class_2135;

    public function class_2208(param1: class_1211, param2: class_1876) {
        super();
        this._effect = param2;
        this.var_2976 = new class_2134(UberAssetsLib.instance.getDescriptor("citadel_fortify", UberAssetsLib.LIB_SHIPS).display3D[0]);
        this.var_2976.ready.add(this.method_2306);
        this.var_4523 = param1.method_3658.method_6501(param2.source.method_1954(class_306)) as class_2135;
        if (String(this.var_4523.descriptor.@citadel) != "true") {
            this.var_4557 = new class_2134(UberAssetsLib.instance.getDescriptor("ship_citadel", UberAssetsLib.LIB_SHIPS).display3D[0]);
            this.var_4557.visible = false;
            this.var_2976.addChild(this.var_4557);
        }
        class_86(this._effect.source).lockPattern();
        class_1210.instance.method_3528.method_1164(this);
        class_1210.instance.method_3528.method_1616.addChild(this.var_2976);
    }

    public function updateObj(param1: Number): void {
        this.var_2976.rotationY = Number(class_86(this._effect.source).rotation.degrees) - 90;
        this.var_2976.moveTo(this._effect.source.method_1474, this._effect.source.method_1121, this._effect.source.method_6123);
    }

    public function disposeView(param1: Boolean = false): void {
        class_86(this._effect.source).unlockPattern();
        if (this.var_2976) {
            this.var_2976.method_6420("close", this.method_4338);
        }
    }

    private function method_2306(): void {
        if (this.var_4523) {
            if (this.var_4557) {
                this.var_4557.visible = true;
                this.var_4523.visible = false;
            }
            this.var_4523.method_4400();
        }
        this.var_2976.method_6420("open");
    }

    private function method_4338(): void {
        if (this.var_4523) {
            if (this.var_4557) {
                this.var_4557.disposeView(true);
                this.var_4557 = null;
            }
            this.var_4523.visible = true;
            this.var_4523.method_2788();
        }
        if (this.var_2976) {
            class_1210.instance.method_3528.method_3592(this);
            this.var_2976.ready.remove(this.method_2306);
            this.var_2976.disposeView(true);
            this.var_2976 = null;
        }
    }
}
}
