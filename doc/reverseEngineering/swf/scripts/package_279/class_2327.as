package package_279 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.geom.Rectangle;

import package_11.class_38;
import package_11.class_39;
import package_11.class_65;

import package_113.class_404;

import package_22.FullResourcePattern;
import package_22.class_198;

import package_9.ResourceManager;

public class class_2327 extends class_2323 {


    private var var_176: class_404;

    public function class_2327(param1: class_404) {
        super();
        this.var_176 = param1;
        var _loc2_: FullResourcePattern = class_198.method_2393(this.var_176.method_504);
        ResourceManager.loadAndCall(_loc2_.srcKey, this.method_529, [_loc2_]);
    }

    private function method_529(param1: FullResourcePattern): void {
        var _loc3_: * = null;
        var _loc2_: class_38 = ResourceManager.name_15.getFinisher(param1.srcKey);
        if (_loc2_ is class_39) {
            _loc3_ = (_loc2_ as class_39).method_2545(param1.resKey);
            if (_loc3_ is BitmapData) {
                _loc3_ = new Bitmap(_loc3_ as BitmapData);
            }
            this.addElement(_loc3_ as DisplayObject);
        } else {
            if (!(_loc2_ is class_65)) {
                throw new Error("invalid Finisher");
            }
            this.addElement((_loc2_ as class_65).getBitmap());
        }
    }

    private function addElement(param1: DisplayObject): void {
        var _loc2_: * = null;
        _loc2_ = param1.getBounds(param1);
        param1.x = -_loc2_.x;
        param1.y = -_loc2_.y;
        addChild(param1);
        sizeChanged.dispatch();
    }
}
}
