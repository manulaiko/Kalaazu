package package_358 {

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_1699;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_120.class_2010;
import package_120.class_431;

import package_22.class_1066;
import package_22.class_1069;
import package_22.class_198;

import package_76.class_215;

import package_9.ResourceManager;
import package_9.class_50;

public class class_2080 extends Sprite implements class_1699, IDisposable {


    private var var_394: class_431;

    public function class_2080(param1: class_431) {
        super();
        this.var_394 = param1;
        this.var_394.zoneTypeSpecification.changed.add(this.redraw);
        Settings.qualityPoizone.changed.add(this.redraw);
        this.redraw();
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_1818.zoneTypeSpecification.changed.remove(this.redraw);
        Settings.qualityPoizone.changed.remove(this.redraw);
        graphics.clear();
        class_215.method_5129(this);
        class_215.removeDisplayObject(this);
    }

    public function get layer(): int {
        return -1;
    }

    protected function method_224(param1: uint, param2: BitmapData, param3: Boolean): void {
        throw new IllegalOperationError("Abstract method");
    }

    protected function redraw(): void {
        graphics.clear();
        var _loc1_: String = "null";
        var _loc2_: class_1066 = class_198.var_4779[this.method_1818.method_3350];
        if (_loc2_ != null) {
            _loc1_ = _loc2_.designType;
        }
        switch (_loc1_) {
            case class_1066.const_2303:
                if (Settings.qualityPoizone.value <= Settings.QUALITY_LOW || false) {
                    this.method_6027();
                    break;
                }
                break;
            case class_1066.const_2109:
                if (_loc2_ is class_1069) {
                    ResourceManager.name_15.load(class_1069(_loc2_).resKey, this.method_4200);
                    break;
                }
                break;
            default:
                this.method_6027();
        }
    }

    public function get method_1818(): class_431 {
        return this.var_394 as class_431;
    }

    protected function get map(): class_90 {
        return class_50.getInstance().map;
    }

    protected function round(param1: Number): int {
        return Math.round(param1);
    }

    private function method_6027(): void {
        var _loc2_: * = null;
        var _loc1_: uint = uint(class_2010.method_1227(this.method_1818));
        if (_loc1_ == class_2010.const_1607) {
            _loc2_ = ResourceManager.getBitmapData("simple_patterns", this.method_1818.method_807);
        }
        this.method_224(_loc1_, _loc2_, true);
    }

    private function method_4200(param1: class_39): void {
        var _loc2_: class_1069 = class_198.var_4779[this.method_1818.method_3350] as class_1069;
        if (param1.hasEmbeddedObject("image")) {
            this.method_224(class_2010.const_1607, param1.getEmbeddedBitmapData("image"), _loc2_.repeat);
        }
    }
}
}
