package org.osmf.net.dvr {

import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.utils.Timer;

import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.MediaErrorEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.traits.DVRTrait;
import org.osmf.utils.OSMFStrings;

class DVRCastDVRTrait extends DVRTrait {


    private var connection: NetConnection;

    private var stream: NetStream;

    private var streamInfo: DVRCastStreamInfo;

    private var recordingInfo: DVRCastRecordingInfo;

    private var streamInfoUpdateTimer: Timer;

    private var streamInfoRetriever: DVRCastStreamInfoRetriever;

    private var offset: Number;

    function DVRCastDVRTrait(param1: NetConnection, param2: NetStream, param3: MediaResourceBase) {
        if (param1 != null && param2 != null) {
            this.stream = param2;
            this.streamInfo = param3.getMetadataValue(DVRCastConstants.STREAM_INFO_KEY) as DVRCastStreamInfo;
            this.recordingInfo = param3.getMetadataValue(DVRCastConstants.RECORDING_INFO_KEY) as DVRCastRecordingInfo;
            this.streamInfoRetriever = new DVRCastStreamInfoRetriever(param1, this.streamInfo.streamName);
            this.streamInfoRetriever.addEventListener(Event.COMPLETE, this.onStreamInfoRetrieverComplete);
            this.streamInfoUpdateTimer = new Timer(DVRCastConstants.STREAM_INFO_UPDATE_DELAY);
            this.streamInfoUpdateTimer.addEventListener(TimerEvent.TIMER, this.onStreamInfoUpdateTimer);
            this.streamInfoUpdateTimer.start();
            super(this.streamInfo.isRecording);
            this.updateProperties();
            return;
        }
        throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
    }

    override protected function isRecordingChangeStart(param1: Boolean): void {
        if (param1) {
            this.recordingInfo.startDuration = this.streamInfo.currentLength;
            this.recordingInfo.startTime = new Date();
        }
    }

    private function updateProperties(): void {
        setIsRecording(this.streamInfo.isRecording);
    }

    private function onStreamInfoUpdateTimer(param1: TimerEvent): void {
        this.streamInfoRetriever.retrieve();
    }

    private function onStreamInfoRetrieverComplete(param1: Event): void {
        if (this.streamInfoRetriever.streamInfo != null) {
            this.streamInfo.readFromDVRCastStreamInfo(this.streamInfoRetriever.streamInfo);
            this.updateProperties();
        } else {
            dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, new MediaError(MediaErrorCodes.DVRCAST_STREAM_INFO_RETRIEVAL_FAILED)));
        }
    }
}
}
