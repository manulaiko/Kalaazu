package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control {

import flash.display.Bitmap;
import flash.display.DisplayObject;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.IResultWindowMediator;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.ResultHeaderConstants;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdBackgroundTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdHideTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdOverLayTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdTextureTween;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;

import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_169.class_1039;

public class ResultHeaderCommandBase extends SimpleCommand {


    public function ResultHeaderCommandBase() {
        super();
    }

    protected function initHeaderLable(param1: Object, param2: IResultWindowMediator): void {
        var _loc3_: String = this.getBGImageKey(param1);
        var _loc4_: String = this.getGradientImageKey(param1);
        var _loc5_: String = this.getGlowEffectKey(param1);
        param2.updateWindowTweens(this.getTweenSet(param1));
        param2.headerText = this.getHeaderText(param1);
        sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(param2.setEffectImg, this.getEffectLibName(), new <String>[_loc5_], DisplayObject));
        sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(param2.setGradient, this.getEffectLibName(), new <String>[_loc4_], Bitmap));
        sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(param2.setHeaderImage, this.getBgLibName(), new <String>[_loc3_], Bitmap));
        this.loadTexture(param2, param1);
    }

    protected function getBgLibName(): String {
        return class_1039.name_129;
    }

    protected function getEffectLibName(): String {
        return ResultHeaderConstants.HEADER_LABLELIBRARY_NAME;
    }

    protected function getGlowEffectKey(param1: Object): String {
        return "winGlow";
    }

    protected function loadTexture(param1: IResultWindowMediator, param2: Object): void {
        var _loc3_: String = this.getTextureKey(param2);
        sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(!Boolean(param2) ? param1.setTexture : param1.setBackground, this.getEffectLibName(), new <String>[_loc3_], Bitmap));
    }

    protected function getTextureKey(param1: Object): String {
        return !!Boolean(param1) ? "winTexture" : "loseTexture";
    }

    protected function getGradientImageKey(param1: Object): String {
        return !!Boolean(param1) ? "winGradiant" : "loseGradiant";
    }

    protected function getBGImageKey(param1: Object): String {
        return !!Boolean(param1) ? "winPic" : "losePic";
    }

    protected function getTweenSet(param1: Object): StatsHeaderLableTweenVo {
        var _loc2_: StatsHeaderLableTweenVo = new StatsHeaderLableTweenVo();
        if (Boolean(param1)) {
            _loc2_.backGroundTween = new StdBackgroundTween();
            _loc2_.glowTween = new StdOverLayTween();
            _loc2_.textureTween = new StdHideTween();
        } else {
            _loc2_.backGroundTween = new StdHideTween();
            _loc2_.glowTween = new StdHideTween();
            _loc2_.textureTween = new StdTextureTween();
        }
        return _loc2_;
    }

    protected function getHeaderText(param1: Object): String {
        return class_88.getItem(!!Boolean(param1) ? "jackpot_result_window_header_win" : "jackpot_result_window_header_lose");
    }
}
}
