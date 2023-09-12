package org.osmf.net {

class FMSHost {


    private var _host: String;

    private var _port: String;

    function FMSHost(param1: String, param2: String = "1935") {
        super();
        this._host = param1;
        this._port = param2;
    }

    public function get host(): String {
        return this._host;
    }

    public function set host(param1: String): void {
        this._host = param1;
    }

    public function get port(): String {
        return this._port;
    }

    public function set port(param1: String): void {
        this._port = param1;
    }
}
}
