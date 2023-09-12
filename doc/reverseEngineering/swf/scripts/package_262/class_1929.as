package package_262 {

import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.darkorbit.class_18;

import package_33.class_93;

import package_83.class_1926;

public class class_1929 {


    private var var_3995: TextField;

    private var var_2212: TextField;

    private var var_3507: TextField;

    private var var_1921: TextField;

    public function class_1929(param1: class_93) {
        super();
        this.decorate(param1);
    }

    private function decorate(param1: class_93): void {
        this.var_3995 = new TextField();
        this.var_2212 = new TextField();
        this.var_3507 = new TextField();
        this.var_1921 = new TextField();
        var _loc2_: TextFormat = new TextFormat(class_18.const_740, class_18.const_2081, class_18.WHITE, true);
        this.var_3995.defaultTextFormat = _loc2_;
        var _loc3_: TextFormat = new TextFormat(class_18.const_740, class_18.const_2081, class_18.const_1319, false);
        var _loc4_: TextFormat = new TextFormat(class_18.const_740, class_18.const_2081, class_18.const_1319, false);
        var _loc5_: TextFormat = new TextFormat(class_18.const_740, class_18.const_2081, class_18.const_1319, false);
        _loc3_.align = TextFormatAlign.CENTER;
        _loc4_.align = TextFormatAlign.CENTER;
        _loc5_.align = TextFormatAlign.CENTER;
        this.var_1921.defaultTextFormat = _loc5_;
        this.var_3507.defaultTextFormat = _loc4_;
        this.var_2212.defaultTextFormat = _loc3_;
        this.var_3995.autoSize = TextFieldAutoSize.LEFT;
        this.var_3995.embedFonts = this.var_1921.embedFonts = this.var_3507.embedFonts = this.var_2212.embedFonts = class_18.var_3911;
        this.var_3995.selectable = this.var_1921.selectable = this.var_3507.selectable = this.var_2212.selectable = false;
        this.var_1921.width = this.var_3507.width = this.var_2212.width = 50;
        param1.addElement(this.var_3995);
        param1.addElement(this.var_2212, class_93.const_3298, 10);
        param1.addElement(this.var_3507, class_93.const_2568, class_1926.const_2271);
        param1.addElement(this.var_1921, class_93.const_2568, class_1926.const_2271);
        this.var_1921.autoSize = TextFieldAutoSize.RIGHT;
        this.var_3507.autoSize = TextFieldAutoSize.CENTER;
        this.var_2212.autoSize = TextFieldAutoSize.LEFT;
    }

    public function get method_1666(): TextField {
        return this.var_3995;
    }

    public function get name_107(): TextField {
        return this.var_2212;
    }

    public function get name_139(): TextField {
        return this.var_3507;
    }

    public function get name_27(): TextField {
        return this.var_1921;
    }
}
}
