package net.bigpoint.darkorbit.gui {

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFormat;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;

import package_192.class_1784;

import package_30.class_185;
import package_30.class_218;
import package_30.class_219;

public class class_1552 extends Sprite {


    private var var_4322: class_219;

    private var format: TextFormat;

    private var var_4804: class_219;

    private var button: class_218;

    private var var_3533: class_1554;

    public function class_1552(param1: String, param2: String, param3: String, param4: Function, param5: MovieClip, param6: int) {
        var _loc8_: Number = NaN;
        this.var_3533 = new class_1554();
        super();
        var _loc7_: String = "";
        if (param3 != "" && !isNaN(Number(param3))) {
            if ((_loc8_ = (_loc8_ = Number(param3)) + 1) >= 10) {
                _loc8_ = 0;
            }
            _loc7_ = _loc8_.toString();
        }
        this.format = new TextFormat(class_18.const_2667.font, class_18.const_662, param6);
        this.var_4322 = new class_219(150, 20, this.format, class_88.getItem(param1) + " " + _loc7_);
        this.var_4322.x = 10;
        this.var_4804 = new class_219(100, 20, this.format, class_88.getItem("keyboard_key_undefined"));
        this.var_4804.x = this.var_4322.x + this.var_4322.width;
        this.button = new class_218(class_185.const_2148, class_88.getItem("btn_change"), param5);
        this.button.x = 300;
        addEventListener(MouseEvent.CLICK, param4);
        addChild(this.var_4322);
        addChild(this.var_4804);
        addChild(this.button);
        this.var_3533.args = new <String>[param3];
        this.var_3533.name = class_1784.name_95[int(param2)];
    }

    override public function get name(): String {
        return this.var_3533.toString();
    }

    public function get keyValuePair(): class_1554 {
        return this.var_3533;
    }

    public function set method_520(param1: String): void {
        this.var_4804.textField.text = param1;
    }

    public function get method_520(): String {
        return this.var_4804.textField.text;
    }
}
}
