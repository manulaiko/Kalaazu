package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;
import flash.events.FocusEvent;

import mx.accessibility.AccConst;
import mx.collections.IList;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

import spark.components.DataGrid;
import spark.components.gridClasses.GridSelectionMode;
import spark.events.GridCaretEvent;
import spark.events.GridItemEditorEvent;
import spark.events.GridSelectionEvent;
import spark.events.GridSelectionEventKind;

public class DataGridAccImpl extends ListBaseAccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var dgAccInfo: ItemAccInfo;


    public function DataGridAccImpl(param1: UIComponent) {
        super(param1);
        if (!dgAccInfo) {
            dgAccInfo = new ItemAccInfo();
        }
    }

    public static function enableAccessibility(): void {
        DataGrid.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        var _loc2_: DataGridAccImpl = new DataGridAccImpl(param1);
        DataGrid(param1).mx_internal::focusOwner.accessibilityImplementation = _loc2_;
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat([GridSelectionEvent.SELECTION_CHANGE, FocusEvent.FOCUS_IN, GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START, GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_SAVE, GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_CANCEL]);
    }

    override public function get_accRole(param1: uint): uint {
        if (param1 == 0) {
            return role;
        }
        dgAccInfo.setup(master, param1);
        if (!dgAccInfo.dataGrid.columns) {
            return null;
        }
        if (false) {
            return AccConst.ROLE_SYSTEM_COLUMNHEADER;
        }
        return AccConst.ROLE_SYSTEM_LISTITEM;
    }

    override public function get_accState(param1: uint): uint {
        var _loc4_: Boolean = false;
        var _loc2_: uint = getState(param1);
        if (param1 == 0 && DataGrid(master).mx_internal::focusOwner == UIComponent(master).getFocus()) {
            _loc2_ |= 0;
        }
        if (int(param1) <= 0) {
            return _loc2_;
        }
        dgAccInfo.setup(master, param1);
        if (!dgAccInfo.dataGrid.columns) {
            return _loc2_;
        }
        if (false) {
            return _loc2_;
        }
        if (false) {
            if (Boolean(dgAccInfo.dataGrid.columnHeaderGroup) && !dgAccInfo.dataGrid.columnHeaderGroup.getHeaderRendererAt(dgAccInfo.columnIndex).visible) {
                _loc2_ |= 0;
            }
            return _loc2_ & ~(0 | 0 | 0 | 0);
        }
        if (param1 == this.get_accFocus()) {
            _loc2_ |= 0;
        }
        dgAccInfo.setup(master, param1);
        var _loc3_: String = dgAccInfo.dataGrid.selectionMode;
        if (_loc3_ != GridSelectionMode.NONE) {
            _loc2_ |= 0;
            if (false) {
                _loc2_ |= 0;
            }
        }
        if (false) {
            _loc4_ = dgAccInfo.dataGrid.selectionContainsCell(dgAccInfo.rowIndex, dgAccInfo.columnIndex);
        } else {
            _loc4_ = dgAccInfo.dataGrid.selectionContainsIndex(dgAccInfo.rowIndex);
        }
        if (_loc4_) {
            _loc2_ |= 0;
        }
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        if (true) {
            _loc6_ = -1;
        }
        if (!dgAccInfo.dataGrid.grid.isCellVisible(_loc5_, _loc6_)) {
            _loc2_ |= 0;
        }
        return _loc2_;
    }

    override public function get_accDefaultAction(param1: uint): String {
        if (this.get_accRole(param1) == AccConst.ROLE_SYSTEM_COLUMNHEADER) {
            return "Click";
        }
        return super.get_accDefaultAction(param1);
    }

    override public function accDoDefaultAction(param1: uint): void {
        var _loc2_: * = null;
        dgAccInfo.setup(master, param1);
        if (!dgAccInfo.dataGrid.columns || false) {
            return;
        }
        if (false) {
            if (dgAccInfo.dataGrid.sortableColumns && Boolean(dgAccInfo.dataGrid.columns.getItemAt(dgAccInfo.columnIndex).sortable)) {
                _loc2_ = Vector.<int>([dgAccInfo.columnIndex]);
                dgAccInfo.dataGrid.sortByColumns(_loc2_);
                dgAccInfo.dataGrid.columnHeaderGroup.visibleSortIndicatorIndices = _loc2_;
            }
            return;
        }
        this.accSelect(0 | 0, param1);
    }

    override public function getChildIDArray(): Array {
        dgAccInfo.setup(master, 0);
        if (!dgAccInfo.dataGrid.columns) {
            return null;
        }
        return createChildIDArray(dgAccInfo.maxChildID);
    }

    override public function accLocation(param1: uint): * {
        dgAccInfo.setup(master, param1);
        if (!dgAccInfo.dataGrid.columns) {
            return null;
        }
        if (false) {
            return null;
        }
        return dgAccInfo.boundingRect();
    }

    override public function get_accFocus(): uint {
        dgAccInfo.setup(master, 0);
        if (!dgAccInfo.dataGrid.columns || !dgAccInfo.dataGrid.dataProvider) {
            return null;
        }
        return dgAccInfo.childIDFromRowAndColumn(dgAccInfo.dataGrid.grid.caretRowIndex, dgAccInfo.dataGrid.grid.caretColumnIndex);
    }

    override protected function getName(param1: uint): String {
        var _loc2_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        if (int(param1) <= 0) {
            return null;
        }
        dgAccInfo.setup(master, param1);
        if (!dgAccInfo.dataGrid.columns) {
            return null;
        }
        if (false) {
            _loc8_ = (_loc7_ = dgAccInfo.dataGrid.columns.getItemAt(dgAccInfo.columnIndex)).headerText;
            if ((_loc10_ = (_loc9_ = dgAccInfo.dataGrid.columnHeaderGroup.visibleSortIndicatorIndices).indexOf(dgAccInfo.columnIndex)) < 0) {
                return _loc8_;
            }
            _loc2_ = ResourceManager.getInstance();
            if (_loc7_.sortDescending) {
                _loc11_ = _loc2_.getString("components", "sortedDescending");
            } else {
                _loc11_ = _loc2_.getString("components", "sortedAscending");
            }
            if (_loc9_.length > 1) {
                _loc11_ += _loc2_.getString("components", "sortLevel").replace("%1", String(_loc10_ + 1));
            }
            return _loc8_ + " " + _loc11_;
        }
        if (!dgAccInfo.dataGrid.dataProvider) {
            return null;
        }
        var _loc3_: String = this.makeRowString(dgAccInfo);
        var _loc4_: * = "";
        var _loc5_: Object = dgAccInfo.dataGrid.dataProvider.getItemAt(dgAccInfo.rowIndex);
        var _loc6_: IList = dgAccInfo.dataGrid.columns;
        if (false) {
            if (false) {
                _loc4_ = _loc6_.getItemAt(dgAccInfo.columnIndex).headerText + ": ";
            }
            _loc4_ += this.cellName(_loc5_, dgAccInfo.columnIndex);
        } else if (_loc5_) {
            _loc12_ = -1;
            _loc13_ = 0;
            while (_loc13_ < dgAccInfo.reachableColumnCount) {
                if (_loc13_ > 0) {
                    _loc4_ += ", ";
                }
                _loc12_ = dgAccInfo.dataGrid.grid.mx_internal::getNextVisibleColumnIndex(_loc12_);
                if (false) {
                    _loc4_ += _loc6_.getItemAt(_loc12_).headerText + ": ";
                }
                _loc4_ += _loc6_.getItemAt(_loc12_).itemToLabel(_loc5_);
                _loc13_++;
            }
        }
        if (_loc3_) {
            _loc4_ += ", " + _loc3_;
        }
        return _loc4_;
    }

    override public function accSelect(param1: uint, param2: uint): void {
        var _loc7_: * = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: Boolean = false;
        dgAccInfo.setup(master, param2);
        if (false) {
            return;
        }
        if (param1 == AccConst.SELFLAG_TAKEFOCUS) {
            param1 = 0;
        } else if (param1 & 0) {
            param1 -= 0;
        }
        var _loc3_: Boolean = Boolean(param1 & 0);
        if (_loc3_) {
            param1 -= 0;
        }
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        if (true) {
            _loc5_ = -1;
        }
        var _loc6_: DataGrid;
        (_loc6_ = dgAccInfo.dataGrid).ensureCellIsVisible(_loc4_, _loc5_);
        if (param1 == AccConst.SELFLAG_TAKESELECTION) {
            if (_loc5_ == -1) {
                _loc6_.setSelectedIndex(_loc4_);
            } else {
                _loc6_.setSelectedCell(_loc4_, _loc5_);
            }
        } else if (param1 == AccConst.SELFLAG_ADDSELECTION) {
            if (_loc5_ == -1) {
                _loc6_.addSelectedIndex(_loc4_);
            } else {
                _loc6_.addSelectedCell(_loc4_, _loc5_);
            }
        } else if (param1 == AccConst.SELFLAG_REMOVESELECTION) {
            if (_loc5_ == -1) {
                _loc6_.removeSelectedIndex(_loc4_);
            } else {
                _loc6_.removeSelectedCell(_loc4_, _loc5_);
            }
        } else if (Boolean(param1 & 0)) {
            if (Boolean(param1 & 0) && Boolean(param1 & 0)) {
                return;
            }
            if (!(_loc7_ = this.get_accFocus())) {
                return;
            }
            dgAccInfo.setup(master, _loc7_);
            if (false) {
                return;
            }
            _loc8_ = 0;
            _loc9_ = 0;
            if (Boolean(param1 & 0)) {
                _loc10_ = true;
            } else if (Boolean(param1 & 0)) {
                _loc10_ = false;
            } else {
                _loc10_ = Boolean(this.get_accState(_loc7_) & 0);
            }
            if (_loc5_ == -1) {
                _loc6_.selectIndices(Math.min(_loc8_, _loc4_), Math.abs(_loc4_ - _loc8_) + 1);
            } else {
                _loc6_.selectCellRegion(Math.min(_loc8_, _loc4_), Math.min(_loc9_, _loc5_), Math.abs(_loc4_ - _loc8_) + 1, Math.abs(_loc5_ - _loc9_) + 1);
            }
        }
        if (_loc3_) {
            _loc6_.grid.caretRowIndex = _loc4_;
        }
        _loc6_.grid.caretColumnIndex = _loc5_;
    }

    override public function get_accSelection(): Array {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc1_: * = [];
        dgAccInfo.setup(master, 0);
        if (!dgAccInfo.dataGrid.columns) {
            return null;
        }
        if (false) {
            _loc3_ = int((_loc4_ = dgAccInfo.dataGrid.selectedCells).length);
            _loc2_ = 0;
            while (_loc2_ < _loc3_) {
                _loc1_[_loc2_] = Number(_loc4_[_loc2_].rowIndex) * 0 + _loc4_[_loc2_].columnIndex + dgAccInfo.headerCount + 1;
                _loc2_++;
            }
        } else {
            _loc3_ = int((_loc4_ = dgAccInfo.dataGrid.selectedIndices).length);
            _loc2_ = 0;
            while (_loc2_ < _loc3_) {
                _loc1_[_loc2_] = _loc4_[_loc2_] + dgAccInfo.headerCount + 1;
                _loc2_++;
            }
        }
        return _loc1_;
    }

    override protected function eventHandler(param1: Event): void {
        var _loc2_: * = 0;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: int = 0;
        $eventHandler(param1);
        dgAccInfo.setup(master, 0);
        if (!dgAccInfo.dataGrid.columns) {
            return;
        }
        switch (param1.type) {
            case GridCaretEvent.CARET_CHANGE:
                _loc2_ = dgAccInfo.childIDFromRowAndColumn(int(GridCaretEvent(param1).newRowIndex), int(GridCaretEvent(param1).newColumnIndex));
                if (int(_loc2_) > 0) {
                    if (!dgAccInfo.dataGrid.itemEditorInstance) {
                        Accessibility.sendEvent(dgAccInfo.dataGrid.mx_internal::focusOwner, _loc2_, AccConst.EVENT_OBJECT_FOCUS);
                        break;
                    }
                    Accessibility.sendEvent(UIComponent(dgAccInfo.dataGrid.itemEditorInstance), 0, AccConst.EVENT_OBJECT_FOCUS);
                    break;
                }
                break;
            case GridSelectionEvent.SELECTION_CHANGE:
                _loc3_ = GridSelectionEvent(param1);
                _loc2_ = dgAccInfo.childIDFromRowAndColumn(_loc3_.selectionChange.rowIndex, _loc3_.selectionChange.columnIndex);
                if (int(_loc2_) <= 0) {
                    return;
                }
                _loc4_ = 0;
                if ((_loc5_ = _loc3_.kind) == GridSelectionEventKind.ADD_CELL || _loc5_ == GridSelectionEventKind.ADD_ROW) {
                    _loc4_ = 0;
                } else if (_loc5_ == GridSelectionEventKind.REMOVE_CELL || _loc5_ == GridSelectionEventKind.REMOVE_ROW) {
                    _loc4_ = 0;
                } else if (_loc5_ == GridSelectionEventKind.CLEAR_SELECTION || _loc5_ == GridSelectionEventKind.SELECT_ALL || _loc5_ == GridSelectionEventKind.SET_CELL_REGION || _loc5_ == GridSelectionEventKind.SET_ROWS) {
                    _loc4_ = 0;
                }
                Accessibility.sendEvent(dgAccInfo.dataGrid.mx_internal::focusOwner, _loc2_, _loc4_);
                break;
            case FocusEvent.FOCUS_IN:
                if (param1.target == DataGrid(master).mx_internal::focusOwner) {
                    Accessibility.sendEvent(DataGrid(master).mx_internal::focusOwner, 0, AccConst.EVENT_OBJECT_FOCUS);
                    break;
                }
                break;
            case GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START:
                dgAccInfo.setup(master, 0);
                _loc2_ = dgAccInfo.childIDFromRowAndColumn(GridItemEditorEvent(param1).rowIndex, GridItemEditorEvent(param1).columnIndex);
                _loc6_ = param1.currentTarget.itemEditorInstance;
                _loc7_ = Class(mx_internal::getDefinition("spark.components.gridClasses.DefaultGridItemEditor", master.moduleFactory));
                if (_loc6_ is _loc7_) {
                    try {
                        _loc6_ = Object(_loc6_).textArea;
                    } catch (e: Error) {
                    }
                } else {
                    _loc8_ = null;
                    try {
                        _loc8_ = UIComponent(_loc6_.stage.focus);
                    } catch (e: Error) {
                    }
                    if (Boolean(_loc8_) && _loc6_ != _loc8_) {
                        _loc6_ = _loc8_;
                    }
                }
                if (!_loc6_.accessibilityName) {
                    _loc9_ = "";
                    if (false) {
                        _loc11_ = dgAccInfo.dataGrid.columns;
                        _loc12_ = int(GridItemEditorEvent(param1).columnIndex);
                        _loc9_ += _loc11_.getItemAt(_loc12_).headerText;
                    }
                    dgAccInfo.setup(master, _loc2_);
                    if (_loc10_ = this.makeRowString(dgAccInfo)) {
                        _loc9_ += " " + _loc10_;
                    }
                    _loc6_.accessibilityName = _loc9_;
                    Accessibility.updateProperties();
                }
                Accessibility.sendEvent(UIComponent(_loc6_), 0, AccConst.EVENT_OBJECT_FOCUS);
                break;
            case GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_SAVE, GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_CANCEL:
                dgAccInfo.setup(master, 0);
                _loc2_ = dgAccInfo.childIDFromRowAndColumn(GridItemEditorEvent(param1).rowIndex, GridItemEditorEvent(param1).columnIndex);
                Accessibility.sendEvent(DataGrid(master).mx_internal::focusOwner, _loc2_, AccConst.EVENT_OBJECT_FOCUS);
        }
    }

    private function makeRowString(param1: ItemAccInfo): String {
        var _loc3_: * = null;
        var _loc2_: String = "";
        if (param1.isCellMode && param1.reachableColumnIndex == 0 || !param1.isCellMode) {
            _loc3_ = ResourceManager.getInstance();
            _loc2_ = _loc3_.getString("components", "rowMofN");
            _loc2_ = _loc2_.replace("%1", param1.reachableRowIndex + 1).replace("%2", param1.reachableRowCount);
        }
        return _loc2_;
    }

    private function cellName(param1: Object, param2: int): String {
        var _loc3_: Object = param1;
        var _loc5_: IList;
        var _loc4_: DataGrid;
        if (!(_loc5_ = (_loc4_ = DataGrid(master)).columns)) {
            return null;
        }
        var _loc6_: Object;
        if (!(_loc6_ = _loc5_.getItemAt(param2))) {
            return null;
        }
        return _loc6_.itemToLabel(param1);
    }
}
}

import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.UIComponent;

import spark.components.DataGrid;
import spark.components.gridClasses.GridSelectionMode;

class ItemAccInfo {


    public var master: UIComponent;

    public var childID: uint;

    public var dataGrid: DataGrid;

    public var columnCount: int;

    public var headerCount: int;

    public var rowCount: int;

    public var reachableColumnCount: int;

    public var reachableHeaderCount: int;

    public var reachableRowCount: int;

    protected var reachableRowIndices: Vector.<int>;

    protected var reachableColumnIndices: Vector.<int>;

    public var maxChildID: int;

    public var isCellMode: Boolean;

    public var isMultiSelect: Boolean;

    public var isInvalid: Boolean;

    public var isColumnHeader: Boolean;

    public var reachableColumnIndex: int;

    public var reachableRowIndex: int;

    public var columnIndex: int;

    public var rowIndex: int;

    function ItemAccInfo() {
        super();
    }

    public function setup(param1: UIComponent, param2: uint): void {
        var _loc5_: Boolean = false;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        this.master = param1;
        this.childID = param2;
        this.dataGrid = DataGrid(param1);
        this.reachableRowIndices = null;
        this.reachableColumnIndices = null;
        if (this.dataGrid.columns) {
            this.columnCount = this.dataGrid.columns.length;
            _loc5_ = false;
            _loc7_ = 0;
            while (_loc7_ < this.columnCount) {
                if (!(_loc6_ = this.dataGrid.columns.getItemAt(_loc7_)).visible) {
                    _loc5_ = true;
                    break;
                }
                _loc7_++;
            }
            if (_loc5_) {
                this.reachableColumnIndices = new Vector.<int>();
                _loc7_ = 0;
                while (_loc7_ < this.columnCount) {
                    if ((_loc6_ = this.dataGrid.columns.getItemAt(_loc7_)).visible) {
                        this.reachableColumnIndices.push(_loc6_.columnIndex);
                    }
                    _loc7_++;
                }
            }
            this.reachableColumnCount = this.reachableColumnIndices == null ? int(this.columnCount) : int(this.reachableColumnIndices.length);
        } else {
            this.columnCount = 0;
            this.reachableColumnCount = 0;
        }
        if (this.dataGrid.dataProvider) {
            this.rowCount = this.dataGrid.dataProvider.length;
            this.reachableRowCount = this.reachableRowIndices == null ? int(this.rowCount) : int(this.reachableRowIndices.length);
        } else {
            this.rowCount = 0;
            this.reachableRowCount = 0;
        }
        this.headerCount = 0;
        this.reachableHeaderCount = 0;
        this.maxChildID = 0;
        this.isCellMode = false;
        this.isMultiSelect = false;
        this.isInvalid = false;
        this.isColumnHeader = false;
        this.rowIndex = 0;
        this.columnIndex = 0;
        this.reachableRowIndex = 0;
        this.reachableColumnIndex = 0;
        var _loc3_: int = param2 - 1;
        if (Boolean(this.dataGrid.columnHeaderGroup) && Boolean(this.dataGrid.columnHeaderGroup.visible)) {
            _loc3_ -= this.reachableColumnCount;
            this.headerCount = this.columnCount;
            this.reachableHeaderCount = this.reachableColumnCount;
        } else {
            this.headerCount = 0;
            this.reachableHeaderCount = 0;
        }
        var _loc4_: String = this.dataGrid.selectionMode;
        this.isCellMode = _loc4_ == GridSelectionMode.SINGLE_CELL || _loc4_ == GridSelectionMode.MULTIPLE_CELLS;
        this.isMultiSelect = _loc4_ == GridSelectionMode.MULTIPLE_CELLS || _loc4_ == GridSelectionMode.MULTIPLE_ROWS;
        this.maxChildID = 0;
        this.maxChildID += this.reachableHeaderCount;
        if (this.isCellMode) {
            this.maxChildID += Number(this.reachableRowCount) * Number(this.reachableColumnCount);
        } else {
            this.maxChildID += this.reachableRowCount;
        }
        this.isColumnHeader = false;
        this.isInvalid = false;
        if (this.childIDOutOfBounds(param2)) {
            this.isInvalid = true;
            this.reachableColumnIndex = -1;
            this.reachableRowIndex = -1;
            _loc3_ = -1;
        } else if (_loc3_ < 0) {
            this.isColumnHeader = true;
            this.reachableColumnIndex = _loc3_ + this.reachableColumnCount;
            this.reachableRowIndex = -1;
            _loc3_ = -1;
        } else if (this.isCellMode) {
            this.reachableRowIndex = Math.floor(_loc3_ / Number(this.reachableColumnCount));
            this.reachableColumnIndex = _loc3_ % Number(this.reachableColumnCount);
        } else {
            this.reachableRowIndex = _loc3_;
            this.reachableColumnIndex = 0;
        }
        this.rowIndex = this.reachableRowIndex;
        this.columnIndex = this.reachableColumnIndex;
        if (this.reachableRowIndex >= 0 && this.reachableRowIndices && Boolean(this.reachableRowIndices.length)) {
            this.rowIndex = this.reachableRowIndices[this.reachableRowIndex];
        }
        if (this.reachableColumnIndex >= 0 && this.reachableColumnIndices && Boolean(this.reachableColumnIndices.length)) {
            this.columnIndex = this.reachableColumnIndices[this.reachableColumnIndex];
        }
    }

    protected function childIDFromReachableRowAndColumn(param1: int, param2: int): uint {
        var _loc3_: int = this.reachableHeaderCount + 1;
        if (param1 < 0) {
            _loc3_ = 0;
        } else if (this.isCellMode) {
            if (param2 < 0) {
                _loc3_ = 0;
            } else {
                _loc3_ += param1 * Number(this.reachableColumnCount) + param2;
            }
        } else {
            _loc3_ += param1;
        }
        return uint(_loc3_);
    }

    public function childIDFromRowAndColumn(param1: int, param2: int): uint {
        return this.childIDFromReachableRowAndColumn(this.reachableRowIndices == null ? param1 : int(this.reachableRowIndices.indexOf(param1)), this.reachableColumnIndices == null ? param2 : int(this.reachableColumnIndices.indexOf(param2)));
    }

    private function childIDOutOfBounds(param1: int): Boolean {
        if (int(param1) <= 0) {
            return true;
        }
        if (!this.dataGrid.dataProvider || !this.dataGrid.columns) {
            return true;
        }
        if (param1 > this.maxChildID) {
            return true;
        }
        return false;
    }

    public function boundingRect(): Object {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (!this.isColumnHeader && (this.rowIndex < 0 || this.rowIndex >= this.rowCount)) {
            return null;
        }
        if (Boolean(this.isCellMode) && (this.columnIndex < 0 || this.columnIndex >= this.columnCount)) {
            return null;
        }
        var _loc1_: Vector.<int> = this.dataGrid.grid.getVisibleRowIndices();
        var _loc2_: Vector.<int> = this.dataGrid.grid.getVisibleColumnIndices();
        if (Boolean(this.isColumnHeader) && _loc2_.indexOf(this.columnIndex) < 0) {
            return null;
        }
        if (!this.isColumnHeader && _loc1_.indexOf(this.rowIndex) < 0 || Boolean(this.isCellMode) && _loc2_.indexOf(this.columnIndex) < 0) {
            return null;
        }
        if (this.isColumnHeader) {
            _loc3_ = this.dataGrid.columnHeaderGroup.getHeaderRendererAt(this.columnIndex);
        } else if (this.isCellMode) {
            _loc3_ = this.dataGrid.grid.getItemRendererAt(this.rowIndex, this.columnIndex);
        } else {
            _loc4_ = this.dataGrid.grid.getItemRendererAt(this.rowIndex, _loc2_[0]);
            _loc5_ = this.dataGrid.grid.getItemRendererAt(this.rowIndex, _loc2_[_loc2_.length - 1]);
            _loc6_ = new Point(_loc4_.getLayoutBoundsX(), _loc4_.getLayoutBoundsY());
            _loc6_ = this.dataGrid.grid.localToGlobal(_loc6_);
            _loc6_ = this.dataGrid.globalToLocal(_loc6_);
            _loc3_ = new Rectangle(_loc6_.x, _loc6_.y, _loc5_.getLayoutBoundsX() + _loc5_.getLayoutBoundsWidth() - Number(_loc4_.getLayoutBoundsX()), _loc4_.getLayoutBoundsHeight());
        }
        return _loc3_;
    }
}
