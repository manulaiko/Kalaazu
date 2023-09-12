package org.osmf.net.dvr {

import flash.net.NetConnection;
import flash.net.NetStream;
import flash.net.NetStreamPlayOptions;

import org.osmf.media.MediaResourceBase;

public class DVRCastNetStream extends NetStream {


    private var recordingInfo: DVRCastRecordingInfo;

    public function DVRCastNetStream(param1: NetConnection, param2: MediaResourceBase) {
        super(param1);
        this.recordingInfo = param2.getMetadataValue(DVRCastConstants.RECORDING_INFO_KEY) as DVRCastRecordingInfo;
    }

    override public function play(...rest): void {
        super.play(rest[0], this.recordingInfo.startOffset, -1);
    }

    override public function play2(param1: NetStreamPlayOptions): void {
        if (param1) {
            param1.start = this.recordingInfo.startOffset;
            param1.len = -1;
        }
        super.play2(param1);
    }
}
}
