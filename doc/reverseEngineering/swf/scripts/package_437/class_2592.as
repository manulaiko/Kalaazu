package package_437 {

public class class_2592 {


    public function class_2592() {
        super();
    }

    public static function method_6525(param1: *, param2: Array): Class {
        var _loc3_: * = null;
        var _loc4_: * = null;
        for each(_loc4_ in param2) {
            if (_loc4_["identifier"] == param1) {
                _loc3_ = _loc4_;
                break;
            }
        }
        return _loc3_;
    }
}
}
