package package_199 {

import flash.events.Event;

import package_293.class_1751;

public class class_2123 extends Event {

    public static const const_269: String = "assetComplete";

    public static const const_2878: String = "entityComplete";

    public static const const_289: String = "skyboxComplete";

    public static const const_540: String = "cameraComplete";

    public static const const_1065: String = "meshComplete";

    public static const const_2111: String = "geometryComplete";

    public static const const_102: String = "skeletonComplete";

    public static const const_736: String = "skeletonPoseComplete";

    public static const const_2364: String = "containerComplete";

    public static const const_255: String = "textureComplete";

    public static const const_1988: String = "textureProjectorComplete";

    public static const const_814: String = "materialComplete";

    public static const const_66: String = "animatorComplete";

    public static const const_363: String = "animationSetComplete";

    public static const const_3299: String = "animationStateComplete";

    public static const const_2373: String = "animationNodeComplete";

    public static const const_54: String = "stateTransitionComplete";

    public static const const_232: String = "segmentSetComplete";

    public static const const_2739: String = "lightComplete";

    public static const const_908: String = "lightPickerComplete";

    public static const const_403: String = "effectMethodComplete";

    public static const const_1486: String = "shadowMapMethodComplete";

    public static const const_2616: String = "assetRename";

    public static const const_147: String = "assetConflictResolved";

    public static const const_963: String = "textureSizeError";


    private var var_1394: class_1751;

    private var var_244: String;

    public function class_2123(param1: String, param2: class_1751 = null, param3: String = null) {
        super(param1);
        this.var_1394 = param2;
        this.var_244 = param3 || (!!this.var_1394 ? this.var_1394.name : null);
    }

    public function get asset(): class_1751 {
        return this.var_1394;
    }

    public function get method_6012(): String {
        return this.var_244;
    }

    override public function clone(): Event {
        return new class_2123(type, this.asset, this.method_6012);
    }
}
}
