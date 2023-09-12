package net.bigpoint.darkorbit.mvc.common.model.assets.newLazyLoader {

import net.bigpoint.as3toolbox.filecollection.class_66;

import package_11.class_38;

public class NewLazyFileCollectionLoader {

    private static const MAX_TRIES: int = 4;


    private var _fileCollection: class_66;

    public var callbackCompleteList: Vector.<Function>;

    public var callbackErrorList: Vector.<Function>;

    public var isLoaded: Boolean = false;

    private var _onRemoveCallback: Function;

    private var _inProgress: Boolean = false;

    private var _resKey: String;

    private var _tries: int;

    public function NewLazyFileCollectionLoader(param1: String, param2: Function, param3: Function, param4: class_66, param5: Function) {
        this.callbackCompleteList = new Vector.<Function>();
        this.callbackErrorList = new Vector.<Function>();
        super();
        this._onRemoveCallback = param5;
        this._fileCollection = param4;
        this._resKey = param1;
        this.addCompleteCallback(param2);
        this.addErrorCallback(param3);
    }

    public function load(): void {
        this._inProgress = true;
        if (!this._fileCollection.isLoaded(this._resKey)) {
            ++this._tries;
            this._fileCollection.load(this._resKey, this.assetLoaded, this.assetLoadError);
        }
    }

    public function assetLoaded(param1: class_38 = null): void {
        this._inProgress = false;
        this.isLoaded = true;
        this.callAllCompleteCallbacks(param1);
        this.cleanupCallBacks();
    }

    public function assetLoadError(param1: Object = null): void {
        if (this._tries > MAX_TRIES) {
            this._inProgress = false;
            this.callAllErrorCallbacks();
            this._onRemoveCallback(this);
            this.cleanupCallBacks();
        } else {
            this.load();
        }
    }

    public function callAllCompleteCallbacks(param1: class_38 = null): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.callbackCompleteList.length) {
            this.callbackCompleteList[_loc2_](param1);
            _loc2_++;
        }
    }

    public function callAllErrorCallbacks(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this.callbackErrorList.length) {
            this.callbackErrorList[_loc1_]();
            _loc1_++;
        }
    }

    public function addCompleteCallback(param1: Function): void {
        if (param1 != null) {
            this.callbackCompleteList.push(param1);
        }
    }

    public function addErrorCallback(param1: Function): void {
        if (param1 != null) {
            this.callbackErrorList.push(param1);
        }
    }

    public function get inProgress(): Boolean {
        return this._inProgress;
    }

    private function cleanupCallBacks(): void {
        this.callbackCompleteList.length = 0;
        this.callbackErrorList.length = 0;
    }
}
}
