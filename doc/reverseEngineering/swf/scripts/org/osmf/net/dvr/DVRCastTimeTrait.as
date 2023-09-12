package org.osmf.net.dvr {

import flash.errors.IllegalOperationError;
import flash.events.NetStatusEvent;
import flash.events.TimerEvent;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.utils.Timer;

import org.osmf.events.TimeEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.traits.TimeTrait;
import org.osmf.utils.OSMFStrings;

class DVRCastTimeTrait extends TimeTrait {


    private var durationUpdateTimer: Timer;

    private var oldDuration: Number;

    private var stream: NetStream;

    private var streamInfo: DVRCastStreamInfo;

    private var recordingInfo: DVRCastRecordingInfo;

    function DVRCastTimeTrait(param1: NetConnection, param2: NetStream, param3: MediaResourceBase) {
        super(NaN);
        if (param1 == null || param2 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this.stream = param2;
        param2.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
        this.durationUpdateTimer = new Timer(DVRCastConstants.LOCAL_DURATION_UPDATE_INTERVAL);
        this.durationUpdateTimer.addEventListener(TimerEvent.TIMER, this.onDurationUpdateTimer);
        this.durationUpdateTimer.start();
        this.streamInfo = param3.getMetadataValue(DVRCastConstants.STREAM_INFO_KEY) as DVRCastStreamInfo;
        this.recordingInfo = param3.getMetadataValue(DVRCastConstants.RECORDING_INFO_KEY) as DVRCastRecordingInfo;
    }

    override public function get duration(): Number {
        var _loc1_: Number = NaN;
        if (this.streamInfo.isRecording) {
            _loc1_ = this.recordingInfo.startDuration - this.recordingInfo.startOffset + (new Date().time - this.recordingInfo.startTime.time) / 1000;
        } else {
            _loc1_ = this.streamInfo.currentLength - this.recordingInfo.startOffset;
        }
        return isNaN(_loc1_) ? NaN : Math.max(0, _loc1_);
    }

    override public function get currentTime(): Number {
        return this.stream.time;
    }

    private function onDurationUpdateTimer(param1: TimerEvent): void {
        var _loc2_: Number = this.duration;
        if (_loc2_ != this.oldDuration) {
            this.oldDuration = _loc2_;
            dispatchEvent(new TimeEvent(TimeEvent.DURATION_CHANGE, false, false, _loc2_));
        }
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        if (param1.info.code == "NetStream.Play.Stop") {
            if (this.durationUpdateTimer) {
                this.durationUpdateTimer.stop();
            }
            signalComplete();
        }
    }
}
}
