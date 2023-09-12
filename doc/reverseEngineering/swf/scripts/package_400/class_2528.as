package package_400 {

import flash.display.DisplayObject;
import flash.display.Sprite;

import package_33.class_93;

import package_454.class_2526;

import package_76.class_215;

public class class_2528 {

    private static const const_2254: int = 42;

    private static const const_2481: int = 6;


    private var var_4849: class_93;

    private var _width: Number;

    private var _height: Number;

    private var var_1198: class_2526;

    private var var_3527: class_2526;

    private var var_4289: Sprite;

    public function class_2528(param1: class_93, param2: Number, param3: Number) {
        this.var_1198 = new class_2526();
        this.var_3527 = new class_2526();
        super();
        this._height = param3;
        this._width = param2;
        this.var_4849 = param1;
        this.method_6384();
    }

    private function method_6384(): void {
        this.method_5454();
        this.method_6031();
        this.method_4098();
    }

    private function method_4098(): void {
        this.var_3527.method_5108 = this.method_1329(154, 193);
        this.var_3527.method_1302 = const_2254;
        this.var_3527.method_3552 = const_2481;
        this.var_4849.addElement(this.var_3527, class_93.const_2037);
    }

    private function method_6031(): void {
        this.var_4289 = this.method_1329(63, 35);
        this.var_4849.addElement(this.var_4289, class_93.const_2037);
    }

    private function method_5454(): void {
        this.var_1198.method_5108 = this.method_1329(154, 193);
        this.var_1198.method_1302 = const_2254;
        this.var_1198.method_3552 = const_2481;
        this.var_4849.addElement(this.var_1198, class_93.const_2037);
    }

    private function method_1329(param1: int = 100, param2: int = 100): Sprite {
        var _loc3_: Sprite = new Sprite();
        _loc3_.graphics.drawRect(0, 0, param1, param2);
        return _loc3_;
    }

    public function get method_487(): class_2526 {
        return this.var_1198;
    }

    public function get method_5919(): class_2526 {
        return this.var_3527;
    }

    public function get method_714(): DisplayObject {
        return this.var_4289;
    }

    public function set method_714(param1: DisplayObject): void {
        class_215.method_5129(this.var_4289);
        this.var_4289.addChild(param1);
    }
}
}
