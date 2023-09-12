package package_354 {

import com.greensock.TweenMax;
import com.greensock.easing.Linear;

import flash.display.MovieClip;
import flash.media.Sound;

import net.bigpoint.darkorbit.map.view2D.class_1206;
import net.bigpoint.darkorbit.settings.Settings;

import package_286.class_2019;

import package_35.class_348;

import package_9.ResourceManager;

public class class_2046 extends class_2019 {

    private static const const_364: String = "soundfx";

    private static const const_457: Number = 0.04;


    public function class_2046(param1: class_1206, param2: class_348) {
        super(param1, param2);
    }

    override protected function method_30(): void {
        var _loc2_: * = null;
        if (false) {
            _loc2_ = ResourceManager.getSound(pattern.resKey, const_364);
            if (_loc2_ != null) {
                _loc2_.play();
            }
        }
        this.clip.visible = true;
        this.clip.y -= 50;
        var _loc1_: Number = Number(MovieClip(this.clip).framesLoaded) * Number(const_457);
        TweenMax.to(this.clip, _loc1_, {
            "ease": Linear.easeNone,
            "frame": MovieClip(this.clip).framesLoaded,
            "onComplete": this.method_1926
        });
    }

    private function method_1926(): void {
        TweenMax.killTweensOf(this.clip);
        disposeView();
    }
}
}
