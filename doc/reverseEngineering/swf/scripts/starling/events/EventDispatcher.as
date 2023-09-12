package starling.events {

import flash.utils.Dictionary;

import starling.core.starling_internal;
import starling.display.DisplayObject;

public class EventDispatcher {

    private static var sBubbleChains: Array = [];


    private var mEventListeners: Dictionary;

    public function EventDispatcher() {
        super();
    }

    public function addEventListener(param1: String, param2: Function): void {
        if (this.mEventListeners == null) {
            this.mEventListeners = new Dictionary();
        }
        var _loc3_: Vector.<Function> = this.mEventListeners[param1] as Vector.<Function>;
        if (_loc3_ == null) {
            this.mEventListeners[param1] = new <Function>[param2];
        } else if (_loc3_.indexOf(param2) == -1) {
            _loc3_.push(param2);
        }
    }

    public function removeEventListener(param1: String, param2: Function): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        if (this.mEventListeners) {
            _loc3_ = this.mEventListeners[param1] as Vector.<Function>;
            if ((_loc4_ = !!_loc3_ ? _loc3_.length : 0) > 0) {
                _loc5_ = 0;
                _loc6_ = new Vector.<Function>(_loc4_ - 1);
                _loc7_ = 0;
                while (_loc7_ < _loc4_) {
                    if ((_loc8_ = _loc3_[_loc7_]) != param2) {
                        _loc6_[int(_loc5_++)] = _loc8_;
                    }
                    _loc7_++;
                }
                this.mEventListeners[param1] = _loc6_;
            }
        }
    }

    public function removeEventListeners(param1: String = null): void {
        if (Boolean(param1) && Boolean(this.mEventListeners)) {
            delete this.mEventListeners[param1];
        } else {
            this.mEventListeners = null;
        }
    }

    public function dispatchEvent(param1: Event): void {
        var _loc2_: Boolean = param1.bubbles;
        if (!_loc2_ && (this.mEventListeners == null || !(param1.type in this.mEventListeners))) {
            return;
        }
        var _loc3_: EventDispatcher = param1.target;
        param1.setTarget(this);
        if (_loc2_ && this is DisplayObject) {
            this.bubbleEvent(param1);
        } else {
            this.invokeEvent(param1);
        }
        if (_loc3_) {
            param1.setTarget(_loc3_);
        }
    }

    function invokeEvent(param1: Event): Boolean {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc2_: Vector.<Function> = !!this.mEventListeners ? this.mEventListeners[param1.type] as Vector.<Function> : null;
        var _loc3_: int = _loc2_ == null ? 0 : _loc2_.length;
        if (_loc3_) {
            param1.setCurrentTarget(this);
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                if ((_loc6_ = (_loc5_ = _loc2_[_loc4_] as Function).length) == 0) {
                    _loc5_();
                } else if (_loc6_ == 1) {
                    _loc5_(param1);
                } else {
                    _loc5_(param1, param1.data);
                }
                if (param1.stopsImmediatePropagation) {
                    return true;
                }
                _loc4_++;
            }
            return param1.stopsPropagation;
        }
        return false;
    }

    function bubbleEvent(param1: Event): void {
        var _loc2_: * = null;
        var _loc6_: Boolean = false;
        var _loc3_: DisplayObject = this as DisplayObject;
        var _loc4_: int = 1;
        if (false) {
            _loc2_ = sBubbleChains.pop();
            _loc2_[0] = _loc3_;
        } else {
            _loc2_ = new <EventDispatcher>[_loc3_];
        }
        while ((_loc3_ = _loc3_.parent) != null) {
            _loc2_[int(_loc4_++)] = _loc3_;
        }
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (_loc6_ = _loc2_[_loc5_].invokeEvent(param1)) {
                break;
            }
            _loc5_++;
        }
        _loc2_.length = 0;
        sBubbleChains.push(_loc2_);
    }

    public function dispatchEventWith(param1: String, param2: Boolean = false, param3: Object = null): void {
        var _loc4_: * = null;
        if (param2 || this.hasEventListener(param1)) {
            _loc4_ = Event.starling_internal::fromPool(param1, param2, param3);
            this.dispatchEvent(_loc4_);
            Event.starling_internal::toPool(_loc4_);
        }
    }

    public function hasEventListener(param1: String): Boolean {
        var _loc2_: Vector.<Function> = !!this.mEventListeners ? this.mEventListeners[param1] as Vector.<Function> : null;
        return !!_loc2_ ? _loc2_.length != 0 : false;
    }
}
}
