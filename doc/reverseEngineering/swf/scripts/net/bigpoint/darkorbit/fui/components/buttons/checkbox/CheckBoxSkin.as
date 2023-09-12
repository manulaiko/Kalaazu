package net.bigpoint.darkorbit.fui.components.buttons.checkbox {

import flash.display.DisplayObject;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.components.buttons.button.ButtonSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;

public class CheckBoxSkin extends ButtonSkin implements ICheckBoxSkin {

    private static var _skinLayerDefintions: Dictionary = new Dictionary();

    {
        _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
        _skinLayerDefintions[SkinLayerNames.NORMAL_SELECTED] = {};
        _skinLayerDefintions[SkinLayerNames.OVER] = {};
        _skinLayerDefintions[SkinLayerNames.OVER_SELECTED] = {};
        _skinLayerDefintions[SkinLayerNames.DISABLED] = {};
    }

    public function CheckBoxSkin() {
        super();
    }

    override public function getSkinLayerDefintions(): Dictionary {
        return _skinLayerDefintions;
    }

    override public function init(): void {
        super.init();
        _resizablelayers = _resizablelayers.concat(new <String>[SkinLayerNames.NORMAL_SELECTED, SkinLayerNames.OVER_SELECTED]);
        if (false) {
            addChild(_layers[SkinLayerNames.NORMAL_SELECTED]);
            hideState(SkinLayerNames.NORMAL_SELECTED);
        }
        if (false) {
            addChild(_layers[SkinLayerNames.OVER_SELECTED]);
            hideState(SkinLayerNames.OVER_SELECTED);
        }
        var _loc1_: DisplayObject = getChildByName(TEXTFIELD_NAME);
        setChildIndex(_loc1_, numChildren - 1);
    }

    override protected function setCurrentSkinState(param1: String): void {
        super.setCurrentSkinState(param1);
        hideState(SkinLayerNames.NORMAL_SELECTED);
        hideState(SkinLayerNames.OVER_SELECTED);
        hideState(SkinLayerNames.CLICKED_SELECTED);
        hideState(SkinLayerNames.DISABLED_SELECTED);
        switch (param1) {
            case SkinLayerNames.NORMAL_SELECTED:
                showState(SkinLayerNames.NORMAL_SELECTED);
                break;
            case SkinLayerNames.OVER_SELECTED:
                showState(SkinLayerNames.OVER_SELECTED);
                break;
            case SkinLayerNames.CLICKED_SELECTED:
                showState(SkinLayerNames.CLICKED_SELECTED);
                break;
            case SkinLayerNames.DISABLED_SELECTED:
                showState(SkinLayerNames.DISABLED_SELECTED);
        }
    }

    override public function clone(): ISkin {
        var _loc1_: CheckBoxSkin = new CheckBoxSkin();
        _clone_(_loc1_, _skinLayerDefintions);
        return _loc1_;
    }
}
}
