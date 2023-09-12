package package_103 {

import com.greensock.TweenLite;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

import package_104.class_278;

import package_141.class_969;

import package_142.class_970;

import package_27.class_82;

public class class_2009 extends class_969 {

    private static const const_95: String = "moveRight";

    private static const const_2039: String = "moveLeft";

    public static const const_543: String = "layoutChangeComplete";


    public var rightArrow: class_970;

    public var leftArrow: class_970;

    public var listMask: Sprite;

    public var listContainer: Sprite;

    private var _itemSize: int = 0;

    private var var_2512: int = 0;

    private var _items: Array;

    private var var_2730: int;

    private var _layout: class_273;

    public function class_2009(param1: DisplayObjectContainer) {
        super(param1);
        this.rightArrow.addEventListener(MouseEvent.CLICK, this.method_2604);
        this.leftArrow.addEventListener(MouseEvent.CLICK, this.method_2604);
        this.rightArrow.enable = false;
        this.leftArrow.enable = false;
        this.method_4385();
        visible = false;
    }

    override public function decorate(): void {
        method_4210(this.rightArrow = new class_970(method_4492("rightArrow")));
        method_4210(this.leftArrow = new class_970(method_4492("leftArrow")));
        method_4210(this.listMask = method_4492("listMask"));
        method_4210(this.listContainer = method_4492("listContainer"));
    }

    public function showItems(param1: Array, param2: int, param3: int, param4: class_273 = null, param5: Boolean = true): void {
        this._items = param1;
        this.var_2730 = param2;
        this._itemSize = param3;
        this._layout = param4 || this._layout || new class_278();
        this.var_2512 = 0;
        this.listContainer.x = 0;
        this.method_4587(this._layout, true);
        this.method_4385();
        visible = true;
        if (param5) {
            this.listContainer.mask = this.listMask;
        } else {
            this.listMask.visible = false;
        }
        this.leftArrow.visible = this.rightArrow.visible = param5;
    }

    public function method_4587(param1: class_273, param2: Boolean = false, param3: Boolean = false, param4: int = -1): void {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = false;
        var _loc9_: * = null;
        if (param2) {
            clear(this.listContainer);
        }
        if (this._items) {
            _loc5_ = 0;
            while (_loc5_ != this._items.length) {
                _loc6_ = this._items[_loc5_] as DisplayObject;
                _loc7_ = param1.method_1821(this._itemSize, _loc5_);
                _loc8_ = param4 != -1;
                _loc9_ = _loc5_ == this._items.length - 1 && param3 ? this.method_5636 : null;
                TweenLite.to(_loc6_, param3 ? 0.4 : 0, {
                    "delay": (param3 ? 0.05 * _loc5_ : 0),
                    "x": _loc7_.x,
                    "y": _loc7_.y,
                    "onStart": (_loc8_ ? this.method_4248 : null),
                    "onStartParams": [param4],
                    "onComplete": _loc9_
                });
                if (param2) {
                    this.listContainer.addChild(_loc6_);
                }
                _loc5_++;
            }
        }
        this._layout = param1;
    }

    private function method_5636(): void {
        dispatchEvent(new Event(const_543, true));
    }

    private function method_4248(param1: int): void {
        class_82.playSoundEffect(param1);
    }

    private function method_2604(param1: MouseEvent): void {
        if (param1.target == this.rightArrow) {
            if (this.method_5259) {
                --this.var_2512;
                TweenLite.to(this.listContainer, 0.5, {"x": Number(this.var_2512) * Number(this._itemSize)});
                dispatchEvent(new Event(const_95));
            }
        } else if (this.method_4710) {
            ++this.var_2512;
            TweenLite.to(this.listContainer, 0.5, {"x": Number(this.var_2512) * Number(this._itemSize)});
            dispatchEvent(new Event(const_2039));
        }
        this.method_4385();
    }

    public function method_4385(): void {
        this.rightArrow.enable = this.method_5259;
        this.leftArrow.enable = this.method_4710;
    }

    private function get method_5259(): Boolean {
        if (this._items) {
            return Number(this._items.length) - Number(this.var_2512) > this.var_2730 && this._items.length + this.var_2512 > this.var_2730;
        }
        return false;
    }

    private function get method_4710(): Boolean {
        return this.var_2512 < 0;
    }

    public function get index(): int {
        return this.var_2512;
    }

    public function method_4381(param1: DisplayObject): int {
        if (this._items.indexOf(param1) >= 0) {
            return Number(this.var_2512) % 4 + this._items.indexOf(param1) + 1;
        }
        return 0;
    }

    public function get method_5782(): int {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        if (this._layout.id == class_278.ID) {
            _loc2_ = Number(this._items.length) * Number(this._itemSize);
            _loc3_ = !!this.rightArrow.visible ? Number(this.leftArrow.width) : 0;
            if (this.listMask.visible) {
                return Math.min(this.listMask.width, _loc2_) + _loc3_;
            }
            _loc1_ = _loc2_ + _loc3_;
        } else {
            _loc1_ = Number(this.listContainer.width);
        }
        return _loc1_;
    }

    public function get method_505(): int {
        var _loc1_: Number = Number(this._items.length) * Number(this._itemSize);
        var _loc2_: Number = !!this.rightArrow.visible ? Number(this.leftArrow.width) : 0;
        if (this.listMask.visible) {
            return Math.min(this.listMask.width, _loc1_) + _loc2_;
        }
        return _loc1_ + _loc2_;
    }

    public function get items(): Array {
        return this._items;
    }

    public function get layout(): class_273 {
        return this._layout;
    }
}
}
