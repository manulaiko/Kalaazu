package mx.effects {

import mx.core.mx_internal;
import mx.effects.effectClasses.BlurInstance;

public class Blur extends TweenEffect {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var AFFECTED_PROPERTIES: Array = ["filters"];


    public var blurXFrom: Number = 4;

    public var blurXTo: Number = 0;

    public var blurYFrom: Number = 4;

    public var blurYTo: Number = 0;

    public function Blur(param1: Object = null) {
        super(param1);
        instanceClass = BlurInstance;
    }

    override public function getAffectedProperties(): Array {
        return AFFECTED_PROPERTIES;
    }

    override protected function initInstance(param1: IEffectInstance): void {
        super.initInstance(param1);
        var _loc2_: BlurInstance = BlurInstance(param1);
        _loc2_.blurXFrom = this.blurXFrom;
        _loc2_.blurXTo = this.blurXTo;
        _loc2_.blurYFrom = this.blurYFrom;
        _loc2_.blurYTo = this.blurYTo;
    }
}
}
