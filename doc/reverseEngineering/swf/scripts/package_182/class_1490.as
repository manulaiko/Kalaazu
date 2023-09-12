package package_182 {

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;

public class class_1490 extends Sprite {

    public static const MOUSE_OVER: String = "MOUSE_OVER";

    public static const MOUSE_OUT: String = "MOUSE_OUT";

    public static const CLICKED: String = "CLICKED";

    public static const const_706: int = 22;

    private static const const_1970: int = 8;


    private var name_52: Sprite;

    private var var_2736: Sprite;

    private var itemWidth: int;

    public var title: String;

    public var icon: Bitmap;

    public var gearID: int;

    public var parentgearID: int = -1;

    private var var_3800: Sprite;

    private var textField: TextField;

    public function class_1490(param1: int, param2: String, param3: Bitmap, param4: int) {
        super();
        this.gearID = param1;
        this.title = param2;
        this.icon = param3;
        this.itemWidth = param4;
        this.init();
    }

    private function init(): void {
        this.useHandCursor = true;
        this.buttonMode = true;
        this.name_52 = new Sprite();
        this.var_2736 = new Sprite();
        this.var_3800 = new Sprite();
        this.var_2736.visible = false;
        this.name_52.addChild(this.var_2736);
        this.addChild(this.name_52);
        this.addChild(this.var_3800);
        var _loc1_: * = Number(const_706) / Number(this.icon.width);
        this.icon.scaleY = Number(const_706) / Number(this.icon.width);
        this.icon.scaleX = _loc1_;
        this.name_52.addChild(this.icon);
        this.textField = this.method_5739();
        this.name_52.addChild(this.textField);
        this.name_52.mouseEnabled = false;
        this.name_52.mouseChildren = false;
        this.method_2943(this.name_52, 2236962);
        this.method_2943(this.var_2736, 6710886);
        this.addListeners();
    }

    public function setEnabled(param1: Boolean): void {
        if (param1) {
            this.method_25();
            this.addListeners();
            this.textField.alpha = 1;
            this.useHandCursor = true;
        } else {
            this.var_2736.visible = false;
            this.method_25();
            this.textField.alpha = 0.6;
            this.useHandCursor = false;
        }
    }

    public function addListeners(): void {
        this.addEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver);
        this.addEventListener(MouseEvent.MOUSE_OUT, this.handleMouseOut);
        this.addEventListener(MouseEvent.CLICK, this.handleClick);
    }

    public function method_25(): void {
        this.removeEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver);
        this.removeEventListener(MouseEvent.MOUSE_OUT, this.handleMouseOut);
        this.removeEventListener(MouseEvent.CLICK, this.handleClick);
    }

    private function handleClick(param1: MouseEvent): void {
        this.var_2736.visible = false;
        dispatchEvent(new Event(CLICKED));
    }

    private function handleMouseOver(param1: MouseEvent): void {
        this.var_2736.visible = true;
        dispatchEvent(new Event(MOUSE_OVER));
    }

    private function handleMouseOut(param1: MouseEvent): void {
        this.var_2736.visible = false;
        dispatchEvent(new Event(MOUSE_OUT));
    }

    private function method_5739(): TextField {
        var _loc1_: TextFormat = new TextFormat(class_18.const_2442.font, 11, 16777215, false);
        var _loc2_: TextField = new TextField();
        _loc2_.antiAliasType = AntiAliasType.ADVANCED;
        _loc2_.embedFonts = class_18.var_3911;
        _loc2_.autoSize = TextFieldAutoSize.LEFT;
        _loc2_.selectable = false;
        _loc2_.defaultTextFormat = _loc1_;
        _loc2_.setTextFormat(_loc1_);
        _loc2_.x = 25;
        _loc2_.y = 3;
        _loc2_.text = this.title || false;
        if (_loc2_.width > Number(this.itemWidth) - _loc2_.x) {
            _loc2_.text = !!this.title ? this.title.substr(0, 15) + "..." : "";
        }
        return _loc2_;
    }

    private function method_2943(param1: Sprite, param2: uint): void {
        param1.graphics.clear();
        param1.graphics.beginFill(param2);
        param1.graphics.drawRect(1, 0, Number(this.itemWidth) - 2, this.icon.height);
        param1.graphics.endFill();
        param1.graphics.lineStyle(0.1, 6710886);
        param1.graphics.moveTo(0, 0);
        param1.graphics.lineTo(0, this.icon.height);
        param1.graphics.moveTo(Number(this.itemWidth) - 2, 0);
        param1.graphics.lineTo(Number(this.itemWidth) - 2, this.icon.height);
    }

    public function method_5624(): void {
        this.var_3800.x = Number(this.itemWidth) - Number(const_1970);
        this.var_3800.y = (Number(this.icon.height) - Number(const_1970)) * 0.5;
        this.var_3800.graphics.beginFill(16777215);
        this.var_3800.graphics.lineTo(0, const_1970);
        this.var_3800.graphics.lineTo(Number(const_1970) * 0.5, Number(const_1970) * 0.5);
        this.var_3800.graphics.lineTo(0, 0);
    }

    public function setPosition(param1: int, param2: int): void {
        this.x = param1;
        this.y = param2;
    }
}
}
