package package_133 {

import package_132.class_382;

import package_38.class_439;

public class class_1852 implements class_382 {

    public static const const_1492: String = "springFightMoodAssetsDefinition";

    public static const const_2797: String = "breachMoodAssetsDefinition";

    public static const const_1687: String = "plagueMoodAssetsDefinition";

    private static const const_811: String = "springFightWinnerAssetsDefinitionMMO";

    private static const const_913: String = "springFightWinnerAssetsDefinitionEIC";

    private static const const_116: String = "springFightWinnerAssetsDefinitionVRU";


    private var _type: uint;

    private var _active: Boolean;

    private var var_2324: String;

    public function class_1852(param1: uint, param2: Boolean, param3: String) {
        super();
        this.var_2324 = param3;
        this._active = param2;
        this._type = param1;
    }

    public static function method_4007(param1: class_439): String {
        switch (param1.faction) {
            case class_439.MMO:
                return const_811;
            case class_439.EIC:
                return const_913;
            case class_439.VRU:
        }
        return const_116;
    }

    public function get id(): int {
        return this._type;
    }

    public function get isActive(): Boolean {
        return this._active;
    }

    public function get method_5705(): String {
        return this.var_2324;
    }
}
}
