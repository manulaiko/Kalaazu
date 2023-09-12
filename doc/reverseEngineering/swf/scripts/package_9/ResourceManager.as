package package_9 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.media.Sound;
import flash.utils.getTimer;

import net.bigpoint.as3toolbox.filecollection.class_66;

import package_11.class_38;
import package_11.class_39;
import package_11.class_65;

import package_18.class_64;

public class ResourceManager {

    public static var name_15: class_66;

    private static const MAX_TRIES: int = 4;

    private static var var_4017: Array = [];

    private static var var_825: Array = [];


    public function ResourceManager() {
        super();
    }

    public static function method_6428(param1: String): void {
        var_4017[param1] = null;
    }

    public static function loadAndCall(param1: String, param2: Function, param3: Array, param4: int = 0): void {
        var time: int = 0;
        var resKey: String = param1;
        var call: Function = param2;
        var callArgs: Array = param3;
        var maxdelay: int = param4;
        time = maxdelay > 0 ? getTimer() : 0;
        name_15.load(resKey, function (param1: class_38): void {
            if (maxdelay == 0 || getTimer() - time < maxdelay) {
                call.apply(undefined, callArgs);
            }
        }, null);
    }

    public static function init(param1: class_66): void {
        name_15 = param1;
    }

    public static function getDisplayObject(param1: String, param2: String): DisplayObject {
        var _loc3_: class_39 = class_39(name_15.getFinisher(param1));
        if (_loc3_.hasEmbeddedObject(param2)) {
            return _loc3_.getEmbeddedMovieClip(param2) || _loc3_.getEmbeddedBitmap(param2);
        }
        return null;
    }

    public static function getMovieClip(param1: String, param2: String): MovieClip {
        if (class_39(name_15.getFinisher(param1)).hasEmbeddedObject(param2)) {
            return class_39(name_15.getFinisher(param1)).getEmbeddedMovieClip(param2);
        }
        return null;
    }

    public static function getBitmap(param1: String, param2: String): Bitmap {
        return class_39(name_15.getFinisher(param1)).getEmbeddedBitmap(param2);
    }

    public static function getBitmapData(param1: String, param2: String): BitmapData {
        return class_39(name_15.getFinisher(param1)).getEmbeddedBitmapData(param2);
    }

    public static function getSound(param1: String, param2: String): Sound {
        var _loc3_: class_39 = name_15.getFinisher(param1) as class_39;
        if (Boolean(_loc3_) && Boolean(_loc3_.hasEmbeddedObject(param2))) {
            return _loc3_.getEmbeddedSound(param2);
        }
        return null;
    }

    public static function getImage(param1: String): DisplayObject {
        return class_65(name_15.getFinisher(param1)).getBitmap();
    }

    public static function method_1412(param1: String, param2: Function, param3: Function): void {
        var _loc5_: * = null;
        if (name_15.isLoaded(param1)) {
            param2(name_15.getFinisher(param1));
            return;
        }
        var _loc4_: class_64;
        if ((_loc4_ = var_4017[param1] as class_64) != null) {
            _loc4_.addCompleteCallback(param2);
            _loc4_.addErrorCallback(param3);
            if (!_loc4_.inProgress) {
                _loc4_.load();
            }
        } else {
            if (false && var_825[param1] > MAX_TRIES) {
                return;
            }
            (_loc5_ = new class_64(param1, param2, param3)).load();
            var_4017[param1] = _loc5_;
            if (true) {
                var_825[param1] = 1;
            } else {
                var_825[param1] = NaN;
            }
        }
    }

    public static function isLoaded(param1: String): Boolean {
        var _loc2_: class_38 = name_15.getFinisher(param1);
        return !!_loc2_ ? Boolean(_loc2_.isFinished) : false;
    }
}
}
