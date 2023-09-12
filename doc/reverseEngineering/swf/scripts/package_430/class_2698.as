package package_430 {

import away3d.animators.class_2120;

import package_386.class_2617;

import package_431.class_2610;

public class class_2698 extends class_2440 implements class_2697 {


    private var var_147: Vector.<class_2617>;

    private var var_4013: class_2610;

    private var var_2791: class_2617;

    private var var_2262: class_2617;

    public function class_2698(param1: class_2120, param2: class_2610) {
        super(param1, param2);
        this.var_4013 = param2;
        this.var_147 = this.var_4013.frames;
    }

    public function get method_1523(): class_2617 {
        if (var_3035) {
            this.method_1483();
        }
        return this.var_2791;
    }

    public function get method_181(): class_2617 {
        if (var_3035) {
            this.method_1483();
        }
        return this.var_2262;
    }

    override protected function method_1483(): void {
        super.method_1483();
        if (this.var_147.length > 0) {
            if (this.var_147.length == 2 && var_1857 == 0) {
                this.var_2791 = this.var_147[1];
                this.var_2262 = this.var_147[0];
            } else {
                this.var_2791 = this.var_147[var_1857];
                if (Boolean(this.var_4013.method_3310) && var_1424 >= this.var_4013.lastFrame) {
                    this.var_2262 = this.var_147[0];
                } else {
                    this.var_2262 = this.var_147[var_1424];
                }
            }
        }
    }
}
}
