package package_426 {

import com.greensock.TweenMax;
import com.greensock.TweenNano;

import flash.display.MovieClip;
import flash.display.Sprite;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_27.class_82;

import package_289.class_2366;

import package_312.class_1785;

import package_359.class_2082;
import package_359.class_2364;

public class class_2375 extends Sprite implements class_2366 {


    private var var_2734: class_1785;

    private var var_127: class_2082;

    private var var_9: class_306;

    public function class_2375() {
        super();
    }

    public function method_1804(param1: class_306, param2: class_2082, param3: Object): void {
        this.var_2734 = param1.owner as class_1785;
        this.var_9 = param1;
        this.var_127 = param2;
        this.var_2734.name_167.changed.add(this.updateView);
        this.var_2734.name_75.changed.add(this.updateView);
        this.var_2734.name_167.changed.add(this.method_4287);
        this.updateView();
    }

    private function method_4287(): void {
        if (!this.var_2734.enabled.value) {
            return;
        }
        var _loc1_: Number = Number(this.var_2734.method_1548);
        if (_loc1_ == 0) {
            class_82.playSoundEffect(class_126.const_2542);
        } else if (_loc1_ == 1) {
            class_82.playSoundEffect(class_126.const_3323);
        }
    }

    private function method_2614(): void {
        if (this.var_2734.name_167.value == this.var_2734.name_70.value) {
            this.setProgress(1, true);
            TweenNano.killTweensOf(this.method_4824);
            TweenNano.killTweensOf(this.method_2614);
            TweenNano.delayedCall(1 + Math.random() * 2, this.method_4824);
        }
    }

    private function method_4824(): void {
        if (this.var_2734.name_167.value == this.var_2734.name_70.value) {
            this.setProgress(1, true);
            TweenNano.delayedCall(0.2, this.method_2614);
        }
    }

    private function updateView(): void {
        var _loc1_: String = class_126.getInstance().method_2919[this.var_2734.name_75.value] as String;
        this.var_9.state.value = _loc1_ || true;
        this.method_2614();
        this.setProgress(this.var_2734.method_1548, false);
    }

    private function setProgress(param1: Number, param2: Boolean): void {
        var _loc4_: * = null;
        var _loc3_: Vector.<class_2364> = this.var_127.method_5026();
        for each(_loc4_ in _loc3_) {
            TweenMax.to(_loc4_.asset, param2 ? 0 : 1, {"frame": Math.round(1 + param1 * (Number(MovieClip(_loc4_.asset).totalFrames) - 2))});
        }
    }
}
}
