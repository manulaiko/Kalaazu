package org.osmf.net {

public class PortProtocol {


    private var _port: int;

    private var _protocol: String;

    public function PortProtocol() {
        super();
    }

    public function get port(): int {
        return this._port;
    }

    public function set port(param1: int): void {
        this._port = param1;
    }

    public function get protocol(): String {
        return this._protocol;
    }

    public function set protocol(param1: String): void {
        this._protocol = param1;
    }
}
}
