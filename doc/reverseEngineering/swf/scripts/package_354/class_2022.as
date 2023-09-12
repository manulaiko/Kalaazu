package package_354 {

import com.greensock.TweenMax;

import flash.filters.GlowFilter;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_14.class_52;

import package_286.class_1734;

import package_355.class_2329;

import package_36.class_409;

import package_411.class_2330;
import package_411.class_2331;

import package_76.class_215;

import package_9.class_50;

public class class_2022 extends class_1734 implements class_52 {

    private static const UPDATE_INTERVAL: Number = 30;

    private static const const_575: GlowFilter = new GlowFilter();


    private var _tpf: Number = 0;

    private var var_3711: Number = 0.3;

    private var var_695: Number = 3;

    private var var_3201: Vector.<class_2331>;

    private var color: uint = 14544639;

    private var var_30: Boolean = false;

    private var var_298: class_2329;

    private var _effect: class_409;

    private var _map: class_1206;

    public function class_2022(param1: class_1206, param2: class_409) {
        this.var_3201 = new Vector.<class_2331>();
        this._effect = param2;
        this._map = param1;
        this.var_298 = new class_2329(this._effect.method_1610, this._effect.attacker);
        this.var_30 = false;
        const_575.color = this.color;
        const_575.strength = 3.5;
        const_575.quality = 1;
        const_575.blurY = 10;
        const_575.blurX = 10;
        super(param1, param2);
    }

    override protected function method_30(): void {
        this._map.fxLayer.addChild(this);
        if (this.var_30) {
            this.var_3711 = 1e-7;
        } else {
            this.var_3711 = 0.3;
        }
        this.method_3363();
        class_50.method_5621(this);
        this.method_4();
        TweenMax.delayedCall(this.var_695, this.method_4549);
    }

    private function method_4549(): void {
        var _loc2_: * = null;
        var _loc1_: int = int(this.var_3201.length);
        var _loc3_: int = 0;
        while (_loc3_ < _loc1_) {
            _loc2_ = this.var_3201[_loc3_];
            TweenMax.to(_loc2_, 0.2, {
                "alpha": 0,
                "onComplete": class_215.removeDisplayObject,
                "onCompleteParams": [_loc2_]
            });
            _loc3_++;
        }
        TweenMax.delayedCall(0.3, this.disposeView);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        this._tpf += param1;
        if (this._tpf > UPDATE_INTERVAL) {
            this._tpf = 0;
            _loc2_ = int(this.var_3201.length);
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                if ((_loc4_ = this.var_3201[_loc3_]).var_3227) {
                    this.method_2208(_loc4_, _loc3_);
                    _loc4_.update();
                }
                _loc3_++;
            }
        }
    }

    private function method_3363(): void {
        var _loc2_: * = null;
        var _loc1_: int = 0;
        while (_loc1_ < this.var_298.name_79.length) {
            _loc2_ = new class_2331(this.color, 2);
            this.method_2208(_loc2_, _loc1_);
            _loc2_.method_2815 = false;
            _loc2_.method_2821 = 1;
            _loc2_.method_2031 = 2;
            _loc2_.method_4801 = 3;
            _loc2_.method_3470 = 0.5;
            _loc2_.steps = 30;
            _loc2_.method_2950 = 0.1;
            _loc2_.thickness = 2.5;
            _loc2_.speed = 2;
            _loc2_.var_2690 = class_2330.const_2057;
            _loc2_.filters = [const_575];
            this.var_3201.push(_loc2_);
            _loc1_++;
        }
    }

    private function method_2208(param1: class_2331, param2: int): void {
        param1.startX = param2 - 1 >= 0 ? Number(this.var_298.name_79[param2 - 1].x) : Number(this.var_298.method_4231.x);
        param1.startY = param2 - 1 >= 0 ? Number(this.var_298.name_79[param2 - 1].y) : Number(this.var_298.method_4231.y);
        param1.endX = this.var_298.name_79[param2].x;
        param1.endY = this.var_298.name_79[param2].y;
    }

    private function method_4(): void {
        var _loc1_: int = int(this.var_3201.length);
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            TweenMax.delayedCall(_loc2_ * 0.2, this.method_1613, [this.var_3201[_loc2_]]);
            _loc2_++;
        }
    }

    private function method_1613(param1: class_2331): void {
        param1.var_3227 = true;
        param1.alpha = 0;
        TweenMax.to(param1, 0.5, {"alpha": 1});
        addChild(param1);
    }

    override public function disposeView(param1: Boolean = false): void {
        TweenMax.killTweensOf(this.method_1613);
        var _loc2_: int = int(this.var_3201.length);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (this.var_3201[_loc3_].parent) {
                this.var_3201[_loc3_].parent.removeChild(this.var_3201[_loc3_]);
            }
            _loc3_++;
        }
        this.var_3201.length = 0;
        class_50.removeObserver(this);
        super.disposeView(param1);
    }
}
}
