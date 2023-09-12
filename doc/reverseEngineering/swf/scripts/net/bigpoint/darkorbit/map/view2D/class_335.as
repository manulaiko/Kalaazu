package net.bigpoint.darkorbit.map.view2D {

import com.bigpoint.utils.class_73;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.display.class_1207;
import net.bigpoint.darkorbit.settings.Settings;

import package_17.class_62;

import package_19.class_1199;
import package_19.class_67;

import package_195.HUD;

import package_196.class_1202;

import package_38.class_128;

import package_9.ResourceManager;

import starling.core.Starling;
import starling.events.Event;

public class class_335 extends Sprite implements class_87 {


    private var var_623: Starling;

    private var var_4096: class_1202;

    private var var_1765: HUD;

    private var _map: class_1206;

    private var _viewportWidth: int = 0;

    private var _viewportHeight: int = 0;

    private var var_211: class_1204;

    private var _ready: class_67;

    private var var_2726: class_90;

    private var var_4720: Boolean = false;

    private var var_4604: Boolean = false;

    private var _updatables: Vector.<class_80>;

    private var var_908: Vector.<String>;

    public function class_335() {
        this._ready = new class_1199();
        this._updatables = new Vector.<class_80>();
        this.var_908 = new Vector.<String>();
        super();
        try {
            Starling.handleLostContext = true;
        } catch (e: Error) {
        }
        mouseEnabled = mouseChildren = false;
        addEventListener(flash.events.Event.ADDED_TO_STAGE, this.method_2805);
        addEventListener(flash.events.Event.ADDED_TO_STAGE, this.method_396);
        addEventListener(flash.events.Event.REMOVED_FROM_STAGE, this.method_6015);
    }

    public function load(param1: class_90): void {
        this.var_2726 = param1;
        if (this.var_623) {
            if (this.var_623.context) {
                if (this.var_623.context.dispose.length == 0) {
                    this.var_623.context.dispose();
                } else {
                    this.var_623.context.dispose(false);
                }
            }
            this.var_4720 = true;
            this.var_4604 = true;
            this.var_623.requestContext3D(this.var_623.stage3D, "auto", "baseline");
            return;
        }
        this.method_352();
    }

    private function method_352(): void {
        this._map.load(this.var_2726);
        this.var_1765.map = this.var_2726;
        this.var_4096.map = this.var_2726;
        this.var_211.map = this.var_2726;
    }

    public function method_3361(param1: int, param2: int): void {
        this._viewportWidth = param1;
        this._viewportHeight = param2;
        scrollRect = new Rectangle(0, 0, this._viewportWidth, this._viewportHeight);
        if (Boolean(this.var_623) && Boolean(this.var_623.stage)) {
            this.var_623.viewPort = scrollRect;
            this.var_623.stage.stageWidth = this._viewportWidth;
            this.var_623.stage.stageHeight = this._viewportHeight;
        }
        if (this._map) {
            this._map.method_3361(this._viewportWidth, this._viewportHeight);
        }
    }

    public function get ready(): class_67 {
        return this._ready;
    }

    public function update(param1: int, param2: int, param3: Number): void {
        if (this._map) {
            this._map.update(param1, param2, param3);
        }
        if (this.var_211) {
            this.var_211.updateObj(param3);
        }
        var _loc4_: int = this._updatables.length - 1;
        while (_loc4_ >= 0) {
            this._updatables[_loc4_].updateObj(param3);
            _loc4_--;
        }
        if (this.var_623) {
            if (Boolean(this.var_623.context) && this.var_623.context.driverInfo != "Disposed") {
                this.var_623.render();
            } else if (!this.var_4720) {
                this.var_4720 = true;
                this.var_623.requestContext3D(this.var_623.stage3D, "auto", "baseline");
            }
        }
    }

    private function method_55(param1: flash.events.Event): void {
        this.var_4720 = false;
        if (this.var_4604) {
            this.var_4604 = false;
            this.method_352();
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

    public function get zoom(): Number {
        return !!this._map ? Number(this._map.zoom) : 1;
    }

    public function method_1164(param1: class_80): void {
        var _loc2_: int = int(this._updatables.indexOf(param1));
        if (_loc2_ == -1) {
            this._updatables.push(param1);
        }
    }

    public function method_3592(param1: class_80): void {
        var _loc2_: int = int(this._updatables.indexOf(param1));
        if (_loc2_ != -1) {
            this._updatables.splice(_loc2_, 1);
        }
    }

    private function method_2805(param1: flash.events.Event): void {
        removeEventListener(flash.events.Event.ADDED_TO_STAGE, this.method_2805);
        if (this._viewportWidth == 0) {
            this._viewportWidth = stage.stageWidth;
            this._viewportHeight = stage.stageHeight;
        }
        this._map = new class_1206(this, class_1200.viewBuilder);
        if (false) {
            this.var_623 = new Starling(class_1207, stage, null, null, "auto", "auto");
            this.var_623.enableErrorChecking = false;
            this.var_623.stage3D.addEventListener(starling.events.Event.CONTEXT3D_CREATE, this.method_55);
            this.var_623.addEventListener(starling.events.Event.ROOT_CREATED, this.method_5465);
        } else {
            addChild(this._map.name_52 as DisplayObject);
            this.method_4872();
        }
    }

    private function method_5465(param1: starling.events.Event): void {
        this.var_623.removeEventListener(starling.events.Event.ROOT_CREATED, this.method_5465);
        class_1207(this.var_623.root).addUntypedChild(this._map.name_52);
        this.method_4872();
    }

    private function method_4872(): void {
        addChild(this._map);
        this._map.method_3361(this._viewportWidth, this._viewportHeight);
        this.var_1765 = new HUD(this);
        this.var_4096 = new class_1202(this, this.var_1765);
        addChild(this.var_1765);
        this.var_1765.method_5974(this.var_211 = new class_1204(this), 1);
        this.name_74();
        Settings.displayDrones.changed.add(this.method_6453);
        Settings.qualityExplosion.changed.add(this.method_6453);
    }

    private function name_74(): void {
        this.method_6438();
    }

    private function method_6438(...rest): void {
        if (this.var_908.length > 0) {
            ResourceManager.name_15.load(this.var_908.pop(), this.method_6438, this.method_6438);
        } else {
            this._ready.dispatch();
        }
    }

    private function method_6453(): void {
        if (Settings.displayDrones.value) {
            class_62.getInstance().sendNotification(AssetNotifications.PRELOAD_LIST, new <String>["drones"]);
        }
        if (Settings.qualityExplosion.value > Settings.QUALITY_LOW) {
            class_62.getInstance().sendNotification(AssetNotifications.PRELOAD_LIST, "explosions", AssetNotifications.TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY);
        }
    }

    public function method_574(param1: int, param2: int, param3: class_73 = null): class_73 {
        return this._map.method_574(param1, param2, param3);
    }

    public function method_4683(param1: int, param2: int, param3: int = 0, param4: class_73 = null): class_73 {
        return this._map.method_4683(param1, param2, param4);
    }

    public function dispose(): void {
        Settings.displayDrones.changed.remove(this.method_6453);
        Settings.qualityExplosion.changed.remove(this.method_6453);
        this.load(null);
        this.var_623.dispose();
        this.var_623 = null;
    }

    private function method_396(param1: flash.events.Event): void {
    }

    private function method_6015(param1: flash.events.Event): void {
    }

    public function get method_3826(): uint {
        return class_128.const_3240;
    }
}
}
