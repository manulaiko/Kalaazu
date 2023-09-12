package org.osmf.net.httpstreaming.f4f {

class FullBox extends Box {


    private var _version: uint;

    private var _flags: uint;

    function FullBox() {
        super();
    }

    public function get version(): uint {
        return this._version;
    }

    public function set version(param1: uint): void {
        this._version = param1;
    }

    public function get flags(): uint {
        return this._flags;
    }

    public function set flags(param1: uint): void {
        this._flags = param1;
    }
}
}
