package {

import mx.resources.ResourceBundle;

public class en_US$osmf_properties extends ResourceBundle {


    public function en_US$osmf_properties() {
        super("en_US", "osmf");
    }

    override protected function getContent(): Object {
        return {
            "netStreamFileStructureInvalid": "File has invalid structure",
            "netConnectionApplicationInvalid": "Attempting to connect to an invalid FMS application",
            "streamSwitchStreamNotInManualMode": "Dynamic Stream Switching - stream is not in manual mode",
            "capabilityNotSupported": "The specified capability is not currently supported",
            "httpGetFailed": "HTTP GET failed due to a Client Error (4xx Status Code)",
            "mediaLoadFailed": "The loading of a MediaElement failed",
            "nullParam": "Unexpected null parameter passed to method",
            "netConnectionTimeout": "Timed-out trying to establish a NetConnection",
            "f4mBitrateMissing": "Bitrate missing from Media tag",
            "netConnectionRejected": "Connection attempt rejected by FMS server",
            "loaderCantHandleResource": "LoaderBase unable to handle the given MediaResourceBase",
            "alreadyLoading": "Loader - attempt to load a loading object",
            "f4mProfileMissing": "Profile missing from Bootstrap info tag",
            "asyncError": "Async error when loading media",
            "pauseNotSupported": "PlayTrait.pause cannot be invoked when canPause is false",
            "alreadyUnloading": "Loader - attempt to unload a unloading object",
            "soundPlayFailed": "Playback failed due to no sound channels being available",
            "securityError": "Security error when loading media",
            "alreadyReady": "Loader - attempt to load an already loaded object",
            "invalidParam": "Invalid parameter passed to method",
            "missingStringResource": "No string for resource {0}",
            "directDisplayListModError": "The direct addition or removal of display objects onto a MediaContainer is prohibited.",
            "traitResolverAlreadyAdded": "A trait resolver for the specified trait type has already been added to this MediaElement",
            "nullScriptPath": "Operation requires a valid script path",
            "alreadyUnloaded": "Loader - attempt to unload an already unloaded object",
            "f4mMediaURLMissing": "URL missing from Media tag",
            "dvrMaximumRPCAttempts": "Maximum DVRGetStreamInfo RPC attempts (%i) reached",
            "netStreamStreamNotFound": "Stream not found",
            "pluginImplementationInvalid": "Plugin failed to load due to improper or missing implementation of PluginInfo",
            "dvrCastContentOffline": "DVRCast content is offline and unavailable",
            "ioError": "I/O error when loading media",
            "traitInstanceAlreadyAdded": "An instance of this trait class has already been added to this MediaElement",
            "drmSystemUpdateError": "The update of the DRM subsystem failed",
            "mustSetLoader": "Must set LoaderBase on a LoadTrait before calling load or unload",
            "urlSchemeInvalid": "Invalid URL scheme",
            "netStreamPlayFailed": "Playback failed",
            "netStreamNoSupportedTrackFound": "No supported track found",
            "functionMustBeOverridden": "Function must be overridden",
            "unsupportedMediaElementType": "The specified media element type is not supported",
            "dvrUnexpectedServerResponse": "Unexpected server response: ",
            "invalidLayoutRendererConstructor": "Unable to construct LayoutRenderer implementation",
            "netConnectionFailed": "All NetConnection attempts failed",
            "dvrCastSubscribeFailed": "DVRCast subscribe failed",
            "dvrCastStreamInfoRetrievalFailed": "Unable to retrieve DVRCast stream info",
            "alreadyAdded": "Child has already been added",
            "illegalConstructorInvocation": "Use the static getInstance method to obtain a class instance",
            "compositeTraitNotFound": "There is no composite trait for the given trait type",
            "argumentError": "Argument error when loading media",
            "pluginVersionInvalid": "Plugin failed to load due to version mismatch",
            "streamSwitchInvalidIndex": "Dynamic Stream Switching - Invalid index requested"
        };
    }
}
}
