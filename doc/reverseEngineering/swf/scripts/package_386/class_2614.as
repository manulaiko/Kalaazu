package package_386 {

import package_293.*;

public class class_2614 extends class_1749 implements class_1751 {


    public var joints: Vector.<class_2628>;

    public function class_2614() {
        super();
        this.joints = new Vector.<class_2628>();
    }

    public function get method_2611(): uint {
        return this.joints.length;
    }

    public function method_4620(param1: String): class_2628 {
        var _loc2_: int = int(this.method_2354(param1));
        if (_loc2_ != -1) {
            return this.joints[_loc2_];
        }
        return null;
    }

    public function method_2354(param1: String): int {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        for each(_loc3_ in this.joints) {
            if (_loc3_.name == param1) {
                return _loc2_;
            }
            _loc2_++;
        }
        return -1;
    }

    public function dispose(): void {
        this.joints.length = 0;
    }

    public function get assetType(): String {
        return class_2131.const_1226;
    }
}
}
