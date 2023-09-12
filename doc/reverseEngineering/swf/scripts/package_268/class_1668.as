package package_268 {

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.utils.ByteArray;

public class class_1668 {


    private var var_629: Class;

    private var loader: Loader;

    private var loadCallback: Function;

    public function class_1668() {
        this.var_629 = class_1942;
        super();
    }

    public function initialize(param1: Function, param2: Class = null): void {
        var _loc3_: * = null;
        this.loader = new Loader();
        this.loadCallback = param1;
        _loc3_ = new this.var_629() as ByteArray;
        this.load(_loc3_);
    }

    private final function load(param1: ByteArray): void {
        var _loc2_: LoaderInfo = this.loader.contentLoaderInfo;
        _loc2_.removeEventListener(Event.COMPLETE, this.method_1038);
        _loc2_.removeEventListener(IOErrorEvent.IO_ERROR, this.method_1135);
        _loc2_.addEventListener(Event.COMPLETE, this.method_1038);
        _loc2_.addEventListener(IOErrorEvent.IO_ERROR, this.method_1135);
        this.loader.loadBytes(param1);
    }

    protected function method_1038(param1: Event): void {
        var _loc2_: DisplayObject = (param1.target as LoaderInfo).content;
        this.loadCallback(_loc2_);
    }

    protected function method_1135(param1: Event): void {
    }
}
}
