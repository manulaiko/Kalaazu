package package_251 {

import fl.controls.Slider;
import fl.controls.SliderDirection;
import fl.events.SliderEvent;

import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;

import package_30.class_91;

public class class_1550 extends class_91 {

    public static const const_3098: int = 20;

    public static const const_2903: int = 350;


    private var var_590: int;

    private var var_4448: String;

    private var _slider: Slider;

    private var var_2286: TextField;

    public function class_1550(param1: int, param2: String, param3: Function) {
        super(class_91.const_1074);
        this.var_590 = param1;
        this.var_4448 = param2;
        this.init();
        this._slider.addEventListener(SliderEvent.CHANGE, param3);
        this._slider.addEventListener(SliderEvent.THUMB_DRAG, param3);
    }

    private function init(): void {
        var _loc1_: TextField = new TextField();
        _loc1_.selectable = false;
        _loc1_.defaultTextFormat = class_18.const_2843;
        _loc1_.textColor = 16777215;
        _loc1_.text = class_88.getItem(this.var_4448);
        _loc1_.border = false;
        _loc1_.embedFonts = class_18.var_5039;
        _loc1_.autoSize = TextFieldAutoSize.LEFT;
        _loc1_.antiAliasType = AntiAliasType.ADVANCED;
        _loc1_.height = NaN;
        _loc1_.y = 0;
        addChild(_loc1_);
        this.var_2286 = new TextField();
        this.var_2286.selectable = false;
        this.var_2286.defaultTextFormat = class_18.const_2843;
        this.var_2286.textColor = 15327936;
        this.var_2286.border = false;
        this.var_2286.embedFonts = class_18.var_5039;
        this.var_2286.autoSize = TextFieldAutoSize.LEFT;
        this.var_2286.antiAliasType = AntiAliasType.ADVANCED;
        this.var_2286.height = NaN;
        this.var_2286.x = _loc1_.width + 10;
        this.var_2286.y = 0;
        addChild(this.var_2286);
        this._slider = new Slider();
        this._slider.direction = SliderDirection.HORIZONTAL;
        this._slider.move(const_3098, _loc1_.height + 20);
        this._slider.setSize(const_2903, 10);
        this._slider.maximum = 100;
        this._slider.minimum = 0;
        this._slider.snapInterval = 1;
        this._slider.name = this.var_590.toString();
        addChild(this._slider);
    }

    public function method_286(param1: int): void {
        this._slider.value = param1;
    }
}
}
