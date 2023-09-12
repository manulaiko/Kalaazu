package org.osmf.events {

public class MediaError extends Error {


    private var _detail: String;

    public function MediaError(param1: int, param2: String = null) {
        super(this.getMessageForErrorID(param1), param1);
        this._detail = param2;
    }

    public function get detail(): String {
        return this._detail;
    }

    protected function getMessageForErrorID(param1: int): String {
        return MediaErrorCodes.getMessageForErrorID(param1);
    }
}
}
