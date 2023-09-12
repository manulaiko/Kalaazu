package mx.skins.halo {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.InteractiveObject;
import flash.display.Shape;
import flash.events.Event;

import mx.core.FlexShape;
import mx.core.FlexSprite;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.IStyleManager2;
import mx.styles.StyleManager;

public class BusyCursor extends FlexSprite {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var minuteHand: Shape;

    private var hourHand: Shape;

    public function BusyCursor(param1: IStyleManager2 = null) {
        var _loc7_: * = null;
        super();
        if (!param1) {
            param1 = StyleManager.getStyleManager(null);
        }
        var _loc2_: CSSStyleDeclaration = param1.getMergedStyleDeclaration("mx.managers.CursorManager");
        var _loc3_: Class = _loc2_.getStyle("busyCursorBackground");
        var _loc4_: DisplayObject;
        if ((_loc4_ = new _loc3_()) is InteractiveObject) {
            InteractiveObject(_loc4_).mouseEnabled = false;
        }
        addChild(_loc4_);
        this.minuteHand = new FlexShape();
        this.minuteHand.name = "minuteHand";
        (_loc7_ = this.minuteHand.graphics).beginFill(0);
        _loc7_.moveTo(-0.5, -0.5);
        _loc7_.lineTo(0.5, -0.5);
        _loc7_.lineTo(0.5, 4.5);
        _loc7_.lineTo(-0.5, 4.5);
        _loc7_.lineTo(-0.5, -0.5);
        _loc7_.endFill();
        addChild(this.minuteHand);
        this.hourHand = new FlexShape();
        this.hourHand.name = "hourHand";
        (_loc7_ = this.hourHand.graphics).beginFill(0);
        _loc7_.moveTo(-0.5, -0.5);
        _loc7_.lineTo(3.5, -0.5);
        _loc7_.lineTo(3.5, 0.5);
        _loc7_.lineTo(-0.5, 0.5);
        _loc7_.lineTo(-0.5, -0.5);
        _loc7_.endFill();
        addChild(this.hourHand);
        addEventListener(Event.ADDED, this.handleAdded);
        addEventListener(Event.REMOVED, this.handleRemoved);
    }

    private function handleAdded(param1: Event): void {
        addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
    }

    private function handleRemoved(param1: Event): void {
        removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
    }

    private function enterFrameHandler(param1: Event): void {
        this.minuteHand.rotation += 12;
        this.hourHand.rotation += 1;
    }
}
}
