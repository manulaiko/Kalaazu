package package_45 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_29.class_85;

public class class_125 extends class_85 {

    public static const const_1464: String = "disabled";

    public static const const_661: String = "enabled";


    private var var_9: class_306;

    public function class_125(param1: int, param2: class_73, param3: int) {
        super(param1, param2);
        UberAssetsLib.instance.fillTraits(this, "station_" + param3, UberAssetsLib.LIB_DEFAULT);
        this.var_9 = method_1954(class_306) as class_306;
        this.isEnabled = false;
    }

    public function set isEnabled(param1: Boolean): void {
        if (this.var_9) {
            this.var_9.state.value = param1 ? const_1464 : const_661;
        }
    }
}
}
