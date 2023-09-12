package package_30 {

import com.bigpoint.utils.class_129;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.greensock.easing.Linear;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Timer;

import mx.utils.StringUtil;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.gui.class_176;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.settings.Settings;

import package_26.class_333;
import package_26.class_94;

import package_9.ResourceManager;
import package_9.class_50;

public class class_130 extends class_91 {

    public static var var_904: String = "|";

    public static var var_70: int = 0;

    public static var var_1665: int = 1;


    private var guiManager: class_58;

    private var icon: Bitmap;

    private var _textField: TextField;

    private var var_5050: int;

    public var languageKey: String;

    private var textFieldWidth: int;

    private var var_3287: Array;

    private var var_227: Array;

    private var var_3437: Array;

    private var var_1925: class_333;

    private var bg: Bitmap;

    private var textColor: int;

    public var var_226: RegExp;

    private var var_1530: int;

    private var var_3506: Timer;

    private var var_1666: int;

    private var label: String;

    private var var_3990: int;

    public function class_130(param1: class_58, param2: int, param3: Bitmap, param4: int = -1, param5: Array = null, param6: String = null, param7: int = 0, param8: int = 1) {
        this.var_5050 = var_70;
        this.var_227 = [];
        super(param2);
        this.guiManager = param1;
        this.icon = param3;
        if (param6 != null) {
            this.method_2330(class_88.getItem(param6));
        }
        this.languageKey = param6;
        this.var_3287 = param5;
        this.textFieldWidth = param4;
        this.var_5050 = param7;
        this.var_3990 = param8;
        this.init();
    }

    public function method_5018(param1: int, param2: Boolean): void {
        var _loc3_: Bitmap = this.var_227[param1];
        _loc3_.visible = param2;
    }

    public function method_2330(param1: String): void {
        this.var_1925 = class_94.getInstance().method_1211(this, param1);
    }

    public function method_467(param1: Bitmap): void {
        this.removeChild(this.icon);
        this.icon = param1;
        this.addChild(this.icon);
    }

    public function method_6304(param1: Number): void {
        TweenMax.to(this._textField, param1, {
            "yoyo": true,
            "repeat": -1,
            "alpha": 1,
            "ease": Linear.easeNone,
            "startAt": {"alpha": 0.2}
        });
    }

    public function method_2341(): void {
        TweenMax.killTweensOf(this._textField);
        this._textField.alpha = 1;
    }

    public function init(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        addChild(this.icon);
        if (id == const_840) {
            _loc1_ = ResourceManager.getBitmap("ui", "cbInfoIcon_timer");
            _loc1_.name = "CLOCK_ICON";
            _loc1_.x = this.icon.width + 5;
            _loc1_.visible = false;
            addChild(_loc1_);
        }
        this._textField = new TextField();
        this._textField.wordWrap = this.var_3990 > 1;
        this._textField.defaultTextFormat = class_18.const_1147;
        this._textField.embedFonts = class_18.var_3322;
        this._textField.antiAliasType = AntiAliasType.ADVANCED;
        this._textField.mouseEnabled = false;
        this._textField.selectable = false;
        this.textColor = int(class_18.const_1147.color);
        if (this.textFieldWidth == -1) {
            this._textField.autoSize = TextFieldAutoSize.LEFT;
        } else {
            this._textField.width = this.textFieldWidth;
            this._textField.defaultTextFormat = class_18.const_2726;
        }
        this._textField.textColor = this.textColor;
        this._textField.height = 20 * Number(this.var_3990);
        this._textField.x = this.icon.width + 5;
        this._textField.y = Number(height) * 0.1;
        if (this.var_3287 != null) {
            this.bg = ResourceManager.getBitmap("ui", "bar_background");
            this.bg.x = this.icon.width + 5;
            this.bg.y = Number(this.icon.height) / 2 - 6.5;
            addChild(this.bg);
            this.var_3437 = new Array();
            for each(_loc2_ in this.var_3287) {
                _loc3_ = ResourceManager.getBitmap("ui", _loc2_);
                _loc3_.x = this.icon.width + 5;
                _loc3_.y = Number(this.icon.height) / 2 - _loc3_.height / 2;
                this.var_227.push(_loc3_);
                _loc4_ = new Sprite();
                this.var_3437.push(_loc4_);
                _loc4_.graphics.beginFill(65535);
                _loc4_.graphics.drawRect(0, 0, 62, 14);
                _loc4_.graphics.endFill();
                _loc4_.x = this.icon.width + 5;
                _loc4_.y = Number(this.icon.height) / 2 - 6.5;
                addChild(_loc4_);
            }
            addEventListener(MouseEvent.CLICK, this.method_5532);
            buttonMode = true;
            this.guiManager.method_5352(this);
        }
        if (id == const_2130) {
            this.addEventListener(MouseEvent.CLICK, this.method_1740);
            this.buttonMode = true;
        }
        this.updateView();
    }

    public function cleanup(): void {
        if (this.id == const_2130) {
            this.removeEventListener(MouseEvent.CLICK, this.method_1740);
        }
        if (this.var_1925 != null) {
            class_94.getInstance().method_4247(this);
        }
    }

    private function method_1740(param1: MouseEvent): void {
        var _loc2_: int = 0;
        if (_loc2_ == 1) {
            class_50.getInstance().method_1772.method_991(2);
        } else if (_loc2_ == 2) {
            class_50.getInstance().method_1772.method_991(1);
        }
    }

    private function method_5532(param1: MouseEvent): void {
        if (this.var_5050 == var_70) {
            this.var_5050 = var_1665;
        } else if (this.var_5050 == var_1665) {
            this.var_5050 = var_70;
        }
        this.updateView();
        var _loc2_: class_176 = this.guiManager.method_1262(this.id);
        if (_loc2_ != null) {
            _loc2_.var_3041 = this.var_5050;
        } else {
            this.guiManager.method_3714(new class_176(this.id, this.var_5050));
        }
        this.guiManager.method_5457(this);
    }

    public function method_448(): int {
        return this.var_5050;
    }

    public function method_5900(param1: int): void {
        if (this.var_5050 != param1) {
            this.var_5050 = param1;
            this.updateView();
        }
    }

    public function updateView(): void {
        var _loc1_: * = null;
        if (this.var_5050 == var_70 && this.var_3287 != null) {
            for each(_loc1_ in this.var_227) {
                this.addChild(_loc1_);
                _loc1_.alpha = 0;
                TweenLite.to(_loc1_, 0.25, {"alpha": 1});
            }
            if (this.bg != null) {
                if (!this.contains(this.bg)) {
                    this.addChild(this.bg);
                    this.setChildIndex(this.bg, 0);
                }
            }
            if (this.contains(this._textField)) {
                this.removeChild(this._textField);
            }
        } else {
            for each(_loc1_ in this.var_227) {
                if (_loc1_ != null && Boolean(this.contains(_loc1_))) {
                    this.removeChild(_loc1_);
                }
            }
            if (this.bg != null) {
                if (this.contains(this.bg)) {
                    this.removeChild(this.bg);
                }
            }
            addChild(this._textField);
            this._textField.alpha = 0;
            TweenMax.to(this._textField, 0.25, {"alpha": 1});
        }
        if (this.textFieldWidth == -1) {
            this._textField.autoSize = TextFieldAutoSize.LEFT;
        }
    }

    public function method_2518(param1: String): void {
        this._textField.text = StringUtil.trim(param1);
    }

    public function setColor(param1: int): void {
        this.textColor = param1;
        this._textField.textColor = this.textColor;
    }

    public function setText(param1: String, param2: Boolean = true): void {
        if (this.var_1925 != null) {
            if (param2) {
                this.var_1925.method_1455(class_88.getItem(this.languageKey) + "\n" + param1);
            } else if (this.var_226 != null) {
                this.var_1925.method_1455(class_88.getItem(this.languageKey).replace(this.var_226, param1));
            } else {
                this.var_1925.method_1455(class_88.getItem(this.languageKey));
            }
        }
    }

    public function updateTooltip(param1: String): void {
        if (this.var_1925 != null) {
            this.var_1925.method_1455(param1);
        }
    }

    public function method_4984(param1: int, param2: int, param3: Boolean = true, param4: int = 0): void {
        var _loc7_: Number = NaN;
        var _loc5_: Bitmap = this.var_227[param4];
        var _loc6_: Sprite = this.var_3437[param4];
        if (Boolean(_loc5_) && Boolean(_loc6_)) {
            _loc5_.mask = _loc6_;
            if (param2 == 0) {
                _loc6_.width = 62;
                return;
            }
            _loc7_ = param1 * 62 / param2;
            if (param3) {
                TweenLite.to(_loc6_, 0.5, {"width": _loc7_});
            } else {
                _loc6_.width = _loc7_;
            }
        }
    }

    public function method_4394(param1: int, param2: String = ""): void {
        this.label = param2;
        this.var_1530 = param1;
        if (this.var_3506 != null) {
            this.method_1026();
        }
        this.var_3506 = new Timer(1000, 0);
        this.var_3506.addEventListener(TimerEvent.TIMER, this.method_2827);
        this.var_3506.start();
        this.var_1666 = 1;
    }

    private function method_2827(param1: TimerEvent): void {
        var _loc2_: int = Number(this.var_1530) - Number(this.var_1666++);
        if (_loc2_ < 0) {
            _loc2_ = 0;
        }
        if (_loc2_ == 0 && this.var_3506 != null) {
            this.method_1026();
        }
        this.method_4373(_loc2_);
    }

    private function method_4373(param1: int): void {
        this.method_2518(class_129.method_1101(param1));
    }

    private function method_1026(): void {
        this.var_3506.stop();
        this.var_3506.removeEventListener(TimerEvent.TIMER, this.method_2827);
    }

    public function get textField(): TextField {
        return this._textField;
    }
}
}
