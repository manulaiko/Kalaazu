package org.osmf.net {

import flash.events.NetStatusEvent;
import flash.net.NetStream;

import org.osmf.media.MediaResourceBase;
import org.osmf.traits.TimeTrait;

public class NetStreamTimeTrait extends TimeTrait {


    private var durationOffset: Number = 0;

    private var audioDelay: Number = 0;

    private var netStream: NetStream;

    private var resource: MediaResourceBase;

    public function NetStreamTimeTrait(param1: NetStream, param2: MediaResourceBase, param3: Number = NaN) {
        super();
        this.netStream = param1;
        NetClient(param1.client).addHandler(NetStreamCodes.ON_META_DATA, this.onMetaData);
        NetClient(param1.client).addHandler(NetStreamCodes.ON_PLAY_STATUS, this.onPlayStatus);
        param1.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus, false, 0, true);
        this.resource = param2;
        if (isNaN(param3) == false) {
            setDuration(param3);
        }
    }

    override public function get currentTime(): Number {
        if (this.durationOffset == duration - (this.netStream.time - this.audioDelay)) {
            return this.netStream.time - this.audioDelay + this.durationOffset;
        }
        return this.netStream.time - this.audioDelay;
    }

    private function onMetaData(param1: Object): void {
        var _loc2_: Object = NetStreamUtils.getPlayArgsForResource(this.resource);
        this.audioDelay = param1.hasOwnProperty("audiodelay") ? Number(param1.audiodelay) : 0;
        var _loc3_: Number = Math.max(0, _loc2_.start);
        var _loc4_: Number;
        if ((_loc4_ = Number(_loc2_.len)) == NetStreamUtils.PLAY_LEN_ARG_ALL) {
            _loc4_ = 0;
        }
        setDuration(Math.min(Number(param1.duration) - this.audioDelay - _loc3_, _loc4_));
    }

    private function onPlayStatus(param1: Object): void {
        switch (param1.code) {
            case NetStreamCodes.NETSTREAM_PLAY_COMPLETE:
                this.signalComplete();
        }
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_PLAY_STOP:
                if (NetStreamUtils.isStreamingResource(this.resource) == false) {
                    this.signalComplete();
                    break;
                }
                break;
            case NetStreamCodes.NETSTREAM_PLAY_UNPUBLISH_NOTIFY:
                this.signalComplete();
        }
    }

    override protected function signalComplete(): void {
        if (this.netStream.time - this.audioDelay != duration) {
            this.durationOffset = duration - (this.netStream.time - this.audioDelay);
        }
        super.signalComplete();
    }
}
}
