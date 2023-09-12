package net.bigpoint.as3toolbox.guicomponents.components {

import flash.geom.Rectangle;

import spark.components.Button;

public class Scale9GridImageButton extends Button {


    [SkinPart(type="spark.primitives.BitmapImage", required="true")]
    public var upImageSkinPart: Scale9GridImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="false")]
    public var downImageSkinPart: Scale9GridImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="false")]
    public var overImageSkinPart: Scale9GridImage;

    [SkinPart(type="spark.primitives.BitmapImage", required="false")]
    public var disabledImageSkinPart: Scale9GridImage;

    public function Scale9GridImageButton() {
        super();
        this.buttonMode = true;
    }

    override protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: * = undefined;
        super.partAdded(param1, param2);
        if (param2 == this.upImageSkinPart) {
            _loc3_ = getStyle("upImage");
            if (_loc3_ != null) {
                this.upImageSkinPart.source = _loc3_;
            }
            this.upImageSkinPart.scale9Grid = new Rectangle(getStyle("scaleGridX"), getStyle("scaleGridY"), getStyle("scaleGridWidth"), getStyle("scaleGridHeight"));
            return;
        }
        if (param2 == this.downImageSkinPart) {
            _loc3_ = getStyle("downImage");
            if (_loc3_ != null) {
                this.downImageSkinPart.source = _loc3_;
            }
            this.downImageSkinPart.scale9Grid = new Rectangle(getStyle("scaleGridX"), getStyle("scaleGridY"), getStyle("scaleGridWidth"), getStyle("scaleGridHeight"));
            return;
        }
        if (param2 == this.overImageSkinPart) {
            _loc3_ = getStyle("overImage");
            if (_loc3_ != null) {
                this.overImageSkinPart.source = _loc3_;
            }
            this.overImageSkinPart.scale9Grid = new Rectangle(getStyle("scaleGridX"), getStyle("scaleGridY"), getStyle("scaleGridWidth"), getStyle("scaleGridHeight"));
            return;
        }
        if (param2 == this.disabledImageSkinPart) {
            _loc3_ = getStyle("disabledImage");
            if (_loc3_ != null) {
                this.disabledImageSkinPart.source = _loc3_;
            }
            this.disabledImageSkinPart.scale9Grid = new Rectangle(getStyle("scaleGridX"), getStyle("scaleGridY"), getStyle("scaleGridWidth"), getStyle("scaleGridHeight"));
            return;
        }
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: * = undefined;
        var _loc3_: * = null;
        super.styleChanged(param1);
        if (this.upImageSkinPart != null && param1 == "upImage") {
            _loc2_ = getStyle("upImage");
            if (_loc2_ != null) {
                this.upImageSkinPart.source = _loc2_;
            }
            return;
        }
        if (this.downImageSkinPart != null && param1 == "downImage") {
            _loc2_ = getStyle("downImage");
            if (_loc2_ != null) {
                this.downImageSkinPart.source = _loc2_;
            }
            return;
        }
        if (this.overImageSkinPart != null && param1 == "overImage") {
            _loc2_ = getStyle("overImage");
            if (_loc2_ != null) {
                this.overImageSkinPart.source = _loc2_;
            }
            return;
        }
        if (this.disabledImageSkinPart != null && param1 == "disabledImage") {
            _loc2_ = getStyle("disabledImage");
            if (_loc2_ != null) {
                this.disabledImageSkinPart.source = _loc2_;
            }
            return;
        }
        if (param1 == "scaleGridX" || param1 == "scaleGridY" || param1 == "scaleGridWidth" || param1 == "scaleGridHeight") {
            _loc3_ = new Rectangle(getStyle("scaleGridX"), getStyle("scaleGridY"), getStyle("scaleGridWidth"), getStyle("scaleGridHeight"));
            if (this.upImageSkinPart != null) {
                this.upImageSkinPart.scale9Grid = _loc3_;
            }
            if (this.downImageSkinPart != null) {
                this.downImageSkinPart.scale9Grid = _loc3_;
            }
            if (this.overImageSkinPart != null) {
                this.overImageSkinPart.scale9Grid = _loc3_;
            }
            if (this.disabledImageSkinPart != null) {
                this.disabledImageSkinPart.scale9Grid = _loc3_;
            }
            return;
        }
    }
}
}
