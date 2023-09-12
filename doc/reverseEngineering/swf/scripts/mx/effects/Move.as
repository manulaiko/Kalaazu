package mx.effects {

import mx.core.mx_internal;
import mx.effects.effectClasses.MoveInstance;

public class Move extends TweenEffect {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var AFFECTED_PROPERTIES: Array = ["x", "y"];

    private static var RELEVANT_STYLES: Array = ["left", "right", "top", "bottom", "horizontalCenter", "verticalCenter"];


    public var xBy: Number;

    public var xFrom: Number;

    public var xTo: Number;

    public var yBy: Number;

    public var yFrom: Number;

    public var yTo: Number;

    public function Move(param1: Object = null) {
        super(param1);
        instanceClass = MoveInstance;
    }

    override public function getAffectedProperties(): Array {
        return AFFECTED_PROPERTIES;
    }

    override public function get relevantStyles(): Array {
        return RELEVANT_STYLES;
    }

    override protected function initInstance(param1: IEffectInstance): void {
        var _loc2_: * = null;
        super.initInstance(param1);
        _loc2_ = MoveInstance(param1);
        _loc2_.xFrom = this.xFrom;
        _loc2_.xTo = this.xTo;
        _loc2_.xBy = this.xBy;
        _loc2_.yFrom = this.yFrom;
        _loc2_.yTo = this.yTo;
        _loc2_.yBy = this.yBy;
    }
}
}
