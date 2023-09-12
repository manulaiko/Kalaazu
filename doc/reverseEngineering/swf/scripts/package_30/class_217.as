package package_30 {

import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.class_58;

import package_14.class_52;

import package_9.class_50;

public class class_217 extends class_91 implements class_52 {


    private var guiManager: class_58;

    private var textField: TextField;

    private var var_4821: int;

    private var var_5057: String;

    private var var_2180: String;

    private var _tpf: Number = 0;

    private var var_3488: Boolean = false;

    public function class_217(param1: class_58) {
        this.textField = new TextField();
        super(class_91.const_872);
        this.guiManager = param1;
        this.init();
    }

    public function init(): void {
        var _loc1_: Array = class_88.getItem("msg_logout_seconds").split("%SEC%");
        this.var_5057 = _loc1_[0];
        this.var_2180 = _loc1_[1];
        var _loc2_: TextFormat = new TextFormat(class_18.const_2442.font, class_18.const_3317, 16777215);
        _loc2_.align = TextFormatAlign.CENTER;
        this.textField.defaultTextFormat = _loc2_;
        this.textField.embedFonts = class_18.var_3809;
        this.textField.antiAliasType = AntiAliasType.ADVANCED;
        this.textField.autoSize = TextFieldAutoSize.CENTER;
        this.textField.wordWrap = true;
        this.textField.multiline = true;
        this.textField.width = 200;
        this.method_1455();
        this.addChild(this.textField);
    }

    public function method_5021(): void {
        if (Boolean(class_81.premium.value) || false) {
            this.var_4821 = 10;
        } else {
            this.var_4821 = 10;
        }
        if (!class_50.method_5546(this)) {
            class_50.method_5621(this);
        }
        this.var_3488 = true;
        this.method_1455();
    }

    public function method_6286(): void {
        this.var_3488 = false;
    }

    private function method_1455(): void {
        this.textField.text = this.var_5057 + "\n\n" + this.var_4821 + "\n\n" + this.var_2180;
    }

    public function updateTimer(param1: Number): void {
        if (this.var_3488) {
            this._tpf += param1;
            if (this._tpf > 999) {
                if (this.var_4821 > 0) {
                    --this.var_4821;
                    this.method_1455();
                }
                this._tpf = 0;
            }
        }
    }

    public function cleanup(): void {
        class_50.removeObserver(this);
    }
}
}
