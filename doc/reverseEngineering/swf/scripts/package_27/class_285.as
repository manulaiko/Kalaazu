package package_27 {

import flash.events.Event;
import flash.media.SoundChannel;

public class class_285 extends Event {

    public static const const_2920: String = "musicLoop";


    private var var_385: SoundChannel;

    public function class_285(param1: SoundChannel) {
        this.var_385 = param1;
        super(const_2920);
    }

    public function get method_5564(): SoundChannel {
        return this.var_385;
    }
}
}
