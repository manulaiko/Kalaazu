package package_19 {

public final class class_264 {

    public static const NIL: class_264 = new class_264(null, null);


    public var head: class_263;

    public var tail: class_264;

    public var var_3378: Boolean = false;

    public function class_264(param1: class_263, param2: class_264 = null) {
        super();
        if (!param1 && !param2) {
            if (NIL) {
                throw new ArgumentError("Parameters head and tail are null. Use the NIL element instead.");
            }
            this.var_3378 = false;
        } else {
            if (!param1) {
                throw new ArgumentError("Parameter head cannot be null.");
            }
            this.head = param1;
            this.tail = param2 || NIL;
            this.var_3378 = true;
        }
    }

    public function get length(): uint {
        if (!this.var_3378) {
            return 0;
        }
        if (this.tail == NIL) {
            return 1;
        }
        var _loc1_: Number = 0;
        var _loc2_: class_264 = this;
        while (_loc2_.var_3378) {
            _loc1_++;
            _loc2_ = _loc2_.tail;
        }
        return _loc1_;
    }

    public function prepend(param1: class_263): class_264 {
        return new class_264(param1, this);
    }

    public function append(param1: class_263): class_264 {
        if (!param1) {
            return this;
        }
        if (!this.var_3378) {
            return new class_264(param1);
        }
        if (this.tail == NIL) {
            return new class_264(param1).prepend(this.head);
        }
        var _loc2_: class_264 = new class_264(this.head);
        var _loc3_: class_264 = _loc2_;
        var _loc4_: class_264 = this.tail;
        while (_loc4_.var_3378) {
            _loc3_ = _loc3_.tail = new class_264(_loc4_.head);
            _loc4_ = _loc4_.tail;
        }
        _loc3_.tail = new class_264(param1);
        return _loc2_;
    }

    public function method_6414(param1: class_263): class_264 {
        if (!this.var_3378) {
            return new class_264(param1);
        }
        var _loc2_: int = int(param1.priority);
        if (_loc2_ > this.head.priority) {
            return this.prepend(param1);
        }
        var _loc3_: class_264 = new class_264(this.head);
        var _loc4_: class_264 = _loc3_;
        var _loc5_: class_264 = this.tail;
        while (_loc5_.var_3378) {
            if (_loc2_ > _loc5_.head.priority) {
                _loc4_.tail = _loc5_.prepend(param1);
                return _loc3_;
            }
            _loc4_ = _loc4_.tail = new class_264(_loc5_.head);
            _loc5_ = _loc5_.tail;
        }
        _loc4_.tail = new class_264(param1);
        return _loc3_;
    }

    public function method_3567(param1: Function): class_264 {
        if (!this.var_3378 || param1 == null) {
            return this;
        }
        if (param1 == this.head.listener) {
            return this.tail;
        }
        var _loc2_: class_264 = new class_264(this.head);
        var _loc3_: class_264 = _loc2_;
        var _loc4_: class_264 = this.tail;
        while (_loc4_.var_3378) {
            if (_loc4_.head.listener == param1) {
                _loc3_.tail = _loc4_.tail;
                return _loc2_;
            }
            _loc3_ = _loc3_.tail = new class_264(_loc4_.head);
            _loc4_ = _loc4_.tail;
        }
        return this;
    }

    public function contains(param1: Function): Boolean {
        if (!this.var_3378) {
            return false;
        }
        var _loc2_: class_264 = this;
        while (_loc2_.var_3378) {
            if (_loc2_.head.listener == param1) {
                return true;
            }
            _loc2_ = _loc2_.tail;
        }
        return false;
    }

    public function find(param1: Function): class_263 {
        if (!this.var_3378) {
            return null;
        }
        var _loc2_: class_264 = this;
        while (_loc2_.var_3378) {
            if (_loc2_.head.listener == param1) {
                return _loc2_.head;
            }
            _loc2_ = _loc2_.tail;
        }
        return null;
    }

    public function toString(): String {
        var _loc1_: * = "";
        var _loc2_: class_264 = this;
        while (_loc2_.var_3378) {
            _loc1_ += _loc2_.head + " -> ";
            _loc2_ = _loc2_.tail;
        }
        _loc1_ += "NIL";
        return "[List " + _loc1_ + "]";
    }
}
}
