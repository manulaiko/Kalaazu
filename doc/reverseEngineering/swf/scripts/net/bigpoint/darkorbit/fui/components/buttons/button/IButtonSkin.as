package net.bigpoint.darkorbit.fui.components.buttons.button {

import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;

public interface IButtonSkin extends ISkin {


    function set textStyleName(param1: String): void;

    function set text(param1: String): void;

    function set textMarginX(param1: uint): void;

    function set textMarginY(param1: uint): void;
}
}
