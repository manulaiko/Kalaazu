package package_420 {

import flash.display.Sprite;
import flash.events.Event;

import package_416.class_2338;

import package_459.class_2551;

import package_461.class_2556;
import package_461.class_2557;

public class class_2345 extends Sprite implements class_2344 {


    protected var var_1021: Vector.<class_2338>;

    protected var var_278: Array;

    public function class_2345() {
        super();
        this.var_1021 = new Vector.<class_2338>();
        this.var_278 = [];
        mouseEnabled = false;
        mouseChildren = false;
        addEventListener(Event.ADDED_TO_STAGE, this.addedToStage, false, 0, true);
    }

    public function method_35(param1: class_2338): void {
        var _loc2_: * = null;
        this.var_1021.push(param1);
        if (stage) {
            stage.invalidate();
        }
        param1.addEventListener(class_2556.var_1366, this.emitterUpdated, false, 0, true);
        param1.addEventListener(class_2557.var_1341, this.particleAdded, false, 0, true);
        param1.addEventListener(class_2557.var_2230, this.particleAdded, false, 0, true);
        param1.addEventListener(class_2557.var_1584, this.method_4238, false, 0, true);
        for each(_loc2_ in param1.method_5695) {
            this.method_3251(_loc2_);
        }
        if (this.var_1021.length == 1) {
            addEventListener(Event.RENDER, this.method_5652, false, 0, true);
        }
    }

    public function method_3011(param1: class_2338): void {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_1021.length) {
            if (this.var_1021[_loc2_] == param1) {
                this.var_1021.splice(_loc2_, 1);
                param1.removeEventListener(class_2556.var_1366, this.emitterUpdated);
                param1.removeEventListener(class_2557.var_1341, this.particleAdded);
                param1.removeEventListener(class_2557.var_2230, this.particleAdded);
                param1.removeEventListener(class_2557.var_1584, this.method_4238);
                for each(_loc3_ in param1.method_5695) {
                    this.method_5030(_loc3_);
                }
                if (this.var_1021.length == 0) {
                    removeEventListener(Event.RENDER, this.method_5652);
                    this.method_1701([]);
                } else if (stage) {
                    stage.invalidate();
                }
                return;
            }
            _loc2_++;
        }
    }

    private function addedToStage(param1: Event): void {
        if (stage) {
            stage.invalidate();
        }
    }

    private function particleAdded(param1: class_2557): void {
        this.method_3251(param1.particle);
        if (stage) {
            stage.invalidate();
        }
    }

    private function method_4238(param1: class_2557): void {
        this.method_5030(param1.particle);
        if (stage) {
            stage.invalidate();
        }
    }

    protected function emitterUpdated(param1: class_2556): void {
        if (stage) {
            stage.invalidate();
        }
    }

    protected function method_5652(param1: Event): void {
        this.method_1701(this.var_278);
    }

    protected function method_3251(param1: class_2551): void {
        this.var_278.push(param1);
    }

    protected function method_5030(param1: class_2551): void {
        var _loc2_: int = int(this.var_278.indexOf(param1));
        if (_loc2_ != -1) {
            this.var_278.splice(_loc2_, 1);
        }
    }

    protected function method_1701(param1: Array): void {
    }

    public function get method_3800(): Vector.<class_2338> {
        return this.var_1021;
    }

    public function set method_3800(param1: Vector.<class_2338>): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_1021) {
            this.method_3011(_loc2_);
        }
        for each(_loc2_ in param1) {
            this.method_35(_loc2_);
        }
    }
}
}
