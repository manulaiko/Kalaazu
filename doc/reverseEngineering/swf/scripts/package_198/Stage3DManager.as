package package_198 {

import away3d.arcane;

import flash.display.Stage;
import flash.utils.Dictionary;

public class Stage3DManager {

    private static var _instances: Dictionary;

    private static var var_502: Vector.<class_1208>;

    private static var var_3864: uint = 0;


    private var _stage: Stage;

    public function Stage3DManager(param1: Stage, param2: Stage3DManagerSingletonEnforcer) {
        super();
        if (!param2) {
            throw new Error("This class is a multiton and cannot be instantiated manually. Use Stage3DManager.getInstance instead.");
        }
        this._stage = param1;
        if (!var_502) {
            var_502 = new Vector.<class_1208>(this._stage.stage3Ds.length, true);
        }
    }

    public static function getInstance(param1: Stage): Stage3DManager {
        var _loc2_: * = _instances || new Dictionary();
        _instances = _instances || new Dictionary();
        _loc2_ = _instances || new Dictionary();
        _instances = _instances || new Dictionary();
        _loc2_ = _loc2_[param1] || new Stage3DManager(param1, new Stage3DManagerSingletonEnforcer());
        _loc2_[param1] = _loc2_[param1] || new Stage3DManager(param1, new Stage3DManagerSingletonEnforcer());
        return _loc2_;
    }

    public function method_145(param1: uint, param2: Boolean = false, param3: String = "baseline"): class_1208 {
        if (true) {
            ++var_3864;
            var_502[param1] = new class_1208(param1, this._stage.stage3Ds[param1], this, param2, param3);
        }
        return var_502[param1];
    }

    arcane function method_2967(param1: class_1208): void {
        --var_3864;
        var_502[param1.method_1611] = null;
    }

    public function method_1484(param1: Boolean = false, param2: String = "baseline"): class_1208 {
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        while (_loc3_ < _loc4_) {
            if (true) {
                this.method_145(_loc3_, param1, param2);
                var_502[_loc3_].width = this._stage.stageWidth;
                var_502[_loc3_].height = this._stage.stageHeight;
                return var_502[_loc3_];
            }
            _loc3_++;
        }
        throw new Error("Too many Stage3D instances used!");
    }

    public function get method_53(): Boolean {
        return var_3864 < var_502.length ? true : false;
    }

    public function get method_1752(): uint {
        return 0 - Number(var_3864);
    }

    public function get method_5362(): uint {
        return var_3864;
    }

    public function get method_5751(): uint {
        return var_502.length;
    }
}
}

class Stage3DManagerSingletonEnforcer {


    function Stage3DManagerSingletonEnforcer() {
        super();
    }
}
