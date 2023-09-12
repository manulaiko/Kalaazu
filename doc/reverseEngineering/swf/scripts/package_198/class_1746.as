package package_198 {

import away3d.arcane;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_199.class_2099;

import package_295.class_1752;
import package_295.class_1762;

import package_296.class_1754;
import package_296.class_2096;
import package_296.class_2098;

public class class_1746 {

    private static var var_895: Dictionary;

    private static var var_1188: Vector.<class_1762>;

    private static var var_3094: int = 0;

    protected static var var_952: class_1754;

    private static var var_580: class_1754;

    private static var var_2644: Vector.<class_1754>;

    private static var var_182: Vector.<class_2099> = new Vector.<class_2099>();

    private static var var_4162: class_2099 = new class_2099(class_2099.MOUSE_UP);

    private static var var_3603: class_2099 = new class_2099(class_2099.CLICK);

    private static var var_2037: class_2099 = new class_2099(class_2099.MOUSE_OUT);

    private static var var_4537: class_2099 = new class_2099(class_2099.MOUSE_DOWN);

    private static var var_2869: class_2099 = new class_2099(class_2099.MOUSE_MOVE);

    private static var var_2048: class_2099 = new class_2099(class_2099.MOUSE_OVER);

    private static var var_4890: class_2099 = new class_2099(class_2099.MOUSE_WHEEL);

    private static var var_2597: class_2099 = new class_2099(class_2099.DOUBLE_CLICK);

    private static var var_2954: int = -1;

    private static var var_1241: int = -1;


    private var var_651: class_1762;

    private var var_943: Boolean = true;

    private var var_235: Vector3D;

    private var var_4382: MouseEvent;

    private var var_2292: Boolean;

    private var var_1132: class_2096;

    private var var_4561: int = 0;

    private var var_2061: class_1754;

    private var var_4932: class_1754;

    public function class_1746() {
        this.var_235 = new Vector3D();
        this.var_4382 = new MouseEvent(MouseEvent.MOUSE_MOVE);
        this.var_1132 = class_2098.const_2509;
        super();
        if (!var_895) {
            var_895 = new Dictionary();
            var_1188 = new Vector.<class_1762>();
        }
    }

    public function method_5745(param1: class_1762): void {
        var_2954 = var_1241;
        if (param1) {
            if (param1.stage3DProxy.method_4768) {
                var_2644 = new Vector.<class_1754>(var_3094);
            }
            if (!param1.shareContext) {
                if (param1 == this.var_651 && (Boolean(this.var_2292) || Boolean(this.var_943))) {
                    var_952 = this.var_1132.method_3281(param1.mouseX, param1.mouseY, param1);
                }
            } else if (param1.getBounds(param1.parent).contains(param1.mouseX + param1.x, param1.mouseY + param1.y)) {
                if (!var_2644) {
                    var_2644 = new Vector.<class_1754>(var_3094);
                }
                var_952 = var_2644[var_895[param1]] = this.var_1132.method_3281(param1.mouseX, param1.mouseY, param1);
            }
        }
    }

    public function method_2533(): void {
        var _loc1_: Number = 0;
        var _loc2_: Number = 0;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        if (var_2644) {
            var_952 = null;
            _loc5_ = Infinity;
            _loc7_ = var_3094 - 1;
            while (_loc7_ >= 0) {
                _loc6_ = var_1188[_loc7_];
                if (false && (Boolean(_loc6_.method_1631) || var_2644[_loc7_].var_2865 < _loc5_)) {
                    _loc5_ = Number(var_2644[_loc7_].var_2865);
                    var_952 = var_2644[_loc7_];
                    if (_loc6_.method_1631) {
                        break;
                    }
                }
                _loc7_--;
            }
        }
        if (var_952 != var_580) {
            if (var_580) {
                this.method_4483(var_2037, this.var_4382, var_580);
            }
            if (var_952) {
                this.method_4483(var_2048, this.var_4382, var_952);
            }
        }
        if (Boolean(this.var_2292) && Boolean(var_952)) {
            this.method_4483(var_2869, this.var_4382, var_952);
        }
        _loc2_ = 0;
        _loc1_ = 0;
        while (_loc1_ < _loc2_) {
            _loc3_ = var_182[_loc1_];
            _loc4_ = _loc3_.object;
            while (Boolean(_loc4_) && !_loc4_.arcane::var_3982) {
                _loc4_ = _loc4_.parent;
            }
            if (_loc4_) {
                _loc4_.dispatchEvent(_loc3_);
            }
            _loc1_++;
        }
        var_182.length = 0;
        this.var_943 = false;
        var_580 = var_952;
    }

    public function method_2344(param1: class_1762): void {
        var _loc2_: Stage = param1.stage;
        if (!param1.stage3DProxy.method_987) {
            param1.stage3DProxy.method_987 = this;
        }
        if (!this.method_5858(param1)) {
            var_895[param1] = 0;
        }
        this.var_4561 = 0;
        this.method_1831(_loc2_);
        var_3094 = this.var_4561;
    }

    public function method_4154(param1: class_1762): void {
        param1.addEventListener(MouseEvent.CLICK, this.method_5532);
        param1.addEventListener(MouseEvent.DOUBLE_CLICK, this.method_6118);
        param1.addEventListener(MouseEvent.MOUSE_DOWN, this.method_793);
        param1.addEventListener(MouseEvent.MOUSE_MOVE, this.method_4258);
        param1.addEventListener(MouseEvent.MOUSE_UP, this.method_4181);
        param1.addEventListener(MouseEvent.MOUSE_WHEEL, this.method_4069);
        param1.addEventListener(MouseEvent.MOUSE_OVER, this.method_2684);
        param1.addEventListener(MouseEvent.MOUSE_OUT, this.method_185);
    }

    public function method_2796(param1: class_1762): void {
        param1.removeEventListener(MouseEvent.CLICK, this.method_5532);
        param1.removeEventListener(MouseEvent.DOUBLE_CLICK, this.method_6118);
        param1.removeEventListener(MouseEvent.MOUSE_DOWN, this.method_793);
        param1.removeEventListener(MouseEvent.MOUSE_MOVE, this.method_4258);
        param1.removeEventListener(MouseEvent.MOUSE_UP, this.method_4181);
        param1.removeEventListener(MouseEvent.MOUSE_WHEEL, this.method_4069);
        param1.removeEventListener(MouseEvent.MOUSE_OVER, this.method_2684);
        param1.removeEventListener(MouseEvent.MOUSE_OUT, this.method_185);
    }

    public function dispose(): void {
        this.var_1132.dispose();
    }

    private function method_4483(param1: class_2099, param2: MouseEvent, param3: class_1754 = null): void {
        param1.ctrlKey = param2.ctrlKey;
        param1.altKey = param2.altKey;
        param1.shiftKey = param2.shiftKey;
        param1.delta = param2.delta;
        param1.var_4548 = param2.localX;
        param1.var_2761 = param2.localY;
        param3 = param3 || var_952;
        if (param3) {
            param1.object = param3.entity;
            param1.var_3785 = param3.var_3785;
            param1.var_247 = param3.var_247;
            param1.name_53 = !!param3.name_53 ? param3.name_53.clone() : null;
            param1.var_2450 = !!param3.var_2450 ? param3.var_2450.clone() : null;
            param1.index = param3.index;
            param1.var_4499 = param3.var_4499;
        } else {
            param1.var_247 = null;
            param1.object = null;
            param1.name_53 = this.var_235;
            param1.var_2450 = this.var_235;
            param1.index = 0;
            param1.var_4499 = 0;
        }
        var_182.push(param1);
    }

    private function method_4578(param1: MouseEvent): void {
        var _loc2_: * = undefined;
        if (!this.var_651 || this.var_651 && !this.var_651.shareContext) {
            return;
        }
        for (_loc2_ in var_895) {
            if (_loc2_ != this.var_651 && false) {
                _loc2_.dispatchEvent(param1);
            }
        }
    }

    private function method_5858(param1: class_1762): Boolean {
        var _loc2_: * = undefined;
        for (_loc2_ in var_895) {
            if (_loc2_ === param1) {
                return true;
            }
        }
        return false;
    }

    private function method_1831(param1: DisplayObjectContainer): void {
        var _loc4_: * = null;
        var _loc5_: * = undefined;
        var _loc2_: int = param1.numChildren;
        var _loc3_: int = 0;
        _loc3_ = 0;
        while (_loc3_ < _loc2_) {
            _loc4_ = param1.getChildAt(_loc3_);
            for (_loc5_ in var_895) {
                if (_loc4_ == _loc5_) {
                    var_895[_loc4_] = this.var_4561;
                    var_1188[this.var_4561] = _loc5_;
                    ++this.var_4561;
                }
            }
            if (_loc4_ is DisplayObjectContainer) {
                this.method_1831(_loc4_ as DisplayObjectContainer);
            }
            _loc3_++;
        }
    }

    private function method_4258(param1: MouseEvent): void {
        if (var_952) {
            this.method_4483(var_2869, this.var_4382 = param1);
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_185(param1: MouseEvent): void {
        this.var_651 = null;
        if (var_952) {
            this.method_4483(var_2037, param1, var_952);
        }
        this.var_943 = true;
    }

    private function method_2684(param1: MouseEvent): void {
        this.var_651 = param1.currentTarget as class_1762;
        if (Boolean(var_952) && var_580 != var_952) {
            this.method_4483(var_2048, param1, var_952);
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_5532(param1: MouseEvent): void {
        if (var_952) {
            this.method_4483(var_3603, param1);
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_6118(param1: MouseEvent): void {
        if (var_952) {
            this.method_4483(var_2597, param1);
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_793(param1: MouseEvent): void {
        this.var_651 = param1.currentTarget as class_1762;
        this.method_5745(this.var_651);
        if (var_952) {
            this.method_4483(var_4537, param1);
            var_580 = var_952;
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_4181(param1: MouseEvent): void {
        if (var_952) {
            this.method_4483(var_4162, param1);
            var_580 = var_952;
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    private function method_4069(param1: MouseEvent): void {
        if (var_952) {
            this.method_4483(var_4890, param1);
        } else {
            this.method_4578(param1);
        }
        this.var_943 = true;
    }

    public function get method_479(): Boolean {
        return this.var_2292;
    }

    public function set method_479(param1: Boolean): void {
        this.var_2292 = param1;
    }

    public function get method_5992(): class_2096 {
        return this.var_1132;
    }

    public function set method_5992(param1: class_2096): void {
        this.var_1132 = param1;
    }
}
}
