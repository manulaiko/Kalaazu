package net.bigpoint.darkorbit.fui.system.utils.threads {

import flash.utils.getTimer;

public class ThreadStatistics {


    public var numCycles: int;

    public var numTimeouts: int;

    public var totalTime: int;

    public var times: Array;

    public var allocationDifferentials: Array;

    private var currentCycleStart: int;

    public function ThreadStatistics() {
        super();
        this.times = [];
        this.allocationDifferentials = [];
    }

    public function startCycle(): void {
        this.currentCycleStart = getTimer();
    }

    public function endCycle(param1: int): void {
        var _loc2_: Number = getTimer() - this.currentCycleStart;
        this.totalTime += _loc2_;
        this.times[this.numCycles] = _loc2_;
        this.allocationDifferentials[this.numCycles] = _loc2_ - param1;
        ++this.numCycles;
    }

    public function recordTimeout(): void {
        ++this.numTimeouts;
    }

    public function get meanTime(): Number {
        return this.totalTime / this.numCycles;
    }

    public function get averageDifferential(): Number {
        var _loc2_: int = 0;
        var _loc1_: int = 0;
        for each(_loc2_ in this.allocationDifferentials) {
            _loc1_ += _loc2_;
        }
        return _loc1_ / this.numCycles;
    }

    public function get maxTime(): int {
        var _loc2_: int = 0;
        var _loc1_: int = 0;
        for each(_loc2_ in this.times) {
            _loc1_ = Math.max(_loc1_, _loc2_);
        }
        return _loc1_;
    }

    public function get minTime(): int {
        var _loc2_: int = 0;
        var _loc1_: int = 0;
        for each(_loc2_ in this.times) {
            _loc1_ = Math.min(_loc1_, _loc2_);
        }
        return _loc1_;
    }

    public function print(): String {
        return "Total Time: " + this.totalTime + "(ms)" + "\nNumber Of Cycles: " + this.numCycles + "\nMean time per cycle: " + this.meanTime + "(ms)" + "\nMinimum Time, Maximum Time " + this.minTime + "(ms), " + this.maxTime + " (ms)" + "\nAverage Differential: " + this.averageDifferential + "(ms)" + "\nAverage Allocation Diff: " + this.allocationDifferentials + "(ms)" + "\nNumber Of Timeouts: " + this.numTimeouts;
    }
}
}
