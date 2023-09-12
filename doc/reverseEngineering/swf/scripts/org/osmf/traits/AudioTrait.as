package org.osmf.traits {

import org.osmf.events.AudioEvent;

public class AudioTrait extends MediaTraitBase {


    private var _volume: Number = 1;

    private var _muted: Boolean = false;

    private var _pan: Number = 0;

    public function AudioTrait() {
        super(MediaTraitType.AUDIO);
    }

    public function get volume(): Number {
        return this._volume;
    }

    public final function set volume(param1: Number): void {
        if (isNaN(param1)) {
            param1 = 0;
        } else if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        if (param1 != this._volume) {
            this.volumeChangeStart(param1);
            this._volume = param1;
            this.volumeChangeEnd();
        }
    }

    public function get muted(): Boolean {
        return this._muted;
    }

    public final function set muted(param1: Boolean): void {
        if (param1 != this._muted) {
            this.mutedChangeStart(param1);
            this._muted = param1;
            this.mutedChangeEnd();
        }
    }

    public function get pan(): Number {
        return this._pan;
    }

    public final function set pan(param1: Number): void {
        if (isNaN(param1)) {
            param1 = 0;
        } else if (param1 > 1) {
            param1 = 1;
        } else if (param1 < -1) {
            param1 = -1;
        }
        if (param1 != this._pan) {
            this.panChangeStart(param1);
            this._pan = param1;
            this.panChangeEnd();
        }
    }

    protected function volumeChangeStart(param1: Number): void {
    }

    protected function volumeChangeEnd(): void {
        dispatchEvent(new AudioEvent(AudioEvent.VOLUME_CHANGE, false, false, false, this._volume));
    }

    protected function mutedChangeStart(param1: Boolean): void {
    }

    protected function mutedChangeEnd(): void {
        dispatchEvent(new AudioEvent(AudioEvent.MUTED_CHANGE, false, false, this._muted));
    }

    protected function panChangeStart(param1: Number): void {
    }

    protected function panChangeEnd(): void {
        dispatchEvent(new AudioEvent(AudioEvent.PAN_CHANGE, false, false, false, NaN, this._pan));
    }
}
}
