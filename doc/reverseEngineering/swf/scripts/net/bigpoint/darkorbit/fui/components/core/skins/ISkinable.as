package net.bigpoint.darkorbit.fui.components.core.skins {

public interface ISkinable {


    function set skin(param1: ISkin): void;

    function get skin(): ISkin;

    function setSkinState(param1: String): void;

    function getCurrentSkinState(): String;

    function set registeredSkinName(param1: String): void;
}
}
