package org.osmf.net {

import flash.net.NetConnection;
import flash.net.NetStream;
import flash.utils.Dictionary;

import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.MediaErrorEvent;
import org.osmf.events.NetConnectionFactoryEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.MediaType;
import org.osmf.media.MediaTypeUtil;
import org.osmf.media.URLResource;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.utils.URL;

public class NetLoader extends LoaderBase {

    private static const PROTOCOL_RTMP: String = "rtmp";

    private static const PROTOCOL_RTMPS: String = "rtmps";

    private static const PROTOCOL_RTMPT: String = "rtmpt";

    private static const PROTOCOL_RTMPE: String = "rtmpe";

    private static const PROTOCOL_RTMPTE: String = "rtmpte";

    private static const PROTOCOL_HTTP: String = "http";

    private static const PROTOCOL_HTTPS: String = "https";

    private static const PROTOCOL_FILE: String = "file";

    private static const PROTOCOL_EMPTY: String = "";

    private static const MEDIA_TYPES_SUPPORTED: Vector.<String> = Vector.<String>([MediaType.VIDEO]);

    private static const MIME_TYPES_SUPPORTED: Vector.<String> = Vector.<String>(["video/x-flv", "video/x-f4v", "video/mp4", "video/mp4v-es", "video/x-m4v", "video/3gpp", "video/3gpp2", "video/quicktime"]);


    private var netConnectionFactory: NetConnectionFactoryBase;

    private var pendingLoads: Dictionary;

    public function NetLoader(param1: NetConnectionFactoryBase = null) {
        this.pendingLoads = new Dictionary();
        super();
        this.netConnectionFactory = param1 || new NetConnectionFactory();
        this.netConnectionFactory.addEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE, this.onCreationComplete);
        this.netConnectionFactory.addEventListener(NetConnectionFactoryEvent.CREATION_ERROR, this.onCreationError);
    }

    override public function canHandleResource(param1: MediaResourceBase): Boolean {
        var _loc2_: int = MediaTypeUtil.checkMetadataMatchWithResource(param1, MEDIA_TYPES_SUPPORTED, MIME_TYPES_SUPPORTED);
        if (_loc2_ != MediaTypeUtil.METADATA_MATCH_UNKNOWN) {
            return _loc2_ == MediaTypeUtil.METADATA_MATCH_FOUND;
        }
        var _loc3_: URLResource = param1 as URLResource;
        var _loc4_: RegExp = /.flv$|.f4v$|.mov$|.mp4$|.mp4v$|.m4v$|.3gp$|.3gpp2$|.3g2$/i;
        if ((_loc3_ != null ? new URL(_loc3_.url) : null) == null || null.rawUrl == null || null.rawUrl.length <= 0) {
            return false;
        }
        if (null.protocol == "") {
            return _loc4_.test(null.path);
        }
        if (NetStreamUtils.isRTMPStream(null.rawUrl)) {
            return true;
        }
        if (null.protocol.search(/file$|http$|https$/i) != -1) {
            return null.path == null || null.path.length <= 0 || null.path.indexOf(".") == -1 || _loc4_.test(null.path);
        }
        return false;
    }

    protected function createNetStream(param1: NetConnection, param2: URLResource): NetStream {
        return new NetStream(param1);
    }

    protected function createNetStreamSwitchManager(param1: NetConnection, param2: NetStream, param3: DynamicStreamingResource): NetStreamSwitchManagerBase {
        return null;
    }

    protected function processFinishLoading(param1: NetStreamLoadTrait): void {
        updateLoadTrait(param1, LoadState.READY);
    }

    override protected function executeLoad(param1: LoadTrait): void {
        updateLoadTrait(param1, LoadState.LOADING);
        var _loc2_: URL = new URL((param1.resource as URLResource).url);
        switch (_loc2_.protocol) {
            case PROTOCOL_RTMP:
            case PROTOCOL_RTMPS:
            case PROTOCOL_RTMPT:
            case PROTOCOL_RTMPE:
            case PROTOCOL_RTMPTE:
                this.startLoadingRTMP(param1);
                break;
            case PROTOCOL_HTTP:
            case PROTOCOL_HTTPS:
            case PROTOCOL_FILE:
            case PROTOCOL_EMPTY:
                this.startLoadingHTTP(param1);
                break;
            default:
                updateLoadTrait(param1, LoadState.LOAD_ERROR);
                param1.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, new MediaError(MediaErrorCodes.URL_SCHEME_INVALID)));
        }
    }

    override protected function executeUnload(param1: LoadTrait): void {
        var _loc2_: NetStreamLoadTrait = param1 as NetStreamLoadTrait;
        updateLoadTrait(param1, LoadState.UNLOADING);
        _loc2_.netStream.close();
        if (_loc2_.netConnectionFactory != null) {
            _loc2_.netConnectionFactory.closeNetConnection(_loc2_.connection);
        } else {
            _loc2_.connection.close();
        }
        updateLoadTrait(param1, LoadState.UNINITIALIZED);
    }

    private function finishLoading(param1: NetConnection, param2: LoadTrait, param3: NetConnectionFactoryBase = null): void {
        var _loc5_: * = null;
        var _loc4_: NetStreamLoadTrait;
        if ((_loc4_ = param2 as NetStreamLoadTrait) != null) {
            _loc4_.connection = param1;
            (_loc5_ = this.createNetStream(param1, _loc4_.resource as URLResource)).client = new NetClient();
            _loc4_.netStream = _loc5_;
            _loc4_.switchManager = this.createNetStreamSwitchManager(param1, _loc5_, _loc4_.resource as DynamicStreamingResource);
            _loc4_.netConnectionFactory = param3;
            this.processFinishLoading(param2 as NetStreamLoadTrait);
        }
    }

    private function startLoadingRTMP(param1: LoadTrait): void {
        this.addPendingLoad(param1);
        this.netConnectionFactory.create(param1.resource as URLResource);
    }

    private function onCreationComplete(param1: NetConnectionFactoryEvent): void {
        this.finishLoading(param1.netConnection, this.findAndRemovePendingLoad(param1.resource), param1.currentTarget as NetConnectionFactoryBase);
    }

    private function onCreationError(param1: NetConnectionFactoryEvent): void {
        var _loc2_: LoadTrait = this.findAndRemovePendingLoad(param1.resource);
        if (_loc2_ != null) {
            _loc2_.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, param1.mediaError));
            updateLoadTrait(_loc2_, LoadState.LOAD_ERROR);
        }
    }

    private function startLoadingHTTP(param1: LoadTrait): void {
        var _loc2_: NetConnection = new NetConnection();
        _loc2_.client = new NetClient();
        _loc2_.connect(null);
        this.finishLoading(_loc2_, param1);
    }

    private function addPendingLoad(param1: LoadTrait): void {
        if (this.pendingLoads[param1.resource] == null) {
            this.pendingLoads[param1.resource] = [param1];
        } else {
            this.pendingLoads[param1.resource].push(param1);
        }
    }

    private function findAndRemovePendingLoad(param1: URLResource): LoadTrait {
        var _loc4_: int = 0;
        var _loc2_: * = null;
        var _loc3_: Array = this.pendingLoads[param1];
        if (_loc3_ != null) {
            if (_loc3_.length == 1) {
                _loc2_ = _loc3_[0] as LoadTrait;
                delete this.pendingLoads[param1];
            } else {
                _loc4_ = 0;
                while (_loc4_ < _loc3_.length) {
                    _loc2_ = _loc3_[_loc4_];
                    if (_loc2_.resource == param1) {
                        _loc3_.splice(_loc4_, 1);
                        break;
                    }
                    _loc4_++;
                }
            }
        }
        return _loc2_;
    }
}
}
