package org.osmf.traits {

import org.osmf.events.DVREvent;

public class DVRTrait extends MediaTraitBase {


    private var _isRecording: Boolean;

    public function DVRTrait(param1: Boolean = false) {
        this._isRecording = param1;
        super(MediaTraitType.DVR);
    }

    public final function get isRecording(): Boolean {
        return this._isRecording;
    }

    protected final function setIsRecording(param1: Boolean): void {
        if (param1 != this._isRecording) {
            this.isRecordingChangeStart(param1);
            this._isRecording = param1;
            this.isRecordingChangeEnd();
        }
    }

    protected function isRecordingChangeStart(param1: Boolean): void {
    }

    protected function isRecordingChangeEnd(): void {
        dispatchEvent(new DVREvent(DVREvent.IS_RECORDING_CHANGE));
    }
}
}
