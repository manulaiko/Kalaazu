package package_366 {

import away3d.arcane;

import package_199.class_2123;
import package_199.class_2415;

import package_293.class_1751;

import package_368.class_2416;

public class class_2122 extends class_2105 {


    private var _parser: class_2105;

    public function class_2122() {
        super(class_2419.BINARY);
    }

    public static function supportsType(param1: String): Boolean {
        return param1.toLowerCase() == "awd";
    }

    public static function supportsData(param1: *): Boolean {
        return Boolean(class_2443.supportsData(param1)) || Boolean(AWD2Parser.supportsData(param1));
    }

    override public function get method_728(): Vector.<class_2416> {
        return !!this._parser ? this._parser.method_728 : super.method_728;
    }

    override public function get method_1070(): Boolean {
        return !!this._parser ? Boolean(this._parser.method_1070) : false;
    }

    override public function get method_3984(): Boolean {
        return !!this._parser ? Boolean(this._parser.method_3984) : false;
    }

    override arcane function method_3765(param1: class_2416): void {
        if (this._parser) {
            this._parser.arcane::method_3765(param1);
        }
    }

    override arcane function resolveDependencyFailure(param1: class_2416): void {
        if (this._parser) {
            this._parser.arcane::resolveDependencyFailure(param1);
        }
    }

    override arcane function method_5931(param1: class_2416, param2: class_1751): String {
        if (this._parser) {
            return this._parser.arcane::method_5931(param1, param2);
        }
        return param2.name;
    }

    override arcane function method_4486(): void {
        if (this._parser) {
            this._parser.arcane::method_4486();
        }
    }

    override protected function method_196(): Boolean {
        if (!this._parser) {
            if (AWD99Parser.supportsData(_data)) {
                this._parser = new AWD99Parser();
            } else if (AWD2Parser.supportsData(_data)) {
                this._parser = new AWD2Parser();
            } else {
                this._parser = new class_2443();
            }
            this._parser.method_810 = method_810;
            this._parser.addEventListener(class_2415.const_2203, this.method_6260);
            this._parser.addEventListener(class_2415.const_2819, this.method_1015);
            this._parser.addEventListener(class_2415.PARSE_ERROR, this.method_4143);
            this._parser.addEventListener(class_2123.const_269, this.method_3095);
            this._parser.addEventListener(class_2123.const_363, this.method_3095);
            this._parser.addEventListener(class_2123.const_3299, this.method_3095);
            this._parser.addEventListener(class_2123.const_2373, this.method_3095);
            this._parser.addEventListener(class_2123.const_54, this.method_3095);
            this._parser.addEventListener(class_2123.const_255, this.method_3095);
            this._parser.addEventListener(class_2123.const_2364, this.method_3095);
            this._parser.addEventListener(class_2123.const_2111, this.method_3095);
            this._parser.addEventListener(class_2123.const_814, this.method_3095);
            this._parser.addEventListener(class_2123.const_1065, this.method_3095);
            this._parser.addEventListener(class_2123.const_2878, this.method_3095);
            this._parser.addEventListener(class_2123.const_102, this.method_3095);
            this._parser.addEventListener(class_2123.const_736, this.method_3095);
            this._parser.method_5169(_data);
        }
        return const_2971;
    }

    private function method_4143(param1: class_2415): void {
        dispatchEvent(param1.clone());
    }

    private function method_1015(param1: class_2415): void {
        dispatchEvent(param1.clone());
    }

    private function method_3095(param1: class_2123): void {
        dispatchEvent(param1.clone());
    }

    private function method_6260(param1: class_2415): void {
        this._parser.removeEventListener(class_2415.const_2819, this.method_1015);
        this._parser.removeEventListener(class_2415.const_2203, this.method_6260);
        this._parser.removeEventListener(class_2415.PARSE_ERROR, this.method_4143);
        this._parser.removeEventListener(class_2123.const_269, this.method_3095);
        this._parser.removeEventListener(class_2123.const_363, this.method_3095);
        this._parser.removeEventListener(class_2123.const_3299, this.method_3095);
        this._parser.removeEventListener(class_2123.const_2373, this.method_3095);
        this._parser.removeEventListener(class_2123.const_54, this.method_3095);
        this._parser.removeEventListener(class_2123.const_255, this.method_3095);
        this._parser.removeEventListener(class_2123.const_2364, this.method_3095);
        this._parser.removeEventListener(class_2123.const_2111, this.method_3095);
        this._parser.removeEventListener(class_2123.const_814, this.method_3095);
        this._parser.removeEventListener(class_2123.const_1065, this.method_3095);
        this._parser.removeEventListener(class_2123.const_2878, this.method_3095);
        this._parser.removeEventListener(class_2123.const_102, this.method_3095);
        this._parser.removeEventListener(class_2123.const_736, this.method_3095);
        method_1318();
    }
}
}
