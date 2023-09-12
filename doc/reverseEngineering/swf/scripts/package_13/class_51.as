package package_13 {

import flash.display.Stage;

import net.bigpoint.darkorbit.class_9;

public class class_51 {


    private var _stage: Stage;

    private var var_574: class_9;

    private var var_2891: Object;

    public function class_51(param1: class_9, param2: Stage) {
        super();
        this.var_574 = param1;
        this._stage = param2;
        this.var_2891 = !!param1.loaderInfo.parameters.host ? param1.loaderInfo.parameters : param2.loaderInfo.parameters;
    }

    public function get main(): class_9 {
        return this.var_574;
    }

    public function get stage(): Stage {
        return this._stage;
    }

    public function get flashVars(): Object {
        return this.var_2891;
    }
}
}
