package starling.textures {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.display3D.Context3DTextureFormat;
import flash.display3D.textures.Texture;
import flash.display3D.textures.TextureBase;
import flash.geom.Rectangle;
import flash.system.Capabilities;
import flash.utils.ByteArray;
import flash.utils.getQualifiedClassName;

import starling.core.Starling;
import starling.errors.AbstractClassError;
import starling.errors.MissingContextError;
import starling.utils.Color;
import starling.utils.VertexData;
import starling.utils.getNextPowerOfTwo;

public class Texture {


    public function Texture() {
        super();
        if (false && getQualifiedClassName(this) == "starling.textures::Texture") {
            throw new AbstractClassError();
        }
    }

    public static function fromData(param1: Object, param2: TextureOptions = null): starling.textures.Texture {
        var _loc3_: * = null;
        if (param1 is Bitmap) {
            param1 = (param1 as Bitmap).bitmapData;
        }
        if (param2 == null) {
            param2 = new TextureOptions();
        }
        if (param1 is Class) {
            _loc3_ = fromEmbeddedAsset(param1 as Class, param2.mipMapping, param2.optimizeForRenderToTexture, param2.scale, param2.format, param2.repeat);
        } else if (param1 is BitmapData) {
            _loc3_ = fromBitmapData(param1 as BitmapData, param2.mipMapping, param2.optimizeForRenderToTexture, param2.scale, param2.format, param2.repeat);
        } else {
            if (!(param1 is ByteArray)) {
                throw new ArgumentError("Unsupported \'data\' type: " + getQualifiedClassName(param1));
            }
            _loc3_ = fromAtfData(param1 as ByteArray, param2.scale, param2.mipMapping, param2.onReady, param2.repeat);
        }
        return _loc3_;
    }

    public static function fromEmbeddedAsset(param1: Class, param2: Boolean = true, param3: Boolean = false, param4: Number = 1, param5: String = "bgra", param6: Boolean = false): starling.textures.Texture {
        var texture: starling.textures.Texture = null;
        var assetClass: Class = param1;
        var mipMapping: Boolean = param2;
        var optimizeForRenderToTexture: Boolean = param3;
        var scale: Number = param4;
        var format: String = param5;
        var repeat: Boolean = param6;
        var asset: Object = new assetClass();
        if (asset is Bitmap) {
            texture = starling.textures.Texture.fromBitmap(asset as Bitmap, mipMapping, false, scale, format, repeat);
            texture.root.onRestore = function (): void {
                texture.root.uploadBitmap(new assetClass());
            };
        } else {
            if (!(asset is ByteArray)) {
                throw new ArgumentError("Invalid asset type: " + getQualifiedClassName(asset));
            }
            texture = starling.textures.Texture.fromAtfData(asset as ByteArray, scale, mipMapping, null, repeat);
            texture.root.onRestore = function (): void {
                texture.root.uploadAtfData(new assetClass());
            };
        }
        asset = null;
        return texture;
    }

    public static function fromBitmap(param1: Bitmap, param2: Boolean = true, param3: Boolean = false, param4: Number = 1, param5: String = "bgra", param6: Boolean = false): starling.textures.Texture {
        return fromBitmapData(param1.bitmapData, param2, param3, param4, param5, param6);
    }

    public static function fromBitmapData(param1: BitmapData, param2: Boolean = true, param3: Boolean = false, param4: Number = 1, param5: String = "bgra", param6: Boolean = false): starling.textures.Texture {
        var texture: starling.textures.Texture = null;
        var data: BitmapData = param1;
        var generateMipMaps: Boolean = param2;
        var optimizeForRenderToTexture: Boolean = param3;
        var scale: Number = param4;
        var format: String = param5;
        var repeat: Boolean = param6;
        texture = starling.textures.Texture.empty(data.width / scale, data.height / scale, true, generateMipMaps, optimizeForRenderToTexture, scale, format, repeat);
        texture.root.uploadBitmapData(data);
        texture.root.onRestore = function (): void {
            texture.root.uploadBitmapData(data);
        };
        return texture;
    }

    public static function fromAtfData(param1: ByteArray, param2: Number = 1, param3: Boolean = true, param4: Function = null, param5: Boolean = false): starling.textures.Texture {
        var atfData: AtfData;
        var nativeTexture: flash.display3D.textures.Texture;
        var concreteTexture: ConcreteTexture = null;
        var data: ByteArray = param1;
        var scale: Number = param2;
        var useMipMaps: Boolean = param3;
        var async: Function = param4;
        var repeat: Boolean = param5;
        var context: Context3D = Starling.context;
        if (context == null) {
            throw new MissingContextError();
        }
        atfData = new AtfData(data);
        nativeTexture = context.createTexture(atfData.width, atfData.height, atfData.format, false);
        concreteTexture = new ConcreteTexture(nativeTexture, atfData.format, atfData.width, atfData.height, useMipMaps && atfData.numTextures > 1, false, false, scale, repeat);
        concreteTexture.uploadAtfData(data, 0, async);
        concreteTexture.onRestore = function (): void {
            concreteTexture.uploadAtfData(data, 0);
        };
        return concreteTexture;
    }

    public static function fromColor(param1: Number, param2: Number, param3: uint = 4294967295, param4: Boolean = false, param5: Number = -1, param6: String = "bgra"): starling.textures.Texture {
        var texture: starling.textures.Texture = null;
        var width: Number = param1;
        var height: Number = param2;
        var color: uint = param3;
        var optimizeForRenderToTexture: Boolean = param4;
        var scale: Number = param5;
        var format: String = param6;
        texture = starling.textures.Texture.empty(width, height, true, false, optimizeForRenderToTexture, scale, format);
        texture.root.clear(color, Color.getAlpha(color) / 255);
        texture.root.onRestore = function (): void {
            texture.root.clear(color, Color.getAlpha(color) / 255);
        };
        return texture;
    }

    public static function empty(param1: Number, param2: Number, param3: Boolean = true, param4: Boolean = true, param5: Boolean = false, param6: Number = -1, param7: String = "bgra", param8: Boolean = false): starling.textures.Texture {
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        if (param6 <= 0) {
            param6 = 0;
        }
        var _loc12_: Context3D;
        if ((_loc12_ = Starling.context) == null) {
            throw new MissingContextError();
        }
        var _loc13_: int = param1 * param6;
        var _loc14_: int = param2 * param6;
        var _loc15_: int = getNextPowerOfTwo(_loc13_);
        var _loc16_: int = getNextPowerOfTwo(_loc14_);
        var _loc17_: Boolean = _loc13_ == _loc15_ && _loc14_ == _loc16_;
        var _loc18_: Boolean;
        if (_loc18_ = !param4 && !param8 && Starling.current.profile != "baselineConstrained" && "createRectangleTexture" in _loc12_ && param7.indexOf("compressed") == -1) {
            _loc9_ = _loc13_;
            _loc10_ = _loc14_;
            _loc11_ = _loc12_["createRectangleTexture"](_loc9_, _loc10_, param7, param5);
        } else {
            _loc9_ = _loc15_;
            _loc10_ = _loc16_;
            _loc11_ = _loc12_.createTexture(_loc9_, _loc10_, param7, param5);
        }
        var _loc19_: ConcreteTexture = new ConcreteTexture(_loc11_, param7, _loc9_, _loc10_, param4, param3, param5, param6, param8);
        _loc19_.onRestore = _loc19_.clear;
        if (_loc17_ || _loc18_) {
            return _loc19_;
        }
        return new SubTexture(_loc19_, new Rectangle(0, 0, param1, param2), true);
    }

    public static function fromTexture(param1: starling.textures.Texture, param2: Rectangle = null, param3: Rectangle = null, param4: Boolean = false): starling.textures.Texture {
        return new SubTexture(param1, param2, false, param3, param4);
    }

    public function dispose(): void {
    }

    public function adjustVertexData(param1: VertexData, param2: int, param3: int): void {
    }

    public function adjustTexCoords(param1: Vector.<Number>, param2: int = 0, param3: int = 0, param4: int = -1): void {
    }

    public function get frame(): Rectangle {
        return null;
    }

    public function get repeat(): Boolean {
        return false;
    }

    public function get width(): Number {
        return 0;
    }

    public function get height(): Number {
        return 0;
    }

    public function get nativeWidth(): Number {
        return 0;
    }

    public function get nativeHeight(): Number {
        return 0;
    }

    public function get scale(): Number {
        return 1;
    }

    public function get base(): TextureBase {
        return null;
    }

    public function get root(): ConcreteTexture {
        return null;
    }

    public function get format(): String {
        return Context3DTextureFormat.BGRA;
    }

    public function get mipMapping(): Boolean {
        return false;
    }

    public function get premultipliedAlpha(): Boolean {
        return false;
    }
}
}
