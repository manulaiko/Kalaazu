package org.osmf.elements.audioClasses {

import flash.media.SoundTransform;

import org.osmf.traits.AudioTrait;

public class AudioAudioTrait extends AudioTrait {


    private var soundAdapter: SoundAdapter;

    public function AudioAudioTrait(param1: SoundAdapter) {
        super();
        this.soundAdapter = param1;
        param1.soundTransform.volume = volume;
        param1.soundTransform.pan = pan;
    }

    override protected function volumeChangeStart(param1: Number): void {
        var _loc2_: SoundTransform = this.soundAdapter.soundTransform;
        _loc2_.volume = muted ? 0 : param1;
        this.soundAdapter.soundTransform = _loc2_;
    }

    override protected function mutedChangeStart(param1: Boolean): void {
        var _loc2_: SoundTransform = this.soundAdapter.soundTransform;
        _loc2_.volume = param1 ? 0 : volume;
        this.soundAdapter.soundTransform = _loc2_;
    }

    override protected function panChangeStart(param1: Number): void {
        var _loc2_: SoundTransform = this.soundAdapter.soundTransform;
        _loc2_.pan = param1;
        this.soundAdapter.soundTransform = _loc2_;
    }
}
}
