package starling.textures {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.display3D.textures.Texture;
import flash.display3D.textures.TextureBase;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.core.starling_internal;
import starling.errors.MissingContextError;
import starling.events.Event;
import starling.utils.Color;

public class ConcreteTexture extends starling.textures.Texture {

    private static var sOrigin: Point = new Point();


    private var mBase: TextureBase;

    private var mFormat: String;

    private var mWidth: int;

    private var mHeight: int;

    private var mMipMapping: Boolean;

    private var mPremultipliedAlpha: Boolean;

    private var mOptimizedForRenderTexture: Boolean;

    private var mScale: Number;

    private var mRepeat: Boolean;

    private var mOnRestore: Function;

    private var mDataUploaded: Boolean;

    public function ConcreteTexture(param1: TextureBase, param2: String, param3: int, param4: int, param5: Boolean, param6: Boolean, param7: Boolean = false, param8: Number = 1, param9: Boolean = false) {
        super();
        this.mScale = param8 <= 0 ? 1 : param8;
        this.mBase = param1;
        this.mFormat = param2;
        this.mWidth = param3;
        this.mHeight = param4;
        this.mMipMapping = param5;
        this.mPremultipliedAlpha = param6;
        this.mOptimizedForRenderTexture = param7;
        this.mRepeat = param9;
        this.mOnRestore = null;
        this.mDataUploaded = false;
    }

    override public function dispose(): void {
        if (this.mBase) {
            this.mBase.dispose();
        }
        this.onRestore = null;
        super.dispose();
    }

    public function uploadBitmap(param1: Bitmap): void {
        this.uploadBitmapData(param1.bitmapData);
    }

    public function uploadBitmapData(param1: BitmapData): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = 0;
        var _loc5_: * = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        if (param1.width != this.mWidth || param1.height != this.mHeight) {
            _loc2_ = new BitmapData(this.mWidth, this.mHeight, true, 0);
            _loc2_.copyPixels(param1, param1.rect, sOrigin);
            param1 = _loc2_;
        }
        if (this.mBase is flash.display3D.textures.Texture) {
            _loc3_ = this.mBase as flash.display3D.textures.Texture;
            _loc3_.uploadFromBitmapData(param1);
            if (this.mMipMapping && param1.width > 1 && param1.height > 1) {
                _loc4_ = param1.width >> 1;
                _loc5_ = param1.height >> 1;
                _loc6_ = 1;
                _loc7_ = new BitmapData(_loc4_, _loc5_, true, 0);
                _loc8_ = new Matrix(0.5, 0, 0, 0.5);
                _loc9_ = new Rectangle();
                while (_loc4_ >= 1 || _loc5_ >= 1) {
                    _loc9_.width = _loc4_;
                    _loc9_.height = _loc5_;
                    _loc7_.fillRect(_loc9_, 0);
                    _loc7_.draw(param1, _loc8_, null, null, null, true);
                    _loc3_.uploadFromBitmapData(_loc7_, _loc6_++);
                    _loc8_.scale(0.5, 0.5);
                    _loc4_ >>= 1;
                    _loc5_ >>= 1;
                }
                _loc7_.dispose();
            }
        } else {
            this.mBase["uploadFromBitmapData"](param1);
        }
        if (_loc2_) {
            _loc2_.dispose();
        }
        this.mDataUploaded = true;
    }

    public function uploadAtfData(param1: ByteArray, param2: int = 0, param3: * = null): void {
        var eventType: String = null;
        var self: ConcreteTexture = null;
        var potTexture: flash.display3D.textures.Texture = null;
        var onTextureReady: Function = null;
        var data: ByteArray = param1;
        var offset: int = param2;
        var async: * = param3;
        onTextureReady = function (param1: Object): void {
            potTexture.removeEventListener(eventType, onTextureReady);
            var _loc2_: Function = async as Function;
            if (_loc2_ != null) {
                if (_loc2_.length == 1) {
                    _loc2_(self);
                } else {
                    _loc2_();
                }
            }
        };
        eventType = "textureReady";
        self = {};
        var isAsync: Boolean = async is Function || async === true;
        potTexture = this.mBase as flash.display3D.textures.Texture;
        if (potTexture == null) {
            throw new Error("This texture type does not support ATF data");
        }
        if (async is Function) {
            potTexture.addEventListener(eventType, onTextureReady);
        }
        potTexture.uploadCompressedTextureFromByteArray(data, offset, isAsync);
        this.mDataUploaded = true;
    }

    private function onContextCreated(): void {
        this.starling_internal::createBase();
        this.mOnRestore();
        if (!this.mDataUploaded) {
            this.clear();
        }
    }

    starling_internal function createBase(): void {
        var _loc1_: Context3D = Starling.context;
        if (this.mBase is flash.display3D.textures.Texture) {
            this.mBase = _loc1_.createTexture(this.mWidth, this.mHeight, this.mFormat, this.mOptimizedForRenderTexture);
        } else {
            this.mBase = _loc1_["createRectangleTexture"](this.mWidth, this.mHeight, this.mFormat, this.mOptimizedForRenderTexture);
        }
        this.mDataUploaded = false;
    }

    public function clear(param1: uint = 0, param2: Number = 0): void {
        var _loc3_: Context3D = Starling.context;
        if (_loc3_ == null) {
            throw new MissingContextError();
        }
        if (this.mPremultipliedAlpha && param2 < 1) {
            param1 = Color.rgb(Color.getRed(param1) * param2, Color.getGreen(param1) * param2, Color.getBlue(param1) * param2);
        }
        _loc3_.setRenderToTexture(this.mBase);
        try {
            RenderSupport.clear(param1, param2);
        } catch (e: Error) {
        }
        _loc3_.setRenderToBackBuffer();
        this.mDataUploaded = true;
    }

    public function get optimizedForRenderTexture(): Boolean {
        return this.mOptimizedForRenderTexture;
    }

    public function get onRestore(): Function {
        return this.mOnRestore;
    }

    public function set onRestore(param1: Function): void {
        Starling.current.removeEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated);
        if (false && param1 != null) {
            this.mOnRestore = param1;
            Starling.current.addEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated);
        } else {
            this.mOnRestore = null;
        }
    }

    override public function get base(): TextureBase {
        return this.mBase;
    }

    override public function get root(): ConcreteTexture {
        return this;
    }

    override public function get format(): String {
        return this.mFormat;
    }

    override public function get width(): Number {
        return this.mWidth / this.mScale;
    }

    override public function get height(): Number {
        return this.mHeight / this.mScale;
    }

    override public function get nativeWidth(): Number {
        return this.mWidth;
    }

    override public function get nativeHeight(): Number {
        return this.mHeight;
    }

    override public function get scale(): Number {
        return this.mScale;
    }

    override public function get mipMapping(): Boolean {
        return this.mMipMapping;
    }

    override public function get premultipliedAlpha(): Boolean {
        return this.mPremultipliedAlpha;
    }

    override public function get repeat(): Boolean {
        return this.mRepeat;
    }
}
}
