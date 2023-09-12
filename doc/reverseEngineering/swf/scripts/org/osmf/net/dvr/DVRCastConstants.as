package org.osmf.net.dvr {

public class DVRCastConstants {

    public static const RPC_GET_STREAM_INFO: String = "DVRGetStreamInfo";

    public static const RPC_SUBSCRIBE: String = "DVRSubscribe";

    public static const RPC_UNSUBSCRIBE: String = "DVRUnsubscribe";

    public static const RESULT_GET_STREAM_INFO_SUCCESS: String = "NetStream.DVRStreamInfo.Success";

    public static const RESULT_GET_STREAM_INFO_RETRY: String = "NetStream.DVRStreamInfo.Retry";

    public static const STREAM_INFO_KEY: String = "http://www.osmf.org/dvrCast/1.0/streamInfo";

    public static const RECORDING_INFO_KEY: String = "http://www.osmf.org/dvrCast/1.0/recordingInfo";

    public static const STREAM_INFO_UPDATE_DELAY: Number = 3000;

    public static const LOCAL_DURATION_UPDATE_INTERVAL: Number = 500;

    public static const LIVE_POSITION_SEEK_DELAY: Number = 1.5;


    public function DVRCastConstants() {
        super();
    }
}
}
