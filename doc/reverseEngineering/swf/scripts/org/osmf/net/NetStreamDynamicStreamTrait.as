package org.osmf.net {

import flash.events.NetStatusEvent;
import flash.net.NetStream;

import org.osmf.traits.DynamicStreamTrait;
import org.osmf.utils.OSMFStrings;

public class NetStreamDynamicStreamTrait extends DynamicStreamTrait {


    private var netStream: NetStream;

    private var switchManager: NetStreamSwitchManagerBase;

    private var inSetSwitching: Boolean;

    private var dsResource: DynamicStreamingResource;

    private var indexToSwitchTo: int;

    public function NetStreamDynamicStreamTrait(param1: NetStream, param2: NetStreamSwitchManagerBase, param3: DynamicStreamingResource) {
        super(param2.autoSwitch, param2.currentIndex, param3.streamItems.length);
        this.netStream = param1;
        this.switchManager = param2;
        this.dsResource = param3;
        param1.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
        NetClient(param1.client).addHandler(NetStreamCodes.ON_PLAY_STATUS, this.onPlayStatus);
    }

    override public function dispose(): void {
        this.netStream = null;
        this.switchManager = null;
    }

    override public function getBitrateForIndex(param1: int): Number {
        if (param1 > numDynamicStreams - 1 || param1 < 0) {
            throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
        }
        return this.dsResource.streamItems[param1].bitrate;
    }

    override protected function switchingChangeStart(param1: Boolean, param2: int): void {
        if (param1 && !this.inSetSwitching) {
            this.indexToSwitchTo = param2;
        }
    }

    override protected function switchingChangeEnd(param1: int): void {
        super.switchingChangeEnd(param1);
        if (switching && !this.inSetSwitching) {
            this.switchManager.switchTo(this.indexToSwitchTo);
        }
    }

    override protected function autoSwitchChangeStart(param1: Boolean): void {
        this.switchManager.autoSwitch = param1;
    }

    override protected function maxAllowedIndexChangeStart(param1: int): void {
        this.switchManager.maxAllowedIndex = param1;
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        switch (param1.info.code) {
            case NetStreamCodes.NETSTREAM_PLAY_TRANSITION:
                this.inSetSwitching = true;
                setSwitching(true, this.dsResource.indexFromName(param1.info.details));
                this.inSetSwitching = false;
                break;
            case NetStreamCodes.NETSTREAM_PLAY_FAILED:
                setSwitching(false, currentIndex);
        }
    }

    private function onPlayStatus(param1: Object): void {
        switch (param1.code) {
            case NetStreamCodes.NETSTREAM_PLAY_TRANSITION_COMPLETE:
                setSwitching(false, this.switchManager.currentIndex);
        }
    }
}
}
