package package_30 {

import flash.display.MovieClip;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;

import package_11.class_39;

import package_9.ResourceManager;

public class class_195 extends class_179 {


    private var spaceball_speed: MovieClip;

    public function class_195(param1: class_58, param2: int) {
        super(const_3119, param1, param2);
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        this.spaceball_speed = _loc3_.getEmbeddedMovieClip("spaceball_speed");
        this.spaceball_speed.mouseEnabled = class_9.const_3029;
        this.spaceball_speed.mouseChildren = class_9.const_3029;
        this.spaceball_speed.gotoAndStop(1);
        this.spaceball_speed.x = 15;
        this.spaceball_speed.y = 29;
        this.addChild(this.spaceball_speed);
    }

    public function setSpeed(param1: int): void {
        this.spaceball_speed.gotoAndStop(param1 + 1);
    }
}
}
