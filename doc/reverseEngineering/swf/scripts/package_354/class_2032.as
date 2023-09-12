package package_354 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenMax;
import com.greensock.easing.Linear;

import flash.display.MovieClip;
import flash.media.SoundChannel;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_14.class_52;

import package_27.class_82;

import package_286.class_2024;

import package_75.class_1482;

import package_9.ResourceManager;
import package_9.class_50;

public class class_2032 extends class_2024 implements class_52 {


    private var var_419: TweenMax;

    private var var_3999: SoundChannel;

    private var var_389: SoundChannel;

    private var var_301: Boolean = false;

    private var var_174: Boolean = false;

    private var var_736: Vector.<MovieClip>;

    private var var_347: Vector.<MovieClip>;

    private var _effect: class_1482;

    private var var_1255: class_73;

    public function class_2032(param1: class_1206, param2: class_1482) {
        this.var_736 = new Vector.<MovieClip>();
        this.var_1255 = new class_73(-2, -2);
        this._effect = param2;
        this.var_174 = param2.method_668;
        super(param1, param2, true);
    }

    private function reload(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        this.method_3330();
        this.var_736 = new Vector.<MovieClip>();
        if (method_5450 != null) {
            this.var_347 = method_5450.engines.method_2839;
            _loc2_ = 0;
            while (_loc2_ < this.var_347.length) {
                if (this.var_347[_loc2_] != undefined && this.var_347[_loc2_] != null) {
                    _loc1_ = ResourceManager.getMovieClip(pattern.resKey, "mc");
                    _loc1_.alpha = 0;
                    _loc1_.x = this.var_347[_loc2_].x;
                    _loc1_.y = this.var_347[_loc2_].y;
                    _loc1_.rotation = ship.rotation.degrees;
                    addChild(_loc1_);
                    this.var_736.push(_loc1_);
                }
                _loc2_++;
            }
        }
        clip.visible = false;
    }

    override protected function method_30(): void {
        this.reload();
        if (this.var_174) {
            this.var_419 = TweenMax.to(this.var_1255, 0.075, {
                "y": 2,
                "x": 2,
                "repeat": -1,
                "yoyo": true
            });
            if (true) {
                this.var_419.pause();
            }
            ship.name_39.add(this.name_39);
            ship.name_21.add(this.name_21);
        }
        class_50.method_5621(this);
    }

    private function name_21(): void {
        this.var_419.pause();
    }

    private function name_39(): void {
        this.var_419.resume();
    }

    private function method_1146(): void {
        if (this.var_736.length != this.var_347.length) {
            this.reload();
        }
        if (false) {
            this.method_1870();
        } else {
            this.method_4668();
        }
    }

    private function method_1870(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        for each(_loc1_ in this.var_736) {
            _loc1_.visible = true;
        }
        if (clip != null) {
            if (method_5450 != null) {
                method_5450.x += this.var_1255.x;
                method_5450.y += this.var_1255.y;
            }
            if (!this.var_301 && method_5450 != null && Boolean(ship.method_6225())) {
                this.var_3999 = class_82.playSoundEffect(class_126.const_367, false, false, ship.x, ship.y);
                this.var_301 = true;
            }
            _loc2_ = 0;
            while (_loc2_ < this.var_736.length) {
                TweenMax.to(this.var_736[_loc2_], 0.1, {
                    "ease": Linear.easeNone,
                    "alpha": 1
                });
                TweenMax.to(this.var_736[_loc2_], 0.25, {"shortRotation": {"rotation": ship.rotation.degrees}});
                this.var_736[_loc2_].x = this.var_347[_loc2_].x;
                this.var_736[_loc2_].y = this.var_347[_loc2_].y;
                _loc2_++;
            }
            if (this.var_389 == null && Boolean(ship.method_6225())) {
                _loc3_ = -1;
                if (method_5450 != null) {
                    if (ship.shipPattern.getPatternID() == "69") {
                        _loc3_ = 0;
                    } else if (ship.shipPattern.getPatternID() == "18") {
                        _loc3_ = 0;
                    }
                    if (_loc3_ != -1) {
                        this.var_389 = class_82.playSoundEffect(_loc3_, true, true);
                    }
                }
            }
        }
    }

    private function method_4668(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        if (method_5450 != null) {
            _loc1_ = 0;
            while (_loc1_ < this.var_736.length) {
                _loc2_ = this.var_736[_loc1_];
                TweenMax.to(_loc2_, 0.1, {
                    "ease": Linear.easeNone,
                    "alpha": 0
                });
                _loc2_.x = this.var_347[_loc1_].x;
                _loc2_.y = this.var_347[_loc1_].y;
                _loc1_++;
            }
            if (this.var_389 != null) {
                class_82.method_401(this.var_389, true);
                this.var_389 = null;
            }
        }
    }

    private function method_3330(): void {
        var _loc1_: * = null;
        while (this.var_736 != null && this.var_736.length > 0) {
            _loc1_ = this.var_736.pop();
            if (_loc1_.parent) {
                _loc1_.parent.removeChild(_loc1_);
            }
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        class_50.removeObserver(this);
        this.method_3330();
        if (this._effect.method_668) {
            TweenMax.killTweensOf(this.var_1255);
            ship.name_39.remove(this.name_39);
            ship.name_21.remove(this.name_21);
            if (method_5450 != null) {
                method_5450.x = 0 - Number(this.var_1255.x);
                method_5450.y = 0 - Number(this.var_1255.y);
            }
        }
        if (this.var_389 != null) {
            class_82.method_401(this.var_389, true);
            this.var_389 = null;
        }
        super.disposeView(param1);
    }

    public function updateTimer(param1: Number): void {
        this.method_1146();
    }
}
}
