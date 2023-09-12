package package_151 {

import spark.collections.SortField;

public class class_1517 extends SortField {


    public function class_1517(param1: String = null, param2: Boolean = false, param3: Object = null) {
        super(param1, param2, param3);
        compareFunction = this.method_2215;
    }

    private function method_2215(param1: Object, param2: Object): int {
        var _loc3_: class_1515 = param1 as class_1515;
        var _loc4_: class_1515 = param2 as class_1515;
        if (Boolean(_loc3_) && Boolean(_loc4_)) {
            return parseInt(_loc4_.method_6469.right) - parseInt(_loc3_.method_6469.right);
        }
        return 0;
    }
}
}
