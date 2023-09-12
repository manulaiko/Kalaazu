package package_4 {

import mx.core.IFlexModuleFactory;

import net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase;

import package_151.class_995;

public class class_1512 extends DOTabButtonBase {


    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1512() {
        super();
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

    override protected function setFactionIcon(param1: Object): void {
        var _loc2_: class_995 = param1 as class_995;
        if (_loc2_) {
            label = _loc2_.method_5063;
        }
    }
}
}
