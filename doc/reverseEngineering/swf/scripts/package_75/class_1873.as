package package_75 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_113.class_404;

import package_29.class_267;
import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

import package_9.class_50;

public class class_1873 extends class_348 {


    private var _icon: class_267;

    public function class_1873(param1: class_85) {
        super(class_338.const_2643, param1, const_2311);
        this._icon = new class_404("mirrorControls");
    }

    override public function activate(): Boolean {
        class_86(source).addTrait(this._icon);
        if (true) {
            class_50.getInstance().method_1772.mirrorControls();
        }
        return super.activate();
    }

    override public function deactivate(): void {
        if (true) {
            class_50.getInstance().method_1772.method_6216();
        }
        if (this._icon) {
            source.removeTrait(this._icon);
            this._icon = null;
        }
        super.deactivate();
    }
}
}
