package org.osmf.net {

import flash.net.NetConnection;
import flash.utils.Dictionary;

import org.osmf.events.NetConnectionFactoryEvent;
import org.osmf.media.URLResource;
import org.osmf.utils.URL;

public class NetConnectionFactory extends NetConnectionFactoryBase {

    private static const DEFAULT_PORTS: String = "1935,443,80";

    private static const DEFAULT_PROTOCOLS_FOR_RTMP: String = "rtmp,rtmps,rtmpt";

    private static const DEFAULT_PROTOCOLS_FOR_RTMPE: String = "rtmpe,rtmpte";

    private static const PROTOCOL_RTMP: String = "rtmp";

    private static const PROTOCOL_RTMPS: String = "rtmps";

    private static const PROTOCOL_RTMPT: String = "rtmpt";

    private static const PROTOCOL_RTMPE: String = "rtmpe";

    private static const PROTOCOL_RTMPTE: String = "rtmpte";

    private static const PROTOCOL_HTTP: String = "http";

    private static const PROTOCOL_HTTPS: String = "https";

    private static const PROTOCOL_FILE: String = "file";

    private static const PROTOCOL_EMPTY: String = "";

    private static const MP3_EXTENSION: String = ".mp3";


    private var shareNetConnections: Boolean;

    private var negotiator: NetNegotiator;

    private var connectionDictionary: Dictionary;

    private var keyDictionary: Dictionary;

    private var pendingDictionary: Dictionary;

    public function NetConnectionFactory(param1: Boolean = true) {
        super();
        this.shareNetConnections = param1;
    }

    override public function create(param1: URLResource): void {
        var sharedConnection: SharedConnection;
        var connectionsUnderway: Vector.<URLResource>;
        var key: String = null;
        var pendingConnections: Vector.<URLResource> = null;
        var urlIncludesFMSApplicationInstance: Boolean = false;
        var netConnectionURLs: Vector.<String> = null;
        var netConnections: Vector.<NetConnection> = null;
        var var_2: int = 0;
        var negotiator: NetNegotiator = null;
        var onConnected: Function = null;
        var onConnectionFailed: Function = null;
        var resource: URLResource = param1;
        key = this.createNetConnectionKey(resource);
        if (this.connectionDictionary == null) {
            this.connectionDictionary = new Dictionary();
            this.keyDictionary = new Dictionary();
            this.pendingDictionary = new Dictionary();
        }
        sharedConnection = this.connectionDictionary[key] as SharedConnection;
        connectionsUnderway = this.pendingDictionary[key] as Vector.<URLResource>;
        if (sharedConnection != null && this.shareNetConnections) {
            ++sharedConnection.count;
            dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_COMPLETE, false, false, sharedConnection.netConnection, resource));
        } else if (connectionsUnderway != null) {
            connectionsUnderway.push(resource);
        } else {
            onConnected = function (param1: NetConnectionFactoryEvent): void {
                var _loc5_: * = null;
                var _loc6_: * = null;
                var _loc7_: * = null;
                var _loc8_: * = null;
                negotiator.removeEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE, onConnected);
                negotiator.removeEventListener(NetConnectionFactoryEvent.CREATION_ERROR, onConnectionFailed);
                var _loc2_: Vector.<NetConnectionFactoryEvent> = new Vector.<NetConnectionFactoryEvent>();
                var _loc3_: Vector.<URLResource> = pendingDictionary[key];
                var _loc4_: Number = 0;
                while (_loc4_ < _loc3_.length) {
                    _loc6_ = _loc3_[_loc4_] as URLResource;
                    if (shareNetConnections) {
                        if ((_loc7_ = connectionDictionary[key] as SharedConnection) != null) {
                            ++_loc7_.count;
                        } else {
                            (_loc8_ = new SharedConnection()).count = 1;
                            _loc8_.netConnection = param1.netConnection;
                            connectionDictionary[key] = _loc8_;
                            keyDictionary[_loc8_.netConnection] = key;
                        }
                    }
                    _loc2_.push(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_COMPLETE, false, false, param1.netConnection, _loc6_));
                    _loc4_++;
                }
                delete pendingDictionary[key];
                for each(_loc5_ in _loc2_) {
                    dispatchEvent(_loc5_);
                }
            };
            onConnectionFailed = function (param1: NetConnectionFactoryEvent): void {
                var _loc3_: * = null;
                negotiator.removeEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE, onConnected);
                negotiator.removeEventListener(NetConnectionFactoryEvent.CREATION_ERROR, onConnectionFailed);
                var _loc2_: Vector.<URLResource> = pendingDictionary[key];
                for each(_loc3_ in _loc2_) {
                    dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_ERROR, false, false, null, _loc3_, param1.mediaError));
                }
                delete pendingDictionary[key];
            };
            pendingConnections = new Vector.<URLResource>();
            pendingConnections.push(resource);
            this.pendingDictionary[key] = pendingConnections;
            urlIncludesFMSApplicationInstance = resource is StreamingURLResource ? Boolean(StreamingURLResource(resource).urlIncludesFMSApplicationInstance) : false;
            netConnectionURLs = this.createNetConnectionURLs(resource.url, urlIncludesFMSApplicationInstance);
            netConnections = new Vector.<NetConnection>();
            var_2 = 0;
            while (var_2 < netConnectionURLs.length) {
                netConnections.push(this.createNetConnection());
                var_2++;
            }
            negotiator = new NetNegotiator();
            negotiator.addEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE, onConnected);
            negotiator.addEventListener(NetConnectionFactoryEvent.CREATION_ERROR, onConnectionFailed);
            negotiator.createNetConnection(resource, netConnectionURLs, netConnections);
        }
    }

    override public function closeNetConnection(param1: NetConnection): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.shareNetConnections) {
            _loc2_ = this.keyDictionary[param1] as String;
            if (_loc2_ != null) {
                _loc3_ = this.connectionDictionary[_loc2_] as SharedConnection;
                --_loc3_.count;
                if (_loc3_.count == 0) {
                    param1.close();
                    delete this.connectionDictionary[_loc2_];
                    delete this.keyDictionary[param1];
                }
            }
        } else {
            super.closeNetConnection(param1);
        }
    }

    protected function createNetConnectionKey(param1: URLResource): String {
        var _loc2_: FMSURL = new FMSURL(param1.url);
        return _loc2_.protocol + _loc2_.host + _loc2_.port + _loc2_.appName;
    }

    protected function createNetConnection(): NetConnection {
        return new NetConnection();
    }

    protected function createNetConnectionURLs(param1: String, param2: Boolean = false): Vector.<String> {
        var _loc5_: * = null;
        var _loc3_: Vector.<String> = new Vector.<String>();
        var _loc4_: Vector.<PortProtocol> = this.buildPortProtocolSequence(param1);
        for each(_loc5_ in _loc4_) {
            _loc3_.push(this.buildConnectionAddress(param1, param2, _loc5_));
        }
        return _loc3_;
    }

    private function buildPortProtocolSequence(param1: String): Vector.<PortProtocol> {
        var _loc9_: int = 0;
        var _loc10_: * = null;
        var _loc2_: Vector.<PortProtocol> = new Vector.<PortProtocol>();
        var _loc3_: URL = new URL(param1);
        var _loc4_: String = _loc3_.port == "" ? DEFAULT_PORTS : _loc3_.port;
        var _loc5_: String = "";
        switch (_loc3_.protocol) {
            case PROTOCOL_RTMP:
                _loc5_ = DEFAULT_PROTOCOLS_FOR_RTMP;
                break;
            case PROTOCOL_RTMPE:
                _loc5_ = DEFAULT_PROTOCOLS_FOR_RTMPE;
                break;
            case PROTOCOL_RTMPS:
            case PROTOCOL_RTMPT:
            case PROTOCOL_RTMPTE:
                _loc5_ = _loc3_.protocol;
        }
        var _loc6_: Array = _loc4_.split(",");
        var _loc7_: Array = _loc5_.split(",");
        var _loc8_: int = 0;
        while (_loc8_ < _loc7_.length) {
            _loc9_ = 0;
            while (_loc9_ < _loc6_.length) {
                (_loc10_ = new PortProtocol()).protocol = _loc7_[_loc8_];
                _loc10_.port = _loc6_[_loc9_];
                _loc2_.push(_loc10_);
                _loc9_++;
            }
            _loc8_++;
        }
        return _loc2_;
    }

    private function buildConnectionAddress(param1: String, param2: Boolean, param3: PortProtocol): String {
        var _loc4_: FMSURL = new FMSURL(param1, param2);
        var _loc5_: String = param3.protocol + "://" + _loc4_.host + ":" + param3.port + "/" + _loc4_.appName + (_loc4_.useInstance ? "/" + _loc4_.instanceName : "");
        if (_loc4_.query != null && _loc4_.query != "") {
            _loc5_ += "?" + _loc4_.query;
        }
        return _loc5_;
    }
}
}

import flash.net.NetConnection;

class SharedConnection {


    public var count: Number;

    public var netConnection: NetConnection;

    function SharedConnection() {
        super();
    }
}
