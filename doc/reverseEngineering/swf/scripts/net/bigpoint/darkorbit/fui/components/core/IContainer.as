package net.bigpoint.darkorbit.fui.components.core {

import net.bigpoint.darkorbit.fui.components.core.layout.ILayout;

public interface IContainer extends ICoreponent {


    function get layout(): ILayout;

    function set layout(param1: ILayout): void;
}
}
