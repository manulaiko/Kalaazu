package package_57 {

import mx.core.IFlexModuleFactory;

import package_27.class_82;

public class class_1006 extends class_1005 {


    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1006() {
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

    override protected function name_92(): void {
        class_82.method_5398();
        class_82.method_6148(pattern.getPatternID());
    }

    override protected function getButtonText(): String {
        return "Update";
    }
}
}
