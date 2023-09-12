package package_45 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.traits.class_2255;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_29.class_85;

import package_38.class_868;

public class class_1806 extends class_85 {


    public function class_1806(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "buffCapsule_" + param1.name_164, UberAssetsLib.LIB_DEFAULT);
        addTrait(new class_2255(true, 400, 2298413056, true, 1));
    }
}
}
