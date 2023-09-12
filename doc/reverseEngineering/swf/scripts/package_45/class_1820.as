package package_45 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
import net.bigpoint.darkorbit.net.class_59;

import package_22.class_1074;
import package_22.class_198;

import package_29.class_85;

import package_38.class_821;

public class class_1820 extends class_85 {

    private static const const_1116: Object = {};

    private static const const_2072: Object = {};

    private static const const_2721: uint = 3;

    {
        const_1116[class_821.const_475] = "partner_antec";
        const_1116[class_821.const_1215] = "partner_razer";
        const_1116[class_821.const_1598] = "partner_roccat";
        const_1116[class_821.const_1976] = "partner_antec";
        const_2072[class_821.const_475] = 1;
        const_2072[class_821.const_1215] = 2;
        const_2072[class_821.const_1598] = 3;
        const_2072[class_821.const_1976] = 1;
    }

    private var var_3157: uint = 0;

    private var var_3901: class_1074;

    public function class_1820(param1: int, param2: Number, param3: Number, param4: uint) {
        super(param1, new class_73(param2, param3));
        this.var_3901 = class_198.var_1980["partner_antec"] as class_1074;
        UberAssetsLib.instance.fillTraits(this, "billboard_1", UberAssetsLib.LIB_DEFAULT, null, this.method_4010);
    }

    private function method_4010(): void {
        if (this.var_3157 < const_2721) {
            class_59.call(class_59.const_1192, [this.var_3901.url, false]);
            ++this.var_3157;
        }
    }

    public function get bannerAdPattern(): class_1074 {
        return this.var_3901;
    }
}
}
