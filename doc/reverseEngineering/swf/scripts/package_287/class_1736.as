package package_287 {

import com.greensock.TweenMax;
import com.greensock.easing.Linear;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.utils.getTimer;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.map.class_87;

import package_11.class_39;

import package_195.class_1203;

import package_75.class_2015;

import package_9.ResourceManager;

public class class_1736 extends class_1203 {


    private var var_3922: Bitmap;

    private var _tween: TweenMax;

    private var var_4294: Sprite;

    private var var_1428: TextField;

    private var _startTime: int = -1;

    private var _effect: class_2015;

    private var name_116: Number;

    public function class_1736(param1: class_87, param2: class_2015) {
        this._effect = param2;
        this.name_116 = param2.name_116;
        this._startTime = getTimer().valueOf();
        super(param1, param2.source.position);
        ResourceManager.name_15.load("ui", this.method_2095);
    }

    private function method_2095(param1: class_39): void {
        this.var_3922 = param1.getEmbeddedBitmap("loot_countdown_with_bg");
        this.var_4294 = new Sprite();
        this.var_4294.addChild(this.var_3922);
        this.var_3922.x = -Number(this.var_3922.width) * 0.5;
        this.var_3922.y = -Number(this.var_3922.height) * 0.5;
        this.var_4294.y = 145;
        this.var_1428 = new TextField();
        this.var_1428.defaultTextFormat = class_18.const_639;
        this.var_1428.setTextFormat(class_18.const_639);
        this.var_1428.type = TextFieldType.DYNAMIC;
        this.var_1428.textColor = 15327936;
        this.var_1428.embedFonts = class_18.var_3911;
        this.var_1428.autoSize = TextFieldAutoSize.CENTER;
        this.var_1428.antiAliasType = AntiAliasType.ADVANCED;
        this.var_1428.selectable = false;
        this.var_1428.width = 40;
        this.var_1428.x = Number(this.var_4294.x) - 2;
        this.var_1428.y = Number(this.var_4294.y) - 9;
        this.var_1428.text = "-";
        addChild(this.var_4294);
        addChild(this.var_1428);
        this.name_116 -= (getTimer().valueOf() - Number(this._startTime)) / 1000;
        this._tween = TweenMax.to(this.var_4294, this.name_116, {
            "ease": Linear.easeNone,
            "rotation": 180 * Number(this.name_116),
            "onUpdate": this.method_5607,
            "onUpdateParams": [this.var_1428],
            "onComplete": this.method_4707
        });
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this._tween) {
            this._tween.kill();
            this._tween = null;
        }
        super.disposeView(param1);
    }

    private function method_5607(param1: TextField): void {
        param1.text = Math.ceil(Number(this._tween.duration) - Number(this._tween.currentTime)).toString();
    }

    private function method_4707(): void {
        this.disposeView();
    }
}
}
