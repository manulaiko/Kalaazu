package package_13 {

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;

import package_15.class_54;

import package_269.class_1669;

import package_9.class_50;
import package_9.class_61;

public class class_1935 {


    private var var_574: class_9;

    private var var_2737: class_1669;

    public function class_1935(param1: class_51) {
        super();
        this.var_574 = param1.main;
    }

    public function get name_47(): class_50 {
        return this.var_574.name_47;
    }

    public function get guiManager(): class_58 {
        return this.var_574.guiManager;
    }

    public function get name_41(): class_61 {
        return this.var_574.name_41;
    }

    public function get name_161(): class_54 {
        return this.var_574.name_161;
    }

    public function get memory(): class_1669 {
        if (this.var_2737 == null) {
            this.var_2737 = new class_1669();
        }
        return this.var_2737;
    }
}
}
