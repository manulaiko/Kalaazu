package net.bigpoint.darkorbit.map {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.Stage;
import flash.system.Capabilities;

import net.bigpoint.darkorbit.map.view2D.class_335;
import net.bigpoint.darkorbit.map.view3D.class_336;
import net.bigpoint.darkorbit.settings.Settings;

import package_19.class_70;

import package_28.EventStreamClient;

public class class_95 {


    private var _stage: Stage;

    private var _container: Sprite;

    private var _mapView: class_87;

    private var var_533: class_70;

    public function class_95(param1: Stage, param2: Sprite) {
        this.var_533 = new class_70();
        super();
        this._stage = param1;
        this._container = param2;
    }

    public function method_3461(param1: Boolean = false): void {
        if (this._mapView) {
            this._mapView.dispose();
            DisplayObject(this._mapView).parent.removeChild(this._mapView as DisplayObject);
        }
        EventStreamClient.track("flash.stage3dstats", {
            "fp": Capabilities.version,
            "hw_acc": (Settings.gpuSupport ? 1 : 0),
            "driver": Settings.driverInfo,
            "profile": Settings.stage3DProfile,
            "available_3D": (Settings.has3DCapabilities ? 1 : 0),
            "use_2D": (param1 ? 1 : 0)
        });
        if (param1 || false) {
            this.method_4872(new class_335());
        } else {
            this.method_4872(new class_336());
        }
    }

    public function get method_3528(): class_87 {
        return this._mapView;
    }

    public function get method_4845(): class_70 {
        return this.var_533;
    }

    private function method_4872(param1: class_87): void {
        this._mapView = param1;
        this._mapView.ready.addOnce(this.method_3831);
        this._container.addChildAt(this._mapView as DisplayObject, 0);
    }

    private function method_3831(): void {
        this._mapView.ready.remove(this.method_3831);
        this.var_533.dispatch();
    }
}
}
