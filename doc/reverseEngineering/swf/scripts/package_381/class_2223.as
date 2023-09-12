package package_381 {

import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_303.class_2222;

import package_304.class_2104;

import package_75.class_2488;

public class class_2223 extends class_2222 {

    public static const const_1691: uint = 5;


    private var _content: class_2104;

    private var var_2874: Array;

    private var particles: Array;

    public function class_2223(param1: class_1211, param2: class_2488) {
        this.var_2874 = new Array();
        this.particles = new Array();
        super(param1, param2);
        if (method_1521 == null) {
            return;
        }
    }

    private function method_310(param1: class_2104): void {
        this._content = param1;
        method_1521.view.addChild(this);
        var _loc2_: int = this.var_2874.length - 1;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            this.method_158();
            _loc3_++;
        }
        this.var_2874.length = 0;
    }

    public function method_3652(param1: Number): void {
        param1 = Math.min(const_1691, param1);
        var _loc2_: int = 0;
        while (_loc2_ < const_1691) {
            if (param1 > _loc2_) {
                if (this.particles.length > _loc2_) {
                    (this.particles[_loc2_] as class_2104).visible = true;
                } else {
                    this.method_158();
                }
            } else if (this.particles.length > _loc2_) {
                (this.particles[_loc2_] as class_2104).visible = false;
            }
            _loc2_++;
        }
    }

    private function method_158(): void {
    }

    override public function cleanup(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this.particles.length) {
            (this.particles[_loc1_] as class_2104).dispose();
            _loc1_++;
        }
        super.cleanup();
    }
}
}
