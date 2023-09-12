package net.bigpoint.darkorbit.fui.components.text {

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
import net.bigpoint.darkorbit.fui.components.core.skins.layers.ISkinLayer;

public class RichTextSkin extends BasicSkin {


    private var _text: String;

    public function RichTextSkin() {
        super();
    }

    override protected function preinitialize(): void {
        super.preinitialize();
        _resizablelayers = new <String>[SkinLayerNames.NORMAL, SkinLayerNames.MASK];
    }

    override public function init(): void {
        super.init();
        this.mouseEnabled = false;
        this.mouseChildren = false;
        if (false) {
            addChild(_layers[SkinLayerNames.NORMAL]);
            showState(SkinLayerNames.NORMAL);
        }
        if (false) {
            _mask = _layers[SkinLayerNames.MASK];
            _mask.cacheAsBitmap = true;
        }
    }

    public function set text(param1: String): void {
        this._text = param1;
    }

    override public function clone(): ISkin {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: BasicSkin = new RichTextSkin();
        var _loc2_: ISkinLayer = this.getSkinLayer(SkinLayerNames.NORMAL) as ISkinLayer;
        if (_loc2_) {
            _loc4_ = _loc2_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.NORMAL, _loc4_);
        }
        var _loc3_: ISkinLayer = this.getSkinLayer(SkinLayerNames.MASK) as ISkinLayer;
        if (_loc3_) {
            _loc5_ = _loc3_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.MASK, _loc5_);
        }
        return _loc1_;
    }
}
}
