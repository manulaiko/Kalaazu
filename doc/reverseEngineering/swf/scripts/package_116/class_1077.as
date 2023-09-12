package package_116 {

import package_22.class_168;

public class class_1077 extends class_168 {


    private var _level: int;

    private var _assetId: String;

    public function class_1077(param1: int, param2: String, param3: int, param4: String) {
        super(param1, param2);
        this._level = param3;
        this._assetId = param4;
    }

    public function get level(): int {
        return this._level;
    }

    public function get name_115(): String {
        return this._assetId;
    }
}
}
