package spark.components.gridClasses {

import mx.core.IDataRenderer;
import mx.core.IVisualElement;

import spark.components.Grid;

public interface IGridItemRenderer extends IDataRenderer, IVisualElement {


    function get grid(): Grid;

    function get rowIndex(): int;

    function set rowIndex(param1: int): void;

    function get down(): Boolean;

    function set down(param1: Boolean): void;

    function get dragging(): Boolean;

    function set dragging(param1: Boolean): void;

    function get hovered(): Boolean;

    function set hovered(param1: Boolean): void;

    function get label(): String;

    function set label(param1: String): void;

    function get selected(): Boolean;

    function set selected(param1: Boolean): void;

    function get showsCaret(): Boolean;

    function set showsCaret(param1: Boolean): void;

    function get column(): GridColumn;

    function set column(param1: GridColumn): void;

    function get columnIndex(): int;

    function prepare(param1: Boolean): void;

    function discard(param1: Boolean): void;
}
}
