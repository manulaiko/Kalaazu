package away3d.animators {

import flash.display3D.Context3D;

import package_198.class_1208;

import package_309.class_1774;

public class class_2665 extends class_2438 implements class_2234 {


    private var var_2422: String;

    public function class_2665() {
        super();
    }

    public function method_2174(param1: class_1774, param2: Vector.<String>, param3: Vector.<String>, param4: String): String {
        var _loc5_: uint = param3.length;
        this.var_2422 = "";
        var _loc6_: Number = 0;
        while (_loc6_ < _loc5_) {
            this.var_2422 += "mov " + param3[_loc6_] + ", " + param2[_loc6_] + "\n";
            _loc6_++;
        }
        return this.var_2422;
    }

    public function activate(param1: class_1208, param2: class_1774): void {
    }

    public function deactivate(param1: class_1208, param2: class_1774): void {
        var _loc3_: Context3D = param1.context3D;
        _loc3_.setVertexBufferAt(0, null);
    }

    public function method_2535(param1: class_1774, param2: String, param3: String): String {
        return "";
    }

    public function method_45(param1: class_1774, param2: String, param3: String): String {
        var _loc4_: String = "vt" + param2.substring(2, 3);
        var _loc5_: int = int(param1.method_1025);
        var _loc6_: String = "vc" + _loc5_;
        this.var_2422 = "mov " + _loc4_ + ", " + param2 + "\n";
        this.var_2422 += "mul " + _loc4_ + ".xy, " + _loc4_ + ".xy, " + _loc6_ + ".zw \n";
        this.var_2422 += "add " + _loc4_ + ".xy, " + _loc4_ + ".xy, " + _loc6_ + ".xy \n";
        this.var_2422 += "mov " + param3 + ", " + _loc4_ + "\n";
        return this.var_2422;
    }

    public function method_5085(param1: class_1774): void {
    }
}
}
