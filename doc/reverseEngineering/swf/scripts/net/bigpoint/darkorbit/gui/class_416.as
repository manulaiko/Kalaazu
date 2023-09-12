package net.bigpoint.darkorbit.gui {

import com.bigpoint.utils.class_129;
import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import flash.display.MovieClip;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_138.class_421;

import package_26.class_333;

import package_9.ResourceManager;

public class class_416 {


    private var target: class_421;

    private var seconds: int;

    private var var_3300: Function;

    private var tooltip: class_333;

    private var tooltipKey: String;

    private var tween: TweenLite;

    private var cooldown: MovieClip;

    public function class_416(param1: class_421, param2: int, param3: class_333, param4: String, param5: Function = null) {
        super();
        this.tooltip = param3;
        this.tooltipKey = param4;
        this.var_3300 = param5;
        this.seconds = param2;
        this.target = param1;
    }

    public function method_5646(): void {
        this.cooldown = ResourceManager.getMovieClip("ui", "cooldown");
        this.cooldown.alpha = 0.6;
        this.cooldown.y = -2;
        this.cooldown.x = -2;
        this.target.addChild(this.cooldown);
        this.tween = TweenLite.to(this.cooldown, this.seconds, {
            "onUpdate": this.onUpdate,
            "frame": this.cooldown.totalFrames,
            "ease": Linear.easeNone,
            "onComplete": this.onComplete
        });
    }

    private function onUpdate(param1: Array = null): void {
        var _loc2_: * = null;
        if (this.tween) {
            _loc2_ = class_88.getItem(this.tooltipKey);
            _loc2_ += " " + class_88.getItem("ttip_pet_gear_cooldown_addendum").replace("%TIME%", class_129.method_1101(Number(this.seconds) - Math.round(this.tween.currentTime)));
            this.tooltip.method_1455(_loc2_);
        }
    }

    private function onComplete(param1: Array = null): void {
        this.tooltip.method_1455(class_88.getItem(this.tooltipKey));
        this.target.removeChild(this.cooldown);
        if (this.var_3300 != null) {
            this.var_3300(this.target);
        }
    }
}
}
