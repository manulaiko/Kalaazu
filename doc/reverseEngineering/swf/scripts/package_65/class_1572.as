package package_65 {

import flash.display.BitmapData;
import flash.display.MovieClip;

public class class_1572 extends MovieClip implements class_1568 {


    private var var_919: class_1571;

    private var var_4331: class_1571;

    private var var_3752: class_1571;

    private var _selected: Boolean;

    private var _state: int = 0;

    private var _type: int;

    private var _id: int;

    public function class_1572() {
        super();
    }

    public function init(param1: BitmapData, param2: BitmapData, param3: BitmapData): void {
        this.var_919 = new class_1571();
        this.var_919.init(param1, param2, param3);
        this.var_4331 = new class_1571();
        this.var_4331.init(param1, param2, param3);
        this.var_3752 = this.var_919;
        addChild(this.var_3752);
    }

    public function method_3332(param1: BitmapData, param2: BitmapData, param3: BitmapData): void {
        if (contains(this.var_4331)) {
            removeChild(this.var_4331);
        }
        this.var_4331 = new class_1571();
        this.var_4331.init(param1, param2, param3);
        this.var_4331.state = this._state;
        if (this._selected) {
            this.var_3752 = this.var_4331;
            addChild(this.var_4331);
        }
    }

    public function set selected(param1: Boolean): void {
        if (param1 != this._selected) {
            removeChild(this.var_3752);
            this._selected = param1;
            if (this._selected) {
                this.var_3752 = this.var_4331;
            } else {
                this.var_3752 = this.var_919;
            }
            addChild(this.var_3752);
        }
    }

    public function get selected(): Boolean {
        return this._selected;
    }

    public function set state(param1: int): void {
        this._state = param1;
        this.var_919.state = param1;
        this.var_4331.state = param1;
    }

    public function get id(): int {
        return this._id;
    }

    public function get type(): int {
        return this._type;
    }

    public function set id(param1: int): void {
        this._id = param1;
        this.var_919.id = param1;
        this.var_4331.id = param1;
    }

    public function set type(param1: int): void {
        this._type = param1;
        this.var_919.type = param1;
        this.var_4331.type = param1;
    }

    public function set number(param1: int): void {
    }
}
}
