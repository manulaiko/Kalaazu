package spark.components.gridClasses {

import mx.core.mx_internal;

public class CellPosition {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _columnIndex: int;

    private var _rowIndex: int;

    public function CellPosition(param1: int = -1, param2: int = -1) {
        super();
        this._rowIndex = param1;
        this._columnIndex = param2;
    }

    public function get columnIndex(): int {
        return this._columnIndex;
    }

    public function set columnIndex(param1: int): void {
        this._columnIndex = param1;
    }

    public function get rowIndex(): int {
        return this._rowIndex;
    }

    public function set rowIndex(param1: int): void {
        this._rowIndex = param1;
    }

    public function toString(): String {
        return "[rowIndex=" + this.rowIndex + " columnIndex=" + this.columnIndex + "]";
    }
}
}
