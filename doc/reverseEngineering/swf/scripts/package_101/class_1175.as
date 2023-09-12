package package_101 {

import flash.display.Bitmap;
import flash.display.BitmapData;

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_100.class_1174;

import package_11.class_39;

import package_9.ResourceManager;

public class class_1175 extends class_1174 {

    private static const DISTANCE: int = 3;

    private static const const_1711: int = 11;

    private static const const_1665: int = 12;

    private static const const_2454: String = "mapIcon_alert_left";

    private static const const_2884: String = "mapIcon_alert_right";

    private static const const_1198: String = "mapIcon_alert_above";

    private static const const_1211: String = "mapIcon_alert_below";


    private var left: BitmapData;

    private var right: BitmapData;

    private var above: BitmapData;

    private var below: BitmapData;

    public function class_1175() {
        super(16711680);
    }

    override public function method_6037(): void {
        super.method_6037();
        ResourceManager.name_15.load("minimap", this.method_3291);
    }

    override public function method_2753(): void {
        ResourceManager.name_15.method_2379("minimap", this.method_3291);
        super.method_2753();
    }

    private function method_3291(param1: class_39): void {
        this.left = !!param1.hasEmbeddedObject(const_2454) ? param1.getEmbeddedBitmapData(const_2454) : null;
        this.right = !!param1.hasEmbeddedObject(const_2884) ? param1.getEmbeddedBitmapData(const_2884) : null;
        this.above = !!param1.hasEmbeddedObject(const_1198) ? param1.getEmbeddedBitmapData(const_1198) : null;
        this.below = !!param1.hasEmbeddedObject(const_1211) ? param1.getEmbeddedBitmapData(const_1211) : null;
        this.update();
    }

    protected function get ship(): class_86 {
        return owner as class_86;
    }

    override protected function update(): void {
        super.update();
        var _loc1_: Boolean = false;
        if (Number(owner.position.x) * Number(_scale) < DISTANCE) {
            _icon.x = DISTANCE;
            _loc1_ = true;
            (_icon as Bitmap).bitmapData = this.left;
        }
        if (Number(owner.position.x) * Number(_scale) > Number(var_3334) - Number(DISTANCE)) {
            _icon.x = Number(var_3334) - Number(const_1665);
            _loc1_ = true;
            (_icon as Bitmap).bitmapData = this.right;
        }
        if (Number(owner.position.y) * Number(_scale) < DISTANCE) {
            _icon.y = DISTANCE;
            _loc1_ = true;
            (_icon as Bitmap).bitmapData = this.above;
        }
        if (Number(owner.position.y) * Number(_scale) > Number(var_3540) - Number(DISTANCE)) {
            _icon.y = Number(var_3540) - Number(const_1711);
            _loc1_ = true;
            (_icon as Bitmap).bitmapData = this.below;
        }
        if (!_loc1_) {
            reset();
        }
    }
}
}
