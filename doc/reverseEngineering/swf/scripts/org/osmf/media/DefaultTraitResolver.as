package org.osmf.media {

import org.osmf.traits.MediaTraitBase;
import org.osmf.utils.OSMFStrings;

public class DefaultTraitResolver extends MediaTraitResolver {


    private var defaultTrait: MediaTraitBase;

    private var trait: MediaTraitBase;

    public function DefaultTraitResolver(param1: String, param2: MediaTraitBase) {
        super(param1);
        if (param2 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (param2.traitType != param1) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        this.defaultTrait = param2;
        setResolvedTrait(param2);
    }

    override protected function processAddTrait(param1: MediaTraitBase): void {
        if (this.trait == null) {
            setResolvedTrait(this.trait = param1);
        }
    }

    override protected function processRemoveTrait(param1: MediaTraitBase): MediaTraitBase {
        var _loc2_: * = null;
        if (Boolean(param1) && param1 == this.trait) {
            _loc2_ = this.trait;
            this.trait = null;
            setResolvedTrait(this.defaultTrait);
        }
        return _loc2_;
    }
}
}
