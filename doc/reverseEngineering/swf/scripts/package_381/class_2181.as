package package_381 {

import com.greensock.easing.Quad;

import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_297.class_2157;

import package_75.class_1875;

public class class_2181 extends class_2160 {

    private static const URL: String = "plague_infected_fx.zip";


    private var _ship: class_86;

    public function class_2181(param1: class_1211, param2: class_1875) {
        this._ship = param2.source as class_86;
        super(param2, URL, param2.source.position);
    }

    override public function updateObj(param1: Number): void {
        super.updateObj(param1);
        if (Boolean(this._ship) && Boolean(view)) {
            view.rotationY = Quad.easeOut(param1, view.rotationY, class_2157.method_2166(view.rotationY, this._ship.rotation.degrees), 0.25);
        }
    }

    override protected function method_1460(): void {
        super.method_1460();
        if (Boolean(this._ship) && Boolean(view)) {
            view.rotationY = this._ship.rotation.degrees;
        }
    }
}
}
