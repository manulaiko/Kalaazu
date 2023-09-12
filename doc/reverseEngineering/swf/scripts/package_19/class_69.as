package package_19 {

import flash.errors.IllegalOperationError;
import flash.utils.getQualifiedClassName;

public class class_69 implements class_67 {


    protected var var_653: Array;

    protected var var_268: class_264;

    public function class_69(...rest) {
        this.var_268 = class_264.NIL;
        super();
        this.method_4692 = rest.length == 1 && rest[0] is Array ? rest[0] : rest;
    }

    public function get method_4692(): Array {
        return this.var_653;
    }

    public function set method_4692(param1: Array): void {
        this.var_653 = !!param1 ? param1.slice() : [];
        var _loc2_: int = int(this.var_653.length);
        while (_loc2_--) {
            if (!(this.var_653[_loc2_] is Class)) {
                throw new ArgumentError("Invalid valueClasses argument: item at index " + _loc2_ + " should be a Class but was:<" + this.var_653[_loc2_] + ">." + getQualifiedClassName(this.var_653[_loc2_]));
            }
        }
    }

    public function get method_418(): uint {
        return this.var_268.length;
    }

    public function addOnce(param1: Function): class_263 {
        return this.method_4705(param1, true);
    }

    public function remove(param1: Function): class_263 {
        var _loc2_: class_263 = this.var_268.find(param1);
        if (!_loc2_) {
            return null;
        }
        this.var_268 = this.var_268.method_3567(param1);
        return _loc2_;
    }

    public function removeAll(): void {
        this.var_268 = class_264.NIL;
    }

    public function dispatch(...rest): void {
        var _loc2_: int = int(this.var_653.length);
        var _loc3_: int = int(rest.length);
        if (_loc3_ < _loc2_) {
            throw new ArgumentError("Incorrect number of arguments. Expected at least " + _loc2_ + " but received " + _loc3_ + ".");
        }
        var _loc4_: int = 0;
        while (_loc4_ < _loc2_) {
            if (!(rest[_loc4_] is this.var_653[_loc4_] || rest[_loc4_] === null)) {
                throw new ArgumentError("Value object <" + rest[_loc4_] + "> is not an instance of <" + this.var_653[_loc4_] + ">.");
            }
            _loc4_++;
        }
        var _loc5_: class_264;
        if ((_loc5_ = this.var_268).var_3378) {
            while (_loc5_.var_3378) {
                _loc5_.head.execute(rest);
                _loc5_ = _loc5_.tail;
            }
        }
    }

    protected function method_4705(param1: Function, param2: Boolean = false): class_263 {
        var _loc3_: * = null;
        if (this.method_6257(param1, param2)) {
            _loc3_ = new Slot(param1, this, param2);
            this.var_268 = this.var_268.prepend(_loc3_);
            return _loc3_;
        }
        return this.var_268.find(param1);
    }

    protected function method_6257(param1: Function, param2: Boolean): Boolean {
        if (!this.var_268.var_3378) {
            return true;
        }
        var _loc3_: class_263 = this.var_268.find(param1);
        if (!_loc3_) {
            return true;
        }
        if (_loc3_.method_4132 != param2) {
            throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
        }
        return false;
    }
}
}
