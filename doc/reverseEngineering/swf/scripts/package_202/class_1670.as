package package_202 {

import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.utils.ByteArray;

public class class_1670 extends EventDispatcher {

    public static const const_1918: uint = 4096;

    public static const const_1561: Array = [67, 87, 83, 11, 227, 11, 0, 0, 64, 3, 192, 3, 192, 0, 24, 1, 0, 68, 17, 25, 0, 0, 0, 198, 10, 97, 98, 99, 95, 65, 0];

    public static const const_3234: Array = [10, 19, 1, 0, 0, 0, 100, 105, 100, 73, 68, 0, 64, 0, 0, 0];


    private var var_2359: ByteArray;

    private var var_1663: ByteArray;

    protected var var_934: Boolean;

    protected var var_3409: Object;

    protected var var_3216: Function;

    protected var var_4055: ByteArray;

    public function class_1670() {
        this.var_2359 = new ByteArray();
        this.var_1663 = new ByteArray();
        super();
    }

    protected function method_5324(): void {
        var _loc3_: Number = 0;
        this.var_1663 = new ByteArray();
        var _loc1_: Number = 0;
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            _loc3_ = 0;
            this.var_1663.writeByte(_loc3_);
            _loc2_++;
        }
    }

    protected function method_384(): void {
        var _loc3_: Number = 0;
        this.var_2359 = new ByteArray();
        var _loc1_: Number = 0;
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            _loc3_ = 0;
            this.var_2359.writeByte(_loc3_);
            _loc2_++;
        }
    }

    public function method_60(param1: ByteArray, param2: uint, param3: Function): void {
        this.var_3216 = param3;
        if (param2 > 0) {
            this.method_5273(param2);
        }
        if (param1.length < const_1918) {
            this.method_1062(param1);
        }
    }

    private function method_5273(param1: uint): void {
        var _loc2_: uint = param1 & 255;
        var _loc3_: uint = (param1 & 65280) >> 8;
        var _loc4_: uint = (param1 & 16711680) >> 16;
        var _loc5_: uint = (param1 & 4278190080) >> 24;
        const_1561[4] = _loc2_;
        const_1561[5] = _loc3_;
        const_1561[6] = _loc4_;
        const_1561[7] = _loc5_;
    }

    private function method_1062(param1: ByteArray): void {
        this.method_2850();
        this.var_4055 = new ByteArray();
        this.var_4055.writeBytes(this.var_2359);
        this.var_4055.writeBytes(param1);
        this.var_4055.writeBytes(this.var_1663);
        this.method_2150();
    }

    private function method_2850(): void {
        this.method_384();
        this.method_5324();
    }

    protected function method_2150(): void {
        var _loc1_: Loader = new Loader();
        var _loc2_: LoaderInfo = _loc1_.contentLoaderInfo;
        _loc2_.addEventListener(Event.COMPLETE, this.method_2384);
        _loc2_.addEventListener(IOErrorEvent.IO_ERROR, this.method_6019);
        _loc1_.loadBytes(this.var_4055);
    }

    private function method_6019(param1: IOErrorEvent): void {
    }

    protected function method_2384(param1: Event = null): void {
        var _loc2_: LoaderInfo = param1.target as LoaderInfo;
        _loc2_.removeEventListener(Event.COMPLETE, this.method_2384);
        _loc2_.removeEventListener(IOErrorEvent.IO_ERROR, this.method_6019);
        this.var_3409 = _loc2_.content;
        this.activate();
        this.var_3216();
    }

    public function decode(param1: ByteArray): ByteArray {
        if (this.method_2461()) {
            return this.var_3409.decode(param1);
        }
        return param1;
    }

    public function encode(param1: ByteArray): ByteArray {
        if (this.var_934) {
            return this.var_3409.encode(param1);
        }
        return param1;
    }

    private function method_1039(): void {
        var _loc1_: ByteArray = new ByteArray();
        _loc1_.writeByte(255);
        _loc1_.writeByte(0);
        var _loc2_: ByteArray = this.encode(_loc1_);
        var _loc3_: ByteArray = this.decode(_loc2_);
    }

    public function activate(): void {
        this.var_934 = true;
    }

    public function deactivate(): void {
        this.var_934 = false;
    }

    public function method_2461(): Boolean {
        return this.var_934;
    }
}
}
