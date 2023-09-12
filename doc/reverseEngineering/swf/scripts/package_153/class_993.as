package package_153 {

import flash.events.MouseEvent;

import mx.core.IFlexModuleFactory;
import mx.core.IVisualElement;
import mx.events.FlexEvent;

import spark.components.List;

public class class_993 extends List {


    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2755: int;

    public function class_993() {
        super();
        this.addEventListener("creationComplete", this.method_2784);
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

    override protected function item_mouseDownHandler(param1: MouseEvent): void {
        var _loc2_: Number = Number(dataGroup.getElementIndex(param1.currentTarget as IVisualElement));
        selectedIndices = calculateSelectedIndices(_loc2_, param1.shiftKey, true);
    }

    protected function mouseWheelHandler(param1: MouseEvent): void {
        param1.delta = param1.delta > 0 ? int(this.var_2755) : -Number(this.var_2755);
    }

    public function set method_5477(param1: int): void {
        this.var_2755 = param1;
    }

    private function init(): void {
        addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseWheelHandler, true);
    }

    public function method_2784(param1: FlexEvent): void {
        this.init();
    }
}
}
