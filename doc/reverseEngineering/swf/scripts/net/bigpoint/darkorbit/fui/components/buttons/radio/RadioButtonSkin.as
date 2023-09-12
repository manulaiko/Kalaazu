package net.bigpoint.darkorbit.fui.components.buttons.radio {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBoxSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;

public class RadioButtonSkin extends CheckBoxSkin implements IRadioButtonSkin {

    private static var _skinLayerDefintions: Dictionary = new Dictionary();

    {
        _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
        _skinLayerDefintions[SkinLayerNames.NORMAL_SELECTED] = {};
        _skinLayerDefintions[SkinLayerNames.OVER] = {};
        _skinLayerDefintions[SkinLayerNames.OVER_SELECTED] = {};
    }

    public function RadioButtonSkin() {
        super();
    }

    override public function getSkinLayerDefintions(): Dictionary {
        return _skinLayerDefintions;
    }

    override public function init(): void {
        super.init();
    }

    override public function clone(): ISkin {
        var _loc1_: RadioButtonSkin = new RadioButtonSkin();
        _clone_(_loc1_, _skinLayerDefintions);
        return _loc1_;
    }
}
}
