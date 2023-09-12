package package_71 {

import com.bigpoint.utils.class_122;

import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

import package_241.class_1563;

import package_26.class_94;

public class class_1054 extends Sprite {

    public static const const_2446: String = "sizeChanged";

    private static const const_2354: int = 245;


    private var var_2494: class_1563;

    private var var_1405: Boolean;

    private var var_224: TextField;

    public function class_1054() {
        super();
        this.method_79();
        addChild(this.var_2494 = new class_1563());
        this.var_2494.y = this.var_224.y + this.var_224.height - 8;
    }

    public function method_79(): void {
        if (Boolean(this.var_224) && Boolean(contains(this.var_224))) {
            removeChild(this.var_224);
        }
        var _loc1_: TextFormat = new TextFormat(class_18.const_2843.font, class_18.const_2843.size, 15327936);
        this.var_224 = new TextField();
        this.var_224.defaultTextFormat = _loc1_;
        this.var_224.embedFonts = class_18.var_5039;
        this.var_224.antiAliasType = AntiAliasType.ADVANCED;
        this.var_224.mouseEnabled = true;
        this.var_224.selectable = false;
        this.var_224.width = const_2354;
        addChild(this.var_224);
        this.var_224.height = 18;
        this.var_224.y = 4;
    }

    public function set questTitle(param1: String): void {
        var _loc2_: Boolean = false;
        this.method_79();
        param1 = param1 || false;
        if (Boolean(contains(this.var_224)) && Boolean(param1.length)) {
            _loc2_ = Boolean(class_122.method_2867(param1, this.var_224));
            if (_loc2_) {
                class_94.getInstance().method_1211(this.var_224, param1);
            }
        }
    }

    public function get isDefaultVisible(): Boolean {
        return this.var_1405;
    }

    public function set isDefaultVisible(param1: Boolean): void {
        this.var_1405 = param1;
    }

    public function get method_2789(): int {
        return this.height;
    }

    public function get method_4825(): class_1563 {
        return this.var_2494;
    }
}
}
