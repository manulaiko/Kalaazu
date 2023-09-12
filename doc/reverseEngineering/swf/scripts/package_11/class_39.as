package package_11 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.media.Sound;
import flash.system.LoaderContext;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.filecollection.getDefinitionNames;

import package_23.FileCollectionEvent;

public class class_39 extends class_38 {


    protected var loader: Loader;

    private var var_3059: Dictionary;

    public function class_39() {
        this.var_3059 = new Dictionary();
        super();
    }

    override protected function start(): void {
        var lc: LoaderContext = null;
        try {
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.INIT, this.onInit);
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleLoadComplete);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onError);
            lc = new LoaderContext();
            lc.allowCodeImport = true;
            this.loader.loadBytes(_data, lc);
        } catch (e: Error) {
        }
    }

    override protected function method_982(): void {
        if (this.loader) {
            this.loader.contentLoaderInfo.removeEventListener(Event.INIT, this.onInit);
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.handleLoadComplete);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onError);
            this.loader.unloadAndStop(true);
            this.loader = null;
        }
    }

    private function onInit(param1: Event): void {
    }

    private function onError(param1: IOErrorEvent): void {
    }

    protected function handleLoadComplete(param1: Event): void {
        method_206();
        this.stopAnimation(this.loader.content);
    }

    private function stopAnimation(param1: DisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (param1 is DisplayObjectContainer) {
            if (param1 is MovieClip) {
                (param1 as MovieClip).stop();
            }
            _loc2_ = param1 as DisplayObjectContainer;
            _loc3_ = 0;
            while (_loc3_ < _loc2_.numChildren) {
                if ((_loc4_ = _loc2_.getChildAt(_loc3_) as DisplayObjectContainer) != null) {
                    if (_loc4_ is MovieClip) {
                        (_loc4_ as MovieClip).stop();
                    }
                    if (_loc4_.numChildren > 0) {
                        this.stopAnimation(_loc4_ as DisplayObject);
                    }
                }
                _loc3_++;
            }
        }
    }

    public function getDefinitions(): Array {
        return getDefinitionNames(this.loader.contentLoaderInfo);
    }

    public function method_2079(param1: String): Class {
        return this.loader.contentLoaderInfo.applicationDomain.getDefinition(param1) as Class;
    }

    public function method_74(param1: String, param2: Boolean = false): Sprite {
        return this.method_2545(param1, param2) as Sprite;
    }

    public function method_65(param1: String, param2: Boolean = false): MovieClip {
        return this.method_2545(param1, param2) as MovieClip;
    }

    public function getEmbeddedMovieClip(param1: String, param2: Boolean = false): MovieClip {
        return this.method_2545(param1, param2) as MovieClip;
    }

    public function method_1308(param1: String, param2: Boolean = false): Object {
        var var_903: Object = null;
        var var_4628: Class = null;
        var var_102: String = param1;
        var var_4165: Boolean = param2;
        if (var_4165) {
            var_903 = this.var_3059[var_102];
            if (var_903 != null) {
                return var_903;
            }
        }
        try {
            var_4628 = this.loader.contentLoaderInfo.applicationDomain.getDefinition(var_102) as Class;
        } catch (error: Error) {
            method_484(var_102);
        }
        if (var_4165) {
            var_903 = new var_4628() as Object;
            this.var_3059[var_102] = var_903;
        } else {
            var_903 = new var_4628() as Object;
        }
        return var_903;
    }

    public function method_2545(param1: String, param2: Boolean = false): Object {
        var var_903: Object = null;
        var var_4628: Class = null;
        var var_102: String = param1;
        var var_4165: Boolean = param2;
        if (var_4165) {
            var_903 = this.var_3059[var_102];
            if (var_903 != null) {
                return var_903;
            }
        }
        try {
            var_4628 = this.loader.contentLoaderInfo.applicationDomain.getDefinition(var_102) as Class;
        } catch (error: Error) {
            method_484(var_102);
        }
        if (var_4165) {
            var_903 = new var_4628() as Object;
            this.var_3059[var_102] = var_903;
        } else {
            var_903 = new var_4628() as Object;
        }
        return var_903;
    }

    private function method_484(param1: String): void {
        var _loc2_: FileCollectionEvent = new FileCollectionEvent(FileCollectionEvent.EMBEDDED_OBJECT_NOT_FOUND);
        var _loc3_: * = "embeded object \'" + param1 + "\' not found in \'" + name_58.id + "\'";
        _loc2_.text = _loc3_;
        dispatchEvent(_loc2_);
        throw new Error(_loc3_);
    }

    public function method_1040(param1: String, param2: Boolean = false): BitmapData {
        var var_903: Object = null;
        var var_4628: Class = null;
        var var_102: String = param1;
        var var_4165: Boolean = param2;
        if (var_4165) {
            var_903 = this.var_3059[var_102];
            if (var_903 != null) {
                return BitmapData(var_903);
            }
        }
        try {
            var_4628 = this.loader.contentLoaderInfo.applicationDomain.getDefinition(var_102) as Class;
        } catch (error: Error) {
            method_484(var_102);
        }
        if (var_4165) {
            var_903 = new var_4628(0, 0);
            this.var_3059[var_102] = var_903;
        } else {
            var_903 = new var_4628(0, 0);
        }
        return BitmapData(var_903);
    }

    public function getEmbeddedBitmapData(param1: String, param2: Boolean = false): BitmapData {
        var cachedReadonlyObject: Object = null;
        var classRef: Class = null;
        var id: String = param1;
        var readOnly: Boolean = param2;
        if (readOnly) {
            cachedReadonlyObject = this.var_3059[id];
            if (cachedReadonlyObject != null) {
                return BitmapData(cachedReadonlyObject);
            }
        }
        try {
            classRef = this.loader.contentLoaderInfo.applicationDomain.getDefinition(id) as Class;
        } catch (error: Error) {
            method_484(id);
        }
        if (readOnly) {
            cachedReadonlyObject = new classRef(0, 0);
            this.var_3059[id] = cachedReadonlyObject;
        } else {
            cachedReadonlyObject = new classRef(0, 0);
        }
        return BitmapData(cachedReadonlyObject);
    }

    public function method_3642(param1: String): Sound {
        var var_4628: Class = null;
        var var_102: String = param1;
        try {
            var_4628 = this.loader.contentLoaderInfo.applicationDomain.getDefinition(var_102) as Class;
        } catch (error: Error) {
            method_484(var_102);
        }
        return new var_4628();
    }

    public function getEmbeddedSound(param1: String): Sound {
        var classRef: Class = null;
        var id: String = param1;
        try {
            classRef = this.loader.contentLoaderInfo.applicationDomain.getDefinition(id) as Class;
        } catch (error: Error) {
            method_484(id);
        }
        return new classRef();
    }

    public function getAsDisplayObject(): DisplayObject {
        return this.loader.content;
    }

    public function method_5278(param1: String, param2: Boolean = false): Bitmap {
        return new Bitmap(this.getEmbeddedBitmapData(param1, param2));
    }

    public function getEmbeddedBitmap(param1: String, param2: Boolean = false): Bitmap {
        return new Bitmap(this.getEmbeddedBitmapData(param1, param2));
    }

    private function method_5884(param1: DisplayObject): void {
        var _loc2_: TextField = new TextField();
        _loc2_.selectable = false;
        _loc2_.background = true;
        _loc2_.backgroundColor = 7829367;
        _loc2_.autoSize = TextFieldAutoSize.LEFT;
        _loc2_.multiline = false;
        _loc2_.text = "undefined:undefined";
        _loc2_.setTextFormat(new TextFormat("Verdana", 10, 16777215, true));
        _loc2_.y = DisplayObjectContainer(param1).height;
        DisplayObjectContainer(param1).addChild(_loc2_);
    }

    public function hasEmbeddedObject(param1: String): Boolean {
        var classRef: Class = null;
        var id: String = param1;
        try {
            classRef = this.loader.contentLoaderInfo.applicationDomain.getDefinition(id) as Class;
        } catch (error: Error) {
            return false;
        }
        return true;
    }
}
}
