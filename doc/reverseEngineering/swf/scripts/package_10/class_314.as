package package_10 {

import package_19.class_68;
import package_19.class_70;

public class class_314 {


    private const const_1441: Number = 0.017453292519943295;

    private const const_596: Number = 57.29577951308232;

    public const changed: class_68 = new class_70();

    private var var_4871: int = 0;

    public function class_314(param1: int = 0) {
        super();
        this.degrees = param1;
    }

    public function get degrees(): int {
        return this.var_4871;
    }

    public function set degrees(param1: int): void {
        if (this.var_4871 != param1) {
            this.var_4871 = param1;
            this.changed.dispatch();
        }
    }

    public function method_5937(): int {
        var _loc1_: int = int(this.var_4871);
        while (_loc1_ >= 360) {
            _loc1_ -= 360;
        }
        while (_loc1_ < 0) {
            _loc1_ += 360;
        }
        return _loc1_;
    }

    public function get radians(): Number {
        return Number(this.var_4871) * 0.017453292519943295;
    }

    public function set radians(param1: Number): void {
        this.degrees = param1 * 57.29577951308232;
    }
}
}
