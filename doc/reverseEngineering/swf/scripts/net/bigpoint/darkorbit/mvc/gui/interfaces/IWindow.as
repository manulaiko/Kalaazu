package net.bigpoint.darkorbit.mvc.gui.interfaces {

import com.bigpoint.utils.class_73;
import com.bigpoint.utils.class_968;

import flash.display.Sprite;
import flash.events.IEventDispatcher;

import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import package_11.class_39;

public interface IWindow extends IEventDispatcher {


    function get id(): String;

    function setTitle(param1: String, param2: Boolean = true): void;

    function set x(param1: Number): void;

    function set y(param1: Number): void;

    function get position(): class_73;

    function setSize(param1: Number, param2: Number): void;

    function get size(): class_73;

    function get width(): Number;

    function get height(): Number;

    function maximize(param1: Boolean = true, param2: Boolean = false): void;

    function minimize(param1: Boolean = true, param2: Boolean = false): void;

    function get maximized(): Boolean;

    function update(param1: FeatureWindowVO, param2: Boolean): void;

    function initIcon(param1: String, param2: class_39 = null, param3: class_968 = null): void;

    function getUIContainer(): Sprite;

    function showInProgressOverlay(): void;

    function hideInProgressOverlay(): void;

    function get isTweening(): Boolean;

    function get isTweaning(): Boolean;
}
}
