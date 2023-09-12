package org.osmf.net.httpstreaming.f4f {

class BoxInfo {


    private var _size: Number;

    private var _type: String;

    function BoxInfo(param1: Number, param2: String) {
        super();
        this._size = param1;
        this._type = param2;
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
}
}
