package package_354 {

import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.geom.Point;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_14.class_52;

import package_286.class_2019;

import package_36.class_1818;

import package_76.class_215;

import package_9.class_50;

public class class_2066 extends class_2019 implements class_52 {


    private const const_1227: Number = 57.29577951308232;

    private var _index: uint = 0;

    private var var_5011: int = 2;

    private var var_3574: uint = 200;

    private var var_2399: Number = 0;

    private var var_1247: Vector.<DisplayObject>;

    private var var_3559: DisplayObjectContainer;

    private var var_4187: Point;

    private var _effect: class_1818;

    public function class_2066(param1: class_1206, param2: class_1818) {
        this._effect = param2;
        this.var_5011 = !!param2.method_6315 ? 4 : 3;
        this.var_3574 = !!param2.method_6315 ? 200 : 150;
        super(param1, param2);
        this.var_2399 = this.var_3574;
    }

    private function method_5954(): void {
        if (this._effect.source) {
            this.var_4187 = new Point(Number(this._effect.target.position.x) - Number(this._effect.source.position.x), Number(this._effect.target.position.y) - Number(this._effect.source.position.y));
        }
    }

    private function method_2214(): Number {
        return 57.29577951308232 * Math.atan2(this.var_4187.y, this.var_4187.x);
    }

    override protected function method_30(): void {
        var _loc2_: * = null;
        this.var_3559 = this.clip.parent;
        clip.alpha = 0;
        this.var_1247 = new Vector.<DisplayObject>();
        this.var_1247.push(clip);
        var _loc1_: int = 0;
        while (_loc1_ < this.var_5011) {
            _loc2_ = class_215.method_1998(clip);
            _loc2_.alpha = 0;
            addChild(_loc2_);
            this.var_1247.push(_loc2_);
            _loc1_++;
        }
        class_50.method_5621(this);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: * = null;
        this.var_2399 += param1;
        if (this.var_2399 > this.var_3574) {
            this.var_2399 -= this.var_3574;
            if (this._index <= this.var_1247.length - 1) {
                this.method_5954();
                _loc2_ = this.var_1247[this._index];
                _loc2_.alpha = 1;
                _loc2_.x = this.var_4187.x;
                _loc2_.y = this.var_4187.y;
                _loc2_.rotation = this.method_2214();
                TweenLite.to(_loc2_, 0.75, {
                    "x": 0,
                    "y": 0,
                    "scaleX": 0.5,
                    "scaleY": 0.5,
                    "alpha": 0.4,
                    "onComplete": this.method_5100,
                    "onCompleteParams": [_loc2_],
                    "ease": Linear.easeNone
                });
                ++this._index;
            }
        }
    }

    private function method_5100(param1: DisplayObject): void {
        var _loc2_: DisplayObject = param1;
        if (_loc2_) {
            this.var_3559.removeChild(_loc2_);
        }
        if (this.var_3559.numChildren == 0) {
            this.disposeView();
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        class_50.removeObserver(this);
        super.disposeView(param1);
    }
}
}
