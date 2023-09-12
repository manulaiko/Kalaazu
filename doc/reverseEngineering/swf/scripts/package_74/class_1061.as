package package_74 {

import flash.display.Bitmap;
import flash.display.Sprite;

public class class_1061 extends Sprite {


    private var _id: int;

    public var price: int;

    public var var_1161: String;

    private var var_4323: Sprite;

    private var var_3086: class_1062;

    public function class_1061(param1: int, param2: Bitmap) {
        super();
        this._id = param1;
        addChild(param2);
    }

    public function setPosition(param1: int, param2: int): void {
        this.x = param1;
        this.y = param2;
    }

    public function method_4940(param1: class_1062): void {
        addChild(this.var_3086 = param1);
    }

    public function method_356(param1: Sprite): void {
        addChild(this.var_4323 = param1);
    }

    public function method_1779(): void {
        if (Boolean(this.var_4323) && Boolean(contains(this.var_4323))) {
            removeChild(this.var_4323);
        }
        this.var_4323 = null;
    }

    public function method_382(): void {
        if (Boolean(this.var_3086) && Boolean(contains(this.var_3086))) {
            removeChild(this.var_3086);
        }
        this.var_3086 = null;
    }

    public function get id(): int {
        return this._id;
    }

    public function get method_3843(): Sprite {
        return this.var_4323;
    }

    public function get method_6323(): class_1062 {
        return this.var_3086;
    }
}
}
