package net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components {

import com.greensock.TweenMax;
import com.greensock.easing.Expo;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.geom.Point;

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;

import package_104.class_276;
import package_104.class_277;
import package_104.class_278;
import package_104.class_279;

import package_141.class_2008;

public class FeatureBar extends class_2008 {

    private static const LINKAGE: String = "menuBar";

    public static const DEFAULT_WIDTH: int = 390;


    private var _layoutType: String;

    public function FeatureBar(param1: DisplayObjectContainer, param2: String) {
        super(param1);
        this._layoutType = param2;
    }

    override public function decorate(): void {
        super.decorate();
    }

    override public function updateLayout(): void {
        var_4606.leftArrow.x = var_4606.leftArrow.y = 0;
        var_4606.leftArrow.visible = var_4606.rightArrow.visible = false;
        if (this._layoutType == const_1254) {
            this.updateOnListLayoutChange(new Point(var_4606.listContainer.width, 0), false);
        }
    }

    override public function updateOnListLayoutChange(param1: Point, param2: Boolean = true): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        if (this._layoutType == const_1254) {
            _loc3_ = param1.x + const_1984.x;
            _loc4_ = param1.y + const_1984.y;
            TweenMax.to(dragButton, param2 ? 1 : 0, {
                "x": _loc3_,
                "y": _loc4_,
                "ease": Expo.easeOut,
                "onUpdate": this.updateChangeLayoutBtnPos
            });
        }
    }

    private function updateChangeLayoutBtnPos(): void {
        rotateButton.x = NaN;
        rotateButton.y = dragButton.y;
    }

    override public function get realWidth(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_278.ID:
                _loc1_ = this._layoutType == const_1254 ? 0 : int(var_4606.method_5782);
                break;
            case class_279.ID:
                _loc1_ = var_4606.method_5782 + const_2211;
                break;
            case class_276.ID:
                _loc1_ = SlotAndItemBarElement.DEFAULT_SIZE + const_2211;
                break;
            case class_277.ID:
                _loc1_ = 2 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
        }
        return _loc1_;
    }

    override public function get realHeight(): int {
        return var_4606.height;
    }

    override public function get boundsWidth(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_279.ID:
                _loc1_ = this._layoutType == const_1254 ? NaN + const_2211 : var_4606.method_5782 + this.leftOffset + const_2211;
                break;
            case class_278.ID:
            case class_276.ID:
                _loc1_ = this._layoutType == const_1254 ? 0 : var_4606.method_5782 + this.leftOffset + const_2211;
                break;
            case class_277.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211) + const_2211;
        }
        return _loc1_;
    }

    override public function get boundsHeight(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_278.ID:
                _loc1_ = SlotAndItemBarElement.DEFAULT_SIZE + const_2211;
                break;
            case class_279.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_276.ID:
                _loc1_ = this._layoutType == const_1254 ? 0 : int(var_4606.height);
                break;
            case class_277.ID:
                _loc1_ = int(var_4606.listContainer.height);
        }
        return _loc1_;
    }

    override public function get leftOffset(): int {
        var _loc1_: Number = NaN;
        switch (var_4606.layout.id) {
            case class_278.ID:
            case class_279.ID:
            case class_276.ID:
                _loc1_ = this._layoutType == const_1254 ? Number(const_2211) : (0 - 0) * -1;
                break;
            case class_277.ID:
                _loc1_ = 0;
        }
        return _loc1_;
    }

    override public function get topOffset(): int {
        return var_4606.layout.id == class_279.ID ? 0 : -1;
    }

    override public function get rightOffset(): int {
        return const_2211;
    }

    override public function get bottomOffset(): int {
        return const_2211;
    }

    override public function get asDisplayObject(): DisplayObject {
        return this;
    }

    override public function get dragOffset(): Point {
        return new Point(0, 0);
    }

    override public function get symbolLinkage(): String {
        return LINKAGE;
    }

    override public function get height(): Number {
        return SlotAndItemBarElement.DEFAULT_SIZE;
    }
}
}
