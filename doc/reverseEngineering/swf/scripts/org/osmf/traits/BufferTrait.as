package org.osmf.traits {

import org.osmf.events.BufferEvent;

public class BufferTrait extends MediaTraitBase {


    private var _buffering: Boolean = false;

    private var _bufferLength: Number = 0;

    private var _bufferTime: Number = 0;

    public function BufferTrait() {
        super(MediaTraitType.BUFFER);
    }

    public function get buffering(): Boolean {
        return this._buffering;
    }

    public function get bufferLength(): Number {
        return this._bufferLength;
    }

    public function get bufferTime(): Number {
        return this._bufferTime;
    }

    public function set bufferTime(param1: Number): void {
        if (isNaN(param1) || param1 < 0) {
            param1 = 0;
        }
        if (param1 != this._bufferTime) {
            this.bufferTimeChangeStart(param1);
            this._bufferTime = param1;
            this.bufferTimeChangeEnd();
        }
    }

    protected final function setBufferLength(param1: Number): void {
        if (param1 != this._bufferLength) {
            this.bufferLengthChangeStart(param1);
            this._bufferLength = param1;
            this.bufferLengthChangeEnd();
        }
    }

    protected final function setBuffering(param1: Boolean): void {
        if (param1 != this._buffering) {
            this.bufferingChangeStart(param1);
            this._buffering = param1;
            this.bufferingChangeEnd();
        }
    }

    protected function bufferingChangeStart(param1: Boolean): void {
    }

    protected function bufferingChangeEnd(): void {
        dispatchEvent(new BufferEvent(BufferEvent.BUFFERING_CHANGE, false, false, this._buffering));
    }

    protected function bufferLengthChangeStart(param1: Number): void {
    }

    protected function bufferLengthChangeEnd(): void {
    }

    protected function bufferTimeChangeStart(param1: Number): void {
    }

    protected function bufferTimeChangeEnd(): void {
        dispatchEvent(new BufferEvent(BufferEvent.BUFFER_TIME_CHANGE, false, false, false, this._bufferTime));
    }
}
}
