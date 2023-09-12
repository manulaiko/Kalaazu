package net.bigpoint.darkorbit.map.model.traits {

import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

import package_10.class_1173;
import package_10.class_305;

import package_29.class_267;

public class class_1182 extends class_267 {


    private const TEXTFORMAT: TextFormat = new TextFormat(class_18.const_1095.font, class_18.const_198, 16777215, class_18.const_1095.bold);

    public const text: class_1173 = new class_1173();

    public const position: class_305 = new class_305(0, 0);

    private var _tf: TextFormat;

    private var _backgroundColor: uint;

    public function class_1182(param1: String = null, param2: int = 0, param3: int = 0, param4: TextFormat = null, param5: uint = 0) {
        super();
        this._backgroundColor = param5;
        this._tf = param4 || this.TEXTFORMAT;
        this.text.value = param1;
        this.position.x = param2;
        this.position.y = param3;
    }

    public function get tf(): TextFormat {
        return this._tf;
    }

    public function get backgroundColor(): uint {
        return this._backgroundColor;
    }

    public function get x(): int {
        return this.position.x;
    }

    public function get y(): int {
        return this.position.y;
    }

    public function set x(param1: int): void {
        this.position.x = param1;
    }

    public function set y(param1: int): void {
        this.position.y = param1;
    }
}
}
