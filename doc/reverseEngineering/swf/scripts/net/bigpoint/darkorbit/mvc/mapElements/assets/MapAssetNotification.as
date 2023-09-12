package net.bigpoint.darkorbit.mvc.mapElements.assets {

public class MapAssetNotification {

    public static const NAME: String = "MapAssetNotification";

    public static const MAP_ASSET_UPDATE_HP: String = NAME + "MapAssetUpdateHP";

    public static const MAP_ASSET_UPDATE_SHIELD: String = NAME + "MapAssetUpdateShield";

    public static const LOAD_GRAPHICS_FOR_MAPASSET: String = NAME + "LoadGraphicsForMapAssets";

    public static const RETRY_LOAD: String = NAME + "RetryLoad";

    public static const ATTACK_MAP_ASSET: String = NAME + "AttackMapAsset";

    public static const DESELECT_TARGET: String = NAME + "DeselectTarget";

    public static const CLEANUP: String = NAME + "Cleanup";

    public static const TRY_TO_SELECT_MAPASSET: String = NAME + "TRY_TO_SELECT_MAPASSET";

    public static const LOAD_MAPASSET_VIEW: String = "LOAD_MAPASSET_VIEW";

    public static const ABORT_LASER_ATTACK: String = "ABORT_LASER_ATTACK";


    public function MapAssetNotification() {
        super();
    }
}
}
