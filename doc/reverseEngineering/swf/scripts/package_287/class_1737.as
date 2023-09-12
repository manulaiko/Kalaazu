package package_287 {

import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.IDisposable;

import package_27.class_82;

import package_75.class_1815;

import package_9.class_50;

public class class_1737 extends Sprite implements IDisposable {


    private var var_1307: TextField;

    private var var_3476: class_1815;

    public function class_1737(param1: class_87, param2: class_1815) {
        super();
        this.var_3476 = param2;
        param2.text.changed.add(this.method_1455);
        this.method_1455();
        this.method_1525();
    }

    private function method_1455(): void {
        if (this.var_3476.text.value) {
            if (this.var_1307 == null) {
                this.method_721();
            }
            this.var_1307.text = this.var_3476.text.value;
            this.var_1307.x = -Number(this.var_1307.width) / 2;
        } else if (this.var_1307) {
            this.var_1307.parent.removeChild(this.var_1307);
            this.var_1307 = null;
        }
    }

    private function method_721(): void {
        this.var_1307 = new TextField();
        this.var_1307.defaultTextFormat = class_18.const_1442;
        this.var_1307.embedFonts = class_18.var_3994;
        this.var_1307.autoSize = TextFieldAutoSize.LEFT;
        this.var_1307.height = NaN;
        this.var_1307.textColor = 16777215;
        this.var_1307.antiAliasType = "advanced";
        this.var_1307.selectable = false;
        this.var_1307.filters = [new GlowFilter(255, 1, 1, 1, 1)];
        this.method_4475();
        this.var_1307.alpha = 0;
        TweenLite.to(this.var_1307, 1, {"alpha": 1});
        addChild(this.var_1307);
    }

    public function disposeView(param1: Boolean = false): void {
        this.var_3476.text.changed.remove(this.method_1455);
        if (this.var_1307) {
            TweenLite.to(this.var_1307, 0.5, {
                "alpha": 0,
                "onComplete": this.var_1307.parent.removeChild,
                "onCompleteParams": [this.var_1307]
            });
        }
        TweenLite.killDelayedCallsTo(this.method_1525);
    }

    private function method_4475(): void {
        x = class_50.method_1849();
        y = Number(class_50.method_5866()) - 150;
    }

    private function method_1525(): void {
        class_82.playSoundEffect(class_126.const_9);
        class_50.getInstance().method_370(267386880);
        TweenLite.delayedCall(2, this.method_1525);
    }
}
}
