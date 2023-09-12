package net.bigpoint.darkorbit.mvc.common.view.components {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.NetStatusEvent;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.net.NetStreamPlayOptions;
import flash.net.NetStreamPlayTransitions;

public class FLVVideoPlayer extends Sprite {

    public static const VIDEO_DIMESIONS_READY: String = "VIDEO_DIMESIONS_READY";


    private var netStream: NetStream;

    private var mDuration: Number;

    private var _loop: Boolean;

    private var _url: String;

    private var param: NetStreamPlayOptions;

    public function FLVVideoPlayer(param1: String, param2: Boolean = false) {
        super();
        this._url = param1;
        this._loop = param2;
        var _loc3_: Video = new Video();
        var _loc4_: NetConnection;
        (_loc4_ = new NetConnection()).connect(null);
        this.netStream = new NetStream(_loc4_);
        this.netStream.addEventListener(NetStatusEvent.NET_STATUS, this.handleNetStreamNET_STATUS);
        this.netStream.client = this;
        _loc3_.attachNetStream(this.netStream);
        addChildAt(_loc3_, 0);
        this.param = new NetStreamPlayOptions();
        this.param.transition = NetStreamPlayTransitions.STOP;
        this.param.streamName = this._url;
        this.netStream.play2(this.param);
    }

    private function handleNetStreamNET_STATUS(param1: NetStatusEvent): void {
    }

    private function handleEnterFrame(param1: Event): void {
        if (this.netStream.time >= this.mDuration - 0.075) {
            removeEventListener(Event.ENTER_FRAME, this.handleEnterFrame);
            this.netStream.seek(0);
        }
    }

    public function onMetaData(param1: Object): void {
        this.mDuration = param1["duration"];
        this.width = param1["width"];
        this.height = param1["height"];
        dispatchEvent(new Event(FLVVideoPlayer.VIDEO_DIMESIONS_READY));
        if (this._loop && !hasEventListener(Event.ENTER_FRAME)) {
            addEventListener(Event.ENTER_FRAME, this.handleEnterFrame);
        }
    }

    public function onPlayStatus(param1: Object): void {
        if (param1["code"] == "NetStream.Play.Complete") {
            if (this._loop && !hasEventListener(Event.ENTER_FRAME)) {
                this.mDuration = this.netStream.time;
                this.netStream.seek(0);
            }
        }
    }

    public function onXMPData(param1: Array): void {
    }
}
}
