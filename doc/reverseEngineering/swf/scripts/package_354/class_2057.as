package package_354 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.easing.Expo;

import flash.display.Graphics;
import flash.display.Shape;
import flash.display.SpreadMethod;
import flash.geom.Matrix;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_286.class_1734;

import package_75.class_1856;

public class class_2057 extends class_1734 {


    private const TYPE: String = "radial";

    private const const_1529: Array = [0, 1, 0];

    private const const_1462: Array = [0, 220, 255];

    private var _colors: Array;

    private var var_581: uint;

    private var var_1811: Number = 80;

    private var var_484: Number = 0.6;

    private var var_3542: Number = 3500;

    private var var_92: Number = 0;

    private var var_126: Number = 2048;

    private var _position: class_73;

    private var _cycleTime: Number = 4;

    private var var_2529: Boolean;

    private var var_28: Boolean = false;

    private var _view: class_1206;

    private var var_3559: Shape;

    public function class_2057(param1: class_1206, param2: class_1856) {
        this._colors = [4473924, 16777215, 13672553];
        this._view = param1;
        this._position = param2.position;
        this.var_3542 = param2.method_5815;
        this.var_581 = param2.method_5087;
        this.var_28 = param2.method_5290;
        this._cycleTime = param2.cycleTime;
        this._colors[1] = param2.method_5087;
        super(param1, param2);
    }

    override protected function method_30(): void {
        this.start();
    }

    private function method_2138(): void {
        if (parent == null && this._view != null) {
            this._view.fxLayer.addChild(this);
        }
        if (this._view != null) {
            x = this._position.x;
            y = this._position.y;
        }
    }

    override protected function start(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.var_2529 = true;
        if (this.var_3559 == null) {
            this.var_3559 = new Shape();
            _loc1_ = this.var_3559.graphics;
            _loc2_ = new Matrix();
            _loc2_.createGradientBox(Number(this.var_126) << 1, Number(this.var_126) << 1, 0, -Number(this.var_126), -Number(this.var_126));
            _loc3_ = "null";
            _loc1_.beginGradientFill("radial", this._colors, this.const_1529, this.const_1462, _loc2_, _loc3_);
            _loc1_.drawCircle(0, 0, this.var_126);
            _loc1_.endFill();
            addChild(this.var_3559);
        }
        this.play();
    }

    private function play(): void {
        this.method_2138();
        this.var_3559.alpha = this.var_484;
        this.var_3559.width = this.var_1811;
        this.var_3559.height = this.var_1811;
        if (this.var_28) {
            TweenLite.to(this.var_3559, this._cycleTime, {
                "ease": Expo.easeOut,
                "width": this.var_3542,
                "height": this.var_3542,
                "alpha": this.var_92,
                "onComplete": this.method_901
            });
        } else {
            TweenLite.to(this.var_3559, this._cycleTime, {
                "width": this.var_3542,
                "height": this.var_3542,
                "alpha": this.var_92,
                "onComplete": this.method_901
            });
        }
    }

    protected function method_901(): void {
        this.play();
    }

    override public function disposeView(param1: Boolean = false): void {
        TweenLite.killTweensOf(this.var_3559);
        super.disposeView(param1);
    }

    public function get activate(): Boolean {
        return this.var_2529;
    }

    public function set activate(param1: Boolean): void {
        this.var_2529 = param1;
    }
}
}
