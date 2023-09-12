package org.osmf.elements.audioClasses {

import flash.events.Event;
import flash.events.ProgressEvent;

import org.osmf.traits.TimeTrait;

public class AudioTimeTrait extends TimeTrait {


    private var soundAdapter: SoundAdapter;

    public function AudioTimeTrait(param1: SoundAdapter) {
        super();
        this.soundAdapter = param1;
        param1.addEventListener(ProgressEvent.PROGRESS, this.onDownloadProgress, false, 0, true);
        param1.addEventListener(SoundAdapter.DOWNLOAD_COMPLETE, this.onDownloadComplete, false, 0, true);
        param1.addEventListener(Event.COMPLETE, this.onPlaybackComplete, false, 0, true);
    }

    override public function get currentTime(): Number {
        return this.soundAdapter.currentTime;
    }

    private function onDownloadProgress(param1: Event): void {
        if (!isNaN(this.soundAdapter.estimatedDuration) && this.soundAdapter.estimatedDuration > 0) {
            this.soundAdapter.removeEventListener(ProgressEvent.PROGRESS, this.onDownloadProgress);
            setDuration(this.soundAdapter.estimatedDuration);
        }
    }

    private function onDownloadComplete(param1: Event): void {
        setDuration(this.soundAdapter.estimatedDuration);
    }

    private function onPlaybackComplete(param1: Event): void {
        signalComplete();
    }
}
}
