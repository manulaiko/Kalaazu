package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar {

import com.greensock.TweenMax;
import com.greensock.easing.Expo;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.geom.Point;

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons.CategoryButton;

import package_104.class_275;
import package_104.class_276;
import package_104.class_277;
import package_104.class_278;
import package_104.class_279;
import package_104.class_280;

import package_11.class_39;

import package_141.class_2008;

public class MenuBar extends class_2008 {

    private static const LINKAGE: String = "menuBar";

    public static const DEFAULT_BAR_WIDTH: int = 390;

    private static const CATEGORY_BTN: String = "categoryBtn";


    public var categoryBtn: CategoryButton;

    public function MenuBar(param1: class_39) {
        _swfFinisher = param1;
        super(_swfFinisher.method_2545(this.symbolLinkage) as DisplayObjectContainer);
        this.categoryBtn.visible = false;
    }

    override public function decorate(): void {
        super.decorate();
        method_4210(this.categoryBtn = new CategoryButton(method_4492(CATEGORY_BTN)));
    }

    override public function updateLayout(): void {
        var _loc1_: * = var_4606.items.length > ItemsControlMenuConstants.MAX_ITEMS_ON_LIST;
        var_4606.rightArrow.visible = var_4606.items.length > ItemsControlMenuConstants.MAX_ITEMS_ON_LIST;
        var_4606.leftArrow.visible = _loc1_;
    }

    override public function updateOnListLayoutChange(param1: Point, param2: Boolean = true): void {
        if (this.categoryBtn) {
            TweenMax.to(this.categoryBtn, param2 ? 1 : 0, {
                "x": param1.x + const_1067.x,
                "y": param1.y + const_1067.y,
                "ease": Expo.easeOut
            });
        }
    }

    override public function get boundsWidth(): int {
        var _loc1_: int = 0;
        if (false) {
            switch (var_4606.layout.id) {
                case class_278.ID:
                    _loc1_ = this.leftOffset + DEFAULT_BAR_WIDTH + this.rightOffset;
                    break;
                case class_279.ID:
                    _loc1_ = this.leftOffset + 4 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_276.ID:
                    _loc1_ = this.leftOffset + SlotAndItemBarElement.DEFAULT_SIZE;
                    break;
                case class_277.ID:
                    _loc1_ = this.leftOffset + 2 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_280.ID:
                    _loc1_ = this.leftOffset + 5 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_275.ID:
                    _loc1_ = this.leftOffset + 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
            }
        }
        return _loc1_;
    }

    override public function get boundsHeight(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_278.ID:
                _loc1_ = 0;
                break;
            case class_279.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_276.ID:
                _loc1_ = DEFAULT_BAR_WIDTH + this.bottomOffset;
                break;
            case class_277.ID:
                _loc1_ = 4 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211) + this.bottomOffset;
                break;
            case class_280.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_275.ID:
                _loc1_ = 5 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211) + this.bottomOffset;
        }
        return _loc1_;
    }

    override public function get realWidth(): int {
        var _loc1_: int = 0;
        if (false) {
            switch (var_4606.layout.id) {
                case class_278.ID:
                    _loc1_ = DEFAULT_BAR_WIDTH;
                    break;
                case class_279.ID:
                    _loc1_ = this.leftOffset + 4 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_276.ID:
                    _loc1_ = this.leftOffset + SlotAndItemBarElement.DEFAULT_SIZE;
                    break;
                case class_277.ID:
                    _loc1_ = this.leftOffset + 2 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_280.ID:
                    _loc1_ = this.leftOffset + 5 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                    break;
                case class_275.ID:
                    _loc1_ = this.leftOffset + 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
            }
        }
        return _loc1_;
    }

    override public function get realHeight(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_278.ID:
                _loc1_ = 0;
                break;
            case class_279.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_276.ID:
                _loc1_ = DEFAULT_BAR_WIDTH;
                break;
            case class_277.ID:
                _loc1_ = 4 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_280.ID:
                _loc1_ = 3 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
                break;
            case class_275.ID:
                _loc1_ = 5 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211);
        }
        return _loc1_;
    }

    override public function get symbolLinkage(): String {
        return LINKAGE;
    }

    override public function get height(): Number {
        return SlotAndItemBarElement.DEFAULT_SIZE;
    }

    override public function get leftOffset(): int {
        return (0 - 0) * -1;
    }

    override public function get topOffset(): int {
        return var_4606.layout.id == class_279.ID ? 0 : 0;
    }

    override public function get rightOffset(): int {
        return !!this.categoryBtn.visible ? this.categoryBtn.width + 5 : 5;
    }

    override public function get bottomOffset(): int {
        var _loc1_: int = 0;
        switch (var_4606.layout.id) {
            case class_276.ID:
                _loc1_ = !!this.categoryBtn.visible ? int(this.categoryBtn.height) : 0;
                break;
            case class_277.ID:
                _loc1_ = !!this.categoryBtn.visible ? Number(this.categoryBtn.height) / 2 : 0;
        }
        return _loc1_;
    }

    override public function get asDisplayObject(): DisplayObject {
        return this;
    }

    override public function get dragOffset(): Point {
        return new Point(0, 0);
    }
}
}
