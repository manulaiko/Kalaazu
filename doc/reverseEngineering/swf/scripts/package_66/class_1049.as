package package_66 {

import flash.display.Bitmap;
import flash.display.MovieClip;

public class class_1049 extends MovieClip {


    private var _id: int;

    private var var_444: Bitmap;

    private var var_1013: String;

    public function class_1049(param1: int, param2: Bitmap, param3: String) {
        super();
        this._id = param1;
        this.var_444 = param2;
        this.var_1013 = param3;
        this.addChild(param2);
        this.mouseChildren = false;
        this.mouseEnabled = false;
    }

    public function get id(): int {
        return this._id;
    }

    public function get tooltipKey(): String {
        return this.var_1013;
    }
}
}
