package package_11 {

import com.adobe.crypto.MD5;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import package_23.FileCollectionEvent;
import package_23.FileCollectionFinishEvent;

import package_24.class_75;

public class class_38 extends EventDispatcher {

    public static const const_2745: int = 5;


    protected var _data;

    private var var_1690: Vector.<Function>;

    private var var_2839: Vector.<Function>;

    private var var_911: Boolean = false;

    private var var_4446: Boolean = false;

    private var var_3235: URLLoader;

    private var _url: String;

    private var var_4861: uint;

    private var var_774: class_75;

    private var var_1924: Boolean = false;

    public function class_38() {
        this.var_1690 = new Vector.<Function>();
        this.var_2839 = new Vector.<Function>();
        super();
    }

    public function get name_58(): class_75 {
        return this.var_774;
    }

    public function get isFinished(): Boolean {
        return this.var_1924;
    }

    public function dispose(): void {
        var _loc1_: * = null;
        clearTimeout(this.var_4861);
        this.method_1289();
        if (this.var_911) {
            this.var_4446 = true;
        } else {
            this.var_4446 = false;
            this._data = null;
            this.method_982();
            _loc1_ = new FileCollectionEvent(FileCollectionEvent.RESOURCE_CLEARED);
            _loc1_.text = this.name_58.id;
            dispatchEvent(_loc1_);
        }
    }

    public function addCompleteCallback(param1: Function): void {
        if (param1 != null) {
            this.var_1690.push(param1);
            if (this.isFinished) {
                this.var_911 = true;
                setTimeout(this.method_4451, 1);
            }
        }
    }

    public function method_2974(param1: Function): void {
        var _loc2_: int = int(this.var_1690.indexOf(param1));
        if (_loc2_ >= 0) {
            this.var_1690.splice(_loc2_, 1);
        }
    }

    public function addErrorCallback(param1: Function): void {
        if (param1 != null) {
            this.var_2839.push(param1);
        }
    }

    public function method_5061(param1: Function): void {
        var _loc2_: int = int(this.var_2839.indexOf(param1));
        if (_loc2_ >= 0) {
            this.var_2839.splice(_loc2_, 1);
        }
    }

    public function load(param1: class_75, param2: String, param3: Boolean): void {
        this.var_774 = param1;
        this._url = param2 + this.var_774.method_4286(param3);
        this.var_3235 = new URLLoader();
        this.var_3235.dataFormat = URLLoaderDataFormat.BINARY;
        this.var_3235.addEventListener(Event.COMPLETE, this.method_5581);
        this.var_3235.addEventListener(IOErrorEvent.IO_ERROR, this.method_696);
        this.var_3235.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_3690);
        this.method_1996();
    }

    protected function start(): void {
        this.method_206();
    }

    protected final function method_206(): void {
        this.var_1924 = true;
        dispatchEvent(new FileCollectionFinishEvent(FileCollectionFinishEvent.FILE_FINISH, this));
        this.method_4451();
    }

    protected function method_982(): void {
    }

    private function method_4451(): void {
        this.var_911 = true;
        this.var_2839.length = 0;
        while (this.var_1690.length > 0) {
            this.var_1690.pop()(this);
        }
        this.var_911 = false;
        if (this.var_4446) {
            this.dispose();
        }
    }

    private function method_2701(): void {
        this.var_911 = true;
        this.var_1690.length = 0;
        while (this.var_2839.length > 0) {
            this.var_2839.pop()(this.var_774.id);
        }
        this.var_911 = false;
        if (this.var_4446) {
            this.dispose();
        }
    }

    private function method_1996(): void {
        ++this.var_774.var_847;
        this.var_3235.load(new URLRequest(this._url));
    }

    private function method_1289(): void {
        if (this.var_3235) {
            this.var_3235.removeEventListener(Event.COMPLETE, this.method_5581);
            this.var_3235.removeEventListener(IOErrorEvent.IO_ERROR, this.method_696);
            this.var_3235.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_3690);
            this.var_3235.close();
            this.var_3235 = null;
        }
    }

    private function method_5581(param1: Event): void {
        this.name_58.size = this.var_3235.bytesTotal;
        if (this.var_3235.data is ByteArray && Boolean(this.name_58.calculateHash)) {
            this.name_58.var_1520 = MD5.hashBytes(this.var_3235.data as ByteArray);
            this.name_58.var_1520 = this.name_58.var_1520.substr(0, Number(this.name_58.var_1520.length) - 2) + "00";
        }
        this._data = this.var_3235.data;
        this.method_1289();
        this.start();
    }

    private function method_696(param1: IOErrorEvent): void {
        if (const_2745 > 0 && this.var_774.var_847 >= const_2745) {
            this.method_1289();
            this.method_2701();
        } else {
            this.var_4861 = setTimeout(this.method_1996, 5000);
        }
    }

    private function method_3690(param1: SecurityErrorEvent): void {
        this.method_1289();
        this.method_2701();
    }
}
}
