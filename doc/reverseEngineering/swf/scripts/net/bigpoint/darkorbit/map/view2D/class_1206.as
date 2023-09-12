package net.bigpoint.darkorbit.map.view2D {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getTimer;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.MiniMapViewportBounds;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.view2D.backgrounds.view.class_1744;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.display.class_1709;

import package_197.class_1205;
import package_197.class_1739;

import package_286.class_1740;

import package_288.class_1741;

import package_289.MapDisplayLayer2D;

import package_290.class_1742;

public class class_1206 extends Sprite implements class_1205 {

    public static var fxLayer: Sprite;

    private static const const_1861: int = 1280;


    private var _viewBuilder: class_1200;

    private var var_143: class_1709;

    private var _background: class_1744;

    private var var_655: class_1741;

    private var var_101: class_1739;

    private var var_4503: Sprite;

    private var var_3617: MapDisplayLayer2D;

    private var var_2577: class_1742;

    private var var_463: Sprite;

    private var var_1451: class_1740;

    private var _viewportWidth: int;

    private var _viewportHeight: int;

    private var var_2484: int;

    private var var_3986: int;

    private var _map: class_90;

    private var var_3028: MiniMapViewportBounds;

    private var var_1045: int = 0;

    private var var_2073: int = 0;

    private var var_425: Number = 1;

    private var var_1552: Number = 1;

    private var var_812: Number = 1;

    public function class_1206(param1: class_87, param2: class_1200) {
        super();
        this._viewBuilder = param2;
        this.var_143 = this._viewBuilder.method_2524();
        this.var_143["name"] = "bg";
        this._background = new class_1744(this._viewBuilder, param1);
        this.var_143.addUntypedChild(this._background.view);
        this.var_655 = new class_1741(this._viewBuilder);
        this.var_143.addUntypedChild(this.var_655.container);
        this.method_2644();
        this.var_101 = new class_1739(Vector.<class_1205>([this]));
        addChild(this.var_101);
        this.var_1451 = new class_1740(this);
        this.var_2577 = new class_1742(this._background, this);
        this.var_3028 = new MiniMapViewportBounds();
    }

    public function load(param1: class_90): void {
        if (this._map) {
            this._map.removeEntity(this.var_3028);
        }
        this._map = param1;
        if (this._map) {
            this._map.method_4903(this.var_3028);
        }
        while (this.fxLayer.numChildren > 0) {
            this.fxLayer.removeChildAt(this.fxLayer.numChildren - 1);
        }
        this._background.map = param1;
        this.var_2577.map = param1;
        this.var_3617.map = param1;
        this.var_101.method_6305 = this._background;
        this.var_655.reset();
        this.var_1451.map = param1;
    }

    public function method_574(param1: int, param2: int, param3: class_73 = null): class_73 {
        if (param3 == null) {
            param3 = new class_73();
        }
        param3.x = this.var_1045 + int((param1 - Number(this.var_2484)) * Number(this.var_1552));
        param3.y = this.var_2073 + int((param2 - Number(this.var_3986)) * Number(this.var_1552));
        return param3;
    }

    public function method_4683(param1: int, param2: int, param3: class_73 = null): class_73 {
        if (param3 == null) {
            param3 = new class_73();
        }
        param3.x = (param1 - Number(this.var_1045)) * Number(this.var_425) + this.var_2484;
        param3.y = (param2 - Number(this.var_2073)) * Number(this.var_425) + this.var_3986;
        param3.z = 1;
        return param3;
    }

    public function method_3361(param1: int, param2: int): void {
        this._viewportWidth = param1;
        this._viewportHeight = param2;
        this.var_2484 = Number(this._viewportWidth) >> 1;
        this.var_3986 = Number(this._viewportHeight) >> 1;
        this.var_812 = Math.min(1, param1 / Number(const_1861));
        this.zoom = param1 / Number(const_1861);
        this.method_3432();
    }

    public function update(param1: int, param2: int, param3: Number): void {
        this.var_1045 = param1;
        this.var_2073 = param2;
        var _loc4_: int = getTimer();
        var _loc5_: int = Math.round(Number(this.var_2484) * Number(this.var_1552));
        var _loc6_: int = Math.round(Number(this.var_3986) * Number(this.var_1552));
        this._background.update(param1, param2, _loc5_, _loc6_);
        this.var_4503.x = int(_loc5_ - param1);
        this.var_4503.y = int(_loc6_ - param2);
        this.var_3617.updateObj(param3);
        this.var_655.update(param1, param2, _loc5_, _loc6_, param3);
        this.var_101.updateObj(param3);
        this.var_3028.setViewport(param1 - Number(this.var_2484), param2 - Number(this.var_3986), param1 + this.var_2484, param2 - Number(this.var_3986), param1 + this.var_2484, param2 + this.var_3986, param1 - Number(this.var_2484), param2 + this.var_3986);
    }

    public function get fxLayer(): Sprite {
        return this.var_463;
    }

    public function method_70(param1: Number, param2: Number): void {
        param1 = Math.max(this.var_812, Math.min(param1, 1));
        if (this.zoom != param1) {
            TweenLite.to(this, param2, {
                "zoom": param1,
                "onComplete": this.method_3432
            });
        }
    }

    public function zoomIn(param1: Number): void {
        this.method_70(this.zoom + 0.1, param1);
    }

    public function zoomOut(param1: Number): void {
        this.method_70(Number(this.zoom) - 0.1, param1);
    }

    public function get zoom(): Number {
        return this.var_425;
    }

    public function set zoom(param1: Number): void {
        param1 = Math.max(this.var_812, Math.min(param1, 1));
        if (this.var_425 != param1) {
            this.var_425 = param1;
            this.var_1552 = 1 / Number(this.var_425);
            scaleX = scaleY = this.var_425;
            this.var_143.scaleX = this.var_143.scaleY = this.var_425;
            this.method_3432(false);
        }
    }

    private function method_3432(param1: Boolean = true): void {
        var _loc2_: int = Number(this._viewportWidth) * Number(this.var_1552);
        var _loc3_: int = Number(this._viewportHeight) * Number(this.var_1552);
        this.var_101.method_3361(_loc2_, _loc3_);
        if (param1) {
            this.var_655.method_3361(_loc2_, _loc3_);
            this._background.method_3361(_loc2_, _loc3_);
        }
    }

    function get name_52(): class_1709 {
        return this.var_143;
    }

    private function method_2644(): void {
        this.var_4503 = new Sprite();
        this.var_3617 = new MapDisplayLayer2D();
        this.var_3617.addEventListener(Event.ADDED, function (param1: Event): void {
            param1.stopPropagation();
        }, true, int.MAX_VALUE);
        this.var_4503.addChild(this.var_3617);
        this.var_463 = new Sprite();
        this.var_463.name = "fxLayer";
        this.var_4503.addChild(this.var_463);
        class_1206.fxLayer = this.var_463;
        addChild(this.var_4503);
    }

    public function get method_5826(): MapDisplayLayer2D {
        return this.var_3617;
    }

    public function get method_1850(): class_1740 {
        return this.var_1451;
    }

    public function method_822(param1: int, param2: int): Boolean {
        return Boolean(this._background.method_822(param1, param2)) || Boolean(this.var_3617.method_822(param1, param2));
    }
}
}
