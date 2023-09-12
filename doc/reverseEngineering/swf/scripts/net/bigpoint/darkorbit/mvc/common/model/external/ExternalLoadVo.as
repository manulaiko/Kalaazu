package net.bigpoint.darkorbit.mvc.common.model.external {

public class ExternalLoadVo {


    private var _url: String;

    private var _callback: Function;

    public function ExternalLoadVo(param1: String, param2: Function) {
        super();
        this._callback = param2;
        this._url = param1;
    }

    public function get url(): String {
        return this._url;
    }

    public function get callback(): Function {
        return this._callback;
    }
}
}
