package package_118 {

import flash.utils.Dictionary;

public class class_1690 extends ContentElement {


    private var _text: String;

    public function class_1690() {
        super();
    }

    public function get text(): String {
        return this._text;
    }

    public function set text(param1: String): void {
        this._text = param1;
    }

    override public function getText(param1: Dictionary): String {
        return this._text;
    }
}
}
