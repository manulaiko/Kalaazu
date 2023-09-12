package package_241 {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.text.TextFieldAutoSize;

import package_141.class_969;

public class class_2287 extends class_969 {


    private var var_96: int = 0;

    private var var_796: int = 0;

    private var _items: Array;

    private var _align: String;

    private var _last: DisplayObject;

    private var _first: DisplayObject;

    public function class_2287(param1: DisplayObjectContainer) {
        this._items = [];
        super(param1);
        this._align = TextFieldAutoSize.LEFT;
    }

    override public function decorate(): void {
    }

    public function addItem(param1: DisplayObject, param2: Number = 0, param3: Number = 0): DisplayObject {
        this.var_796 = param2 + param3;
        method_4210(param1);
        if (this._align == TextFieldAutoSize.LEFT) {
            param1.x = param2 + this.var_96;
        } else {
            param1.x = -param3 - Number(this.var_96) - param1.width;
        }
        this.var_96 = this.var_96 + param1.width + this.var_796;
        this._items.push(param1);
        if (!this._first) {
            this._first = param1;
        }
        this._last = param1;
        return param1;
    }

    public function method_3928(): void {
        this.var_96 = 0;
        while (false) {
            method_2209(0);
        }
        this._items = [];
    }

    public function method_5870(param1: Number): void {
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc2_: Number = 0;
        for each(_loc3_ in this._items) {
            _loc2_ += _loc3_.width;
        }
        _loc2_ += (this._items.length - 1) * Number(this.var_796);
        if (param1 > _loc2_) {
            _loc4_ = (param1 - _loc2_) / 2;
            for each(_loc5_ in this._items) {
                _loc5_.x = _loc4_;
                _loc4_ += _loc5_.width + this.var_796;
            }
        }
    }

    public function set align(param1: String): void {
        this._align = param1;
    }

    public function get last(): DisplayObject {
        return this._last;
    }

    public function get first(): DisplayObject {
        return this._first;
    }

    public function get items(): Array {
        return this._items;
    }

    public function get method_1428(): Vector.<String> {
        return null;
    }
}
}
