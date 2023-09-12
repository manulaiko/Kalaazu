package net.bigpoint.darkorbit.fui.builder.xml.factories {

import net.bigpoint.darkorbit.fui.components.core.transitions.AlphaFadeEffect;
import net.bigpoint.darkorbit.fui.components.core.transitions.ITransitionEffect;

public class TransitionEffectFactory {

    public static const EFFECT_ALPHAFADE: String = "alphafade";


    public function TransitionEffectFactory() {
        super();
    }

    public static function create(param1: String): ITransitionEffect {
        var _loc2_: * = null;
        switch (param1) {
            case EFFECT_ALPHAFADE:
                _loc2_ = new AlphaFadeEffect();
                break;
            default:
                _loc2_ = new AlphaFadeEffect();
        }
        return _loc2_;
    }
}
}
