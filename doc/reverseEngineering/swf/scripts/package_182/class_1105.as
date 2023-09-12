package package_182 {

import flash.display.Bitmap;
import flash.display.LineScaleMode;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

import package_11.class_39;

import package_9.ResourceManager;

public class class_1105 extends Sprite {

    public static const COMBOBOX_CLICK: String = "COMBOBOX_CLICK";


    private var iconContainer: Sprite;

    private var var_4931: Sprite;

    public var var_1227: MovieClip;

    public var var_1570: int = 110;

    public var var_2633: int = 12;

    private var var_644: TextField;

    public function class_1105() {
        super();
    }

    public function init(): void {
        var _loc1_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc2_: Bitmap = _loc1_.getEmbeddedBitmap("gear_bg.png");
        this.var_1227 = _loc1_.getEmbeddedMovieClip("comboButton");
        this.iconContainer = new Sprite();
        this.iconContainer.addChild(_loc2_);
        addChild(this.iconContainer);
        this.var_4931 = new Sprite();
        this.var_4931.graphics.beginFill(3355443, 1);
        this.var_4931.graphics.lineStyle(0.1, 10066329, 1, true, LineScaleMode.NORMAL);
        this.var_4931.graphics.drawRect(0, 0, this.var_1570, this.var_2633);
        this.var_4931.graphics.endFill();
        this.var_4931.x = this.iconContainer.width;
        this.var_4931.y = 8;
        var _loc3_: TextFormat = new TextFormat(class_18.const_2442.font, 10, 16777215, false);
        this.var_644 = new TextField();
        this.var_644.antiAliasType = AntiAliasType.ADVANCED;
        this.var_644.embedFonts = class_18.var_3911;
        this.var_644.autoSize = TextFieldAutoSize.LEFT;
        this.var_644.defaultTextFormat = _loc3_;
        this.var_644.setTextFormat(_loc3_);
        this.var_644.width = this.var_1570;
        this.var_644.height = 12;
        this.var_4931.addChild(this.var_644);
        addChild(this.var_4931);
        this.var_1227.gotoAndStop(1);
        this.var_1227.x = this.var_4931.x + this.var_4931.width + 2;
        this.var_1227.y = Number(this.var_4931.y) - 2;
        addChild(this.var_1227);
        var _loc4_: Sprite;
        (_loc4_ = new Sprite()).graphics.beginFill(0, 0);
        _loc4_.graphics.drawRect(0, 0, this.width, this.height);
        _loc4_.graphics.endFill();
        _loc4_.useHandCursor = true;
        _loc4_.buttonMode = true;
        _loc4_.addEventListener(MouseEvent.CLICK, this.method_6086);
        this.addChild(_loc4_);
    }

    private function method_6086(param1: MouseEvent): void {
        dispatchEvent(new Event(COMBOBOX_CLICK));
    }

    public function setIcon(param1: Bitmap): void {
        if (this.iconContainer.numChildren > 1) {
            this.iconContainer.removeChildAt(1);
        }
        if (param1 != null) {
            param1.x = (Number(this.iconContainer.width) - param1.width) * 0.5;
            param1.y = (Number(this.iconContainer.height) - param1.height) * 0.5;
            this.iconContainer.addChild(param1);
        }
    }

    public function method_1021(param1: String): void {
        this.var_644.text = param1;
        if (this.var_644.width > this.var_1570) {
            this.var_644.text = this.var_644.text.substr(0, 19) + "...";
        }
    }

    public function method_5714(param1: Number): void {
        this.alpha = param1;
        this.mouseChildren = false;
        this.mouseEnabled = false;
    }

    public function method_118(): void {
        this.mouseChildren = true;
        this.mouseEnabled = true;
        this.alpha = 1;
    }
}
}
