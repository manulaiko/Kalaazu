package spark.components.gridClasses
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.describeType;
   import mx.collections.ICollectionView;
   import mx.collections.ISort;
   import mx.core.IIMESupport;
   import mx.core.IInvalidating;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.mx_internal;
   import mx.validators.IValidatorListener;
   import spark.components.DataGrid;
   import spark.components.Group;
   
   public class GridItemEditor extends Group implements IGridItemEditor
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _column:GridColumn;
      
      private var _data:Object = null;
      
      private var _imeMode:String = null;
      
      private var _itemRenderer:IGridItemRenderer;
      
      private var _rowIndex:int;
      
      private var _value:Object;
      
      public function GridItemEditor()
      {
         super();
      }
      
      public function get column() : GridColumn
      {
         return this._column;
      }
      
      public function set column(param1:GridColumn) : void
      {
         this._column = param1;
      }
      
      public function get columnIndex() : int
      {
         return this.column.columnIndex;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(Boolean(this._data) && Boolean(this.column.dataField))
         {
            this.value = this._data[this.column.dataField];
         }
      }
      
      public function get dataGrid() : DataGrid
      {
         return DataGrid(owner);
      }
      
      public function get enableIME() : Boolean
      {
         return true;
      }
      
      public function get imeMode() : String
      {
         return this._imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         var _loc4_:* = null;
         this._imeMode = param1;
         var _loc2_:int = numElements;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = getElementAt(_loc3_) as IIMESupport)
            {
               _loc4_.imeMode = param1;
            }
            _loc3_++;
         }
      }
      
      public function get itemRenderer() : IGridItemRenderer
      {
         return this._itemRenderer;
      }
      
      public function set itemRenderer(param1:IGridItemRenderer) : void
      {
         this._itemRenderer = param1;
      }
      
      public function get rowIndex() : int
      {
         return this._rowIndex;
      }
      
      public function set rowIndex(param1:int) : void
      {
         this._rowIndex = param1;
      }
      
      [Bindable("valueChanged")]
      public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(param1:Object) : void
      {
         if(param1 != this.value)
         {
            this._value = param1;
            if(hasEventListener("valueChanged"))
            {
               dispatchEvent(new Event("valueChanged"));
            }
         }
      }
      
      public function discard() : void
      {
         this.clearErrorStringFromContainer(this);
         removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpDownMoveHandler);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseUpDownMoveHandler);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      public function prepare() : void
      {
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUpDownMoveHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseUpDownMoveHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      public function save() : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(!this.validate())
         {
            return false;
         }
         var _loc1_:Object = this.value;
         var _loc2_:String = this.column.dataField;
         var _loc3_:Object = this.data;
         var _loc4_:String = "";
         for each(_loc5_ in describeType(_loc3_).variable)
         {
            if(_loc2_ == _loc5_.@name.toString())
            {
               _loc4_ = _loc5_.@type.toString();
               break;
            }
         }
         if(_loc4_ == "String")
         {
            if(!(_loc1_ is String))
            {
               _loc1_ = _loc1_.toString();
            }
         }
         else if(_loc4_ == "uint")
         {
            if(!(_loc1_ is uint))
            {
               _loc1_ = uint(_loc1_);
            }
         }
         else if(_loc4_ == "int")
         {
            if(!(_loc1_ is int))
            {
               _loc1_ = int(_loc1_);
            }
         }
         else if(_loc4_ == "Number")
         {
            if(!(_loc1_ is Number))
            {
               _loc1_ = Number(_loc1_);
            }
         }
         else if(_loc4_ == "Boolean")
         {
            if(!(_loc1_ is Boolean))
            {
               if(_loc6_ = _loc1_.toString())
               {
                  _loc1_ = _loc6_.toLowerCase() == "true" ? true : false;
               }
            }
         }
         if(Boolean(_loc2_) && _loc3_[_loc2_] !== _loc1_)
         {
            _loc7_ = null;
            if(this.dataGrid.dataProvider is ICollectionView)
            {
               if((_loc9_ = ICollectionView(this.dataGrid.dataProvider)).sort)
               {
                  _loc7_ = _loc9_.sort;
                  _loc9_.sort = null;
               }
            }
            _loc8_ = _loc3_[_loc2_];
            _loc3_[_loc2_] = _loc1_;
            this.dataGrid.dataProvider.itemUpdated(_loc3_,_loc2_,_loc8_,_loc1_);
            if(_loc7_)
            {
               ICollectionView(this.dataGrid.dataProvider).sort = _loc7_;
            }
         }
         return true;
      }
      
      protected function validate() : Boolean
      {
         return this.validateContainer(this);
      }
      
      private function validateContainer(param1:IVisualElementContainer) : Boolean
      {
         var _loc4_:* = null;
         if(param1 is IValidatorListener && Boolean(IValidatorListener(param1).errorString))
         {
            return false;
         }
         var _loc2_:int = param1.numElements;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.getElementAt(_loc3_)) is IValidatorListener && Boolean(IValidatorListener(_loc4_).errorString))
            {
               return false;
            }
            if(_loc4_ is IVisualElementContainer && !this.validateContainer(IVisualElementContainer(_loc4_)))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function clearErrorStringFromContainer(param1:IVisualElementContainer) : void
      {
         var _loc4_:* = null;
         if(param1 is IValidatorListener && Boolean(IValidatorListener(param1).errorString))
         {
            this.clearErrorString(IValidatorListener(param1));
         }
         var _loc2_:int = param1.numElements;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.getElementAt(_loc3_)) is IValidatorListener && Boolean(IValidatorListener(_loc4_).errorString))
            {
               this.clearErrorString(IValidatorListener(_loc4_));
            }
            if(_loc4_ is IVisualElementContainer)
            {
               this.clearErrorStringFromContainer(IVisualElementContainer(_loc4_));
            }
            _loc3_++;
         }
      }
      
      private function clearErrorString(param1:IValidatorListener) : void
      {
         param1.errorString = "";
         if(param1 is IInvalidating)
         {
            IInvalidating(param1).validateNow();
         }
      }
      
      private function mouseUpDownMoveHandler(param1:MouseEvent) : void
      {
         if(param1.cancelable)
         {
            param1.preventDefault();
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = this.dataGrid.parent.globalToLocal(new Point(param1.stageX,param1.stageY));
         param1.localX = _loc2_.x;
         param1.localY = _loc2_.y;
         this.dataGrid.parent.dispatchEvent(param1);
         param1.stopPropagation();
      }
   }
}
