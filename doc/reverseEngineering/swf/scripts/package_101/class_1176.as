package package_101 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_35.class_338;

import package_9.class_50;

public class class_1176 extends class_1175 {


    public function class_1176() {
        super();
    }

    override public function method_6037(): void {
        super.method_6037();
        ship.info.name_32.changed.add(this.method_1328);
        ship.info.name_155.changed.add(this.method_1328);
        ship.info.factionID.changed.add(this.method_1328);
        class_81.var_24.changed.add(this.method_1328);
        class_81.premium.changed.add(this.method_1328);
        this.method_1328();
    }

    override public function method_2753(): void {
        ship.info.name_32.changed.remove(this.method_1328);
        ship.info.name_155.changed.remove(this.method_1328);
        ship.info.factionID.changed.remove(this.method_1328);
        class_81.var_24.changed.remove(this.method_1328);
        class_81.premium.changed.remove(this.method_1328);
        super.method_2753();
    }

    public function method_1328(): void {
        color = this.method_4680();
    }

    private function method_4680(): uint {
        var _loc1_: * = 4294901760;
        var _loc2_: class_86 = class_50.getInstance().map.hero;
        if (_loc2_ == null) {
            return 4294901760;
        }
        if (class_50.getInstance().map.effects.method_4909(ship.id, class_338.const_1745)) {
            return 4294945331;
        }
        if (ship.info.factionID.value == _loc2_.info.factionID.value) {
            _loc1_ = 4278229503;
        }
        if (Boolean(ship.info.name_32.value) && ship.info.name_32.value == _loc2_.info.name_32.value) {
            _loc1_ = 4281597747;
        } else if (Boolean(class_81.var_24.value) || Boolean(class_81.premium.value)) {
            switch (ship.info.name_155.value) {
                case 1:
                    _loc1_ = 4281597747;
                    break;
                case 2:
                    _loc1_ = 4294953984;
                    break;
                case 3:
                    _loc1_ = ship.info.factionID.value == _loc2_.info.factionID.value ? 4294901760 : 4291559424;
            }
        }
        return _loc1_;
    }
}
}
