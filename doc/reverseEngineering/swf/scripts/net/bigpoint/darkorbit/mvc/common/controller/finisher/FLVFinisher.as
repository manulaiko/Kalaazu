package net.bigpoint.darkorbit.mvc.common.controller.finisher {

import net.bigpoint.darkorbit.mvc.common.view.components.FLVVideoPlayer;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_38;

public class FLVFinisher extends class_38 {


    public function FLVFinisher() {
        super();
    }

    public function getVideo(param1: Boolean = false): FLVVideoPlayer {
        return new FLVVideoPlayer(this.getURL(), param1);
    }

    public function getURL(): String {
        return NaN + name_58.method_4286(true);
    }
}
}
