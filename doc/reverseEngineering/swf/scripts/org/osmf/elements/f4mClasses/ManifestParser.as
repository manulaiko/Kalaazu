package org.osmf.elements.f4mClasses {

import flash.utils.ByteArray;

import org.osmf.media.MediaResourceBase;
import org.osmf.media.MediaType;
import org.osmf.media.URLResource;
import org.osmf.metadata.Metadata;
import org.osmf.metadata.MetadataNamespaces;
import org.osmf.net.DynamicStreamingItem;
import org.osmf.net.DynamicStreamingResource;
import org.osmf.net.NetStreamUtils;
import org.osmf.net.StreamType;
import org.osmf.net.StreamingURLResource;
import org.osmf.net.httpstreaming.dvr.DVRInfo;
import org.osmf.utils.OSMFStrings;
import org.osmf.utils.URL;

public class ManifestParser {

    namespace xmlns = "http://ns.adobe.com/f4m/1.0";


    public function ManifestParser() {
        super();
    }

    public function parse(param1: String, param2: String = null): Manifest {
        var _loc6_: * = null;
        var _loc7_: Boolean = false;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc3_: Manifest = new Manifest();
        var _loc4_: XML;
        if ((_loc4_ = new XML(param1)).id.length() > 0) {
            _loc3_.id = _loc4_.id.text();
        }
        if (_loc4_.duration.length() > 0) {
            _loc3_.duration = _loc4_.duration.text();
        }
        if (_loc4_.startTime.length() > 0) {
            _loc3_.startTime = DateUtil.parseW3CDTF(_loc4_.startTime.text());
        }
        if (_loc4_.mimeType.length() > 0) {
            _loc3_.mimeType = _loc4_.mimeType.text();
        }
        if (_loc4_.streamType.length() > 0) {
            _loc3_.streamType = _loc4_.streamType.text();
        }
        if (_loc4_.deliveryType.length() > 0) {
            _loc3_.deliveryType = _loc4_.deliveryType.text();
        }
        if (_loc4_.baseURL.length() > 0) {
            _loc3_.baseURL = _loc4_.baseURL.text();
        }
        var _loc5_: String = _loc3_.baseURL != null ? _loc3_.baseURL : param2;
        var _loc12_: int = 0;
        var _loc13_: * = _loc4_.dvrInfo;
        for each(_loc6_ in _loc13_) {
            this.parseDVRInfo(_loc6_, _loc5_, _loc3_);
        }
        _loc7_ = false;
        for each(_loc8_ in _loc4_.media) {
            _loc11_ = this.parseMedia(_loc8_, _loc5_);
            _loc3_.media.push(_loc11_);
            _loc7_ = _loc7_ || isNaN(_loc11_.bitrate);
        }
        if (_loc3_.media.length > 1 && _loc7_) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.F4M_PARSE_BITRATE_MISSING));
        }
        for each(_loc9_ in _loc4_.drmAdditionalHeader) {
            this.parseDRMAdditionalHeader(_loc9_, _loc3_.media, _loc5_, _loc3_);
        }
        for each(_loc10_ in _loc4_.bootstrapInfo) {
            this.parseBootstrapInfo(_loc10_, _loc3_.media, _loc5_, _loc3_);
        }
        this.generateRTMPBaseURL(_loc3_);
        return _loc3_;
    }

    private function parseMedia(param1: XML, param2: String): Media {
        var decoder: Base64Decoder = null;
        var var_2412: ByteArray = null;
        var header: String = null;
        var metaInfo: Object = null;
        var value: XML = param1;
        var baseUrl: String = param2;
        var media: Media = new Media();
        if (value.attribute("url").length() > 0) {
            media.url = value.@url;
            if (value.attribute("bitrate").length() > 0) {
                media.bitrate = value.@bitrate;
            }
            if (value.attribute("drmAdditionalHeaderId").length() > 0) {
                media.drmAdditionalHeader.id = value.@drmAdditionalHeaderId;
            }
            if (value.attribute("bootstrapInfoId").length() > 0) {
                media.bootstrapInfo = new BootstrapInfo();
                media.bootstrapInfo.id = value.@bootstrapInfoId;
            }
            if (value.attribute("height").length() > 0) {
                media.height = value.@height;
            }
            if (value.attribute("width").length() > 0) {
                media.width = value.@width;
            }
            if (value.moov.length() > 0) {
                decoder = new Base64Decoder();
                decoder.decode(value.moov.text());
                media.moov = decoder.drain();
            }
            if (value.metadata.length() > 0) {
                decoder = new Base64Decoder();
                decoder.decode(value.metadata.text());
                var_2412 = decoder.drain();
                var_2412.position = 0;
                var_2412.objectEncoding = 0;
                try {
                    header = var_2412.readObject() as String;
                    metaInfo = var_2412.readObject();
                    media.metadata = metaInfo;
                } catch (e: Error) {
                }
            }
            if (value.xmpMetadata.length() > 0) {
                decoder = new Base64Decoder();
                decoder.decode(value.xmpMetadata.text());
                media.xmp = decoder.drain();
            }
            return media;
        }
        throw new ArgumentError(OSMFStrings.getString(OSMFStrings.F4M_PARSE_MEDIA_URL_MISSING));
    }

    private function parseDVRInfo(param1: XML, param2: String, param3: Manifest): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc4_: DVRInfo = new DVRInfo();
        if (param1.attribute("id").length() > 0) {
            _loc4_.id = param1.@id;
        }
        if (param1.attribute("url").length() > 0) {
            _loc5_ = param1.@url;
            if (!this.isAbsoluteURL(_loc5_)) {
                _loc5_ = param2 + "/" + _loc5_;
            }
            _loc4_.url = _loc5_;
        }
        if (param1.attribute("beginOffset").length() > 0) {
            _loc4_.beginOffset = Math.max(0, parseInt(param1.@beginOffset));
        }
        if (param1.attribute("endOffset").length() > 0) {
            _loc4_.endOffset = Math.max(0, parseInt(param1.@endOffset));
        }
        if (param1.attribute("offline").length() > 0) {
            _loc6_ = param1.@offline;
            _loc4_.offline = _loc6_.toLowerCase() == "true";
        }
        param3.dvrInfo = _loc4_;
    }

    private function parseDRMAdditionalHeader(param1: XML, param2: Vector.<Media>, param3: String, param4: Manifest): void {
        var _loc6_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc5_: * = null;
        var _loc7_: DRMAdditionalHeader = new DRMAdditionalHeader();
        if (param1.attribute("id").length() > 0) {
            _loc7_.id = param1.@id;
        }
        if (param1.attribute("url").length() > 0) {
            _loc5_ = param1.@url;
            if (!this.isAbsoluteURL(_loc5_)) {
                _loc5_ = param3 + "/" + _loc5_;
            }
            _loc7_.url = _loc5_;
        } else {
            _loc8_ = param1.text();
            (_loc9_ = new Base64Decoder()).decode(_loc8_);
            _loc7_.data = _loc9_.drain();
        }
        param4.drmAdditionalHeaders.push(_loc7_);
        for each(_loc6_ in param2) {
            if (_loc6_.drmAdditionalHeader.id == _loc7_.id) {
                _loc6_.drmAdditionalHeader = _loc7_;
            }
        }
    }

    private function parseBootstrapInfo(param1: XML, param2: Vector.<Media>, param3: String, param4: Manifest): void {
        var _loc5_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc6_: * = null;
        var _loc7_: BootstrapInfo = new BootstrapInfo();
        if (param1.attribute("profile").length() > 0) {
            _loc7_.profile = param1.@profile;
            if (param1.attribute("id").length() > 0) {
                _loc7_.id = param1.@id;
            }
            if (param1.attribute("url").length() > 0) {
                _loc6_ = param1.@url;
                if (!this.isAbsoluteURL(_loc6_) && param3 != null) {
                    _loc6_ = param3 + "/" + _loc6_;
                }
                _loc7_.url = _loc6_;
            } else {
                _loc8_ = param1.text();
                (_loc9_ = new Base64Decoder()).decode(_loc8_);
                _loc7_.data = _loc9_.drain();
            }
            for each(_loc5_ in param2) {
                if (_loc5_.bootstrapInfo == null) {
                    _loc5_.bootstrapInfo = _loc7_;
                } else if (_loc5_.bootstrapInfo.id == _loc7_.id) {
                    _loc5_.bootstrapInfo = _loc7_;
                }
            }
            return;
        }
        throw new ArgumentError(OSMFStrings.getString(OSMFStrings.F4M_PARSE_PROFILE_MISSING));
    }

    private function generateRTMPBaseURL(param1: Manifest): void {
        var _loc2_: * = null;
        if (param1.baseURL == null) {
            for each(_loc2_ in param1.media) {
                if (NetStreamUtils.isRTMPStream(_loc2_.url)) {
                    param1.baseURL = _loc2_.url;
                    break;
                }
            }
        }
    }

    public function createResource(param1: Manifest, param2: URLResource): MediaResourceBase {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc10_: URL = new URL(param2.url);
        var _loc11_: String = (_loc11_ = "/" + _loc10_.path).substr(0, _loc11_.lastIndexOf("/"));
        var _loc12_: String = _loc10_.protocol + "://" + _loc10_.host + (_loc10_.port != "" ? ":" + _loc10_.port : "") + _loc11_;
        if (param1.media.length == 1) {
            _loc8_ = (_loc6_ = param1.media[0] as Media).url;
            _loc14_ = null;
            if (this.isAbsoluteURL(_loc8_)) {
                _loc14_ = _loc6_.url.substr(0, _loc6_.url.lastIndexOf("/"));
            } else if (param1.baseURL != null) {
                _loc14_ = param1.baseURL;
            } else {
                _loc14_ = _loc12_;
            }
            if (this.isAbsoluteURL(_loc8_)) {
                _loc5_ = new StreamingURLResource(_loc8_, param1.streamType);
            } else if (param1.baseURL != null) {
                _loc5_ = new StreamingURLResource(param1.baseURL + "/" + _loc8_, this.streamType(param1));
            } else {
                _loc5_ = new StreamingURLResource(_loc12_ + "/" + _loc8_, this.streamType(param1));
            }
            if (_loc6_.bootstrapInfo != null) {
                (_loc7_ = new Vector.<String>()).push(_loc14_);
                _loc9_ = _loc6_.bootstrapInfo.url;
                if (_loc6_.bootstrapInfo.url != null && this.isAbsoluteURL(_loc6_.bootstrapInfo.url) == false) {
                    _loc9_ = _loc12_ + "/" + _loc9_;
                    _loc6_.bootstrapInfo.url = _loc9_;
                }
                (_loc4_ = new Metadata()).addValue(MetadataNamespaces.HTTP_STREAMING_BOOTSTRAP_KEY, _loc6_.bootstrapInfo);
                if (_loc7_.length > 0) {
                    _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_SERVER_BASE_URLS_KEY, _loc7_);
                }
            }
            if (_loc6_.metadata != null) {
                if (_loc4_ == null) {
                    _loc4_ = new Metadata();
                }
                _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_STREAM_METADATA_KEY, _loc6_.metadata);
            }
            if (_loc6_.xmp != null) {
                if (_loc4_ == null) {
                    _loc4_ = new Metadata();
                }
                _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_XMP_METADATA_KEY, _loc6_.xmp);
            }
            if (_loc6_.drmAdditionalHeader != null) {
                _loc3_ = new Metadata();
                if (Media(param1.media[0]).drmAdditionalHeader != null && Media(param1.media[0]).drmAdditionalHeader.data != null) {
                    _loc3_.addValue(MetadataNamespaces.DRM_ADDITIONAL_HEADER_KEY, Media(param1.media[0]).drmAdditionalHeader.data);
                    _loc5_.drmContentData = this.extractDRMMetadata(Media(param1.media[0]).drmAdditionalHeader.data);
                }
            }
            if (_loc4_ != null) {
                _loc5_.addMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA, _loc4_);
            }
            if (_loc3_ != null) {
                _loc5_.addMetadataValue(MetadataNamespaces.DRM_METADATA, _loc3_);
            }
        } else if (param1.media.length > 1) {
            _loc15_ = param1.baseURL != null ? param1.baseURL : _loc12_;
            (_loc7_ = new Vector.<String>()).push(_loc15_);
            _loc16_ = new DynamicStreamingResource(_loc15_, this.streamType(param1));
            _loc17_ = new Vector.<DynamicStreamingItem>();
            if (NetStreamUtils.isRTMPStream(_loc15_) == false) {
                _loc4_ = new Metadata();
                _loc16_.addMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA, _loc4_);
                _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_SERVER_BASE_URLS_KEY, _loc7_);
            }
            for each(_loc6_ in param1.media) {
                if (this.isAbsoluteURL(_loc6_.url)) {
                    _loc18_ = NetStreamUtils.getStreamNameFromURL(_loc6_.url);
                } else {
                    _loc18_ = _loc6_.url;
                }
                _loc19_ = new DynamicStreamingItem(_loc18_, _loc6_.bitrate, _loc6_.width, _loc6_.height);
                _loc17_.push(_loc19_);
                if (_loc6_.drmAdditionalHeader != null) {
                    if (_loc16_.getMetadataValue(MetadataNamespaces.DRM_METADATA) == null) {
                        _loc3_ = new Metadata();
                        _loc16_.addMetadataValue(MetadataNamespaces.DRM_METADATA, _loc3_);
                    }
                    if (_loc6_.drmAdditionalHeader != null && _loc6_.drmAdditionalHeader.data != null) {
                        _loc3_.addValue(_loc19_.streamName, this.extractDRMMetadata(_loc6_.drmAdditionalHeader.data));
                        _loc3_.addValue(MetadataNamespaces.DRM_ADDITIONAL_HEADER_KEY + _loc19_.streamName, _loc6_.drmAdditionalHeader.data);
                    }
                }
                if (_loc6_.bootstrapInfo != null) {
                    _loc9_ = !!_loc6_.bootstrapInfo.url ? _loc6_.bootstrapInfo.url : null;
                    if (_loc6_.bootstrapInfo.url != null && this.isAbsoluteURL(_loc6_.bootstrapInfo.url) == false) {
                        _loc9_ = _loc12_ + "/" + _loc9_;
                        _loc6_.bootstrapInfo.url = _loc9_;
                    }
                    _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_BOOTSTRAP_KEY + _loc19_.streamName, _loc6_.bootstrapInfo);
                }
                if (_loc6_.metadata != null) {
                    _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_STREAM_METADATA_KEY + _loc19_.streamName, _loc6_.metadata);
                }
                if (_loc6_.xmp != null) {
                    _loc4_.addValue(MetadataNamespaces.HTTP_STREAMING_XMP_METADATA_KEY + _loc19_.streamName, _loc6_.xmp);
                }
            }
            _loc16_.streamItems = _loc17_;
            _loc5_ = _loc16_;
        } else if (param1.baseURL == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.F4M_PARSE_MEDIA_URL_MISSING));
        }
        if (param1.mimeType != null) {
            _loc5_.mediaType = MediaType.VIDEO;
            _loc5_.mimeType = param1.mimeType;
        }
        var _loc13_: StreamingURLResource;
        if ((_loc13_ = param2 as StreamingURLResource) != null) {
            _loc5_.clipStartTime = _loc13_.clipStartTime;
            _loc5_.clipEndTime = _loc13_.clipEndTime;
        }
        _loc5_.addMetadataValue(MetadataNamespaces.DERIVED_RESOURCE_METADATA, param2);
        this.addDVRInfo(param1, _loc5_);
        return _loc5_;
    }

    private function isAbsoluteURL(param1: String): Boolean {
        var _loc2_: URL = new URL(param1);
        return _loc2_.absolute;
    }

    private function extractDRMMetadata(param1: ByteArray): ByteArray {
        var header: Object = null;
        var encryption: Object = null;
        var enc: Object = null;
        var params: Object = null;
        var keyInfo: Object = null;
        var fmrmsMetadata: Object = null;
        var drmMetadata: String = null;
        var decoder: Base64Decoder = null;
        var var_2412: ByteArray = param1;
        var metadata: ByteArray = null;
        var_2412.position = 0;
        var_2412.objectEncoding = 0;
        try {
            header = var_2412.readObject();
            encryption = var_2412.readObject();
            enc = encryption["Encryption"];
            params = enc["Params"];
            keyInfo = params["KeyInfo"];
            fmrmsMetadata = keyInfo["FMRMS_METADATA"];
            drmMetadata = fmrmsMetadata["Metadata"] as String;
            decoder = new Base64Decoder();
            decoder.decode(drmMetadata);
            metadata = decoder.drain();
        } catch (e: Error) {
            metadata = null;
        }
        return metadata;
    }

    private function addDVRInfo(param1: Manifest, param2: StreamingURLResource): void {
        if (param1.dvrInfo == null) {
            return;
        }
        var _loc3_: Metadata = new Metadata();
        _loc3_.addValue(MetadataNamespaces.HTTP_STREAMING_DVR_BEGIN_OFFSET_KEY, param1.dvrInfo.beginOffset);
        _loc3_.addValue(MetadataNamespaces.HTTP_STREAMING_DVR_END_OFFSET_KEY, param1.dvrInfo.endOffset);
        _loc3_.addValue(MetadataNamespaces.HTTP_STREAMING_DVR_OFFLINE_KEY, param1.dvrInfo.offline);
        _loc3_.addValue(MetadataNamespaces.HTTP_STREAMING_DVR_ID_KEY, param1.dvrInfo.id);
        param2.addMetadataValue(MetadataNamespaces.DVR_METADATA, _loc3_);
    }

    private function streamType(param1: Manifest): String {
        return param1.streamType == StreamType.LIVE && param1.dvrInfo != null ? "null" : param1.streamType;
    }
}
}
