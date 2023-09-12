package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons {

import com.greensock.TweenMax;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import package_11.class_39;

import package_142.class_2501;
import package_142.class_970;

public class ProActionBarToggleButton extends class_2501 {

    public static const PRO_ACTION_BAR_TOGGLE: String = "proActionBarToggle";

    private static const CATEGORY_LINKAGE: String = "categoryElement";

    private static const MENU_BAR_LINKAGE: String = "menuBar";

    private static const CATEGORY_BTN_LINKAGE: String = "categoryBtn";

    private static const EXPAND_ICONS: String = "expandIcons";

    private static const COLLAPSE_ICONS: String = "collapseIcons";

    private static const EXPAND_ICONS_MASK: String = "expandIconsMask";

    private static const COLLAPSE_ICONS_MASK: String = "collapseIconsMask";


    public var expandIcons: class_970;

    public var collapseIcons: class_970;

    public var expandIconsMask: Sprite;

    public var collapseIconsMask: Sprite;

    protected var _activeIconsSet: class_970;

    private var _finisher: class_39;

    private var _backgroundButton: class_970;

    public function ProActionBarToggleButton(param1: class_39) {
        this._finisher = param1;
        var _loc2_: DisplayObjectContainer = (param1.method_2545(MENU_BAR_LINKAGE) as DisplayObjectContainer).getChildByName(CATEGORY_BTN_LINKAGE) as DisplayObjectContainer;
        super(_loc2_);
    }

    override public function decorate(): void {
        super.decorate();
        method_4210(this._backgroundButton = new class_970(this._finisher.method_2545(CATEGORY_LINKAGE) as DisplayObjectContainer));
        this._backgroundButton.width *= 0.8;
        this._backgroundButton.height *= 0.8;
        this._backgroundButton.x = -Number(this._backgroundButton.width) / 2;
        this._backgroundButton.y = -Number(this._backgroundButton.height) / 2;
        method_4210(this.expandIcons = new class_970(method_4492(EXPAND_ICONS)));
        method_4210(this.collapseIcons = new class_970(method_4492(COLLAPSE_ICONS)));
        method_4210(this.expandIconsMask = method_4492(EXPAND_ICONS_MASK));
        method_4210(this.collapseIconsMask = method_4492(COLLAPSE_ICONS_MASK));
        this.expandIcons.mask = this.expandIconsMask;
        this.collapseIcons.mask = this.collapseIconsMask;
        this.updateIcons();
        super.toggle();
    }

    override public function set selected(param1: Boolean): void {
        this.updateIcons();
        this._backgroundButton.selected = param1;
        if (param1) {
            method_4622(false, rollOverState, 0);
            method_4622(true, mouseDownState, 0);
            method_4622(!var_582, this._activeIconsSet.rollOverState, 0);
        }
    }

    private function updateIcons(): void {
        this._activeIconsSet = !!var_582 ? this.collapseIcons : this.expandIcons;
        method_4622(var_582, this._activeIconsSet.mouseDownState, 0);
        if (var_582) {
            TweenMax.to(this.collapseIcons, 0.5, {
                "y": -11,
                "alpha": 1
            });
            TweenMax.to(this.expandIcons, 0.5, {
                "y": 0,
                "alpha": 0
            });
        } else {
            TweenMax.to(this.collapseIcons, 0.5, {
                "y": -22,
                "alpha": 0
            });
            TweenMax.to(this.expandIcons, 0.5, {
                "y": -11,
                "alpha": 1
            });
        }
    }

    override protected function clickHandler(param1: MouseEvent): void {
        super.clickHandler(param1);
    }

    override public function rollHandler(param1: MouseEvent): void {
        super.rollHandler(param1);
        this._backgroundButton.rollHandler(param1);
        this._activeIconsSet.rollHandler(param1);
    }

    override public function mouseUpDownHandler(param1: MouseEvent): void {
        super.mouseUpDownHandler(param1);
        this._backgroundButton.mouseUpDownHandler(param1);
        this._activeIconsSet.mouseUpDownHandler(param1);
    }

    override public function toggle(): void {
        super.toggle();
        method_4622(false, mouseDownState, 0.1);
        method_4622(false, rollOverState, 0.5);
        method_4622(false, this._activeIconsSet.mouseDownState, 0);
        dispatchEvent(new Event(PRO_ACTION_BAR_TOGGLE, true));
    }
}
}
