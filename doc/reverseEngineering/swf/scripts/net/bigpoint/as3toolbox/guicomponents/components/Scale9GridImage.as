package net.bigpoint.as3toolbox.guicomponents.components {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Rectangle;

import spark.components.supportClasses.SkinnableComponent;
import spark.primitives.BitmapImage;

public class Scale9GridImage extends SkinnableComponent {


    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var upperLeftImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var upperCenterImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var upperRightImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var middleLeftImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var middleCenterImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var middleRightImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var lowerLeftImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var lowerCenterImage: BitmapImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var lowerRightImage: BitmapImage;

    private var var_1083: Boolean = true;

    private var _source: BitmapData;

    private var var_4088: Rectangle;

    public function Scale9GridImage() {
        super();
    }

    public function get method_1116(): Boolean {
        return this.var_1083;
    }

    public function set method_1116(param1: Boolean): void {
        this.var_1083 = param1;
    }

    public function get source(): BitmapData {
        return this._source;
    }

    public function set source(param1: *): void {
        if (this._source != param1) {
            if (param1 is Class) {
                this.method_375(param1 as Class);
            } else if (param1 is Bitmap) {
                this._source = (param1 as Bitmap).bitmapData;
            } else {
                if (!(param1 is BitmapData)) {
                    return;
                }
                this._source = param1;
            }
            this.var_4088 = new Rectangle(0, 0, this._source.width, this._source.height);
            this.var_1083 = true;
            if (skin != null) {
                skin.invalidateDisplayList();
            }
        }
    }

    override public function get scale9Grid(): Rectangle {
        return this.var_4088;
    }

    override public function set scale9Grid(param1: Rectangle): void {
        if (this.var_4088 != param1) {
            this.var_4088 = param1;
            this.var_4088.x = isNaN(this.var_4088.x) ? 0 : Number(this.var_4088.x);
            this.var_4088.y = isNaN(this.var_4088.y) ? 0 : Number(this.var_4088.y);
            this.var_4088.width = isNaN(this.var_4088.width) ? (this._source != null ? this._source.width : 0) : Number(this.var_4088.width);
            this.var_4088.height = isNaN(this.var_4088.height) ? (this._source != null ? this._source.height : 0) : Number(this.var_4088.height);
            this.var_1083 = true;
            if (skin != null) {
                skin.invalidateDisplayList();
            }
        }
    }

    private function method_375(param1: Class): void {
        var _loc2_: Object = new param1();
        if (_loc2_ is Bitmap) {
            this._source = (_loc2_ as Bitmap).bitmapData;
            return;
        }
        if (_loc2_ is BitmapData) {
            this._source = _loc2_ as BitmapData;
            return;
        }
    }
}
}
