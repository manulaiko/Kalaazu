package package_75 {

import com.bigpoint.utils.class_73;

import flash.geom.Rectangle;

import package_35.Effect;
import package_35.class_338;

import package_9.class_50;

public class class_2352 extends Effect {


    private var var_3737: Rectangle;

    private var var_1331: Rectangle;

    private var var_1023: Number;

    private var var_3022: class_73;

    public function class_2352(param1: class_73, param2: Rectangle, param3: Rectangle, param4: Number = 2) {
        super(class_338.const_2558, const_925);
        this.var_3737 = param3;
        this.var_1331 = param2;
        this.var_1023 = param4;
        this.var_3022 = param1;
    }

    public function get method_3288(): Rectangle {
        return this.var_3737;
    }

    public function get method_652(): Rectangle {
        return this.var_1331;
    }

    public function get method_5111(): Number {
        return this.var_1023;
    }

    public function get method_1278(): class_73 {
        return this.var_3022;
    }

    public function method_3146(param1: class_73): void {
        class_50.getInstance().map.effects.method_5084(new class_2353(param1));
    }
}
}
