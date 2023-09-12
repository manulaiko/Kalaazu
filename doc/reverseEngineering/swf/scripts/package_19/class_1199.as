package package_19 {

import flash.errors.IllegalOperationError;

public class class_1199 extends class_69 {


    private var var_2185: Boolean;

    private var var_243: Array;

    public function class_1199(...rest) {
        super();
        this.method_4692 = rest.length == 1 && rest[0] is Array ? rest[0] : rest;
    }

    override public function addOnce(param1: Function): class_263 {
        var _loc2_: class_263 = super.addOnce(param1);
        if (this.var_2185) {
            _loc2_.execute(this.var_243);
            _loc2_.remove();
        }
        return _loc2_;
    }

    override public function dispatch(...rest): void {
        if (this.var_2185) {
            throw new IllegalOperationError("You cannot dispatch() a Promise more than once");
        }
        this.var_2185 = true;
        this.var_243 = rest;
        super.dispatch.apply(this, rest);
    }

    public function reset(): void {
        this.var_2185 = false;
        this.var_243 = null;
        removeAll();
    }
}
}
