package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.counterDots {

import com.greensock.TweenMax;

import flash.display.Sprite;

import package_11.class_39;

import package_141.class_1895;

public class Dot extends class_1895 {

    private static const LINKAGE: String = "dot";

    private static const TINT_AREA: String = "tintArea";


    public var tintArea: Sprite;

    public function Dot(param1: class_39) {
        super(param1, this.symbolLinkage);
    }

    override public function decorate(): void {
        method_4210(this.tintArea = method_4492(TINT_AREA));
    }

    public function setData(param1: Boolean, param2: Number): void {
        this.tintArea.visible = param1;
        if (this.tintArea) {
            TweenMax.to(this.tintArea, 0, {"colorMatrixFilter": {"colorize": param2}});
        }
    }

    override public function get symbolLinkage(): String {
        return LINKAGE;
    }

    public function set selected(param1: Boolean): void {
        this.tintArea.visible = param1;
    }
}
}
