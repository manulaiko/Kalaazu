package package_30 {

import fl.controls.TextArea;

import flash.text.AntiAliasType;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

public class class_209 extends class_91 {


    public var textArea: TextArea;

    private var name_96: int;

    private var name_147: int;

    private var text: String;

    private var align: String;

    private var border: Boolean;

    public function class_209(param1: int, param2: int, param3: String = "center", param4: Boolean = false) {
        super(class_91.const_586);
        this.name_96 = param1;
        this.name_147 = param2;
        this.text = this.text;
        this.align = param3;
        this.border = param4;
        this.init();
    }

    public function init(): void {
        var _loc1_: TextFormat = new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215);
        _loc1_.align = this.align;
        this.textArea = new TextArea();
        this.textArea.width = this.name_96;
        this.textArea.height = this.name_147;
        this.textArea.editable = false;
        this.textArea.focusEnabled = false;
        this.textArea.textField.selectable = false;
        this.textArea.textField.border = this.border;
        this.textArea.textField.antiAliasType = AntiAliasType.ADVANCED;
        this.textArea.setStyle("textFormat", _loc1_);
        this.textArea.setStyle("embedFonts", class_18.var_603);
        this.addChild(this.textArea);
        if (this.textArea.focusManager) {
            this.textArea.focusManager.deactivate();
        }
    }
}
}
