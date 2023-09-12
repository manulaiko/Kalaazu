package net.bigpoint.as3toolbox.filecollection {

import com.adobe.crypto.MD5;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;

import package_11.class_259;
import package_11.class_260;
import package_11.class_261;
import package_11.class_262;
import package_11.class_38;
import package_11.class_39;
import package_11.class_65;

import package_23.FileCollectionEvent;
import package_23.FileCollectionFileLoadEvent;
import package_23.FileCollectionFinishEvent;

import package_24.class_258;
import package_24.class_75;

public class class_66 extends EventDispatcher {

    private static const logging: Boolean = false;


    private var var_787: URLLoader;

    private var xml: XML;

    private var var_754: Object;

    private var var_2728: Object;

    private var var_2593: int;

    private var var_4385: Object;

    private var finisherList: Object;

    private var var_4822: String;

    private var var_4835: int;

    private var var_236: int;

    private var var_4172: String = "";

    private var var_4134: Array;

    private var var_4512: Boolean = false;

    private var var_3252: String;

    private var var_4056: Boolean;

    private var var_494: Vector.<String>;

    public function class_66(param1: String = "", param2: Boolean = false, param3: Boolean = false) {
        this.var_4134 = new Array();
        super();
        this.var_4512 = param2;
        this.var_4056 = param3;
        this.var_4822 = param1;
        this.var_754 = new Object();
        this.var_2728 = new Object();
        this.finisherList = new Object();
        this.var_4385 = new Object();
        this.var_2593 = 0;
        this.var_236 = 0;
        this.var_4835 = 0;
        this.method_6054();
    }

    public function set hashFilesList(param1: Vector.<String>): void {
        var _loc2_: * = null;
        this.var_494 = param1;
        if (this.var_494) {
            for each(_loc2_ in this.var_2728) {
                class_75(this.var_2728[_loc2_]).calculateHash = this.var_494.indexOf(_loc2_) != -1;
            }
        }
    }

    public function method_1951(param1: String, param2: Class): void {
        this.var_4385[param1] = param2;
    }

    public function method_2661(param1: String): void {
        this.var_787 = new URLLoader();
        this.var_787.addEventListener(IOErrorEvent.IO_ERROR, this.method_585);
        this.var_787.addEventListener(Event.COMPLETE, this.method_2693);
        this.var_787.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_3943);
        this.var_787.dataFormat = URLLoaderDataFormat.BINARY;
        this.var_787.load(new URLRequest(this.var_4822 + param1));
    }

    public function load(param1: String, param2: Function = null, param3: Function = null): void {
        if (param1 == null) {
            if (param3 != null) {
                param3(param1);
            }
            return;
        }
        var _loc4_: class_75;
        if ((_loc4_ = this.var_2728[param1]) == null) {
            if (param3 != null) {
                param3(param1);
            }
            return;
        }
        var _loc5_: class_38;
        if ((_loc5_ = this.finisherList[param1]) == null) {
            _loc5_ = new (this.var_4385[_loc4_.type] || class_261)();
            this.finisherList[param1] = _loc5_;
            _loc5_.addEventListener(FileCollectionEvent.RESOURCE_CLEARED, this.method_1927);
            _loc5_.addEventListener(FileCollectionFinishEvent.FILE_FINISH, this.method_1802);
            _loc5_.load(_loc4_, this.var_4822, this.var_4512);
            ++this.var_2593;
        }
        _loc5_.addCompleteCallback(param2);
        _loc5_.addErrorCallback(param3);
    }

    public function method_2379(param1: String, param2: Function): void {
        var _loc3_: class_38 = this.finisherList[param1];
        if (_loc3_) {
            _loc3_.method_2974(param2);
            _loc3_.method_5061(param2);
        }
    }

    public function method_5888(param1: String): Boolean {
        return this.var_2728.hasOwnProperty(param1);
    }

    private function method_6054(): void {
        this.method_1951("swf", class_39);
        this.method_1951("xml", class_262);
        this.method_1951("png", class_65);
        this.method_1951("jpg", class_65);
        this.method_1951("js", class_260);
        this.method_1951("txt", class_259);
    }

    private function method_2534(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.xml.location) {
            this.var_754[_loc1_.@id] = new class_258(_loc1_.@id, this.var_4172 + _loc1_.@path);
            if (!logging) {
            }
        }
    }

    private function method_2970(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        for each(_loc2_ in this.xml.file) {
            ++this.var_4835;
            _loc3_ = _loc2_.@id;
            if (this.var_4056) {
                _loc3_ += "." + _loc2_.@type;
            }
            _loc1_ = new class_75(_loc3_, this.var_754[_loc2_.@location], _loc2_.@name, _loc2_.@type, _loc2_.@version, _loc2_);
            _loc1_.var_1542 = _loc2_.@hash;
            if (this.var_494) {
                _loc1_.calculateHash = this.var_494.indexOf(_loc3_) != -1;
            }
            this.var_2728[_loc3_] = _loc1_;
            if (!logging) {
            }
        }
    }

    private function method_2693(param1: Event): void {
        var var_3815: FileCollectionEvent = null;
        var var_1911: String = null;
        var var_6: Event = param1;
        try {
            var_3815 = new FileCollectionEvent(FileCollectionEvent.RESOURCE_XML_PARSED);
            var_1911 = var_6.target.data;
            this.var_3252 = MD5.hash(var_1911);
            this.xml = new XML(var_1911);
            var_3815.xml = this.xml;
            this.method_2534();
            this.method_2970();
            dispatchEvent(var_3815);
            this.xml = undefined;
        } catch (e: TypeError) {
            dispatchEvent(new FileCollectionEvent(FileCollectionEvent.const_1614));
            return;
        }
        this.var_787.close();
        this.var_787.removeEventListener(IOErrorEvent.IO_ERROR, this.method_585);
        this.var_787.removeEventListener(Event.COMPLETE, this.method_2693);
        this.var_787.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_3943);
        this.var_787 = null;
        dispatchEvent(new FileCollectionEvent(FileCollectionEvent.RESOURCE_FILE_LOADED));
    }

    private function method_585(param1: IOErrorEvent): void {
        dispatchEvent(new FileCollectionEvent(FileCollectionEvent.RESOURCE_FILE_NOT_FOUND));
        throw new Error("resource file not found: " + param1.toString());
    }

    private function method_3943(param1: SecurityErrorEvent): void {
        dispatchEvent(new FileCollectionEvent(FileCollectionEvent.RESOURCE_FILE_SECURITY_BREACH));
        throw new Error("resource file security breach! " + param1.toString());
    }

    private function method_1802(param1: FileCollectionFinishEvent): void {
        ++this.var_236;
        dispatchEvent(new FileCollectionFileLoadEvent(FileCollectionFileLoadEvent.FILE_LOADED, param1.finisher.name_58));
        if (--this.var_2593 <= 0) {
            if (this.var_4134.length == 0) {
                dispatchEvent(new FileCollectionEvent(FileCollectionEvent.ALL_FILES_LOADED));
            }
        }
    }

    private function method_1927(param1: FileCollectionEvent): void {
        var _loc2_: class_38 = param1.currentTarget as class_38;
        _loc2_.removeEventListener(FileCollectionEvent.RESOURCE_CLEARED, this.method_1927);
        _loc2_.removeEventListener(FileCollectionFinishEvent.FILE_FINISH, this.method_1802);
        this.finisherList[param1.text] = null;
        delete this.finisherList[param1.text];
    }

    public function isLoaded(param1: String): Boolean {
        return Boolean(this.finisherList[param1]) && Boolean(class_38(this.finisherList[param1]).isFinished);
    }

    public function getFinisher(param1: String): class_38 {
        return this.finisherList[param1];
    }

    public function get method_5136(): int {
        return this.var_4835;
    }

    public function get method_1241(): int {
        return this.var_236;
    }

    public function get method_1958(): Object {
        return this.var_2728;
    }

    public function method_34(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.finisherList) {
            _loc1_.dispose();
            _loc1_.removeEventListener(FileCollectionEvent.RESOURCE_CLEARED, this.method_1927);
            _loc1_.removeEventListener(FileCollectionFinishEvent.FILE_FINISH, this.method_1802);
        }
        this.finisherList = new Object();
    }
}
}
