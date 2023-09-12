package starling.animation {

import starling.core.starling_internal;
import starling.events.Event;
import starling.events.EventDispatcher;

public class Juggler implements IAnimatable {


    private var mObjects: Vector.<IAnimatable>;

    private var mElapsedTime: Number;

    public function Juggler() {
        super();
        this.mElapsedTime = 0;
        this.mObjects = new Vector.<IAnimatable>(0);
    }

    public function add(param1: IAnimatable): void {
        var _loc2_: * = null;
        if (Boolean(param1) && this.mObjects.indexOf(param1) == -1) {
            this.mObjects.push(param1);
            _loc2_ = param1 as EventDispatcher;
            if (_loc2_) {
                _loc2_.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
            }
        }
    }

    public function contains(param1: IAnimatable): Boolean {
        return this.mObjects.indexOf(param1) != -1;
    }

    public function remove(param1: IAnimatable): void {
        if (param1 == null) {
            return;
        }
        var _loc2_: EventDispatcher = param1 as EventDispatcher;
        if (_loc2_) {
            _loc2_.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
        }
        var _loc3_: int = this.mObjects.indexOf(param1);
        if (_loc3_ != -1) {
            this.mObjects[_loc3_] = null;
        }
    }

    public function removeTweens(param1: Object): void {
        var _loc3_: * = null;
        if (param1 == null) {
            return;
        }
        var _loc2_: int = this.mObjects.length - 1;
        while (_loc2_ >= 0) {
            _loc3_ = this.mObjects[_loc2_] as Tween;
            if (Boolean(_loc3_) && _loc3_.target == param1) {
                _loc3_.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
                this.mObjects[_loc2_] = null;
            }
            _loc2_--;
        }
    }

    public function containsTweens(param1: Object): Boolean {
        var _loc3_: * = null;
        if (param1 == null) {
            return false;
        }
        var _loc2_: int = this.mObjects.length - 1;
        while (_loc2_ >= 0) {
            _loc3_ = this.mObjects[_loc2_] as Tween;
            if (Boolean(_loc3_) && _loc3_.target == param1) {
                return true;
            }
            _loc2_--;
        }
        return false;
    }

    public function purge(): void {
        var _loc2_: * = null;
        var _loc1_: int = this.mObjects.length - 1;
        while (_loc1_ >= 0) {
            _loc2_ = this.mObjects[_loc1_] as EventDispatcher;
            if (_loc2_) {
                _loc2_.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
            }
            this.mObjects[_loc1_] = null;
            _loc1_--;
        }
    }

    public function delayCall(param1: Function, param2: Number, ...rest): IAnimatable {
        if (param1 == null) {
            return null;
        }
        var _loc4_: DelayedCall;
        (_loc4_ = DelayedCall.starling_internal::fromPool(param1, param2, rest)).addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledDelayedCallComplete);
        this.add(_loc4_);
        return _loc4_;
    }

    public function repeatCall(param1: Function, param2: Number, param3: int = 0, ...rest): IAnimatable {
        if (param1 == null) {
            return null;
        }
        var _loc5_: DelayedCall;
        (_loc5_ = DelayedCall.starling_internal::fromPool(param1, param2, rest)).repeatCount = param3;
        _loc5_.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledDelayedCallComplete);
        this.add(_loc5_);
        return _loc5_;
    }

    private function onPooledDelayedCallComplete(param1: Event): void {
        DelayedCall.starling_internal::toPool(param1.target as DelayedCall);
    }

    public function tween(param1: Object, param2: Number, param3: Object): IAnimatable {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc4_: Tween = Tween.starling_internal::fromPool(param1, param2);
        for (_loc5_ in param3) {
            _loc6_ = param3[_loc5_];
            if (_loc4_.hasOwnProperty(_loc5_)) {
                _loc4_[_loc5_] = _loc6_;
            } else {
                if (!param1.hasOwnProperty(_loc5_)) {
                    throw new ArgumentError("Invalid property: " + _loc5_);
                }
                _loc4_.animate(_loc5_, _loc6_ as Number);
            }
        }
        _loc4_.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledTweenComplete);
        this.add(_loc4_);
        return _loc4_;
    }

    private function onPooledTweenComplete(param1: Event): void {
        Tween.starling_internal::toPool(param1.target as Tween);
    }

    public function advanceTime(param1: Number): void {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: int = this.mObjects.length;
        var _loc3_: int = 0;
        this.mElapsedTime += param1;
        if (_loc2_ == 0) {
            return;
        }
        _loc4_ = 0;
        while (_loc4_ < _loc2_) {
            if (_loc5_ = this.mObjects[_loc4_]) {
                if (_loc3_ != _loc4_) {
                    this.mObjects[_loc3_] = _loc5_;
                    this.mObjects[_loc4_] = null;
                }
                _loc5_.advanceTime(param1);
                _loc3_++;
            }
            _loc4_++;
        }
        if (_loc3_ != _loc4_) {
            _loc2_ = this.mObjects.length;
            while (_loc4_ < _loc2_) {
                this.mObjects[int(_loc3_++)] = this.mObjects[int(_loc4_++)];
            }
            this.mObjects.length = _loc3_;
        }
    }

    private function onRemove(param1: Event): void {
        this.remove(param1.target as IAnimatable);
        var _loc2_: Tween = param1.target as Tween;
        if (Boolean(_loc2_) && _loc2_.isComplete) {
            this.add(_loc2_.nextTween);
        }
    }

    public function get elapsedTime(): Number {
        return this.mElapsedTime;
    }

    protected function get objects(): Vector.<IAnimatable> {
        return this.mObjects;
    }
}
}
