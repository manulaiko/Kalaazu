package org.osmf.utils {

import flash.utils.Dictionary;

public class OSMFStrings {

    public static const COMPOSITE_TRAIT_NOT_FOUND: String = "compositeTraitNotFound";

    public static const INVALID_PARAM: String = "invalidParam";

    public static const NULL_PARAM: String = "nullParam";

    public static const FUNCTION_MUST_BE_OVERRIDDEN: String = "functionMustBeOverridden";

    public static const ALREADY_ADDED: String = "alreadyAdded";

    public static const UNSUPPORTED_MEDIA_ELEMENT_TYPE: String = "unsupportedMediaElementType";

    public static const TRAIT_INSTANCE_ALREADY_ADDED: String = "traitInstanceAlreadyAdded";

    public static const TRAIT_RESOLVER_ALREADY_ADDED: String = "traitResolverAlreadyAdded";

    public static const CAPABILITY_NOT_SUPPORTED: String = "capabilityNotSupported";

    public static const MEDIA_LOAD_FAILED: String = "mediaLoadFailed";

    public static const MUST_SET_LOADER: String = "mustSetLoader";

    public static const LOADER_CANT_HANDLE_RESOURCE: String = "loaderCantHandleResource";

    public static const PAUSE_NOT_SUPPORTED: String = "pauseNotSupported";

    public static const ALREADY_READY: String = "alreadyReady";

    public static const ALREADY_LOADING: String = "alreadyLoading";

    public static const ALREADY_UNLOADED: String = "alreadyUnloaded";

    public static const ALREADY_UNLOADING: String = "alreadyUnloading";

    public static const INVALID_LAYOUT_RENDERER_CONSTRUCTOR: String = "invalidLayoutRendererConstructor";

    public static const ILLEGAL_CONSTRUCTOR_INVOCATION: String = "illegalConstructorInvocation";

    public static const DIRECT_DISPLAY_LIST_MOD_ERROR: String = "directDisplayListModError";

    public static const NULL_SCRIPT_PATH: String = "nullScriptPath";

    public static const STREAMSWITCH_INVALID_INDEX: String = "streamSwitchInvalidIndex";

    public static const STREAMSWITCH_STREAM_NOT_IN_MANUAL_MODE: String = "streamSwitchStreamNotInManualMode";

    public static const DVR_MAXIMUM_RPC_ATTEMPTS: String = "dvrMaximumRPCAttempts";

    public static const DVR_UNEXPECTED_SERVER_RESPONSE: String = "dvrUnexpectedServerResponse";

    public static const F4M_PARSE_PROFILE_MISSING: String = "f4mProfileMissing";

    public static const F4M_PARSE_MEDIA_URL_MISSING: String = "f4mMediaURLMissing";

    public static const F4M_PARSE_BITRATE_MISSING: String = "f4mBitrateMissing";

    public static const IO_ERROR: String = "ioError";

    public static const SECURITY_ERROR: String = "securityError";

    public static const ASYNC_ERROR: String = "asyncError";

    public static const ARGUMENT_ERROR: String = "argumentError";

    public static const URL_SCHEME_INVALID: String = "urlSchemeInvalid";

    public static const HTTP_GET_FAILED: String = "httpGetFailed";

    public static const PLUGIN_VERSION_INVALID: String = "pluginVersionInvalid";

    public static const PLUGIN_IMPLEMENTATION_INVALID: String = "pluginImplementationInvalid";

    public static const SOUND_PLAY_FAILED: String = "soundPlayFailed";

    public static const NETCONNECTION_REJECTED: String = "netConnectionRejected";

    public static const NETCONNECTION_APPLICATION_INVALID: String = "netConnectionApplicationInvalid";

    public static const NETCONNECTION_FAILED: String = "netConnectionFailed";

    public static const NETCONNECTION_TIMEOUT: String = "netConnectionTimeout";

    public static const NETSTREAM_PLAY_FAILED: String = "netStreamPlayFailed";

    public static const NETSTREAM_STREAM_NOT_FOUND: String = "netStreamStreamNotFound";

    public static const NETSTREAM_FILE_STRUCTURE_INVALID: String = "netStreamFileStructureInvalid";

    public static const NETSTREAM_NO_SUPPORTED_TRACK_FOUND: String = "netStreamNoSupportedTrackFound";

    public static const DRM_SYSTEM_UPDATE_ERROR: String = "drmSystemUpdateError";

    public static const DVRCAST_SUBSCRIBE_FAILED: String = "dvrCastSubscribeFailed";

    public static const DVRCAST_CONTENT_OFFLINE: String = "dvrCastContentOffline";

    public static const DVRCAST_STREAM_INFO_RETRIEVAL_FAILED: String = "dvrCastStreamInfoRetrievalFailed";

    private static const resourceDict: Dictionary = new Dictionary();

    private static var _resourceStringFunction: Function = defaultResourceStringFunction;

    public static const DRM_METADATA_NOT_SET: String = "drmMetadataNotSet";

    {
        resourceDict[COMPOSITE_TRAIT_NOT_FOUND] = "There is no composite trait for the given trait type";
        resourceDict[INVALID_PARAM] = "Invalid parameter passed to method";
        resourceDict[NULL_PARAM] = "Unexpected null parameter passed to method";
        resourceDict[FUNCTION_MUST_BE_OVERRIDDEN] = "Function must be overridden";
        resourceDict[ALREADY_ADDED] = "Child has already been added";
        resourceDict[UNSUPPORTED_MEDIA_ELEMENT_TYPE] = "The specified media element type is not supported";
        resourceDict[TRAIT_INSTANCE_ALREADY_ADDED] = "An instance of this trait class has already been added to this MediaElement";
        resourceDict[TRAIT_RESOLVER_ALREADY_ADDED] = "A trait resolver for the specified trait type has already been added to this MediaElement";
        resourceDict[CAPABILITY_NOT_SUPPORTED] = "The specified capability is not currently supported";
        resourceDict[MEDIA_LOAD_FAILED] = "The loading of a MediaElement failed";
        resourceDict[MUST_SET_LOADER] = "Must set LoaderBase on a LoadTrait before calling load or unload";
        resourceDict[LOADER_CANT_HANDLE_RESOURCE] = "LoaderBase unable to handle the given MediaResourceBase";
        resourceDict[PAUSE_NOT_SUPPORTED] = "PlayTrait.pause cannot be invoked when canPause is false";
        resourceDict[ALREADY_READY] = "Loader - attempt to load an already loaded object";
        resourceDict[ALREADY_LOADING] = "Loader - attempt to load a loading object";
        resourceDict[ALREADY_UNLOADED] = "Loader - attempt to unload an already unloaded object";
        resourceDict[ALREADY_UNLOADING] = "Loader - attempt to unload a unloading object";
        resourceDict[INVALID_LAYOUT_RENDERER_CONSTRUCTOR] = "Unable to construct LayoutRenderer implementation";
        resourceDict[ILLEGAL_CONSTRUCTOR_INVOCATION] = "Use the static getInstance method to obtain a class instance";
        resourceDict[DIRECT_DISPLAY_LIST_MOD_ERROR] = "The direct addition or removal of display objects onto a MediaContainer is prohibited.";
        resourceDict[NULL_SCRIPT_PATH] = "Operation requires a valid script path";
        resourceDict[STREAMSWITCH_INVALID_INDEX] = "Dynamic Stream Switching - Invalid index requested";
        resourceDict[STREAMSWITCH_STREAM_NOT_IN_MANUAL_MODE] = "Dynamic Stream Switching - stream is not in manual mode";
        resourceDict[DRM_METADATA_NOT_SET] = "Metadata not set on DRMServices";
        resourceDict[DVR_MAXIMUM_RPC_ATTEMPTS] = "Maximum DVRGetStreamInfo RPC attempts (%i) reached";
        resourceDict[DVR_UNEXPECTED_SERVER_RESPONSE] = "Unexpected server response: ";
        resourceDict[F4M_PARSE_PROFILE_MISSING] = "Profile missing from Bootstrap info tag";
        resourceDict[F4M_PARSE_MEDIA_URL_MISSING] = "URL missing from Media tag";
        resourceDict[F4M_PARSE_BITRATE_MISSING] = "Bitrate missing from Media tag";
        resourceDict[IO_ERROR] = "I/O error when loading media";
        resourceDict[SECURITY_ERROR] = "Security error when loading media";
        resourceDict[ASYNC_ERROR] = "Async error when loading media";
        resourceDict[ARGUMENT_ERROR] = "Argument error when loading media";
        resourceDict[URL_SCHEME_INVALID] = "Invalid URL scheme";
        resourceDict[HTTP_GET_FAILED] = "HTTP GET failed due to a Client Error (4xx Status Code)";
        resourceDict[PLUGIN_VERSION_INVALID] = "Plugin failed to load due to version mismatch";
        resourceDict[PLUGIN_IMPLEMENTATION_INVALID] = "Plugin failed to load due to improper or missing implementation of PluginInfo";
        resourceDict[SOUND_PLAY_FAILED] = "Playback failed due to no sound channels being available";
        resourceDict[NETCONNECTION_REJECTED] = "Connection attempt rejected by FMS server";
        resourceDict[NETCONNECTION_APPLICATION_INVALID] = "Attempting to connect to an invalid FMS application";
        resourceDict[NETCONNECTION_FAILED] = "All NetConnection attempts failed";
        resourceDict[NETCONNECTION_TIMEOUT] = "Timed-out trying to establish a NetConnection";
        resourceDict[NETSTREAM_PLAY_FAILED] = "Playback failed";
        resourceDict[NETSTREAM_STREAM_NOT_FOUND] = "Stream not found";
        resourceDict[NETSTREAM_FILE_STRUCTURE_INVALID] = "File has invalid structure";
        resourceDict[NETSTREAM_NO_SUPPORTED_TRACK_FOUND] = "No supported track found";
        resourceDict[DRM_SYSTEM_UPDATE_ERROR] = "The update of the DRM subsystem failed";
        resourceDict[DVRCAST_SUBSCRIBE_FAILED] = "DVRCast subscribe failed";
        resourceDict[DVRCAST_CONTENT_OFFLINE] = "DVRCast content is offline and unavailable";
        resourceDict[DVRCAST_STREAM_INFO_RETRIEVAL_FAILED] = "Unable to retrieve DVRCast stream info";
        resourceDict["missingStringResource"] = "No string for resource {0}";
    }

    public function OSMFStrings() {
        super();
    }

    public static function getString(param1: String, param2: Array = null): String {
        return resourceStringFunction(param1, param2);
    }

    public static function get resourceStringFunction(): Function {
        return _resourceStringFunction;
    }

    public static function set resourceStringFunction(param1: Function): void {
        _resourceStringFunction = param1;
    }

    private static function defaultResourceStringFunction(param1: String, param2: Array = null): String {
        var _loc3_: String = resourceDict.hasOwnProperty(param1) ? String(resourceDict[param1]) : null;
        if (_loc3_ == null) {
            _loc3_ = String(resourceDict["missingStringResource"]);
            param2 = [param1];
        }
        if (param2) {
            _loc3_ = substitute(_loc3_, param2);
        }
        return _loc3_;
    }

    private static function substitute(param1: String, ...rest): String {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc3_: String = "";
        if (param1 != null) {
            _loc3_ = param1;
            if ((_loc4_ = int(rest.length)) == 1 && rest[0] is Array) {
                _loc4_ = (_loc5_ = rest[0] as Array).length;
            } else {
                _loc5_ = rest;
            }
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                _loc3_ = _loc3_.replace(new RegExp("\\{" + _loc6_ + "\\}", "g"), _loc5_[_loc6_]);
                _loc6_++;
            }
        }
        return _loc3_;
    }
}
}
