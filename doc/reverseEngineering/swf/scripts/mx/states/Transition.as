package mx.states {

import mx.core.mx_internal;
import mx.effects.IEffect;

public class Transition {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public var effect: IEffect;

    public var fromState: String = "package_1";

    public var toState: String = "package_1";

    public var autoReverse: Boolean = false;

    public var interruptionBehavior: String;

    public function Transition() {
        this.interruptionBehavior = InterruptionBehavior.END;
        super();
    }
}
}
