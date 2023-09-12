package package_258 {

import package_10.class_305;
import package_10.class_314;

import package_22.FullResourcePattern;

import package_29.class_267;

public class class_2079 extends class_267 {


    public const rotation: class_314 = new class_314();

    private var var_4422: FullResourcePattern;

    private var _loop: Boolean;

    private var var_1179: Boolean;

    public function class_2079(param1: FullResourcePattern, param2: Boolean, param3: Boolean) {
        super();
        this._loop = param3;
        this.var_1179 = param2;
        this.var_4422 = param1;
    }

    public function get res(): FullResourcePattern {
        return this.var_4422;
    }

    public function get position(): class_305 {
        return owner.position;
    }

    public function get loop(): Boolean {
        return this._loop;
    }

    public function get rotatable(): Boolean {
        return this.var_1179;
    }
}
}
