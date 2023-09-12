package net.bigpoint.darkorbit.mvc.gui.highlights.view {

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;

public interface IHighLighter {


    function decorateUiElement(param1: Object, param2: HighlightItemVO): void;

    function remove(): void;

    function get vo(): HighlightItemVO;

    function get expectedClass(): Class;
}
}
