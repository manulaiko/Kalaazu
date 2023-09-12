package package_45 {

import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_10.class_305;

import package_29.class_85;

import package_38.class_868;

public class class_1809 extends class_85 {


    public function class_1809(param1: class_868) {
        super(param1.name_115, new class_305(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "ranged_explosion", UberAssetsLib.LIB_DEFAULT);
    }
}
}
