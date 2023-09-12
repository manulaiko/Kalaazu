package package_20 {

import mx.core.IFlexModuleFactory;

import package_340.class_1910;

public class class_1547 extends class_1544 {


    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1547() {
        super();
        mx_internal::_document = this;
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    override public function set data(param1: Object): void {
        var _loc2_: class_1910 = param1 as class_1910;
        method_5985(_loc2_.method_5566);
        super.data = _loc2_.hero;
    }
}
}
