package net.bigpoint.darkorbit.fui.system.utils {

import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class GhostTyperEffect extends EventDispatcher {

    private static const DEFAULT_CURSOR: String = ".";


    private var _cursor: String = ".";

    private var _cursorFadeOutArray: Array;

    private var _useHtml: Boolean = false;

    private var _htmlColorRandom: String = "#AAAAAA";

    private var _htmlColor: String = "#EEEEEE";

    private var _text: String;

    private var _updateTextFunction: Function;

    private var _updateTargets: Array;

    private var _updateTarget: Object;

    private var _updateTargetProperty: String;

    private var _chars: Vector.<GhostTyperEffectVO>;

    private var _charCodeMin: uint = 97;

    private var _charCodeMax: uint = 122;

    private var _charCodeRange: uint;

    private var _timer: Timer;

    private var _updateInterval: Number = 100;

    private var _usedTime: Number;

    private var _cursorPosition: Number;

    private var _currentCursorUpdateImpuls: uint = 0;

    private var _cursorUpdateImpuls: uint = 1;

    private var onCompleteCallback: Function;

    public function GhostTyperEffect(param1: String = null, param2: Object = null, param3: String = null) {
        this._charCodeRange = this._charCodeMax - this._charCodeMin;
        super();
        this.cursorChar = DEFAULT_CURSOR;
        this.setUpdate(param2, param3);
        this._text = param1;
        if (Boolean(this._text) && Boolean(param2)) {
            this.createFXList();
        }
    }

    private function createFXList(): void {
        var _loc4_: * = null;
        this._chars = new Vector.<GhostTyperEffectVO>();
        var _loc1_: uint = this._text.length;
        var _loc2_: Number = _loc1_ * this._updateInterval >> 1;
        var _loc3_: int = 0;
        while (_loc3_ < _loc1_) {
            (_loc4_ = new GhostTyperEffectVO()).t = _loc2_ + (_loc3_ * this._updateInterval >> 1);
            _loc4_.t *= this._cursorUpdateImpuls + 1;
            _loc4_.char = this._text.charAt(_loc3_);
            this._chars.push(_loc4_);
            _loc3_++;
        }
    }

    private function getRandomChar(): String {
        var _loc1_: uint = this._charCodeMin + uint(Math.random() * this._charCodeRange);
        var _loc2_: * = String.fromCharCode(_loc1_);
        if (this._useHtml) {
            _loc2_ = "<font color=\'" + this._htmlColorRandom + "\'>" + _loc2_ + "</font>";
        }
        return _loc2_;
    }

    public function start(param1: Function = null): void {
        this.onCompleteCallback = param1;
        this._usedTime = 0;
        this._cursorPosition = 0;
        var _loc2_: Timer = this.getTimer();
        _loc2_.start();
    }

    public function stop(): void {
        var _loc1_: Timer = this.getTimer();
        _loc1_.stop();
    }

    public function dispose(): void {
        if (this._timer) {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER, this.handleTimerEvent);
            this._timer = null;
        }
    }

    private function getTimer(): Timer {
        if (this._timer == null) {
            this._timer = new Timer(this._updateInterval);
            this._timer.addEventListener(TimerEvent.TIMER, this.handleTimerEvent);
        }
        return this._timer;
    }

    private function handleTimerEvent(param1: TimerEvent): void {
        this.doMagicGhostTyperEffect();
    }

    private function doMagicGhostTyperEffect(): void {
        var _loc3_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        this._usedTime += this._updateInterval;
        if (this._currentCursorUpdateImpuls >= this._cursorUpdateImpuls) {
            ++this._cursorPosition;
            this._currentCursorUpdateImpuls = 0;
        } else {
            ++this._currentCursorUpdateImpuls;
        }
        var _loc1_: int = this._text.length - this._cursorPosition;
        _loc1_ = _loc1_ >= this._cursorFadeOutArray.length ? this._cursorFadeOutArray.length - 1 : _loc1_;
        var _loc2_: String = this._cursorFadeOutArray[_loc1_];
        var _loc4_: String = "";
        var _loc5_: int = 0;
        while (_loc5_ < this._cursorPosition) {
            if ((_loc6_ = this._chars[_loc5_]).t < this._usedTime) {
                _loc3_ = _loc6_.char;
                if (this._useHtml) {
                    _loc3_ = "<font color=\'" + this._htmlColor + "\'>" + _loc3_ + "</font>";
                }
                _loc7_ = _loc3_;
            } else {
                _loc7_ = this.getRandomChar();
            }
            _loc4_ += _loc7_;
            _loc5_++;
        }
        _loc4_ += _loc2_;
        this.update(_loc4_);
        if (this._cursorPosition >= this._text.length) {
            this.finished();
        }
    }

    private function finished(): void {
        this.stop();
        if (this.onCompleteCallback != null) {
            this.onCompleteCallback();
        }
    }

    public function setUpdate(param1: Object, param2: String = "text"): void {
        var _loc3_: Function = param1 as Function;
        if (_loc3_ != null) {
            this._updateTextFunction = _loc3_;
        }
    }

    public function set updateTargets(param1: Array): void {
        this._updateTargets = param1;
    }

    private function update(param1: String): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        if (this._updateTargets) {
            _loc2_ = 0;
            while (_loc2_ < this._updateTargets.length) {
                _loc3_ = this._updateTargets[_loc2_];
                _loc3_.target[_loc3_.property] = param1;
                _loc2_++;
            }
        } else if (Boolean(this._updateTarget) && Boolean(this._updateTargetProperty)) {
            this._updateTarget[this._updateTargetProperty] = param1;
        } else if (this._updateTextFunction != null) {
            this._updateTextFunction(param1);
        }
        dispatchEvent(new GhostTyperEffectEvent(GhostTyperEffectEvent.UPDATE_EVENT, param1));
    }

    public function set updateTextFunction(param1: Function): void {
        this._updateTextFunction = param1;
    }

    public function set updateTarget(param1: Object): void {
        this._updateTarget = param1;
    }

    public function set updateTargetProperty(param1: String): void {
        this._updateTargetProperty = param1;
    }

    public function set text(param1: String): void {
        this._text = param1;
        this.createFXList();
    }

    public function set charCodeMin(param1: uint): void {
        this._charCodeMin = param1;
        this.calcCharcodeRange();
    }

    public function set charCodeMax(param1: uint): void {
        this._charCodeMax = param1;
        this.calcCharcodeRange();
    }

    private function calcCharcodeRange(): void {
        this._charCodeRange = this._charCodeMax - this._charCodeMin;
    }

    public function set updateInterval(param1: Number): void {
        this._updateInterval = param1;
    }

    public function set cursorChar(param1: String): void {
        this._cursor = param1;
        this._cursorFadeOutArray = ["", this._cursor, this._cursor + this._cursor, this._cursor + this._cursor + this._cursor, this._cursor + this._cursor + this._cursor + this._cursor, this._cursor + this._cursor + this._cursor + this._cursor + this._cursor];
    }

    public function get useHtml(): Boolean {
        return this._useHtml;
    }

    public function set useHtml(param1: Boolean): void {
        this._useHtml = param1;
    }

    public function set htmlColorRandom(param1: String): void {
        this._htmlColorRandom = param1;
    }

    public function set htmlColor(param1: String): void {
        this._htmlColor = param1;
    }

    public function set cursorUpdateImpuls(param1: uint): void {
        this._cursorUpdateImpuls = param1;
    }
}
}

class GhostTyperEffectVO {


    public var char: String;

    public var t: Number;

    function GhostTyperEffectVO() {
        super();
    }
}
