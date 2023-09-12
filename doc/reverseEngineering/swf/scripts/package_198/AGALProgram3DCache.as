package package_198 {

import away3d.arcane;

import com.adobe.utils.AGALMiniAssembler;

import flash.display3D.Context3DProgramType;
import flash.display3D.Program3D;
import flash.utils.ByteArray;

import package_199.class_1209;

import package_291.class_1745;

import package_309.class_1774;

public class AGALProgram3DCache {

    private static var _instances: Vector.<AGALProgram3DCache>;

    private static var var_3407: int;


    private var _stage3DProxy: class_1208;

    private var var_768: Array;

    private var var_813: Array;

    private var var_3346: Array;

    private var _keys: Array;

    public function AGALProgram3DCache(param1: class_1208, param2: AGALProgram3DCacheSingletonEnforcer) {
        super();
        if (!param2) {
            throw new Error("This class is a multiton and cannot be instantiated manually. Use Stage3DManager.getInstance instead.");
        }
        this._stage3DProxy = param1;
        this.var_768 = [];
        this.var_813 = [];
        this.var_3346 = [];
        this._keys = [];
    }

    public static function getInstance(param1: class_1208): AGALProgram3DCache {
        var _loc2_: int = int(param1.arcane::var_1572);
        _instances = _instances || new Vector.<AGALProgram3DCache>(8, true);
        if (true) {
            _instances[_loc2_] = new AGALProgram3DCache(param1, new AGALProgram3DCacheSingletonEnforcer());
            param1.addEventListener(class_1209.const_1595, method_4628, false, 0, true);
            param1.addEventListener(class_1209.const_2496, method_4628, false, 0, true);
            param1.addEventListener(class_1209.const_2172, method_4628, false, 0, true);
        }
        return _instances[_loc2_];
    }

    public static function method_4844(param1: int): AGALProgram3DCache {
        return _instances[param1];
    }

    private static function method_4628(param1: class_1209): void {
        var _loc2_: class_1208 = class_1208(param1.target);
        var _loc3_: int = int(_loc2_.arcane::var_1572);
        _instances[_loc3_].dispose();
        _instances[_loc3_] = null;
        _loc2_.removeEventListener(class_1209.const_1595, method_4628);
        _loc2_.removeEventListener(class_1209.const_2496, method_4628);
        _loc2_.removeEventListener(class_1209.const_2172, method_4628);
    }

    public function dispose(): void {
        var _loc1_: * = null;
        for (_loc1_ in this.var_768) {
            this.method_4182(_loc1_);
        }
        this._keys = null;
        this.var_768 = null;
        this.var_3346 = null;
    }

    public function method_4626(param1: class_1774, param2: String, param3: String): void {
        var _loc5_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc4_: int = int(this._stage3DProxy.arcane::var_1572);
        var _loc6_: String = this.method_18(param2, param3);
        if (this.var_768[_loc6_] == null) {
            this._keys[var_3407] = _loc6_;
            this.var_3346[var_3407] = 0;
            this.var_813[_loc6_] = var_3407;
            ++var_3407;
            _loc5_ = this._stage3DProxy.arcane::var_4582.createProgram();
            _loc9_ = new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.VERTEX, param2);
            _loc10_ = new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.FRAGMENT, param3);
            _loc5_.upload(_loc9_, _loc10_);
            this.var_768[_loc6_] = _loc5_;
        }
        var _loc7_: int = int(param1.arcane::var_4423[_loc4_]);
        var _loc8_: int = int(this.var_813[_loc6_]);
        if (_loc7_ != _loc8_) {
            if (_loc7_ >= 0) {
                this.method_2578(_loc7_);
            }
            ++this.var_3346[_loc8_];
        }
        param1.arcane::var_4423[_loc4_] = _loc8_;
        param1.arcane::var_768[_loc4_] = this.var_768[_loc6_];
    }

    public function method_2578(param1: int): void {
        --this.var_3346[param1];
        if (this.var_3346[param1] == 0) {
            this.method_4182(this._keys[param1]);
        }
    }

    private function method_4182(param1: String): void {
        this.var_768[param1].dispose();
        this.var_768[param1] = null;
        delete this.var_768[param1];
        this.var_813[param1] = -1;
    }

    private function method_18(param1: String, param2: String): String {
        return param1 + "---" + param2;
    }
}
}

class AGALProgram3DCacheSingletonEnforcer {


    function AGALProgram3DCacheSingletonEnforcer() {
        super();
    }
}
