package package_65 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;

public class class_1571 extends MovieClip implements class_1568 {

    public static const const_2746: int = 1;

    public static const const_1744: int = 2;

    public static const const_1713: int = 3;


    protected var var_3736: DisplayObject;

    protected var var_3953: DisplayObject;

    protected var var_2326: DisplayObject;

    protected var _currentState: int = 0;

    protected var var_551: DisplayObject;

    private var _id: int;

    private var _type: int;

    public function class_1571() {
        this.var_551 = new Bitmap();
        super();
    }

    public function init(param1: BitmapData, param2: BitmapData, param3: BitmapData): void {
        mouseChildren = false;
        this.var_3736 = new Bitmap(param1);
        this.var_3953 = new Bitmap(param2);
        this.var_2326 = new Bitmap(param3);
        addChild(this.var_3736);
        addChild(this.var_3953);
        addChild(this.var_2326);
        this.var_3736.visible = this.var_3953.visible = this.var_2326.visible = false;
        this.var_3736.y = this.var_3953.y = this.var_2326.y = 4;
    }

    public function set state(param1: int): void {
        if (this._currentState == param1) {
            return;
        }
        this._currentState = param1;
        this.var_551.visible = false;
        switch (param1) {
            case const_2746:
                this.var_551 = this.var_3736;
                break;
            case const_1744:
                this.var_551 = this.var_3953;
                break;
            case const_1713:
                this.var_551 = this.var_2326;
        }
        this.var_551.visible = true;
    }

    public function get state(): int {
        return this._currentState;
    }

    public function get id(): int {
        return this._id;
    }

    public function get type(): int {
        return this._type;
    }

    public function set id(param1: int): void {
        this._id = param1;
    }

    public function set type(param1: int): void {
        this._type = param1;
    }

    public function set selected(param1: Boolean): void {
    }

    public function set number(param1: int): void {
    }
}
}
