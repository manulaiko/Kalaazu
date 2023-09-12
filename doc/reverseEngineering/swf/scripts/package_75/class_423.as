package package_75 {

import flash.display.Bitmap;

import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_1493;

import package_19.class_68;
import package_19.class_70;

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_423 extends class_348 {


    public const update: class_68 = new class_70();

    private var var_478: class_1493;

    private var _icon: Bitmap;

    public function class_423(param1: class_85, param2: Bitmap) {
        this._icon = param2;
        super(class_338.const_459, param1, const_2311);
    }

    public function get icon(): Bitmap {
        return this._icon;
    }

    override public function activate(): Boolean {
        this.var_478 = class_86(source).addTrait(new class_1493(this)) as class_1493;
        return super.activate();
    }

    override public function deactivate(): void {
        if (this.var_478) {
            class_86(source).removeTrait(this.var_478);
            this.var_478 = null;
        }
        super.deactivate();
    }

    public function method_1543(param1: int, param2: int): void {
        this.update.dispatch(param1, param2);
    }
}
}
