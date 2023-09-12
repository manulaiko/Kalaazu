package spark.components.gridClasses {

import flash.geom.Rectangle;
import flash.utils.Dictionary;
import flash.utils.getTimer;

import mx.collections.IList;
import mx.core.ClassFactory;
import mx.core.IFactory;
import mx.core.IInvalidating;
import mx.core.IVisualElement;
import mx.core.IVisualElementContainer;
import mx.core.Singleton;
import mx.core.mx_internal;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.events.PropertyChangeEvent;
import mx.managers.ILayoutManagerClient;
import mx.managers.LayoutManager;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.core.IGraphicElement;
import spark.layouts.supportClasses.LayoutBase;

public class GridLayout extends LayoutBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var _embeddedFontRegistryExists: Boolean = false;

    private static var embeddedFontRegistryExistsInitialized: Boolean = false;

    private static const MAX_ELEMENT_SIZE: Number = 8192;

    private static const ELEMENT_EDGE_PAD: Number = 512;


    public var gridDimensions: GridDimensions;

    private var visibleRowIndices: Vector.<int>;

    private var visibleColumnIndices: Vector.<int>;

    private var oldVisibleRowIndices: Vector.<int>;

    private var oldVisibleColumnIndices: Vector.<int>;

    private var visibleRowBackgrounds: Vector.<IVisualElement>;

    private var visibleRowSeparators: Vector.<IVisualElement>;

    private var visibleColumnSeparators: Vector.<IVisualElement>;

    private var visibleItemRenderers: Vector.<IGridItemRenderer>;

    private var hoverIndicator: IVisualElement = null;

    private var caretIndicator: IVisualElement = null;

    private var editorIndicator: IVisualElement = null;

    private const visibleItemRenderersBounds: Rectangle = new Rectangle();

    private const visibleGridBounds: Rectangle = new Rectangle();

    private const freeElementMap: Dictionary = new Dictionary();

    private const elementToFactoryMap: Dictionary = new Dictionary();

    private var oldVerticalScrollPosition: Number = 0;

    private var oldHorizontalScrollPosition: Number = 0;

    private var _showCaret: Boolean = false;

    private const gridItemRendererClassFactories: Dictionary = new Dictionary(true);

    private var visibleSelectionIndicators: Vector.<IVisualElement>;

    private var visibleRowSelectionIndices: Vector.<int>;

    private var visibleColumnSelectionIndices: Vector.<int>;

    private var mouseXOffset: Number = 0;

    private var mouseYOffset: Number = 0;

    private var createdGridElement: Boolean = false;

    private var _performanceStatistics: Object = null;

    private var _enablePerformanceStatistics: Boolean = false;

    public function GridLayout() {
        this.visibleRowIndices = new Vector.<int>(0);
        this.visibleColumnIndices = new Vector.<int>(0);
        this.oldVisibleRowIndices = new Vector.<int>(0);
        this.oldVisibleColumnIndices = new Vector.<int>(0);
        this.visibleRowBackgrounds = new Vector.<IVisualElement>(0);
        this.visibleRowSeparators = new Vector.<IVisualElement>(0);
        this.visibleColumnSeparators = new Vector.<IVisualElement>(0);
        this.visibleItemRenderers = new Vector.<IGridItemRenderer>(0);
        this.visibleSelectionIndicators = new Vector.<IVisualElement>(0);
        this.visibleRowSelectionIndices = new Vector.<int>(0);
        this.visibleColumnSelectionIndices = new Vector.<int>(0);
        super();
        this.gridDimensions = new GridDimensions();
    }

    private static function get embeddedFontRegistryExists(): Boolean {
        if (!embeddedFontRegistryExistsInitialized) {
            embeddedFontRegistryExistsInitialized = true;
            try {
                _embeddedFontRegistryExists = Singleton.getInstance("mx.core::IEmbeddedFontRegistry") != null;
            } catch (e: Error) {
                _embeddedFontRegistryExists = false;
            }
        }
        return _embeddedFontRegistryExists;
    }

    private static function clampColumnWidth(param1: Number, param2: GridColumn): Number {
        var _loc3_: Number = param2.minWidth;
        var _loc4_: Number = param2.maxWidth;
        if (!isNaN(_loc3_)) {
            param1 = Math.max(param1, _loc3_);
        }
        if (!isNaN(_loc4_)) {
            param1 = Math.min(param1, _loc4_);
        }
        return param1;
    }

    override public function get useVirtualLayout(): Boolean {
        return true;
    }

    override public function set useVirtualLayout(param1: Boolean): void {
    }

    public function get showCaret(): Boolean {
        return this._showCaret;
    }

    public function set showCaret(param1: Boolean): void {
        if (this.caretIndicator) {
            this.caretIndicator.visible = param1;
        }
        this._showCaret = param1;
    }

    override public function clearVirtualLayoutCache(): void {
        this.freeGridElements(this.visibleRowBackgrounds);
        this.freeGridElements(this.visibleRowSeparators);
        this.visibleRowIndices.length = 0;
        this.freeGridElements(this.visibleColumnSeparators);
        this.visibleColumnIndices.length = 0;
        this.freeItemRenderers(this.visibleItemRenderers);
        this.clearSelectionIndicators();
        this.freeGridElement(this.hoverIndicator);
        this.hoverIndicator = null;
        this.freeGridElement(this.caretIndicator);
        this.caretIndicator = null;
        this.freeGridElement(this.editorIndicator);
        this.editorIndicator = null;
        this.visibleItemRenderersBounds.setEmpty();
        this.visibleGridBounds.setEmpty();
    }

    override public function getElementBounds(param1: int): Rectangle {
        var _loc3_: * = 0;
        var _loc4_: int = 0;
        var _loc2_: IList = !!this.grid ? this.grid.columns : null;
        if (!_loc2_) {
            return null;
        }
        _loc3_ = _loc2_.length;
        _loc4_ = param1 / _loc3_;
        var _loc5_: int = param1 - _loc4_ * _loc3_;
        return this.gridDimensions.getCellBounds(_loc4_, _loc5_);
    }

    override protected function getElementBoundsAboveScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: int = 0;
        _loc2_ = Math.max(0, param1.top - 1);
        var _loc3_: int = this.gridDimensions.getRowIndexAt(param1.x, _loc2_);
        return this.gridDimensions.getRowBounds(_loc3_);
    }

    override protected function getElementBoundsBelowScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        _loc2_ = Math.max(0, this.gridDimensions.getContentHeight() - 1);
        _loc3_ = Math.min(_loc2_, param1.bottom + 1);
        var _loc4_: int = this.gridDimensions.getRowIndexAt(param1.x, _loc3_);
        return this.gridDimensions.getRowBounds(_loc4_);
    }

    override protected function getElementBoundsLeftOfScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: int = 0;
        _loc2_ = Math.max(0, param1.left - 1);
        var _loc3_: int = this.gridDimensions.getColumnIndexAt(_loc2_, param1.y);
        return this.gridDimensions.getColumnBounds(_loc3_);
    }

    override protected function getElementBoundsRightOfScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        _loc2_ = Math.max(0, this.gridDimensions.getContentWidth() - 1);
        _loc3_ = Math.min(_loc2_, param1.right + 1);
        var _loc4_: int = this.gridDimensions.getColumnIndexAt(_loc3_, param1.y);
        return this.gridDimensions.getColumnBounds(_loc4_);
    }

    override protected function scrollPositionChanged(): void {
        var _loc3_: Boolean = false;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: * = null;
        if (!this.grid) {
            return;
        }
        this.grid.hoverRowIndex = -1;
        this.grid.hoverColumnIndex = -1;
        super.scrollPositionChanged();
        var _loc1_: * = this.oldHorizontalScrollPosition != horizontalScrollPosition;
        var _loc2_: * = this.oldVerticalScrollPosition != verticalScrollPosition;
        this.oldHorizontalScrollPosition = horizontalScrollPosition;
        this.oldVerticalScrollPosition = verticalScrollPosition;
        if (this.visibleRowIndices.length == 0 || this.visibleColumnIndices.length == 0) {
            _loc3_ = true;
        }
        if (!_loc3_ && _loc2_) {
            _loc4_ = this.visibleRowIndices[0];
            _loc5_ = this.visibleRowIndices[this.visibleRowIndices.length - 1];
            _loc6_ = this.gridDimensions.getRowIndexAt(horizontalScrollPosition, verticalScrollPosition);
            _loc7_ = this.gridDimensions.getRowIndexAt(horizontalScrollPosition, verticalScrollPosition + target.height);
            if (_loc4_ != _loc6_ || _loc5_ != _loc7_) {
                _loc3_ = true;
            }
        }
        if (!_loc3_ && _loc1_) {
            _loc8_ = this.visibleColumnIndices[0];
            _loc9_ = this.visibleColumnIndices[this.visibleColumnIndices.length - 1];
            _loc10_ = this.gridDimensions.getColumnIndexAt(horizontalScrollPosition, verticalScrollPosition);
            _loc11_ = this.gridDimensions.getColumnIndexAt(horizontalScrollPosition + target.width, verticalScrollPosition);
            if (_loc8_ != _loc10_ || _loc9_ != _loc11_) {
                _loc3_ = true;
            }
        }
        if (_loc3_) {
            _loc12_ = "none";
            if (_loc2_ && _loc1_) {
                _loc12_ = "bothScrollPositions";
            } else if (_loc2_) {
                _loc12_ = "verticalScrollPosition";
            } else if (_loc1_) {
                _loc12_ = "horizontalScrollPosition";
            }
            this.grid.mx_internal::invalidateDisplayListFor(_loc12_);
        }
    }

    override public function measure(): void {
        var _loc1_: Number = NaN;
        var _loc7_: int = 0;
        var _loc8_: Number = NaN;
        if (!this.grid) {
            return;
        }
        if (this.enablePerformanceStatistics) {
            _loc1_ = getTimer();
        }
        this.updateTypicalCellSizes();
        var _loc2_: int = this.grid.requestedRowCount;
        if (_loc2_ == -1) {
            _loc7_ = this.gridDimensions.rowCount;
            if (this.grid.requestedMaxRowCount != -1) {
                _loc2_ = Math.min(this.grid.requestedMaxRowCount, _loc7_);
            }
            if (this.grid.requestedMinRowCount != -1) {
                _loc2_ = Math.max(this.grid.requestedMinRowCount, _loc2_);
            }
        }
        var _loc3_: Number = this.gridDimensions.getTypicalContentWidth(this.grid.requestedColumnCount);
        var _loc4_: Number = this.gridDimensions.getTypicalContentHeight(_loc2_);
        var _loc5_: Number = this.gridDimensions.getTypicalContentWidth(this.grid.requestedMinColumnCount);
        var _loc6_: Number = this.gridDimensions.getTypicalContentHeight(this.grid.requestedMinRowCount);
        this.grid.measuredWidth = Math.ceil(_loc3_);
        this.grid.measuredHeight = Math.ceil(_loc4_);
        this.grid.measuredMinWidth = Math.ceil(_loc5_);
        this.grid.measuredMinHeight = Math.ceil(_loc6_);
        if (this.enablePerformanceStatistics) {
            _loc8_ = getTimer() - _loc1_;
            this.performanceStatistics.measureTimes.push(_loc8_);
        }
    }

    override public function updateDisplayList(param1: Number, param2: Number): void {
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: int = 0;
        if (!this.grid) {
            return;
        }
        if (this.enablePerformanceStatistics) {
            _loc3_ = getTimer();
            if (this.performanceStatistics.updateDisplayListStartTime === undefined) {
                this.performanceStatistics.updateDisplayListStartTime = _loc3_;
            }
        }
        var _loc5_: int = !!(_loc4_ = this.grid.columns) ? this.grid.mx_internal::getPreviousVisibleColumnIndex(this.grid.columns.length) : -1;
        if (!_loc4_ || _loc5_ < 0) {
            return;
        }
        var _loc6_: GridLayer = this.getLayer("backgroundLayer");
        var _loc7_: GridLayer = this.getLayer("selectionLayer");
        var _loc8_: GridLayer = this.getLayer("editorIndicatorLayer");
        var _loc9_: GridLayer = this.getLayer("rendererLayer");
        var _loc10_: GridLayer = this.getLayer("overlayLayer");
        var _loc11_: Boolean;
        if (_loc11_ = this.grid.mx_internal::isInvalidateDisplayListReason("verticalScrollPosition") || this.grid.mx_internal::isInvalidateDisplayListReason("horizontalScrollPosition")) {
            this.oldVisibleRowIndices = this.visibleRowIndices;
            this.oldVisibleColumnIndices = this.visibleColumnIndices;
            _loc12_ = Math.max(0, horizontalScrollPosition);
            _loc13_ = Math.max(0, verticalScrollPosition);
            this.visibleGridBounds.x = _loc12_;
            this.visibleGridBounds.y = _loc13_;
            this.visibleGridBounds.width = param1;
            this.visibleGridBounds.height = param2;
            this.layoutColumns(_loc12_, _loc13_, param1);
            this.layoutItemRenderers(_loc9_, _loc12_, _loc13_, param1, param2);
            _loc14_ = Math.ceil(this.gridDimensions.getContentWidth());
            _loc15_ = Math.ceil(this.gridDimensions.getContentHeight());
            this.grid.setContentSize(_loc14_, _loc15_);
            _loc16_ = this.gridDimensions.rowCount;
            if (_loc13_ == 0 && _loc15_ < param2) {
                _loc19_ = param2 - this.gridDimensions.getContentHeight();
                _loc16_ += Math.ceil(_loc19_ / this.gridDimensions.defaultRowHeight);
            }
            _loc17_ = this.gridDimensions.rowCount;
            while (_loc17_ < _loc16_) {
                this.visibleRowIndices.push(_loc17_);
                _loc17_++;
            }
            this.visibleRowBackgrounds = this.layoutLinearElements(this.grid.rowBackground, _loc6_, this.visibleRowBackgrounds, this.oldVisibleRowIndices, this.visibleRowIndices, this.layoutRowBackground);
            _loc18_ = _loc16_ - 1;
            this.visibleRowSeparators = this.layoutLinearElements(this.grid.rowSeparator, _loc10_, this.visibleRowSeparators, this.oldVisibleRowIndices, this.visibleRowIndices, this.layoutRowSeparator, _loc18_);
            this.visibleColumnSeparators = this.layoutLinearElements(this.grid.columnSeparator, _loc10_, this.visibleColumnSeparators, this.oldVisibleColumnIndices, this.visibleColumnIndices, this.layoutColumnSeparator, _loc5_);
            this.oldVisibleRowIndices.length = 0;
            this.oldVisibleColumnIndices.length = 0;
        }
        if (_loc11_ || this.grid.mx_internal::isInvalidateDisplayListReason("hoverIndicator")) {
            this.layoutHoverIndicator(_loc6_);
        }
        if (_loc11_ || this.grid.mx_internal::isInvalidateDisplayListReason("selectionIndicator")) {
            this.layoutSelectionIndicators(_loc7_);
        }
        if (_loc11_ || this.grid.mx_internal::isInvalidateDisplayListReason("caretIndicator")) {
            this.layoutCaretIndicator(_loc10_);
        }
        if (_loc11_ || this.grid.mx_internal::isInvalidateDisplayListReason("editorIndicator")) {
            this.layoutEditorIndicator(_loc8_);
        }
        if (!_loc11_) {
            this.updateVisibleItemRenderers();
        }
        this.grid.validateNow();
        if (this.enablePerformanceStatistics) {
            _loc20_ = getTimer();
            _loc21_ = this.visibleRowIndices.length * this.visibleColumnIndices.length;
            this.performanceStatistics.updateDisplayListEndTime = _loc20_;
            this.performanceStatistics.updateDisplayListTimes.push(_loc20_ - _loc3_);
            this.performanceStatistics.updateDisplayListRectangles.push(this.visibleGridBounds.clone());
            this.performanceStatistics.updateDisplayListCellCounts.push(_loc21_);
        }
    }

    private function updateVisibleItemRenderers(): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: Boolean = false;
        var _loc8_: Boolean = false;
        var _loc9_: Boolean = false;
        var _loc1_: Grid = this.grid;
        var _loc2_: Boolean = this.isRowSelectionMode();
        var _loc3_: Boolean = this.isCellSelectionMode();
        if (!_loc2_ && !_loc3_) {
            return;
        }
        for each(_loc4_ in this.visibleItemRenderers) {
            _loc5_ = int(_loc4_.rowIndex);
            _loc6_ = _loc4_.columnIndex;
            _loc7_ = _loc4_.selected;
            _loc8_ = _loc4_.showsCaret;
            _loc9_ = _loc4_.hovered;
            if (_loc2_) {
                _loc4_.selected = _loc1_.selectionContainsIndex(_loc5_);
                _loc4_.showsCaret = _loc1_.caretRowIndex == _loc5_;
                _loc4_.hovered = _loc1_.hoverRowIndex == _loc5_;
            } else if (_loc3_) {
                _loc4_.selected = _loc1_.selectionContainsCell(_loc5_, _loc6_);
                _loc4_.showsCaret = _loc1_.caretRowIndex == _loc5_ && _loc1_.caretColumnIndex == _loc6_;
                _loc4_.hovered = _loc1_.hoverRowIndex == _loc5_ && _loc1_.hoverColumnIndex == _loc6_;
            }
            if (_loc7_ != _loc4_.selected || _loc8_ != _loc4_.showsCaret || _loc9_ != _loc4_.hovered) {
                _loc4_.prepare(true);
            }
        }
    }

    private function get grid(): Grid {
        return target as Grid;
    }

    private function getLayer(param1: String): GridLayer {
        var _loc2_: Grid = target as Grid;
        if (!_loc2_) {
            return null;
        }
        return _loc2_.getChildByName(param1) as GridLayer;
    }

    private function getGridColumn(param1: int): GridColumn {
        var _loc2_: IList = this.grid.columns;
        if (_loc2_ == null || param1 >= _loc2_.length || param1 < 0) {
            return null;
        }
        return _loc2_.getItemAt(param1) as GridColumn;
    }

    private function getDataProviderItem(param1: int): Object {
        var _loc2_: IList = this.grid.dataProvider;
        if (_loc2_ == null || param1 >= _loc2_.length || param1 < 0) {
            return null;
        }
        return _loc2_.getItemAt(param1);
    }

    private function createTypicalItemRenderer(param1: int): IGridItemRenderer {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: GridLayer = this.getLayer("rendererLayer");
        if (!_loc2_) {
            return null;
        }
        var _loc3_: Object = this.grid.typicalItem;
        if (_loc3_ == null) {
            _loc3_ = this.getDataProviderItem(0);
        }
        _loc4_ = this.getGridColumn(param1);
        _loc5_ = this.itemToRenderer(_loc4_, _loc3_);
        var _loc6_: IGridItemRenderer = this.allocateGridElement(_loc5_) as IGridItemRenderer;
        _loc2_.addElement(_loc6_);
        this.initializeItemRenderer(_loc6_, 0, param1, this.grid.typicalItem, false);
        var _loc7_: Number = _loc4_.width;
        if (isNaN(_loc7_)) {
            if ("explicitWidth" in _loc6_) {
                _loc7_ = Number(Object(_loc6_).explicitWidth);
            }
        }
        if (isNaN(_loc7_)) {
            _loc7_ = 4096;
        }
        this.layoutItemRenderer(_loc6_, 0, 0, _loc7_, NaN);
        return _loc6_;
    }

    private function updateVisibleTypicalCellSizes(param1: Number, param2: Number, param3: int): void {
        var _loc5_: * = null;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc4_: GridLayer;
        if (!(_loc4_ = this.getLayer("rendererLayer"))) {
            return;
        }
        var _loc6_: int = (_loc5_ = this.gridDimensions).columnCount;
        var _loc7_: Number = _loc5_.getCellX(0, param3);
        var _loc8_: int = _loc5_.columnGap;
        var _loc9_: int = param3;
        while (param1 > 0 && _loc9_ >= 0 && _loc9_ < _loc6_) {
            _loc10_ = _loc5_.getTypicalCellHeight(_loc9_);
            _loc11_ = _loc5_.getTypicalCellWidth(_loc9_);
            _loc12_ = this.getGridColumn(_loc9_);
            if (!isNaN(_loc12_.width)) {
                _loc11_ = _loc12_.width;
                _loc5_.setTypicalCellWidth(_loc9_, _loc11_);
            }
            if (isNaN(_loc11_) || isNaN(_loc10_)) {
                _loc13_ = this.createTypicalItemRenderer(_loc9_);
                if (isNaN(_loc11_)) {
                    _loc11_ = clampColumnWidth(_loc13_.getPreferredBoundsWidth(), _loc12_);
                    _loc5_.setTypicalCellWidth(_loc9_, _loc11_);
                }
                if (isNaN(_loc10_)) {
                    _loc10_ = Number(_loc13_.getPreferredBoundsHeight());
                    _loc5_.setTypicalCellHeight(_loc9_, _loc10_);
                }
                _loc4_.removeElement(_loc13_);
                this.freeGridElement(_loc13_);
            }
            if (_loc9_ == param3) {
                param1 -= _loc7_ + _loc11_ - param2;
            } else {
                param1 -= _loc11_ + _loc8_;
            }
            _loc9_ = this.grid.mx_internal::getNextVisibleColumnIndex(_loc9_);
        }
    }

    private function updateTypicalCellSizes(): void {
        var _loc2_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc11_: Boolean = false;
        var _loc12_: * = null;
        var _loc1_: GridLayer = this.getLayer("rendererLayer");
        if (!_loc1_) {
            return;
        }
        _loc2_ = this.gridDimensions;
        var _loc3_: int = _loc2_.columnCount;
        var _loc4_: int = _loc2_.columnGap;
        var _loc5_: int = this.grid.requestedColumnCount;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        while (_loc7_ < _loc3_) {
            _loc8_ = _loc2_.getTypicalCellHeight(_loc7_);
            _loc9_ = _loc2_.getTypicalCellWidth(_loc7_);
            if (!(_loc10_ = this.getGridColumn(_loc7_)).visible) {
                _loc2_.setTypicalCellWidth(_loc7_, 0);
                _loc2_.setTypicalCellHeight(_loc7_, 0);
            } else {
                if (!isNaN(_loc10_.width)) {
                    _loc9_ = _loc10_.width;
                    _loc2_.setTypicalCellWidth(_loc7_, _loc9_);
                }
                if ((_loc11_ = _loc5_ == -1 || _loc6_ < _loc5_) && (isNaN(_loc9_) || isNaN(_loc8_))) {
                    _loc12_ = this.createTypicalItemRenderer(_loc7_);
                    if (isNaN(_loc9_)) {
                        _loc9_ = clampColumnWidth(_loc12_.getPreferredBoundsWidth(), _loc10_);
                        _loc2_.setTypicalCellWidth(_loc7_, _loc9_);
                    }
                    if (isNaN(_loc8_)) {
                        _loc8_ = Number(_loc12_.getPreferredBoundsHeight());
                        _loc2_.setTypicalCellHeight(_loc7_, _loc8_);
                    }
                    _loc1_.removeElement(_loc12_);
                    this.freeGridElement(_loc12_);
                }
                _loc6_++;
            }
            _loc7_++;
        }
    }

    private function layoutColumns(param1: Number, param2: Number, param3: Number): void {
        var _loc6_: int = 0;
        var _loc13_: Number = NaN;
        var _loc14_: * = null;
        var _loc15_: Number = NaN;
        var _loc5_: int;
        var _loc4_: GridDimensions;
        if ((_loc5_ = (_loc4_ = this.gridDimensions).columnCount) <= 0) {
            return;
        }
        _loc6_ = _loc4_.getColumnIndexAt(param1, param2);
        this.updateVisibleTypicalCellSizes(param3, param1, _loc6_);
        var _loc7_: int = _loc4_.columnGap;
        var _loc8_: Number = _loc4_.getCellX(0, _loc6_);
        var _loc9_: Number = param3;
        var _loc10_: * = 0;
        var _loc11_: int = _loc6_;
        while (_loc9_ > 0 && _loc11_ >= 0 && _loc11_ < _loc5_) {
            _loc13_ = _loc4_.getTypicalCellWidth(_loc11_);
            _loc14_ = this.getGridColumn(_loc11_);
            if (isNaN(_loc14_.width)) {
                _loc10_ += 1;
                _loc13_ = clampColumnWidth(_loc13_, _loc14_);
            } else {
                _loc13_ = _loc14_.width;
            }
            _loc4_.setColumnWidth(_loc11_, _loc13_);
            if (_loc11_ == _loc6_) {
                _loc9_ -= _loc8_ + _loc13_ - param1;
            } else {
                _loc9_ -= _loc13_ + _loc7_;
            }
            _loc11_ = this.grid.mx_internal::getNextVisibleColumnIndex(_loc11_);
        }
        if (param1 != 0 || _loc9_ < 1 || _loc10_ == 0) {
            return;
        }
        var _loc12_: Number = Math.ceil(_loc9_ / _loc10_);
        _loc11_ = _loc6_;
        while (_loc11_ >= 0 && _loc11_ < _loc5_ && _loc9_ >= 1) {
            _loc14_ = this.getGridColumn(_loc11_);
            if (isNaN(_loc14_.width)) {
                _loc13_ = (_loc15_ = _loc4_.getColumnWidth(_loc11_)) + Math.min(_loc9_, _loc12_);
                _loc13_ = clampColumnWidth(_loc13_, _loc14_);
                _loc4_.setColumnWidth(_loc11_, _loc13_);
                _loc9_ -= _loc13_ - _loc15_;
            }
            _loc11_ = this.grid.mx_internal::getNextVisibleColumnIndex(_loc11_);
        }
    }

    private function itemToRenderer(param1: GridColumn, param2: Object): IFactory {
        var _loc3_: IFactory = param1.itemToRenderer(param2);
        var _loc4_: * = null;
        if (embeddedFontRegistryExists && _loc3_ is ClassFactory) {
            if (!(_loc4_ = this.gridItemRendererClassFactories[_loc3_])) {
                _loc4_ = new GridItemRendererClassFactory(this.grid, ClassFactory(_loc3_));
                this.gridItemRendererClassFactories[_loc3_] = _loc4_;
            }
        }
        return !!_loc4_ ? _loc4_ : _loc3_;
    }

    private function layoutItemRenderers(param1: GridLayer, param2: Number, param3: Number, param4: Number, param5: Number): void {
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc19_: * = null;
        var _loc25_: * = null;
        var _loc26_: Number = NaN;
        var _loc27_: Number = NaN;
        var _loc28_: Number = NaN;
        var _loc29_: * = null;
        var _loc30_: Number = NaN;
        var _loc31_: Number = NaN;
        var _loc32_: * = null;
        var _loc33_: * = null;
        var _loc34_: int = 0;
        var _loc35_: int = 0;
        var _loc36_: int = 0;
        var _loc37_: int = 0;
        var _loc38_: Number = NaN;
        var _loc39_: Number = NaN;
        var _loc40_: Number = NaN;
        var _loc41_: int = 0;
        var _loc42_: int = 0;
        var _loc43_: * = null;
        if (!param1) {
            return;
        }
        var _loc9_: int = (_loc8_ = this.gridDimensions).rowCount;
        var _loc10_: int = _loc8_.columnCount;
        var _loc11_: int = _loc8_.rowGap;
        var _loc12_: int = _loc8_.columnGap;
        _loc13_ = _loc8_.getColumnIndexAt(param2, param3);
        _loc14_ = _loc8_.getRowIndexAt(param2, param3);
        var _loc15_: Number = _loc8_.getCellX(_loc14_, _loc13_);
        var _loc16_: Number = _loc8_.getCellY(_loc14_, _loc13_);
        var _loc17_: Vector.<int> = new Vector.<int>();
        var _loc18_: Number = param4;
        _loc7_ = _loc13_;
        while (_loc18_ > 0 && _loc7_ >= 0 && _loc7_ < _loc10_) {
            _loc17_.push(_loc7_);
            _loc26_ = _loc8_.getColumnWidth(_loc7_);
            if (_loc7_ == _loc13_) {
                _loc18_ -= _loc15_ + _loc26_ - param2;
            } else {
                _loc18_ -= _loc26_ + _loc12_;
            }
            _loc7_ = this.grid.mx_internal::getNextVisibleColumnIndex(_loc7_);
        }
        var _loc20_: Vector.<int> = new Vector.<int>();
        var _loc21_: Vector.<IGridItemRenderer> = new Vector.<IGridItemRenderer>();
        var _loc22_: Number = _loc15_;
        var _loc23_: Number = _loc16_;
        var _loc24_: Number = param5;
        _loc6_ = _loc14_;
        while (_loc24_ > 0 && _loc6_ >= 0 && _loc6_ < _loc9_) {
            _loc20_.push(_loc6_);
            _loc27_ = _loc8_.getRowHeight(_loc6_);
            for each(_loc7_ in _loc17_) {
                if (!(_loc29_ = this.takeVisibleItemRenderer(_loc6_, _loc7_))) {
                    _loc32_ = this.getDataProviderItem(_loc6_);
                    _loc19_ = this.getGridColumn(_loc7_);
                    _loc33_ = this.itemToRenderer(_loc19_, _loc32_);
                    _loc29_ = this.allocateGridElement(_loc33_) as IGridItemRenderer;
                }
                if (_loc29_.parent != param1) {
                    param1.addElement(_loc29_);
                }
                _loc21_.push(_loc29_);
                this.initializeItemRenderer(_loc29_, _loc6_, _loc7_);
                _loc30_ = _loc8_.getColumnWidth(_loc7_);
                this.layoutItemRenderer(_loc29_, _loc22_, _loc23_, _loc30_, _loc27_);
                _loc31_ = Number(_loc29_.getPreferredBoundsHeight());
                _loc8_.setCellHeight(_loc6_, _loc7_, _loc31_);
                _loc22_ += _loc30_ + _loc12_;
            }
            _loc28_ = _loc8_.getRowHeight(_loc6_);
            if (_loc27_ != _loc28_) {
                _loc34_ = _loc17_.length;
                _loc27_ = _loc28_;
                for each(_loc7_ in _loc17_) {
                    _loc35_ = _loc20_.indexOf(_loc6_);
                    _loc36_ = _loc17_.indexOf(_loc7_);
                    _loc37_ = _loc35_ * _loc34_ + _loc36_;
                    _loc38_ = Number((_loc29_ = _loc21_[_loc37_]).getLayoutBoundsX());
                    _loc39_ = Number(_loc29_.getLayoutBoundsY());
                    _loc40_ = Number(_loc29_.getLayoutBoundsWidth());
                    this.layoutItemRenderer(_loc29_, _loc38_, _loc39_, _loc40_, _loc27_);
                    _loc8_.setCellHeight(_loc6_, _loc7_, _loc29_.getPreferredBoundsHeight());
                }
            }
            _loc22_ = _loc15_;
            _loc23_ += _loc27_ + _loc11_;
            if (_loc6_ == _loc14_) {
                _loc24_ -= _loc16_ + _loc27_ - param3;
            } else {
                _loc24_ -= _loc27_ + _loc11_;
            }
            _loc6_++;
        }
        for each(_loc25_ in this.visibleItemRenderers) {
            this.freeItemRenderer(_loc25_);
            if (_loc25_) {
                _loc25_.discard(true);
            }
        }
        if (_loc20_.length > 0 && _loc17_.length > 0) {
            _loc41_ = _loc20_[_loc20_.length - 1];
            _loc42_ = _loc17_[_loc17_.length - 1];
            _loc43_ = _loc8_.getCellBounds(_loc41_, _loc42_);
            this.visibleItemRenderersBounds.x = _loc15_;
            this.visibleItemRenderersBounds.y = _loc16_;
            this.visibleItemRenderersBounds.width = _loc43_.x + _loc43_.width - _loc15_;
            this.visibleItemRenderersBounds.height = _loc43_.y + _loc43_.height - _loc16_;
        } else {
            this.visibleItemRenderersBounds.setEmpty();
        }
        this.visibleItemRenderers = _loc21_;
        this.visibleRowIndices = _loc20_;
        this.visibleColumnIndices = _loc17_;
    }

    public function invalidateCell(param1: int, param2: int): void {
        var _loc3_: IGridItemRenderer = this.getVisibleItemRenderer(param1, param2);
        if (!_loc3_) {
            return;
        }
        if (this.itemRendererFunctionValueChanged(_loc3_)) {
            _loc3_.grid.invalidateDisplayList();
            return;
        }
        this.initializeItemRenderer(_loc3_, param1, param2);
        var _loc4_: Number = Number(_loc3_.getLayoutBoundsX());
        var _loc5_: Number = Number(_loc3_.getLayoutBoundsY());
        var _loc6_: Number = Number(_loc3_.getLayoutBoundsWidth());
        var _loc7_: Number = Number(_loc3_.getLayoutBoundsHeight());
        this.layoutItemRenderer(_loc3_, _loc4_, _loc5_, _loc6_, _loc7_);
        var _loc8_: Number = Number(_loc3_.getPreferredBoundsHeight());
        if (this.gridDimensions.variableRowHeight && _loc7_ != _loc8_) {
            this.grid.invalidateDisplayList();
        }
    }

    private function itemRendererFunctionValueChanged(param1: IGridItemRenderer): Boolean {
        var _loc2_: GridColumn = param1.column;
        if (!_loc2_ || _loc2_.itemRendererFunction === null) {
            return false;
        }
        var _loc3_: IFactory = this.itemToRenderer(_loc2_, param1.data);
        return _loc3_ !== this.elementToFactoryMap[param1];
    }

    private function getVisibleItemRendererIndex(param1: int, param2: int): int {
        if (this.visibleRowIndices == null || this.visibleColumnIndices == null) {
            return -1;
        }
        var _loc3_: int = this.visibleRowIndices.indexOf(param1);
        var _loc4_: int = this.visibleColumnIndices.indexOf(param2);
        if (_loc3_ == -1 || _loc4_ == -1) {
            return -1;
        }
        return _loc3_ * this.visibleColumnIndices.length + _loc4_;
    }

    public function getVisibleItemRenderer(param1: int, param2: int): IGridItemRenderer {
        var _loc3_: int = this.getVisibleItemRendererIndex(param1, param2);
        if (_loc3_ == -1 || _loc3_ >= this.visibleItemRenderers.length) {
            return null;
        }
        return this.visibleItemRenderers[_loc3_];
    }

    private function takeVisibleItemRenderer(param1: int, param2: int): IGridItemRenderer {
        var _loc3_: int = this.getVisibleItemRendererIndex(param1, param2);
        if (_loc3_ == -1 || _loc3_ >= this.visibleItemRenderers.length) {
            return null;
        }
        var _loc4_: IGridItemRenderer = this.visibleItemRenderers[_loc3_];
        this.visibleItemRenderers[_loc3_] = null;
        if (Boolean(_loc4_) && this.itemRendererFunctionValueChanged(_loc4_)) {
            this.freeItemRenderer(_loc4_);
            return null;
        }
        return _loc4_;
    }

    private function initializeItemRenderer(param1: IGridItemRenderer, param2: int, param3: int, param4: Object = null, param5: Boolean = true): void {
        param1.visible = param5;
        var _loc6_: GridColumn;
        if (_loc6_ = this.getGridColumn(param3)) {
            param1.rowIndex = param2;
            param1.column = _loc6_;
            if (param4 == null) {
                param4 = this.getDataProviderItem(param2);
            }
            param1.label = _loc6_.itemToLabel(param4);
            if (this.isRowSelectionMode()) {
                param1.selected = this.grid.selectionContainsIndex(param2);
                param1.showsCaret = this.grid.caretRowIndex == param2;
                param1.hovered = this.grid.hoverRowIndex == param2;
            } else if (this.isCellSelectionMode()) {
                param1.selected = this.grid.selectionContainsCell(param2, param3);
                param1.showsCaret = this.grid.caretRowIndex == param2 && this.grid.caretColumnIndex == param3;
                param1.hovered = this.grid.hoverRowIndex == param2 && this.grid.hoverColumnIndex == param3;
            }
            param1.data = param4;
            if (this.grid.dataGrid) {
                param1.owner = this.grid.dataGrid;
            }
            param1.prepare(!this.createdGridElement);
        }
    }

    private function freeItemRenderer(param1: IGridItemRenderer): void {
        if (!param1) {
            return;
        }
        this.freeGridElement(param1);
    }

    private function freeItemRenderers(param1: Vector.<IGridItemRenderer>): void {
        var _loc2_: * = null;
        for each(_loc2_ in param1) {
            this.freeItemRenderer(_loc2_);
        }
        param1.length = 0;
    }

    private function layoutLinearElements(param1: IFactory, param2: GridLayer, param3: Vector.<IVisualElement>, param4: Vector.<int>, param5: Vector.<int>, param6: Function, param7: int = -1): Vector.<IVisualElement> {
        var _loc8_: * = 0;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: * = null;
        if (!param2) {
            return new Vector.<IVisualElement>(0);
        }
        this.discardGridElementsIfFactoryChanged(param1, param2, param3);
        if (param1 == null) {
            return new Vector.<IVisualElement>(0);
        }
        this.freeLinearElements(param3, param4, param5, param7);
        _loc8_ = param5.length;
        var _loc9_: Vector.<IVisualElement> = new Vector.<IVisualElement>(_loc8_);
        var _loc10_: int = 0;
        while (_loc10_ < _loc8_) {
            if ((_loc11_ = param5[_loc10_]) == param7) {
                _loc9_.length = _loc10_;
                break;
            }
            if ((_loc13_ = (_loc12_ = param4.indexOf(_loc11_)) != -1 && _loc12_ < param3.length ? param3[_loc12_] : null) == null) {
                _loc13_ = this.allocateGridElement(param1);
            }
            _loc9_[_loc10_] = _loc13_;
            param2.addElement(_loc13_);
            _loc13_.visible = true;
            param6(_loc13_, _loc11_);
            _loc10_++;
        }
        return _loc9_;
    }

    private function layoutCellElements(param1: IFactory, param2: GridLayer, param3: Vector.<IVisualElement>, param4: Vector.<int>, param5: Vector.<int>, param6: Vector.<int>, param7: Vector.<int>, param8: Function): Vector.<IVisualElement> {
        var _loc9_: * = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        if (!param2) {
            return new Vector.<IVisualElement>(0);
        }
        if (this.discardGridElementsIfFactoryChanged(param1, param2, param3)) {
            param4.length = 0;
            param5.length = 0;
        }
        if (param1 == null) {
            return new Vector.<IVisualElement>(0);
        }
        _loc9_ = param6.length;
        var _loc10_: Vector.<IVisualElement> = new Vector.<IVisualElement>(_loc9_);
        this.freeCellElements(param3, _loc10_, param4, param6, param5, param7);
        var _loc11_: int = 0;
        while (_loc11_ < _loc9_) {
            _loc12_ = param6[_loc11_];
            _loc13_ = param7[_loc11_];
            if ((_loc14_ = _loc10_[_loc11_]) === null) {
                _loc14_ = this.allocateGridElement(param1);
                _loc10_[_loc11_] = _loc14_;
            }
            param2.addElement(_loc14_);
            _loc14_.visible = true;
            param8(_loc14_, _loc12_, _loc13_);
            _loc11_++;
        }
        return _loc10_;
    }

    private function discardGridElementsIfFactoryChanged(param1: IFactory, param2: GridLayer, param3: Vector.<IVisualElement>): Boolean {
        var _loc4_: * = null;
        if (param3.length > 0 && param1 != this.elementToFactoryMap[param3[0]]) {
            for each(_loc4_ in param3) {
                param2.removeElement(_loc4_);
                this.freeGridElement(_loc4_);
            }
            param3.length = 0;
            return true;
        }
        return false;
    }

    private function freeLinearElements(param1: Vector.<IVisualElement>, param2: Vector.<int>, param3: Vector.<int>, param4: int): void {
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc5_: int = 0;
        while (_loc5_ < param1.length) {
            _loc6_ = param3.indexOf(param2[_loc5_]);
            if (param2[_loc5_] == param4 || _loc6_ == -1) {
                if (_loc7_ = param1[_loc5_]) {
                    this.freeGridElement(_loc7_);
                    param1[_loc5_] = null;
                }
            }
            _loc5_++;
        }
    }

    private function freeCellElements(param1: Vector.<IVisualElement>, param2: Vector.<IVisualElement>, param3: Vector.<int>, param4: Vector.<int>, param5: Vector.<int>, param6: Vector.<int>): void {
        var _loc11_: * = null;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc7_: Boolean = true;
        var _loc8_: int = param4.length;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        while (_loc10_ < param1.length) {
            if ((_loc11_ = param1[_loc10_]) != null) {
                _loc12_ = param3[_loc10_];
                _loc13_ = param5[_loc10_];
                while (_loc9_ < _loc8_) {
                    _loc14_ = param4[_loc9_];
                    _loc15_ = param6[_loc9_];
                    if (_loc14_ == _loc12_) {
                        if (_loc15_ == _loc13_) {
                            param2[_loc9_] = _loc11_;
                            _loc7_ = false;
                            break;
                        }
                        if (_loc15_ > _loc13_) {
                            break;
                        }
                    } else if (_loc14_ > _loc12_) {
                        break;
                    }
                    _loc9_++;
                }
                if (_loc7_) {
                    this.freeGridElement(_loc11_);
                }
                _loc7_ = true;
            }
            _loc10_++;
        }
        param1.length = 0;
    }

    private function layoutRowBackground(param1: IVisualElement, param2: int): void {
        var _loc3_: int = 0;
        _loc3_ = this.gridDimensions.rowCount;
        var _loc4_: Rectangle;
        if (!(_loc4_ = param2 < _loc3_ ? this.gridDimensions.getRowBounds(param2) : this.gridDimensions.getPadRowBounds(param2))) {
            return;
        }
        if (param2 < _loc3_ && _loc4_.width == 0) {
            _loc4_.width = this.visibleGridBounds.width;
        }
        this.intializeGridVisualElement(param1, param2);
        this.layoutGridElementR(param1, _loc4_);
    }

    private function layoutRowSeparator(param1: IVisualElement, param2: int): void {
        var _loc4_: int = 0;
        this.intializeGridVisualElement(param1, param2);
        var _loc3_: Number = Number(param1.getPreferredBoundsHeight());
        _loc4_ = this.gridDimensions.rowCount;
        var _loc5_: Rectangle;
        if (!(_loc5_ = param2 < _loc4_ ? this.gridDimensions.getRowBounds(param2) : this.gridDimensions.getPadRowBounds(param2))) {
            return;
        }
        var _loc6_: Number = _loc5_.x;
        var _loc7_: Number = Math.max(_loc5_.width, this.visibleGridBounds.right);
        var _loc8_: Number = _loc5_.bottom;
        this.layoutGridElement(param1, _loc6_, _loc8_, _loc7_, _loc3_);
    }

    private function layoutColumnSeparator(param1: IVisualElement, param2: int): void {
        var _loc3_: * = null;
        this.intializeGridVisualElement(param1, -1, param2);
        _loc3_ = this.visibleItemRenderersBounds;
        var _loc4_: Number = Number(param1.getPreferredBoundsWidth());
        var _loc5_: Number = Math.max(_loc3_.height, this.visibleGridBounds.height);
        var _loc6_: Number = this.gridDimensions.getCellX(0, param2) + this.gridDimensions.getColumnWidth(param2);
        var _loc7_: Number = _loc3_.y;
        this.layoutGridElement(param1, _loc6_, _loc7_, _loc4_, _loc5_);
    }

    private function isRowSelectionMode(): Boolean {
        var _loc1_: String = this.grid.selectionMode;
        return _loc1_ == GridSelectionMode.SINGLE_ROW || _loc1_ == GridSelectionMode.MULTIPLE_ROWS;
    }

    private function isCellSelectionMode(): Boolean {
        var _loc1_: String = this.grid.selectionMode;
        return _loc1_ == GridSelectionMode.SINGLE_CELL || _loc1_ == GridSelectionMode.MULTIPLE_CELLS;
    }

    private function layoutSelectionIndicators(param1: GridLayer): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc2_: IFactory = this.grid.selectionIndicator;
        if (this.isRowSelectionMode()) {
            if (this.visibleColumnSelectionIndices.length > 0) {
                this.clearSelectionIndicators();
            }
            _loc3_ = this.visibleRowSelectionIndices;
            this.visibleRowSelectionIndices = new Vector.<int>();
            for each(_loc4_ in this.visibleRowIndices) {
                if (this.grid.selectionContainsIndex(_loc4_)) {
                    this.visibleRowSelectionIndices.push(_loc4_);
                }
            }
            this.visibleSelectionIndicators = this.layoutLinearElements(_loc2_, param1, this.visibleSelectionIndicators, _loc3_, this.visibleRowSelectionIndices, this.layoutRowSelectionIndicator);
            return;
        }
        if (this.visibleRowSelectionIndices.length > 0 && this.visibleColumnSelectionIndices.length == 0) {
            this.clearSelectionIndicators();
        }
        if (this.isCellSelectionMode()) {
            _loc3_ = this.visibleRowSelectionIndices;
            _loc5_ = this.visibleColumnSelectionIndices;
            this.visibleRowSelectionIndices = new Vector.<int>();
            this.visibleColumnSelectionIndices = new Vector.<int>();
            for each(_loc4_ in this.visibleRowIndices) {
                for each(_loc6_ in this.visibleColumnIndices) {
                    if (this.grid.selectionContainsCell(_loc4_, _loc6_)) {
                        this.visibleRowSelectionIndices.push(_loc4_);
                        this.visibleColumnSelectionIndices.push(_loc6_);
                    }
                }
            }
            this.visibleSelectionIndicators = this.layoutCellElements(_loc2_, param1, this.visibleSelectionIndicators, _loc3_, _loc5_, this.visibleRowSelectionIndices, this.visibleColumnSelectionIndices, this.layoutCellSelectionIndicator);
            return;
        }
        if (this.visibleColumnSelectionIndices.length > 0) {
            this.clearSelectionIndicators();
        }
    }

    private function layoutRowSelectionIndicator(param1: IVisualElement, param2: int): void {
        this.intializeGridVisualElement(param1, param2);
        this.layoutGridElementR(param1, this.gridDimensions.getRowBounds(param2));
    }

    private function layoutCellSelectionIndicator(param1: IVisualElement, param2: int, param3: int): void {
        this.intializeGridVisualElement(param1, param2, param3);
        this.layoutGridElementR(param1, this.gridDimensions.getCellBounds(param2, param3));
    }

    private function clearSelectionIndicators(): void {
        this.freeGridElements(this.visibleSelectionIndicators);
        this.visibleRowSelectionIndices.length = 0;
        this.visibleColumnSelectionIndices.length = 0;
    }

    private function layoutIndicator(param1: GridLayer, param2: IFactory, param3: IVisualElement, param4: int, param5: int): IVisualElement {
        var _loc6_: * = null;
        if (!param1) {
            return null;
        }
        if (Boolean(param3) && param2 != this.elementToFactoryMap[param3]) {
            this.removeGridElement(param3);
            param3 = null;
            if (param2 == null) {
                return null;
            }
        }
        if (param4 == -1 || this.grid.selectionMode == GridSelectionMode.NONE || this.isCellSelectionMode() && this.grid.mx_internal::getNextVisibleColumnIndex(param5 - 1) != param5) {
            if (param3) {
                param3.visible = false;
            }
            return param3;
        }
        if (!param3 && Boolean(param2)) {
            param3 = this.createGridElement(param2);
        }
        if (param3) {
            _loc6_ = this.isRowSelectionMode() ? this.gridDimensions.getRowBounds(param4) : this.gridDimensions.getCellBounds(param4, param5);
            this.intializeGridVisualElement(param3, param4, param5);
            if (param2 == this.grid.caretIndicator && Boolean(_loc6_)) {
                if (this.isCellSelectionMode() && param5 < this.grid.columns.length - 1) {
                    _loc6_.width += 1;
                }
                if (param4 < this.grid.dataProvider.length - 1 || this.visibleRowIndices.length > this.grid.dataProvider.length) {
                    _loc6_.height += 1;
                }
            }
            this.layoutGridElementR(param3, _loc6_);
            param1.addElement(param3);
            param3.visible = true;
        }
        return param3;
    }

    private function layoutHoverIndicator(param1: GridLayer): void {
        var _loc2_: int = this.grid.hoverRowIndex;
        var _loc3_: int = this.grid.hoverColumnIndex;
        var _loc4_: IFactory = this.grid.hoverIndicator;
        this.hoverIndicator = this.layoutIndicator(param1, _loc4_, this.hoverIndicator, _loc2_, _loc3_);
    }

    private function layoutCaretIndicator(param1: GridLayer): void {
        var _loc2_: int = this.grid.caretRowIndex;
        var _loc3_: int = this.grid.caretColumnIndex;
        var _loc4_: IFactory = this.grid.caretIndicator;
        this.caretIndicator = this.layoutIndicator(param1, _loc4_, this.caretIndicator, _loc2_, _loc3_);
        if (Boolean(this.caretIndicator) && !this._showCaret) {
            this.caretIndicator.visible = this._showCaret;
        }
    }

    private function layoutEditorIndicator(param1: GridLayer): void {
        var _loc6_: * = null;
        var _loc2_: DataGrid = this.grid.dataGrid;
        if (!_loc2_) {
            return;
        }
        var _loc3_: int = _loc2_.editorRowIndex;
        var _loc4_: int = _loc2_.editorColumnIndex;
        var _loc5_: IFactory = _loc2_.editorIndicator;
        if (Boolean(this.editorIndicator) && _loc5_ != this.elementToFactoryMap[this.editorIndicator]) {
            this.removeGridElement(this.editorIndicator);
            this.editorIndicator = null;
            if (_loc5_ == null) {
                return;
            }
        }
        if (_loc3_ == -1 || _loc4_ == -1) {
            if (this.editorIndicator) {
                this.editorIndicator.visible = false;
            }
            return;
        }
        if (!this.editorIndicator && Boolean(_loc5_)) {
            this.editorIndicator = this.createGridElement(_loc5_);
        }
        if (this.editorIndicator) {
            _loc6_ = this.gridDimensions.getCellBounds(_loc3_, _loc4_);
            this.intializeGridVisualElement(this.editorIndicator, _loc3_, _loc4_);
            this.layoutGridElementR(this.editorIndicator, _loc6_);
            param1.addElement(this.editorIndicator);
            this.editorIndicator.visible = true;
        }
    }

    public function dataProviderCollectionChanged(param1: CollectionEvent): void {
        switch (param1.kind) {
            case CollectionEventKind.ADD:
                this.dataProviderCollectionAdd(param1);
                break;
            case CollectionEventKind.REMOVE:
                this.dataProviderCollectionRemove(param1);
                break;
            case CollectionEventKind.MOVE:
                break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
                this.dataProviderCollectionReset(param1);
                break;
            case CollectionEventKind.UPDATE:
                this.dataProviderCollectionUpdate(param1);
                break;
            case CollectionEventKind.REPLACE:
        }
    }

    private function dataProviderCollectionAdd(param1: CollectionEvent): void {
        var _loc2_: int = param1.location;
        var _loc3_: int = param1.items.length;
        this.incrementIndicesGTE(this.visibleRowIndices, _loc2_, _loc3_);
        this.incrementIndicesGTE(this.visibleRowSelectionIndices, _loc2_, _loc3_);
    }

    private function dataProviderCollectionRemove(param1: CollectionEvent): void {
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc2_: uint = param1.items.length;
        var _loc3_: int = param1.location;
        var _loc4_: int = param1.location + param1.items.length - 1;
        var _loc5_: int = -1;
        var _loc6_: int = -1;
        var _loc7_: int = 0;
        while (_loc7_ < this.visibleRowIndices.length) {
            if ((_loc8_ = this.visibleRowIndices[_loc7_]) >= _loc3_ && _loc8_ <= _loc4_) {
                if (_loc5_ == -1) {
                    _loc5_ = _loc6_ = _loc7_;
                } else {
                    _loc6_ = _loc7_;
                }
            } else if (_loc8_ > _loc4_) {
                this.visibleRowIndices[_loc7_] = _loc8_ - _loc2_;
            }
            _loc7_++;
        }
        if (_loc5_ != -1 && _loc6_ != -1) {
            _loc9_ = _loc6_ - _loc5_ + 1;
            this.visibleRowIndices.splice(_loc5_, _loc9_);
            if (_loc6_ < this.visibleRowBackgrounds.length) {
                this.freeGridElements(this.visibleRowBackgrounds.splice(_loc5_, _loc9_));
            }
            if (_loc6_ < this.visibleRowSeparators.length) {
                this.freeGridElements(this.visibleRowSeparators.splice(_loc5_, _loc9_));
            }
            _loc10_ = this.visibleColumnIndices.length;
            _loc11_ = _loc5_ * _loc10_;
            this.freeItemRenderers(this.visibleItemRenderers.splice(_loc11_, _loc9_ * _loc10_));
        }
    }

    private function incrementIndicesGTE(param1: Vector.<int>, param2: int, param3: int): void {
        var _loc6_: int = 0;
        var _loc4_: int = param1.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if ((_loc6_ = param1[_loc5_]) >= param2) {
                param1[_loc5_] = _loc6_ + param3;
            }
            _loc5_++;
        }
    }

    private function dataProviderCollectionReset(param1: CollectionEvent): void {
        this.clearVirtualLayoutCache();
    }

    private function dataProviderCollectionUpdate(param1: CollectionEvent): void {
        var _loc2_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc3_: int = param1.items.length;
        var _loc4_: int = this.visibleItemRenderers.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_) {
            _loc2_ = PropertyChangeEvent(param1.items[_loc5_]).source;
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                if ((Boolean(_loc7_ = this.visibleItemRenderers[_loc6_] as IGridItemRenderer)) && _loc7_.data == _loc2_) {
                    this.freeItemRenderer(_loc7_);
                    this.visibleItemRenderers[_loc6_] = null;
                }
                _loc6_++;
            }
            _loc5_++;
        }
    }

    public function columnsCollectionChanged(param1: CollectionEvent): void {
        switch (param1.kind) {
            case CollectionEventKind.UPDATE:
                this.clearVirtualLayoutCache();
                break;
            default:
                this.clearVirtualLayoutCache();
                if (this.grid) {
                    this.grid.setContentSize(0, 0);
                    break;
                }
        }
    }

    private function createGridElement(param1: IFactory): IVisualElement {
        this.createdGridElement = true;
        var _loc2_: IVisualElement = param1.newInstance() as IVisualElement;
        this.elementToFactoryMap[_loc2_] = param1;
        return _loc2_;
    }

    private function allocateGridElement(param1: IFactory): IVisualElement {
        var _loc3_: * = null;
        this.createdGridElement = false;
        var _loc2_: Vector.<IVisualElement> = this.freeElementMap[param1] as Vector.<IVisualElement>;
        if (_loc2_) {
            _loc3_ = _loc2_.pop();
            if (_loc2_.length == 0) {
                delete this.freeElementMap[param1];
            }
            if (_loc3_) {
                return _loc3_;
            }
        }
        return this.createGridElement(param1);
    }

    private function freeGridElement(param1: IVisualElement): Boolean {
        if (!param1) {
            return false;
        }
        param1.visible = false;
        var _loc2_: IFactory = this.elementToFactoryMap[param1];
        if (!_loc2_) {
            return false;
        }
        var _loc3_: Vector.<IVisualElement> = this.freeElementMap[_loc2_];
        if (!_loc3_) {
            _loc3_ = new Vector.<IVisualElement>();
            this.freeElementMap[_loc2_] = _loc3_;
        }
        _loc3_.push(param1);
        return true;
    }

    private function freeGridElements(param1: Vector.<IVisualElement>): void {
        var _loc2_: * = null;
        for each(_loc2_ in param1) {
            this.freeGridElement(_loc2_);
        }
        param1.length = 0;
    }

    private function removeGridElement(param1: IVisualElement): void {
        var _loc2_: * = null;
        var _loc5_: int = 0;
        _loc2_ = this.elementToFactoryMap[param1];
        var _loc3_: Vector.<IVisualElement> = !!_loc2_ ? this.freeElementMap[_loc2_] : null;
        if (_loc3_) {
            if ((_loc5_ = _loc3_.indexOf(param1)) != -1) {
                _loc3_.splice(_loc5_, 1);
            }
            if (_loc3_.length == 0) {
                delete this.freeElementMap[_loc2_];
            }
        }
        delete this.elementToFactoryMap[param1];
        param1.visible = false;
        var _loc4_: IVisualElementContainer;
        if (_loc4_ = param1.parent as IVisualElementContainer) {
            _loc4_.removeElement(param1);
        }
    }

    private function layoutItemRenderer(param1: IGridItemRenderer, param2: Number, param3: Number, param4: Number, param5: Number): void {
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        if (this.enablePerformanceStatistics) {
            _loc6_ = getTimer();
        }
        if (!isNaN(param4) || !isNaN(param5)) {
            if (param1 is ILayoutManagerClient) {
                _loc7_ = param1 as ILayoutManagerClient;
                LayoutManager.getInstance().validateClient(_loc7_, true);
            } else if (param1 is IGraphicElement) {
                (_loc8_ = param1 as IGraphicElement).validateProperties();
                _loc8_.validateSize();
            }
            param1.setLayoutBoundsSize(param4, param5);
        }
        if (param1 is IInvalidating && !(param1 is IGraphicElement)) {
            (_loc9_ = param1 as IInvalidating).validateNow();
        }
        param1.setLayoutBoundsPosition(param2, param3);
        if (this.enablePerformanceStatistics) {
            _loc10_ = getTimer() - _loc6_;
            this.performanceStatistics.layoutGridElementTimes.push(_loc10_);
        }
    }

    private function layoutGridElementR(param1: IVisualElement, param2: Rectangle): void {
        if (param2) {
            this.layoutGridElement(param1, param2.x, param2.y, param2.width, param2.height);
        }
    }

    private function layoutGridElement(param1: IVisualElement, param2: Number, param3: Number, param4: Number, param5: Number): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        if (param4 > MAX_ELEMENT_SIZE) {
            _loc6_ = Math.max(0, horizontalScrollPosition);
            _loc7_ = this.grid.getLayoutBoundsWidth();
            _loc8_ = Math.max(param2, _loc6_ - ELEMENT_EDGE_PAD);
            _loc9_ = Math.min(param2 + param4, _loc6_ + _loc7_ + ELEMENT_EDGE_PAD);
            param2 = _loc8_;
            param4 = _loc9_ - _loc8_;
        }
        if (param5 > MAX_ELEMENT_SIZE) {
            _loc10_ = Math.max(0, verticalScrollPosition);
            _loc11_ = this.grid.getLayoutBoundsHeight();
            _loc12_ = Math.max(param3, _loc10_ - ELEMENT_EDGE_PAD);
            _loc13_ = Math.min(param3 + param5, _loc10_ + _loc11_ + ELEMENT_EDGE_PAD);
            param3 = _loc12_;
            param5 = _loc13_ - _loc12_;
        }
        param1.setLayoutBoundsSize(param4, param5);
        param1.setLayoutBoundsPosition(param2, param3);
    }

    private function intializeGridVisualElement(param1: IVisualElement, param2: int = -1, param3: int = -1): void {
        var _loc4_: IGridVisualElement;
        if (_loc4_ = param1 as IGridVisualElement) {
            _loc4_.prepareGridVisualElement(this.grid, param2, param3);
        }
    }

    public function getVisibleRowIndices(): Vector.<int> {
        return this.visibleRowIndices.concat();
    }

    public function getVisibleColumnIndices(): Vector.<int> {
        return this.visibleColumnIndices.concat();
    }

    public function getCellBounds(param1: int, param2: int): Rectangle {
        return this.gridDimensions.getCellBounds(param1, param2);
    }

    public function getRowBounds(param1: int): Rectangle {
        return this.gridDimensions.getRowBounds(param1);
    }

    public function getColumnBounds(param1: int): Rectangle {
        return this.gridDimensions.getColumnBounds(param1);
    }

    public function getRowIndexAt(param1: Number, param2: Number): int {
        return this.gridDimensions.getRowIndexAt(param1, param2);
    }

    public function getColumnIndexAt(param1: Number, param2: Number): int {
        return this.gridDimensions.getColumnIndexAt(param1, param2);
    }

    public function getCellAt(param1: Number, param2: Number): CellPosition {
        var _loc3_: int = this.gridDimensions.getRowIndexAt(param1, param2);
        var _loc4_: int = this.gridDimensions.getColumnIndexAt(param1, param2);
        if (_loc3_ == -1 || _loc4_ == -1) {
            return null;
        }
        return new CellPosition(_loc3_, _loc4_);
    }

    public function getCellsAt(param1: Number, param2: Number, param3: Number, param4: Number): Vector.<CellPosition> {
        var _loc9_: int = 0;
        var _loc5_: Vector.<CellPosition> = new Vector.<CellPosition>();
        if (param3 <= 0 || param4 <= 0) {
            return _loc5_;
        }
        var _loc6_: CellPosition = this.getCellAt(param1, param2);
        var _loc7_: CellPosition = this.getCellAt(param1 + param3, param2 + param4);
        if (!_loc6_ || !_loc7_) {
            return _loc5_;
        }
        var _loc8_: int = _loc6_.rowIndex;
        while (_loc8_ <= _loc7_.rowIndex) {
            _loc9_ = _loc6_.columnIndex;
            while (_loc9_ <= _loc7_.columnIndex) {
                _loc5_.push(new CellPosition(_loc8_, _loc9_));
                _loc9_++;
            }
            _loc8_++;
        }
        return _loc5_;
    }

    public function getItemRendererAt(param1: int, param2: int): IGridItemRenderer {
        var _loc7_: * = null;
        var _loc3_: IGridItemRenderer = this.getVisibleItemRenderer(param1, param2);
        if (_loc3_) {
            return _loc3_;
        }
        var _loc4_: GridLayer;
        if (!(_loc4_ = this.getLayer("rendererLayer"))) {
            return null;
        }
        var _loc5_: Object = this.getDataProviderItem(param1);
        var _loc6_: GridColumn = this.getGridColumn(param2);
        if (_loc5_ == null || _loc6_ == null) {
            return null;
        }
        if (!_loc6_.visible) {
            return null;
        }
        var _loc8_: IGridItemRenderer = (_loc7_ = this.itemToRenderer(_loc6_, _loc5_)).newInstance() as IGridItemRenderer;
        this.createdGridElement = true;
        _loc4_.addElement(_loc8_);
        this.initializeItemRenderer(_loc8_, param1, param2, _loc5_, false);
        var _loc9_: Rectangle;
        if ((_loc9_ = this.gridDimensions.getCellBounds(param1, param2)) == null) {
            return null;
        }
        this.layoutItemRenderer(_loc8_, _loc9_.x, _loc9_.y, _loc9_.width, _loc9_.height);
        _loc4_.removeElement(_loc8_);
        _loc8_.visible = false;
        return _loc8_;
    }

    public function isCellVisible(param1: int, param2: int): Boolean {
        if (param1 == -1 && param2 == -1) {
            return false;
        }
        return (param1 == -1 || this.visibleRowIndices.indexOf(param1) != -1) && (param2 == -1 || this.visibleColumnIndices.indexOf(param2) != -1);
    }

    public function get performanceStatistics(): Object {
        return this._performanceStatistics;
    }

    public function get enablePerformanceStatistics(): Boolean {
        return this._enablePerformanceStatistics;
    }

    public function set enablePerformanceStatistics(param1: Boolean): void {
        if (param1 == this._enablePerformanceStatistics) {
            return;
        }
        if (param1) {
            this._performanceStatistics = {
                "updateDisplayListTimes": new Vector.<Number>(),
                "updateDisplayListRectangles": new Vector.<Rectangle>(),
                "updateDisplayListCellCounts": new Vector.<int>(),
                "measureTimes": new Vector.<Number>(),
                "layoutGridElementTimes": new Vector.<Number>()
            };
        }
        this._enablePerformanceStatistics = param1;
    }
}
}

import flash.utils.getQualifiedClassName;

import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;

import spark.components.Grid;

class GridItemRendererClassFactory extends ClassFactory {


    public var grid: Grid;

    public var factory: ClassFactory;

    function GridItemRendererClassFactory(param1: Grid, param2: ClassFactory) {
        super(param2.generator);
        this.grid = param1;
        this.factory = param2;
    }

    override public function newInstance(): * {
        var _loc2_: * = null;
        var _loc5_: * = null;
        var _loc1_: Class = this.factory.generator;
        _loc2_ = this.grid.moduleFactory;
        var _loc3_: Object = !!_loc2_ ? _loc2_.create(getQualifiedClassName(_loc1_)) : new _loc1_();
        var _loc4_: Object;
        if (_loc4_ = this.factory.properties) {
            for (_loc5_ in _loc4_) {
                _loc3_[_loc5_] = _loc4_[_loc5_];
            }
        }
        return _loc3_;
    }
}
