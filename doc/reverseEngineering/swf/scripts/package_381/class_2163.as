package package_381 {

import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.settings.Settings;

import package_10.class_305;

import package_200.Settings3D;
import package_200.class_1771;

import package_27.class_82;

import package_36.class_184;

public class class_2163 extends class_2160 {


    private var _mapView: class_1211;

    private var var_568: class_184;

    public function class_2163(param1: class_1211, param2: class_184) {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        this.var_568 = param2;
        this._mapView = param1;
        if (Boolean(Settings3D.effects.high.value) && param2.name_25 != null && Boolean(param2.name_25.has3D)) {
            _loc3_ = new class_305(param2.x, param2.y, param2.z);
            super(param2, param2.name_25.resKey + ".zip", _loc3_, param2.target, true, 0.5);
            method_3722("flash", this.method_1445);
            if ((_loc4_ = int(this.var_568.name_25.method_3142())) != -1) {
                class_82.playSoundEffect(_loc4_, false, false, this.var_568.x, this.var_568.y);
            }
            if (Settings3D.effects.max.value && Settings.qualityExplosion.value && param2.name_25.method_2768 == 0 && param2.name_25.getPatternID() == 0) {
                new class_2160(param2, "ship_debris.zip", _loc3_, param2.target, true, 0.5);
            }
        }
    }

    private function method_1445(): void {
        var _loc1_: class_1771 = Settings3D.const_1813;
        class_1210.instance.name_10.method_6370(this.var_568.x, 0, -Number(this.var_568.y), _loc1_.color.value, _loc1_.fallOff.value, _loc1_.diffuse.value, _loc1_.specular.value, 0.1);
    }
}
}
