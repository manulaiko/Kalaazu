package spark.components.gridClasses {

import mx.core.mx_internal;

public class CellRegion {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _columnCount: int;

    private var _columnIndex: int;

    private var _rowCount: int;

    private var _rowIndex: int;

    public function CellRegion(param1: int = -1, param2: int = -1, param3: int = 0, param4: int = 0) {
        super();
        this._rowIndex = param1;
        this._columnIndex = param2;
        this._rowCount = param3;
        this._columnCount = param4;
    }

    public function get columnCount(): int {
        return this._columnCount;
    }

    public function set columnCount(param1: int): void {
        this._columnCount = param1;
    }

    public function get columnIndex(): int {
        return this._columnIndex;
    }

    public function set columnIndex(param1: int): void {
        this._columnIndex = param1;
    }

    public function get rowCount(): int {
        return this._rowCount;
    }

    public function set rowCount(param1: int): void {
        this._rowCount = param1;
    }

    public function get rowIndex(): int {
        return this._rowIndex;
    }

    public function set rowIndex(param1: int): void {
        this._rowIndex = param1;
    }

    public function toString(): String {
        return "[rowIndex=" + this.rowIndex + " columnIndex=" + this.columnIndex + " rowCount=" + this.rowCount + " columnCount=" + this.columnCount + "]";
    }
}
}
