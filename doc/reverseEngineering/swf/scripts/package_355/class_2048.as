package package_355 {

import com.greensock.TweenLite;
import com.greensock.easing.Quint;

import flash.display.Bitmap;
import flash.display.Sprite;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_11.class_39;

import package_22.class_1079;
import package_22.class_198;

import package_27.class_82;

import package_286.class_1734;

import package_36.class_207;

import package_76.class_215;

import package_9.ResourceManager;
import package_9.class_50;

public class class_2048 extends class_1734 {

    private static const DEGTORAD: Number = 0.017453292519943295;

    private static const const_3305: Array = [];

    private static const const_1967: Array = [];


    private var var_3766: int;

    private var var_3237: class_1079;

    private var _mapView: class_1206;

    private var _effect: class_207;

    public function class_2048(param1: class_1206, param2: class_207) {
        this._effect = param2;
        this._mapView = param1;
        this.var_3766 = param2.shockwaveId;
        this.var_3237 = class_198.var_4854[this.var_3766];
        super(param1, param2);
    }

    override protected function method_30(): void {
        class_50.getInstance().method_370(16777215, 0.75, 0.25, 2);
        ResourceManager.name_15.load("shockwaves", this.method_344);
        class_82.playSoundEffect(class_126.const_2472, false, false, this._effect.x, this._effect.y);
        class_50.getInstance().method_370(16777215, 0.75, 0.25, 2);
        if (this.var_3237.shakeScreen) {
            class_50.getInstance().shakeScreen();
        }
    }

    private function method_344(param1: class_39): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        if (true) {
            const_3305[this.var_3766] = param1.getEmbeddedBitmapData(this.var_3237.getResKey());
        }
        if (const_3305 != null) {
            _loc2_ = 360 / Number(this.var_3237.maxShockwaves);
            _loc3_ = 0;
            while (_loc3_ < this.var_3237.maxShockwaves) {
                _loc4_ = new Bitmap(const_3305[this.var_3766]);
                (_loc5_ = new Sprite()).addChild(_loc4_);
                _loc4_.y = -_loc4_.height / 2;
                _loc5_.scaleX = this.var_3237.beginScale;
                _loc5_.scaleY = this.var_3237.beginScale;
                _loc6_ = _loc3_ * _loc2_;
                _loc5_.rotation = _loc6_ + 180;
                if (true) {
                    const_1967[this.var_3237.maxShockwaves] = [];
                }
                if (const_1967[this.var_3237.maxShockwaves][_loc3_] == null) {
                    const_1967[this.var_3237.maxShockwaves][_loc3_] = [];
                    const_1967[this.var_3237.maxShockwaves][_loc3_][0] = Math.cos(_loc6_ * Number(DEGTORAD));
                    const_1967[this.var_3237.maxShockwaves][_loc3_][1] = Math.sin(_loc6_ * Number(DEGTORAD));
                }
                addChild(_loc5_);
                this.x = this._effect.x;
                this.y = this._effect.y;
                this._mapView.fxLayer.addChild(this);
                TweenLite.to(_loc5_, this.var_3237.duration, {
                    "ease": Quint.easeOut,
                    "x": Number(this.var_3237.radius) * Number(const_1967[this.var_3237.maxShockwaves][_loc3_][0]),
                    "y": Number(this.var_3237.radius) * Number(const_1967[this.var_3237.maxShockwaves][_loc3_][1]),
                    "scaleX": this.var_3237.endScale,
                    "scaleY": this.var_3237.endScale,
                    "alpha": 0,
                    "onComplete": this.method_5685,
                    "onCompleteParams": [_loc5_]
                });
                _loc3_++;
            }
        }
    }

    private function method_5685(param1: Sprite): void {
        class_215.removeDisplayObject(param1);
    }
}
}
