package package_266 {

import flash.display.BitmapData;

import package_19.class_1199;

public class class_1713 {


    private var _texture: Object;

    private var _atlas: class_1937;

    private var _ready: class_1199;

    private var var_3722: class_1199;

    private var var_2335: String;

    public function class_1713(param1: String = "texture") {
        super();
        this.var_2335 = param1;
        this._ready = new class_1199();
        this.var_3722 = new class_1199(class_1713);
    }

    public function get texture(): Object {
        return this._texture;
    }

    public function get atlas(): class_1937 {
        return this._atlas;
    }

    public function get ready(): class_1199 {
        return this._ready;
    }

    function dispose(): void {
        if (this._texture is BitmapData) {
            (this._texture as BitmapData).dispose();
        }
        this._texture = null;
        this._atlas = null;
    }

    function setTexture(param1: *): void {
        this._texture = param1;
        this.method_1259();
    }

    function method_2501(param1: class_1937): void {
        this._atlas = param1;
        this.method_1259();
    }

    private function method_1259(): void {
        if (Boolean(this._texture) && Boolean(this._atlas)) {
            this._ready.dispatch();
            this.var_3722.dispatch(this);
        }
    }

    public function get method_2457(): String {
        return this.var_2335;
    }

    public function get method_4659(): class_1199 {
        return this.var_3722;
    }
}
}
