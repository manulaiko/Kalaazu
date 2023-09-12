package net.bigpoint.darkorbit.fui.system.loader {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.media.Sound;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.system.loader.parser.IUILoaderLibParser;
import net.bigpoint.darkorbit.fui.system.loader.parser.PlainLibraryParser;
import net.bigpoint.darkorbit.fui.system.loader.parser.UILoaderParserConstants;
import net.bigpoint.darkorbit.fui.system.loader.parser.XMLLibraryParser;

public class UISystemLoader implements IUISystemLoader {


    private var _assetLoader: IAssetLoader;

    private var _parserLookup: Dictionary;

    public function UISystemLoader(param1: IAssetLoader = null) {
        this._parserLookup = new Dictionary();
        super();
        this._parserLookup[UILoaderParserConstants.XML] = new XMLLibraryParser();
        this._parserLookup[UILoaderParserConstants.PLAIN] = new PlainLibraryParser();
        if (param1) {
            this._assetLoader = param1;
        }
    }

    public function addParser(param1: String, param2: IUILoaderLibParser): void {
        this._parserLookup[param1] = param2;
    }

    public function loadAndCall(param1: Object, param2: String = "xml", param3: Function = null, param4: Array = null): void {
        var _loc5_: IUILoaderLibParser;
        var _loc6_: Vector.<String> = (_loc5_ = this._parserLookup[param2] as IUILoaderLibParser).parseLibs(param1);
        new LoadHelper(this._assetLoader, _loc6_, param3, param4);
    }

    public function set assetLoader(param1: IAssetLoader): void {
        this._assetLoader = param1;
    }

    public function get assetLoader(): IAssetLoader {
        return this._assetLoader;
    }

    public function loadAsset(param1: String, param2: Function, param3: Function = null): void {
        this._assetLoader.loadAsset(param1, param2, param3);
    }

    public function getBitmap(param1: String, param2: String, param3: String = "GAME"): Bitmap {
        return this._assetLoader.getBitmap(param1, param2, param3);
    }

    public function getBitmapData(param1: String, param2: String, param3: String = "GAME"): BitmapData {
        return this._assetLoader.getBitmapData(param1, param2, param3);
    }

    public function getMovieClip(param1: String, param2: String, param3: String = "GAME"): MovieClip {
        return this._assetLoader.getMovieClip(param1, param2, param3);
    }

    public function getDisplayObject(param1: String, param2: String, param3: String = "GAME"): DisplayObject {
        return this._assetLoader.getDisplayObject(param1, param2, param3);
    }

    public function getSound(param1: String, param2: String, param3: String = "GAME"): Sound {
        return this._assetLoader.getSound(param1, param2, param3);
    }
}
}

import net.bigpoint.darkorbit.fui.system.loader.IAssetLoader;

class LoadHelper {


    private var _assetLoader: IAssetLoader;

    private var _keys: Vector.<String>;

    private var _callback: Function;

    private var _callbackParams: Array;

    private var _loaded: uint = 0;

    function LoadHelper(param1: IAssetLoader, param2: Vector.<String>, param3: Function, param4: Array) {
        super();
        this._callbackParams = param4;
        this._callback = param3;
        this._keys = param2;
        this._assetLoader = param1;
        this._loaded = 0;
        this.loadAll();
    }

    private function loadAll(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this._keys.length) {
            this._assetLoader.loadAsset(this._keys[_loc1_], this.handleLoaded);
            _loc1_++;
        }
    }

    private function handleLoaded(param1: Object): void {
        ++this._loaded;
        if (this._loaded == this._keys.length) {
            this._callback.apply(null, this._callbackParams);
        }
    }
}
