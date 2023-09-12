package package_192 {

import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;

public class class_1557 implements class_1171 {


    private var var_3874: Object;

    public function class_1557() {
        this.var_3874 = new Object();
        super();
    }

    public function method_2803(param1: int, param2: Vector.<String>, param3: String): void {
        this.var_3874[param1.toString()] = new Vector.<Object>(1);
        (this.var_3874[param1.toString()] as Vector.<Object>)[0] = new Object();
        this.var_3874[param1.toString()][0][class_1172.NAME] = param3;
        this.var_3874[param1.toString()][0][class_1172.const_882] = new Object();
        this.var_3874[param1.toString()][0][class_1172.const_882][this.var_3874[param1.toString()][0][class_1172.NAME]] = param2;
    }

    public function method_889(param1: class_1554): void {
        var _loc2_: * = null;
        if (param1.keys.length > 0) {
            _loc2_ = param1.keys[0].toString();
            this.var_3874[_loc2_] = new Vector.<Object>(1);
            (this.var_3874[_loc2_] as Vector.<Object>)[0] = new Object();
            this.var_3874[_loc2_][0][class_1172.NAME] = param1.name;
            this.var_3874[_loc2_][0][class_1172.const_882] = new Object();
            this.var_3874[_loc2_][0][class_1172.const_882][this.var_3874[_loc2_.toString()][0][class_1172.NAME]] = param1.args;
        }
    }

    public function parse(): Object {
        return this.var_3874;
    }

    public function reset(): void {
        this.var_3874 = new Object();
    }

    public function method_85(): Vector.<class_1554> {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Vector.<class_1554> = new Vector.<class_1554>();
        for (_loc3_ in this.var_3874) {
            if ((this.var_3874[_loc3_] as Vector.<Object>)[0][class_1172.NAME]) {
                _loc2_ = new class_1554();
                _loc2_.keys = new <int>[int(_loc3_)];
                _loc2_.name = (this.var_3874[_loc3_.toString()] as Vector.<Object>)[0][class_1172.NAME];
                _loc2_.args = this.var_3874[_loc3_.toString()][0][class_1172.const_882][this.var_3874[_loc3_.toString()][0][class_1172.NAME]];
                _loc1_.push(_loc2_);
            }
        }
        return _loc1_;
    }
}
}
