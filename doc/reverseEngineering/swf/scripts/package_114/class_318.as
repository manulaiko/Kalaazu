package package_114 {

import com.bigpoint.utils.class_73;

import package_99.class_266;

public class class_318 extends class_311 {

    private static const const_1927: class_73 = new class_73();


    private var var_856: class_73;

    private var _direction: class_73;

    private var var_2650: int;

    public function class_318(param1: int = 0, param2: class_73 = null) {
        this.var_856 = class_73.ZERO;
        super();
        this.var_2650 = param1;
        this._direction = param2;
    }

    public function get rocketClassId(): int {
        return this.var_2650;
    }

    public function get direction(): class_73 {
        if (this._direction) {
            return this._direction;
        }
        const_1927.x = class_266.getRandomCount(-800, 800);
        const_1927.y = class_266.getRandomCount(-800, 800);
        return const_1927;
    }

    public function set direction(param1: class_73): void {
        this._direction = param1;
    }

    public function set rocketClassId(param1: int): void {
        this.var_2650 = param1;
    }

    public function get name_53(): class_73 {
        return this.var_856;
    }

    public function set name_53(param1: class_73): void {
        this.var_856 = param1;
    }
}
}
