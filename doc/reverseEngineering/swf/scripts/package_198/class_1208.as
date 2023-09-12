package package_198 {

import away3d.arcane;

import flash.display.Shape;
import flash.display.Stage3D;
import flash.display3D.Context3D;
import flash.display3D.Context3DClearMask;
import flash.display3D.Context3DRenderMode;
import flash.display3D.Program3D;
import flash.display3D.textures.TextureBase;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Rectangle;

import package_199.class_1209;

import package_291.class_1745;

public class class_1208 extends EventDispatcher {

    private static var var_4971: Shape = new Shape();


    arcane var var_4582: Context3D;

    arcane var var_1572: int = -1;

    private var var_899: Boolean;

    private var _profile: String;

    private var var_1824: Stage3D;

    private var var_2007: Program3D;

    private var var_1766: Stage3DManager;

    private var var_2141: int;

    private var var_67: int;

    private var var_29: int;

    private var var_828: Boolean;

    private var var_2056: Boolean = true;

    private var var_2232: TextureBase;

    private var var_4191: int;

    private var var_2547: Rectangle;

    private var _color: uint;

    private var var_3510: Boolean;

    private var var_657: Rectangle;

    private var var_2924: Event;

    private var var_2677: Event;

    private var var_3343: class_1209;

    private var var_598: Boolean;

    private var var_4744: Boolean;

    private var var_1100: class_1746;

    private var var_2247: Touch3DManager;

    public function class_1208(param1: int, param2: Stage3D, param3: Stage3DManager, param4: Boolean = false, param5: String = "baseline") {
        super();
        this.arcane::var_1572 = param1;
        this.var_1824 = param2;
        this.var_1824.x = 0;
        this.var_1824.y = 0;
        this.var_1824.visible = true;
        this.var_1766 = param3;
        this.var_657 = new Rectangle();
        this.var_828 = true;
        this.var_1824.addEventListener(Event.CONTEXT3D_CREATE, this.method_2092, false, 1000, false);
        this.requestContext(param4, param5);
    }

    private function method_4357(): void {
        if (this.var_598) {
            return;
        }
        this.var_598 = true;
        if (!hasEventListener(class_1209.const_3195)) {
            return;
        }
        this.var_3343 = new class_1209(class_1209.const_3195);
        dispatchEvent(this.var_3343);
    }

    private function method_5455(): void {
        if (!hasEventListener(Event.ENTER_FRAME)) {
            return;
        }
        if (!this.var_2924) {
            this.var_2924 = new Event(Event.ENTER_FRAME);
        }
        dispatchEvent(this.var_2924);
    }

    private function method_586(): void {
        if (!hasEventListener(Event.EXIT_FRAME)) {
            return;
        }
        if (!this.var_2677) {
            this.var_2677 = new Event(Event.EXIT_FRAME);
        }
        dispatchEvent(this.var_2677);
    }

    public function get profile(): String {
        return this._profile;
    }

    public function dispose(): void {
        this.var_1766.arcane::method_2967(this);
        this.var_1824.removeEventListener(Event.CONTEXT3D_CREATE, this.method_2092);
        this.method_2892();
        this.var_1824 = null;
        this.var_1766 = null;
        this.arcane::var_1572 = -1;
    }

    public function configureBackBuffer(param1: int, param2: int, param3: int): void {
        if (param1 < 50) {
            param1 = 50;
        }
        if (param2 < 50) {
            param2 = 50;
        }
        var _loc4_: uint = uint(this.var_2141);
        var _loc5_: uint = uint(this.var_67);
        this.var_2141 = this.var_657.width = param1;
        this.var_67 = this.var_657.height = param2;
        if (_loc4_ != this.var_2141 || _loc5_ != this.var_67) {
            this.method_4357();
        }
        this.var_29 = param3;
        if (this.arcane::var_4582) {
            this.arcane::var_4582.configureBackBuffer(param1, param2, param3, this.var_2056);
        }
    }

    public function get method_658(): Boolean {
        return this.var_828;
    }

    public function set method_658(param1: Boolean): void {
        this.var_828 = param1;
        this.var_3510 = true;
    }

    public function get renderTarget(): TextureBase {
        return this.var_2232;
    }

    public function get method_351(): int {
        return this.var_4191;
    }

    public function setRenderTarget(param1: TextureBase, param2: Boolean = false, param3: int = 0): void {
        if (this.var_2232 == param1 && param3 == this.var_4191 && this.var_828 == param2) {
            return;
        }
        this.var_2232 = param1;
        this.var_4191 = param3;
        this.var_828 = param2;
        if (param1) {
            this.arcane::var_4582.setRenderToTexture(param1, param2, this.var_29, param3);
        } else {
            this.arcane::var_4582.setRenderToBackBuffer();
        }
    }

    public function clear(): void {
        if (!this.arcane::var_4582) {
            return;
        }
        if (this.var_3510) {
            this.configureBackBuffer(this.var_2141, this.var_67, this.var_29);
            this.var_3510 = false;
        }
        this.arcane::var_4582.clear((Number(this._color) >> 16 & 255) / 255, (Number(this._color) >> 8 & 255) / 255, (Number(this._color) & 255) / 255, (Number(this._color) >> 24 & 255) / 255);
        this.var_4744 = true;
    }

    public function present(): void {
        if (!this.arcane::var_4582) {
            return;
        }
        this.arcane::var_4582.present();
        this.var_2007 = null;
        if (this.var_1100) {
            this.var_1100.method_2533();
        }
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
        if ((param1 == Event.ENTER_FRAME || param1 == Event.EXIT_FRAME) && !var_4971.hasEventListener(Event.ENTER_FRAME)) {
            var_4971.addEventListener(Event.ENTER_FRAME, this.onEnterFrame, param3, param4, param5);
        }
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
        if (!hasEventListener(Event.ENTER_FRAME) && !hasEventListener(Event.EXIT_FRAME) && Boolean(var_4971.hasEventListener(Event.ENTER_FRAME))) {
            var_4971.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame, param3);
        }
    }

    public function get method_2358(): Rectangle {
        return this.var_2547;
    }

    public function set method_2358(param1: Rectangle): void {
        this.var_2547 = param1;
        this.arcane::var_4582.setScissorRectangle(this.var_2547);
    }

    public function get method_1611(): int {
        return this.arcane::var_1572;
    }

    public function get stage3D(): Stage3D {
        return this.var_1824;
    }

    public function get context3D(): Context3D {
        return this.arcane::var_4582;
    }

    public function get driverInfo(): String {
        return !!this.arcane::var_4582 ? this.arcane::var_4582.driverInfo : null;
    }

    public function get method_4948(): Boolean {
        return this.var_899;
    }

    public function get x(): Number {
        return this.var_1824.x;
    }

    public function set x(param1: Number): void {
        if (this.var_657.x == param1) {
            return;
        }
        this.var_1824.x = this.var_657.x = param1;
        this.method_4357();
    }

    public function get y(): Number {
        return this.var_1824.y;
    }

    public function set y(param1: Number): void {
        if (this.var_657.y == param1) {
            return;
        }
        this.var_1824.y = this.var_657.y = param1;
        this.method_4357();
    }

    public function get width(): int {
        return this.var_2141;
    }

    public function set width(param1: int): void {
        if (this.var_657.width == param1) {
            return;
        }
        if (param1 < 50) {
            param1 = 50;
        }
        this.var_2141 = this.var_657.width = param1;
        this.var_3510 = true;
        this.method_4357();
    }

    public function get height(): int {
        return this.var_67;
    }

    public function set height(param1: int): void {
        if (this.var_657.height == param1) {
            return;
        }
        if (param1 < 50) {
            param1 = 50;
        }
        this.var_67 = this.var_657.height = param1;
        this.var_3510 = true;
        this.method_4357();
    }

    public function get method_6236(): int {
        return this.var_29;
    }

    public function set method_6236(param1: int): void {
        this.var_29 = param1;
        this.var_3510 = true;
    }

    public function get viewPort(): Rectangle {
        this.var_598 = false;
        return this.var_657;
    }

    public function get color(): uint {
        return this._color;
    }

    public function set color(param1: uint): void {
        this._color = param1;
    }

    public function get visible(): Boolean {
        return this.var_1824.visible;
    }

    public function set visible(param1: Boolean): void {
        this.var_1824.visible = param1;
    }

    public function get method_4768(): Boolean {
        return this.var_4744;
    }

    public function set method_4768(param1: Boolean): void {
        this.var_4744 = param1;
    }

    public function get method_987(): class_1746 {
        return this.var_1100;
    }

    public function set method_987(param1: class_1746): void {
        this.var_1100 = param1;
    }

    public function get method_5961(): Touch3DManager {
        return this.var_2247;
    }

    public function set method_5961(param1: Touch3DManager): void {
        this.var_2247 = param1;
    }

    private function method_2892(): void {
        if (this.arcane::var_4582) {
            if (this.arcane::var_4582.dispose.length == 0) {
                this.arcane::var_4582.dispose();
            } else {
                this.arcane::var_4582.dispose(false);
            }
            dispatchEvent(new class_1209(class_1209.const_1595));
        }
        this.arcane::var_4582 = null;
    }

    private function method_2092(param1: Event): void {
        var _loc2_: * = false;
        if (this.var_1824.context3D) {
            _loc2_ = this.arcane::var_4582 != null;
            this.arcane::var_4582 = this.var_1824.context3D;
            this.arcane::var_4582.enableErrorChecking = class_1745.active;
            this.var_899 = this.arcane::var_4582.driverInfo.indexOf("Software") == 0;
            if (Boolean(this.var_2141) && Boolean(this.var_67)) {
                this.arcane::var_4582.configureBackBuffer(this.var_2141, this.var_67, this.var_29, this.var_2056);
            }
            dispatchEvent(new class_1209(_loc2_ ? "null" : class_1209.const_2496));
            return;
        }
        throw new Error("Rendering context lost!");
    }

    public function requestContext(param1: Boolean = false, param2: String = "baseline"): void {
        var renderMode: String;
        var forceSoftware: Boolean = param1;
        var profile: String = param2;
        this.var_899 = Boolean(this.var_899) || forceSoftware;
        this._profile = profile;
        renderMode = forceSoftware ? "null" : Context3DRenderMode.AUTO;
        if (profile == "baseline") {
            this.var_1824.requestContext3D(renderMode);
        } else {
            try {
                this.var_1824["requestContext3D"](renderMode, profile);
            } catch (error: Error) {
                throw "An error occurred creating a context using the given profile. Profiles are not supported for the SDK this was compiled with.";
            }
        }
    }

    private function onEnterFrame(param1: Event): void {
        if (!this.arcane::var_4582) {
            return;
        }
        this.clear();
        this.method_5455();
        this.present();
        this.method_586();
    }

    public function method_4586(): Boolean {
        if (!this.arcane::var_4582) {
            return false;
        }
        if (this.arcane::var_4582.driverInfo == "Disposed") {
            this.arcane::var_4582 = null;
            dispatchEvent(new class_1209(class_1209.const_1595));
            return false;
        }
        return true;
    }

    public function method_4083(): void {
        if (!this.arcane::var_4582) {
            return;
        }
        this.arcane::var_4582.clear(0, 0, 0, 1, 1, 0, Context3DClearMask.DEPTH);
    }

    public function get method_133(): Boolean {
        return this.var_2056;
    }

    public function set method_133(param1: Boolean): void {
        this.var_2056 = param1;
        this.var_3510 = true;
    }
}
}
