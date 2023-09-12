package net.bigpoint.darkorbit.map.view3D {

import com.bigpoint.utils.class_73;

import flash.display.Sprite;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.geom.Vector3D;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.display.class_1207;
import net.bigpoint.darkorbit.settings.BindableSettings;

import package_19.class_1199;
import package_19.class_67;

import package_195.HUD;

import package_196.class_1202;

import package_198.Stage3DManager;
import package_198.class_1208;

import package_199.class_1209;

import package_200.Settings3D;

import package_38.class_128;

import starling.core.Starling;
import starling.events.Event;

public class class_336 extends Sprite implements class_87 {


    private const const_681: Vector3D = new Vector3D();

    private var var_623: Starling;

    private var var_1765: HUD;

    private var _map: class_1211;

    private var _viewportWidth: int = 0;

    private var _viewportHeight: int = 0;

    private var var_2726: class_90;

    private var var_4720: Boolean = false;

    private var var_4604: Boolean = false;

    private var var_1766: Stage3DManager;

    private var _stage3DProxy: class_1208;

    private var var_4096: class_1202;

    private var var_2531: int = 0;

    private var _ready: class_67;

    public function class_336() {
        this._ready = new class_1199();
        super();
        try {
            Starling.handleLostContext = true;
        } catch (e: Error) {
        }
        mouseEnabled = mouseChildren = false;
        addEventListener(flash.events.Event.ADDED_TO_STAGE, this.method_2805);
    }

    public function get ready(): class_67 {
        return this._ready;
    }

    public function get zoom(): Number {
        return !!this._map ? Number(this._map.zoom) : 1;
    }

    public function get method_3826(): uint {
        return class_128.const_2985;
    }

    public function load(param1: class_90): void {
        this.var_2726 = param1;
        class_1210.instance.reset();
        if (this._stage3DProxy.context3D) {
            if (this._stage3DProxy.context3D.dispose.length == 0) {
                this._stage3DProxy.context3D.dispose();
            } else {
                this._stage3DProxy.context3D.dispose(false);
            }
        }
        this.var_4720 = true;
        this.var_4604 = true;
        this._stage3DProxy.requestContext(false, "baseline");
    }

    public function method_3361(param1: int, param2: int): void {
        this._viewportWidth = param1;
        this._viewportHeight = param2;
        this._stage3DProxy.width = this._viewportWidth;
        this._stage3DProxy.height = this._viewportHeight;
        if (Boolean(this.var_623) && Boolean(this.var_623.stage)) {
            this.var_623.stage.stageWidth = this._viewportWidth;
            this.var_623.stage.stageHeight = this._viewportHeight;
        }
        if (this._map) {
            this._map.method_3361(this._viewportWidth, this._viewportHeight);
        }
    }

    public function update(param1: int, param2: int, param3: Number): void {
        if (this._map) {
            class_1212.var_2503 = 0;
            class_1212.var_993 = 0;
            this._map.update(param3, param1, param2);
            if (Settings3D.render.value) {
                if (Boolean(this._stage3DProxy.context3D) && this._stage3DProxy.context3D.driverInfo != "Disposed") {
                    this._stage3DProxy.clear();
                    this.var_623.render();
                    this._map.render();
                    this._stage3DProxy.present();
                } else if (!this.var_4720) {
                    this.var_4720 = true;
                    this._stage3DProxy.requestContext(false, "baseline");
                }
            }
        }
    }

    public function method_70(param1: Number, param2: Number): void {
        if (this._map) {
            this._map.method_70(param1, param2);
        }
    }

    public function zoomIn(param1: Number = 0.3): void {
        if (this._map) {
            this._map.zoomIn(param1);
        }
    }

    public function zoomOut(param1: Number = 0.3): void {
        if (this._map) {
            this._map.zoomOut(param1);
        }
    }

    public function method_574(param1: int, param2: int, param3: class_73 = null): class_73 {
        if (param3 == null) {
            param3 = new class_73();
        }
        var _loc4_: Vector3D;
        if (_loc4_ = this._map.method_574(param1, param2, 0, this.const_681)) {
            param3.x = _loc4_.x;
            param3.y = _loc4_.y;
        }
        return param3;
    }

    public function method_4683(param1: int, param2: int, param3: int = 0, param4: class_73 = null): class_73 {
        return this._map.method_4683(param1, param2, param3, param4);
    }

    public function dispose(): void {
        this.load(null);
        if (this._stage3DProxy) {
            this._stage3DProxy.dispose();
            this._stage3DProxy = null;
        }
        class_1210.instance.dispose();
    }

    public function method_1164(param1: class_80): void {
        this._map.method_1164(param1);
    }

    public function method_3592(param1: class_80): void {
        this._map.method_3592(param1);
    }

    private function method_1842(): void {
        if (this._viewportWidth == 0) {
            this._viewportWidth = stage.stageWidth;
            this._viewportHeight = stage.stageHeight;
        }
        this.var_1766 = Stage3DManager.getInstance(stage);
        this._stage3DProxy = this.var_1766.method_1484(false);
        this._stage3DProxy.addEventListener(class_1209.const_2496, this.method_3636);
        this._stage3DProxy.color = 0;
        this._stage3DProxy.width = this._viewportWidth;
        this._stage3DProxy.height = this._viewportHeight;
        this._stage3DProxy.addEventListener(class_1209.const_2496, this.method_55);
        this._stage3DProxy.addEventListener(class_1209.const_2172, this.method_55);
        Settings3D.const_488.changed.add(this.method_238);
        this.method_238();
    }

    private function method_238(): void {
        var _loc1_: * = {};
        _loc1_[BindableSettings.MEDIUM] = 2;
        _loc1_[BindableSettings.HIGH] = 8;
        _loc1_[BindableSettings.ULTRA] = 16;
        this._stage3DProxy.method_6236 = int(_loc1_[Settings3D.const_488.value]) || false;
    }

    private function name_74(): void {
        var var_3801: XMLList = null;
        var var_258: XML = null;
        var_3801 = class_9.var_2751.patterns.preloadLists.pack.(@id == "3D").children();
        for each(var_258 in var_3801) {
            switch (var_258.name().toString()) {
                case "geometry":
                    ++this.var_2531;
                    class_1210.instance.method_3761.method_3479(var_258.text(), class_1210.const_2789).addOnce(this.method_2414);
                    break;
                case "texture":
                    ++this.var_2531;
                    class_1210.instance.method_3562.loadTexture(var_258.text(), class_1210.const_2789).addOnce(this.method_2414);
                    break;
                case "particles":
                    ++this.var_2531;
                    class_1210.instance.method_659.method_1811(var_258.text(), class_1210.const_2789).addOnce(this.method_2414);
                    break;
            }
        }
        if (this.var_2531 == 0) {
            this.method_2414();
        }
    }

    private function method_55(param1: flash.events.Event): void {
        this.var_4720 = false;
        if (this.var_4604) {
            this.var_4604 = false;
            this._map.load(this.var_2726);
            this.var_1765.map = this.var_2726;
            this.var_4096.map = this.var_2726;
        }
    }

    private function method_2805(param1: flash.events.Event): void {
        removeEventListener(flash.events.Event.ADDED_TO_STAGE, this.method_2805);
        class_1210.instance.method_5176(this.method_1842);
    }

    private function method_3636(param1: class_1209): void {
        this._stage3DProxy.removeEventListener(class_1209.const_2496, this.method_3636);
        this._map = new class_1211(this, this._stage3DProxy, class_1200.method_4498);
        this.var_623 = new Starling(class_1207, stage, this._stage3DProxy.viewPort, this._stage3DProxy.stage3D, Context3DRenderMode.AUTO, "baseline");
        this.var_623.shareContext = true;
        this.var_623.enableErrorChecking = false;
        this.var_623.addEventListener(starling.events.Event.ROOT_CREATED, this.method_5465);
    }

    private function method_5465(param1: starling.events.Event): void {
        this.var_623.removeEventListener(starling.events.Event.ROOT_CREATED, this.method_5465);
        class_1207(this.var_623.root).addUntypedChild(this._map.method_1174);
        addChild(this._map);
        this._map.method_3361(this._viewportWidth, this._viewportHeight);
        this.var_1765 = new HUD(this);
        addChild(this.var_1765);
        this.var_4096 = new class_1202(this, this.var_1765);
        this.name_74();
    }

    private function method_2414(...rest): void {
        if (--this.var_2531 == 0) {
            this._ready.dispatch();
        }
    }
}
}
