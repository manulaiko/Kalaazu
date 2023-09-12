package org.osmf.elements.audioClasses {

import org.osmf.traits.SeekTrait;
import org.osmf.traits.TimeTrait;

public class AudioSeekTrait extends SeekTrait {


    private var soundAdapter: SoundAdapter;

    public function AudioSeekTrait(param1: TimeTrait, param2: SoundAdapter) {
        super(param1);
        this.soundAdapter = param2;
    }

    override protected function seekingChangeStart(param1: Boolean, param2: Number): void {
        if (param1) {
            this.soundAdapter.seek(param2);
        }
    }

    override protected function seekingChangeEnd(param1: Number): void {
        super.seekingChangeEnd(param1);
        if (seeking == true) {
            setSeeking(false, param1);
        }
    }
}
}
