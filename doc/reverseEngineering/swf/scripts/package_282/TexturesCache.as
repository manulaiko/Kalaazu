package package_282 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import package_28.EventStreamClient;

import starling.textures.Texture;

public class TexturesCache {

    private static const const_885: Dictionary = new Dictionary(true);

    private static var EMPTY: Texture;


    public function TexturesCache() {
        super();
    }

    public static function getTexture(param1: *, param2: Rectangle = null): Texture {
        if (param1 == null) {
            var _loc4_: * = EMPTY || Texture.empty(8, 8);
            EMPTY = EMPTY || Texture.empty(8, 8);
            return _loc4_;
        }
        var _loc3_: Texture = const_885[param1] as Texture;
        if (_loc3_ == null) {
            _loc3_ = Texture.fromData(param1);
            const_885[param1] = _loc3_;
        }
        if (param2) {
            param2 = param2.clone();
            param2.left = Math.max(param2.left, 0);
            param2.right = Math.min(param2.right, _loc3_.width);
            param2.top = Math.max(param2.top, 0);
            param2.bottom = Math.min(param2.bottom, _loc3_.height);
            _loc3_ = Texture.fromTexture(_loc3_, param2);
        }
        return _loc3_;
    }

    public static function cleanup(): void {
        var _loc1_: * = null;
        var _loc2_: * = undefined;
        for (_loc2_ in const_885) {
            _loc1_ = const_885[_loc2_];
            _loc1_.dispose();
            _loc1_.root.dispose();
            const_885[_loc2_] = null;
            delete const_885[_loc2_];
        }
    }

    public static function method_1424(param1: Texture, param2: Object): void {
        var var_4721: Texture = param1;
        var var_2412: Object = param2;
        if (var_4721 == null || var_2412 == null) {
            return;
        }
        if (var_2412 is Bitmap) {
            var_2412 = (var_2412 as Bitmap).bitmapData;
        }
        if (var_2412 is Class) {
            var_2412 = new var_2412();
        }
        try {
            if (var_2412 is BitmapData) {
                var_4721.root.uploadBitmapData(var_2412 as BitmapData);
            } else if (var_2412 is ByteArray) {
                var_4721.root.uploadAtfData(var_2412 as ByteArray, 0);
            }
        } catch (e: Error) {
            EventStreamClient.track("flash.warning", {
                "message": "TexturesCache.reupload failed",
                "errorMessage": e.message,
                "errorID": e.errorID
            });
        }
    }
}
}
