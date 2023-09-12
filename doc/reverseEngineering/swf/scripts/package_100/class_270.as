package package_100 {

import flash.display.DisplayObject;

import package_29.class_267;

public class class_270 extends class_267 {


    protected var _icon: DisplayObject;

    protected var _scale: Number = 0;

    protected var var_3334: int;

    protected var var_3540: int;

    private var var_4273: Boolean = false;

    private var var_2039: Boolean;

    private var _layer: int = 0;

    public function class_270(param1: DisplayObject, param2: Boolean, param3: Boolean, param4: int = 0) {
        super();
        this._icon = param1;
        this.var_2039 = param2;
        this.var_4273 = param3;
        this._layer = param4;
    }

    public function method_248(param1: Number, param2: int, param3: int): DisplayObject {
        this.var_3540 = param3;
        this.var_3334 = param2;
        this._scale = param1;
        this.update();
        return this._icon;
    }

    override public function method_6037(): void {
        super.method_6037();
        owner.position.changed.add(this.update);
        this.update();
    }

    override public function method_2753(): void {
        owner.position.changed.remove(this.update);
        super.method_2753();
    }

    public function get layer(): int {
        return this._layer;
    }

    protected function update(): void {
        if (this.var_2039) {
            this._icon.x = Number(owner.position.x) * Number(this._scale);
            this._icon.y = Number(owner.position.y) * Number(this._scale);
        }
        if (this.var_4273) {
            this._icon.x -= Number(this._icon.width) / 2;
            this._icon.y -= Number(this._icon.height) / 2;
        }
    }
}
}
