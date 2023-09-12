package package_186 {

import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;

public class HintsProxy extends DOAbstractProxy {

    public static const NAME: String = "HintsProxy";


    private var var_3459: String;

    public function HintsProxy() {
        super(NAME);
    }

    public function get method_1142(): String {
        return this.var_3459;
    }

    public function set method_1142(param1: String): void {
        this.var_3459 = param1;
    }
}
}
