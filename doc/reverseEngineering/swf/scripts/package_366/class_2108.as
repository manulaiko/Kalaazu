package package_366 {

import away3d.arcane;

import flash.events.TimerEvent;
import flash.net.URLRequest;
import flash.utils.ByteArray;

import package_293.class_1751;

import package_437.class_2420;

public class class_2108 extends class_2105 {


    private var var_3337: Object;

    protected var var_3163: class_2108;

    protected var _children: Vector.<class_2108>;

    private var var_4038: Boolean;

    protected var var_117: Boolean;

    private var var_735: int;

    public function class_2108() {
        this.var_3337 = {};
        super(class_2419.const_65);
        this.var_3163 = this;
    }

    public function get method_1735(): Boolean {
        return this.var_4038;
    }

    public function set method_1735(param1: Boolean): void {
        this.var_4038 = param1;
    }

    public function method_4558(param1: class_2108): void {
        this._children = this._children || new Vector.<class_2108>();
        if (this._children.indexOf(param1) != -1) {
            throw new Error("Duplicated add");
        }
        this._children.push(param1);
        param1.root = this.var_3163;
    }

    override public function method_5169(param1: *, param2: Number = 15): void {
        if (param1 is String || param1 is ByteArray) {
            param1 = JSON.parse(param1);
        }
        this.var_735 = 0;
        this.var_117 = true;
        if (this.var_3163 == this) {
            super.method_5169(param1, param2);
            this.method_2477();
        } else {
            _data = param1;
        }
    }

    override protected function method_2477(param1: TimerEvent = null): void {
        super.method_2477(param1);
    }

    override protected function method_196(): Boolean {
        this.var_117 = false;
        if (this.var_3163.method_728.length) {
            this.method_1516();
            return const_2971;
        }
        if (!this._children) {
            return const_2361;
        }
        while (this.var_735 < this._children.length) {
            if (this._children[this.var_735].method_196() != const_2361) {
                return const_2971;
            }
            ++this.var_735;
        }
        return const_2361;
    }

    override protected function method_597(param1: String, param2: URLRequest, param3: Boolean = false, param4: * = null, param5: Boolean = false): void {
        this.var_3163.method_728.push(new class_2420(param1, param2, param4, this, param3, param5));
    }

    override protected function method_3342(param1: class_1751, param2: String = null): void {
        if (this.var_3163 == this) {
            super.method_3342(param1, param2);
        } else {
            this.var_3163.method_3342(param1, param2);
        }
    }

    override protected function method_2812(): Boolean {
        return this.var_3163 == this ? super.method_2812() : Boolean(this.var_3163.method_2812());
    }

    override public function set parsingFailure(param1: Boolean): void {
        this.var_3163.parsingFailure = param1;
        if (this.var_3163 == this) {
            super.parsingFailure = param1;
        } else {
            this.var_3163.parsingFailure = param1;
        }
    }

    override public function get parsingFailure(): Boolean {
        return this.var_3163 == this ? super.parsingFailure : Boolean(this.var_3163.parsingFailure);
    }

    override protected function method_1318(): void {
        if (this.var_3163 == this) {
            super.method_1318();
        }
    }

    override protected function method_444(param1: String = "Unknown parsing error"): void {
        if (this.var_3163 == this) {
            super.method_444(param1);
        } else {
            this.var_3163.method_444(param1);
        }
    }

    override protected function method_1516(): void {
        if (this.var_3163 == this) {
            super.method_1516();
        }
    }

    override public function get method_3984(): Boolean {
        return this.var_3163 == this ? super.method_3984 : Boolean(this.var_3163.method_3984);
    }

    public function get root(): class_2108 {
        return this.var_3163;
    }

    public function set root(param1: class_2108): void {
        var _loc2_: * = null;
        this.var_3163 = param1;
        if (this._children) {
            for each(_loc2_ in this._children) {
                _loc2_.root = param1;
            }
        }
    }

    arcane function addAssets(param1: String, param2: Vector.<class_1751>): void {
        this.var_3337[param1] = param2;
    }

    arcane function method_780(param1: String): Vector.<class_1751> {
        return this.var_3337[param1] as Vector.<class_1751>;
    }
}
}
