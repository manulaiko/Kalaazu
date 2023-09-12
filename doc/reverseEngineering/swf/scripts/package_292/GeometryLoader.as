package package_292 {

import away3d.animators.class_2121;
import away3d.library.AssetLibrary;

import flash.utils.ByteArray;

import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;

import package_19.class_1199;

import package_200.Settings3D;

import package_295.class_1752;

import package_304.class_2104;
import package_304.class_2114;

import package_366.OBJParser;
import package_366.class_2122;

public class GeometryLoader extends class_1747 {

    {
        AssetLibrary.method_605(class_2122);
        AssetLibrary.method_605(OBJParser);
    }

    public function GeometryLoader() {
        super(this.method_4383, 5);
    }

    public static function method_4218(param1: class_1752): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (param1 is class_2104) {
            _loc3_ = param1 as class_2104;
            for each(_loc4_ in _loc3_.method_3953) {
                method_4218(_loc4_);
            }
        }
        if (param1 is class_2114) {
            if ((_loc5_ = param1 as class_2114).geometry) {
                _loc5_.geometry.dispose();
            }
            if (_loc5_.material) {
                _loc5_.material.dispose();
            }
            if (_loc5_.animator) {
                if (_loc5_.animator is class_2121) {
                    class_2121(_loc5_.animator).disposeAsset();
                } else {
                    _loc5_.animator.dispose();
                }
            }
        }
        param1.dispose();
        var _loc2_: int = param1.numChildren - 1;
        while (_loc2_ >= 0) {
            method_4218(param1.getChildAt(_loc2_));
            _loc2_--;
        }
    }

    override public function reset(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for (_loc2_ in const_2355) {
            _loc3_ = const_2355[_loc2_];
            if (_loc3_.lifetime <= param1) {
                _loc3_.dispose();
                const_2355[_loc2_] = null;
                delete const_2355[_loc2_];
            }
        }
        super.reset(param1);
    }

    public function method_3479(param1: String, param2: uint, param3: class_66 = null): class_1199 {
        var _loc4_: SingleGeometryLoader;
        if ((_loc4_ = const_2355[param1] as SingleGeometryLoader) == null || Boolean(Settings3D.const_2581.value)) {
            const_2355[param1] = _loc4_ = new SingleGeometryLoader(param1, param3 || class_1210.instance.name_15);
            _loc4_.load();
        }
        _loc4_.lifetime = Math.max(_loc4_.lifetime, param2);
        return _loc4_.ready;
    }

    public function method_798(param1: ByteArray): class_1199 {
        var _loc2_: SingleGeometryLoader = new SingleGeometryLoader(null, null);
        _loc2_.loadData(param1);
        return _loc2_.ready;
    }

    public function method_1440(param1: class_1752): void {
        method_1708(param1);
    }

    public function method_1645(param1: class_1752): void {
        method_5039(param1);
    }

    private function method_4383(param1: class_1752): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for (_loc2_ in const_2355) {
            _loc3_ = const_2355[_loc2_];
            if (_loc3_.content == param1 && _loc3_.lifetime <= class_1210.const_973) {
                _loc3_.dispose();
                const_2355[_loc2_] = null;
                delete const_2355[_loc2_];
                return;
            }
        }
    }
}
}

import flash.net.URLRequest;

import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;

import package_11.class_261;

import package_17.class_62;

import package_19.class_1199;

import package_199.LoaderEvent;

import package_292.GeometryLoader;

import package_295.class_1752;

import package_367.class_2107;

class SingleGeometryLoader {


    public const ready: class_1199 = new class_1199(class_1752);

    public var lifetime: uint = 0;

    private var _resKey: String;

    private var _loader: class_2107;

    private var _content: class_1752;

    private var _fileCollection: class_66;

    function SingleGeometryLoader(param1: String, param2: class_66) {
        super();
        this._resKey = param1;
        this._fileCollection = param2;
    }

    public function load(): void {
        this._fileCollection.load(this._resKey, this.handleBytesLoadComplete, this.handleBytesLoadComplete);
    }

    public function loadData(param1: *): void {
        this.dispose();
        this._loader = new class_2107(false);
        this._loader.addEventListener(LoaderEvent.const_2719, this.handleLoadComplete);
        this._loader.addEventListener(LoaderEvent.LOAD_ERROR, this.handleLoadError);
        if (param1 is String) {
            this._loader.load(new URLRequest(param1 as String));
        } else {
            this._loader.loadData(param1);
        }
    }

    public function dispose(): void {
        if (this._loader) {
            this._loader.removeEventListener(LoaderEvent.const_2719, this.handleLoadComplete);
            this._loader.removeEventListener(LoaderEvent.LOAD_ERROR, this.handleLoadError);
            this._loader.dispose();
            this._loader = null;
        }
        if (this._content) {
            GeometryLoader.method_4218(this._content);
            this._content = null;
        }
    }

    public function get content(): class_1752 {
        return this._content;
    }

    public function get resKey(): String {
        return this._resKey;
    }

    private function handleBytesLoadComplete(param1: class_261): void {
        if (param1) {
            this.loadData(param1.data);
            class_62.getInstance().method_2407(AssetNotifications.ADD_UNLOAD_FINISHER, param1);
            param1.dispose();
        } else {
            this.ready.dispatch(null);
        }
    }

    private function handleLoadComplete(param1: LoaderEvent): void {
        this._content = param1.target as class_1752;
        this.ready.dispatch(this._content);
    }

    private function handleLoadError(param1: LoaderEvent): void {
        this.ready.dispatch(null);
    }
}
