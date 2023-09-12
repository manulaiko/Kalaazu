package package_33 {

import fl.containers.ScrollPane;

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.gui.class_58;

public class class_1549 extends class_93 {


    private var var_4938: ScrollPane;

    public function class_1549(param1: class_58, param2: int) {
        super(param1, param2);
        this.var_4938 = new ScrollPane();
        this.var_4938.source = this;
    }

    override public function addElement(param1: DisplayObject, param2: int = 0, param3: int = 5): void {
        super.addElement(param1, param2, param3);
        this.method_1826();
    }

    protected function method_1826(): void {
        this.var_4938.invalidate();
        this.var_4938.refreshPane();
    }

    public function method_3664(): ScrollPane {
        return this.var_4938;
    }

    override public function get method_4243(): DisplayObject {
        return this.var_4938;
    }

    override public function set visible(param1: Boolean): void {
        this.var_4938.visible = param1;
    }

    override public function get visible(): Boolean {
        return this.var_4938.visible;
    }
}
}
