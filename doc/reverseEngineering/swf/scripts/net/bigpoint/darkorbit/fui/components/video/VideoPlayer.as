package net.bigpoint.darkorbit.fui.components.video {

import flash.events.AsyncErrorEvent;
import flash.events.Event;
import flash.events.NetStatusEvent;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.net.NetStreamAppendBytesAction;
import flash.utils.ByteArray;

import net.bigpoint.darkorbit.fui.components.core.Coreponent;

public class VideoPlayer extends Coreponent {

    public static const VIDEO_DIMENSIONS_READY: String = "VIDEO_DIMENSIONS_READY";

    public static const STATE_STOP: String = "stop";

    public static const STATE_PAUSE: String = "pause";

    public static const STATE_PLAYBACK: String = "playback";

    private static const MODE_BINARY: uint = 1;

    private static const MODE_URL: uint = 2;

    private static const CONNECTION_SUCCES: String = "NetConnection.Connect.Success";

    private static const STREAM_NOT_FOUND: String = "NetStream.Play.StreamNotFound";

    private static const STREAM_STOPPED: String = "NetStream.Play.Stop";

    private static const STREAM_BUFFER_EMPTY: String = "NetStream.Buffer.Empty";


    private var _state: String = "stop";

    private var playbackMode: uint = 2;

    private var video: Video;

    private var netConnection: NetConnection;

    private var netStream01: NetStream;

    private var netStream02: NetStream;

    private var currentNetStream: NetStream;

    private var videoBuffer: ByteArray;

    private var netstreamEventHandler: NetstreamEventHandler;

    public var currentNetStreamName: String = "01";

    private var _url: String;

    private var _loop: Boolean = true;

    public function VideoPlayer() {
        super();
    }

    override protected function initialize(): void {
        super.initialize();
        this.create();
    }

    protected function create(): void {
        this.netstreamEventHandler = new NetstreamEventHandler(this);
        this.video = new Video();
        this.video.smoothing = true;
        addChild(this.video);
        this.netConnection = new NetConnection();
        this.netConnection.connect(null);
        this.netStream01 = new NetStream(this.netConnection);
        this.netStream01.addEventListener(NetStatusEvent.NET_STATUS, this.handleNetStreamStatusEvent);
        this.netStream01.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.handleAsyncErrorEvent);
        this.netStream01.client = this.netstreamEventHandler;
        this.netStream02 = new NetStream(this.netConnection);
        this.netStream02.addEventListener(NetStatusEvent.NET_STATUS, this.handleNetStreamStatusEvent);
        this.netStream02.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.handleAsyncErrorEvent);
        this.netStream02.client = this.netstreamEventHandler;
        this.currentNetStream = this.netStream01;
        this.video.attachNetStream(this.currentNetStream);
    }

    override public function dispose(): void {
        super.dispose();
        this.netStream01.close();
        this.netStream02.close();
        this.netStream01 = null;
        this.netStream02 = null;
        this.netConnection.close();
        this.netConnection = null;
        this.video = null;
        this.netstreamEventHandler.dispose();
        this.netstreamEventHandler = null;
    }

    public function playURL(param1: String = null, param2: Number = -1): void {
        this.stop();
        this.playbackMode = MODE_URL;
        this._state = STATE_PLAYBACK;
        if (param1) {
            this.url = param1;
        }
        this.currentNetStream.play(this.url);
    }

    public function playByteArray(param1: ByteArray = null): void {
        this.stop();
        this.playbackMode = MODE_BINARY;
        this._state = STATE_PLAYBACK;
        this.videoBuffer = param1;
        this.currentNetStream.play(null);
        this.currentNetStream.appendBytesAction(NetStreamAppendBytesAction.RESET_BEGIN);
        this.currentNetStream.appendBytes(this.videoBuffer);
        this.currentNetStream.appendBytesAction(NetStreamAppendBytesAction.END_SEQUENCE);
    }

    public function pause(): void {
        this.currentNetStream.pause();
        this._state = STATE_PAUSE;
    }

    public function stop(): void {
        this.video.clear();
        this.pause();
        this.currentNetStream.seek(0);
        this._state = STATE_STOP;
    }

    public function getCurrentState(): String {
        return this._state;
    }

    protected function replay(param1: NetStream): NetStream {
        this._state = STATE_PLAYBACK;
        if (this.playbackMode == MODE_BINARY) {
            this.video.attachNetStream(param1);
            param1.play(null);
            param1.appendBytesAction(NetStreamAppendBytesAction.RESET_BEGIN);
            param1.appendBytes(this.videoBuffer);
            this.currentNetStream.appendBytesAction(NetStreamAppendBytesAction.END_SEQUENCE);
            param1.resume();
            return param1;
        }
        if (this.playbackMode == MODE_URL) {
            this.video.clear();
            this.video.attachNetStream(param1);
            param1.play(this.url);
            return param1;
        }
        return null;
    }

    protected function swapNetstreamBuffers(): void {
        var _loc1_: NetStream = this.currentNetStream;
        if (this.currentNetStream == this.netStream01) {
            this.currentNetStream = this.replay(this.netStream02);
            this.currentNetStreamName = "netStream02";
        } else {
            this.currentNetStream = this.replay(this.netStream01);
            this.currentNetStreamName = "netStream01";
        }
        _loc1_.pause();
        _loc1_.seek(0);
    }

    protected function handleAsyncErrorEvent(param1: Event): void {
    }

    protected function handleNetStreamStatusEvent(param1: NetStatusEvent): void {
        var _loc2_: String = param1.info.code;
        switch (_loc2_) {
            case CONNECTION_SUCCES:
                break;
            case STREAM_NOT_FOUND:
                break;
            case STREAM_BUFFER_EMPTY:
                if (this.loop) {
                    this.replayVideo();
                    break;
                }
                break;
            case STREAM_STOPPED:
                if (this.loop) {
                    this.replayVideo();
                    break;
                }
        }
    }

    override public function set width(param1: Number): void {
        this.video.width = param1;
        super.width = param1;
    }

    override public function set height(param1: Number): void {
        this.video.height = param1;
        super.height = param1;
    }

    protected function replayVideo(): void {
        this.swapNetstreamBuffers();
    }

    public function get duration(): Number {
        return this.netstreamEventHandler.duration;
    }

    public function get playbackProgressPercentage(): Number {
        var _loc1_: Number = 0;
        if (this.duration > 0) {
            _loc1_ = this.currentNetStream.time / this.duration;
        }
        return _loc1_;
    }

    public function get loop(): Boolean {
        return this._loop;
    }

    public function set loop(param1: Boolean): void {
        this._loop = param1;
    }

    public function get url(): String {
        return this._url;
    }

    public function set url(param1: String): void {
        this._url = param1;
    }
}
}

import net.bigpoint.darkorbit.fui.components.video.VideoPlayer;

class NetstreamEventHandler {

    private static const NETSTREAM_COMPLETE: String = "NetStream.Play.Complete";


    private var _instance: VideoPlayer;

    private var _duration: Number;

    function NetstreamEventHandler(param1: VideoPlayer) {
        super();
        this._instance = param1;
    }

    public function dispose(): void {
        this._instance = null;
    }

    public function onPlayStatus(...rest): void {
        var _loc3_: Boolean = false;
        var _loc2_: Object = rest[0];
        switch (_loc2_.code) {
            case NETSTREAM_COMPLETE:
                _loc3_ = true;
        }
    }

    public function onXMPData(...rest): void {
        var _loc2_: Object = rest[0];
    }

    public function onMetaData(param1: Object): void {
        this._duration = param1.duration;
    }

    public function onCuePoint(...rest): void {
    }

    public function get duration(): Number {
        return this._duration;
    }
}
