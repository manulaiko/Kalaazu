package net.bigpoint.darkorbit.mvc.common {

public class AssetNotifications {

    public static const NAME: String = "AssetNotification";

    public static const LOAD_ASSET: String = NAME + "LoadAsset";

    public static const IMAGE_LOADED: String = NAME + "ImageLoaded";

    public static const SWFFINISHER_LOADED: String = NAME + "SWFFinisherLoaded";

    public static const UNLOAD_FINISHER_PROXY_READY: String = NAME + "UNLOAD_FINISHER_PROXY_READY";

    public static const ADD_UNLOAD_FINISHER: String = NAME + "ADD_UNLOAD_FINISHER";

    public static const CLEAR_COLLECTION: String = NAME + "CLEAR_COLLECTION";

    public static const LAZY_LOAD_ASSET: String = NAME + "LazyLoadAsset";

    public static const LOAD_EXTERNAL: String = NAME + "LOAD_EXTERNAL";

    public static const PRELOAD_LIST: String = NAME + "PRELOAD_LIST";

    public static const TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY: String = NAME + "PRELOAD_LIST_TYPE_PATTERN_KEY";


    public function AssetNotifications() {
        super();
    }
}
}
