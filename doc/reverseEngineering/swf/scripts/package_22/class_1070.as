package package_22 {

public class class_1070 {


    private var var_1989: String;

    private var var_2975: Vector.<class_1068>;

    public function class_1070(param1: String, param2: Vector.<class_1068>) {
        super();
        this.var_2975 = param2;
        this.var_1989 = param1;
    }

    public function method_4033(param1: int, param2: String): String {
        var _loc3_: * = null;
        for each(_loc3_ in this.var_2975) {
            if (_loc3_.type == param2) {
                return _loc3_.method_6207(param1);
            }
        }
        return this.var_2975[0].method_6207(param1);
    }
}
}
