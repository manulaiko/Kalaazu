package net.bigpoint.darkorbit.fui.builder.xml.creators {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;

public class FlashRelatedDisplayObjectCreator extends AbstractCreator {


    protected var flashObjectsMap: Dictionary;

    public function FlashRelatedDisplayObjectCreator() {
        super();
        this.initMapping();
    }

    protected function initMapping(): void {
        this.flashObjectsMap = new Dictionary();
        this.flashObjectsMap["sprite"] = {
            "clazz": Sprite,
            "create": this.createSpriteInstance
        };
        this.flashObjectsMap["movieclip"] = {
            "clazz": MovieClip,
            "create": this.createMovieclipInstance
        };
        this.flashObjectsMap["textfield"] = {
            "clazz": TextField,
            "create": this.createTextField
        };
        this.flashObjectsMap["bitmap"] = {
            "clazz": Bitmap,
            "create": this.createBitmap
        };
        this.flashObjectsMap["bitmapdta"] = {
            "clazz": BitmapData,
            "create": this.createBitmapData
        };
    }

    public function create(param1: XML): DisplayObject {
        var _loc2_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: String = String(param1.name()).toLowerCase();
        var _loc5_: Class;
        var _loc4_: Object;
        if ((_loc5_ = (_loc4_ = this.flashObjectsMap[_loc3_]).clazz) != null) {
            _loc6_ = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARY);
            _loc7_ = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARYID);
            _loc8_ = _loc4_.create;
            if (Boolean(_loc6_) && Boolean(_loc7_) && _loc8_ != null) {
                _loc2_ = _loc8_(_loc6_, _loc7_);
                delete param1[AbstractCreator.ATTRIBUTENAME_LIBRARY];
                delete param1[AbstractCreator.ATTRIBUTENAME_LIBRARYID];
            } else {
                _loc2_ = new _loc5_();
            }
            mapXMLNodeAttributes(_loc2_, param1);
        } else {
            UISystem.log("A class with the name= {" + _loc3_ + "} doesn´t exist.", UISystem.LOG_LEVEL_WARN);
        }
        return _loc2_;
    }

    private function createMovieclipInstance(param1: String, param2: String): MovieClip {
        return UISystem.getInstance().uiloader.getMovieClip(param1, param2);
    }

    private function createSpriteInstance(param1: String, param2: String): Sprite {
        return UISystem.getInstance().uiloader.getDisplayObject(param1, param2) as Sprite;
    }

    private function createBitmap(param1: String, param2: String): Bitmap {
        return UISystem.getInstance().uiloader.getBitmap(param1, param2) as Bitmap;
    }

    private function createBitmapData(param1: String, param2: String): BitmapData {
        return UISystem.getInstance().uiloader.getBitmapData(param1, param2) as BitmapData;
    }

    private function createTextField(): TextField {
        return null;
    }
}
}
