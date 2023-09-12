package net.bigpoint.darkorbit.fui.components.core.skins {

import flash.display.DisplayObject;
import flash.utils.Dictionary;

public class BasicSkin extends AbstractSkin implements ISkin {

    private static var _skinLayerDefintions: Dictionary = new Dictionary();

    {
        _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
        _skinLayerDefintions[SkinLayerNames.MASK] = {};
    }

    protected var _mask: DisplayObject;

    protected var _mouseEnabled: Boolean = false;

    protected var _mouseChildrenEnabled: Boolean = false;

    public function BasicSkin() {
        super();
    }

    override public function getSkinLayerDefintions(): Dictionary {
        return _skinLayerDefintions;
    }

    override protected function preinitialize(): void {
        super.preinitialize();
        _resizablelayers = new <String>[SkinLayerNames.NORMAL, SkinLayerNames.MASK];
    }

    override public function init(): void {
        super.init();
        this.mouseEnabled = this._mouseEnabled;
        this.mouseChildren = this._mouseChildrenEnabled;
        if (false) {
            addChild(_layers[SkinLayerNames.NORMAL]);
            showState(SkinLayerNames.NORMAL);
        }
        if (false) {
            this._mask = _layers[SkinLayerNames.MASK];
            this._mask.cacheAsBitmap = true;
        }
    }
}
}
