package package_444 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_119.class_1191;

import package_373.class_2134;

public class class_2473 implements IDisposable {


    private var var_176: class_1191;

    private var var_127: class_2135;

    private var var_1394: class_2134;

    public function class_2473(param1: class_1191, param2: class_2135) {
        super();
        this.var_176 = param1;
        this.var_127 = param2;
        this.var_176.const_523.changed.add(this.method_357);
        this.method_357();
    }

    public function disposeView(param1: Boolean = false): void {
        if (this.var_1394) {
            this.var_1394.disposeView();
            if (this.var_1394.parent) {
                this.var_1394.parent.removeChild(this.var_1394);
            }
        }
        if (this.var_176) {
            this.var_176.const_523.changed.remove(this.method_357);
            this.var_176 = null;
        }
    }

    private function method_357(): void {
        if (this.var_1394) {
            this.var_1394.disposeView();
            if (this.var_1394.parent) {
                this.var_1394.parent.removeChild(this.var_1394);
            }
        }
        var _loc1_: XML = UberAssetsLib.instance.getDescriptor("beacon_" + this.var_176.const_523.value, UberAssetsLib.LIB_COLLECTABLES);
        if (_loc1_) {
            this.var_1394 = new class_2134(_loc1_.display3D[0]);
            this.var_1394.scaleX = this.var_1394.scaleY = this.var_1394.scaleZ = 0.7;
            this.var_1394.y = 120;
            this.var_127.addChild(this.var_1394);
        }
    }
}
}
