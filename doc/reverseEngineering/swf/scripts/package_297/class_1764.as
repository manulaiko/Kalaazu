package package_297 {

import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import flash.geom.Vector3D;

import package_10.class_1179;

import package_200.Settings3D;

public class class_1764 {

    public static const const_2021: Number = 1740;

    public static const const_2544: Number = 0;

    public static const const_2814: Number = 135;

    public static const const_2807: Number = 30;


    public const const_996: Number = 179.9;

    public const const_3257: Number = 135;

    public const const_3074: Number = 1740;

    public const const_2999: Number = 3;

    public const const_146: Number = 1;

    public const const_3022: class_1179 = new class_1179(const_2021);

    public const tilt: class_1179 = new class_1179(const_2814);

    public const pan: class_1179 = new class_1179(const_2544);

    public const const_433: class_1179 = new class_1179(const_2807, 2, 180);

    private const const_1441: Number = 0.017453292519943295;

    private var name_35: Vector3D;

    private var _position: Vector3D;

    private var var_1810: Boolean = true;

    private var var_425: Number = 0;

    public var var_465: Boolean = false;

    public var var_843: Number = 1;

    public function class_1764() {
        this.name_35 = new Vector3D(0, 0, 0);
        this._position = new Vector3D(0, 0, 0);
        super();
        this.const_3022.changed.add(this.method_672);
        this.tilt.changed.add(this.method_672);
        this.pan.changed.add(this.method_672);
        this.var_425 = this.const_3022.value;
        this.reset();
    }

    public function reset(): void {
        this.pan.value = const_2544;
        this.tilt.value = const_2814;
        this.method_2212 = 1;
        this.method_1154(0, 0, 0);
    }

    public function method_1154(param1: Number, param2: Number, param3: Number): void {
        this.name_35.setTo(param1, param2, param3);
        this.var_1810 = true;
    }

    public function restoreDefaults(param1: Boolean = false, param2: Boolean = true): void {
        this.method_1943();
        this.pan.value %= 360;
        while (this.pan.value < 0) {
            this.pan.value += 360;
        }
        if (param2) {
            TweenLite.to(this.const_3022, param1 ? 0 : 1, {"value": 1});
        }
        TweenLite.to(this.const_433, param1 ? 0 : 1, {"value": const_2807});
        TweenLite.to(this.pan, param1 ? 0 : 1, {"value": this.pan.value + class_2157.method_2166(this.pan.value, const_2544)});
        TweenLite.to(this.tilt, param1 ? 0 : 1, {"value": const_2814});
    }

    public function method_1943(): void {
        TweenLite.killTweensOf(this.const_3022);
        TweenLite.killTweensOf(this.const_433);
        TweenLite.killTweensOf(this.pan);
        TweenLite.killTweensOf(this.tilt);
    }

    public function zoomIn(): void {
        TweenLite.to(this.const_3022, 1, {
            "value": 1.5,
            "ease": Quad.easeOut
        });
        TweenLite.to(this.pan, 1, {
            "value": this.pan.value + 10,
            "ease": Quad.easeOut
        });
    }

    private function method_672(): void {
        this.var_1810 = true;
    }

    private function validate(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        if (this.var_1810) {
            _loc1_ = Number(this.tilt.value);
            if (Boolean(this.var_465) && Boolean(Settings3D.const_634.value)) {
                _loc3_ = 0;
                _loc4_ = 20;
                _loc5_ = (this.const_3022.value - 1) / 2 * (_loc4_ - _loc3_);
                _loc1_ -= Math.max(_loc3_, Math.min(_loc5_, _loc4_));
                this.var_425 = this.const_3022.value;
            }
            _loc2_ = Number(this.var_843) * 1740 / Number(this.const_3022.value);
            this._position.setTo(this.name_35.x + _loc2_ * Math.sin(_loc1_ * 0.017453292519943295) * Math.sin(Number(this.pan.value) * 0.017453292519943295), Number(this.name_35.y) - _loc2_ * Math.cos(_loc1_ * 0.017453292519943295), Number(this.name_35.z) - _loc2_ * Math.sin(_loc1_ * 0.017453292519943295) * Math.cos(Number(this.pan.value) * 0.017453292519943295));
            this.var_1810 = false;
        }
    }

    public function get position(): Vector3D {
        this.validate();
        return this._position;
    }

    public function get method_4267(): Vector3D {
        return this.name_35;
    }

    public function get zoom(): Number {
        return this.var_425;
    }

    public function set zoom(param1: Number): void {
        if (Settings3D.const_634.value) {
            param1 = Math.max(1, Math.min(param1, 3));
        } else {
            param1 = Math.max(1, param1);
        }
        this.var_425 = param1;
        TweenLite.to(this.const_3022, 0.3, {
            "value": this.var_425,
            "ease": Quad.easeOut
        });
    }

    public function set method_2212(param1: Number): void {
        if (Settings3D.const_634.value) {
            param1 = Math.max(1, Math.min(param1, 3));
        } else {
            param1 = Math.max(0.01, param1);
        }
        this.var_425 = param1;
        this.const_3022.value = param1;
    }
}
}
