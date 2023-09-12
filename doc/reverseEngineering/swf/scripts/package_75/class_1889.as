package package_75 {

import package_113.class_404;

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1889 extends class_348 {


    private var var_286: class_404;

    public function class_1889(param1: class_85) {
        super(class_338.const_3113, param1);
        this.var_286 = new class_404("polarityPositive");
    }

    override public function activate(): Boolean {
        source.addTrait(this.var_286);
        return super.activate();
    }

    override public function deactivate(): void {
        this.removeTrait();
        super.deactivate();
    }

    private function removeTrait(): void {
        source.removeTrait(this.var_286);
    }
}
}
