package package_426 {

import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import flash.display.DisplayObject;
import flash.display.MovieClip;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.settings.Settings;

import package_181.class_1104;

import package_289.class_2366;

import package_359.class_2082;
import package_359.class_2364;

import package_69.Box;
import package_69.class_180;

public class class_2368 implements class_2366, IDisposable {


    private var var_176: class_306;

    private var var_4140: class_180;

    private var var_127: class_2082;

    public function class_2368() {
        super();
    }

    public function method_1804(param1: class_306, param2: class_2082, param3: Object): void {
        this.var_176 = param1;
        this.var_127 = param2;
        this.var_127.var_1257 = this.method_3283;
        this.var_4140 = param1.owner as class_180;
        this.var_4140.name_43.add(this.method_3698);
        this.var_127.alpha = 0;
        TweenLite.to(this.var_127, 0.2, {
            "alpha": 1,
            "ease": Quad.easeOut
        });
        if (this.var_4140 is Box && Boolean(this.var_4140.method_4697) && Settings.qualityCollectable.value > Settings.QUALITY_LOW) {
            this.var_127.y = Number(this.var_4140.y) - 100;
            TweenLite.to(this.var_127, 0.3, {
                "y": this.var_4140.y,
                "ease": Quad.easeInOut
            });
        }
        Settings.qualityCollectable.changed.add(this.method_5630);
        this.method_5630();
    }

    private function method_5630(): void {
        var _loc1_: DisplayObject = class_2364(this.var_127.method_4434("mc")).asset;
        if (Settings.qualityCollectable.value == Settings.QUALITY_LOW) {
            if (_loc1_ is MovieClip) {
                MovieClip(_loc1_).gotoAndStop(0);
            } else if (_loc1_ is class_1104) {
                class_1104(_loc1_).gotoAndStop(0);
            }
        } else if (_loc1_ is MovieClip) {
            MovieClip(_loc1_).play();
        } else if (_loc1_ is class_1104) {
            class_1104(_loc1_).play();
        }
    }

    private function method_3283(): void {
        if (!this.var_4140.method_364) {
            TweenLite.to(this.var_127, 0.4, {
                "alpha": 0,
                "ease": Quad.easeIn,
                "onComplete": this.method_3879
            });
        }
    }

    private function method_3698(): void {
        TweenLite.to(this.var_127, 0.5, {
            "delay": 0.3,
            "alpha": 0,
            "y": "-50",
            "ease": Quad.easeIn,
            "onComplete": this.method_3879
        });
    }

    private function method_3879(): void {
        TweenLite.killTweensOf(this.var_127);
        if (this.var_127.parent) {
            this.var_127.parent.removeChild(this.var_127);
        }
        this.var_4140.name_43.remove(this.method_3698);
        this.var_4140 = null;
        this.var_127.var_1257 = null;
    }

    public function disposeView(param1: Boolean = false): void {
        Settings.qualityCollectable.changed.remove(this.method_5630);
        this.var_4140.name_43.remove(this.method_3698);
    }
}
}
