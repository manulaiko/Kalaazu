package package_27 {

import com.greensock.TweenLite;

import flash.events.EventDispatcher;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;

public class class_284 extends EventDispatcher {


    private var var_457: int = 0;

    private var _sound: Sound;

    public function class_284(param1: Sound) {
        super();
        this._sound = param1;
    }

    public function play(param1: Number, param2: int, param3: SoundTransform): SoundChannel {
        this.var_457 = param2;
        this.close();
        TweenLite.delayedCall((Number(this._sound.length) - param1) / 1000, this.loop);
        return this._sound.play(param1, 0, param3);
    }

    private function loop(): void {
        if (this._sound) {
            dispatchEvent(new class_285(this._sound.play(0, this.var_457)));
        }
    }

    public function close(): void {
        TweenLite.killDelayedCallsTo(this.loop);
    }
}
}
