package package_65 {

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.text.TextField;

public class class_1570 {


    private var var_1340: class_235;

    private var var_4464: class_1568;

    private var var_1452: MovieClip;

    private var var_2735: TextField;

    private var var_1136: DisplayObject;

    private var var_4315: MovieClip;

    private var var_1325: TextField;

    private var var_3892: Array;

    private var _type: int;

    private var _visible: Boolean;

    private var var_1433: Boolean;

    private var var_3429: Boolean;

    private var _completed: Boolean;

    public function class_1570(param1: int) {
        this.var_3892 = [];
        super();
        if (param1 == class_1567.const_1706) {
            this._type = class_1567.const_1706;
        } else {
            this._type = class_1567.const_2473;
        }
    }

    public function method_2273(param1: class_1570): void {
        this.var_3892.push(param1);
    }

    public function method_4941(param1: MovieClip, param2: class_1568, param3: MovieClip = null, param4: DisplayObject = null): void {
        this.var_1452 = param1;
        this.var_2735 = TextField(this.var_1452.getChildByName("txtLabel"));
        this.var_4464 = param2;
        this.var_4315 = param3;
        this.var_1136 = param4;
        if (this.var_4315 != null) {
            this.var_1325 = TextField(this.var_4315.getChildByName("txtLabel"));
            this.var_1325.x += 8;
        }
        this._visible = true;
        this.var_1433 = true;
    }

    public function set method_6482(param1: class_235): void {
        this.var_1340 = param1;
    }

    public function get method_5828(): class_1568 {
        return this.var_4464;
    }

    public function get method_2247(): MovieClip {
        return this.var_1452;
    }

    public function get method_46(): MovieClip {
        return this.var_4315;
    }

    public function get type(): int {
        return this._type;
    }

    public function get method_6482(): class_235 {
        return this.var_1340;
    }

    public function get method_455(): TextField {
        return this.var_2735;
    }

    public function get method_2557(): TextField {
        return this.var_1325;
    }

    public function get visible(): Boolean {
        return this._visible;
    }

    public function set visible(param1: Boolean): void {
        this._visible = param1;
        if (this.var_1452 != null) {
            this.var_1452.visible = this._visible;
        }
        if (this.var_4464 != null) {
            this.var_4464.visible = this._visible;
        }
        if (this.var_4315 != null) {
            this.var_4315.visible = this._visible;
        }
        if (this.var_1136 != null) {
            this.var_1136.visible = this._visible;
        }
    }

    public function get method_4785(): Boolean {
        return this.var_1433;
    }

    public function get runstate(): Boolean {
        return this.var_3429;
    }

    public function set runstate(param1: Boolean): void {
        if (this.var_3429 != param1) {
            this.var_3429 = param1;
        }
    }

    public function set method_4785(param1: Boolean): void {
        this.var_1433 = param1;
    }

    public function get completed(): Boolean {
        return this._completed;
    }

    public function set completed(param1: Boolean): void {
        this._completed = param1;
    }

    public function get method_3572(): DisplayObject {
        return this.var_1136;
    }

    public function updateLayout(): void {
        if (this.var_1136) {
            this.var_1136.x = Number(this.method_46.x) - Number(this.method_2557.width) - Number(this.var_1136.width) - 0;
            this.method_455.width = Number(this.var_1136.x) - Number(this.method_2247.x) - 0;
        } else {
            this.method_455.width = Number(this.method_46.x) - Number(this.method_2557.width) - Number(this.method_2247.x) - Number(this.method_455.x) - 0;
        }
    }
}
}
