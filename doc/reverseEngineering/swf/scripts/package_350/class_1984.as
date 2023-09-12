package package_350 {

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_18;

import package_38.class_439;

import package_76.class_215;

import package_9.class_50;

public class class_1984 extends Sprite {


    private const const_1097: int = 8;

    public var bar: Shape;

    public var background: Shape;

    public var text: TextField;

    public function class_1984(param1: Boolean = false) {
        this.bar = new Shape();
        this.background = new Shape();
        this.text = new TextField();
        super();
        this.bar.cacheAsBitmap = true;
        this.background.cacheAsBitmap = true;
        this.method_5064(class_439.NONE);
        this.method_1427(class_439.NONE);
        this.text.embedFonts = class_18.var_620;
        this.text.defaultTextFormat = class_18.const_1353;
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.addChild(this.background);
        this.addChild(this.text);
        this.addChild(this.bar);
        this.visible = param1;
        this.alpha = 0.5;
        this.mouseEnabled = false;
        this.addEventListener(Event.ADDED_TO_STAGE, this.method_396);
    }

    private function method_396(param1: Event): void {
        this.method_2489();
        this.removeEventListener(Event.ADDED_TO_STAGE, this.method_396);
        this.stage.addEventListener(Event.RESIZE, this.method_2489);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.method_267);
    }

    private function method_2489(param1: Event = null): void {
        if (!stage) {
            return;
        }
        this.y = 0;
        this.x = 0 - Number(this.width) * 0.5;
        this.text.x = 0.5 * Number(this.background.width);
        this.text.y = this.background.height;
    }

    private function method_267(param1: Event): void {
        if (stage) {
            this.stage.removeEventListener(Event.RESIZE, this.method_2489);
        }
        this.removeEventListener(Event.REMOVED_FROM_STAGE, this.method_267);
        this.addEventListener(Event.ADDED_TO_STAGE, this.method_396);
    }

    public function method_5064(param1: int): void {
        this.bar.graphics.clear();
        this.bar.graphics.beginFill(class_126.getInstance().method_6115[param1], 0.5);
        this.bar.graphics.drawRect(0, 0, class_50.method_1849(), 1);
        this.bar.graphics.drawRect(0, 1, 1, 6);
        this.bar.graphics.drawRect(class_50.method_1849() - 1, 1, 1, 6);
        this.bar.graphics.drawRect(0, 7, class_50.method_1849(), 1);
        this.bar.graphics.endFill();
        this.bar.graphics.beginFill(class_126.getInstance().method_6115[param1], 1);
        this.bar.graphics.drawRect(1, 1, Number(class_50.method_1849()) - 2, 6);
        this.bar.graphics.endFill();
        this.method_2489();
    }

    public function method_1427(param1: int): void {
        var _loc3_: int = int(class_126.getInstance().method_6115[param1]);
        if (param1 == class_439.NONE) {
            _loc3_ = 8355711;
        }
        this.background.graphics.clear();
        this.background.graphics.beginFill(8355711, 0.5);
        this.background.graphics.drawRect(0, 0, class_50.method_1849(), 1);
        this.background.graphics.drawRect(0, 1, 1, 6);
        this.background.graphics.drawRect(class_50.method_1849() - 1, 1, 1, 6);
        this.background.graphics.drawRect(0, 7, class_50.method_1849(), 1);
        this.background.graphics.endFill();
        this.background.graphics.beginFill(8355711, 1);
        this.background.graphics.drawRect(1, 1, Number(class_50.method_1849()) - 2, 6);
        this.background.graphics.endFill();
        this.background.graphics.lineStyle(1, _loc3_);
        this.background.graphics.moveTo(-2, -2);
        this.background.graphics.lineTo(class_50.method_1849() + 2, -2);
        this.background.graphics.lineTo(class_50.method_1849() + 2, 10);
        this.background.graphics.lineTo(-2, 10);
        this.background.graphics.lineTo(-2, -2);
        this.method_2489();
    }

    override public function set visible(param1: Boolean): void {
        if (super.visible != param1) {
            super.visible = param1;
            if (visible) {
                class_50.getInstance().method_5799().addChild(this);
            } else {
                class_215.removeDisplayObject(this);
            }
        }
    }
}
}
