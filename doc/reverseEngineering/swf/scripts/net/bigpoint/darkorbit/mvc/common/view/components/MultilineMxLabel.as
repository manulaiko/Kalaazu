package net.bigpoint.darkorbit.mvc.common.view.components {

import flash.display.DisplayObject;
import flash.text.TextFieldAutoSize;

import mx.controls.Label;
import mx.core.UITextField;

public class MultilineMxLabel extends Label {


    public function MultilineMxLabel() {
        super();
    }

    override protected function createChildren(): void {
        if (!textField) {
            textField = new UITextField();
            textField.styleName = this;
            addChild(DisplayObject(textField));
        }
        super.createChildren();
        textField.multiline = true;
        textField.wordWrap = true;
        textField.autoSize = TextFieldAutoSize.LEFT;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        textField.width = parent.width;
    }

    override public function get height(): Number {
        return textField.textHeight;
    }
}
}
