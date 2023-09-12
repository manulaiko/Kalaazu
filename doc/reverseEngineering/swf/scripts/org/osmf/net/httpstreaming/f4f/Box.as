package org.osmf.net.httpstreaming.f4f {

class Box {


    private var _size: Number;

    private var _type: String;

    private var _boxLength: uint;

    function Box() {
        super();
    }

    public function get size(): Number {
        return this._size;
    }

    public function set size(param1: Number): void {
        this._size = param1;
    }

    public function get type(): String {
        return this._type;
    }

    public function set type(param1: String): void {
        this._type = param1;
    }

    public function get boxLength(): uint {
        return this._boxLength;
    }

    public function set boxLength(param1: uint): void {
        this._boxLength = param1;
    }
}
}
