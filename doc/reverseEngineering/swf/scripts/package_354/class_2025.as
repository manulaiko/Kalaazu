package package_354 {

import com.greensock.TweenMax;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_286.class_2024;

import package_75.class_2015;
import package_75.class_355;

import package_76.class_215;

import package_9.class_50;

public class class_2025 extends class_2024 {


    private var _effect: class_355;

    private var var_4535: class_2015;

    public function class_2025(param1: class_1206, param2: class_355) {
        this._effect = param2;
        super(param1, param2, true, false);
    }

    private function get method_1809(): class_355 {
        return effect as class_355;
    }

    override protected function method_30(): void {
        if (!method_5450) {
            return;
        }
        method_5450.addChildAt(this.clip, 0);
        var_1714.alpha = 1;
        var_1714.x = 0;
        var_1714.y = ship.hitArea.clickRadius;
        method_6420();
        if (this.method_1809.method_3435) {
            this.var_4535 = new class_2015(this._effect.source, this._effect.method_3034);
            class_50.getInstance().map.effects.method_5084(this.var_4535);
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this.var_4535) {
            class_50.getInstance().map.effects.method_1847(this.var_4535);
            this.var_4535 = null;
        }
        TweenMax.killDelayedCallsTo(this.method_4149);
        class_215.removeDisplayObject(clip);
        this.method_4149();
    }

    private function method_4149(): void {
        if (var_1714) {
            TweenMax.to(var_1714, 0.5, {
                "alpha": 0,
                "onComplete": super.disposeView
            });
        } else {
            super.disposeView();
        }
    }
}
}
