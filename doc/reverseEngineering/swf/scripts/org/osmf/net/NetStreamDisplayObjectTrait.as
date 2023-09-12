package org.osmf.net {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.media.Video;
import flash.net.NetStream;

import org.osmf.traits.DisplayObjectTrait;

public class NetStreamDisplayObjectTrait extends DisplayObjectTrait {


    private var netStream: NetStream;

    public function NetStreamDisplayObjectTrait(param1: NetStream, param2: DisplayObject, param3: Number = 0, param4: Number = 0) {
        super(param2, param3, param4);
        this.netStream = param1;
        NetClient(param1.client).addHandler(NetStreamCodes.ON_META_DATA, this.onMetaData);
        if (param2 is Video) {
            param2.addEventListener(Event.ADDED_TO_STAGE, this.onStage);
        }
    }

    private function onStage(param1: Event): void {
        displayObject.removeEventListener(Event.ADDED_TO_STAGE, this.onStage);
        displayObject.addEventListener(Event.ENTER_FRAME, this.onFrame);
    }

    private function onFrame(param1: Event): void {
        if (Video(displayObject).videoWidth != 0 && Video(displayObject).videoHeight != 0) {
            if (Video(displayObject).videoWidth != mediaWidth && Video(displayObject).videoHeight != mediaHeight) {
                this.newMediaSize(Video(displayObject).videoWidth, Video(displayObject).videoHeight);
            }
            displayObject.removeEventListener(Event.ENTER_FRAME, this.onFrame);
        }
    }

    private function onMetaData(param1: Object): void {
        if (!isNaN(param1.width) && !isNaN(param1.height) && (param1.width != mediaWidth || param1.height != mediaHeight)) {
            this.newMediaSize(param1.width, param1.height);
        }
    }

    private function newMediaSize(param1: Number, param2: Number): void {
        if (false && false) {
            displayObject.width = param1;
            displayObject.height = param2;
        }
        setMediaSize(param1, param2);
    }
}
}
