package spark.components
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.collections.ICollectionView;
   import mx.collections.IList;
   import mx.collections.ISort;
   import mx.collections.ISortField;
   import mx.core.EventPriority;
   import mx.core.IFactory;
   import mx.core.IIMESupport;
   import mx.core.LayoutDirection;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManagerPriority;
   import mx.managers.IFocusManagerComponent;
   import mx.styles.AdvancedStyleClient;
   import spark.collections.Sort;
   import spark.components.gridClasses.CellPosition;
   import spark.components.gridClasses.CellRegion;
   import spark.components.gridClasses.DataGridEditor;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridLayout;
   import spark.components.gridClasses.GridSelection;
   import spark.components.gridClasses.GridSelectionMode;
   import spark.components.gridClasses.GridSortField;
   import spark.components.gridClasses.IDataGridElement;
   import spark.components.gridClasses.IGridItemEditor;
   import spark.components.supportClasses.SkinnableContainerBase;
   import spark.core.NavigationUnit;
   import spark.events.GridCaretEvent;
   import spark.events.GridEvent;
   import spark.events.GridSelectionEvent;
   import spark.events.GridSelectionEventKind;
   import spark.events.GridSortEvent;
   
   public class DataGrid extends SkinnableContainerBase implements IFocusManagerComponent, IIMESupport
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static const factorySkinPartNames:Array = ["alternatingRowColorsBackground","caretIndicator","columnSeparator","headerColumnSeparator","hoverIndicator","rowBackground","rowSeparator","selectionIndicator"];
      
      private static const partPropertyBits:Object = {
         "columns":uint(1),
         "dataProvider":uint(2),
         "itemRenderer":uint(4),
         "requestedRowCount":uint(8),
         "requestedColumnCount":uint(16),
         "requestedMaxRowCount":uint(32),
         "requestedMinRowCount":uint(64),
         "requestedMinColumnCount":uint(128),
         "rowHeight":uint(256),
         "showDataTips":uint(512),
         "typicalItem":uint(1024),
         "variableRowHeight":uint(2048),
         "dataTipField":uint(4096),
         "dataTipFunction":uint(8192),
         "resizableColumns":uint(16384)
      };
      
      private static const gridPropertyDefaults:Object = {
         "columns":null,
         "dataProvider":null,
         "itemRenderer":null,
         "resizableColumns":true,
         "requestedRowCount":int(-1),
         "requestedMaxRowCount":int(10),
         "requestedMinRowCount":int(-1),
         "requestedColumnCount":int(-1),
         "requestedMinColumnCount":int(-1),
         "rowHeight":NaN,
         "showDataTips":false,
         "typicalItem":null,
         "variableRowHeight":false,
         "dataTipField":null,
         "dataTipFunction":null
      };
       
      
      private var updateHoverOnRollOver:Boolean = true;
      
      private var _1277490047alternatingRowColorsBackground:IFactory;
      
      private var _502679092caretIndicator:IFactory;
      
      private var _1482148164columnHeaderGroup:GridColumnHeaderGroup;
      
      private var _237342767columnSeparator:IFactory;
      
      private var _1555036382editorIndicator:IFactory;
      
      private var _3181382grid:Grid;
      
      private var _1933789133hoverIndicator:IFactory;
      
      private var _367467864rowBackground:IFactory;
      
      private var _1763950123rowSeparator:IFactory;
      
      private var _402164678scroller:Scroller;
      
      private var _627206627selectionIndicator:IFactory;
      
      private const deferredGridOperations:Vector.<Function> = new Vector.<Function>();
      
      private var gridProperties:Object;
      
      mx_internal var doubleClickTime:Number = 620;
      
      mx_internal var editKey:uint = 113;
      
      mx_internal var editOnDoubleClick:Boolean = false;
      
      mx_internal var editor:DataGridEditor;
      
      private var _editable:Boolean = false;
      
      private var _gridSelection:GridSelection = null;
      
      private var _imeMode:String = null;
      
      private var _itemEditor:IFactory = null;
      
      private var _sortableColumns:Boolean = true;
      
      mx_internal var focusOwner:UIComponent;
      
      private var focusOwnerWidth:Number = 1;
      
      private var focusOwnerHeight:Number = 1;
      
      private var scrollerEvent:KeyboardEvent = null;
      
      private var stretchCursorID:int = 0;
      
      private var resizeColumn:GridColumn = null;
      
      private var resizeAnchorX:Number = NaN;
      
      private var resizeColumnWidth:Number = NaN;
      
      private var nextColumn:GridColumn = null;
      
      private var nextColumnWidth:Number = NaN;
      
      public function DataGrid()
      {
         this.gridProperties = new Object();
         super();
         addEventListener(Event.SELECT_ALL,this.selectAllHandler);
      }
      
      private static function getPartProperty(param1:Object, param2:Object, param3:String, param4:Object) : *
      {
         if(param1)
         {
            return param1[param3];
         }
         var _loc5_:*;
         return (_loc5_ = param2[param3]) === undefined ? param4[param3] : _loc5_;
      }
      
      private static function setPartProperty(param1:Object, param2:Object, param3:String, param4:*, param5:Object) : Boolean
      {
         if(getPartProperty(param1,param2,param3,param5) === param4)
         {
            return false;
         }
         var _loc6_:* = param5[param3];
         if(param1)
         {
            param1[param3] = param4;
            if(param4 === _loc6_)
            {
               param2.propertyBits &= -1;
            }
            else
            {
               param2.propertyBits |= 0;
            }
         }
         else if(param4 === _loc6_)
         {
            delete param2[param3];
         }
         else
         {
            param2[param3] = param4;
         }
         return true;
      }
      
      private static function findSortField(param1:String, param2:Array, param3:Boolean) : ISortField
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return null;
         }
         for each(_loc4_ in param2)
         {
            _loc5_ = _loc4_.name;
            if(param3 && _loc4_ is GridSortField)
            {
               _loc5_ = GridSortField(_loc4_).dataFieldPath;
            }
            if(_loc5_ == param1)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      private function initializeGridRowBackground() : void
      {
         if(!this.grid)
         {
            return;
         }
         if(Boolean(getStyle("alternatingRowColors") as Array) && Boolean(this.alternatingRowColorsBackground))
         {
            this.grid.rowBackground = this.alternatingRowColorsBackground;
         }
         else
         {
            this.grid.rowBackground = this.rowBackground;
         }
      }
      
      private function getGridProperty(param1:String) : *
      {
         return getPartProperty(this.grid,this.gridProperties,param1,gridPropertyDefaults);
      }
      
      private function setGridProperty(param1:String, param2:*) : Boolean
      {
         return setPartProperty(this.grid,this.gridProperties,param1,param2,gridPropertyDefaults);
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
      
      [Bindable("columnsChanged")]
      public function get columns() : IList
      {
         return this.getGridProperty("columns");
      }
      
      public function set columns(param1:IList) : void
      {
         if(this.setGridProperty("columns",param1))
         {
            if(this.columnHeaderGroup)
            {
               this.columnHeaderGroup.layout.clearVirtualLayoutCache();
               this.columnHeaderGroup.invalidateSize();
               this.columnHeaderGroup.invalidateDisplayList();
            }
            this.dispatchChangeEvent("columnsChanged");
         }
      }
      
      private function getColumnAt(param1:int) : GridColumn
      {
         var _loc2_:Grid = this.grid;
         if(!_loc2_ || !_loc2_.columns)
         {
            return null;
         }
         var _loc3_:IList = _loc2_.columns;
         return param1 >= 0 && param1 < _loc3_.length ? _loc3_.getItemAt(param1) as GridColumn : null;
      }
      
      public function get columnsLength() : int
      {
         var _loc1_:IList = this.columns;
         return !!_loc1_ ? _loc1_.length : 0;
      }
      
      [Bindable("dataProviderChanged")]
      public function get dataProvider() : IList
      {
         return this.getGridProperty("dataProvider");
      }
      
      public function set dataProvider(param1:IList) : void
      {
         if(this.setGridProperty("dataProvider",param1))
         {
            this.dispatchChangeEvent("dataProviderChanged");
         }
      }
      
      public function get dataProviderLength() : int
      {
         var _loc1_:IList = this.dataProvider;
         return !!_loc1_ ? _loc1_.length : 0;
      }
      
      [Bindable("dataTipFieldChanged")]
      public function get dataTipField() : String
      {
         return this.getGridProperty("dataTipField");
      }
      
      public function set dataTipField(param1:String) : void
      {
         if(this.setGridProperty("dataTipField",param1))
         {
            this.dispatchChangeEvent("dataTipFieldChanged");
         }
      }
      
      [Bindable("dataTipFunctionChanged")]
      public function get dataTipFunction() : Function
      {
         return this.getGridProperty("dataTipFunction");
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         if(this.setGridProperty("dataTipFunction",param1))
         {
            this.dispatchChangeEvent("dataTipFunctionChanged");
         }
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._editable = param1;
      }
      
      public function get editorColumnIndex() : int
      {
         if(this.mx_internal::editor)
         {
            return this.mx_internal::editor.editorColumnIndex;
         }
         return -1;
      }
      
      public function get editorRowIndex() : int
      {
         if(this.mx_internal::editor)
         {
            return this.mx_internal::editor.editorRowIndex;
         }
         return -1;
      }
      
      public function get enableIME() : Boolean
      {
         return false;
      }
      
      protected function get gridSelection() : GridSelection
      {
         if(!this._gridSelection)
         {
            this._gridSelection = this.mx_internal::createGridSelection();
         }
         return this._gridSelection;
      }
      
      public function get imeMode() : String
      {
         return this._imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         this._imeMode = param1;
      }
      
      [Bindable("itemEditorChanged")]
      public function get itemEditor() : IFactory
      {
         return this._itemEditor;
      }
      
      public function set itemEditor(param1:IFactory) : void
      {
         if(this._itemEditor == param1)
         {
            return;
         }
         this._itemEditor = param1;
         this.dispatchChangeEvent("itemEditorChanged");
      }
      
      public function get itemEditorInstance() : IGridItemEditor
      {
         if(this.mx_internal::editor)
         {
            return this.mx_internal::editor.itemEditorInstance;
         }
         return null;
      }
      
      [Bindable("itemRendererChanged")]
      public function get itemRenderer() : IFactory
      {
         return this.getGridProperty("itemRenderer");
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         if(this.setGridProperty("itemRenderer",param1))
         {
            this.dispatchChangeEvent("itemRendererChanged");
         }
      }
      
      public function get preserveSelection() : Boolean
      {
         if(this.grid)
         {
            return this.grid.preserveSelection;
         }
         return this.gridSelection.preserveSelection;
      }
      
      public function set preserveSelection(param1:Boolean) : void
      {
         if(this.grid)
         {
            this.grid.preserveSelection = param1;
         }
         else
         {
            this.gridSelection.preserveSelection = param1;
         }
      }
      
      public function get requireSelection() : Boolean
      {
         if(this.grid)
         {
            return this.grid.requireSelection;
         }
         return this.gridSelection.requireSelection;
      }
      
      public function set requireSelection(param1:Boolean) : void
      {
         if(this.grid)
         {
            this.grid.requireSelection = param1;
         }
         else
         {
            this.gridSelection.requireSelection = param1;
         }
      }
      
      public function get requestedRowCount() : int
      {
         return this.getGridProperty("requestedRowCount");
      }
      
      public function set requestedRowCount(param1:int) : void
      {
         this.setGridProperty("requestedRowCount",param1);
      }
      
      public function get requestedColumnCount() : int
      {
         return this.getGridProperty("requestedColumnCount");
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         this.setGridProperty("requestedColumnCount",param1);
      }
      
      public function get requestedMaxRowCount() : int
      {
         return this.getGridProperty("requestedMaxRowCount");
      }
      
      public function set requestedMaxRowCount(param1:int) : void
      {
         this.setGridProperty("requestedMaxRowCount",param1);
      }
      
      public function get requestedMinRowCount() : int
      {
         return this.getGridProperty("requestedMinRowCount");
      }
      
      public function set requestedMinRowCount(param1:int) : void
      {
         this.setGridProperty("requestedMinRowCount",param1);
      }
      
      public function get requestedMinColumnCount() : int
      {
         return this.getGridProperty("requestedMinColumnCount");
      }
      
      public function set requestedMinColumnCount(param1:int) : void
      {
         this.setGridProperty("requestedMinColumnCount",param1);
      }
      
      [Bindable("resizableColumnsChanged")]
      public function get resizableColumns() : Boolean
      {
         return this.getGridProperty("resizableColumns");
      }
      
      public function set resizableColumns(param1:Boolean) : void
      {
         if(this.setGridProperty("resizableColumns",param1))
         {
            this.dispatchChangeEvent("resizableColumnsChanged");
         }
      }
      
      [Bindable("rowHeightChanged")]
      public function get rowHeight() : Number
      {
         return this.getGridProperty("rowHeight");
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(this.setGridProperty("rowHeight",param1))
         {
            this.dispatchChangeEvent("rowHeightChanged");
         }
      }
      
      [Bindable("selectionModeChanged")]
      public function get selectionMode() : String
      {
         if(this.grid)
         {
            return this.grid.selectionMode;
         }
         return this.gridSelection.selectionMode;
      }
      
      public function set selectionMode(param1:String) : void
      {
         if(this.selectionMode == param1)
         {
            return;
         }
         if(this.grid)
         {
            this.grid.selectionMode = param1;
         }
         else
         {
            this.gridSelection.selectionMode = param1;
         }
         if(this.grid && this.grid.layout is GridLayout && Boolean(this.caretIndicator))
         {
            GridLayout(this.grid.layout).showCaret = param1 != GridSelectionMode.NONE && this == getFocus();
         }
         this.dispatchChangeEvent("selectionModeChanged");
      }
      
      mx_internal function isRowSelectionMode() : Boolean
      {
         var _loc1_:String = this.selectionMode;
         return _loc1_ == GridSelectionMode.SINGLE_ROW || _loc1_ == GridSelectionMode.MULTIPLE_ROWS;
      }
      
      mx_internal function isCellSelectionMode() : Boolean
      {
         var _loc1_:String = this.selectionMode;
         return _loc1_ == GridSelectionMode.SINGLE_CELL || _loc1_ == GridSelectionMode.MULTIPLE_CELLS;
      }
      
      [Bindable("showDataTipsChanged")]
      public function get showDataTips() : Boolean
      {
         return this.getGridProperty("showDataTips");
      }
      
      public function set showDataTips(param1:Boolean) : void
      {
         if(this.setGridProperty("showDataTips",param1))
         {
            this.dispatchChangeEvent("showDataTipsChanged");
         }
      }
      
      [Bindable("sortableColumnsChanged")]
      public function get sortableColumns() : Boolean
      {
         return this._sortableColumns;
      }
      
      public function set sortableColumns(param1:Boolean) : void
      {
         if(this._sortableColumns == param1)
         {
            return;
         }
         this._sortableColumns = param1;
         this.dispatchChangeEvent("sortableColumnsChanged");
      }
      
      [Bindable("typicalItemChanged")]
      public function get typicalItem() : Object
      {
         return this.getGridProperty("typicalItem");
      }
      
      public function set typicalItem(param1:Object) : void
      {
         if(this.setGridProperty("typicalItem",param1))
         {
            this.dispatchChangeEvent("typicalItemChanged");
         }
      }
      
      public function invalidateTypicalItem() : void
      {
         if(this.grid)
         {
            this.grid.invalidateTypicalItemRenderer();
         }
      }
      
      [Bindable("variableRowHeightChanged")]
      public function get variableRowHeight() : Boolean
      {
         return this.getGridProperty("variableRowHeight");
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         if(this.setGridProperty("variableRowHeight",param1))
         {
            this.dispatchChangeEvent("variableRowHeightChanged");
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.mx_internal::focusOwner = new UIComponent();
         var _loc1_:Graphics = this.mx_internal::focusOwner.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(0,0,0);
         _loc1_.drawRect(0,0,this.focusOwnerWidth,this.focusOwnerHeight);
         mx_internal::$addChild(this.mx_internal::focusOwner);
         this.mx_internal::focusOwner.tabEnabled = true;
         this.mx_internal::focusOwner.tabIndex = tabIndex;
         this.mx_internal::focusOwner.mx_internal::$visible = true;
      }
      
      override public function set nestLevel(param1:int) : void
      {
         super.nestLevel = param1;
         if(this.grid)
         {
            this.initializeDataGridElement(this.columnHeaderGroup);
         }
      }
      
      override public function set tabIndex(param1:int) : void
      {
         super.tabIndex = param1;
         if(this.mx_internal::focusOwner)
         {
            this.mx_internal::focusOwner.tabIndex = param1;
         }
      }
      
      override public function set accessibilityDescription(param1:String) : void
      {
         super.accessibilityDescription = param1;
         if(this.mx_internal::focusOwner)
         {
            this.mx_internal::focusOwner.accessibilityDescription = param1;
         }
      }
      
      override public function set accessibilityShortcut(param1:String) : void
      {
         super.accessibilityShortcut = param1;
         if(this.mx_internal::focusOwner)
         {
            this.mx_internal::focusOwner.accessibilityShortcut = param1;
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            DataGrid.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         super.updateDisplayList(param1,param2);
         if(Boolean(this.mx_internal::focusOwner) && (this.focusOwnerWidth != param1 || this.focusOwnerHeight != param2))
         {
            this.focusOwnerWidth = param1;
            this.focusOwnerHeight = param2;
            _loc3_ = this.mx_internal::focusOwner.graphics;
            _loc3_.clear();
            _loc3_.lineStyle(0,0,0);
            _loc3_.drawRect(0,0,this.focusOwnerWidth,this.focusOwnerHeight);
         }
      }
      
      override public function setFocus() : void
      {
         if(this.grid)
         {
            this.mx_internal::focusOwner.setFocus();
         }
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == this.mx_internal::focusOwner || super.isOurFocus(param1);
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.styleChanged(param1);
         var _loc2_:Boolean = param1 == null || param1 == "styleName";
         if(this.grid)
         {
            if(_loc2_ || Boolean(styleManager.isSizeInvalidatingStyle(param1)))
            {
               if(this.grid)
               {
                  this.grid.invalidateSize();
                  this.grid.mx_internal::clearGridLayoutCache(true);
               }
               if(this.columnHeaderGroup)
               {
                  this.columnHeaderGroup.layout.clearVirtualLayoutCache();
                  this.columnHeaderGroup.invalidateSize();
               }
            }
            if(_loc2_ || param1 == "alternatingRowColors")
            {
               this.initializeGridRowBackground();
               if(Boolean(this.grid) && Boolean(this.grid.layout))
               {
                  this.grid.layout.clearVirtualLayoutCache();
               }
            }
            if(this.grid)
            {
               this.grid.invalidateDisplayList();
            }
            if(this.columnHeaderGroup)
            {
               this.columnHeaderGroup.invalidateDisplayList();
            }
         }
         if(this.scroller)
         {
            _loc3_ = getStyle("verticalScrollPolicy");
            if(param1 == "verticalScrollPolicy")
            {
               this.scroller.setStyle("verticalScrollPolicy",_loc3_);
            }
            else if(_loc2_ && _loc3_ && _loc3_ !== ScrollPolicy.AUTO)
            {
               this.scroller.setStyle("verticalScrollPolicy",_loc3_);
            }
            _loc4_ = getStyle("horizontalScrollPolicy");
            if(param1 == "horizontalScrollPolicy")
            {
               this.scroller.setStyle("horizontalScrollPolicy",_loc4_);
            }
            else if(_loc2_ && _loc4_ && _loc4_ !== ScrollPolicy.AUTO)
            {
               this.scroller.setStyle("horizontalScrollPolicy",_loc4_);
            }
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:* = null;
         if(!this.grid || param1.isDefaultPrevented())
         {
            return;
         }
         if(param1 == this.scrollerEvent)
         {
            this.scrollerEvent = null;
            param1.preventDefault();
            return;
         }
         if(!this.isOurFocus(DisplayObject(param1.target)))
         {
            return;
         }
         if(param1.keyCode == Keyboard.A && param1.ctrlKey)
         {
            this.selectAllFromKeyboard();
            param1.preventDefault();
            return;
         }
         if(this.selectionMode == GridSelectionMode.NONE || this.grid.caretRowIndex < 0 || this.grid.caretRowIndex >= this.dataProviderLength || this.mx_internal::isCellSelectionMode() && (this.grid.caretColumnIndex < 0 || this.grid.caretColumnIndex >= this.columnsLength))
         {
            if(Boolean(this.scroller) && this.scrollerEvent != param1)
            {
               this.scrollerEvent = param1.clone() as KeyboardEvent;
               this.scroller.dispatchEvent(this.scrollerEvent);
            }
            return;
         }
         if(param1.keyCode == Keyboard.SPACE)
         {
            if(param1.ctrlKey)
            {
               if(this.toggleSelection(this.grid.caretRowIndex,this.grid.caretColumnIndex))
               {
                  this.grid.anchorRowIndex = this.grid.caretRowIndex;
                  this.grid.anchorColumnIndex = this.grid.caretColumnIndex;
                  param1.preventDefault();
               }
            }
            else if(param1.shiftKey)
            {
               if(this.extendSelection(this.grid.caretRowIndex,this.grid.caretColumnIndex))
               {
                  param1.preventDefault();
               }
            }
            else if(this.grid.caretRowIndex != -1)
            {
               if(this.mx_internal::isRowSelectionMode())
               {
                  _loc2_ = this.selectionMode == GridSelectionMode.SINGLE_ROW ? "null" : GridSelectionEventKind.ADD_ROW;
                  if(!this.commitInteractiveSelection(_loc2_,this.grid.caretRowIndex,this.grid.caretColumnIndex))
                  {
                     return;
                  }
                  param1.preventDefault();
               }
               else if(this.mx_internal::isCellSelectionMode() && this.grid.caretColumnIndex != -1)
               {
                  _loc2_ = this.selectionMode == GridSelectionMode.SINGLE_CELL ? "null" : GridSelectionEventKind.ADD_CELL;
                  if(!this.commitInteractiveSelection(_loc2_,this.grid.caretRowIndex,this.grid.caretColumnIndex))
                  {
                     return;
                  }
                  param1.preventDefault();
               }
            }
            return;
         }
         this.adjustSelectionUponNavigation(param1);
      }
      
      protected function selectAllHandler(param1:Event) : void
      {
         if(!this.grid || param1.isDefaultPrevented() || !this.isOurFocus(DisplayObject(param1.target)))
         {
            return;
         }
         this.selectAllFromKeyboard();
      }
      
      private function selectAllFromKeyboard() : void
      {
         if(this.selectionMode == GridSelectionMode.MULTIPLE_CELLS || this.selectionMode == GridSelectionMode.MULTIPLE_ROWS)
         {
            if(this.commitInteractiveSelection(GridSelectionEventKind.SELECT_ALL,0,0,this.dataProvider.length,this.columns.length))
            {
               this.grid.anchorRowIndex = 0;
               this.grid.anchorColumnIndex = 0;
            }
         }
      }
      
      override protected function findSkinParts() : void
      {
         var _loc1_:* = null;
         super.findSkinParts();
         for each(_loc1_ in factorySkinPartNames)
         {
            if(_loc1_ in skin && false)
            {
               this.partAdded(_loc1_,skin[_loc1_]);
            }
         }
      }
      
      private function initializeDataGridElement(param1:IDataGridElement) : void
      {
         if(!param1)
         {
            return;
         }
         param1.dataGrid = this;
         if(param1.nestLevel <= this.grid.nestLevel)
         {
            param1.nestLevel = this.grid.nestLevel + 1;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super.partAdded(param1,param2);
         if(param2 == this.grid)
         {
            this.gridSelection.grid = this.grid;
            this.grid.mx_internal::gridSelection = this.gridSelection;
            this.grid.dataGrid = this;
            _loc3_ = this.gridProperties;
            this.gridProperties = {"propertyBits":0};
            for(_loc4_ in _loc3_)
            {
               if(_loc4_ != "propertyBits")
               {
                  this.setGridProperty(_loc4_,_loc3_[_loc4_]);
               }
            }
            this.initializeGridRowBackground();
            this.grid.columnSeparator = this.columnSeparator;
            this.grid.rowSeparator = this.rowSeparator;
            this.grid.hoverIndicator = this.hoverIndicator;
            this.grid.caretIndicator = this.caretIndicator;
            this.grid.selectionIndicator = this.selectionIndicator;
            this.grid.addEventListener(GridEvent.GRID_MOUSE_DOWN,this.grid_mouseDownHandler,false,EventPriority.DEFAULT_HANDLER);
            this.grid.addEventListener(GridEvent.GRID_MOUSE_UP,this.grid_mouseUpHandler,false,EventPriority.DEFAULT_HANDLER);
            this.grid.addEventListener(GridEvent.GRID_ROLL_OVER,this.grid_rollOverHandler,false,EventPriority.DEFAULT_HANDLER);
            this.grid.addEventListener(GridEvent.GRID_ROLL_OUT,this.grid_rollOutHandler,false,EventPriority.DEFAULT_HANDLER);
            this.grid.addEventListener(GridCaretEvent.CARET_CHANGE,this.grid_caretChangeHandler);
            this.grid.addEventListener(FlexEvent.VALUE_COMMIT,this.grid_valueCommitHandler);
            this.grid.addEventListener("invalidateSize",this.grid_invalidateSizeHandler);
            this.grid.addEventListener("invalidateDisplayList",this.grid_invalidateDisplayListHandler);
            for each(_loc5_ in this.deferredGridOperations)
            {
               _loc5_(this.grid);
            }
            this.deferredGridOperations.length = 0;
            this.initializeDataGridElement(this.columnHeaderGroup);
            this.mx_internal::editor = this.mx_internal::createEditor();
            this.mx_internal::editor.initialize();
         }
         if(param2 == this.alternatingRowColorsBackground)
         {
            this.initializeGridRowBackground();
         }
         if(this.grid)
         {
            if(param2 == this.columnSeparator)
            {
               this.grid.columnSeparator = this.columnSeparator;
            }
            if(param2 == this.rowSeparator)
            {
               this.grid.rowSeparator = this.rowSeparator;
            }
            if(param2 == this.hoverIndicator)
            {
               this.grid.hoverIndicator = this.hoverIndicator;
            }
            if(param2 == this.caretIndicator)
            {
               this.grid.caretIndicator = this.caretIndicator;
               addEventListener(FocusEvent.FOCUS_IN,this.dataGrid_focusHandler);
               addEventListener(FocusEvent.FOCUS_OUT,this.dataGrid_focusHandler);
               if(Boolean(this.grid) && this.grid.layout is GridLayout)
               {
                  GridLayout(this.grid.layout).showCaret = false;
               }
            }
            if(param2 == this.rowBackground)
            {
               this.grid.rowBackground = this.rowBackground;
            }
            if(param2 == this.selectionIndicator)
            {
               this.grid.selectionIndicator = this.selectionIndicator;
            }
         }
         if(param2 == this.columnHeaderGroup)
         {
            if(this.grid)
            {
               this.initializeDataGridElement(this.columnHeaderGroup);
            }
            this.columnHeaderGroup.addEventListener(GridEvent.GRID_CLICK,this.columnHeaderGroup_clickHandler);
            this.columnHeaderGroup.addEventListener(GridEvent.SEPARATOR_ROLL_OVER,this.separator_rollOverHandler);
            this.columnHeaderGroup.addEventListener(GridEvent.SEPARATOR_ROLL_OUT,this.separator_rollOutHandler);
            this.columnHeaderGroup.addEventListener(GridEvent.SEPARATOR_MOUSE_DOWN,this.separator_mouseDownHandler);
            this.columnHeaderGroup.addEventListener(GridEvent.SEPARATOR_MOUSE_DRAG,this.separator_mouseDragHandler);
            this.columnHeaderGroup.addEventListener(GridEvent.SEPARATOR_MOUSE_UP,this.separator_mouseUpHandler);
         }
         if(param2 == this.scroller)
         {
            if((Boolean(_loc6_ = getStyle("verticalScrollPolicy"))) && _loc6_ !== ScrollPolicy.AUTO)
            {
               this.scroller.setStyle("verticalScrollPolicy",_loc6_);
            }
            if((Boolean(_loc7_ = getStyle("horizontalScrollPolicy"))) && _loc7_ !== ScrollPolicy.AUTO)
            {
               this.scroller.setStyle("horizontalScrollPolicy",_loc7_);
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:Number = 0;
         super.partRemoved(param1,param2);
         if(param2 == this.grid)
         {
            this.gridSelection.grid = null;
            this.grid.mx_internal::gridSelection = null;
            this.grid.dataGrid = null;
            this.grid.removeEventListener("invalidateSize",this.grid_invalidateSizeHandler);
            this.grid.removeEventListener("invalidateDisplayList",this.grid_invalidateDisplayListHandler);
            this.grid.removeEventListener(GridEvent.GRID_MOUSE_DOWN,this.grid_mouseDownHandler);
            this.grid.removeEventListener(GridEvent.GRID_MOUSE_UP,this.grid_mouseUpHandler);
            this.grid.removeEventListener(GridEvent.GRID_ROLL_OVER,this.grid_rollOverHandler);
            this.grid.removeEventListener(GridEvent.GRID_ROLL_OUT,this.grid_rollOutHandler);
            this.grid.removeEventListener(GridCaretEvent.CARET_CHANGE,this.grid_caretChangeHandler);
            this.grid.removeEventListener(FlexEvent.VALUE_COMMIT,this.grid_valueCommitHandler);
            _loc3_ = uint(this.gridProperties.propertyBits);
            this.gridProperties = new Object();
            for(_loc4_ in gridPropertyDefaults)
            {
               if(((_loc5_ = 0) & _loc3_) == _loc5_)
               {
                  this.gridProperties[_loc4_] = this.getGridProperty(_loc4_);
               }
            }
            this.grid.rowBackground = null;
            this.grid.columnSeparator = null;
            this.grid.rowSeparator = null;
            this.grid.hoverIndicator = null;
            this.grid.caretIndicator = null;
            this.grid.selectionIndicator = null;
            if(this.columnHeaderGroup)
            {
               this.columnHeaderGroup.dataGrid = null;
            }
            if(this.mx_internal::editor)
            {
               this.mx_internal::editor.uninitialize();
               this.mx_internal::editor = null;
            }
         }
         if(this.grid)
         {
            if(param2 == this.columnSeparator)
            {
               this.grid.columnSeparator = null;
            }
            if(param2 == this.rowSeparator)
            {
               this.grid.rowSeparator = null;
            }
            if(param2 == this.hoverIndicator)
            {
               this.grid.hoverIndicator = null;
            }
            if(param2 == this.caretIndicator)
            {
               this.grid.caretIndicator = null;
               removeEventListener(FocusEvent.FOCUS_IN,this.dataGrid_focusHandler);
               removeEventListener(FocusEvent.FOCUS_OUT,this.dataGrid_focusHandler);
            }
            if(param2 == this.selectionIndicator)
            {
               this.grid.selectionIndicator = null;
            }
            if(param2 == this.rowBackground)
            {
               this.grid.rowBackground = null;
            }
         }
         if(param2 == this.columnHeaderGroup)
         {
            this.columnHeaderGroup.dataGrid = null;
            this.columnHeaderGroup.removeEventListener(GridEvent.GRID_CLICK,this.columnHeaderGroup_clickHandler);
            this.columnHeaderGroup.removeEventListener(GridEvent.SEPARATOR_ROLL_OVER,this.separator_rollOverHandler);
            this.columnHeaderGroup.removeEventListener(GridEvent.SEPARATOR_ROLL_OUT,this.separator_rollOutHandler);
            this.columnHeaderGroup.removeEventListener(GridEvent.SEPARATOR_MOUSE_DOWN,this.separator_mouseDownHandler);
            this.columnHeaderGroup.removeEventListener(GridEvent.SEPARATOR_MOUSE_DRAG,this.separator_mouseDragHandler);
            this.columnHeaderGroup.removeEventListener(GridEvent.SEPARATOR_MOUSE_UP,this.separator_mouseUpHandler);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedCell() : CellPosition
      {
         if(this.grid)
         {
            return this.grid.selectedCell;
         }
         return !!this.selectedCells.length ? this.selectedCells[0] : null;
      }
      
      public function set selectedCell(param1:CellPosition) : void
      {
         var valueCopy:CellPosition = null;
         var f:Function = null;
         var value:CellPosition = param1;
         if(this.grid)
         {
            this.grid.selectedCell = value;
         }
         else
         {
            valueCopy = !!value ? new CellPosition(value.rowIndex,value.columnIndex) : null;
            f = function(param1:Grid):void
            {
               param1.selectedCell = valueCopy;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedCells() : Vector.<CellPosition>
      {
         return !!this.grid ? this.grid.selectedCells : this.gridSelection.allCells();
      }
      
      public function set selectedCells(param1:Vector.<CellPosition>) : void
      {
         var valueCopy:Vector.<CellPosition> = null;
         var f:Function = null;
         var value:Vector.<CellPosition> = param1;
         if(this.grid)
         {
            this.grid.selectedCells = value;
         }
         else
         {
            valueCopy = !!value ? value.concat() : null;
            f = function(param1:Grid):void
            {
               param1.selectedCells = valueCopy;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedIndex() : int
      {
         if(this.grid)
         {
            return this.grid.selectedIndex;
         }
         return this.selectedIndices.length > 0 ? this.selectedIndices[0] : -1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var f:Function = null;
         var value:int = param1;
         if(this.grid)
         {
            this.grid.selectedIndex = value;
         }
         else
         {
            f = function(param1:Grid):void
            {
               param1.selectedIndex = value;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedIndices() : Vector.<int>
      {
         return !!this.grid ? this.grid.selectedIndices : this.gridSelection.allRows();
      }
      
      public function set selectedIndices(param1:Vector.<int>) : void
      {
         var valueCopy:Vector.<int> = null;
         var f:Function = null;
         var value:Vector.<int> = param1;
         if(this.grid)
         {
            this.grid.selectedIndices = value;
         }
         else
         {
            valueCopy = !!value ? value.concat() : null;
            f = function(param1:Grid):void
            {
               param1.selectedIndices = valueCopy;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedItem() : Object
      {
         if(this.grid)
         {
            return this.grid.selectedItem;
         }
         return Boolean(this.dataProvider) && this.selectedIndex > 0 ? this.dataProvider.getItemAt(this.selectedIndex) : undefined;
      }
      
      public function set selectedItem(param1:Object) : void
      {
         var f:Function = null;
         var value:Object = param1;
         if(this.grid)
         {
            this.grid.selectedItem = value;
         }
         else
         {
            f = function(param1:Grid):void
            {
               param1.selectedItem = value;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectedItems() : Vector.<Object>
      {
         if(this.grid)
         {
            return this.grid.selectedItems;
         }
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:int = 0;
         while(_loc2_ < this.selectedIndices.length)
         {
            _loc1_.push(this.selectedIndices[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set selectedItems(param1:Vector.<Object>) : void
      {
         var valueCopy:Vector.<Object> = null;
         var f:Function = null;
         var value:Vector.<Object> = param1;
         if(this.grid)
         {
            this.grid.selectedItems = value;
         }
         else
         {
            valueCopy = value.concat();
            f = function(param1:Grid):void
            {
               param1.selectedItems = valueCopy;
            };
            this.deferredGridOperations.push(f);
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("selectionChange")]
      public function get selectionLength() : int
      {
         return !!this.grid ? this.grid.selectionLength : this.gridSelection.selectionLength;
      }
      
      public function invalidateCell(param1:int, param2:int) : void
      {
         if(this.grid)
         {
            this.grid.invalidateCell(param1,param2);
         }
      }
      
      public function selectAll() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.grid)
         {
            _loc1_ = this.grid.selectAll();
         }
         else
         {
            _loc1_ = this.gridSelection.selectAll();
            if(_loc1_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc1_;
      }
      
      public function clearSelection() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.grid)
         {
            _loc1_ = this.grid.clearSelection();
         }
         else
         {
            _loc1_ = this.gridSelection.removeAll();
            if(_loc1_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc1_;
      }
      
      public function selectionContainsIndex(param1:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsIndex(param1);
         }
         return this.gridSelection.containsRow(param1);
      }
      
      public function selectionContainsIndices(param1:Vector.<int>) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsIndices(param1);
         }
         return this.gridSelection.containsRows(param1);
      }
      
      public function setSelectedIndex(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid.setSelectedIndex(param1);
         }
         else
         {
            _loc2_ = this.gridSelection.setRow(param1);
            if(_loc2_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function addSelectedIndex(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid.addSelectedIndex(param1);
         }
         else
         {
            _loc2_ = this.gridSelection.addRow(param1);
            if(_loc2_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function removeSelectedIndex(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid.removeSelectedIndex(param1);
         }
         else
         {
            _loc2_ = this.gridSelection.removeRow(param1);
            if(_loc2_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function selectIndices(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid.selectIndices(param1,param2);
         }
         else
         {
            _loc3_ = this.gridSelection.setRows(param1,param2);
            if(_loc3_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function selectionContainsCell(param1:int, param2:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsCell(param1,param2);
         }
         return this.gridSelection.containsCell(param1,param2);
      }
      
      public function selectionContainsCellRegion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsCellRegion(param1,param2,param3,param4);
         }
         return this.gridSelection.containsCellRegion(param1,param2,param3,param4);
      }
      
      public function setSelectedCell(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid.setSelectedCell(param1,param2);
         }
         else
         {
            _loc3_ = this.gridSelection.setCell(param1,param2);
            if(_loc3_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function addSelectedCell(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid.addSelectedCell(param1,param2);
         }
         else
         {
            _loc3_ = this.gridSelection.addCell(param1,param2);
            if(_loc3_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function removeSelectedCell(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid.removeSelectedCell(param1,param2);
         }
         else
         {
            _loc3_ = this.gridSelection.removeCell(param1,param2);
            if(_loc3_)
            {
               this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function selectCellRegion(param1:int, param2:int, param3:uint, param4:uint) : Boolean
      {
         var _loc5_:Boolean = false;
         if(this.grid)
         {
            _loc5_ = this.grid.selectCellRegion(param1,param2,param3,param4);
         }
         else if(_loc5_ = this.gridSelection.setCellRegion(param1,param2,param3,param4))
         {
            this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         }
         return _loc5_;
      }
      
      protected function commitInteractiveSelection(param1:String, param2:int, param3:int, param4:int = 1, param5:int = 1) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(!this.grid)
         {
            return false;
         }
         var _loc6_:CellRegion = new CellRegion(param2,param3,param4,param5);
         if(!this.doesChangeCurrentSelection(param1,_loc6_))
         {
            return true;
         }
         if(hasEventListener(GridSelectionEvent.SELECTION_CHANGING))
         {
            _loc8_ = new GridSelectionEvent(GridSelectionEvent.SELECTION_CHANGING,false,true,param1,_loc6_);
            if(!dispatchEvent(_loc8_))
            {
               return false;
            }
         }
         switch(param1)
         {
            case GridSelectionEventKind.SET_ROW:
               _loc7_ = this.grid.mx_internal::gridSelection.setRow(param2);
               break;
            case GridSelectionEventKind.ADD_ROW:
               _loc7_ = this.grid.mx_internal::gridSelection.addRow(param2);
               break;
            case GridSelectionEventKind.REMOVE_ROW:
               _loc7_ = this.grid.mx_internal::gridSelection.removeRow(param2);
               break;
            case GridSelectionEventKind.SET_ROWS:
               _loc7_ = this.grid.mx_internal::gridSelection.setRows(param2,param4);
               break;
            case GridSelectionEventKind.SET_CELL:
               _loc7_ = this.grid.mx_internal::gridSelection.setCell(param2,param3);
               break;
            case GridSelectionEventKind.ADD_CELL:
               _loc7_ = this.grid.mx_internal::gridSelection.addCell(param2,param3);
               break;
            case GridSelectionEventKind.REMOVE_CELL:
               _loc7_ = this.grid.mx_internal::gridSelection.removeCell(param2,param3);
               break;
            case GridSelectionEventKind.SET_CELL_REGION:
               _loc7_ = this.grid.mx_internal::gridSelection.setCellRegion(param2,param3,param4,param5);
               break;
            case GridSelectionEventKind.SELECT_ALL:
               _loc7_ = this.grid.mx_internal::gridSelection.selectAll();
         }
         if(!_loc7_)
         {
            return false;
         }
         this.grid.mx_internal::invalidateDisplayListFor("selectionIndicator");
         if(hasEventListener(GridSelectionEvent.SELECTION_CHANGE))
         {
            _loc9_ = new GridSelectionEvent(GridSelectionEvent.SELECTION_CHANGE,false,true,param1,_loc6_);
            dispatchEvent(_loc9_);
            if(this.grid.hasEventListener(GridSelectionEvent.SELECTION_CHANGE))
            {
               this.grid.dispatchEvent(_loc9_);
            }
         }
         this.dispatchFlexEvent(FlexEvent.VALUE_COMMIT);
         return true;
      }
      
      protected function commitCaretPosition(param1:int, param2:int) : void
      {
         this.grid.caretRowIndex = param1;
         this.grid.caretColumnIndex = param2;
      }
      
      mx_internal function createGridSelection() : GridSelection
      {
         return new GridSelection();
      }
      
      protected function selectionContainsOnlyIndex(param1:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsIndex(param1) && this.grid.selectionLength == 1;
         }
         return this.gridSelection.containsRow(param1) && this.gridSelection.selectionLength == 1;
      }
      
      protected function selectionContainsOnlyIndices(param1:CellRegion) : Boolean
      {
         var _loc2_:int = !!this.grid ? this.grid.selectionLength : this.gridSelection.selectionLength;
         if(param1.rowCount != _loc2_)
         {
            return false;
         }
         var _loc3_:int = param1.rowIndex + param1.rowCount;
         var _loc4_:int = param1.rowIndex;
         while(_loc4_ < _loc3_)
         {
            if(this.grid)
            {
               if(!this.grid.selectionContainsIndex(_loc4_))
               {
                  return false;
               }
            }
            else if(!this.gridSelection.containsRow(_loc4_))
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      private function selectionContainsOnlyCell(param1:int, param2:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsCell(param1,param2) && this.grid.selectionLength == 1;
         }
         return this.gridSelection.containsCell(param1,param2) && this.gridSelection.selectionLength == 1;
      }
      
      private function selectionContainsOnlyCellRegion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid.selectionContainsCellRegion(param1,param2,param3,param4) && this.grid.selectionLength == param3 * param4;
         }
         return this.gridSelection.containsCellRegion(param1,param2,param3,param4) && this.gridSelection.selectionLength == param3 * param4;
      }
      
      public function startItemEditorSession(param1:int, param2:int) : Boolean
      {
         if(this.mx_internal::editor)
         {
            return this.mx_internal::editor.startItemEditorSession(param1,param2);
         }
         return false;
      }
      
      public function endItemEditorSession(param1:Boolean = false) : Boolean
      {
         if(this.mx_internal::editor)
         {
            return this.mx_internal::editor.endItemEditorSession(param1);
         }
         return false;
      }
      
      mx_internal function createEditor() : DataGridEditor
      {
         return new DataGridEditor(this);
      }
      
      public function sortByColumns(param1:Vector.<int>, param2:Boolean = false) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc3_:ICollectionView = this.dataProvider as ICollectionView;
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:ISort;
         if(_loc4_ = _loc3_.sort)
         {
            _loc4_.compareFunction = null;
         }
         else
         {
            _loc4_ = new Sort();
         }
         var _loc5_:Array;
         if(!(_loc5_ = this.createSortFields(param1,_loc4_.fields,param2)))
         {
            return false;
         }
         var _loc6_:Array = !!_loc3_.sort ? _loc3_.sort.fields : null;
         if(param2)
         {
            if(_loc6_)
            {
               _loc6_ = _loc6_.concat();
            }
            if(hasEventListener(GridSortEvent.SORT_CHANGING))
            {
               _loc8_ = new GridSortEvent(GridSortEvent.SORT_CHANGING,false,true,param1,_loc6_,_loc5_);
               if(!dispatchEvent(_loc8_))
               {
                  return false;
               }
               param1 = _loc8_.columnIndices;
               if(!param1)
               {
                  return false;
               }
               if(!(_loc5_ = _loc8_.newSortFields))
               {
                  return false;
               }
            }
         }
         if(_loc6_)
         {
            for each(_loc9_ in _loc6_)
            {
               if(!(!(_loc10_ = _loc9_ as AdvancedStyleClient) || _loc10_.styleParent != this || _loc5_.indexOf(_loc10_) != -1))
               {
                  removeStyleClient(_loc10_);
               }
            }
         }
         for each(_loc7_ in _loc5_)
         {
            if(!(!(_loc11_ = _loc7_ as AdvancedStyleClient) || _loc11_.styleParent == this))
            {
               addStyleClient(_loc11_);
            }
         }
         _loc4_.fields = _loc5_;
         _loc3_.sort = _loc4_;
         _loc3_.refresh();
         if(param2)
         {
            if(hasEventListener(GridSortEvent.SORT_CHANGE))
            {
               _loc12_ = new GridSortEvent(GridSortEvent.SORT_CHANGE,false,true,param1,_loc6_,_loc5_);
               dispatchEvent(_loc12_);
            }
            if(this.columnHeaderGroup)
            {
               this.columnHeaderGroup.visibleSortIndicatorIndices = param1;
            }
         }
         return true;
      }
      
      private function createSortFields(param1:Vector.<int>, param2:Array, param3:Boolean) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = false;
         if(param1.length == 0)
         {
            return null;
         }
         var _loc4_:Array = new Array();
         for each(_loc5_ in param1)
         {
            if(!(_loc6_ = this.getColumnAt(_loc5_)))
            {
               return null;
            }
            if((_loc7_ = _loc6_.dataField) == null && _loc6_.labelFunction == null && _loc6_.sortCompareFunction == null)
            {
               return null;
            }
            _loc8_ = Boolean(_loc7_) && _loc7_.indexOf(".") != -1;
            _loc9_ = null;
            _loc10_ = _loc6_.sortDescending;
            if(!(_loc9_ = findSortField(_loc7_,_loc4_,_loc8_)) && Boolean(param2))
            {
               _loc9_ = findSortField(_loc7_,param2,_loc8_);
            }
            else
            {
               param3 = false;
            }
            if(_loc9_)
            {
               _loc10_ = !_loc9_.descending;
            }
            if(!_loc9_ || param3)
            {
               _loc9_ = _loc6_.sortField;
            }
            _loc6_.sortDescending = _loc10_;
            _loc9_.descending = _loc10_;
            _loc4_.push(_loc9_);
         }
         return _loc4_;
      }
      
      private function isAnchorSet() : Boolean
      {
         if(!this.grid)
         {
            return false;
         }
         if(this.mx_internal::isRowSelectionMode())
         {
            return this.grid.anchorRowIndex != -1;
         }
         return this.grid.anchorRowIndex != -1 && this.grid.anchorRowIndex != -1;
      }
      
      private function toggleSelection(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = null;
         if(this.mx_internal::isRowSelectionMode())
         {
            if(this.grid.selectionContainsIndex(param1))
            {
               _loc3_ = "null";
            }
            else if(this.selectionMode == GridSelectionMode.MULTIPLE_ROWS)
            {
               _loc3_ = "null";
            }
            else
            {
               _loc3_ = "null";
            }
         }
         else if(this.mx_internal::isCellSelectionMode())
         {
            if(this.grid.selectionContainsCell(param1,param2))
            {
               _loc3_ = "null";
            }
            else if(this.selectionMode == GridSelectionMode.MULTIPLE_CELLS)
            {
               _loc3_ = "null";
            }
            else
            {
               _loc3_ = "null";
            }
         }
         var _loc4_:Boolean;
         if(_loc4_ = this.commitInteractiveSelection(_loc3_,param1,param2))
         {
            this.commitCaretPosition(param1,param2);
         }
         return _loc4_;
      }
      
      private function extendSelection(param1:int, param2:int) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(!this.isAnchorSet())
         {
            return false;
         }
         var _loc3_:int = Math.min(this.grid.anchorRowIndex,param1);
         var _loc4_:int = Math.max(this.grid.anchorRowIndex,param1);
         if(this.selectionMode == GridSelectionMode.MULTIPLE_ROWS)
         {
            _loc5_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_ROWS,_loc3_,-1,_loc4_ - _loc3_ + 1,0);
         }
         else if(this.selectionMode == GridSelectionMode.SINGLE_ROW)
         {
            _loc5_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_ROW,param1,-1,1,0);
         }
         else if(this.selectionMode == GridSelectionMode.MULTIPLE_CELLS)
         {
            _loc6_ = _loc4_ - _loc3_ + 1;
            _loc7_ = Math.min(this.grid.anchorColumnIndex,param2);
            _loc9_ = (_loc8_ = Math.max(this.grid.anchorColumnIndex,param2)) - _loc7_ + 1;
            _loc5_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_CELL_REGION,_loc3_,_loc7_,_loc6_,_loc9_);
         }
         else if(this.selectionMode == GridSelectionMode.SINGLE_CELL)
         {
            _loc5_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_CELL,param1,param2,1,1);
         }
         if(_loc5_)
         {
            this.commitCaretPosition(param1,param2);
         }
         return _loc5_;
      }
      
      private function setSelectionAnchorCaret(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.mx_internal::isRowSelectionMode())
         {
            _loc3_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_ROW,param1,param2);
         }
         else if(this.mx_internal::isCellSelectionMode())
         {
            _loc3_ = this.commitInteractiveSelection(GridSelectionEventKind.SET_CELL,param1,param2);
         }
         if(_loc3_)
         {
            this.commitCaretPosition(param1,param2);
            this.grid.anchorRowIndex = param1;
            this.grid.anchorColumnIndex = param2;
         }
         return _loc3_;
      }
      
      private function setCaretToNavigationDestination(param1:uint) : CellPosition
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc2_:int = this.grid.caretRowIndex;
         var _loc3_:int = this.grid.caretColumnIndex;
         var _loc4_:Boolean = this.mx_internal::isRowSelectionMode();
         var _loc5_:int = this.dataProviderLength;
         var _loc6_:int = this.columnsLength;
         switch(param1)
         {
            case NavigationUnit.LEFT:
               if(this.mx_internal::isCellSelectionMode())
               {
                  if(this.grid.caretColumnIndex > 0)
                  {
                     _loc3_ = this.grid.mx_internal::getPreviousVisibleColumnIndex(_loc3_);
                     break;
                  }
                  break;
               }
               break;
            case NavigationUnit.RIGHT:
               if(this.mx_internal::isCellSelectionMode())
               {
                  if(this.grid.caretColumnIndex + 1 < _loc6_)
                  {
                     _loc3_ = this.grid.mx_internal::getNextVisibleColumnIndex(_loc3_);
                     break;
                  }
                  break;
               }
               break;
            case NavigationUnit.UP:
               if(this.grid.caretRowIndex > 0)
               {
                  _loc2_--;
                  break;
               }
               break;
            case NavigationUnit.DOWN:
               if(this.grid.caretRowIndex + 1 < _loc5_)
               {
                  _loc2_++;
                  break;
               }
               break;
            case NavigationUnit.PAGE_UP:
               if((_loc7_ = this.grid.getVisibleRowIndices()).length == 0)
               {
                  break;
               }
               _loc9_ = _loc7_[0];
               _loc10_ = this.grid.getRowBounds(_loc9_);
               if(_loc9_ < _loc5_ - 1 && _loc10_.top < this.grid.scrollRect.top)
               {
                  _loc9_ = _loc7_[1];
               }
               if(_loc2_ > _loc9_)
               {
                  _loc2_ = _loc9_;
                  break;
               }
               _loc8_ = this.grid.getRowBounds(_loc2_);
               _loc11_ = this.grid.scrollRect.bottom - _loc8_.bottom;
               this.grid.verticalScrollPosition -= _loc11_;
               validateNow();
               _loc9_ = (_loc7_ = this.grid.getVisibleRowIndices())[0];
               if(_loc7_.length > 0)
               {
                  _loc10_ = this.grid.getRowBounds(_loc9_);
                  if(_loc9_ < _loc5_ - 1 && this.grid.scrollRect.top > _loc10_.top)
                  {
                     _loc9_ = _loc7_[1];
                  }
                  _loc2_ = _loc9_;
                  break;
               }
               break;
            case NavigationUnit.PAGE_DOWN:
               if((_loc7_ = this.grid.getVisibleRowIndices()).length == 0)
               {
                  break;
               }
               _loc12_ = Math.min(_loc5_ - 1,_loc7_[_loc7_.length - 1]);
               _loc13_ = this.grid.getRowBounds(_loc12_);
               if(_loc12_ > 0 && this.grid.scrollRect.bottom < _loc13_.bottom)
               {
                  _loc12_ = _loc7_[_loc7_.length - 2];
               }
               if(_loc2_ < _loc12_)
               {
                  _loc2_ = _loc12_;
                  break;
               }
               _loc8_ = this.grid.getRowBounds(_loc2_);
               this.grid.verticalScrollPosition = _loc8_.y;
               validateNow();
               _loc7_ = this.grid.getVisibleRowIndices();
               _loc12_ = Math.min(_loc5_ - 1,_loc7_[_loc7_.length - 1]);
               if(_loc7_.length >= 0)
               {
                  _loc13_ = this.grid.getRowBounds(_loc12_);
                  if(_loc12_ > 0 && this.grid.scrollRect.bottom < _loc13_.bottom)
                  {
                     _loc12_ = _loc7_[_loc7_.length - 2];
                  }
                  _loc2_ = _loc12_;
                  break;
               }
               break;
            case NavigationUnit.HOME:
               _loc2_ = 0;
               _loc3_ = this.mx_internal::isCellSelectionMode() ? this.grid.mx_internal::getNextVisibleColumnIndex(-1) : -1;
               break;
            case NavigationUnit.END:
               _loc2_ = _loc5_ - 1;
               _loc3_ = this.mx_internal::isCellSelectionMode() ? this.grid.mx_internal::getPreviousVisibleColumnIndex(_loc6_) : -1;
               this.grid.verticalScrollPosition = this.grid.contentHeight;
               validateNow();
               if(this.grid.contentHeight != this.grid.verticalScrollPosition)
               {
                  this.grid.verticalScrollPosition = this.grid.contentHeight;
                  validateNow();
                  break;
               }
               break;
            default:
               return null;
         }
         return new CellPosition(_loc2_,_loc3_);
      }
      
      public function ensureCellIsVisible(param1:int, param2:int = -1) : void
      {
         if(this.grid)
         {
            this.grid.ensureCellIsVisible(param1,param2);
         }
      }
      
      protected function adjustSelectionUponNavigation(param1:KeyboardEvent) : Boolean
      {
         var _loc2_:* = 0;
         if(!NavigationUnit.isNavigationUnit(param1.keyCode))
         {
            return false;
         }
         _loc2_ = uint(mx_internal::mapKeycodeForLayoutDirection(param1));
         var _loc3_:CellPosition = this.setCaretToNavigationDestination(_loc2_);
         if(!_loc3_)
         {
            return false;
         }
         param1.preventDefault();
         var _loc4_:Boolean = false;
         if(param1.shiftKey)
         {
            _loc4_ = this.extendSelection(_loc3_.rowIndex,_loc3_.columnIndex);
         }
         else if(param1.ctrlKey)
         {
            this.commitCaretPosition(_loc3_.rowIndex,_loc3_.columnIndex);
         }
         else
         {
            this.setSelectionAnchorCaret(_loc3_.rowIndex,_loc3_.columnIndex);
         }
         this.ensureCellIsVisible(_loc3_.rowIndex,_loc3_.columnIndex);
         return true;
      }
      
      private function doesChangeCurrentSelection(param1:String, param2:CellRegion) : Boolean
      {
         var _loc3_:* = false;
         var _loc4_:int = param2.rowIndex;
         var _loc5_:int = param2.columnIndex;
         var _loc6_:int = param2.rowCount;
         var _loc7_:int = param2.columnCount;
         switch(param1)
         {
            case GridSelectionEventKind.SET_ROW:
               _loc3_ = !this.selectionContainsOnlyIndex(_loc4_);
               break;
            case GridSelectionEventKind.ADD_ROW:
               _loc3_ = !this.grid.selectionContainsIndex(_loc4_);
               break;
            case GridSelectionEventKind.REMOVE_ROW:
               _loc3_ = this.requireSelection ? !this.selectionContainsOnlyIndex(_loc4_) : this.grid.selectionContainsIndex(_loc4_);
               break;
            case GridSelectionEventKind.SET_ROWS:
               _loc3_ = !this.selectionContainsOnlyIndices(param2);
               break;
            case GridSelectionEventKind.SET_CELL:
               _loc3_ = !this.selectionContainsOnlyCell(_loc4_,_loc5_);
               break;
            case GridSelectionEventKind.ADD_CELL:
               _loc3_ = !this.grid.selectionContainsCell(_loc4_,_loc5_);
               break;
            case GridSelectionEventKind.REMOVE_CELL:
               _loc3_ = this.requireSelection ? !this.selectionContainsOnlyCell(_loc4_,_loc5_) : this.grid.selectionContainsCell(_loc4_,_loc5_);
               break;
            case GridSelectionEventKind.SET_CELL_REGION:
               _loc3_ = !this.selectionContainsOnlyCellRegion(_loc4_,_loc5_,_loc6_,_loc7_);
               break;
            case GridSelectionEventKind.SELECT_ALL:
               _loc3_ = true;
         }
         return _loc3_;
      }
      
      protected function grid_rollOverHandler(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.buttonDown && param1.relatedObject != this.grid)
         {
            this.updateHoverOnRollOver = false;
         }
         this.grid.hoverRowIndex = this.updateHoverOnRollOver ? param1.rowIndex : -1;
         this.grid.hoverColumnIndex = this.updateHoverOnRollOver ? param1.columnIndex : -1;
         param1.updateAfterEvent();
      }
      
      protected function grid_rollOutHandler(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         this.grid.hoverRowIndex = -1;
         this.grid.hoverColumnIndex = -1;
         this.updateHoverOnRollOver = true;
         param1.updateAfterEvent();
      }
      
      protected function grid_mouseUpHandler(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(!this.updateHoverOnRollOver)
         {
            this.grid.hoverRowIndex = param1.rowIndex;
            this.grid.hoverColumnIndex = param1.columnIndex;
            this.updateHoverOnRollOver = true;
         }
      }
      
      protected function grid_mouseDownHandler(param1:GridEvent) : void
      {
         var _loc2_:Boolean = false;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         _loc2_ = this.mx_internal::isCellSelectionMode();
         var _loc3_:int = param1.rowIndex;
         var _loc4_:int = _loc2_ ? param1.columnIndex : -1;
         if(_loc3_ == -1 || _loc2_ && _loc4_ == -1)
         {
            return;
         }
         if(param1.ctrlKey)
         {
            if(!this.toggleSelection(_loc3_,_loc4_))
            {
               return;
            }
            this.grid.anchorRowIndex = _loc3_;
            this.grid.anchorColumnIndex = _loc4_;
         }
         else if(param1.shiftKey)
         {
            if(this.grid.selectionMode == GridSelectionMode.MULTIPLE_ROWS || this.grid.selectionMode == GridSelectionMode.MULTIPLE_CELLS)
            {
               if(!this.extendSelection(_loc3_,_loc4_))
               {
                  return;
               }
            }
         }
         else
         {
            this.setSelectionAnchorCaret(_loc3_,_loc4_);
         }
      }
      
      protected function grid_caretChangeHandler(param1:GridCaretEvent) : void
      {
         if(hasEventListener(GridCaretEvent.CARET_CHANGE))
         {
            dispatchEvent(param1);
         }
      }
      
      protected function grid_valueCommitHandler(param1:FlexEvent) : void
      {
         if(hasEventListener(FlexEvent.VALUE_COMMIT))
         {
            dispatchEvent(param1);
         }
      }
      
      private function grid_invalidateDisplayListHandler(param1:Event) : void
      {
         if(Boolean(this.columnHeaderGroup) && this.grid.mx_internal::isInvalidateDisplayListReason("horizontalScrollPosition"))
         {
            this.columnHeaderGroup.invalidateDisplayList();
         }
      }
      
      private function grid_invalidateSizeHandler(param1:Event) : void
      {
         if(this.columnHeaderGroup)
         {
            this.columnHeaderGroup.invalidateSize();
         }
      }
      
      protected function columnHeaderGroup_clickHandler(param1:GridEvent) : void
      {
         var _loc2_:GridColumn = param1.column;
         if(!enabled || !this.sortableColumns || !_loc2_ || !_loc2_.sortable)
         {
            return;
         }
         var _loc3_:Vector.<int> = Vector.<int>([_loc2_.columnIndex]);
         this.sortByColumns(_loc3_,true);
      }
      
      protected function separator_mouseDownHandler(param1:GridEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc2_:GridColumn = param1.column;
         if(!enabled || !this.grid.resizableColumns || !_loc2_ || !_loc2_.resizable)
         {
            return;
         }
         this.resizeColumn = param1.column;
         this.resizeAnchorX = param1.localX;
         this.resizeColumnWidth = this.grid.getColumnWidth(this.resizeColumn.columnIndex);
         if(isNaN(explicitWidth) && layoutDirection == LayoutDirection.RTL)
         {
            _loc5_ = this.grid.mx_internal::getNextVisibleColumnIndex(this.resizeColumn.columnIndex);
            this.nextColumn = this.getColumnAt(_loc5_);
            this.nextColumnWidth = Math.ceil(this.grid.getColumnWidth(_loc5_));
         }
         else
         {
            this.nextColumn = null;
            this.nextColumnWidth = NaN;
         }
         var _loc3_:int = this.resizeColumn.columnIndex;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc6_ = this.getColumnAt(_loc4_)).visible && isNaN(_loc6_.width))
            {
               _loc6_.width = this.grid.getColumnWidth(_loc4_);
            }
            _loc4_++;
         }
      }
      
      protected function separator_mouseDragHandler(param1:GridEvent) : void
      {
         var _loc6_:Number = NaN;
         if(!this.resizeColumn)
         {
            return;
         }
         var _loc2_:Number = param1.localX - this.resizeAnchorX;
         var _loc3_:Number = isNaN(this.resizeColumn.minWidth) ? 0 : this.resizeColumn.minWidth;
         var _loc4_:Number = this.resizeColumn.maxWidth;
         var _loc5_:Number = Math.ceil(this.resizeColumnWidth + _loc2_);
         if(this.nextColumn)
         {
            _loc6_ = isNaN(this.nextColumn.minWidth) ? 0 : this.nextColumn.minWidth;
            if(Math.ceil(this.nextColumnWidth - _loc2_) <= _loc6_)
            {
               return;
            }
            if(Math.ceil(this.resizeColumnWidth + _loc2_) <= _loc3_)
            {
               return;
            }
            this.nextColumn.width = this.nextColumnWidth - _loc2_;
         }
         _loc5_ = Math.max(_loc5_,_loc3_);
         if(!isNaN(_loc4_))
         {
            _loc5_ = Math.min(_loc5_,_loc4_);
         }
         this.resizeColumn.width = _loc5_;
         param1.updateAfterEvent();
      }
      
      protected function separator_mouseUpHandler(param1:GridEvent) : void
      {
         if(!this.resizeColumn)
         {
            return;
         }
         this.resizeColumn = null;
      }
      
      protected function separator_rollOverHandler(param1:GridEvent) : void
      {
         var _loc2_:GridColumn = param1.column;
         if(!enabled || !this.grid.resizableColumns || !_loc2_ || !_loc2_.resizable)
         {
            return;
         }
         var _loc3_:Class = getStyle("stretchCursor") as Class;
         if(_loc3_)
         {
            this.stretchCursorID = cursorManager.setCursor(_loc3_,CursorManagerPriority.HIGH,0,0);
         }
      }
      
      protected function separator_rollOutHandler(param1:GridEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         cursorManager.removeCursor(this.stretchCursorID);
      }
      
      protected function dataGrid_focusHandler(param1:FocusEvent) : void
      {
         if(!this.grid || !(this.grid.layout is GridLayout))
         {
            return;
         }
         if(this.isOurFocus(DisplayObject(param1.target)))
         {
            GridLayout(this.grid.layout).showCaret = param1.type == FocusEvent.FOCUS_IN && this.selectionMode != GridSelectionMode.NONE;
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get alternatingRowColorsBackground() : IFactory
      {
         return this._1277490047alternatingRowColorsBackground;
      }
      
      [SkinPart(required="false")]
      public function set alternatingRowColorsBackground(param1:IFactory) : void
      {
         var _loc2_:Object = this._1277490047alternatingRowColorsBackground;
         if(_loc2_ !== param1)
         {
            this._1277490047alternatingRowColorsBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"alternatingRowColorsBackground",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get caretIndicator() : IFactory
      {
         return this._502679092caretIndicator;
      }
      
      [SkinPart(required="false")]
      public function set caretIndicator(param1:IFactory) : void
      {
         var _loc2_:Object = this._502679092caretIndicator;
         if(_loc2_ !== param1)
         {
            this._502679092caretIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caretIndicator",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(required="false")]
      [Bindable(event="propertyChange")]
      public function get columnHeaderGroup() : GridColumnHeaderGroup
      {
         return this._1482148164columnHeaderGroup;
      }
      
      [SkinPart(required="false")]
      public function set columnHeaderGroup(param1:GridColumnHeaderGroup) : void
      {
         var _loc2_:Object = this._1482148164columnHeaderGroup;
         if(_loc2_ !== param1)
         {
            this._1482148164columnHeaderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnHeaderGroup",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get columnSeparator() : IFactory
      {
         return this._237342767columnSeparator;
      }
      
      [SkinPart(required="false")]
      public function set columnSeparator(param1:IFactory) : void
      {
         var _loc2_:Object = this._237342767columnSeparator;
         if(_loc2_ !== param1)
         {
            this._237342767columnSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnSeparator",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get editorIndicator() : IFactory
      {
         return this._1555036382editorIndicator;
      }
      
      [SkinPart(required="false")]
      public function set editorIndicator(param1:IFactory) : void
      {
         var _loc2_:Object = this._1555036382editorIndicator;
         if(_loc2_ !== param1)
         {
            this._1555036382editorIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editorIndicator",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(required="false")]
      [Bindable(event="propertyChange")]
      public function get grid() : Grid
      {
         return this._3181382grid;
      }
      
      [SkinPart(required="false")]
      public function set grid(param1:Grid) : void
      {
         var _loc2_:Object = this._3181382grid;
         if(_loc2_ !== param1)
         {
            this._3181382grid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"grid",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get hoverIndicator() : IFactory
      {
         return this._1933789133hoverIndicator;
      }
      
      [SkinPart(required="false")]
      public function set hoverIndicator(param1:IFactory) : void
      {
         var _loc2_:Object = this._1933789133hoverIndicator;
         if(_loc2_ !== param1)
         {
            this._1933789133hoverIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoverIndicator",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get rowBackground() : IFactory
      {
         return this._367467864rowBackground;
      }
      
      [SkinPart(required="false")]
      public function set rowBackground(param1:IFactory) : void
      {
         var _loc2_:Object = this._367467864rowBackground;
         if(_loc2_ !== param1)
         {
            this._367467864rowBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowBackground",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get rowSeparator() : IFactory
      {
         return this._1763950123rowSeparator;
      }
      
      [SkinPart(required="false")]
      public function set rowSeparator(param1:IFactory) : void
      {
         var _loc2_:Object = this._1763950123rowSeparator;
         if(_loc2_ !== param1)
         {
            this._1763950123rowSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowSeparator",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(required="false")]
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      [SkinPart(required="false")]
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [SkinPart(type="mx.core.IVisualElement",required="false")]
      [Bindable(event="propertyChange")]
      public function get selectionIndicator() : IFactory
      {
         return this._627206627selectionIndicator;
      }
      
      [SkinPart(required="false")]
      public function set selectionIndicator(param1:IFactory) : void
      {
         var _loc2_:Object = this._627206627selectionIndicator;
         if(_loc2_ !== param1)
         {
            this._627206627selectionIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionIndicator",_loc2_,param1));
            }
         }
      }
   }
}
