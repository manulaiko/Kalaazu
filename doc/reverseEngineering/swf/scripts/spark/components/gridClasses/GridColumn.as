package spark.components.gridClasses
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.ClassFactory;
   import mx.core.IFactory;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.formatters.IFormatter;
   import mx.styles.IAdvancedStyleClient;
   import mx.utils.ObjectUtil;
   import spark.collections.SortField;
   import spark.components.Grid;
   
   public class GridColumn extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const ERROR_TEXT:String = new String(" ");
      
      private static var _defaultItemEditorFactory:IFactory;
       
      
      private var _grid:Grid = null;
      
      private var _columnIndex:int = -1;
      
      private var _dataField:String = null;
      
      private var dataFieldPath:Array;
      
      private var _dataTipField:String = null;
      
      private var _dataTipFormatter:IFormatter = null;
      
      private var dataTipFormatterStyleParentInvalid:Boolean = false;
      
      private var _dataTipFunction:Function = null;
      
      private var _editable:Boolean = true;
      
      private var _formatter:IFormatter = null;
      
      private var formatterStyleParentInvalid:Boolean = false;
      
      private var _headerRenderer:IFactory = null;
      
      private var _headerText:String;
      
      private var _imeMode:String = null;
      
      private var _itemEditor:IFactory = null;
      
      private var _itemRenderer:IFactory = null;
      
      private var _itemRendererFunction:Function = null;
      
      private var _labelFunction:Function = null;
      
      private var _width:Number = NaN;
      
      private var _minWidth:Number = 20;
      
      private var _maxWidth:Number = NaN;
      
      private var _rendererIsEditable:Boolean = false;
      
      private var _resizable:Boolean = true;
      
      private var _showDataTips;
      
      private var _sortable:Boolean = true;
      
      private var _sortCompareFunction:Function;
      
      private var _sortDescending:Boolean = false;
      
      private var _visible:Boolean = true;
      
      public function GridColumn(param1:String = null)
      {
         this.dataFieldPath = [];
         super();
         if(param1)
         {
            this.dataField = this.headerText = param1;
         }
      }
      
      mx_internal static function get defaultItemEditorFactory() : IFactory
      {
         if(!_defaultItemEditorFactory)
         {
            _defaultItemEditorFactory = new ClassFactory(DefaultGridItemEditor);
         }
         return _defaultItemEditorFactory;
      }
      
      private static function dataFieldPathSortCompare(param1:Object, param2:Object, param3:GridColumn) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!param1 && !param2)
         {
            return 0;
         }
         if(!param1)
         {
            return 1;
         }
         if(!param2)
         {
            return -1;
         }
         _loc4_ = param3.dataField.split(".");
         _loc5_ = param3.formatter;
         var _loc6_:String = param3.itemToString(param1,_loc4_,null,_loc5_);
         var _loc7_:String = param3.itemToString(param2,_loc4_,null,_loc5_);
         if(_loc6_ < _loc7_)
         {
            return -1;
         }
         if(_loc6_ > _loc7_)
         {
            return 1;
         }
         return 0;
      }
      
      mx_internal function setGrid(param1:Grid) : void
      {
         if(this._grid == param1)
         {
            return;
         }
         this._grid = param1;
         this.dispatchChangeEvent("gridChanged");
      }
      
      [Bindable("gridChanged")]
      public function get grid() : Grid
      {
         return this._grid;
      }
      
      mx_internal function setColumnIndex(param1:int) : void
      {
         if(this._columnIndex == param1)
         {
            return;
         }
         this._columnIndex = param1;
         this.dispatchChangeEvent("columnIndexChanged");
      }
      
      [Bindable("columnIndexChanged")]
      public function get columnIndex() : int
      {
         return this._columnIndex;
      }
      
      [Bindable("dataFieldChanged")]
      public function get dataField() : String
      {
         return this._dataField;
      }
      
      public function set dataField(param1:String) : void
      {
         if(this._dataField == param1)
         {
            return;
         }
         this._dataField = param1;
         if(param1 == null)
         {
            this.dataFieldPath = [];
         }
         else if(param1.indexOf(".") != -1)
         {
            this.dataFieldPath = param1.split(".");
         }
         else
         {
            this.dataFieldPath = [param1];
         }
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.mx_internal::clearGridLayoutCache(true);
         }
         this.dispatchChangeEvent("dataFieldChanged");
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
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("dataTipFieldChanged");
      }
      
      [Bindable("dataTipFormatterChanged")]
      public function get dataTipFormatter() : IFormatter
      {
         var _loc1_:* = null;
         if(this.dataTipFormatterStyleParentInvalid && Boolean(this.grid))
         {
            _loc1_ = this._dataTipFormatter as IAdvancedStyleClient;
            if(Boolean(_loc1_) && _loc1_.styleParent != this.grid)
            {
               this.grid.addStyleClient(_loc1_);
            }
            this.dataTipFormatterStyleParentInvalid = false;
         }
         return this._dataTipFormatter;
      }
      
      public function set dataTipFormatter(param1:IFormatter) : void
      {
         var _loc2_:* = null;
         if(this._dataTipFormatter == param1)
         {
            return;
         }
         if(Boolean(this.grid) && Boolean(this._dataTipFormatter))
         {
            _loc2_ = this._dataTipFormatter as IAdvancedStyleClient;
            if(Boolean(_loc2_) && _loc2_.styleParent == this.grid)
            {
               this.grid.removeStyleClient(_loc2_);
            }
         }
         this._dataTipFormatter = param1;
         this.dataTipFormatterStyleParentInvalid = true;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("dataTipFormatterChanged");
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
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("dataTipFunctionChanged");
      }
      
      [Bindable("editableChanged")]
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._editable == param1)
         {
            return;
         }
         this._editable = param1;
         this.dispatchChangeEvent("editableChanged");
      }
      
      [Bindable("formatterChanged")]
      public function get formatter() : IFormatter
      {
         var _loc1_:* = null;
         if(this.formatterStyleParentInvalid && Boolean(this.grid))
         {
            _loc1_ = this._formatter as IAdvancedStyleClient;
            if(Boolean(_loc1_) && _loc1_.styleParent != this.grid)
            {
               this.grid.addStyleClient(_loc1_);
            }
            this.formatterStyleParentInvalid = false;
         }
         return this._formatter;
      }
      
      public function set formatter(param1:IFormatter) : void
      {
         var _loc2_:* = null;
         if(this._formatter == param1)
         {
            return;
         }
         if(Boolean(this.grid) && Boolean(this._formatter))
         {
            _loc2_ = this._formatter as IAdvancedStyleClient;
            if(Boolean(_loc2_) && _loc2_.styleParent == this.grid)
            {
               this.grid.removeStyleClient(_loc2_);
            }
         }
         this._formatter = param1;
         this.formatterStyleParentInvalid = true;
         if(this.grid)
         {
            this.invalidateGrid();
            this.grid.mx_internal::clearGridLayoutCache(true);
         }
         this.dispatchChangeEvent("formatterChanged");
      }
      
      [Bindable("headerRendererChanged")]
      public function get headerRenderer() : IFactory
      {
         return this._headerRenderer;
      }
      
      public function set headerRenderer(param1:IFactory) : void
      {
         if(this._headerRenderer == param1)
         {
            return;
         }
         this._headerRenderer = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("headerRendererChanged");
      }
      
      [Bindable("headerTextChanged")]
      public function get headerText() : String
      {
         return this._headerText != null ? this._headerText : (!!this.dataField ? this.dataField : "");
      }
      
      public function set headerText(param1:String) : void
      {
         this._headerText = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("headerTextChanged");
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
      
      [Bindable("itemRendererChanged")]
      public function get itemRenderer() : IFactory
      {
         return !!this._itemRenderer ? this._itemRenderer : this.grid.itemRenderer;
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         if(this._itemRenderer == param1)
         {
            return;
         }
         this._itemRenderer = param1;
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.mx_internal::clearGridLayoutCache(true);
         }
         this.dispatchChangeEvent("itemRendererChanged");
      }
      
      [Bindable("itemRendererFunctionChanged")]
      public function get itemRendererFunction() : Function
      {
         return this._itemRendererFunction;
      }
      
      public function set itemRendererFunction(param1:Function) : void
      {
         if(this._itemRendererFunction == param1)
         {
            return;
         }
         this._itemRendererFunction = param1;
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.mx_internal::clearGridLayoutCache(true);
         }
         this.dispatchChangeEvent("itemRendererFunctionChanged");
      }
      
      [Bindable("labelFunctionChanged")]
      public function get labelFunction() : Function
      {
         return this._labelFunction;
      }
      
      public function set labelFunction(param1:Function) : void
      {
         if(this._labelFunction == param1)
         {
            return;
         }
         this._labelFunction = param1;
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.mx_internal::clearGridLayoutCache(true);
         }
         this.dispatchChangeEvent("labelFunctionChanged");
      }
      
      [Bindable("widthChanged")]
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         if(this._width == param1)
         {
            return;
         }
         this._width = param1;
         this.invalidateGrid();
         this.dispatchChangeEvent("widthChanged");
      }
      
      [Bindable("minWidthChanged")]
      public function get minWidth() : Number
      {
         return this._minWidth;
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(this._minWidth == param1)
         {
            return;
         }
         this._minWidth = param1;
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.setContentSize(0,0);
         }
         this.dispatchChangeEvent("minWidthChanged");
      }
      
      [Bindable("maxWidthChanged")]
      public function get maxWidth() : Number
      {
         return this._maxWidth;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(this._maxWidth == param1)
         {
            return;
         }
         this._maxWidth = param1;
         this.invalidateGrid();
         if(this.grid)
         {
            this.grid.setContentSize(0,0);
         }
         this.dispatchChangeEvent("maxWidthChanged");
      }
      
      [Bindable("rendererIsEditableChanged")]
      public function get rendererIsEditable() : Boolean
      {
         return this._rendererIsEditable;
      }
      
      public function set rendererIsEditable(param1:Boolean) : void
      {
         if(this._rendererIsEditable == param1)
         {
            return;
         }
         this._rendererIsEditable = param1;
         this.dispatchChangeEvent("rendererIsEditableChanged");
      }
      
      [Bindable("resizableChanged")]
      public function get resizable() : Boolean
      {
         return this._resizable;
      }
      
      public function set resizable(param1:Boolean) : void
      {
         if(this._resizable == param1)
         {
            return;
         }
         this._resizable = param1;
         this.dispatchChangeEvent("resizableChanged");
      }
      
      [Bindable("showDataTipsChanged")]
      public function get showDataTips() : *
      {
         return this._showDataTips;
      }
      
      public function set showDataTips(param1:*) : void
      {
         if(this._showDataTips === param1)
         {
            return;
         }
         this._showDataTips = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this.dispatchChangeEvent("showDataTipsChanged");
      }
      
      mx_internal function getShowDataTips() : Boolean
      {
         return this.showDataTips === undefined ? Boolean(this.grid) && this.grid.showDataTips : this.showDataTips;
      }
      
      [Bindable("sortableChanged")]
      public function get sortable() : Boolean
      {
         return this._sortable;
      }
      
      public function set sortable(param1:Boolean) : void
      {
         if(this._sortable == param1)
         {
            return;
         }
         this._sortable = param1;
         this.dispatchChangeEvent("sortableChanged");
      }
      
      [Bindable("sortCompareFunctionChanged")]
      public function get sortCompareFunction() : Function
      {
         return this._sortCompareFunction;
      }
      
      public function set sortCompareFunction(param1:Function) : void
      {
         if(this._sortCompareFunction == param1)
         {
            return;
         }
         this._sortCompareFunction = param1;
         this.dispatchChangeEvent("sortCompareFunctionChanged");
      }
      
      [Bindable("sortDescendingChanged")]
      public function get sortDescending() : Boolean
      {
         return this._sortDescending;
      }
      
      public function set sortDescending(param1:Boolean) : void
      {
         if(this._sortDescending == param1)
         {
            return;
         }
         this._sortDescending = param1;
         this.dispatchChangeEvent("sortDescendingChanged");
      }
      
      public function get sortField() : SortField
      {
         var cF:Function;
         var column:GridColumn = null;
         var sortField:SortField = null;
         column = {};
         var isComplexDataField:Boolean = this.dataFieldPath.length > 1;
         if(isComplexDataField)
         {
            sortField = new GridSortField();
            GridSortField(sortField).dataFieldPath = this.dataField;
         }
         else
         {
            sortField = new SortField(this.dataField);
         }
         cF = null;
         if(this._sortCompareFunction != null)
         {
            cF = function(param1:Object, param2:Object):int
            {
               return _sortCompareFunction(param1,param2,column);
            };
         }
         else if(isComplexDataField)
         {
            cF = function(param1:Object, param2:Object):int
            {
               return dataFieldPathSortCompare(param1,param2,column);
            };
         }
         else if(this.dataField == null && this._labelFunction != null)
         {
            cF = function(param1:Object, param2:Object):int
            {
               return ObjectUtil.stringCompare(_labelFunction(param1,column),_labelFunction(param2,column));
            };
         }
         sortField.compareFunction = cF;
         sortField.descending = column.sortDescending;
         return sortField;
      }
      
      [Bindable("visibleChanged")]
      public function get visible() : Boolean
      {
         return this._visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._visible == param1)
         {
            return;
         }
         this._visible = param1;
         if(Boolean(this.grid) && Boolean(this.grid.columns))
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"visible",!this._visible,this._visible);
            _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc3_.kind = CollectionEventKind.UPDATE;
            _loc3_.items.push(_loc2_);
            this.grid.columns.dispatchEvent(_loc3_);
         }
         this.dispatchChangeEvent("visibleChanged");
      }
      
      private function itemToString(param1:Object, param2:Array, param3:Function, param4:IFormatter) : String
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(!param1)
         {
            return ERROR_TEXT;
         }
         if(param3 != null)
         {
            return param3(param1,this);
         }
         var _loc5_:* = null;
         try
         {
            _loc6_ = param1;
            for each(_loc7_ in param2)
            {
               _loc6_ = _loc6_[_loc7_];
            }
            if(_loc6_ != null && param2.length > 0)
            {
               _loc5_ = !!param4 ? param4.format(_loc6_) : _loc6_.toString();
            }
         }
         catch(ignored:Error)
         {
         }
         return _loc5_ != null ? _loc5_ : ERROR_TEXT;
      }
      
      public function itemToLabel(param1:Object) : String
      {
         return this.itemToString(param1,this.dataFieldPath,this.labelFunction,this.formatter);
      }
      
      public function itemToDataTip(param1:Object) : String
      {
         var _loc2_:Function = this.dataTipFunction != null ? this.dataTipFunction : this.grid.dataTipFunction;
         var _loc3_:String = !!this.dataTipField ? this.dataTipField : this.grid.dataTipField;
         var _loc4_:Array = !!_loc3_ ? [_loc3_] : this.dataFieldPath;
         return this.itemToString(param1,_loc4_,_loc2_,this.dataTipFormatter);
      }
      
      public function itemToRenderer(param1:Object) : IFactory
      {
         var _loc2_:Function = this.itemRendererFunction;
         return _loc2_ != null ? _loc2_(param1,this) : this.itemRenderer;
      }
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      private function invalidateGrid() : void
      {
         if(this.grid)
         {
            this.grid.invalidateSize();
            this.grid.invalidateDisplayList();
         }
      }
   }
}
