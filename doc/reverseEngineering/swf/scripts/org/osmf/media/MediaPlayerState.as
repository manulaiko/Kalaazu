package org.osmf.media {

public final class MediaPlayerState {

    public static const UNINITIALIZED: String = "uninitialized";

    public static const LOADING: String = "loading";

    public static const READY: String = "ready";

    public static const PLAYING: String = "playing";

    public static const PAUSED: String = "paused";

    public static const BUFFERING: String = "buffering";

    public static const PLAYBACK_ERROR: String = "playbackError";


    public function MediaPlayerState() {
        super();
    }
}
}
