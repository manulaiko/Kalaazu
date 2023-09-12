package package_279 {

import com.greensock.TweenMax;

import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.Rectangle;

import package_11.class_39;

import package_113.class_2285;

import package_76.class_215;

import package_9.ResourceManager;

public class class_2325 extends class_2323 {

    private static const MAPPING: Array = [];

    {
        MAPPING[class_2285.BUFF] = "dmgBuff";
        MAPPING[class_2285.DEBUFF] = "dmgDebuff";
    }

    private var var_176: class_2285;

    private var _mc: MovieClip;

    public function class_2325(param1: class_2285) {
        super();
        this.var_176 = param1;
        addEventListener(Event.ADDED_TO_STAGE, this.handleAdded);
        addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemoved);
        this.load();
    }

    private function load(): void {
        ResourceManager.name_15.load("dmgBuffs", this.method_350);
    }

    private function method_350(param1: class_39): void {
        class_215.removeDisplayObject(this._mc);
        this._mc = param1.getEmbeddedMovieClip(MAPPING[this.var_176.type]);
        addChild(this._mc);
        this.update();
    }

    private function handleRemoved(param1: Event): void {
        this.var_176.level.changed.remove(this.update);
        this.var_176.type.changed.remove(this.load);
    }

    private function handleAdded(param1: Event): void {
        this.var_176.level.changed.add(this.update);
        this.var_176.type.changed.add(this.load);
    }

    private function update(): void {
        if (this._mc) {
            this.method_724(this.var_176.level.value);
            sizeChanged.dispatch();
        }
    }

    private function method_724(param1: int): void {
        this._mc.gotoAndStop(Math.min(param1, this._mc.framesLoaded) as int);
        var _loc2_: Rectangle = this._mc.getBounds(this._mc);
        this._mc.x = -_loc2_.x;
        this._mc.y = -_loc2_.y;
        TweenMax.to(this._mc, 1, {
            "glowFilter": {
                "color": 16777215,
                "blurX": 3,
                "blurY": 3,
                "strength": 2,
                "alpha": 1
            },
            "onComplete": this.method_5583
        });
    }

    private function method_5583(): void {
        TweenMax.to(this._mc, 1, {
            "glowFilter": {
                "color": 16777215,
                "blurX": 3,
                "blurY": 3,
                "strength": 2,
                "alpha": 0,
                "remove": true
            }
        });
    }
}
}
