package package_71 {

import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_9;

public class class_1056 extends Sprite {

    private static const MARGIN: int = 15;


    private var var_694: TextField;

    private var var_3613: TextField;

    public function class_1056(param1: String, param2: int) {
        super();
        this.var_694 = this.createTextField();
        this.var_694.autoSize = TextFieldAutoSize.LEFT;
        this.var_694.htmlText = param1;
        addChild(this.var_694);
        this.var_3613 = this.createTextField();
        this.var_3613.autoSize = TextFieldAutoSize.LEFT;
        this.var_3613.htmlText = String(param2);
        addChild(this.var_3613);
        this.updateLayout();
    }

    private function updateLayout(): void {
        this.var_3613.x = this.var_694.x + this.var_694.width + MARGIN;
    }

    private function createTextField(param1: Boolean = false): TextField {
        var _loc3_: * = null;
        var _loc2_: TextFormat = param1 ? new TextFormat(class_18.const_2843.font, class_18.const_2843.size, 15327936) : new TextFormat(class_18.const_2667.font, class_18.const_2667.size, 15327936);
        _loc3_ = new TextField();
        _loc3_.defaultTextFormat = _loc2_;
        _loc3_.embedFonts = class_18.var_5039;
        _loc3_.antiAliasType = AntiAliasType.ADVANCED;
        _loc3_.mouseEnabled = class_9.const_3029;
        _loc3_.selectable = false;
        _loc3_.multiline = true;
        _loc3_.wordWrap = true;
        _loc3_.autoSize = TextFieldAutoSize.LEFT;
        _loc3_.x = 4;
        _loc3_.y = 8;
        return _loc3_;
    }
}
}
