package package_183 {

import net.bigpoint.darkorbit.class_126;

public class class_1588 extends Condition {


    private var var_2826: int;

    private var var_1041: int;

    private var var_126: int;

    public function class_1588() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        var _loc2_: Vector.<String> = param1;
        this.var_2826 = parseInt(_loc2_.shift());
        this.var_1041 = parseInt(_loc2_.shift());
        this.var_126 = parseInt(_loc2_.shift());
        _description = _description.replace(/%opponent%/, class_126.instance.method_1789[this.var_1041]);
        var_3277 = method_6395(class_126.instance.method_3582[this.var_1041] + "_icon.png");
    }
}
}
