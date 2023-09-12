package package_426 {

import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.IAnimatedViewContainer;

import package_22.class_198;
import package_22.class_222;

import package_289.class_2366;

import package_359.class_2082;
import package_359.class_2363;

import package_36.class_184;

import package_9.class_50;

public class class_2376 implements class_2366 {


    private var _container: IAnimatedViewContainer;

    private var var_176: class_306;

    private var var_127: class_2082;

    public function class_2376() {
        super();
    }

    public function method_1804(param1: class_306, param2: class_2082, param3: Object): void {
        this.var_127 = param2;
        this.var_127.var_1257 = this.disposeView;
        this._container = (this.var_127.method_4434("view") as class_2363).view;
    }

    private function disposeView(): void {
        this._container.stopTween("default");
        this._container.startTween("close");
        setTimeout(this.cleanup, 700);
        setTimeout(class_50.getInstance().map.effects.method_5084, 200, new class_184(this.var_176.owner.x, this.var_176.owner.y, this.var_176.owner.z, class_198.method_1020(class_222.const_1974, 3)));
    }

    private function cleanup(): void {
        this.var_127.var_1257 = null;
        this.var_127.disposeView();
    }
}
}
