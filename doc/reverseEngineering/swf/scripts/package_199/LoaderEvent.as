package package_199 {

import flash.events.Event;

public class LoaderEvent extends Event {

    public static const LOAD_ERROR: String = "loadError";

    public static const const_2719: String = "resourceComplete";

    public static const const_1253: String = "dependencyComplete";


    private var _url: String;

    private var _message: String;

    private var var_2028: Boolean;

    private var var_2691: Boolean;

    public function LoaderEvent(param1: String, param2: String = null, param3: Boolean = false, param4: String = null) {
        super(param1);
        this._url = param2;
        this._message = param4;
        this.var_2028 = param3;
    }

    public function get url(): String {
        return this._url;
    }

    public function get message(): String {
        return this._message;
    }

    public function get method_5867(): Boolean {
        return this.var_2028;
    }

    override public function preventDefault(): void {
        this.var_2691 = true;
    }

    override public function isDefaultPrevented(): Boolean {
        return this.var_2691;
    }

    override public function clone(): Event {
        return new LoaderEvent(type, this._url, this.var_2028, this._message);
    }
}
}
