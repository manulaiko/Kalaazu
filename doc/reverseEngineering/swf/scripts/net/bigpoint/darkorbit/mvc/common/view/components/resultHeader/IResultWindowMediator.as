package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader {

import flash.display.Bitmap;
import flash.display.DisplayObject;

import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;

public interface IResultWindowMediator {


    function updateWindowTweens(param1: StatsHeaderLableTweenVo): void;

    function setEffectImg(param1: DisplayObject): void;

    function setGradient(param1: Bitmap): void;

    function setHeaderImage(param1: Bitmap): void;

    function setTexture(param1: DisplayObject): void;

    function setBackground(param1: DisplayObject): void;

    function set headerText(param1: String): void;
}
}
