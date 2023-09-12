package package_354 {

import com.greensock.TweenMax;

import flash.display.MovieClip;
import flash.geom.ColorTransform;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_286.class_2019;

import package_75.class_1874;

import package_9.ResourceManager;

public class class_2042 extends class_2019 {


    private var mc: MovieClip;

    private var var_3206: Dictionary;

    public function class_2042(param1: class_1206, param2: class_1874) {
        this.var_3206 = new Dictionary();
        this.var_3206[class_1874.const_226] = new ColorTransform(10, 0, 10);
        this.var_3206[class_1874.const_826] = new ColorTransform(0, 0, 10);
        super(param1, param2);
    }

    override protected function method_30(): void {
        this.mc = ResourceManager.getMovieClip("ui", "markTarget");
        this.mc.transform.colorTransform = this.var_3206[this.method_4152.method_5174];
        this.addChild(this.mc);
        method_5878.addChild(this);
        TweenMax.to(this.mc, 1, {
            "alpha": 0.2,
            "repeat": -1,
            "yoyo": true
        });
        start();
    }

    private function get method_4152(): class_1874 {
        return effect as class_1874;
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this.mc) {
            TweenMax.killTweensOf(this.mc);
        }
        super.disposeView(param1);
    }
}
}
