package org.osmf.net {

import flash.events.NetStatusEvent;
import flash.events.TimerEvent;
import flash.net.NetStream;
import flash.utils.Timer;

import org.osmf.traits.LoadTrait;
import org.osmf.traits.SeekTrait;
import org.osmf.traits.TimeTrait;

public class NetStreamSeekTrait extends SeekTrait {


    private var loadTrait: LoadTrait;

    private var audioDelay: Number = 0;

    private var seekBugTimer: Timer;

    private var netStream: NetStream;

    private var expectedTime: Number;

    private var previousTime: Number;

    private var suppressSeekNotifyEvent: Boolean = false;

    public function NetStreamSeekTrait(param1: TimeTrait, param2: LoadTrait, param3: NetStream) {
        super(param1);
        this.netStream = param3;
        this.loadTrait = param2;
        NetClient(param3.client).addHandler(NetStreamCodes.ON_META_DATA, this.onMetaData);
        param3.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
        this.seekBugTimer = new Timer(10, 100);
        this.seekBugTimer.addEventListener(TimerEvent.TIMER, this.onSeekBugTimer, false, 0, true);
        this.seekBugTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onSeekBugTimerDone, false, 0, true);
    }

    override public function canSeekTo(param1: Number): Boolean {
        var _loc3_: Number = NaN;
        var _loc2_: * = super.canSeekTo(param1);
        if (_loc2_ && !isNaN(this.loadTrait.bytesTotal) && this.loadTrait.bytesTotal > 0) {
            _loc3_ = 0 * Number(this.loadTrait.bytesLoaded / this.loadTrait.bytesTotal);
            _loc2_ = param1 <= _loc3_;
        }
        return _loc2_;
    }

    override protected function seekingChangeStart(param1: Boolean, param2: Number): void {
        if (param1) {
            this.suppressSeekNotifyEvent = false;
            this.previousTime = this.netStream.time - this.audioDelay;
            this.expectedTime = param2;
            this.netStream.seek(param2 + this.audioDelay);
            if (this.previousTime == this.expectedTime) {
                this.seekBugTimer.start();
                this.suppressSeekNotifyEvent = true;
            }
        }
    }

    private function onMetaData(param1: Object): void {
        this.audioDelay = param1.hasOwnProperty("audiodelay") ? Number(param1.audiodelay) : 0;
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_SEEK_NOTIFY:
                this.runSeekBugTimer();
                break;
            case NetStreamCodes.NETSTREAM_SEEK_INVALIDTIME:
            case NetStreamCodes.NETSTREAM_SEEK_FAILED:
                setSeeking(false, this.previousTime);
                break;
            case NetStreamCodes.NETSTREAM_PLAY_START:
            case NetStreamCodes.NETSTREAM_PLAY_RESET:
            case NetStreamCodes.NETSTREAM_PAUSE_NOTIFY:
            case NetStreamCodes.NETSTREAM_PLAY_STOP:
            case NetStreamCodes.NETSTREAM_UNPAUSE_NOTIFY:
                if (seeking && this.seekBugTimer.running == false) {
                    this.runSeekBugTimer();
                    break;
                }
        }
    }

    private function runSeekBugTimer(): void {
        if (this.suppressSeekNotifyEvent == false) {
            this.seekBugTimer.start();
        } else {
            this.suppressSeekNotifyEvent = false;
        }
    }

    private function onSeekBugTimer(param1: TimerEvent): void {
        if (this.previousTime != this.netStream.time - this.audioDelay || this.previousTime == this.expectedTime) {
            this.onSeekBugTimerDone(null);
        }
    }

    private function onSeekBugTimerDone(param1: TimerEvent): void {
        this.seekBugTimer.reset();
        setSeeking(false, this.expectedTime);
    }
}
}
