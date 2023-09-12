package org.osmf.net.httpstreaming {

import flash.utils.ByteArray;

import org.osmf.elements.f4mClasses.BootstrapInfo;
import org.osmf.media.URLResource;
import org.osmf.metadata.Metadata;
import org.osmf.metadata.MetadataNamespaces;
import org.osmf.net.DynamicStreamingItem;
import org.osmf.net.DynamicStreamingResource;
import org.osmf.net.httpstreaming.dvr.DVRInfo;
import org.osmf.net.httpstreaming.f4f.HTTPStreamingF4FIndexInfo;
import org.osmf.net.httpstreaming.f4f.HTTPStreamingF4FStreamInfo;

public class HTTPStreamingUtils {


    public function HTTPStreamingUtils() {
        super();
    }

    public static function createHTTPStreamingMetadata(param1: String, param2: ByteArray, param3: Vector.<String>): Metadata {
        var _loc4_: Metadata = new Metadata();
        var _loc5_: BootstrapInfo = new BootstrapInfo();
        if (param1 != null && param1.length > 0) {
            _loc5_.url = param1;
        }
        _loc5_.data = param2;
        _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_BOOTSTRAP_KEY, _loc5_);
        if (param3 != null && param3.length > 0) {
            _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_SERVER_BASE_URLS_KEY, param3);
        }
        return _loc4_;
    }

    public static function createF4FIndexInfo(param1: URLResource): HTTPStreamingF4FIndexInfo {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: * = null;
        var _loc3_: Metadata = param1.getMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA) as Metadata;
        var _loc4_: Metadata = param1.getMetadataValue(MetadataNamespaces.DVR_METADATA) as Metadata;
        if (_loc3_ != null) {
            _loc5_ = _loc3_.getValue(MetadataNamespaces.HTTP_STREAMING_SERVER_BASE_URLS_KEY) as Vector.<String>;
            _loc6_ = generateStreamInfos(param1);
            _loc7_ = generateDVRInfo(_loc4_);
            _loc2_ = new HTTPStreamingF4FIndexInfo(_loc5_ != null && _loc5_.length > 0 ? _loc5_[0] : null, _loc6_, _loc7_);
        }
        return _loc2_;
    }

    private static function generateDVRInfo(param1: Metadata): DVRInfo {
        if (param1 == null) {
            return null;
        }
        var _loc2_: DVRInfo = new DVRInfo();
        _loc2_.id = "";
        _loc2_.beginOffset = NaN;
        _loc2_.endOffset = NaN;
        _loc2_.offline = false;
        if (param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_ID_KEY) != null) {
            _loc2_.id = param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_ID_KEY) as String;
        }
        if (param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_BEGIN_OFFSET_KEY) != null) {
            _loc2_.beginOffset = param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_BEGIN_OFFSET_KEY) as uint;
        }
        if (param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_END_OFFSET_KEY) != null) {
            _loc2_.endOffset = param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_END_OFFSET_KEY) as uint;
        }
        if (param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_OFFLINE_KEY) != null) {
            _loc2_.offline = param1.getValue(MetadataNamespaces.HTTP_STREAMING_DVR_OFFLINE_KEY) as Boolean;
        }
        return _loc2_;
    }

    private static function generateStreamInfos(param1: URLResource): Vector.<HTTPStreamingF4FStreamInfo> {
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc2_: Vector.<HTTPStreamingF4FStreamInfo> = new Vector.<HTTPStreamingF4FStreamInfo>();
        var _loc3_: Metadata = param1.getMetadataValue(MetadataNamespaces.DRM_METADATA) as Metadata;
        var _loc4_: Metadata = param1.getMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA) as Metadata;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: DynamicStreamingResource;
        if ((_loc7_ = param1 as DynamicStreamingResource) != null) {
            for each(_loc10_ in _loc7_.streamItems) {
                _loc5_ = null;
                _loc6_ = null;
                _loc8_ = null;
                _loc9_ = null;
                if (_loc3_ != null) {
                    _loc5_ = _loc3_.getValue(MetadataNamespaces.DRM_ADDITIONAL_HEADER_KEY + _loc10_.streamName) as ByteArray;
                }
                if (_loc4_ != null) {
                    _loc6_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_BOOTSTRAP_KEY + _loc10_.streamName) as BootstrapInfo;
                    _loc8_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_STREAM_METADATA_KEY + _loc10_.streamName);
                    _loc9_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_XMP_METADATA_KEY + _loc10_.streamName) as ByteArray;
                }
                _loc2_.push(new HTTPStreamingF4FStreamInfo(_loc6_, _loc10_.streamName, _loc10_.bitrate, _loc5_, _loc8_, _loc9_));
            }
        } else {
            if (_loc3_ != null) {
                _loc5_ = _loc3_.getValue(MetadataNamespaces.DRM_ADDITIONAL_HEADER_KEY) as ByteArray;
            }
            if (_loc4_ != null) {
                _loc6_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_BOOTSTRAP_KEY) as BootstrapInfo;
                _loc8_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_STREAM_METADATA_KEY);
                _loc9_ = _loc4_.getValue(MetadataNamespaces.HTTP_STREAMING_XMP_METADATA_KEY) as ByteArray;
            }
            _loc11_ = param1.url;
            _loc2_.push(new HTTPStreamingF4FStreamInfo(_loc6_, _loc11_, NaN, _loc5_, _loc8_, _loc9_));
        }
        return _loc2_;
    }
}
}
