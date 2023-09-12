package package_342 {

import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_9;

import package_343.class_1916;

import package_402.Stats;

public class class_1915 extends Sprite {


    private var _text: TextField;

    private var var_1263: Stats;

    public function class_1915() {
        super();
        this.mouseChildren = false;
        this.mouseEnabled = false;
    }

    public function init(): void {
        var _loc1_: TextFormat = new TextFormat();
        _loc1_.font = "Verdana";
        _loc1_.size = 9;
        this._text = new TextField();
        this._text.defaultTextFormat = _loc1_;
        this._text.autoSize = TextFieldAutoSize.LEFT;
        this._text.textColor = 16777215;
        this._text.background = true;
        this._text.backgroundColor = 6710886;
        this._text.antiAliasType = AntiAliasType.ADVANCED;
        this._text.selectable = false;
    }

    public function update(param1: class_1916): void {
        var _loc2_: * = param1.var_3188.toFixed(2) + "MB";
        var _loc3_: * = "";
        if (param1.var_4264 != "") {
            _loc3_ = param1.var_4264 + " ";
        }
        _loc3_ += "FPS: " + param1.currentFPS + " | MEM: " + _loc2_;
        this._text.text = "vundefined | " + _loc3_;
    }

    public function show(): void {
        visible = true;
        if (!this.contains(this._text)) {
            this.addChild(this._text);
        }
    }

    public function hide(): void {
        visible = false;
        if (this.contains(this._text)) {
            this.removeChild(this._text);
        }
    }
}
}
