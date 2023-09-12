package net.bigpoint.darkorbit.mvc.common.view.skins {

import flash.display.Graphics;

import mx.skins.RectangularBorder;

public class DOToolTipBorderSkin extends RectangularBorder {


    public function DOToolTipBorderSkin() {
        super();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        var _loc3_: Number = getStyle("backgroundColor");
        var _loc4_: Number = getStyle("borderColor");
        var _loc5_: int = getStyle("border");
        var _loc6_: Graphics;
        (_loc6_ = graphics).clear();
        _loc6_.beginFill(_loc3_);
        _loc6_.drawRect(1, 2, param1 - 3, param2 - 6);
        _loc6_.endFill();
        _loc6_.lineStyle(_loc5_, _loc4_);
        _loc6_.drawRect(1, 2, param1 - 3, param2 - 6);
    }
}
}
