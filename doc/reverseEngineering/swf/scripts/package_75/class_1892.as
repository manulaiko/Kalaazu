package package_75 {

import package_113.class_2286;

import package_29.class_267;
import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1892 extends class_348 {


    private var var_286: class_267;

    private var _offset: int;

    public function class_1892(param1: class_85, param2: int, param3: int = 0) {
        super(class_338.const_701, param1, const_2856);
        method_2711 = param2 * 1000;
        this._offset = param3;
    }

    public function get offset(): int {
        return this._offset;
    }

    public function get time(): int {
        return Number(method_2711) * 0.001;
    }

    override public function activate(): Boolean {
        this.var_286 = source.addTrait(new class_2286(this.time));
        return super.activate();
    }

    override public function deactivate(): void {
        if (this.var_286) {
            source.removeTrait(this.var_286);
            this.var_286 = null;
        }
        super.deactivate();
    }
}
}
