package away3d.animators {

import away3d.arcane;

import flash.display3D.*;

import package_198.*;

import package_294.*;

import package_305.class_1767;

import package_309.*;

import package_430.*;

import package_431.class_2436;

public class class_2121 extends class_2119 implements class_2120 {


    private var var_3788: class_2439;

    private var var_728: Vector.<Number>;

    private var var_2819: class_2442;

    public function class_2121(param1: class_2439) {
        this.var_728 = Vector.<Number>([1, 0, 0, 0]);
        super(param1);
        this.var_3788 = param1;
    }

    public function clone(): class_2120 {
        return new class_2121(this.var_3788);
    }

    public function play(param1: String, param2: Number = NaN): class_2436 {
        if (var_203 != param1) {
            var_203 = param1;
            if (!var_1183.method_294(param1)) {
                throw new Error("Animation root node " + param1 + " not found!");
            }
            var_4381 = var_1183.method_1957(param1);
            var_1036 = method_3412(var_4381);
            if (updatePosition) {
                var_1036.time = time;
                var_1036.method_5121;
            }
            this.var_2819 = var_1036 as class_2442;
        }
        start();
        if (!isNaN(param2)) {
            reset(param1, param2);
        }
        return var_4381 as class_2436;
    }

    public function setRenderState(param1: class_1208, param2: class_2133, param3: int, param4: int, param5: class_1767): void {
        if (this.var_2819 == null || this.var_2819.method_3221 == null || this.var_2819.method_790 == null) {
            this.method_3224(param1, param2, param3, param4);
            return;
        }
        this.var_728[uint(0)] = 1 - (this.var_728[uint(1)] = this.var_2819.method_509);
        param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX, param3, this.var_728, 1);
        var _loc6_: class_2398 = class_2398(param2);
        var _loc7_: class_2425 = this.var_2819.method_3221.subGeometries[_loc6_.arcane::_index];
        this.var_2819.method_3221.subGeometries[_loc6_.arcane::_index].method_748(param4++, param1);
        this.var_2819.method_790.subGeometries[_loc6_.arcane::_index].method_748(param4++, param1);
    }

    private function method_3224(param1: class_1208, param2: class_2133, param3: int, param4: int): void {
        param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX, param3, this.var_728, 1);
        param2.method_748(param4++, param1);
        param2.method_748(param4++, param1);
    }

    public function method_3058(param1: class_1774): void {
    }

    override public function dispose(): void {
        stop();
        super.dispose();
    }

    public function disposeAsset(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.dispose();
        var _loc1_: int = 0;
        while (_loc1_ < this.var_3788.method_939.length) {
            _loc2_ = class_2436(this.var_3788.method_939[_loc1_]).frames;
            for each(_loc3_ in _loc2_) {
                _loc3_.geometry.dispose();
            }
            _loc1_++;
        }
    }
}
}
