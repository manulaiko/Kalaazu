package net.bigpoint.darkorbit.fui.system.utils.threads {

import flash.errors.ScriptTimeoutError;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;
import flash.utils.getTimer;

public class GreenThread extends EventDispatcher {


    private var _maximum: Number = NaN;

    private var _progress: Number = NaN;

    private var _debug: Boolean;

    private var _statistics: ThreadStatistics;

    public function GreenThread(param1: Boolean = true) {
        super();
        this._debug = param1;
    }

    public final function start(param1: Number = 0.99): void {
        ThreadProcessor.getInstance(param1).addThread(this);
        if (this.debug) {
            this._statistics = new ThreadStatistics();
        }
        this.initialize();
    }

    public final function stop(): void {
        ThreadProcessor.getInstance().stop(this);
    }

    protected function initialize(): void {
    }

    protected function run(): Boolean {
        return false;
    }

    public final function execute(param1: Number): Boolean {
        var processStart: int = 0;
        var loop: Boolean = false;
        var processAllocation: Number = param1;
        if (this.debug) {
            this.statistcs.startCycle();
        }
        try {
            processStart = getTimer();
            loop = true;
            while (getTimer() - processStart < processAllocation && loop) {
                loop = this.run();
            }
        } catch (error: ScriptTimeoutError) {
            if (debug) {
                statistcs.recordTimeout();
            }
            dispatchEvent(new ThreadEvent(ThreadEvent.TIMEOUT));
        }
        if (this.debug) {
            this.statistcs.endCycle(processAllocation);
        }
        if (!loop) {
            this.dispatchProgress();
            dispatchEvent(new Event(Event.COMPLETE));
            this.stop();
            return false;
        }
        this.dispatchProgress();
        return true;
    }

    private function dispatchProgress(): void {
        var _loc1_: * = null;
        if (isNaN(this.maximum) == false) {
            _loc1_ = new ProgressEvent(ProgressEvent.PROGRESS);
            _loc1_.bytesLoaded = this.progress;
            _loc1_.bytesTotal = this.maximum;
            dispatchEvent(_loc1_);
        }
    }

    public function get progress(): Number {
        return this._progress;
    }

    public function get maximum(): Number {
        return this._maximum;
    }

    public function set maximum(param1: Number): void {
        this._maximum = param1;
    }

    public function set progress(param1: Number): void {
        this._progress = param1;
    }

    public function get debug(): Boolean {
        return this._debug;
    }

    public function set debug(param1: Boolean): void {
        this._debug = param1;
    }

    public function get statistcs(): ThreadStatistics {
        return this._statistics;
    }
}
}
