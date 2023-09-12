package package_431 {

import away3d.animators.*;

import flash.geom.*;

import package_386.*;

import package_430.*;

public class class_2639 extends class_2435 {


    private var var_147: Vector.<class_2636>;

    public var var_3555: Boolean = false;

    public function class_2639() {
        this.var_147 = new Vector.<class_2636>();
        super();
        var_4797 = class_2703;
    }

    public function get frames(): Vector.<class_2636> {
        return this.var_147;
    }

    public function addFrame(param1: class_2636, param2: uint): void {
        this.var_147.push(param1);
        var_625.push(param2);
        var_2973 = var_625.length;
        var_3419 = true;
    }

    public function method_3412(param1: class_2120): class_2703 {
        return param1.method_3412(this) as class_2703;
    }

    override protected function method_109(): void {
        super.method_109();
        var _loc1_: uint = var_2973 - 1;
        while (_loc1_--) {
            _totalDuration += var_625[_loc1_];
        }
        if (Boolean(var_2631) && Boolean(var_3323)) {
            _totalDuration += var_625[var_2973 - 1];
        }
    }
}
}
