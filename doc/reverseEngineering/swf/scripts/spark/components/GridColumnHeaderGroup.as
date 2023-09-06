package spark.components
{
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.collections.IList;
   import mx.core.IFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridColumnHeaderGroupLayout;
   import spark.components.gridClasses.IDataGridElement;
   import spark.components.gridClasses.IGridItemRenderer;
   import spark.events.GridEvent;
   import spark.utils.MouseEventUtil;
   
   public class GridColumnHeaderGroup extends Group implements IDataGridElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _columnSeparator:IFactory = null;
      
      private var _dataGrid:DataGrid = null;
      
      private var _downColumnIndex:int = -1;
      
      private var _headerRenderer:IFactory = null;
      
      private var _hoverColumnIndex:int = -1;
      
      private var _visibleSortIndicatorIndices:Vector.<int>;
      
      private var rollColumnIndex:int = -1;
      
      private var rollSeparatorIndex:int = -1;
      
      private var pressColumnIndex:int = -1;
      
      private var pressSeparatorIndex:int = -1;
      
      public function GridColumnHeaderGroup()
      {
         this._visibleSortIndicatorIndices = new Vector.<int>();
         super();
         layout = new GridColumnHeaderGroupLayout();
         layout.clipAndEnableScrolling = true;
         MouseEventUtil.addDownDragUpListeners(this,this.gchg_mouseDownDragUpHandler,this.gchg_mouseDownDragUpHandler,this.gchg_mouseDownDragUpHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,this.gchg_mouseMoveHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.gchg_mouseRollOutHandler);
         addEventListener(MouseEvent.CLICK,this.gchg_clickHandler);
         addEventListener(MouseEvent.DOUBLE_CLICK,this.gchg_doubleClickHandler);
      }
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
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
         invalidateDisplayList();
         this.dispatchChangeEvent("columnSeparatorChanged");
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
         if(Boolean(this._dataGrid) && Boolean(this._dataGrid.grid))
         {
            this._dataGrid.grid.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.grid_changeEventHandler);
         }
         this._dataGrid = param1;
         if(Boolean(this._dataGrid) && Boolean(this._dataGrid.grid))
         {
            this._dataGrid.grid.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.grid_changeEventHandler);
         }
         layout.clearVirtualLayoutCache();
         invalidateSize();
         invalidateDisplayList();
         this.dispatchChangeEvent("dataGridChanged");
      }
      
      private function grid_changeEventHandler(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "horizontalScrollPosition")
         {
            horizontalScrollPosition = Number(param1.newValue);
         }
      }
      
      [Bindable("downColumnIndexChanged")]
      public function get downColumnIndex() : int
      {
         return this._downColumnIndex;
      }
      
      public function set downColumnIndex(param1:int) : void
      {
         if(this._downColumnIndex == param1)
         {
            return;
         }
         this._downColumnIndex = param1;
         invalidateDisplayList();
         this.dispatchChangeEvent("downColumnIndexChanged");
      }
      
      [Bindable("headerRendererChanged")]
      public function get headerRenderer() : IFactory
      {
         return this._headerRenderer;
      }
      
      public function set headerRenderer(param1:IFactory) : void
      {
         if(param1 == this._headerRenderer)
         {
            return;
         }
         this._headerRenderer = param1;
         layout.clearVirtualLayoutCache();
         invalidateSize();
         invalidateDisplayList();
         this.dispatchChangeEvent("headerRendererChanged");
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
         invalidateDisplayList();
         this.dispatchChangeEvent("hoverColumnIndexChanged");
      }
      
      [Bindable("visibleSortIndicatorIndicesChanged")]
      public function get visibleSortIndicatorIndices() : Vector.<int>
      {
         return this._visibleSortIndicatorIndices.concat();
      }
      
      public function set visibleSortIndicatorIndices(param1:Vector.<int>) : void
      {
         var _loc2_:Vector.<int> = !!param1 ? param1.concat() : new Vector.<int>();
         this._visibleSortIndicatorIndices = _loc2_;
         invalidateDisplayList();
         this.dispatchChangeEvent("visibleSortIndicatorIndicesChanged");
      }
      
      public function isSortIndicatorVisible(param1:int) : Boolean
      {
         return this._visibleSortIndicatorIndices.indexOf(param1) != -1;
      }
      
      public function getHeaderIndexAt(param1:Number, param2:Number) : int
      {
         return GridColumnHeaderGroupLayout(layout).getHeaderIndexAt(param1,param2);
      }
      
      public function getSeparatorIndexAt(param1:Number, param2:Number) : int
      {
         return GridColumnHeaderGroupLayout(layout).getSeparatorIndexAt(param1,param2);
      }
      
      public function getHeaderRendererAt(param1:int) : IGridItemRenderer
      {
         return GridColumnHeaderGroupLayout(layout).getHeaderRendererAt(param1);
      }
      
      public function getHeaderBounds(param1:int) : Rectangle
      {
         return GridColumnHeaderGroupLayout(layout).getHeaderBounds(param1);
      }
      
      protected function gchg_mouseDownDragUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.getSeparatorIndexAt(_loc3_.x,0)) == -1 ? this.getHeaderIndexAt(_loc3_.x,0) : -1;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc6_ = this.pressSeparatorIndex != -1 ? "null" : GridEvent.GRID_MOUSE_DRAG;
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = this.pressSeparatorIndex != -1 ? "null" : GridEvent.GRID_MOUSE_UP;
               this.downColumnIndex = -1;
               break;
            case MouseEvent.MOUSE_DOWN:
               if(_loc4_ != -1)
               {
                  _loc6_ = "null";
                  this.pressSeparatorIndex = _loc4_;
                  this.pressColumnIndex = -1;
                  this.downColumnIndex = -1;
                  break;
               }
               _loc6_ = "null";
               this.pressSeparatorIndex = -1;
               this.pressColumnIndex = _loc5_;
               this.downColumnIndex = _loc5_;
               break;
         }
         var _loc7_:int = _loc4_ != -1 ? _loc4_ : _loc5_;
         this.dispatchGridEvent(param1,_loc6_,_loc3_,_loc7_);
      }
      
      protected function gchg_mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.getSeparatorIndexAt(_loc3_.x,0)) == -1 ? this.getHeaderIndexAt(_loc3_.x,0) : -1;
         if(_loc4_ != this.rollSeparatorIndex)
         {
            if(this.rollSeparatorIndex != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.SEPARATOR_ROLL_OUT,_loc3_,this.rollSeparatorIndex);
            }
            if(_loc4_ != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.SEPARATOR_ROLL_OVER,_loc3_,_loc4_);
            }
         }
         if(_loc5_ != this.rollColumnIndex)
         {
            if(this.rollColumnIndex != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this.rollColumnIndex);
            }
            if(_loc5_ != -1)
            {
               this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OVER,_loc3_,_loc5_);
            }
         }
         this.rollColumnIndex = _loc5_;
         this.rollSeparatorIndex = _loc4_;
         this.hoverColumnIndex = _loc5_;
      }
      
      protected function gchg_mouseRollOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         if(this.rollSeparatorIndex != -1)
         {
            this.dispatchGridEvent(param1,GridEvent.SEPARATOR_ROLL_OUT,_loc3_,this.rollSeparatorIndex);
         }
         else if(this.rollColumnIndex != -1)
         {
            this.dispatchGridEvent(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this.rollColumnIndex);
         }
         this.rollColumnIndex = -1;
         this.rollSeparatorIndex = -1;
         this.hoverColumnIndex = -1;
      }
      
      protected function gchg_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.getSeparatorIndexAt(_loc3_.x,0)) == -1 ? this.getHeaderIndexAt(_loc3_.x,0) : -1;
         if(_loc4_ != -1 && this.pressSeparatorIndex == _loc4_)
         {
            this.dispatchGridEvent(param1,GridEvent.SEPARATOR_CLICK,_loc3_,_loc4_);
         }
         else if(_loc5_ != -1 && this.pressColumnIndex == _loc5_)
         {
            this.dispatchGridEvent(param1,GridEvent.GRID_CLICK,_loc3_,_loc5_);
         }
      }
      
      protected function gchg_doubleClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         var _loc5_:int = (_loc4_ = this.getSeparatorIndexAt(_loc3_.x,0)) == -1 ? this.getHeaderIndexAt(_loc3_.x,0) : -1;
         if(_loc4_ != -1 && this.pressSeparatorIndex == _loc4_)
         {
            this.dispatchGridEvent(param1,GridEvent.SEPARATOR_DOUBLE_CLICK,_loc3_,_loc4_);
         }
         else if(_loc5_ != -1 && this.pressColumnIndex == _loc5_)
         {
            this.dispatchGridEvent(param1,GridEvent.GRID_DOUBLE_CLICK,_loc3_,_loc5_);
         }
      }
      
      private function dispatchGridEvent(param1:MouseEvent, param2:String, param3:Point, param4:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         _loc5_ = this.getColumnAt(param4);
         _loc6_ = null;
         _loc7_ = this.getHeaderRendererAt(param4);
         _loc8_ = param1.bubbles;
         _loc9_ = param1.cancelable;
         _loc10_ = param1.relatedObject;
         _loc11_ = param1.ctrlKey;
         _loc12_ = param1.altKey;
         _loc13_ = param1.shiftKey;
         _loc14_ = param1.buttonDown;
         _loc15_ = param1.delta;
         var _loc16_:GridEvent = new GridEvent(param2,_loc8_,_loc9_,param3.x,param3.y,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,-1,param4,_loc5_,_loc6_,_loc7_);
         dispatchEvent(_loc16_);
      }
      
      private function getColumnAt(param1:int) : GridColumn
      {
         var _loc2_:Grid = !!this.dataGrid ? this.dataGrid.grid : null;
         if(!_loc2_ || !_loc2_.columns)
         {
            return null;
         }
         var _loc3_:IList = _loc2_.columns;
         return param1 >= 0 && param1 < _loc3_.length ? _loc3_.getItemAt(param1) as GridColumn : null;
      }
   }
}
