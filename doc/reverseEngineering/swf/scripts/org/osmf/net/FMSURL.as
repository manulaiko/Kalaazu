package org.osmf.net {

import org.osmf.utils.URL;

public class FMSURL extends URL {

    private static const APPNAME_START_INDEX: uint = 0;

    private static const INSTANCENAME_START_INDEX: uint = 2;

    private static const STREAMNAME_START_INDEX: uint = 4;

    private static const DEFAULT_INSTANCE_NAME: String = "_definst_";

    public static const MP4_STREAM: String = "mp4";

    public static const MP3_STREAM: String = "mp3";

    public static const ID3_STREAM: String = "id3";

    public static const QUERY_STRING_STREAM: String = "streamName";

    public static const QUERY_STRING_STREAMTYPE: String = "streamType";


    private var _useInstance: Boolean;

    private var _appName: String;

    private var _instanceName: String;

    private var _streamName: String;

    private var _fileFormat: String;

    private var _origins: Vector.<FMSHost>;

    private var _edges: Vector.<FMSHost>;

    public function FMSURL(param1: String, param2: Boolean = false) {
        super(param1);
        this._useInstance = param2;
        this._appName = "";
        this._instanceName = "";
        this._streamName = "";
        this._fileFormat = "";
        this.parsePath();
        this.parseQuery();
    }

    public function get useInstance(): Boolean {
        return this._useInstance;
    }

    public function get appName(): String {
        return this._appName;
    }

    public function get instanceName(): String {
        return this._instanceName;
    }

    public function get streamName(): String {
        return this._streamName;
    }

    public function get fileFormat(): String {
        return this._fileFormat;
    }

    public function get edges(): Vector.<FMSHost> {
        return this._edges;
    }

    public function get origins(): Vector.<FMSHost> {
        return this._origins;
    }

    private function parsePath(): void {
        var _loc3_: * = null;
        var _loc4_: * = 0;
        var _loc5_: int = 0;
        if (path == null || false) {
            this._streamName = getParamValue(QUERY_STRING_STREAM);
            this._fileFormat = getParamValue(QUERY_STRING_STREAMTYPE);
            return;
        }
        var _loc1_: RegExp = /(\/)/;
        var _loc2_: Array = path.split(_loc1_);
        if (_loc2_ != null) {
            this._appName = _loc2_[APPNAME_START_INDEX];
            this._instanceName = "";
            this._streamName = "";
            _loc3_ = new RegExp("^.*/" + DEFAULT_INSTANCE_NAME, "i");
            if (path.search(_loc3_) > -1) {
                this._useInstance = true;
            }
            _loc4_ = STREAMNAME_START_INDEX;
            if (this._useInstance) {
                this._instanceName = _loc2_[INSTANCENAME_START_INDEX];
            } else {
                _loc4_ = INSTANCENAME_START_INDEX;
            }
            _loc5_ = _loc4_;
            while (_loc5_ < _loc2_.length) {
                this._streamName += _loc2_[_loc5_];
                _loc5_++;
            }
            if (this._streamName == null || this._streamName == "") {
                this._streamName = getParamValue(QUERY_STRING_STREAM);
            }
            if (this._streamName.search(/^mp4:/i) > -1) {
                this._fileFormat = MP4_STREAM;
            } else if (this._streamName.search(/^mp3:/i) > -1) {
                this._fileFormat = MP3_STREAM;
            } else if (this._streamName.search(/^id3:/i) > -1) {
                this._fileFormat = ID3_STREAM;
            }
            if (this._fileFormat == null || this._fileFormat == "") {
                this._fileFormat = getParamValue(QUERY_STRING_STREAMTYPE);
            }
        }
    }

    private function parseQuery(): void {
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        if (query == null || false || query.search(/:\//) == -1) {
            return;
        }
        var _loc1_: Array = query.split("?");
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_.length) {
            if ((_loc12_ = int(_loc1_[_loc2_].toString().search(/:\//))) == -1) {
                _loc1_.splice(_loc2_, 1);
            }
            _loc2_++;
        }
        var _loc3_: Boolean = false;
        var _loc4_: int = 0;
        if (_loc1_.length >= 2) {
            _loc3_ = true;
            _loc4_ = _loc1_.length - 1;
        }
        var _loc5_: String = "";
        var _loc6_: String = "";
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        while (_loc11_ < _loc1_.length) {
            _loc9_ = (_loc13_ = int(_loc1_[_loc11_].toString().search(/:\//))) + 2;
            if (_loc1_[_loc11_].charAt(_loc9_) == "/") {
                _loc9_++;
            }
            _loc7_ = int(_loc1_[_loc11_].indexOf(":", _loc9_));
            if ((_loc8_ = int(_loc1_[_loc11_].indexOf("/", _loc9_))) < 0 && _loc7_ < 0) {
                _loc5_ = _loc1_[_loc11_].slice(_loc9_);
            } else if (_loc7_ >= 0 && _loc7_ < _loc8_) {
                _loc10_ = _loc7_;
                _loc5_ = _loc1_[_loc11_].slice(_loc9_, _loc10_);
                _loc9_ = _loc10_ + 1;
                _loc10_ = _loc8_;
                _loc6_ = _loc1_[_loc11_].slice(_loc9_, _loc10_);
            } else if (_loc1_[_loc11_].indexOf("://") != -1) {
                _loc10_ = _loc8_;
                _loc5_ = _loc1_[_loc11_].slice(_loc9_, _loc10_);
            } else {
                _loc10_ = int(_loc1_[_loc11_].indexOf("/"));
                _loc5_ = "localhost";
            }
            if (_loc11_ == _loc4_) {
                if (this._origins == null) {
                    this._origins = new Vector.<FMSHost>();
                }
                this._origins.push(new FMSHost(_loc5_, _loc6_));
                _loc14_ = new FMSURL(_loc1_[_loc11_], this._useInstance);
                if (this._appName == "") {
                    this._appName = _loc14_.appName;
                }
                if (this._useInstance && this._instanceName == "") {
                    this._instanceName = _loc14_.instanceName;
                }
                if (this._streamName == "") {
                    this._streamName = _loc14_.streamName;
                }
            } else if (_loc1_[_loc11_] != query && _loc3_) {
                if (this._edges == null) {
                    this._edges = new Vector.<FMSHost>();
                }
                this._edges.push(new FMSHost(_loc5_, _loc6_));
            }
            _loc11_++;
        }
    }
}
}
