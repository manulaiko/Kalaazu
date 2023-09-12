package package_450 {

import com.greensock.TweenLite;

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Sprite;

import net.bigpoint.darkorbit.fui.components.buttons.button.FadableButtonIconSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;

import package_388.class_2256;

import package_9.ResourceManager;

public class class_2670 extends FadableButtonIconSkin {

    private static const const_2701: uint = 1;

    private static const const_39: uint = 30;

    private static const const_2418: uint = 24;


    public function class_2670() {
        super();
    }

    override public function init(): void {
        var _loc1_: Sprite = new Sprite();
        var _loc2_: Graphics = _loc1_.graphics;
        _loc2_.beginFill(0, 0);
        _loc2_.drawRect(0, 0, 1, 1);
        _loc2_.endFill();
        var _loc3_: Sprite = new Sprite();
        var _loc4_: Graphics;
        (_loc4_ = _loc3_.graphics).beginFill(0, 0.5);
        _loc4_.drawRect(0, 0, 1, 1);
        _loc4_.endFill();
        var _loc5_: DisplayObject = ResourceManager.getBitmap(class_2256.name_129, "icon_bulletpoint_normal");
        var _loc6_: DisplayObject = ResourceManager.getBitmap(class_2256.name_129, "icon_bulletpoint_over");
        setSkinLayer(SkinLayerNames.NORMAL, _loc1_);
        setSkinLayer(SkinLayerNames.OVER, _loc3_);
        setSkinLayer(SkinLayerNames.ICON_NORMAL, _loc5_);
        setSkinLayer(SkinLayerNames.ICON_OVER, _loc6_);
        super.init();
        this._textMarginX = const_2418;
        var _loc7_: DisplayObject = this.getSkinLayer(SkinLayerNames.ICON_NORMAL);
        var _loc8_: DisplayObject = this.getSkinLayer(SkinLayerNames.ICON_OVER);
        _loc7_.x = 6;
        _loc8_.x = 6;
    }

    override public function set textMarginX(param1: uint): void {
    }

    override public function set height(param1: Number): void {
        super.height = param1;
        var _loc2_: DisplayObject = this.getSkinLayer(SkinLayerNames.ICON_NORMAL);
        var _loc3_: DisplayObject = this.getSkinLayer(SkinLayerNames.ICON_OVER);
        var _loc4_: Number = param1 - _loc2_.height >> 1;
        _loc2_.y = _loc4_;
        _loc3_.y = _loc4_;
        this._msgLabel.y += const_2701;
    }

    override public function set width(param1: Number): void {
        super.width = param1;
    }

    override protected function setCurrentSkinState(param1: String): void {
        super.setCurrentSkinState(param1);
        switch (param1) {
            case SkinLayerNames.NORMAL:
                TweenLite.to(this._msgLabel, 0.5, {"x": const_2418});
                break;
            case SkinLayerNames.OVER:
                TweenLite.to(this._msgLabel, 0.5, {"x": const_39});
        }
    }
}
}
