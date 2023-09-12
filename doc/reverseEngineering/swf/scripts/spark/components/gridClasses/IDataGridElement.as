package spark.components.gridClasses {

import mx.core.IInvalidating;
import mx.core.IVisualElement;
import mx.managers.ILayoutManagerClient;

import spark.components.DataGrid;

public interface IDataGridElement extends IVisualElement, ILayoutManagerClient, IInvalidating {


    function get dataGrid(): DataGrid;

    function set dataGrid(param1: DataGrid): void;
}
}
