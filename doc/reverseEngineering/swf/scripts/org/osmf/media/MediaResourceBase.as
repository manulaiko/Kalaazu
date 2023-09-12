package org.osmf.media {

import flash.utils.Dictionary;

public class MediaResourceBase {


    private var _metadata: Dictionary;

    private var _mediaType: String;

    private var _mimeType: String;

    public function MediaResourceBase() {
        super();
    }

    public function get mediaType(): String {
        return this._mediaType;
    }

    public function set mediaType(param1: String): void {
        this._mediaType = param1;
    }

    public function get mimeType(): String {
        return this._mimeType;
    }

    public function set mimeType(param1: String): void {
        this._mimeType = param1;
    }

    public function get metadataNamespaceURLs(): Vector.<String> {
        var _loc2_: * = null;
        var _loc1_: Vector.<String> = new Vector.<String>();
        if (this._metadata != null) {
            for (_loc2_ in this._metadata) {
                _loc1_.push(_loc2_);
            }
        }
        return _loc1_;
    }

    public function addMetadataValue(param1: String, param2: Object): void {
        if (this._metadata == null) {
            this._metadata = new Dictionary();
        }
        this._metadata[param1] = param2;
    }

    public function getMetadataValue(param1: String): Object {
        if (this._metadata != null) {
            return this._metadata[param1];
        }
        return null;
    }

    public function removeMetadataValue(param1: String): Object {
        var _loc2_: * = null;
        if (this._metadata != null) {
            _loc2_ = this._metadata[param1];
            delete this._metadata[param1];
            return _loc2_;
        }
        return null;
    }
}
}
