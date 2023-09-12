package package_354 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.display.MovieClip;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.view2D.class_1206;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import package_11.class_39;

import package_17.class_62;

import package_75.class_201;

import package_9.class_50;

public class class_2041 implements IDisposable {


    private var radiationHelp: MovieClip;

    private var view: class_1206;

    private var var_2688: class_86;

    public function class_2041(param1: class_1206, param2: class_201) {
        super();
        this.view = param1;
        this.var_2688 = this.map.hero;
        this.var_2688.position.changed.add(this.method_1299);
        this.method_4063();
    }

    private function method_1299(): void {
        this.method_2822();
    }

    public function disposeView(param1: Boolean = false): void {
        this.var_2688.position.changed.remove(this.method_1299);
        if (this.radiationHelp) {
            TweenLite.to(this.radiationHelp, 0.5, {
                "alpha": 0,
                "onComplete": this.radiationHelp.parent.removeChild,
                "onCompleteParams": [this.radiationHelp]
            });
        }
    }

    private function method_4165(param1: class_39): void {
        this.radiationHelp = MovieClip(param1.getEmbeddedMovieClip("radiationHelp"));
        (this.radiationHelp["mask_mc"] as MovieClip).cacheAsBitmap = true;
        (this.radiationHelp["arrow_mc"] as MovieClip).cacheAsBitmap = true;
        (this.radiationHelp["arrow_mc"] as MovieClip).mask = this.radiationHelp["mask_mc"];
        this.radiationHelp.mouseEnabled = false;
        this.radiationHelp.mouseChildren = false;
        this.radiationHelp.x = class_50.method_1849();
        this.radiationHelp.y = class_50.method_5866();
        this.radiationHelp.rotation = this.method_1871();
        this.view.addChildAt(this.radiationHelp, 0);
        this.radiationHelp.alpha = 0;
        TweenLite.to(this.radiationHelp, 1, {"alpha": 0.2});
        this.method_4063();
    }

    private function method_3710(): void {
    }

    private function method_4063(): void {
        if (this.radiationHelp == null) {
            class_62.getInstance().sendNotification(AssetNotifications.LOAD_ASSET, ["ui", this.method_4165, this.method_3710, AssetsProxy.GAME]);
        } else {
            this.method_2822();
        }
    }

    private function method_2822(): void {
        if (this.radiationHelp != null) {
            this.radiationHelp.x = class_50.method_1849();
            this.radiationHelp.y = class_50.method_5866();
            TweenLite.to(this.radiationHelp, 0.1, {"shortRotation": {"rotation": this.method_1871()}});
        }
    }

    private function method_1871(): Number {
        var _loc1_: * = null;
        if (this.var_2688.x >= 1000 && this.var_2688.x <= Number(this.map.method_5076) - 1000 && this.var_2688.y >= 1000 && this.var_2688.y <= Number(this.map.method_1901) - 1000) {
            _loc1_ = new class_73(Number(this.map.method_5076) / 2, Number(this.map.method_1901) / 2);
        } else {
            _loc1_ = new class_73(this.clamp(this.var_2688.x, 1000, Number(this.map.method_5076) - 1000), this.clamp(this.var_2688.y, 1000, Number(this.map.method_1901) - 1000));
        }
        return Math.atan2(Number(_loc1_.y) - Number(this.var_2688.y), Number(_loc1_.x) - Number(this.var_2688.x)) * Infinity;
    }

    private function clamp(param1: Number, param2: Number, param3: Number): Number {
        if (param1 < param2) {
            return param2;
        }
        if (param1 > param3) {
            return param3;
        }
        return param1;
    }

    private function get map(): class_90 {
        return class_50.getInstance().map;
    }
}
}
