package spark.events {

import mx.core.mx_internal;

public final class GridSelectionEventKind {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const SELECT_ALL: String = "selectAll";

    public static const CLEAR_SELECTION: String = "clearSelection";

    public static const SET_ROW: String = "setRow";

    public static const ADD_ROW: String = "addRow";

    public static const REMOVE_ROW: String = "removeRow";

    public static const SET_ROWS: String = "setRows";

    public static const SET_CELL: String = "setCell";

    public static const ADD_CELL: String = "addCell";

    public static const REMOVE_CELL: String = "removeCell";

    public static const SET_CELL_REGION: String = "setCellRegion";


    public function GridSelectionEventKind() {
        super();
    }
}
}
