package org.osmf.traits {

import org.osmf.events.SeekEvent;

public class SeekTrait extends MediaTraitBase {


    private var _timeTrait: TimeTrait;

    private var _seeking: Boolean;

    public function SeekTrait(param1: TimeTrait) {
        super(MediaTraitType.SEEK);
        this._timeTrait = param1;
    }

    public final function get seeking(): Boolean {
        return this._seeking;
    }

    public final function seek(param1: Number): void {
        if (this.canSeekTo(param1)) {
            this.setSeeking(true, param1);
        }
    }

    public function canSeekTo(param1: Number): Boolean {
        return !!this._timeTrait ? isNaN(param1) == false && param1 >= 0 && (param1 <= this._timeTrait.duration || param1 <= this._timeTrait.currentTime) : false;
    }

    protected final function get timeTrait(): TimeTrait {
        return this._timeTrait;
    }

    protected final function set timeTrait(param1: TimeTrait): void {
        this._timeTrait = param1;
    }

    protected final function setSeeking(param1: Boolean, param2: Number): void {
        this.seekingChangeStart(param1, param2);
        this._seeking = param1;
        this.seekingChangeEnd(param2);
    }

    protected function seekingChangeStart(param1: Boolean, param2: Number): void {
    }

    protected function seekingChangeEnd(param1: Number): void {
        dispatchEvent(new SeekEvent(SeekEvent.SEEKING_CHANGE, false, false, this.seeking, param1));
    }
}
}
