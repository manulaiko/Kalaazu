package package_118 {

import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_1185 extends class_325 {


    private var var_41: Boolean = false;

    private var var_1159 = null;

    private var var_3109: Object;

    public function class_1185() {
        super();
    }

    public function get quantity(): * {
        return this.var_1159;
    }

    public function set quantity(param1: *): void {
        this.var_1159 = class_325.method_4014(param1);
        if (this.var_1159 is int) {
            this.var_41 = true;
        }
    }

    public function get reference(): Object {
        return this.var_3109;
    }

    public function set reference(param1: Object): void {
        this.var_3109 = param1;
    }

    override public function link(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        super.link();
        if (!this.var_41 && this.var_1159 is class_325) {
            (this.var_1159 as class_325).link();
        }
        if (this.var_3109 is String) {
            _loc1_ = this.var_3109 as String;
            _loc2_ = class_88.method_5982(_loc1_);
            if (this.var_41) {
                this.var_3109 = _loc2_.getContent(this.var_1159);
            } else {
                this.var_3109 = _loc2_;
            }
        }
    }

    override public function getText(param1: Dictionary): String {
        var _loc2_: * = null;
        if (this.var_3109 is class_1184) {
            return (this.var_3109 as class_1184).getText(param1);
        }
        if (this.var_3109 is class_324) {
            _loc2_ = this.var_3109 as class_324;
            if (this.var_1159 == null) {
                return _loc2_.getContent(param1, param1[class_1183.method_5758]);
            }
            return _loc2_.getContent(param1, method_1118(this.var_1159, param1));
        }
        throw new Error("Couldn\'t resolve reference " + this.var_3109 + " of ReferencePlaceholder " + name + ".");
    }
}
}
