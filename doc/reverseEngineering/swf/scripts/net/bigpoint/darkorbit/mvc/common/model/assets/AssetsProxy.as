package net.bigpoint.darkorbit.mvc.common.model.assets {

import com.bigpoint.utils.class_968;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.media.Sound;
import flash.utils.Dictionary;
import flash.utils.getTimer;

import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.fui.system.loader.IAssetLoader;
import net.bigpoint.darkorbit.mvc.common.model.assets.newLazyLoader.NewLazyFileCollectionLoader;
import net.bigpoint.darkorbit.mvc.common.model.external.ExternalLoader;

import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_11.class_38;
import package_11.class_39;
import package_11.class_65;

public class AssetsProxy extends Proxy implements IProxy, IAssetLoader {

    public static const NAME: String = "AssetsProxy";

    public static const ACHIEVEMENTS: String = "ACHIEVEMENTS";

    public static const LOCALIZED: String = "LOCALIZED";

    public static const ITEMS: String = "ITEMS";

    public static const GAME: String = "GAME";


    private var _loadingQueueRunning: Boolean;

    private var _loadingQueue: Vector.<String>;

    private var _lazyLoaderObjects: Dictionary;

    private var _externalLoader: ExternalLoader;

    private var _fileCollcetionDict: Dictionary;

    private var _bitmapAtlases: Dictionary;

    public function AssetsProxy() {
        this._loadingQueue = new Vector.<String>();
        this._lazyLoaderObjects = new Dictionary();
        this._externalLoader = new ExternalLoader();
        this._fileCollcetionDict = new Dictionary();
        this._bitmapAtlases = new Dictionary();
        super(NAME, null);
    }

    public function addFileCollection(param1: class_66 = null, param2: String = "GAME"): void {
        this._fileCollcetionDict[param2] = param1;
    }

    public function getMovieClip(param1: String, param2: String, param3: String = "GAME"): MovieClip {
        var _loc4_: class_66 = this.getFileCollectionByInstanceName(param3);
        var _loc5_: class_39;
        if ((_loc5_ = class_39(_loc4_.getFinisher(param1))).hasEmbeddedObject(param2)) {
            return _loc5_.getEmbeddedMovieClip(param2);
        }
        return null;
    }

    public function getFileCollectionByInstanceName(param1: String): class_66 {
        return this._fileCollcetionDict[param1] as class_66;
    }

    public function getBitmap(param1: String, param2: String, param3: String = "GAME"): Bitmap {
        var _loc4_: class_66 = this.getFileCollectionByInstanceName(param3);
        return class_39(_loc4_.getFinisher(param1)).getEmbeddedBitmap(param2);
    }

    public function getBitmapData(param1: String, param2: String, param3: String = "GAME"): BitmapData {
        var _loc4_: class_66 = this.getFileCollectionByInstanceName(param3);
        return class_39(_loc4_.getFinisher(param1)).getEmbeddedBitmapData(param2);
    }

    public function getSound(param1: String, param2: String, param3: String = "GAME"): Sound {
        var _loc4_: class_66 = this.getFileCollectionByInstanceName(param3);
        if (class_39(_loc4_.getFinisher(param1)).hasEmbeddedObject(param2)) {
            return class_39(_loc4_.getFinisher(param1)).getEmbeddedSound(param2);
        }
        return null;
    }

    public function getImage(param1: String, param2: String = "GAME"): DisplayObject {
        var _loc3_: class_66 = this.getFileCollectionByInstanceName(param2);
        return class_65(_loc3_.getFinisher(param1)).getBitmap();
    }

    public function isLoaded(param1: String, param2: String = "GAME"): Boolean {
        var _loc3_: class_66 = this.getFileCollectionByInstanceName(param2);
        var _loc4_: class_38;
        return !!(_loc4_ = _loc3_.getFinisher(param1)) ? Boolean(_loc4_.isFinished) : false;
    }

    public function loadAsset(param1: String, param2: Function, param3: Function = null): void {
        this.load(param1, param2, param3);
    }

    public function load(param1: String, param2: Function, param3: Function = null, param4: String = "GAME"): void {
        var _loc5_: class_66;
        (_loc5_ = this.getFileCollectionByInstanceName(param4)).load(param1, param2, param3);
    }

    public function lazyLoad(param1: String, param2: Function, param3: Function = null, param4: String = "GAME"): void {
        var _loc7_: * = null;
        var _loc5_: class_66;
        if ((_loc5_ = this.getFileCollectionByInstanceName(param4)).isLoaded(param1)) {
            param2(_loc5_.getFinisher(param1));
            return;
        }
        var _loc6_: NewLazyFileCollectionLoader;
        if ((_loc6_ = this._lazyLoaderObjects[param1] as NewLazyFileCollectionLoader) != null) {
            _loc6_.addCompleteCallback(param2);
            _loc6_.addErrorCallback(param3);
            if (!_loc6_.inProgress) {
                _loc6_.load();
            }
        } else {
            (_loc7_ = new NewLazyFileCollectionLoader(param1, param2, param3, _loc5_, this.onRemoveNewLazyFileCollectionLoaderCallback)).load();
            this._lazyLoaderObjects[_loc7_] = _loc7_;
        }
    }

    private function onRemoveNewLazyFileCollectionLoaderCallback(param1: NewLazyFileCollectionLoader): void {
        delete this._lazyLoaderObjects[param1];
    }

    public function getLib(param1: String, param2: String = "GAME"): class_38 {
        var _loc3_: class_66 = this.getFileCollectionByInstanceName(param2);
        return _loc3_.getFinisher(param1) as class_38;
    }

    public function clearFileCollection(param1: String): void {
        var _loc2_: class_66 = this.getFileCollectionByInstanceName(param1);
        if (_loc2_) {
            _loc2_.method_34();
        }
    }

    public function loadAndCall(param1: String, param2: Function, param3: Array, param4: String = "GAME", param5: int = 0): void {
        var time: int = 0;
        var resKey: String = param1;
        var call: Function = param2;
        var callArgs: Array = param3;
        var instanceName: String = param4;
        var maxdelay: int = param5;
        time = maxdelay > 0 ? getTimer() : 0;
        this.lazyLoad(resKey, function (param1: class_38): void {
            if (maxdelay == 0 || getTimer() - time < maxdelay) {
                call.apply(undefined, callArgs);
            }
        }, null, instanceName);
    }

    public function addBitmapAtlas(param1: String, param2: class_968): void {
        this._bitmapAtlases[param1] = param2;
    }

    public function getBitmapDataFromAtlas(param1: String, param2: String): BitmapData {
        var _loc3_: class_968 = this.getBitmapAtlasById(param2);
        return _loc3_.method_4093(param1);
    }

    public function getBitmapAtlasById(param1: String): class_968 {
        return this._bitmapAtlases[param1] as class_968;
    }

    public function loaderExternal(param1: String, param2: Function): void {
        this._externalLoader.load(param1, param2);
    }

    public function cleanupExternalLoader(): void {
        this._externalLoader.cleanup();
    }

    public function addToPreloadList(param1: String, param2: Boolean = false): void {
        if (this._loadingQueueRunning) {
            if (param2) {
                this._loadingQueue.push(param1);
            } else {
                this._loadingQueue.unshift(param1);
            }
        } else {
            this._loadingQueueRunning = true;
            this.lazyLoad(param1, this.assetQueueHandelLoaded, this.assetQueueHandelFailed);
        }
    }

    private function assetQueueHandelFailed(param1: Object): void {
        this.continueLoading();
    }

    private function assetQueueHandelLoaded(param1: class_38): void {
        this.continueLoading();
    }

    private function continueLoading(): void {
        if (this._loadingQueue.length > 0) {
            this.lazyLoad(this._loadingQueue.pop(), this.assetQueueHandelLoaded);
        } else {
            this._loadingQueueRunning = false;
        }
    }

    public function getDisplayObject(param1: String, param2: String, param3: String = "GAME"): DisplayObject {
        var _loc6_: * = null;
        var _loc4_: class_39;
        if (!(_loc4_ = this.getLib(param1, param3) as class_39)) {
            return null;
        }
        var _loc5_: Object;
        if ((_loc5_ = _loc4_.method_2545(param2)) is BitmapData) {
            _loc6_ = new Bitmap(_loc5_ as BitmapData);
        } else {
            _loc6_ = _loc5_ as DisplayObject;
        }
        return _loc6_;
    }
}
}
