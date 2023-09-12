package package_173 {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_81;

import package_11.class_39;

import package_115.class_316;

import package_22.class_198;

import package_26.class_94;

import package_9.ResourceManager;

public class class_1058 extends Sprite {

    private static const const_708: int = -8;

    private static const WIDTH: int = 85;

    private static const HEIGHT: int = 75;


    private var background: MovieClip;

    private var textField: TextField;

    public var var_191: String;

    public var var_1611: int;

    private var _selected: Boolean = false;

    private var var_2095: int = 1;

    private var var_466: int = 2;

    private var var_3306: int = 3;

    private var var_2756: int = 4;

    private var var_567: DisplayObject;

    public var var_1804: int;

    public var var_1694: int;

    private var var_2043: String;

    private var var_3441: String;

    private var var_1119: int;

    public function class_1058(param1: String, param2: int, param3: int, param4: int, param5: String, param6: int = 0, param7: String = "") {
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        super();
        this.background = ResourceManager.getMovieClip("window", "warp_win_ship_selector");
        this.background.gotoAndStop(this.var_2095);
        var _loc8_: class_316;
        if (_loc8_ = class_198.var_2667[param1] as class_316) {
            _loc11_ = _loc8_.getResKey(class_81.factionID);
            if ((Boolean(_loc12_ = ResourceManager.name_15.getFinisher("replacementShips") as class_39)) && Boolean(_loc12_.hasEmbeddedObject(_loc11_))) {
                this.var_567 = this.method_1897(_loc12_, _loc11_);
                this.var_567.rotation = 90;
                if (this.var_567.width > WIDTH || this.var_567.height > HEIGHT) {
                    _loc13_ = Number(WIDTH) / Number(this.var_567.width);
                    _loc14_ = Number(HEIGHT) / Number(this.var_567.height);
                    _loc15_ = Math.min(_loc13_, _loc14_);
                    this.var_567.scaleX = this.var_567.scaleY = _loc15_;
                }
                this.addChild(this.background);
                this.background.addChild(this.var_567);
                this.var_567.getBounds(this.var_567);
                var _loc9_: Rectangle = this.var_567.getBounds(this.var_567);
                this.var_567.x = (Number(this.var_567.parent.width) - Number(this.var_567.width) - _loc9_.y * Number(this.var_567.scaleX)) * 0.5;
                this.var_567.y = (Number(this.var_567.parent.height) - Number(this.var_567.height) - _loc9_.x * Number(this.var_567.scaleY)) * 0.5;
                this.var_567.y += const_708;
                this.var_191 = param1;
                this.var_1611 = param2;
                this.var_1804 = param3;
                this.var_1694 = param4;
                this.var_2043 = param5;
                this.var_3441 = param7;
                this.var_1119 = param6;
                this.textField = new TextField();
                this.textField.defaultTextFormat = class_18.const_1287;
                this.textField.embedFonts = class_18.var_1210;
                this.textField.text = param5;
                this.textField.textColor = 16777215;
                this.textField.selectable = false;
                this.textField.mouseEnabled = false;
                this.textField.antiAliasType = AntiAliasType.ADVANCED;
                addChild(this.textField);
                var _loc10_: TextField;
                (_loc10_ = new TextField()).defaultTextFormat = class_18.const_1287;
                _loc10_.embedFonts = class_18.var_1210;
                _loc10_.text = String(param6);
                _loc10_.textColor = 16777215;
                _loc10_.selectable = false;
                _loc10_.mouseEnabled = false;
                addChild(_loc10_);
                _loc10_.autoSize = TextFieldAutoSize.LEFT;
                _loc10_.x = 15 - 0.5 * _loc10_.width;
                _loc10_.y = 7;
                _loc10_.antiAliasType = AntiAliasType.ADVANCED;
                class_94.getInstance().method_1211(this, param7);
                this.textField.y = 86;
                this.textField.height = 20;
                this.addListeners();
                return;
            }
            return;
        }
    }

    private function method_1897(param1: class_39, param2: String): DisplayObject {
        var _loc4_: * = null;
        var _loc3_: DisplayObjectContainer = param1.method_2545(param2) as DisplayObjectContainer;
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_.numChildren) {
            if ((_loc4_ = _loc3_.getChildAt(_loc5_)) != null && (_loc4_.name.search("engine") != -1 || _loc4_.name.search("laser") != -1)) {
                _loc4_.visible = false;
            }
            _loc5_++;
        }
        return _loc3_;
    }

    private function method_4049(param1: MouseEvent): void {
        this.background.gotoAndStop(this.var_466);
    }

    private function method_1747(param1: MouseEvent): void {
        if (this._selected) {
            this.background.gotoAndStop(this.var_3306);
        } else {
            this.background.gotoAndStop(this.var_2095);
        }
    }

    public function method_112(): void {
        this.background.gotoAndStop(this.var_2756);
        this.method_25();
    }

    public function get selected(): Boolean {
        return this._selected;
    }

    public function set selected(param1: Boolean): void {
        this._selected = param1;
        if (this._selected) {
            this.background.gotoAndStop(this.var_3306);
            this.method_25();
        } else {
            this.background.gotoAndStop(this.var_2095);
            this.addListeners();
        }
    }

    private function addListeners(): void {
        addEventListener(MouseEvent.ROLL_OVER, this.method_4049);
        addEventListener(MouseEvent.ROLL_OUT, this.method_1747);
    }

    private function method_25(): void {
        removeEventListener(MouseEvent.ROLL_OVER, this.method_4049);
        removeEventListener(MouseEvent.ROLL_OUT, this.method_1747);
    }
}
}
