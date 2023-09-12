package package_39 {

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.ColorTransform;
import flash.text.AntiAliasType;
import flash.text.TextField;

import net.bigpoint.darkorbit.class_18;

import package_76.class_1562;

import package_9.ResourceManager;

public class class_1053 extends Sprite {


    private var var_2253: int;

    private var var_392: int;

    private var var_3160: Boolean = false;

    public var var_2862: int;

    private var var_4074: BitmapData;

    private var var_4880: BitmapData;

    private var textField: TextField;

    private var var_1280: Function;

    private var name_91: Number;

    private var name_50: Number;

    private var var_2610: uint = 16777215;

    private var var_2051: uint = 12255232;

    public function class_1053(param1: Boolean = false) {
        super();
        if (param1) {
            this.var_4074 = ResourceManager.getBitmapData("ui", "lives_small_ship_icon");
            this.var_1280 = this.method_3549;
        } else {
            this.var_4074 = ResourceManager.getBitmapData("ui", "lives_remaining_icon");
            this.var_4880 = ResourceManager.getBitmapData("ui", "life_lost_icon");
            this.var_1280 = this.method_2056;
        }
        this.textField = new TextField();
    }

    public function method_4656(param1: int, param2: int): void {
        this.var_2253 = param1;
        this.var_392 = param2;
        this.graphics.clear();
        this.var_1280();
    }

    private function method_3549(): void {
        var _loc1_: Number = NaN;
        var _loc2_: * = null;
        if (Number(this.var_2253) * Number(this.var_4074.width) < this.var_2862) {
            if (this.contains(this.textField)) {
                this.removeChild(this.textField);
            }
            this.graphics.beginBitmapFill(this.var_4074);
            this.graphics.drawRect(0, 0, Number(this.var_4074.width) * Number(this.var_2253), this.var_4074.height);
            this.graphics.endFill();
            _loc1_ = Number(this.name_91) / Number(this.name_50);
            _loc2_ = new ColorTransform();
            _loc2_.color = class_1562.interpolate(this.var_2610, this.var_2051, _loc1_);
            this.transform.colorTransform = _loc2_;
        } else {
            this.method_1050();
        }
    }

    private function method_2056(): void {
        var _loc1_: int = 0;
        if (Number(this.var_2253) * Number(this.var_4074.width) < this.var_2862) {
            if (this.contains(this.textField)) {
                this.removeChild(this.textField);
            }
            _loc1_ = Number(this.var_392) - Number(this.var_2253);
            this.graphics.beginBitmapFill(this.var_4074);
            this.graphics.drawRect(0, 0, Number(this.var_4074.width) * Number(this.var_2253), this.var_4074.height);
            this.graphics.beginBitmapFill(this.var_4880);
            this.graphics.drawRect(Number(this.var_4074.width) * Number(this.var_2253), 0, Number(this.var_4880.width) * _loc1_, this.var_4880.height);
            this.graphics.endFill();
        } else {
            this.method_1050();
        }
    }

    private function method_1050(): void {
        this.textField.defaultTextFormat = class_18.const_1147;
        this.textField.embedFonts = class_18.var_3322;
        this.textField.antiAliasType = AntiAliasType.ADVANCED;
        this.textField.mouseEnabled = false;
        this.textField.selectable = false;
        var _loc1_: int = int(class_18.const_1147.color);
        this.textField.textColor = _loc1_;
        this.textField.height = 20;
        this.textField.text = String(this.var_2253) + " / " + String(this.var_392);
        this.addChild(this.textField);
    }

    public function method_5272(param1: Number, param2: Number): void {
        if (this.name_91 != param1 || param2 != this.name_50) {
            this.name_91 = param1;
            this.name_50 = param2;
            this.var_1280();
        }
    }
}
}
