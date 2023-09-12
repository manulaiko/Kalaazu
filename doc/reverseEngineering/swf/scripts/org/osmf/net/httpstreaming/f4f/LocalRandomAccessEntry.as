package org.osmf.net.httpstreaming.f4f {

class LocalRandomAccessEntry {


    private var _time: Number;

    private var _offset: Number;

    function LocalRandomAccessEntry() {
        super();
    }

    public function get time(): Number {
        return this._time;
    }

    public function set time(param1: Number): void {
        this._time = param1;
    }

    public function get offset(): Number {
        return this._offset;
    }

    public function set offset(param1: Number): void {
        this._offset = param1;
    }
}
}
