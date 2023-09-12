package package_278 {

import com.greensock.TweenLite;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;

public class class_1689 extends MovieClip {

    public static const const_1960: uint = 1;

    public static const const_142: int = 2;

    public static const const_2646: uint = 3;

    public static const const_271: uint = 4;

    public static const const_34: uint = 5;

    public static const const_1004: uint = 6;

    public static const const_1936: uint = 7;

    public static const const_400: uint = 8;

    public static const const_1476: uint = 9;

    public static const const_473: uint = 10;

    public static const const_1972: uint = 11;

    public static const const_753: uint = 12;

    public static const const_1186: uint = 13;

    public static const const_1188: int = 14;

    public static const const_2840: int = 15;


    private var _type: int;

    private var var_2516: Bitmap;

    private var var_4437: Bitmap;

    private var var_2149: Bitmap;

    private var _state: Boolean;

    private var var_476: Boolean;

    private var var_3772: Boolean;

    private var _enabled: Boolean = true;

    private var var_144: Array;

    private var var_1932: Function;

    private var var_934: Boolean;

    public function class_1689() {
        super();
        this.var_2516 = new Bitmap(new BitmapData(16, 16, true, 2298413311));
        addChild(this.var_2516);
        this.var_144 = [];
        this.var_144[const_1004] = "kick";
        this.var_144[const_34] = "promote";
        this.var_144[const_753] = "inv_group";
        this.var_144[const_1186] = "inv_boss";
        this.var_144[const_1960] = "leave";
        this.var_144[const_271] = "follow";
        this.var_144[const_2646] = "ping";
        this.var_144[const_1476] = "rejectinv";
        this.var_144[const_473] = "acceptinv";
        this.var_144[const_1972] = "revokeinv";
        this.var_144[const_400] = "sendinv";
        this.var_144[const_2840] = "blockinv";
        this.var_144[const_1188] = "allowinv";
        this.activate();
    }

    public function method_2461(): Boolean {
        return this.var_934;
    }

    public function activate(): void {
        this.var_934 = true;
        if (this.var_1932 != null) {
            addEventListener(MouseEvent.CLICK, this.var_1932);
        }
        this.method_5175();
    }

    public function deactivate(): void {
        this.var_934 = false;
        if (this.var_1932 != null) {
            removeEventListener(MouseEvent.CLICK, this.var_1932);
        }
        this.method_5793();
    }

    public function toggle(param1: Boolean): void {
        if (param1) {
            alpha = 1;
        } else {
            alpha = 0.5;
        }
    }

    public function init(param1: BitmapData, param2: BitmapData = null, param3: BitmapData = null): void {
        if (contains(this.var_2516)) {
            removeChild(this.var_2516);
        }
        this.var_2516 = new Bitmap(param1.clone());
        if (param2 == null) {
            this.var_4437 = new Bitmap(param1.clone());
        } else {
            this.var_476 = true;
            this.var_4437 = new Bitmap(param2.clone());
        }
        if (param3 == null) {
            this.var_2149 = new Bitmap(param1.clone());
        } else {
            this.var_2149 = new Bitmap(param3.clone());
        }
        addChild(this.var_2516);
        addChild(this.var_4437);
        this.var_4437.visible = false;
        addChild(this.var_2149);
        this.var_2149.visible = false;
        if (this.var_476) {
            this.method_5175();
        }
    }

    private function method_5175(): void {
        if (!this.var_3772) {
            addEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.handleMouseOut);
            this.var_3772 = true;
        }
    }

    private function method_5793(): void {
        if (this.var_3772) {
            removeEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, this.handleMouseOut);
            this.var_3772 = false;
        }
    }

    private function handleMouseOut(param1: MouseEvent): void {
        TweenLite.to(this.var_4437, 0.5, {
            "alpha": 0,
            "onComplete": this.method_4759,
            "onCompleteParams": [this.var_4437]
        });
    }

    private function handleMouseOver(param1: MouseEvent): void {
        this.var_4437.alpha = 0;
        this.var_4437.visible = true;
        TweenLite.to(this.var_4437, 0.5, {"alpha": 1});
    }

    private function method_4759(param1: DisplayObject): void {
        param1.visible = false;
    }

    public function set handleClick(param1: Function): void {
        if (this.var_1932 != null) {
            removeEventListener(MouseEvent.CLICK, this.var_1932);
        }
        this.var_1932 = param1;
        if (this.var_1932 != null) {
            addEventListener(MouseEvent.CLICK, this.var_1932);
        }
    }

    public function get handleClick(): Function {
        return this.var_1932;
    }

    public function get method_5980(): String {
        return this.var_144[this._type];
    }

    public function get type(): int {
        return this._type;
    }

    public function set type(param1: int): void {
        this._type = param1;
    }

    public function get stdImage(): Bitmap {
        return this.var_2516;
    }

    public function set stdImage(param1: Bitmap): void {
        this.var_2516 = param1;
    }

    public function get hoverImage(): Bitmap {
        return this.var_4437;
    }

    public function set hoverImage(param1: Bitmap): void {
        this.var_4437 = param1;
    }

    public function get disabledImage(): Bitmap {
        return this.var_2149;
    }

    public function set disabledImage(param1: Bitmap): void {
        this.var_2149 = param1;
    }

    public function get state(): Boolean {
        return this._state;
    }

    public function set state(param1: Boolean): void {
        this._state = param1;
    }

    override public function get enabled(): Boolean {
        return this._enabled;
    }

    override public function set enabled(param1: Boolean): void {
        this._enabled = param1;
    }
}
}
