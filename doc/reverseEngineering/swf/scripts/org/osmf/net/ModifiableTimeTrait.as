package org.osmf.net {

import org.osmf.traits.TimeTrait;

public class ModifiableTimeTrait extends TimeTrait {


    public function ModifiableTimeTrait(param1: Number = NaN) {
        super(param1);
    }

    public function set duration(param1: Number): void {
        super.setDuration(param1);
    }
}
}
