package package_26 {

import flash.display.DisplayObject;
import flash.events.TimerEvent;
import flash.geom.Rectangle;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import net.bigpoint.darkorbit.class_18;

public class class_334 {

    private static const const_460: int = 500;

    private static const const_2252: int = 100;


    private var name_22: DisplayObject;

    private var text: String;

    public var var_621: Boolean;

    private var name_17: int = 220;

    private var name_9: TextField;

    private var bounds: Rectangle;

    private var var_2603: Number = 0;

    private var var_2846: Number = 0;

    private var htmlText: Boolean;

    public function class_334(param1: DisplayObject, param2: String, param3: int, param4: int, param5: int, param6: Boolean = false) {
        super();
        this.name_22 = param1;
        this.text = param2;
        this.var_2603 = param3;
        this.var_2846 = param4;
        this.htmlText = param6;
        this.name_17 = param5;
        this.method_296();
    }

    public function method_1455(param1: String): void {
        this.text = param1;
        if (this.htmlText) {
            this.name_9.htmlText = param1;
        } else {
            this.name_9.text = param1;
        }
    }

    public function method_2670(param1: Rectangle): void {
        this.bounds = param1;
    }

    public function showTooltip(): void {
        if (this.bounds == null || this.name_22 == null || this.name_9 == null || this.name_22.stage == null) {
            return;
        }
        this.name_9.x = this.name_22.x + this.var_2603 + this.name_22.stage.x;
        this.name_9.y = this.name_22.y + this.var_2846 + this.name_22.stage.y;
        if (this.name_9.x < 0) {
            this.name_9.x = 0;
        }
        if (this.name_9.x + this.name_9.width > this.bounds.width) {
            this.name_9.x -= this.name_9.x + this.name_9.width - Number(this.bounds.width);
        }
        if (this.name_9.y < 0) {
            this.name_9.y = 0;
        }
        if (this.name_9.y + this.name_9.height > this.bounds.height) {
            this.name_9.y -= this.name_9.y + this.name_9.height - Number(this.bounds.height);
        }
        try {
            this.name_22.stage.addChild(this.name_9);
        } catch (e: Error) {
        }
        this.var_621 = true;
    }

    public function method_5343(): void {
        this.name_9.x = this.name_22.x;
        this.name_9.y = this.name_22.y;
        try {
            this.name_22.parent.addChild(this.name_9);
        } catch (e: Error) {
        }
        this.var_621 = true;
    }

    public function hideTooltip(param1: TimerEvent = null): void {
        try {
            this.name_22.stage.removeChild(this.name_9);
        } catch (e: Error) {
        }
        this.var_621 = false;
    }

    public function method_3195(): void {
        try {
            this.name_22.parent.removeChild(this.name_9);
        } catch (e: Error) {
        }
        this.var_621 = false;
    }

    public function getTargetObject(): DisplayObject {
        return this.name_22;
    }

    public function suicide(): void {
        try {
            this.hideTooltip(null);
        } catch (e: Error) {
        }
    }

    private function method_296(): DisplayObject {
        this.name_9 = new TextField();
        this.name_9.multiline = true;
        this.name_9.defaultTextFormat = class_18.const_1832;
        if (false) {
            this.name_9.defaultTextFormat = class_18.const_1832;
        } else {
            this.name_9.defaultTextFormat = class_18.const_3012;
        }
        this.name_9.embedFonts = class_18.const_1937;
        this.name_9.autoSize = TextFieldAutoSize.LEFT;
        this.name_9.textColor = 13421772;
        this.name_9.backgroundColor = 0;
        this.name_9.background = true;
        this.name_9.border = true;
        this.name_9.borderColor = 1873341;
        this.name_9.antiAliasType = AntiAliasType.ADVANCED;
        this.name_9.selectable = false;
        if (this.htmlText) {
            this.name_9.htmlText = this.text;
        } else {
            this.name_9.text = this.text;
        }
        this.name_9.mouseEnabled = false;
        if (this.name_9.width > this.name_17) {
            this.name_9.width = this.name_17;
            this.name_9.wordWrap = true;
        }
        return this.name_9;
    }
}
}
