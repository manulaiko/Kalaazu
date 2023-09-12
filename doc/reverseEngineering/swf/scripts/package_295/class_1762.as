package package_295 {

import away3d.*;

import flash.display.*;
import flash.display3D.*;
import flash.display3D.textures.*;
import flash.events.*;
import flash.geom.*;
import flash.net.*;
import flash.ui.*;
import flash.utils.*;

import package_198.*;

import package_199.*;

import package_296.*;

import package_299.*;

import package_300.*;

import package_305.*;

import package_306.*;

import package_369.*;

import package_376.*;

public class class_1762 extends Sprite {


    private var _width: Number = 0;

    private var _height: Number = 0;

    private var var_1892: Point;

    private var var_2101: Point;

    private var var_2034: Boolean;

    protected var var_1927: class_2128;

    protected var var_116: class_1767;

    protected var var_2576: class_2145;

    protected var var_2640: Number;

    private var _time: Number = 0;

    private var var_4404: uint;

    private var _backgroundColor: uint = 0;

    private var _backgroundAlpha: Number = 1;

    protected var var_1100: class_1746;

    protected var var_2247: Touch3DManager;

    protected var var_811: class_1759;

    protected var var_2200: class_1759;

    private var var_905: class_2152;

    private var var_2172: Boolean;

    private var var_2520: Boolean;

    protected var var_1470: class_2155;

    protected var var_411: Boolean;

    protected var var_679: Texture;

    private var var_4229: Boolean = true;

    private var var_330: Sprite;

    protected var var_2624: Boolean;

    private var _background: class_2116;

    protected var _stage3DProxy: class_1208;

    protected var var_3336: Boolean = true;

    private var var_29: uint;

    protected var var_5030: RTTBufferManager;

    private var var_1230: Boolean = true;

    private var var_5042: String;

    private var var_631: ContextMenuItem;

    private var var_2339: ContextMenuItem;

    private var var_4709: ContextMenu;

    protected var var_1338: Boolean = false;

    protected var var_2547: Rectangle;

    private var var_46: Boolean = true;

    private var var_598: Boolean = true;

    private var var_3671: Boolean;

    private var _profile: String;

    private var var_2139: Boolean = false;

    private var var_633: Vector.<class_1767>;

    private var var_3577: Vector.<class_1758>;

    private var _container: class_1752;

    public function class_1762(param1: class_2128 = null, param2: class_1767 = null, param3: class_1759 = null, param4: Boolean = false, param5: String = "baseline") {
        this.var_1892 = new Point();
        this.var_2101 = new Point();
        super();
        this._profile = param5;
        this.var_1927 = param1 || new class_2128();
        this.var_1927.addEventListener(class_2129.const_244, this.method_3748);
        this.var_116 = param2 || new class_1767();
        this.var_811 = param3 || new class_2154();
        this.var_905 = new class_2152();
        this.var_2520 = param4;
        this.var_2576 = this.var_811.arcane::method_1416();
        this.var_2576.camera = this.var_116;
        this.var_2547 = new Rectangle();
        this.method_4153();
        this.var_1100 = new class_1746();
        this.var_1100.method_4154(this);
        this.var_2247 = new Touch3DManager();
        this.var_2247.view = this;
        this.var_2247.method_2058(this);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage, false, 0, true);
        addEventListener(Event.ADDED, this.method_1896, false, 0, true);
        this.var_116.addEventListener(class_2153.const_1507, this.method_931);
        this.var_116.method_4119 = this.var_1927.method_4119;
        this.method_3945();
    }

    private function viewSource(param1: ContextMenuEvent): void {
        var _loc2_: URLRequest = new URLRequest(this.var_5042);
        try {
            navigateToURL(_loc2_, "_blank");
        } catch (error: Error) {
        }
    }

    public function get method_2860(): Boolean {
        return this.var_3671;
    }

    public function set method_2860(param1: Boolean): void {
        this.var_3671 = param1;
    }

    private function method_2921(param1: ContextMenuEvent): void {
        var _loc2_: String = "null";
        var _loc3_: URLRequest = new URLRequest(_loc2_);
        try {
            navigateToURL(_loc3_);
        } catch (error: Error) {
        }
    }

    private function method_3945(): void {
        this.var_631 = new ContextMenuItem("Away3D.com\tvundefined.undefined.undefined", true, true, true);
        this.var_2339 = new ContextMenuItem("View Source", true, true, true);
        this.var_631.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, this.method_2921);
        this.var_2339.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, this.viewSource);
        this.var_4709 = new ContextMenu();
        this.method_5474();
    }

    private function method_5474(): void {
        if (this.var_1230) {
            this.var_4709.customItems = !!this.var_5042 ? [this.var_631, this.var_2339] : [this.var_631];
        } else {
            this.var_4709.customItems = [];
        }
        contextMenu = this.var_4709;
    }

    private function method_3748(param1: class_2129): void {
        if (this.var_116) {
            this.var_116.method_4119 = this.scene.method_4119;
        }
    }

    public function get method_2691(): Boolean {
        return this.var_1230;
    }

    public function set method_2691(param1: Boolean): void {
        this.var_1230 = param1;
        this.method_5474();
    }

    public function get stage3DProxy(): class_1208 {
        return this._stage3DProxy;
    }

    public function set stage3DProxy(param1: class_1208): void {
        if (this._stage3DProxy) {
            this._stage3DProxy.removeEventListener(class_1209.const_3195, this.method_1843);
            this._stage3DProxy.removeEventListener(class_1209.const_2172, this.method_2082);
        }
        this._stage3DProxy = param1;
        this._stage3DProxy.addEventListener(class_1209.const_3195, this.method_1843);
        this._stage3DProxy.addEventListener(class_1209.const_2172, this.method_2082);
        this.var_811.arcane::stage3DProxy = this.var_905.arcane::stage3DProxy = this._stage3DProxy;
        this.var_2034 = true;
        this.var_3336 = true;
    }

    private function method_2082(param1: class_1209): void {
        this.var_4229 = true;
    }

    public function get method_479(): Boolean {
        return this.var_1100.method_479;
    }

    public function set method_479(param1: Boolean): void {
        this.var_1100.method_479 = param1;
        this.var_2247.method_2790 = param1;
    }

    public function get background(): class_2116 {
        return this._background;
    }

    public function set background(param1: class_2116): void {
        this._background = param1;
        this.var_811.arcane::background = this._background;
    }

    public function get method_1631(): Boolean {
        return this.var_2139;
    }

    public function set method_1631(param1: Boolean): void {
        this.var_2139 = param1;
    }

    private function method_4153(): void {
        this.var_330 = new Sprite();
        this.var_330.alpha = 0;
        this.var_330.doubleClickEnabled = true;
        this.var_330.graphics.beginFill(0);
        this.var_330.graphics.drawRect(0, 0, 100, 100);
        addChild(this.var_330);
    }

    override public function get filters(): Array {
        throw new Error("filters is not supported in View3D. Use filters3d instead.");
    }

    override public function set filters(param1: Array): void {
        throw new Error("filters is not supported in View3D. Use filters3d instead.");
    }

    public function get method_6029(): Vector.<class_1768> {
        return !!this.var_1470 ? this.var_1470.filters : null;
    }

    public function set method_6029(param1: Vector.<class_1768>): void {
        if (Boolean(param1) && param1.length == 0) {
            param1 = null;
        }
        if (Boolean(this.var_1470) && !param1) {
            this.var_1470.dispose();
            this.var_1470 = null;
        } else if (!this.var_1470 && Boolean(param1)) {
            this.var_1470 = new class_2155(this.stage3DProxy);
            this.var_1470.filters = param1;
        }
        if (this.var_1470) {
            this.var_1470.filters = param1;
            this.var_411 = this.var_1470.method_4805;
        } else {
            this.var_411 = false;
            if (this.var_679) {
                this.var_679.dispose();
                this.var_679 = null;
            }
        }
    }

    public function get renderer(): class_1759 {
        return this.var_811;
    }

    public function set renderer(param1: class_1759): void {
        this.var_811.arcane::dispose();
        this.var_811 = param1;
        this.var_2576 = this.var_811.arcane::method_1416();
        this.var_2576.camera = this.var_116;
        this.var_811.arcane::stage3DProxy = this._stage3DProxy;
        this.var_811.method_6236 = this.var_29;
        this.var_811.arcane::method_2738 = (Number(this._backgroundColor) >> 16 & 255) / 255;
        this.var_811.arcane::method_699 = (Number(this._backgroundColor) >> 8 & 255) / 255;
        this.var_811.arcane::method_5020 = (Number(this._backgroundColor) & 255) / 255;
        this.var_811.arcane::backgroundAlpha = this._backgroundAlpha;
        this.var_811.arcane::viewWidth = this._width;
        this.var_811.arcane::viewHeight = this._height;
        this.var_3336 = true;
    }

    public function get backgroundColor(): uint {
        return this._backgroundColor;
    }

    public function set backgroundColor(param1: uint): void {
        this._backgroundColor = param1;
        this.var_811.arcane::method_2738 = (param1 >> 16 & 255) / 255;
        this.var_811.arcane::method_699 = (param1 >> 8 & 255) / 255;
        this.var_811.arcane::method_5020 = (param1 & 255) / 255;
    }

    public function get backgroundAlpha(): Number {
        return this._backgroundAlpha;
    }

    public function set backgroundAlpha(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_811.arcane::backgroundAlpha = param1;
        this._backgroundAlpha = param1;
    }

    public function get camera(): class_1767 {
        return this.var_116;
    }

    public function set camera(param1: class_1767): void {
        this.var_116.removeEventListener(class_2153.const_1507, this.method_931);
        this.var_116 = param1;
        this.var_2576.camera = this.var_116;
        if (this.var_1927) {
            this.var_116.method_4119 = this.var_1927.method_4119;
        }
        this.var_116.addEventListener(class_2153.const_1507, this.method_931);
        this.var_46 = true;
        this.var_598 = true;
    }

    public function get scene(): class_2128 {
        return this.var_1927;
    }

    public function set scene(param1: class_2128): void {
        this.var_1927.removeEventListener(class_2129.const_244, this.method_3748);
        this.var_1927 = param1;
        this.var_1927.addEventListener(class_2129.const_244, this.method_3748);
        if (this.var_116) {
            this.var_116.method_4119 = this.var_1927.method_4119;
        }
    }

    public function get deltaTime(): uint {
        return this.var_4404;
    }

    override public function get width(): Number {
        return this._width;
    }

    override public function set width(param1: Number): void {
        if (this._stage3DProxy && this._stage3DProxy.method_4948 && param1 > 2048) {
            param1 = 2048;
        }
        if (this._width == param1) {
            return;
        }
        if (this.var_5030) {
            this.var_5030.viewWidth = param1;
        }
        this.var_330.width = param1;
        this._width = param1;
        this.var_2640 = Number(this._width) / Number(this._height);
        this.var_116.lens.arcane::aspectRatio = this.var_2640;
        this.var_4229 = true;
        this.var_811.arcane::viewWidth = param1;
        this.var_2547.width = param1;
        this.var_3336 = true;
        this.var_46 = true;
    }

    override public function get height(): Number {
        return this._height;
    }

    override public function set height(param1: Number): void {
        if (this._stage3DProxy && this._stage3DProxy.method_4948 && param1 > 2048) {
            param1 = 2048;
        }
        if (this._height == param1) {
            return;
        }
        if (this.var_5030) {
            this.var_5030.viewHeight = param1;
        }
        this.var_330.height = param1;
        this._height = param1;
        this.var_2640 = Number(this._width) / Number(this._height);
        this.var_116.lens.arcane::aspectRatio = this.var_2640;
        this.var_4229 = true;
        this.var_811.arcane::viewHeight = param1;
        this.var_2547.height = param1;
        this.var_3336 = true;
        this.var_46 = true;
    }

    override public function set x(param1: Number): void {
        if (x == param1) {
            return;
        }
        this.var_1892.x = super.x = param1;
        this.var_2101.x = !!parent ? Number(parent.localToGlobal(this.var_1892).x) : param1;
        this.var_2034 = true;
    }

    override public function set y(param1: Number): void {
        if (y == param1) {
            return;
        }
        this.var_1892.y = super.y = param1;
        this.var_2101.y = !!parent ? Number(parent.localToGlobal(this.var_1892).y) : param1;
        this.var_2034 = true;
    }

    override public function set visible(param1: Boolean): void {
        super.visible = param1;
        if (Boolean(this._stage3DProxy) && !this.var_1338) {
            this._stage3DProxy.visible = param1;
        }
    }

    public function get method_6236(): uint {
        return this.var_29;
    }

    public function set method_6236(param1: uint): void {
        this.var_29 = param1;
        this.var_811.method_6236 = param1;
        this.var_3336 = true;
    }

    public function get method_3135(): uint {
        return this.var_2576.name_42;
    }

    public function get shareContext(): Boolean {
        return this.var_1338;
    }

    public function set shareContext(param1: Boolean): void {
        if (this.var_1338 == param1) {
            return;
        }
        this.var_1338 = param1;
        this.var_2034 = true;
    }

    protected function method_3957(): void {
        if (Boolean(this._stage3DProxy.context3D) && !this.var_1338) {
            if (Boolean(this._width) && Boolean(this._height)) {
                if (this._stage3DProxy.method_4948) {
                    if (this._width > 2048) {
                        this._width = 2048;
                    }
                    if (this._height > 2048) {
                        this._height = 2048;
                    }
                }
                this._stage3DProxy.configureBackBuffer(this._width, this._height, this.var_29);
                this.var_3336 = false;
            } else {
                this.width = stage.stageWidth;
                this.height = stage.stageHeight;
            }
        }
    }

    public function method_1898(param1: String): void {
        this.var_5042 = param1;
        this.method_5474();
    }

    public function render(): void {
        var _loc1_: * = null;
        var _loc2_: Number = 0;
        if (!this.stage3DProxy.method_4586()) {
            this.var_3336 = true;
            return;
        }
        if (this.var_3336) {
            this.method_3957();
        }
        if (Boolean(this.var_1338) && Boolean(this.var_2139)) {
            this.stage3DProxy.method_4083();
        }
        if (this.var_2034) {
            this.method_5877();
        }
        this.name_134();
        this.method_6032();
        if (!this.var_1470 || !this._stage3DProxy.arcane::var_4582 || !(this.var_1470.getMainInputTexture(this._stage3DProxy) is CubeTexture)) {
            this.var_2576.clear();
            this.var_1927.method_2653(this.var_2576);
            if (this.var_411) {
                this.method_1750(this.var_2576);
            }
            if (this.var_3671) {
                this.method_3408(this.var_2576);
            }
            this.var_811.arcane::method_4728 = !this.var_3671;
        }
        if (Boolean(this.var_1470) && Boolean(this._stage3DProxy.arcane::var_4582)) {
            _loc1_ = this.var_1470.getMainInputTexture(this._stage3DProxy);
            if (_loc1_ is CubeTexture) {
                if (!this.var_633) {
                    this.method_2758();
                }
                this.scene.method_4119.method_5320();
                this._container.transform = this.var_116.transform;
                _loc2_ = 0;
                while (_loc2_ < 6) {
                    this.method_4379(_loc2_, this.scene, _loc1_);
                    _loc2_++;
                }
                this.var_1470.render(this._stage3DProxy, this.camera, this.var_679, this.var_1338);
            } else {
                this.var_811.arcane::render(this.var_2576, _loc1_, this.var_5030.method_2160);
                this.var_1470.render(this._stage3DProxy, this.camera, this.var_679, this.var_1338);
            }
        } else {
            this.var_811.arcane::shareContext = this.var_1338;
            if (this.var_1338) {
                this.var_811.arcane::render(this.var_2576, null, this.var_2547);
            } else {
                this.var_811.arcane::render(this.var_2576);
            }
        }
        if (!this.var_1338) {
            this.stage3DProxy.present();
        }
        if (!this.var_1470 || !this._stage3DProxy.arcane::var_4582 || !(this.var_1470.getMainInputTexture(this._stage3DProxy) is CubeTexture)) {
            this.var_2576.method_1140();
        }
        this.stage3DProxy.method_4768 = false;
    }

    protected function method_5877(): void {
        this.var_2034 = false;
        if (!this._stage3DProxy) {
            return;
        }
        if (this.var_1338) {
            this.var_2547.x = Number(this.var_2101.x) - Number(this._stage3DProxy.x);
            this.var_2547.y = Number(this.var_2101.y) - Number(this._stage3DProxy.y);
        } else {
            this.var_2547.x = 0;
            this.var_2547.y = 0;
            this._stage3DProxy.x = this.var_2101.x;
            this._stage3DProxy.y = this.var_2101.y;
        }
        this.var_46 = true;
    }

    protected function name_134(): void {
        var _loc1_: Number = getTimer();
        if (this._time == 0) {
            this._time = _loc1_;
        }
        this.var_4404 = _loc1_ - Number(this._time);
        this._time = _loc1_;
    }

    protected function method_6032(): void {
        this.var_116.lens.arcane::aspectRatio = this.var_2640;
        if (this.var_46) {
            this.var_46 = false;
            this.var_116.lens.arcane::method_1090(this.var_2547.x, this.var_2547.y, this.var_2547.width, this.var_2547.height);
        }
        if (this.var_598) {
            this.var_598 = false;
            this.var_116.lens.arcane::method_6149(this._stage3DProxy.viewPort.x, this._stage3DProxy.viewPort.y, this._stage3DProxy.viewPort.width, this._stage3DProxy.viewPort.height);
        }
        if (Boolean(this.var_1470) || Boolean(this.var_811.arcane::method_2502)) {
            this.var_811.arcane::method_5446 = this.var_5030.method_5446;
            this.var_811.arcane::method_1932 = this.var_5030.method_1932;
        } else {
            this.var_811.arcane::method_5446 = 1;
            this.var_811.arcane::method_1932 = 1;
        }
    }

    protected function method_3408(param1: class_2145): void {
        this.var_905.method_1981 = true;
        if (Boolean(this.var_1470) || Boolean(this.var_811.arcane::method_2502)) {
            this.var_905.arcane::method_5446 = this.var_5030.method_5446;
            this.var_905.arcane::method_1932 = this.var_5030.method_1932;
            this.var_905.arcane::render(param1, this.var_1470.getMainInputTexture(this._stage3DProxy), this.var_5030.method_2160);
        } else {
            this.var_905.arcane::method_5446 = 1;
            this.var_905.arcane::method_1932 = 1;
            this.var_905.arcane::render(param1);
        }
        this.var_905.method_1981 = false;
    }

    protected function method_1750(param1: class_2145): void {
        if (Boolean(this.var_4229) || !this.var_679) {
            this.method_5319(this._stage3DProxy.arcane::var_4582);
        }
        this.var_905.arcane::method_5446 = this.var_5030.method_5446;
        this.var_905.arcane::method_1932 = this.var_5030.method_1932;
        this.var_905.arcane::render(param1, this.var_679);
    }

    private function method_5319(param1: Context3D): void {
        this.var_4229 = false;
        if (this.var_679) {
            this.var_679.dispose();
        }
        this.var_679 = param1.createTexture(this.var_5030.method_1430, this.var_5030.method_1059, Context3DTextureFormat.BGRA, true);
    }

    public function dispose(): void {
        this._stage3DProxy.removeEventListener(class_1209.const_3195, this.method_1843);
        this._stage3DProxy.removeEventListener(class_1209.const_2172, this.method_2082);
        if (!this.shareContext) {
            this._stage3DProxy.dispose();
        }
        this.var_811.arcane::dispose();
        if (this.var_679) {
            this.var_679.dispose();
        }
        if (this.var_5030) {
            this.var_5030.dispose();
        }
        this.var_1100.method_2796(this);
        this.var_1100.dispose();
        this.var_2247.method_3726(this);
        this.var_2247.dispose();
        this.var_5030 = null;
        this.var_679 = null;
        this.var_1100 = null;
        this.var_2247 = null;
        this.var_905 = null;
        this._stage3DProxy = null;
        this.var_811 = null;
        this.var_2576 = null;
    }

    public function method_642(param1: Vector3D): Vector3D {
        var _loc2_: Vector3D = this.var_116.method_642(param1);
        _loc2_.x = (_loc2_.x + 1) * Number(this._width) / 2;
        _loc2_.y = (_loc2_.y + 1) * Number(this._height) / 2;
        return _loc2_;
    }

    public function method_3456(param1: Number, param2: Number, param3: Number, param4: Vector3D = null): Vector3D {
        return this.var_116.method_3456((param1 * 2 - Number(this._width)) / Number(this._stage3DProxy.width), (param2 * 2 - Number(this._height)) / Number(this._stage3DProxy.height), param3, param4);
    }

    public function method_6082(param1: Number, param2: Number, param3: Number): Vector3D {
        return this.var_116.method_6082((param1 * 2 - Number(this._width)) / Number(this._width), (param2 * 2 - Number(this._height)) / Number(this._height), param3);
    }

    public function get method_5992(): class_2096 {
        return this.var_1100.method_5992;
    }

    public function set method_5992(param1: class_2096): void {
        this.var_1100.method_5992 = param1;
    }

    public function get method_5222(): class_2096 {
        return this.var_2247.method_5222;
    }

    public function set method_5222(param1: class_2096): void {
        this.var_2247.method_5222 = param1;
    }

    arcane function get method_924(): class_2145 {
        return this.var_2576;
    }

    private function method_931(param1: class_2153): void {
        this.var_46 = true;
        this.var_598 = true;
    }

    private function onAddedToStage(param1: Event): void {
        if (this.var_2172) {
            return;
        }
        this.var_2172 = true;
        if (!this._stage3DProxy) {
            this._stage3DProxy = Stage3DManager.getInstance(stage).method_1484(this.var_2520, this._profile);
            this._stage3DProxy.addEventListener(class_1209.const_3195, this.method_1843);
            this._stage3DProxy.addEventListener(class_1209.const_2172, this.method_2082);
        }
        this.var_2034 = true;
        this.var_5030 = RTTBufferManager.getInstance(this._stage3DProxy);
        this.var_811.arcane::stage3DProxy = this.var_905.arcane::stage3DProxy = this._stage3DProxy;
        if (this._width == 0) {
            this.width = stage.stageWidth;
        } else {
            this.var_5030.viewWidth = this._width;
        }
        if (this._height == 0) {
            this.height = stage.stageHeight;
        } else {
            this.var_5030.viewHeight = this._height;
        }
        if (this.var_1338) {
            this.var_1100.method_2344(this);
        }
    }

    private function method_1896(param1: Event): void {
        this.var_2624 = parent == stage;
        this.var_2101 = parent.localToGlobal(this.var_1892);
        this.var_2034 = true;
    }

    private function method_1843(param1: class_1209): void {
        if (this.var_1338) {
            this.var_2547.x = Number(this.var_2101.x) - Number(this._stage3DProxy.x);
            this.var_2547.y = Number(this.var_2101.y) - Number(this._stage3DProxy.y);
            this.var_46 = true;
        }
        this.var_598 = true;
    }

    private function method_4379(param1: uint, param2: class_2128, param3: TextureBase): void {
        var _loc4_: class_1767;
        (_loc4_ = this.var_633[param1]).lens.method_5049 = this.var_116.lens.method_5049;
        _loc4_.lens.method_1840 = this.var_116.lens.method_1840;
        this.var_2576.camera = _loc4_;
        this.var_2576.clear();
        param2.method_2653(this.var_2576);
        this.var_2200.arcane::render(this.var_2576, param3, null, param1);
        this.var_2576.method_1140();
    }

    private function method_2758(): void {
        this.var_633 = new Vector.<class_1767>();
        this.var_3577 = new Vector.<class_1758>();
        this._container = new class_1752();
        this.scene.addChild(this._container);
        this.method_159(0, 90, 0);
        this.method_159(0, -90, 0);
        this.method_159(-90, 0, 0);
        this.method_159(90, 0, 0);
        this.method_159(0, 0, 0);
        this.method_159(0, 180, 0);
        this.var_2200 = new class_2154();
        this.var_2200.arcane::stage3DProxy = this.stage3DProxy;
        this.var_2200.arcane::shareContext = this.shareContext;
        this.var_2200.arcane::backgroundAlpha = 0;
    }

    private function method_159(param1: Number, param2: Number, param3: Number): void {
        var _loc4_: class_1767;
        (_loc4_ = new class_1767()).position = new Vector3D(0, 0, 0);
        this._container.addChild(_loc4_);
        _loc4_.rotationX = param1;
        _loc4_.rotationY = param2;
        _loc4_.rotationZ = param3;
        _loc4_.lens.method_5049 = 0.01;
        class_1758(_loc4_.lens).fieldOfView = 90;
        this.var_3577.push(class_1758(_loc4_.lens));
        _loc4_.lens.arcane::aspectRatio = 1;
        this.var_633.push(_loc4_);
    }

    override public function set z(param1: Number): void {
    }

    override public function set scaleZ(param1: Number): void {
    }

    override public function set rotation(param1: Number): void {
    }

    override public function set rotationX(param1: Number): void {
    }

    override public function set rotationY(param1: Number): void {
    }

    override public function set rotationZ(param1: Number): void {
    }

    override public function set transform(param1: Transform): void {
    }

    override public function set scaleX(param1: Number): void {
    }

    override public function set scaleY(param1: Number): void {
    }
}
}
