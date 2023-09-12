package net.bigpoint.darkorbit.map.view3D {

import away3d.arcane;

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Vector3D;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.MiniMapViewportBounds;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.view2D.backgrounds.view.class_1744;
import net.bigpoint.darkorbit.map.view3D.display3D.MapDisplayLayer3D;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1753;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1761;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1769;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.display.class_1709;

import package_197.class_1205;
import package_197.class_1739;
import package_197.class_1743;

import package_198.class_1208;

import package_200.Settings3D;

import package_295.class_1752;
import package_295.class_1762;

import package_296.class_1754;

import package_297.class_1755;
import package_297.class_1764;

import package_298.class_1756;

import package_299.class_1758;

import package_301.class_1760;

import package_302.class_1763;

import package_303.class_1765;

import package_305.class_1767;

import package_306.class_1768;

import package_9.class_50;

public class class_1211 extends Sprite implements class_1205 {


    private const const_1167: Vector3D = new Vector3D();

    private const const_2594: Vector3D = new Vector3D();

    private const const_2853: Vector3D = new Vector3D();

    private const const_1122: Vector3D = new Vector3D();

    private const const_654: Vector3D = new Vector3D();

    private var var_4653: class_1709;

    private var var_2600: class_1744;

    private var var_4945: class_1756;

    private var var_2577: class_1763;

    private var var_655: class_1753;

    private var var_101: class_1739;

    private var _scale: Number = 1;

    private var _viewportWidth: int;

    private var _viewportHeight: int;

    private var var_3973: class_1755;

    private var var_3425: class_1762;

    private var var_4129: class_1758;

    private var var_3250: class_1752;

    private var _map: class_90;

    private var var_1872: class_1765;

    private var var_3223: MapDisplayLayer3D;

    private var var_3028: MiniMapViewportBounds;

    private var var_211: class_1769;

    private var var_425: Number = 1;

    private var var_1552: Number = 1;

    private var var_812: Number = 1;

    private var _updatables: Vector.<class_80>;

    private var var_811: class_1760;

    private const name_144: Vector3D = new Vector3D();

    private const const_2740: Vector3D = new Vector3D();

    private var var_233: class_1761;

    private const const_306: Vector3D = new Vector3D();

    private const const_2777: Vector3D = new Vector3D();

    private const const_2055: Vector3D = new Vector3D();

    private const const_1286: Vector3D = new Vector3D();

    public function class_1211(param1: class_87, param2: class_1208, param3: class_1200) {
        this._updatables = new Vector.<class_80>();
        super();
        class_1210.instance.init(this, param2);
        this.var_4653 = param3.method_2524();
        this.var_4653["name"] = "bg";
        this.var_2600 = new class_1744(param3, param1);
        this.var_4653.addUntypedChild(this.var_2600.view);
        this.var_3028 = new MiniMapViewportBounds();
        this.var_4945 = new class_1756(param1);
        this.var_2577 = new class_1763(this);
        this.var_4129 = new class_1758(30);
        this.var_811 = new class_1760();
        this.var_3425 = new class_1762(null, new class_1767(this.var_4129), this.var_811);
        this.var_3425.stage3DProxy = param2;
        this.var_3425.shareContext = true;
        this.var_3425.method_1631 = true;
        this.var_3425.mouseEnabled = true;
        this.var_3425.mouseChildren = true;
        addChild(this.var_3425);
        this.var_3250 = new class_1752();
        this.var_3250.method_1973(0.0001, 0.0001, 0.0001);
        this.var_3425.scene.addChild(this.var_3250);
        this.var_211 = new class_1769();
        this.var_3250.addChild(this.var_211);
        this.var_3250.addChild(this.var_3425.camera);
        this.var_3250.addChild(this.var_4945);
        this.var_3223 = new MapDisplayLayer3D(this.var_3250.addChild(new class_1752()));
        this.var_655 = new class_1753();
        this.var_3250.addChild(this.var_655);
        this.var_3973 = new class_1755(this.var_3425.camera, this);
        this.var_101 = new class_1739(Vector.<class_1205>([this]));
        addChild(this.var_101);
        this.var_1872 = new class_1765(this);
        addEventListener(Event.ADDED_TO_STAGE, this.method_396);
        addEventListener(Event.REMOVED_FROM_STAGE, this.method_267);
    }

    private function method_4684(): void {
        var _loc1_: Vector.<class_1768> = new Vector.<class_1768>();
        if (!Settings3D.effects.max.value) {
        }
        this.var_3425.method_6029 = _loc1_;
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

    public function load(param1: class_90): void {
        var _loc2_: * = null;
        if (this._map) {
            this._map.removeEntity(this.var_3028);
            this._map.const_1216.remove(this.method_395);
        }
        while (this._updatables.length) {
            _loc2_ = this._updatables.pop();
            if (_loc2_ is IDisposable) {
                (_loc2_ as IDisposable).disposeView(true);
            }
        }
        this._map = param1;
        if (this._map) {
            this._map.const_1216.add(this.method_395);
            this.method_395();
            this._map.method_4903(this.var_3028);
        }
        this.var_4945.map = param1;
        this.var_2600.map = !!this.var_4945.method_3650 ? null : param1;
        this.var_811.var_874 = this.var_4945.method_3650;
        this.var_2577.map = param1;
        this.var_3223.map = param1;
        this.var_655.map = param1;
        this.var_3973.method_2626(param1, this.var_4945.method_3650);
        this.var_101.method_6305 = !!this.var_4945.method_3650 ? this.var_4945 : this.var_2600;
        this.var_1872.map = param1;
        this.var_211.map = param1;
        this.method_1164(this.var_655);
        this.method_1164(this.var_101);
        this.method_1164(this.var_211);
    }

    private function method_395(): void {
        var _loc1_: * = null;
        if (this._map) {
            _loc1_ = this._map.method_3763.display3D.length() > 0 ? this._map.method_3763.display3D[0].light[0] : null;
            _loc1_ = _loc1_ || new XML();
            Settings3D.const_685.color.value = _loc1_.attribute("color").length() > 0 ? uint(_loc1_.@color) : 16777215;
            Settings3D.const_685.diffuse.value = !!_loc1_.attribute("diffuse").length() ? Number(_loc1_.@diffuse) : 1;
            Settings3D.const_685.specular.value = !!_loc1_.attribute("specular").length() ? Number(_loc1_.@specular) : 0.7;
            Settings3D.const_685.ambientColor.value = !!_loc1_.attribute("ambientColor").length() ? uint(_loc1_.@ambientColor) : 16756398;
            Settings3D.const_685.ambient.value = !!_loc1_.attribute("ambient").length() ? Number(_loc1_.@ambient) : 0.2;
            Settings3D.const_685.directionTilt.value = !!_loc1_.attribute("tilt").length() ? Number(_loc1_.@tilt) : 100;
            Settings3D.const_685.directionPan.value = !!_loc1_.attribute("pan").length() ? Number(_loc1_.@pan) : 35;
            this.var_101.method_6305 = !!this.var_4945.method_3650 ? this.var_4945 : this.var_2600;
        }
    }

    public function method_3361(param1: int, param2: int): void {
        this._viewportWidth = param1;
        this._viewportHeight = param2;
        this.var_3425.width = this._viewportWidth;
        this.var_3425.height = this._viewportHeight;
        this.var_2600.method_3361(param1, param2);
        this.var_101.method_3361(param1, param2);
    }

    public function update(param1: Number, param2: int, param3: int): void {
        this.var_3973.update(param1, param2, param3);
        var _loc4_: int = this._updatables.length - 1;
        while (_loc4_ >= 0) {
            this._updatables[_loc4_].updateObj(param1);
            _loc4_--;
        }
        this.var_2600.update(param2, param3, Math.round(this._viewportWidth / (2 * Number(this._scale))), Math.round(this._viewportHeight / (2 * Number(this._scale))));
        this.method_986();
        class_1210.instance.name_10.update();
    }

    public function render(): void {
        this.var_3425.render();
        class_1212.name_42 = this.var_3425.method_3135;
    }

    public function method_4683(param1: Number, param2: Number, param3: Number = 0, param4: class_73 = null): class_73 {
        if (param4 == null) {
            param4 = new class_73();
        }
        this.const_1167.x = param1;
        this.const_1167.y = param3;
        this.const_1167.z = -param2;
        var _loc5_: Vector3D = this.var_3425.camera.method_642(this.const_1167, this.const_2594);
        param4.x = Number(this._viewportWidth) * (_loc5_.x + 1) / 2;
        param4.y = Number(this._viewportHeight) * (_loc5_.y + 1) / 2;
        param4.z = this.var_3973.method_4821.const_3022.value;
        return param4;
    }

    public function method_574(param1: Number, param2: Number, param3: Number = 0, param4: Vector3D = null): Vector3D {
        if (param4 == null) {
            param4 = new Vector3D();
        }
        var _loc5_: Vector3D = this.var_3425.camera.method_3037;
        var _loc6_: Vector3D = this.var_3425.camera.method_3456(2 * param1 / Number(this._viewportWidth) - 1, 2 * param2 / Number(this._viewportHeight) - 1, 100, this.const_2853);
        var _loc7_: Vector3D;
        (_loc7_ = this.const_1122).x = 0;
        _loc7_.y = param3;
        _loc7_.z = 0;
        var _loc8_: Vector3D;
        (_loc8_ = this.const_654).x = 0;
        _loc8_.y = 1;
        _loc8_.z = 0;
        this.name_144.setTo(_loc6_.x - _loc5_.x, _loc6_.y - _loc5_.y, _loc6_.z - _loc5_.z);
        this.const_2740.setTo(_loc5_.x - _loc7_.x, _loc5_.y - _loc7_.y, _loc5_.z - _loc7_.z);
        var _loc9_: Number = _loc8_.dotProduct(this.name_144);
        if (Math.abs(_loc9_) > 0.000001) {
            this.name_144.scaleBy(-_loc8_.dotProduct(this.const_2740) / _loc9_);
            param4.x = _loc5_.x + this.name_144.x;
            param4.y = -_loc5_.z - Number(this.name_144.z);
            param4.z = _loc5_.y + this.name_144.y;
            return param4;
        }
        return null;
    }

    public function method_70(param1: Number, param2: Number): void {
        TweenLite.to(this, param2, {"zoom": param1});
    }

    public function zoomIn(param1: Number): void {
        this.var_3973.zoomIn();
    }

    public function zoomOut(param1: Number): void {
        this.var_3973.zoomOut();
    }

    private function method_986(): void {
        var _loc1_: Vector3D = this.method_574(0, 0, 0, this.const_306);
        var _loc2_: Vector3D = this.method_574(this._viewportWidth, 0, 0, this.const_2777);
        var _loc3_: Vector3D = this.method_574(this._viewportWidth, this._viewportHeight, 0, this.const_2055);
        var _loc4_: Vector3D = this.method_574(0, this._viewportHeight, 0, this.const_1286);
        if (Boolean(_loc1_) && Boolean(_loc2_) && Boolean(_loc3_) && Boolean(_loc4_)) {
            this.var_3028.setViewport(_loc1_.x, _loc1_.y, _loc2_.x, _loc2_.y, _loc3_.x, _loc3_.y, _loc4_.x, _loc4_.y);
        }
    }

    private function method_396(param1: Event): void {
        this.var_3973.init(stage, this.method_5633);
        Settings3D.effects.max.changed.add(this.method_4684);
        this.method_4684();
    }

    private function method_267(param1: Event): void {
        Settings3D.effects.max.changed.remove(this.method_4684);
        this.var_3973.dispose();
    }

    private function get method_5633(): EventDispatcher {
        return class_50.getInstance().hitLayer;
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
            this.method_3432();
            this.var_3973.zoom = param1;
        }
    }

    private function method_3432(param1: Boolean = true): void {
        var _loc2_: int = Number(this._viewportWidth) * Number(this.var_1552);
        var _loc3_: int = Number(this._viewportHeight) * Number(this.var_1552);
        this.var_101.method_3361(_loc2_, _loc3_);
        if (param1) {
            this.var_2600.method_3361(_loc2_, _loc3_);
        }
    }

    public function get method_1616(): class_1752 {
        return this.var_3250;
    }

    public function get method_3658(): MapDisplayLayer3D {
        return this.var_3223;
    }

    public function get method_4821(): class_1764 {
        return this.var_3973.method_4821;
    }

    public function get camera(): class_1767 {
        return this.var_3425.camera;
    }

    public function method_822(param1: int, param2: int): Boolean {
        if (this.var_2600.method_822(param1, param2)) {
            return true;
        }
        if (this.var_233 == null) {
            this.var_233 = new class_1761();
        }
        this.var_3425.camera.method_3456(2 * param1 / Number(this._viewportWidth) - 1, 2 * param2 / Number(this._viewportHeight) - 1, 100, this.const_2853);
        this.const_2853.decrementBy(this.var_3425.camera.method_3037);
        var _loc3_: class_1754 = this.var_233.method_2787(this.var_3425.camera.method_3037, this.const_2853, this.var_3425.scene);
        return _loc3_ != null;
    }

    public function get method_1174(): class_1709 {
        return this.var_4653;
    }

    public function get method_1529(): class_1762 {
        return this.var_3425;
    }
}
}
