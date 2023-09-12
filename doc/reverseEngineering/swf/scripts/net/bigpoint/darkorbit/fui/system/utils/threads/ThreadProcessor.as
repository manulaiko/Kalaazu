package net.bigpoint.darkorbit.fui.system.utils.threads {

import flash.display.Stage;
import flash.events.Event;
import flash.utils.getTimer;

import net.bigpoint.darkorbit.fui.UISystem;

public class ThreadProcessor {

    private static var _instance: ThreadProcessor;

    private static const EPSILON: int = 1;


    private var frameRate: int;

    private var _share: Number;

    private var activeThreads: Array;

    private var errorTerm: int;

    public function ThreadProcessor(param1: Number = 0.99) {
        super();
        if (!_instance) {
            this.frameRate = this.stage.frameRate;
            this.share = param1;
            this.activeThreads = null;
            _instance = this;
            return;
        }
        throw new Error("Error: Instantiation failed: Use ThreadProcessor.getInstance() instead of new.");
    }

    public static function getInstance(param1: Number = 0.99): ThreadProcessor {
        if (!_instance) {
            _instance = new ThreadProcessor(param1);
        }
        return _instance;
    }

    public function addThread(param1: GreenThread): void {
        if (!this.activeThreads) {
            this.activeThreads = [];
            this.start();
        }
        this.activeThreads.push(param1);
    }

    private function start(): void {
        this.stage.addEventListener(Event.ENTER_FRAME, this.doCycle);
    }

    public function stop(param1: GreenThread): void {
        var _loc2_: int = this.activeThreads.indexOf(param1);
        if (_loc2_ >= 0) {
            this.activeThreads.splice(_loc2_, 1);
        }
        if (this.activeThreads.length == 0) {
            this.stopAll();
        }
    }

    public function stopAll(): void {
        this.activeThreads = null;
        this.stage.removeEventListener(Event.ENTER_FRAME, this.doCycle);
    }

    private function doCycle(param1: Event): void {
        var _loc9_: * = null;
        var _loc2_: int = this.share < 1 ? this.timerDelay * this.share + 1 : this.frameRate - this.share;
        _loc2_ = Math.max(_loc2_, EPSILON * this.activeThreads.length);
        if (this.errorTerm > _loc2_ - 1) {
            this.errorTerm = 0;
            return;
        }
        var _loc3_: int = getTimer();
        var _loc4_: int;
        var _loc5_: int = (_loc4_ = _loc2_ - this.errorTerm) / this.activeThreads.length;
        var _loc6_: int = this.activeThreads.length - 1;
        while (_loc6_ > -1) {
            if (!(_loc9_ = this.activeThreads[_loc6_] as GreenThread).execute(_loc5_)) {
                if (!this.activeThreads) {
                    break;
                }
                _loc5_ = _loc4_ / this.activeThreads.length;
            }
            _loc6_--;
        }
        var _loc7_: int;
        var _loc8_: Number = (_loc7_ = getTimer() - _loc3_) - _loc2_;
        this.errorTerm = this.errorTerm + _loc8_ >> 1;
    }

    public function get timerDelay(): Number {
        return 1000 / this.frameRate;
    }

    public function get share(): Number {
        return this._share;
    }

    public function set share(param1: Number): void {
        this._share = param1;
    }

    public function get stage(): Stage {
        return UISystem.getInstance().stage;
    }
}
}
