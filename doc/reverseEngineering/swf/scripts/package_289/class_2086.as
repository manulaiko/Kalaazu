package package_289 {

import flash.display.Sprite;

import net.bigpoint.darkorbit.map.common.IDisposable;

import package_258.class_2079;

import package_360.class_2381;

public class class_2086 extends Sprite implements IDisposable {


    private var var_176: class_2079;

    private var var_500: class_2381;

    public function class_2086(param1: class_2079) {
        super();
        this.var_176 = param1;
        this.var_176.position.changed.add(this.updatePosition);
        this.initView();
        this.updatePosition();
    }

    private function initView(): void {
        this.var_500 = new class_2381(null, this.var_176.rotation);
        this.var_500.load(this.var_176.res.srcKey, this.var_176.res.resKey, this.var_176.rotatable, this.var_176.loop);
        addChild(this.var_500);
    }

    private function updatePosition(): void {
        x = this.var_176.position.x;
        y = this.var_176.position.y;
    }

    public function disposeView(param1: Boolean = false): void {
        this.var_176.position.changed.remove(this.updatePosition);
        this.var_500.cleanup();
        if (parent) {
            parent.removeChild(this);
        }
    }
}
}
