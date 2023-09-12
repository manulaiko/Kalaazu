package package_109 {

import net.bigpoint.darkorbit.map.model.*;

import package_35.Effect;
import package_35.class_348;

import package_9.class_50;

public class class_376 {


    private var var_594: Object;

    public function class_376() {
        this.var_594 = {};
        super();
    }

    private function get map(): class_90 {
        return class_50.getInstance().map;
    }

    public function dispose(): void {
        this.var_594 = {};
    }

    public function method_5373(param1: int): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc2_: Vector.<Effect> = this.var_594[param1];
        if (_loc2_) {
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                this.map.effects.method_584(_loc2_[_loc4_]);
                _loc4_++;
            }
            _loc2_.length = 0;
            delete this.var_594[param1];
        }
    }

    public function add(param1: class_348): void {
        var _loc2_: Vector.<Effect> = this.var_594[param1.source.id];
        if (!_loc2_) {
            _loc2_ = new Vector.<Effect>();
            this.var_594[param1.source.id] = _loc2_;
        }
        _loc2_.push(param1);
    }

    public function remove(param1: int): void {
        delete this.var_594[param1];
    }
}
}
