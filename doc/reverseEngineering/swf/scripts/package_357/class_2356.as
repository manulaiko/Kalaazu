package package_357 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.ColorTransform;
import flash.geom.Vector3D;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.mvc.battleStation.BattleStationModule;

import package_11.class_39;

import package_181.class_1104;

import package_22.class_1090;
import package_22.class_198;
import package_22.class_222;
import package_22.class_426;

import package_27.class_82;

import package_36.class_184;

import package_75.class_349;

import package_9.ResourceManager;
import package_9.class_2314;
import package_9.class_50;

public class class_2356 extends Sprite {


    private const RADTODEG: Number = 57.29577951308232;

    private var var_2766: class_1090;

    private var var_460: class_299;

    private var var_2688: class_287;

    private var var_907: class_426;

    private var var_4249: Boolean;

    private var var_3692: Boolean;

    private var var_337: Boolean;

    private var var_4728: MovieClip;

    private var _duration: Number;

    private var var_85: Boolean;

    private var var_4102: Vector3D;

    private var var_2590: int = -2147483648;

    private var var_1076: int = -2147483648;

    private var var_32: int = -2147483648;

    private var var_2476: int = -2147483648;

    public function class_2356(param1: class_299, param2: class_287, param3: Boolean, param4: class_426, param5: class_1090, param6: Boolean, param7: Boolean = false, param8: Number = 0) {
        this.var_4102 = new Vector3D();
        super();
        this.var_460 = param1;
        this.var_2688 = param2;
        this.var_85 = param3;
        this._duration = Math.max(0.5, Number(class_73.method_5461(param1.owner.position, param2.owner.position)) / 500);
        if (param7) {
            this._duration += 0.3;
        }
        this.var_2766 = param5;
        this.var_337 = param6;
        this.var_4249 = param7;
        this.var_907 = param4;
        addChild(ResourceManager.getMovieClip(this.var_907.getResKey(), "mc"));
        x = this.var_460.owner.position.x + this.var_460.rocketLauncher.name_53.x;
        y = this.var_460.owner.position.y + this.var_460.rocketLauncher.name_53.y;
        this.var_2590 = x;
        this.var_1076 = y;
        var _loc9_: Object = {
            "dynamicProps": {
                "x": this.method_791,
                "y": this.method_853
            },
            "delay": param8,
            "onUpdate": this.onUpdate,
            "onComplete": this.method_2178
        };
        if (Boolean(this.var_4249) || Boolean(this.var_337) || this.var_460.owner is BattleStationModule) {
            this.var_4102.x = this.var_460.rocketLauncher.direction.x;
            this.var_4102.y = this.var_460.rocketLauncher.direction.y;
            TweenLite.to(this.var_4102, Number(this._duration) * 0.7, {
                "x": 0,
                "y": 0,
                "z": 0,
                "delay": _loc9_.delay
            });
        } else {
            _loc9_.ease = Linear.easeNone;
        }
        TweenLite.to(this, this._duration, _loc9_);
        this.var_3692 = this.var_2688.owner.id == class_81.userID;
        if (this.var_337) {
            ResourceManager.name_15.load("minePulse", this.method_4366);
        }
    }

    private function dispose(): void {
        if (parent) {
            parent.removeChild(this);
        }
    }

    private function method_4366(param1: class_39): void {
        this.var_4728 = param1.getEmbeddedMovieClip("mc");
        var _loc2_: ColorTransform = new ColorTransform();
        _loc2_.color = 16711680;
        this.var_4728.transform.colorTransform = _loc2_;
        addChild(this.var_4728);
        this.method_2913(this.var_4728, 15);
        this.var_4728.x = -30;
    }

    private function method_2913(param1: MovieClip, param2: int): void {
        var _loc3_: int = param1.framesLoaded;
        var _loc4_: Number = _loc3_ / param2;
        param1.gotoAndStop(1);
        class_82.playSoundEffect(class_126.const_2639, false, false, param1.parent.x, param1.parent.y);
        TweenLite.to(param1, _loc4_, {
            "ease": Linear.easeNone,
            "frame": _loc3_,
            "onComplete": this.method_2913,
            "onCompleteParams": [param1, param2]
        });
    }

    public function method_2178(): void {
        if (this.var_4728 != null) {
            TweenLite.killTweensOf(this.var_4728);
            if (this.var_4728.parent) {
                this.var_4728.parent.removeChild(this.var_4728);
            }
        }
        if (!this.var_85) {
            if (this.var_2688.owner.id == class_81.userID || this.var_460.owner.id == class_81.userID) {
                class_50.getInstance().map.effects.method_5084(new class_349(this.var_2688.owner, 0));
            }
            this.method_5577(class_198.method_1020(class_222.const_964, 1));
        }
        if (Boolean(this.var_85) || Boolean(this.var_4249)) {
            this.method_5577(class_198.method_1020(class_222.const_2635, 1));
        }
        this.dispose();
    }

    private function method_5577(param1: class_222): void {
        class_50.getInstance().map.effects.method_269(new class_184(x, y, 0, param1, this.var_2688.owner));
    }

    private function onUpdate(): void {
        var _loc2_: * = null;
        var _loc1_: Number = Math.atan2(Number(y) - Number(this.var_1076), Number(x) - Number(this.var_2590)) * 57.29577951308232;
        rotation = Math.round(_loc1_ + 180);
        this.var_2590 = x;
        this.var_1076 = y;
        if (Math.abs(Number(x) - Number(this.var_32)) + Math.abs(Number(y) - Number(this.var_2476)) > this.var_2766.particleInterval) {
            this.var_32 = x;
            this.var_2476 = y;
            _loc2_ = class_2314.method_6083(this.var_2766.resKey);
            if (_loc2_ == null) {
                return;
            }
            _loc2_.x = x;
            _loc2_.y = y;
            if (parent) {
                parent.addChild(_loc2_);
                _loc2_.frame = 1;
                TweenLite.to(_loc2_, this.var_2766.particleDuration, {
                    "ease": Linear.easeNone,
                    "frame": _loc2_.framesLoaded,
                    "onComplete": this.method_2871,
                    "onCompleteParams": [_loc2_]
                });
            }
        }
    }

    private function method_791(): Number {
        return this.var_2688.owner.position.x + this.var_4102.x;
    }

    private function method_853(): Number {
        return this.var_2688.owner.position.y + this.var_4102.y;
    }

    private function method_2871(param1: class_1104): void {
        if (param1 != null) {
            if (param1.parent != null) {
                param1.parent.removeChild(param1);
            }
            class_2314.method_5206(param1);
        }
    }

    public function get duration(): Number {
        return this._duration;
    }
}
}
