package package_279 {

import com.bigpoint.utils.class_129;

import flash.filters.BitmapFilterQuality;
import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

import package_113.class_2286;

public class class_2324 extends class_2323 {

    private static const const_619: Array = [new GlowFilter(0, 0.7, 5, 5, 6, BitmapFilterQuality.HIGH)];


    private var var_176: class_2286;

    private var _tf: TextField;

    private var _format: TextFormat;

    public function class_2324(param1: class_2286) {
        this._tf = new TextField();
        this._format = new TextFormat(class_18.const_1095.font, class_18.const_198, 16777215, class_18.const_1095.bold);
        super();
        this.var_176 = param1;
        this.method_30();
        param1.seconds.changed.add(this.updateTimer);
    }

    private function method_30(): void {
        this._tf.autoSize = TextFieldAutoSize.CENTER;
        this._tf.textColor = 11206655;
        this._tf.defaultTextFormat = this._format;
        this._tf.text = class_129.method_1101(this.var_176.seconds.value);
        this._tf.filters = const_619;
        this._tf.embedFonts = class_18.var_930;
        addChild(this._tf);
    }

    private function updateTimer(): void {
        this._tf.text = class_129.method_1101(this.var_176.seconds.value);
    }
}
}
