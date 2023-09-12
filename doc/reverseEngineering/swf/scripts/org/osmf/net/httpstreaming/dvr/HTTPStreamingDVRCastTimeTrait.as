package org.osmf.net.httpstreaming.dvr {

import flash.events.NetStatusEvent;
import flash.net.NetConnection;

import org.osmf.events.DVRStreamInfoEvent;
import org.osmf.net.NetStreamCodes;
import org.osmf.net.httpstreaming.HTTPNetStream;
import org.osmf.traits.TimeTrait;

public class HTTPStreamingDVRCastTimeTrait extends TimeTrait {


    private var _connection: NetConnection;

    private var _stream: HTTPNetStream;

    private var _dvrInfo: DVRInfo;

    public function HTTPStreamingDVRCastTimeTrait(param1: NetConnection, param2: HTTPNetStream, param3: DVRInfo) {
        super(NaN);
        this._connection = param1;
        this._stream = param2;
        this._dvrInfo = param3;
        this._stream.addEventListener(DVRStreamInfoEvent.DVRSTREAMINFO, this.onDVRStreamInfo);
        this._stream.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
    }

    override public function get duration(): Number {
        if (this._dvrInfo == null) {
            return NaN;
        }
        return this._dvrInfo.curLength;
    }

    override public function get currentTime(): Number {
        return this._stream.time;
    }

    private function onDVRStreamInfo(param1: DVRStreamInfoEvent): void {
        this._dvrInfo = param1.info as DVRInfo;
        setDuration(this._dvrInfo.curLength);
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_PLAY_UNPUBLISH_NOTIFY:
                signalComplete();
        }
    }
}
}
