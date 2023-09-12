package org.osmf.net {

import flash.events.NetStatusEvent;
import flash.net.NetStream;

import org.osmf.traits.BufferTrait;

public class NetStreamBufferTrait extends BufferTrait {


    private var netStream: NetStream;

    public function NetStreamBufferTrait(param1: NetStream) {
        super();
        this.netStream = param1;
        bufferTime = param1.bufferTime;
        param1.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus, false, 0, true);
    }

    override public function get bufferLength(): Number {
        return this.netStream.bufferLength;
    }

    override protected function bufferTimeChangeStart(param1: Number): void {
        this.netStream.bufferTime = param1;
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_PLAY_START:
            case NetStreamCodes.NETSTREAM_BUFFER_EMPTY:
                bufferTime = this.netStream.bufferTime;
                setBuffering(true);
                if (this.netStream.bufferTime == 0) {
                    setBuffering(false);
                    break;
                }
                break;
            case NetStreamCodes.NETSTREAM_BUFFER_FLUSH:
            case NetStreamCodes.NETSTREAM_BUFFER_FULL:
                setBuffering(false);
        }
    }
}
}
