package org.osmf.net {

public final class NetStreamCodes {

    public static const NETSTREAM_BUFFER_EMPTY: String = "NetStream.Buffer.Empty";

    public static const NETSTREAM_BUFFER_FULL: String = "NetStream.Buffer.Full";

    public static const NETSTREAM_BUFFER_FLUSH: String = "NetStream.Buffer.Flush";

    public static const NETSTREAM_FAILED: String = "NetStream.Failed";

    public static const NETSTREAM_PLAY_START: String = "NetStream.Play.Start";

    public static const NETSTREAM_PLAY_STOP: String = "NetStream.Play.Stop";

    public static const NETSTREAM_PLAY_FAILED: String = "NetStream.Play.Failed";

    public static const NETSTREAM_PLAY_STREAMNOTFOUND: String = "NetStream.Play.StreamNotFound";

    public static const NETSTREAM_PLAY_RESET: String = "NetStream.Play.Reset";

    public static const NETSTREAM_PLAY_INSUFFICIENTBW: String = "NetStream.Play.InsufficientBW";

    public static const NETSTREAM_PLAY_FILESTRUCTUREINVALID: String = "NetStream.Play.FileStructureInvalid";

    public static const NETSTREAM_PLAY_NOSUPPORTEDTRACKFOUND: String = "NetStream.Play.NoSupportedTrackFound";

    public static const NETSTREAM_PLAY_TRANSITION: String = "NetStream.Play.Transition";

    public static const NETSTREAM_PAUSE_NOTIFY: String = "NetStream.Pause.Notify";

    public static const NETSTREAM_PLAY_PUBLISH_NOTIFY: String = "NetStream.Play.PublishNotify";

    public static const NETSTREAM_PLAY_UNPUBLISH_NOTIFY: String = "NetStream.Play.UnpublishNotify";

    public static const NETSTREAM_UNPAUSE_NOTIFY: String = "NetStream.Unpause.Notify";

    public static const NETSTREAM_SEEK_FAILED: String = "NetStream.Seek.Failed";

    public static const NETSTREAM_SEEK_INVALIDTIME: String = "NetStream.Seek.InvalidTime";

    public static const NETSTREAM_SEEK_NOTIFY: String = "NetStream.Seek.Notify";

    public static const NETSTREAM_PLAY_COMPLETE: String = "NetStream.Play.Complete";

    public static const NETSTREAM_PLAY_TRANSITION_COMPLETE: String = "NetStream.Play.TransitionComplete";

    public static const ON_META_DATA: String = "onMetaData";

    public static const ON_CUE_POINT: String = "onCuePoint";

    public static const ON_PLAY_STATUS: String = "onPlayStatus";

    public static const NETSTREAM_DRM_UPDATE: String = "DRM.UpdateNeeded";


    public function NetStreamCodes() {
        super();
    }
}
}
