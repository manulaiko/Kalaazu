package spark.components
{
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   import mx.collections.ArrayList;
   import mx.collections.IList;
   import mx.core.IFactory;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.ObjectUtil;
   import spark.components.gridClasses.CellPosition;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridDimensions;
   import spark.components.gridClasses.GridLayout;
   import spark.components.gridClasses.GridSelection;
   import spark.components.gridClasses.GridSelectionMode;
   import spark.components.gridClasses.IDataGridElement;
   import spark.components.gridClasses.IGridItemRenderer;
   import spark.events.GridCaretEvent;
   import spark.events.GridEvent;
   import spark.utils.MouseEventUtil;
   
   public class Grid extends Group implements IDataGridElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const invalidateDisplayListReasonBits:Object = {
         "verticalScrollPosition":uint(1),
         "horizontalScrollPosition":uint(2),
         "bothScrollPositions":uint(1) | uint(2),
         "hoverIndicator":uint(4),
         "caretIndicator":uint(8),
         "selectionIndicator":uint(16),
         "editorIndicator":uint(32),
         "none":uint(-1)
      };
       
      
      private const deferredOperations:Vector.<Function> = new Vector.<Function>();
      
      private var caretSelectedItem:Object = null;
      
      mx_internal var inUpdateDisplayList:Boolean = false;
      
      private var dragInProgress:Boolean = false;
      
      private var generatedColumns:Boolean = false;
      
      private var _anchorColumnIndex:int = 0;
      
      private var anchorChanged:Boolean = false;
      
      private var _anchorRowIndex:int = 0;
      
      private var _caretIndicator:IFactory = null;
      
      private var _caretColumnIndex:int = -1;
      
      private var _oldCaretColumnIndex:int = -1;
      
      private var caretChanged:Boolean = false;
      
      private var _caretRowIndex:int = -1;
      
      private var _oldCaretRowIndex:int = -1;
      
      private var _hoverIndicator:IFactory = null;
      
      private var _hoverColumnIndex:int = -1;
      
      private var _hoverRowIndex:int = -1;
      
      private var _columns:IList = null;
      
      private var columnsChanged:Boolean = false;
      
      private var _dataProvider:IList = null;
      
      private var dataProviderChanged:Boolean;
      
      private var _dataTipField:String = null;
      
      private var _dataTipFunction:Function = null;
      
      private var _itemRenderer:IFactory = null;
      
      private var itemRendererChanged:Boolean = false;
      
      private var _columnSeparator:IFactory = null;
      
      private var _gridSelection:GridSelection;
      
      private var _dataGrid:DataGrid = null;
      
      private var _requestedMaxRowCount:int = 10;
      
      private var _requestedMinRowCount:int = -1;
      
      private var _requestedRowCount:int = -1;
      
      private var _requestedMinColumnCount:int = -1;
      
      private var _requestedColumnCount:int = -1;
      
      private var _resizableColumns:Boolean = true;
      
      private var _rowBackground:IFactory = null;
      
      private var _rowHeight:Number = NaN;
      
      private var rowHeightChanged:Boolean;
      
      private var _rowSeparator:IFactory = null;
      
      private var _selectionIndicator:IFactory = null;
      
      private var _showDataTips:Boolean = false;
      
      private var _typicalItem:Object = null;
      
      private var typicalItemChanged:Boolean = false;
      
      private var _variableRowHeight:Boolean = false;
      
      private var variableRowHeightChanged:Boolean = false;
      
      private var invalidateDisplayListReasonsMask:uint = 0;
      
      private var rollRowIndex:int = -1;
      
      private var rollColumnIndex:int = -1;
      
      private var mouseDownRowIndex:int = -1;
      
      private var mouseDownColumnIndex:int = -1;
      
      private var lastClickTime:Number;
      
      mx_internal var DOUBLE_CLICK_TIME:Number = 480;
      
      public function Grid()
      {
         super();
         layout = new GridLayout();
         MouseEventUtil.addDownDragUpListeners(this,this.grid_mouseDownDragUpHandler,this.grid_mouseDownDragUpHandler,this.grid_mouseDownDragUpHandler);
         addEventListener(MouseEvent.MOUSE_UP,this.grid_mouseUpHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,this.grid_mouseMoveHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.grid_mouseRollOutHandler);
      }
      
      private function get gridLayout() : GridLayout
      {
         return layout as GridLayout;
      }
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      private function dispatchFlexEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new FlexEvent(param1));
         }
      }
      
      [Bindable("anchorColumnIndexChanged")]
      public function get anchorColumnIndex() : int
      {
         return this._anchorColumnIndex;
      }
      
      public function set anchorColumnIndex(param1:int) : void
      {
         if(this._anchorColumnIndex == param1 || this.selectionMode == GridSelectionMode.SINGLE_ROW || this.selectionMode == GridSelectionMode.MULTIPLE_ROWS)
         {
            return;
         }
         this._anchorColumnIndex = param1;
         this.anchorChanged = true;
         invalidateProperties();
         this.dispatchChangeEvent("anchorColumnIndexChanged");
      }
      
      [Bindable("anchorRowIndexChanged")]
      public function get anchorRowIndex() : int
      {
         return this._anchorRowIndex;
      }
      
      public function set anchorRowIndex(param1:int) : void
      {
         if(this._anchorRowIndex == param1)
         {
            return;
         }
         this._anchorRowIndex = param1;
         this.anchorChanged = true;
         invalidateProperties();
         this.dispatchChangeEvent("anchorRowIndexChanged");
      }
      
      [Bindable("caretIndicatorChanged")]
      public function get caretIndicator() : IFactory
      {
         return this._caretIndicator;
      }
      
      public function set caretIndicator(param1:IFactory) : void
      {
         if(this._caretIndicator == param1)
         {
            return;
         }
         this._caretIndicator = param1;
         this.mx_internal::invalidateDisplayListFor("caretIndicator");
         this.dispatchChangeEvent("caretIndicatorChanged");
      }
      
      [Bindable("caretColumnIndexChanged")]
      public function get caretColumnIndex() : int
      {
         return this._caretColumnIndex;
      }
      
      public function set caretColumnIndex(param1:int) : void
      {
         if(this._caretColumnIndex == param1 || param1 < -1)
         {
            return;
         }
         this._caretColumnIndex = param1;
         this.caretChanged = true;
         invalidateProperties();
         this.mx_internal::invalidateDisplayListFor("caretIndicator");
         this.dispatchChangeEvent("caretColumnIndexChanged");
      }
      
      [Bindable("caretRowIndexChanged")]
      public function get caretRowIndex() : int
      {
         return this._caretRowIndex;
      }
      
      public function set caretRowIndex(param1:int) : void
      {
         if(this._caretRowIndex == param1 || param1 < -1)
         {
            return;
         }
         this._caretRowIndex = param1;
         this.caretChanged = true;
         invalidateProperties();
         this.mx_internal::invalidateDisplayListFor("caretIndicator");
         this.dispatchChangeEvent("caretRowIndexChanged");
      }
      
      [Bindable("hoverIndicatorChanged")]
      public function get hoverIndicator() : IFactory
      {
         return this._hoverIndicator;
      }
      
      public function set hoverIndicator(param1:IFactory) : void
      {
         if(this._hoverIndicator == param1)
         {
            return;
         }
         this._hoverIndicator = param1;
         this.mx_internal::invalidateDisplayListFor("hoverIndicator");
         this.dispatchChangeEvent("hoverIndicatorChanged");
      }
      
      [Bindable("hoverColumnIndexChanged")]
      public function get hoverColumnIndex() : int
      {
         return this._hoverColumnIndex;
      }
      
      public function set hoverColumnIndex(param1:int) : void
      {
         if(this._hoverColumnIndex == param1)
         {
            return;
         }
         this._hoverColumnIndex = param1;
         this.mx_internal::invalidateDisplayListFor("hoverIndicator");
         this.dispatchChangeEvent("hoverColumnIndexChanged");
      }
      
      [Bindable("hoverRowIndexChanged")]
      public function get hoverRowIndex() : int
      {
         return this._hoverRowIndex;
      }
      
      public function set hoverRowIndex(param1:int) : void
      {
         if(this._hoverRowIndex == param1)
         {
            return;
         }
         this._hoverRowIndex = param1;
         this.mx_internal::invalidateDisplayListFor("hoverIndicator");
         this.dispatchChangeEvent("hoverRowIndexChanged");
      }
      
      [Bindable("columnsChanged")]
      public function get columns() : IList
      {
         return this._columns;
      }
      
      public function set columns(param1:IList) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this._columns == param1)
         {
            return;
         }
         var _loc2_:IList = this._columns;
         if(_loc2_)
         {
            _loc2_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.columns_collectionChangeHandler);
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               (_loc5_ = GridColumn(_loc2_.getItemAt(_loc4_))).mx_internal::setGrid(null);
               _loc5_.mx_internal::setColumnIndex(-1);
               _loc4_++;
            }
         }
         this._columns = param1;
         var _loc3_:IList = this._columns;
         if(_loc3_)
         {
            _loc3_.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.columns_collectionChangeHandler,false,0,true);
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               (_loc6_ = GridColumn(_loc3_.getItemAt(_loc4_))).mx_internal::setGrid(this);
               _loc6_.mx_internal::setColumnIndex(_loc4_);
               _loc4_++;
            }
         }
         this.columnsChanged = true;
         this.generatedColumns = false;
         invalidateProperties();
         this.invalidateSize();
         this.invalidateDisplayList();
         this.dispatchChangeEvent("columnsChanged");
      }
      
      private function getColumnsLength() : uint
      {
         var _loc1_:IList = this.columns;
         return !!_loc1_ ? _loc1_.length : 0;
      }
      
      private function generateColumns() : IList
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Object = this.typicalItem;
         if(!_loc1_ && this.dataProvider && this.dataProvider.length > 0)
         {
            _loc1_ = this.dataProvider.getItemAt(0);
         }
         var _loc2_:* = null;
         if(_loc1_)
         {
            _loc2_ = new ArrayList();
            _loc3_ = ObjectUtil.getClassInfo(_loc1_,["uid","mx_internal_uid"]);
            if(_loc3_)
            {
               for each(_loc4_ in _loc3_.properties)
               {
                  (_loc5_ = new GridColumn()).dataField = _loc4_.localName;
                  _loc2_.addItem(_loc5_);
               }
            }
         }
         return _loc2_;
      }
      
      [Bindable("dataProviderChanged")]
      public function get dataProvider() : IList
      {
         return this._dataProvider;
      }
      
      public function set dataProvider(param1:IList) : void
      {
         if(this._dataProvider == param1)
         {
            return;
         }
         var _loc2_:IList = this.dataProvider;
         if(_loc2_)
         {
            _loc2_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.dataProvider_collectionChangeHandler);
         }
         this._dataProvider = param1;
         var _loc3_:IList = this.dataProvider;
         if(_loc3_)
         {
            _loc3_.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.dataProvider_collectionChangeHandler,false,0,true);
         }
         this.dataProviderChanged = true;
         invalidateProperties();
         this.invalidateSize();
         this.invalidateDisplayList();
         this.dispatchChangeEvent("dataProviderChanged");
      }
      
      [Bindable("dataTipFieldChanged")]
      public function get dataTipField() : String
      {
         return this._dataTipField;
      }
      
      public function set dataTipField(param1:String) : void
      {
         if(this._dataTipField == param1)
         {
            return;
         }
         this._dataTipField = param1;
         this.invalidateDisplayList();
         this.dispatchChangeEvent("dataTipFieldChanged");
      }
      
      [Bindable("dataTipFunctionChanged")]
      public function get dataTipFunction() : Function
      {
         return this._dataTipFunction;
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         if(this._dataTipFunction == param1)
         {
            return;
         }
         this._dataTipFunction = param1;
         this.invalidateDisplayList();
         this.dispatchChangeEvent("dataTipFunctionChanged");
      }
      
      [Bindable("itemRendererChanged")]
      public function get itemRenderer() : IFactory
      {
         return this._itemRenderer;
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         if(this._itemRenderer == param1)
         {
            return;
         }
         this._itemRenderer = param1;
         this.itemRendererChanged = true;
         invalidateProperties();
         this.invalidateSize();
         this.invalidateDisplayList();
         this.dispatchChangeEvent("itemRendererChanged");
      }
      
      [Bindable("columnSeparatorChanged")]
      public function get columnSeparator() : IFactory
      {
         return this._columnSeparator;
      }
      
      public function set columnSeparator(param1:IFactory) : void
      {
         if(this._columnSeparator == param1)
         {
            return;
         }
         this._columnSeparator = param1;
         this.invalidateDisplayList();
         this.dispatchChangeEvent("columnSeparatorChanged");
      }
      
      mx_internal function get gridSelection() : GridSelection
      {
         if(!this._gridSelection)
         {
            this._gridSelection = this.mx_internal::createGridSelection();
         }
         return this._gridSelection;
      }
      
      mx_internal function set gridSelection(param1:GridSelection) : void
      {
         this._gridSelection = param1;
      }
      
      [Bindable("dataGridChanged")]
      public function get dataGrid() : DataGrid
      {
         return this._dataGrid;
      }
      
      public function set dataGrid(param1:DataGrid) : void
      {
         if(this._dataGrid == param1)
         {
            return;
         }
         this._dataGrid = param1;
         this.dispatchChangeEvent("dataGridChanged");
      }
      
      public function get preserveSelection() : Boolean
      {
         return this.mx_internal::gridSelection.preserveSelection;
      }
      
      public function set preserveSelection(param1:Boolean) : void
      {
         this.mx_internal::gridSelection.preserveSelection = param1;
      }
      
      public function get requestedMaxRowCount() : int
      {
         return this._requestedMaxRowCount;
      }
      
      public function set requestedMaxRowCount(param1:int) : void
      {
         if(this._requestedMaxRowCount == param1)
         {
            return;
         }
         this._requestedMaxRowCount = param1;
         this.invalidateSize();
      }
      
      public function get requestedMinRowCount() : int
      {
         return this._requestedMinRowCount;
      }
      
      public function set requestedMinRowCount(param1:int) : void
      {
         if(this._requestedMinRowCount == param1)
         {
            return;
         }
         this._requestedMinRowCount = param1;
         this.invalidateSize();
      }
      
      public function get requestedRowCount() : int
      {
         return this._requestedRowCount;
      }
      
      public function set requestedRowCount(param1:int) : void
      {
         if(this._requestedRowCount == param1)
         {
            return;
         }
         this._requestedRowCount = param1;
         this.invalidateSize();
      }
      
      public function get requestedMinColumnCount() : int
      {
         return this._requestedMinColumnCount;
      }
      
      public function set requestedMinColumnCount(param1:int) : void
      {
         if(this._requestedMinColumnCount == param1)
         {
            return;
         }
         this._requestedMinColumnCount = param1;
         this.invalidateSize();
      }
      
      public function get requestedColumnCount() : int
      {
         return this._requestedColumnCount;
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         if(this._requestedColumnCount == param1)
         {
            return;
         }
         this._requestedColumnCount = param1;
         this.invalidateSize();
      }
      
      public function get requireSelection() : Boolean
      {
         return this.mx_internal::gridSelection.requireSelection;
      }
      
      public function set requireSelection(param1:Boolean) : void
      {
         this.mx_internal::gridSelection.requireSelection = param1;
         if(param1)
         {
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
         }
      }
      
      [Bindable("resizableColumnsChanged")]
      public function get resizableColumns() : Boolean
      {
         return this._resizableColumns;
      }
      
      public function set resizableColumns(param1:Boolean) : void
      {
         if(param1 == this.resizableColumns)
         {
            return;
         }
         this._resizableColumns = param1;
         this.dispatchChangeEvent("resizableColumnsChanged");
      }
      
      [Bindable("rowBackgroundChanged")]
      public function get rowBackground() : IFactory
      {
         return this._rowBackground;
      }
      
      public function set rowBackground(param1:IFactory) : void
      {
         if(this._rowBackground == param1)
         {
            return;
         }
         this._rowBackground = param1;
         this.invalidateDisplayList();
         this.dispatchChangeEvent("rowBackgroundChanged");
      }
      
      [Bindable("rowHeightChanged")]
      public function get rowHeight() : Number
      {
         return this._rowHeight;
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(this._rowHeight == param1)
         {
            return;
         }
         this._rowHeight = param1;
         this.rowHeightChanged = true;
         invalidateProperties();
         this.dispatchChangeEvent("rowHeightChanged");
      }
      
      private function setFixedRowHeight(param1:Number) : void
      {
         if(this._rowHeight == param1)
         {
            return;
         }
         this._rowHeight = param1;
         this.dispatchChangeEvent("rowHeightChanged");
      }
      
      [Bindable("rowSeparatorChanged")]
      public function get rowSeparator() : IFactory
      {
         return this._rowSeparator;
      }
      
      public function set rowSeparator(param1:IFactory) : void
      {
         if(this._rowSeparator == param1)
         {
            return;
         }
         this._rowSeparator = param1;
         this.invalidateDisplayList();
         this.dispatchChangeEvent("rowSeparatorChanged");
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedCell() : CellPosition
      {
         var _loc1_:Vector.<CellPosition> = this.mx_internal::gridSelection.allCells();
         return !!_loc1_.length ? _loc1_[0] : null;
      }
      
      public function set selectedCell(param1:CellPosition) : void
      {
         var rowIndex:int = 0;
         var columnIndex:int = 0;
         var f:Function = null;
         var value:CellPosition = param1;
         rowIndex = !!value ? value.rowIndex : -1;
         columnIndex = !!value ? value.columnIndex : -1;
         if(!initialized)
         {
            f = function():void
            {
               if(rowIndex != -1 && columnIndex != -1)
               {
                  setSelectedCell(rowIndex,columnIndex);
               }
               else
               {
                  clearSelection();
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else if(rowIndex != -1 && columnIndex != -1)
         {
            this.setSelectedCell(rowIndex,columnIndex);
         }
         else
         {
            this.clearSelection();
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedCells() : Vector.<CellPosition>
      {
         return this.mx_internal::gridSelection.allCells();
      }
      
      public function set selectedCells(param1:Vector.<CellPosition>) : void
      {
         var valueCopy:Vector.<CellPosition> = null;
         var cell:CellPosition = null;
         var f:Function = null;
         var value:Vector.<CellPosition> = param1;
         valueCopy = new Vector.<CellPosition>(0);
         if(value)
         {
            for each(cell in value)
            {
               valueCopy.push(new CellPosition(cell.rowIndex,cell.columnIndex));
            }
         }
         if(!initialized)
         {
            f = function():void
            {
               clearSelection();
               for each(cell in valueCopy)
               {
                  addSelectedCell(cell.rowIndex,cell.columnIndex);
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else
         {
            this.clearSelection();
            for each(cell in valueCopy)
            {
               this.addSelectedCell(cell.rowIndex,cell.columnIndex);
            }
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedIndex() : int
      {
         var _loc1_:Vector.<int> = this.mx_internal::gridSelection.allRows();
         return _loc1_.length > 0 ? _loc1_[0] : -1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var f:Function = null;
         var value:int = param1;
         if(!initialized)
         {
            f = function():void
            {
               if(value != -1)
               {
                  setSelectedIndex(value);
               }
               else
               {
                  clearSelection();
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else if(value != -1)
         {
            this.setSelectedIndex(value);
         }
         else
         {
            this.clearSelection();
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedIndices() : Vector.<int>
      {
         return this.mx_internal::gridSelection.allRows();
      }
      
      public function set selectedIndices(param1:Vector.<int>) : void
      {
         var valueCopy:Vector.<int> = null;
         var f:Function = null;
         var var_654:int = 0;
         var value:Vector.<int> = param1;
         valueCopy = !!value ? value.concat() : new Vector.<int>(0);
         if(!initialized)
         {
            f = function():void
            {
               var _loc1_:int = 0;
               clearSelection();
               for each(_loc1_ in valueCopy)
               {
                  addSelectedIndex(_loc1_);
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else
         {
            this.clearSelection();
            for each(var_654 in valueCopy)
            {
               this.addSelectedIndex(var_654);
            }
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedItem() : Object
      {
         var _loc1_:int = this.selectedIndex;
         if(_loc1_ == -1)
         {
            return undefined;
         }
         return this.mx_internal::getDataProviderItem(_loc1_);
      }
      
      public function set selectedItem(param1:Object) : void
      {
         var f:Function = null;
         var rowIndex:int = 0;
         var value:Object = param1;
         if(!initialized)
         {
            f = function():void
            {
               if(!dataProvider)
               {
                  return;
               }
               var _loc1_:int = dataProvider.getItemIndex(value);
               if(_loc1_ == -1)
               {
                  clearSelection();
               }
               else
               {
                  setSelectedIndex(_loc1_);
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else
         {
            if(!this.dataProvider)
            {
               return;
            }
            rowIndex = this.dataProvider.getItemIndex(value);
            if(rowIndex == -1)
            {
               this.clearSelection();
            }
            else
            {
               this.setSelectedIndex(rowIndex);
            }
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedItems() : Vector.<Object>
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<int> = this.selectedIndices;
         if(_loc1_.length == 0)
         {
            return undefined;
         }
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(this.dataProvider.getItemAt(_loc3_));
         }
         return _loc2_;
      }
      
      public function set selectedItems(param1:Vector.<Object>) : void
      {
         var valueCopy:Vector.<Object> = null;
         var f:Function = null;
         var item:Object = null;
         var value:Vector.<Object> = param1;
         valueCopy = !!value ? value.concat() : new Vector.<Object>(0);
         if(!initialized)
         {
            f = function():void
            {
               var _loc1_:* = null;
               if(!dataProvider)
               {
                  return;
               }
               clearSelection();
               for each(_loc1_ in valueCopy)
               {
                  addSelectedIndex(dataProvider.getItemIndex(_loc1_));
               }
            };
            this.deferredOperations.push(f);
            invalidateProperties();
         }
         else
         {
            if(!this.dataProvider)
            {
               return;
            }
            this.clearSelection();
            for each(item in valueCopy)
            {
               this.addSelectedIndex(this.dataProvider.getItemIndex(item));
            }
         }
      }
      
      [Bindable("selectionIndicatorChanged")]
      public function get selectionIndicator() : IFactory
      {
         return this._selectionIndicator;
      }
      
      public function set selectionIndicator(param1:IFactory) : void
      {
         if(this._selectionIndicator == param1)
         {
            return;
         }
         this._selectionIndicator = param1;
         this.mx_internal::invalidateDisplayListFor("selectionIndicator");
         this.dispatchChangeEvent("selectionIndicatorChanged");
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectionLength() : int
      {
         return this.mx_internal::gridSelection.selectionLength;
      }
      
      [Bindable("selectionModeChanged")]
      public function get selectionMode() : String
      {
         return this.mx_internal::gridSelection.selectionMode;
      }
      
      public function set selectionMode(param1:String) : void
      {
         if(this.selectionMode == param1)
         {
            return;
         }
         this.mx_internal::gridSelection.selectionMode = param1;
         if(this.selectionMode != param1)
         {
            return;
         }
         this.initializeAnchorPosition();
         if(!this.requireSelection)
         {
            this.initializeCaretPosition();
         }
         this.mx_internal::invalidateDisplayListFor("selectionIndicator");
         this.dispatchChangeEvent("selectionModeChanged");
      }
      
      [Bindable("showDataTipsChanged")]
      public function get showDataTips() : Boolean
      {
         return this._showDataTips;
      }
      
      public function set showDataTips(param1:Boolean) : void
      {
         if(this._showDataTips == param1)
         {
            return;
         }
         this._showDataTips = param1;
         this.invalidateDisplayList();
         dispatchEvent(new Event("showDataTipsChanged"));
      }
      
      [Bindable("typicalItemChanged")]
      public function get typicalItem() : Object
      {
         return this._typicalItem;
      }
      
      public function set typicalItem(param1:Object) : void
      {
         if(this._typicalItem == param1)
         {
            return;
         }
         this._typicalItem = param1;
         this.invalidateTypicalItemRenderer();
         this.dispatchChangeEvent("typicalItemChanged");
      }
      
      public function invalidateTypicalItemRenderer() : void
      {
         this.typicalItemChanged = true;
         invalidateProperties();
         this.invalidateSize();
         this.invalidateDisplayList();
      }
      
      [Bindable("variableRowHeightChanged")]
      public function get variableRowHeight() : Boolean
      {
         return this._variableRowHeight;
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         if(param1 == this.variableRowHeight)
         {
            return;
         }
         this._variableRowHeight = param1;
         this.variableRowHeightChanged = true;
         invalidateProperties();
         this.dispatchChangeEvent("variableRowHeightChanged");
      }
      
      public function selectAll() : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc1_:Boolean = this.mx_internal::gridSelection.selectAll();
         if(_loc1_)
         {
            this.initializeCaretPosition();
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc1_;
      }
      
      public function clearSelection() : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc1_:Boolean = this.mx_internal::gridSelection.removeAll();
         if(_loc1_)
         {
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         this.initializeCaretPosition();
         this.initializeAnchorPosition();
         return _loc1_;
      }
      
      public function selectionContainsIndex(param1:int) : Boolean
      {
         return this.mx_internal::gridSelection.containsRow(param1);
      }
      
      public function selectionContainsIndices(param1:Vector.<int>) : Boolean
      {
         return this.mx_internal::gridSelection.containsRows(param1);
      }
      
      public function setSelectedIndex(param1:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc2_:Boolean = this.mx_internal::gridSelection.setRow(param1);
         if(_loc2_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = -1;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function addSelectedIndex(param1:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc2_:Boolean = this.mx_internal::gridSelection.addRow(param1);
         if(_loc2_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = -1;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function removeSelectedIndex(param1:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc2_:Boolean = this.mx_internal::gridSelection.removeRow(param1);
         if(_loc2_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = -1;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function selectIndices(param1:int, param2:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc3_:Boolean = this.mx_internal::gridSelection.setRows(param1,param2);
         if(_loc3_)
         {
            this.caretRowIndex = param1 + param2 - 1;
            this.caretColumnIndex = -1;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function selectionContainsCell(param1:int, param2:int) : Boolean
      {
         return this.mx_internal::gridSelection.containsCell(param1,param2);
      }
      
      public function selectionContainsCellRegion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         return this.mx_internal::gridSelection.containsCellRegion(param1,param2,param3,param4);
      }
      
      public function setSelectedCell(param1:int, param2:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc3_:Boolean = this.mx_internal::gridSelection.setCell(param1,param2);
         if(_loc3_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = param2;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function addSelectedCell(param1:int, param2:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc3_:Boolean = this.mx_internal::gridSelection.addCell(param1,param2);
         if(_loc3_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = param2;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function removeSelectedCell(param1:int, param2:int) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc3_:Boolean = this.mx_internal::gridSelection.removeCell(param1,param2);
         if(_loc3_)
         {
            this.caretRowIndex = param1;
            this.caretColumnIndex = param2;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function selectCellRegion(param1:int, param2:int, param3:uint, param4:uint) : Boolean
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this,false);
         }
         var _loc5_:Boolean;
         if(_loc5_ = this.mx_internal::gridSelection.setCellRegion(param1,param2,param3,param4))
         {
            this.caretRowIndex = param1 + param3 - 1;
            this.caretColumnIndex = param2 + param4 - 1;
            this.mx_internal::invalidateDisplayListFor("selectionIndicator");
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc5_;
      }
      
      private function get gridDimensions() : GridDimensions
      {
         return this.gridLayout.gridDimensions;
      }
      
      private function scrollToIndex(param1:int, param2:Boolean, param3:Boolean) : Boolean
      {
         var _loc4_:Point;
         if(!(_loc4_ = this.gridLayout.getScrollPositionDeltaToElement(param1)))
         {
            return false;
         }
         var _loc5_:* = false;
         if(param2)
         {
            horizontalScrollPosition += _loc4_.x;
            _loc5_ = _loc4_.x != 0;
         }
         if(param3)
         {
            verticalScrollPosition += _loc4_.y;
            _loc5_ = _loc5_ || _loc4_.y != 0;
         }
         return _loc5_;
      }
      
      public function ensureCellIsVisible(param1:int = -1, param2:int = -1) : void
      {
         var _loc10_:* = null;
         var _loc3_:IList = this.columns;
         if(!_loc3_ || param2 < -1 || param2 >= _loc3_.length || !this.dataProvider || param1 < -1 || param1 >= this.dataProvider.length || param2 == -1 && param1 == -1)
         {
            return;
         }
         if(param2 == -1 && this.mx_internal::getNextVisibleColumnIndex(-1) == -1 || param2 != -1 && !GridColumn(_loc3_.getItemAt(param2)).visible)
         {
            return;
         }
         var _loc4_:int = _loc3_.length;
         var _loc5_:* = param2 != -1;
         var _loc6_:* = param1 != -1;
         if(this.getVisibleRowIndices().length == 0 || this.getVisibleColumnIndices().length == 0)
         {
            validateNow();
         }
         if(!_loc5_)
         {
            param2 = 0;
         }
         if(!_loc6_)
         {
            param1 = (_loc10_ = this.getVisibleRowIndices()).length > 0 ? _loc10_[0] : 0;
         }
         var _loc7_:int = param1 * _loc4_ + param2;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = true;
         while(true)
         {
            _loc8_ = this.scrollToIndex(_loc7_,_loc5_,_loc6_);
            if(!this.variableRowHeight && !_loc5_)
            {
               break;
            }
            if(!_loc9_ && !_loc8_)
            {
               return;
            }
            validateNow();
            _loc9_ = false;
            if(this.isCellVisible(_loc6_ ? param1 : -1,_loc5_ ? param2 : -1))
            {
               this.scrollToIndex(_loc7_,_loc5_,_loc6_);
               return;
            }
         }
      }
      
      public function getVisibleRowIndices() : Vector.<int>
      {
         return this.gridLayout.getVisibleRowIndices();
      }
      
      public function getVisibleColumnIndices() : Vector.<int>
      {
         return this.gridLayout.getVisibleColumnIndices();
      }
      
      public function getCellBounds(param1:int, param2:int) : Rectangle
      {
         return this.gridLayout.getCellBounds(param1,param2);
      }
      
      public function getRowBounds(param1:int) : Rectangle
      {
         return this.gridLayout.getRowBounds(param1);
      }
      
      public function getColumnBounds(param1:int) : Rectangle
      {
         return this.gridLayout.getColumnBounds(param1);
      }
      
      public function getRowIndexAt(param1:Number, param2:Number) : int
      {
         return this.gridLayout.getRowIndexAt(param1,param2);
      }
      
      public function getColumnIndexAt(param1:Number, param2:Number) : int
      {
         return this.gridLayout.getColumnIndexAt(param1,param2);
      }
      
      public function getColumnWidth(param1:int) : Number
      {
         var _loc2_:GridColumn = this.getGridColumn(param1);
         return Boolean(_loc2_) && !isNaN(_loc2_.width) ? _loc2_.width : this.gridDimensions.getColumnWidth(param1);
      }
      
      public function getCellAt(param1:Number, param2:Number) : CellPosition
      {
         return this.gridLayout.getCellAt(param1,param2);
      }
      
      public function getCellsAt(param1:Number, param2:Number, param3:Number, param4:Number) : Vector.<CellPosition>
      {
         return this.gridLayout.getCellsAt(param1,param2,param3,param4);
      }
      
      public function getCellX(param1:int, param2:int) : Number
      {
         return this.gridDimensions.getCellX(param1,param2);
      }
      
      public function getCellY(param1:int, param2:int) : Number
      {
         return this.gridDimensions.getCellY(param1,param2);
      }
      
      public function getItemRendererAt(param1:int, param2:int) : IGridItemRenderer
      {
         return this.gridLayout.getItemRendererAt(param1,param2);
      }
      
      public function isCellVisible(param1:int = -1, param2:int = -1) : Boolean
      {
         return this.gridLayout.isCellVisible(param1,param2);
      }
      
      private function setInvalidateDisplayListReason(param1:String) : void
      {
         this.invalidateDisplayListReasonsMask |= 0;
      }
      
      mx_internal function isInvalidateDisplayListReason(param1:String) : Boolean
      {
         var _loc2_:Number = 0;
         return (this.invalidateDisplayListReasonsMask & _loc2_) == _loc2_;
      }
      
      mx_internal function clearInvalidateDisplayListReasons() : void
      {
         this.invalidateDisplayListReasonsMask = 0;
      }
      
      override public function invalidateSize() : void
      {
         if(!this.mx_internal::inUpdateDisplayList)
         {
            super.invalidateSize();
            this.dispatchChangeEvent("invalidateSize");
         }
      }
      
      override public function invalidateDisplayList() : void
      {
         if(!this.mx_internal::inUpdateDisplayList)
         {
            this.setInvalidateDisplayListReason("none");
            super.invalidateDisplayList();
            this.dispatchChangeEvent("invalidateDisplayList");
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         if(this.variableRowHeightChanged || this.rowHeightChanged)
         {
            if(this.rowHeightChanged)
            {
               this.gridDimensions.defaultRowHeight = this._rowHeight;
            }
            this.gridDimensions.variableRowHeight = this.variableRowHeight;
            if(!this.variableRowHeight && this.rowHeightChanged || this.variableRowHeightChanged)
            {
               this.mx_internal::clearGridLayoutCache(false);
               this.invalidateSize();
               this.invalidateDisplayList();
            }
            this.rowHeightChanged = false;
            this.variableRowHeightChanged = false;
         }
         if(this.itemRendererChanged || this.typicalItemChanged)
         {
            this.mx_internal::clearGridLayoutCache(true);
            this.itemRendererChanged = false;
         }
         if(!this.columns || this.generatedColumns && (this.typicalItemChanged || !this.typicalItem && this.dataProviderChanged))
         {
            _loc1_ = this.columns;
            this.columns = this.generateColumns();
            this.generatedColumns = this.columns != null;
            this.columnsChanged = this.columns != _loc1_;
         }
         this.typicalItemChanged = false;
         if(this.dataProviderChanged || this.columnsChanged)
         {
            if(this.mx_internal::gridSelection)
            {
               _loc2_ = this.mx_internal::gridSelection.requireSelection;
               this.mx_internal::gridSelection.requireSelection = false;
               this.mx_internal::gridSelection.removeAll();
               this.mx_internal::gridSelection.requireSelection = _loc2_;
            }
            if(this.columnsChanged)
            {
               this.gridDimensions.columnCount = !!this._columns ? this._columns.length : 0;
            }
            if(this.typicalItem != null && !this.columnsChanged)
            {
               this.mx_internal::clearGridLayoutCache(false);
            }
            else
            {
               this.mx_internal::clearGridLayoutCache(true);
            }
            if(!this.caretChanged)
            {
               this.initializeCaretPosition();
            }
            if(!this.anchorChanged)
            {
               this.initializeAnchorPosition();
            }
            this.dataProviderChanged = false;
            this.columnsChanged = false;
         }
         this.anchorChanged = false;
         if(this.dataProvider)
         {
            for each(_loc3_ in this.deferredOperations)
            {
               _loc3_();
            }
            this.deferredOperations.length = 0;
         }
         if(this.caretChanged)
         {
            if(Boolean(this._dataProvider) && this.caretRowIndex >= this._dataProvider.length)
            {
               this._caretRowIndex = this._dataProvider.length - 1;
            }
            if(Boolean(this._columns) && this.caretColumnIndex >= this._columns.length)
            {
               this._caretColumnIndex = this.mx_internal::getPreviousVisibleColumnIndex(this._columns.length - 1);
            }
            this.caretSelectedItem = Boolean(this._dataProvider) && this._caretRowIndex >= 0 ? this._dataProvider.getItemAt(this._caretRowIndex) : null;
            this.dispatchCaretChangeEvent();
            this._oldCaretRowIndex = this._caretRowIndex;
            this._oldCaretColumnIndex = this._caretColumnIndex;
            this.caretChanged = false;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         this.mx_internal::inUpdateDisplayList = true;
         super.updateDisplayList(param1,param2);
         this.mx_internal::inUpdateDisplayList = false;
         this.mx_internal::clearInvalidateDisplayListReasons();
         if(!this.variableRowHeight)
         {
            this.setFixedRowHeight(this.gridDimensions.getRowHeight(0));
         }
      }
      
      mx_internal function invalidateDisplayListFor(param1:String) : void
      {
         if(!this.mx_internal::inUpdateDisplayList)
         {
            this.setInvalidateDisplayListReason(param1);
            super.invalidateDisplayList();
            this.dispatchChangeEvent("invalidateDisplayList");
         }
      }
      
      public function invalidateCell(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(!this.dataProvider)
         {
            return;
         }
         var _loc3_:int = this.dataProvider.length;
         if(param1 >= this.dataProvider.length)
         {
            return;
         }
         if(!this.isCellVisible(param1,param2))
         {
            return;
         }
         if(Boolean(mx_internal::invalidateDisplayListFlag) || Boolean(mx_internal::invalidateSizeFlag))
         {
            return;
         }
         if(param1 >= 0 && param2 >= 0)
         {
            this.gridLayout.invalidateCell(param1,param2);
         }
         else if(param1 >= 0)
         {
            _loc4_ = this.getVisibleColumnIndices();
            for each(_loc5_ in _loc4_)
            {
               this.gridLayout.invalidateCell(param1,_loc5_);
               if(Boolean(mx_internal::invalidateDisplayListFlag) || Boolean(mx_internal::invalidateSizeFlag))
               {
                  break;
               }
            }
         }
         else if(param2 >= 0)
         {
            _loc6_ = this.getVisibleRowIndices();
            for each(_loc7_ in _loc6_)
            {
               if(_loc7_ >= _loc3_)
               {
                  break;
               }
               this.gridLayout.invalidateCell(_loc7_,param2);
               if(Boolean(mx_internal::invalidateDisplayListFlag) || Boolean(mx_internal::invalidateSizeFlag))
               {
                  break;
               }
            }
         }
      }
      
      mx_internal function createGridSelection() : GridSelection
      {
         return new GridSelection();
      }
      
      private function getGridColumn(param1:int) : GridColumn
      {
         var _loc2_:IList = this.columns;
         if(_loc2_ == null || param1 < 0 || param1 >= _loc2_.length)
         {
            return null;
         }
         return _loc2_.getItemAt(param1) as GridColumn;
      }
      
      mx_internal function getDataProviderItem(param1:int) : Object
      {
         var _loc2_:IList = this.dataProvider;
         if(_loc2_ == null || param1 >= _loc2_.length)
         {
            return null;
         }
         return _loc2_.getItemAt(param1);
      }
      
      private function getVisibleItemRenderer(param1:int, param2:int) : IGridItemRenderer
      {
         var _loc3_:GridLayout = layout as GridLayout;
         if(!_loc3_)
         {
            return null;
         }
         return _loc3_.getVisibleItemRenderer(param1,param2);
      }
      
      protected function grid_mouseDownDragUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.gridDimensions).getRowIndexAt(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_.getColumnIndexAt(_loc3_.x,_loc3_.y);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc7_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc7_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc7_ = "null";
               this.mouseDownRowIndex = _loc5_;
               this.mouseDownColumnIndex = _loc6_;
               this.dragInProgress = true;
         }
         this.dispatchGridEvent(param1,_loc7_,_loc3_,_loc5_,_loc6_);
         if(_loc7_ == GridEvent.GRID_MOUSE_UP)
         {
            this.dispatchGridClickEvents(param1,_loc3_,_loc5_,_loc6_);
         }
      }
      
      protected function grid_mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.gridDimensions).getRowIndexAt(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_.getColumnIndexAt(_loc3_.x,_loc3_.y);
         if(_loc5_ != this.rollRowIndex || _loc6_ != this.rollColumnIndex)
         {
            if(this.rollRowIndex != -1 || this.rollColumnIndex != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this.rollRowIndex,this.rollColumnIndex);
            }
            if(_loc5_ != -1 && _loc6_ != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OVER,_loc3_,_loc5_,_loc6_);
            }
            this.rollRowIndex = _loc5_;
            this.rollColumnIndex = _loc6_;
         }
      }
      
      protected function grid_mouseRollOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.rollRowIndex != -1 || this.rollColumnIndex != -1)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            _loc3_ = globalToLocal(_loc2_);
            this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this.rollRowIndex,this.rollColumnIndex);
            this.rollRowIndex = -1;
            this.rollColumnIndex = -1;
         }
      }
      
      protected function grid_mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.dragInProgress)
         {
            this.dragInProgress = false;
            return;
         }
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.gridDimensions).getRowIndexAt(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_.getColumnIndexAt(_loc3_.x,_loc3_.y);
         this.dispatchGridEvent(param1,GridEvent.GRID_MOUSE_UP,_loc3_,_loc5_,_loc6_);
         this.dispatchGridClickEvents(param1,_loc3_,_loc5_,_loc6_);
      }
      
      private function dispatchGridClickEvents(param1:MouseEvent, param2:Point, param3:int, param4:int) : void
      {
         var _loc5_:Boolean = param3 == this.mouseDownRowIndex && param4 == this.mouseDownColumnIndex;
         var _loc6_:Number = getTimer();
         if(doubleClickEnabled && _loc5_ && !isNaN(this.lastClickTime) && _loc6_ - this.lastClickTime <= this.mx_internal::DOUBLE_CLICK_TIME)
         {
            this.dispatchGridEvent(param1,GridEvent.GRID_DOUBLE_CLICK,param2,param3,param4);
            this.lastClickTime = NaN;
            return;
         }
         if(_loc5_)
         {
            this.dispatchGridEvent(param1,GridEvent.GRID_CLICK,param2,param3,param4);
            this.lastClickTime = _loc6_;
         }
      }
      
      private function dispatchGridEvent(param1:MouseEvent, param2:String, param3:Point, param4:int, param5:int) : void
      {
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:int = 0;
         var _loc6_:GridColumn = param5 >= 0 ? this.getGridColumn(param5) : null;
         var _loc7_:Object = param4 >= 0 ? this.mx_internal::getDataProviderItem(param4) : null;
         _loc8_ = this.getVisibleItemRenderer(param4,param5);
         _loc9_ = param1.bubbles;
         _loc10_ = param1.cancelable;
         _loc11_ = param1.relatedObject;
         _loc12_ = param1.ctrlKey;
         _loc13_ = param1.altKey;
         _loc14_ = param1.shiftKey;
         _loc15_ = param1.buttonDown;
         _loc16_ = param1.delta;
         var _loc17_:GridEvent = new GridEvent(param2,_loc9_,_loc10_,param3.x,param3.y,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,param4,param5,_loc6_,_loc7_,_loc8_);
         dispatchEvent(_loc17_);
      }
      
      private function updateCaretForDataProviderChange(param1:CollectionEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc2_:int = this.caretRowIndex;
         var _loc3_:int = param1.location;
         var _loc4_:int = !!param1.items ? param1.items.length : 0;
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
               if(_loc2_ >= _loc3_)
               {
                  this.caretRowIndex += param1.items.length;
                  break;
               }
               break;
            case CollectionEventKind.REMOVE:
               if(_loc2_ >= _loc3_)
               {
                  if(_loc2_ < _loc3_ + _loc4_)
                  {
                     this.caretRowIndex = -1;
                     break;
                  }
                  this.caretRowIndex -= _loc4_;
                  break;
               }
               break;
            case CollectionEventKind.MOVE:
               _loc6_ = param1.oldLocation;
               if(_loc2_ >= _loc6_ && _loc2_ < _loc6_ + _loc4_)
               {
                  this.caretRowIndex += _loc3_ - _loc6_;
                  break;
               }
               break;
            case CollectionEventKind.REPLACE:
            case CollectionEventKind.UPDATE:
               break;
            case CollectionEventKind.REFRESH:
               if((_loc5_ = !!this.caretSelectedItem ? this._dataProvider.getItemIndex(this.caretSelectedItem) : -1) != -1)
               {
                  this.caretRowIndex = _loc5_;
                  this.ensureCellIsVisible(this.caretRowIndex,-1);
                  break;
               }
               _loc7_ = verticalScrollPosition;
               validateNow();
               _loc8_ = Math.ceil(this.gridDimensions.getContentHeight());
               _loc9_ = Math.max(_loc8_ - height,0);
               verticalScrollPosition = _loc7_ > _loc9_ ? _loc9_ : _loc7_;
               break;
            case CollectionEventKind.RESET:
               if((_loc5_ = !!this.caretSelectedItem ? this._dataProvider.getItemIndex(this.caretSelectedItem) : -1) != -1)
               {
                  this.caretRowIndex = _loc5_;
                  this.ensureCellIsVisible(this.caretRowIndex,-1);
                  break;
               }
               this.caretRowIndex = this._dataProvider.length > 0 ? 0 : -1;
               verticalScrollPosition = 0;
               break;
         }
      }
      
      private function updateCaretForColumnsChange(param1:CollectionEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc2_:int = this.caretColumnIndex;
         var _loc3_:int = param1.location;
         var _loc4_:int = !!param1.items ? param1.items.length : 0;
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
               if(_loc2_ >= _loc3_)
               {
                  this.caretColumnIndex += _loc4_;
                  break;
               }
               break;
            case CollectionEventKind.REMOVE:
               if(_loc2_ >= _loc3_)
               {
                  if(_loc2_ < _loc3_ + _loc4_)
                  {
                     this.caretColumnIndex = this._columns.length > 0 ? 0 : -1;
                     break;
                  }
                  this.caretColumnIndex -= _loc4_;
                  break;
               }
               break;
            case CollectionEventKind.MOVE:
               _loc5_ = param1.oldLocation;
               if(_loc2_ >= _loc5_ && _loc2_ < _loc5_ + _loc4_)
               {
                  this.caretColumnIndex += _loc3_ - _loc5_;
                  break;
               }
               break;
            case CollectionEventKind.REPLACE:
               break;
            case CollectionEventKind.UPDATE:
               if(this.selectionMode == GridSelectionMode.SINGLE_CELL || this.selectionMode == GridSelectionMode.MULTIPLE_CELLS)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc4_)
                  {
                     if((Boolean(_loc6_ = param1.items[_loc7_] as PropertyChangeEvent)) && _loc6_.property == "visible")
                     {
                        if(!(!(_loc8_ = _loc6_.source as GridColumn) || _loc8_.visible))
                        {
                           if(_loc8_.columnIndex == this.caretColumnIndex)
                           {
                              this.initializeCaretPosition(true);
                           }
                           if(_loc8_.columnIndex == this.anchorColumnIndex)
                           {
                              this.initializeAnchorPosition(true);
                           }
                        }
                     }
                     _loc7_++;
                  }
                  break;
               }
               break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
               this.initializeCaretPosition(true);
               horizontalScrollPosition = 0;
         }
      }
      
      private function updateHoverForDataProviderChange(param1:CollectionEvent) : void
      {
         var _loc2_:int = this.hoverRowIndex;
         var _loc3_:int = param1.location;
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
            case CollectionEventKind.REMOVE:
            case CollectionEventKind.REPLACE:
            case CollectionEventKind.UPDATE:
            case CollectionEventKind.MOVE:
               if(_loc2_ >= _loc3_)
               {
                  this.hoverRowIndex = this.gridDimensions.getRowIndexAt(mouseX,mouseY);
                  break;
               }
               break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
               this.hoverRowIndex = this.gridDimensions.getRowIndexAt(mouseX,mouseY);
         }
      }
      
      private function updateHoverForColumnsChange(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
            case CollectionEventKind.REMOVE:
            case CollectionEventKind.REPLACE:
            case CollectionEventKind.UPDATE:
            case CollectionEventKind.MOVE:
               if(this.hoverColumnIndex >= param1.location)
               {
                  this.hoverColumnIndex = this.gridDimensions.getColumnIndexAt(mouseX,mouseY);
                  break;
               }
               break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
               this.hoverColumnIndex = this.gridDimensions.getColumnIndexAt(mouseX,mouseY);
         }
      }
      
      private function dataProvider_collectionChangeHandler(param1:CollectionEvent) : void
      {
         if(!this.columns && this.dataProvider.length > 0)
         {
            this.columns = this.generateColumns();
            this.generatedColumns = this.columns != null;
            this.gridDimensions.columnCount = this.generatedColumns ? this.columns.length : 0;
         }
         var _loc2_:GridDimensions = this.gridDimensions;
         if(this.gridDimensions)
         {
            this.gridDimensions.dataProviderCollectionChanged(param1);
            this.gridDimensions.rowCount = this.dataProvider.length;
         }
         if(this.gridLayout)
         {
            this.gridLayout.dataProviderCollectionChanged(param1);
         }
         if(this.mx_internal::gridSelection)
         {
            this.mx_internal::gridSelection.dataProviderCollectionChanged(param1);
         }
         if(Boolean(this.gridDimensions) && this.hoverRowIndex != -1)
         {
            this.updateHoverForDataProviderChange(param1);
         }
         this.invalidateSize();
         this.invalidateDisplayList();
         if(this.caretRowIndex != -1)
         {
            this.updateCaretForDataProviderChange(param1);
         }
      }
      
      private function columns_collectionChangeHandler(param1:CollectionEvent) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:int = param1.location;
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = GridColumn(this.columns.getItemAt(_loc3_));
                  _loc2_.mx_internal::setGrid(this);
                  _loc2_.mx_internal::setColumnIndex(_loc3_);
                  _loc3_++;
               }
               break;
            case CollectionEventKind.MOVE:
               _loc3_ = Math.min(param1.oldLocation,param1.location);
               _loc5_ = Math.max(param1.oldLocation,param1.location);
               while(_loc3_ <= _loc5_)
               {
                  _loc2_ = GridColumn(this.columns.getItemAt(_loc3_));
                  _loc2_.mx_internal::setColumnIndex(_loc3_);
                  _loc3_++;
               }
               break;
            case CollectionEventKind.REPLACE:
               _loc7_ = (_loc6_ = param1.items).length;
               _loc4_ = 0;
               while(_loc4_ < _loc7_)
               {
                  if(_loc6_[_loc4_].oldValue is GridColumn)
                  {
                     _loc2_ = GridColumn(_loc6_[_loc4_].oldValue);
                     _loc2_.mx_internal::setGrid(null);
                     _loc2_.mx_internal::setColumnIndex(-1);
                  }
                  if(_loc6_[_loc4_].newValue is GridColumn)
                  {
                     _loc2_ = GridColumn(_loc6_[_loc4_].newValue);
                     _loc2_.mx_internal::setGrid(this);
                     _loc2_.mx_internal::setColumnIndex(_loc3_);
                  }
                  _loc4_++;
               }
               break;
            case CollectionEventKind.UPDATE:
               break;
            case CollectionEventKind.REFRESH:
               _loc3_ = 0;
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = GridColumn(this.columns.getItemAt(_loc3_));
                  _loc2_.mx_internal::setColumnIndex(_loc3_);
                  _loc3_++;
               }
               break;
            case CollectionEventKind.REMOVE:
               _loc8_ = param1.items.length;
               _loc4_ = 0;
               while(_loc4_ < _loc8_)
               {
                  _loc2_ = GridColumn(param1.items[_loc4_]);
                  _loc2_.mx_internal::setGrid(null);
                  _loc2_.mx_internal::setColumnIndex(-1);
                  _loc4_++;
               }
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = GridColumn(this.columns.getItemAt(_loc3_));
                  _loc2_.mx_internal::setColumnIndex(_loc3_);
                  _loc3_++;
               }
               break;
            case CollectionEventKind.RESET:
               _loc3_ = 0;
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = GridColumn(this.columns.getItemAt(_loc3_));
                  _loc2_.mx_internal::setGrid(this);
                  _loc2_.mx_internal::setColumnIndex(_loc3_);
                  _loc3_++;
               }
         }
         if(this.gridDimensions)
         {
            this.gridDimensions.columnsCollectionChanged(param1);
         }
         if(this.gridLayout)
         {
            this.gridLayout.columnsCollectionChanged(param1);
         }
         if(this.mx_internal::gridSelection)
         {
            this.mx_internal::gridSelection.columnsCollectionChanged(param1);
         }
         if(this.caretColumnIndex != -1)
         {
            this.updateCaretForColumnsChange(param1);
         }
         if(Boolean(this.gridDimensions) && this.hoverColumnIndex != -1)
         {
            this.updateHoverForColumnsChange(param1);
         }
         this.invalidateSize();
         this.invalidateDisplayList();
      }
      
      mx_internal function clearGridLayoutCache(param1:Boolean) : void
      {
         this.gridLayout.clearVirtualLayoutCache();
         var _loc2_:GridDimensions = this.gridDimensions;
         if(_loc2_)
         {
            if(param1)
            {
               _loc2_.clearTypicalCellWidthsAndHeights();
            }
            _loc2_.clearHeights();
            _loc2_.rowCount = !!this._dataProvider ? this._dataProvider.length : 0;
         }
         setContentSize(0,0);
      }
      
      mx_internal function getNextVisibleColumnIndex(param1:int = -1) : int
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         if(param1 < -1)
         {
            return -1;
         }
         _loc2_ = this.columns;
         var _loc3_:int = !!_loc2_ ? _loc2_.length : 0;
         var _loc4_:int = param1 + 1;
         while(_loc4_ < _loc3_)
         {
            if((Boolean(_loc5_ = _loc2_.getItemAt(_loc4_) as GridColumn)) && _loc5_.visible)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      mx_internal function getPreviousVisibleColumnIndex(param1:int) : int
      {
         var _loc4_:* = null;
         var _loc2_:IList = this.columns;
         if(!_loc2_ || param1 > _loc2_.length)
         {
            return -1;
         }
         var _loc3_:int = param1 - 1;
         while(_loc3_ >= 0)
         {
            if((Boolean(_loc4_ = _loc2_.getItemAt(_loc3_) as GridColumn)) && _loc4_.visible)
            {
               return _loc3_;
            }
            _loc3_--;
         }
         return -1;
      }
      
      private function initializeAnchorPosition(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this.anchorRowIndex = Boolean(this._dataProvider) && this._dataProvider.length > 0 ? 0 : -1;
         }
         this.anchorColumnIndex = this.mx_internal::getNextVisibleColumnIndex();
      }
      
      private function initializeCaretPosition(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this.caretRowIndex = Boolean(this._dataProvider) && this._dataProvider.length > 0 ? 0 : -1;
         }
         this.caretColumnIndex = this.mx_internal::getNextVisibleColumnIndex();
      }
      
      private function dispatchCaretChangeEvent() : void
      {
         var _loc1_:* = null;
         if(hasEventListener(GridCaretEvent.CARET_CHANGE))
         {
            _loc1_ = new GridCaretEvent(GridCaretEvent.CARET_CHANGE);
            _loc1_.oldRowIndex = this._oldCaretRowIndex;
            _loc1_.oldColumnIndex = this._oldCaretColumnIndex;
            _loc1_.newRowIndex = this._caretRowIndex;
            _loc1_.newColumnIndex = this._caretColumnIndex;
            dispatchEvent(_loc1_);
         }
      }
   }
}
