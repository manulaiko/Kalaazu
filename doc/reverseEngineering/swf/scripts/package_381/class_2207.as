package package_381 {

import com.greensock.TweenLite;
import com.greensock.TweenMax;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;

import package_75.class_1881;

public class class_2207 implements IDisposable {


    private var _view: class_2135;

    private var _tween: TweenMax;

    public function class_2207(param1: class_1211, param2: class_1881) {
        super();
        this._view = param1.method_3658.method_6501(param2.source.method_1954(class_306)) as class_2135;
        if (this._view) {
            this._view.alpha = 0.8;
            this._tween = TweenMax.to(this._view, 2, {
                "alpha": 0.2,
                "repeat": -1,
                "yoyo": true
            });
        }
    }

    public function disposeView(param1: Boolean = false): void {
        if (this._tween) {
            this._tween.kill();
            this._tween = null;
            TweenLite.to(this._view, 0.2, {"alpha": 1});
        }
    }
}
}
