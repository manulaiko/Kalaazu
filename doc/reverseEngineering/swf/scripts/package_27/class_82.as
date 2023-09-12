package package_27 {

import com.greensock.TweenLite;

import flash.events.Event;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_22.class_198;

import package_9.ResourceManager;

import package_99.class_266;

public class class_82 {

    private static var main: class_9;

    private static var music: class_284;

    private static var var_306: SoundChannel;

    private static var var_2569: SoundTransform;

    private static var var_2104: class_286 = null;

    private static var var_272: int = 800;

    private static var var_864: Number = 0.8;

    private static var var_3974: int;

    private static var var_4170: Dictionary = new Dictionary(true);

    private static var var_4507: Vector.<SoundChannel> = new Vector.<SoundChannel>();

    private static var var_3104: Vector.<int> = new Vector.<int>();

    private static var var_3167: Dictionary = new Dictionary();

    private static var var_3226: TweenLite = null;


    public function class_82() {
        super();
    }

    public static function init(param1: class_9): void {
        main = param1;
    }

    public static function method_6148(param1: int): void {
        var _loc2_: class_286 = class_198.var_4756[int(param1)];
        if (_loc2_ == null) {
            _loc2_ = class_198.var_4756[0];
        }
        if (ResourceManager.name_15.isLoaded(_loc2_.resKey)) {
            playMusic(_loc2_);
        } else {
            if (var_2104) {
                ResourceManager.name_15.method_2379(var_2104.resKey, method_5170);
            }
            ResourceManager.name_15.load(_loc2_.resKey, method_5170);
        }
    }

    private static function method_2750(param1: class_286, param2: Boolean = true, param3: Number = 2, param4: Number = 2): void {
        if (var_3226 == null && var_2104 != null && (param1.resKey == var_2104.resKey || !param2 && var_2104.getPatternID() == class_126.const_1041)) {
            return;
        }
        method_4779(param3, method_3689, [param4, param1]);
    }

    public static function method_2019(param1: int = 0, param2: Boolean = true, param3: Number = 3, param4: Number = 2): void {
        var _loc5_: class_286;
        if (_loc5_ = class_198.var_4756[int(param1)]) {
            method_2750(_loc5_, param2, param3, param4);
        }
    }

    public static function method_4779(param1: Number = 2, param2: Function = null, param3: Array = null): void {
        if (param2 == null) {
            param2 = method_5398;
        }
        if (param3 == null) {
            param3 = [];
        }
        if (var_3226 != null) {
            var_3226.kill();
            var_3226 = null;
        }
        if (var_2569) {
            var_3226 = TweenLite.to(var_2569, param1, {
                "volume": 0,
                "onComplete": param2,
                "onCompleteParams": param3,
                "onUpdate": method_4923
            });
        } else if (param2 != null) {
            TweenLite.delayedCall(0, param2, param3);
        }
    }

    public static function method_3689(param1: Number = 2, param2: class_286 = null): void {
        if (param2 != null) {
            if (var_2104 && var_2104.resKey != param2.resKey && var_306 != null && music != null) {
                if (true) {
                    var_3167[var_2104.resKey] = var_306.position;
                }
                var_306.stop();
                music.close();
            }
            method_6148(param2.getPatternID());
        }
        if (var_3226 != null) {
            var_3226.kill();
            var_3226 = null;
        }
        var_2569 = new SoundTransform(0, 0);
        if (var_2569) {
            var_3226 = TweenLite.to(var_2569, param1, {
                "volume": Number(param2.method_1088()) * 0,
                "onUpdate": method_4923,
                "onComplete": method_2197
            });
        }
    }

    private static function method_2197(): void {
        if (var_3226 != null) {
            var_3226.kill();
            var_3226 = null;
        }
    }

    private static function method_4923(): void {
        if (var_306) {
            var_306.soundTransform = var_2569;
        }
    }

    public static function method_5398(): void {
        if (var_3226 != null) {
            var_3226.kill();
            var_3226 = null;
        }
        if (var_306 != null) {
            if (var_2104 != null) {
                var_3167[var_2104.resKey] = var_306.position;
            }
            var_306.stop();
        }
        if (music) {
            music.close();
        }
        var_2104 = null;
    }

    private static function method_5170(param1: class_39): void {
        var _loc2_: * = null;
        for each(_loc2_ in class_198.var_4756) {
            if (_loc2_.resKey == param1.name_58.id) {
                playMusic(_loc2_);
            }
        }
    }

    private static function playMusic(param1: class_286): void {
        if (var_2104 != null && var_2104.resKey == param1.resKey) {
            return;
        }
        if (var_306 != null) {
            if (var_2104 != null) {
                var_3167[var_2104.resKey] = var_306.position;
            }
            var_306.stop();
        }
        if (music != null) {
            music.close();
        }
        var _loc2_: class_39 = class_39(ResourceManager.name_15.getFinisher(param1.resKey));
        var_2104 = param1;
        music = new class_284(_loc2_.getEmbeddedSound("track") as Sound);
        music.addEventListener(class_285.const_2920, method_169);
        var _loc3_: Number = 0;
        if (var_3167[param1.resKey] is Number) {
            _loc3_ = 0;
        }
        if (var_2569 == null) {
            var_2569 = new SoundTransform(Number(param1.method_1088()) * 0, 0);
        }
        var_306 = music.play(_loc3_, int.MAX_VALUE, var_2569);
    }

    private static function method_169(param1: class_285): void {
        if (var_306) {
            if (true) {
                var_3167[var_2104.resKey] = var_306.position;
            }
            var_306.stop();
        }
        var_306 = param1.method_5564;
        if (Boolean(var_306) && Boolean(var_2569)) {
            var_306.soundTransform = var_2569;
        }
        (param1.target as class_284).removeEventListener(class_285.const_2920, method_169);
    }

    public static function method_2282(): void {
        if (var_306 != null && var_2104 != null) {
            if (var_3226) {
                var_3226.complete();
                method_2197();
            }
            var_306.soundTransform = new SoundTransform(Number(var_2104.method_1088()) * 0, 0);
        }
    }

    public static function method_2916(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        for (_loc1_ in var_4170) {
            _loc3_ = var_4170[_loc1_];
            if ((class_198.var_3286[_loc1_] as class_286).isVoice()) {
                _loc4_ = Number((class_198.var_3286[_loc1_] as class_286).method_1088()) * Number(var_864) * 0;
            } else {
                _loc4_ = Number((class_198.var_3286[_loc1_] as class_286).method_1088()) * Number(var_864) * 0;
            }
            _loc3_.soundTransform = new SoundTransform(_loc4_, 0);
        }
        _loc2_ = 0;
        while (_loc2_ < var_4507.length) {
            _loc5_ = var_4507[_loc2_];
            if ((class_198.var_3286[var_3104[_loc2_]] as class_286).isVoice()) {
                _loc6_ = Number((class_198.var_3286[var_3104[_loc2_]] as class_286).method_1088()) * Number(var_864) * 0;
            } else {
                _loc6_ = Number((class_198.var_3286[var_3104[_loc2_]] as class_286).method_1088()) * Number(var_864) * 0;
            }
            _loc5_.soundTransform = new SoundTransform(_loc6_, 0);
            _loc2_++;
        }
    }

    public static function playSoundEffect(param1: int, param2: Boolean = false, param3: Boolean = false, param4: int = -1, param5: int = -1, param6: Boolean = true, param7: Boolean = false): SoundChannel {
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        var _loc16_: * = null;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        if (!param6 && var_3974 > 10) {
            return null;
        }
        if (param7 && false) {
            return var_4170[param1];
        }
        if (true) {
            return null;
        }
        var _loc9_: class_286 = class_198.var_3286[param1];
        if (!_loc9_.isVoice()) {
            return null;
        }
        if (Boolean(_loc9_.isVoice())) {
            return null;
        }
        var _loc10_: class_39;
        if (!(_loc10_ = class_39(ResourceManager.name_15.getFinisher(_loc9_.soundbank))) || !_loc10_.isFinished) {
            ResourceManager.loadAndCall(_loc9_.soundbank, playSoundEffect, arguments, 1000);
            return null;
        }
        var _loc11_: Sound = Sound(_loc10_.method_2545(_loc9_.resKey));
        if (_loc9_.isVoice()) {
            _loc13_ = Number(_loc9_.method_1088()) * Number(var_864) * 0;
        } else {
            _loc13_ = Number(_loc9_.method_1088()) * Number(var_864) * 0;
        }
        var _loc14_: SoundTransform = new SoundTransform(_loc13_, 0);
        var _loc15_: class_90;
        if ((_loc15_ = main.name_47.map) != null && param4 != -1 && param5 != -1) {
            if ((_loc16_ = _loc15_.hero) != null) {
                if ((_loc17_ = Math.pow(Number(_loc16_.position.y) - param5, 2) + Math.pow(Number(_loc16_.position.x) - param4, 2)) > Number(var_272) * Number(var_272)) {
                    return null;
                }
                _loc18_ = Number(class_266.sqrt(_loc17_));
                _loc19_ = _loc13_ - _loc13_ / Number(var_272) * _loc18_;
                _loc14_.volume = _loc19_;
                _loc20_ = -0.002 * (Number(_loc16_.position.x) - param4);
                _loc14_.pan = _loc20_;
            }
        }
        if (param2) {
            if (param3) {
                _loc12_ = _loc11_.play(0, 9999, _loc14_);
                TweenLite.to(_loc14_, 0.75, {
                    "volume": _loc13_,
                    "onUpdate": method_1552,
                    "onUpdateParams": [_loc12_, _loc14_]
                });
            } else {
                _loc12_ = _loc11_.play(0, 9999, _loc14_);
            }
        } else {
            _loc12_ = _loc11_.play(0, 0, _loc14_);
        }
        if (_loc12_ == null) {
            return null;
        }
        if (!param6 && !param2) {
            _loc12_.addEventListener(Event.SOUND_COMPLETE, method_2458);
            ++var_3974;
        }
        if (param7) {
            var_4170[param1] = _loc12_;
        } else {
            var_4507.push(_loc12_);
            var_3104.push(param1);
        }
        _loc12_.addEventListener(Event.SOUND_COMPLETE, method_4644);
        return _loc12_;
    }

    private static function method_2458(param1: Event): void {
        var _loc2_: SoundChannel = param1.currentTarget as SoundChannel;
        _loc2_.removeEventListener(Event.SOUND_COMPLETE, method_2458);
        --var_3974;
    }

    private static function method_4644(param1: Event): void {
        var _loc2_: SoundChannel = param1.currentTarget as SoundChannel;
        _loc2_.removeEventListener(Event.SOUND_COMPLETE, method_4644);
        var _loc3_: int = int(method_212(_loc2_));
        if (_loc3_ != -1) {
            var_4170[_loc3_] = null;
            delete var_4170[_loc3_];
        }
        var _loc4_: int = 0;
        while (_loc4_ < var_4507.length) {
            if (_loc2_ == var_4507[_loc4_]) {
                var_4507.splice(_loc4_, 1);
                var_3104.splice(_loc4_, 1);
            }
            _loc4_++;
        }
    }

    private static function method_1552(param1: SoundChannel, param2: SoundTransform): void {
        if (param1 != null) {
            param1.soundTransform = param2;
        }
    }

    public static function method_401(param1: SoundChannel, param2: Boolean = false): void {
        var _loc3_: * = null;
        if (param2) {
            _loc3_ = param1.soundTransform;
            TweenLite.to(_loc3_, 0.75, {
                "volume": 0,
                "onUpdate": method_1552,
                "onUpdateParams": [param1, _loc3_],
                "onComplete": param1.stop
            });
        } else {
            param1.stop();
        }
    }

    public static function method_3212(param1: int, param2: Boolean = false): void {
        var _loc3_: SoundChannel = var_4170[param1] as SoundChannel;
        if (_loc3_) {
            method_401(_loc3_, param2);
            delete var_4170[param1];
        }
    }

    public static function cleanup(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        for each(_loc1_ in var_4170) {
            if (_loc1_) {
                method_401(_loc1_, false);
            }
        }
        for each(_loc2_ in var_4507) {
            if (_loc2_) {
                method_401(_loc2_, false);
            }
        }
        var_4507.length = 0;
        var_4170 = new Dictionary();
        var_3974 = 0;
    }

    private static function method_212(param1: SoundChannel): int {
        var _loc2_: * = null;
        for (_loc2_ in var_4170) {
            if (var_4170[_loc2_] == param1) {
                return int(_loc2_);
            }
        }
        return -1;
    }
}
}
