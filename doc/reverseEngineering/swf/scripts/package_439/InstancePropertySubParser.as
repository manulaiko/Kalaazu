package package_439 {

import package_438.class_2421;

import package_465.class_2594;

import package_466.class_2598;

import package_468.ThreeDConstValueSubParser;

import package_469.class_2599;

import package_470.OneDConstValueSubParser;

public class InstancePropertySubParser extends class_2421 {


    private var var_1845: ThreeDConstValueSubParser;

    private var var_573: ThreeDConstValueSubParser;

    private var var_1901: ThreeDConstValueSubParser;

    private var var_3845: OneDConstValueSubParser;

    private var var_3669: OneDConstValueSubParser;

    public function InstancePropertySubParser(param1: String) {
        super(param1, const_376);
    }

    public static function get identifier(): * {
        return class_2598.InstancePropertySubParser;
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            if (false) {
                this.var_1845 = new ThreeDConstValueSubParser(null);
                method_4558(this.var_1845);
                this.var_1845.method_5169(_data.position.data);
            }
            if (false) {
                this.var_573 = new ThreeDConstValueSubParser(null);
                method_4558(this.var_573);
                this.var_573.method_5169(_data.rotation.data);
            }
            if (false) {
                this.var_1901 = new ThreeDConstValueSubParser(null);
                method_4558(this.var_1901);
                this.var_1901.method_5169(_data.scale.data);
            }
            if (false) {
                this.var_3845 = new OneDConstValueSubParser(null);
                method_4558(this.var_3845);
                this.var_3845.method_5169(_data.timeOffset.data);
            }
            if (false) {
                this.var_3669 = new OneDConstValueSubParser(null);
                method_4558(this.var_3669);
                this.var_3669.method_5169(_data.playSpeed.data);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_383();
            return const_2361;
        }
        return const_2971;
    }

    private function method_383(): void {
        var _loc1_: class_2594 = !!this.var_1845 ? this.var_1845.setter : null;
        var _loc2_: class_2594 = !!this.var_573 ? this.var_573.setter : null;
        var _loc3_: class_2594 = !!this.var_1901 ? this.var_1901.setter : null;
        var _loc4_: class_2594 = !!this.var_3845 ? this.var_3845.setter : null;
        var _loc5_: class_2594 = !!this.var_3669 ? this.var_3669.setter : null;
        var_4689 = new class_2599(var_78, _loc1_, _loc2_, _loc3_, _loc4_, _loc5_);
    }
}
}
