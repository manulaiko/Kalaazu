package org.osmf.media {

import flash.events.Event;
import flash.events.EventDispatcher;

import org.osmf.traits.MediaTraitBase;
import org.osmf.utils.OSMFStrings;

class MediaTraitResolver extends EventDispatcher {


    private var _type: String;

    private var _resolvedTrait: MediaTraitBase;

    function MediaTraitResolver(param1: String) {
        super();
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this._type = param1;
    }

    public final function get type(): String {
        return this._type;
    }

    protected final function setResolvedTrait(param1: MediaTraitBase): void {
        if (param1 != this._resolvedTrait) {
            if (this._resolvedTrait) {
                this._resolvedTrait = null;
                dispatchEvent(new Event(Event.CHANGE));
            }
            this._resolvedTrait = param1;
            dispatchEvent(new Event(Event.CHANGE));
        }
    }

    public final function get resolvedTrait(): MediaTraitBase {
        return this._resolvedTrait;
    }

    public final function addTrait(param1: MediaTraitBase): void {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (param1.traitType != this.type) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        this.processAddTrait(param1);
    }

    public final function removeTrait(param1: MediaTraitBase): MediaTraitBase {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (param1.traitType != this.type) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        return this.processRemoveTrait(param1);
    }

    protected function processAddTrait(param1: MediaTraitBase): void {
    }

    protected function processRemoveTrait(param1: MediaTraitBase): MediaTraitBase {
        return null;
    }
}
}
