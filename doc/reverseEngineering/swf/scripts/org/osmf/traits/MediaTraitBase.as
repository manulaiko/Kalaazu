package org.osmf.traits {

import flash.events.EventDispatcher;

public class MediaTraitBase extends EventDispatcher {


    private var _traitType: String;

    public function MediaTraitBase(param1: String) {
        super();
        this._traitType = param1;
    }

    public function get traitType(): String {
        return this._traitType;
    }

    public function dispose(): void {
    }
}
}
