package spark.components.gridClasses
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import mx.collections.IList;
   import mx.core.IFactory;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import spark.components.DataGrid;
   import spark.components.Grid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.supportClasses.GroupBase;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class GridColumnHeaderGroupLayout extends LayoutBase
   {
       
      
      private var rendererLayer:Group;
      
      private var overlayLayer:Group;
      
      private const rendererHeights:Array = new Array();
      
      private var maxRendererHeight:Number = 0;
      
      private const visibleRenderersBounds:Rectangle = new Rectangle();
      
      private const visibleHeaderRenderers:Vector.<IGridItemRenderer> = new Vector.<IGridItemRenderer>();
      
      private const visibleHeaderSeparators:Vector.<IVisualElement> = new Vector.<IVisualElement>();
      
      private var freeElementMap:Dictionary;
      
      private var elementToFactoryMap:Dictionary;
      
      private var createdVisualElement:Boolean = false;
      
      private var _columns:IList;
      
      public function GridColumnHeaderGroupLayout()
      {
         this.freeElementMap = new Dictionary();
         this.elementToFactoryMap = new Dictionary();
         super();
      }
      
      override public function set target(param1:GroupBase) : void
      {
         super.target = param1;
         var _loc2_:GridColumnHeaderGroup = param1 as GridColumnHeaderGroup;
         if(_loc2_)
         {
            this.rendererLayer = new Group();
            this.rendererLayer.layout = new LayoutBase();
            _loc2_.addElement(this.rendererLayer);
            this.overlayLayer = new Group();
            this.overlayLayer.layout = new LayoutBase();
            _loc2_.addElement(this.overlayLayer);
         }
      }
      
      override public function get useVirtualLayout() : Boolean
      {
         return true;
      }
      
      override public function set useVirtualLayout(param1:Boolean) : void
      {
      }
      
      override public function clearVirtualLayoutCache() : void
      {
         this.rendererHeights.length = 0;
         this.visibleHeaderRenderers.length = 0;
         this.visibleHeaderSeparators.length = 0;
         this.visibleRenderersBounds.setEmpty();
         this.elementToFactoryMap = new Dictionary();
         this.freeElementMap = new Dictionary();
         if(this.rendererLayer)
         {
            this.rendererLayer.removeAllElements();
         }
         if(this.overlayLayer)
         {
            this.overlayLayer.removeAllElements();
         }
      }
      
      override protected function scrollPositionChanged() : void
      {
         var _loc1_:GridColumnHeaderGroup = this.columnHeaderGroup;
         if(!_loc1_)
         {
            return;
         }
         super.scrollPositionChanged();
         var _loc2_:Rectangle = _loc1_.scrollRect;
         if(Boolean(_loc2_) && !this.visibleRenderersBounds.containsRect(_loc2_))
         {
            _loc1_.invalidateDisplayList();
         }
      }
      
      override public function measure() : void
      {
         var _loc1_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc2_:Grid = this.grid;
         if(!_loc1_ || !_loc2_)
         {
            return;
         }
         this.updateRendererHeights();
         var _loc3_:Number = _loc1_.getStyle("paddingLeft");
         var _loc4_:Number = _loc1_.getStyle("paddingRight");
         var _loc5_:Number = _loc1_.getStyle("paddingTop");
         var _loc6_:Number = _loc1_.getStyle("paddingBottom");
         var _loc7_:Number = Math.ceil(_loc3_ + _loc4_);
         var _loc8_:Number = Math.ceil(this.maxRendererHeight + _loc5_ + _loc6_);
         _loc1_.measuredWidth = Math.max(_loc7_,_loc1_.minWidth);
         _loc1_.measuredHeight = Math.max(_loc8_,_loc1_.minHeight);
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc27_:* = false;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:* = null;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc3_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc4_:Grid = this.grid;
         if(!_loc3_ || !_loc4_)
         {
            return;
         }
         var _loc5_:Vector.<int> = _loc4_.getVisibleColumnIndices();
         var _loc6_:* = [];
         var _loc7_:Group = this.rendererLayer;
         var _loc8_:Group = this.overlayLayer;
         var _loc9_:IFactory = _loc3_.columnSeparator;
         var _loc13_:int = -1;
         for each(_loc10_ in this.visibleHeaderRenderers)
         {
            if((_loc13_ = !!(_loc12_ = _loc10_.column) ? _loc12_.columnIndex : -1) != -1 && _loc5_.indexOf(_loc13_) != -1 && _loc6_[_loc13_] == null)
            {
               _loc6_[_loc13_] = _loc10_;
            }
            else
            {
               this.freeVisualElement(_loc10_);
               _loc10_.discard(true);
            }
         }
         this.visibleHeaderRenderers.length = 0;
         for each(_loc11_ in this.visibleHeaderSeparators)
         {
            this.freeVisualElement(_loc11_);
         }
         this.visibleHeaderSeparators.length = 0;
         _loc14_ = _loc3_.getStyle("paddingLeft");
         _loc15_ = _loc3_.getStyle("paddingRight");
         _loc16_ = _loc3_.getStyle("paddingTop");
         _loc17_ = _loc3_.getStyle("paddingBottom");
         _loc19_ = !!(_loc18_ = this.columns) ? _loc18_.length : 0;
         var _loc20_:int = _loc4_.mx_internal::getPreviousVisibleColumnIndex(_loc19_);
         var _loc21_:Number = _loc16_;
         var _loc22_:Number = param2 - _loc16_ - _loc17_;
         var _loc23_:Number = _loc3_.horizontalScrollPosition + param1;
         var _loc24_:Number = 0;
         var _loc25_:Number = 0;
         var _loc26_:int = 0;
         while(true)
         {
            if(_loc26_ < _loc5_.length)
            {
               _loc13_ = _loc5_[_loc26_];
            }
            else
            {
               _loc13_ = _loc4_.mx_internal::getNextVisibleColumnIndex(_loc13_);
            }
            if(_loc13_ < 0 || _loc13_ >= _loc19_)
            {
               break;
            }
            _loc12_ = _loc18_.getItemAt(_loc13_) as GridColumn;
            _loc10_ = _loc6_[_loc13_];
            _loc6_[_loc13_] = null;
            if(!_loc10_)
            {
               if(!(_loc30_ = _loc12_.headerRenderer))
               {
                  _loc30_ = _loc3_.headerRenderer;
               }
               _loc10_ = this.allocateVisualElement(_loc30_) as IGridItemRenderer;
            }
            this.visibleHeaderRenderers.push(_loc10_);
            this.initializeItemRenderer(_loc10_,_loc13_,_loc12_,true);
            if(_loc10_.parent != _loc7_)
            {
               _loc7_.addElement(_loc10_);
            }
            _loc27_ = _loc13_ == _loc20_;
            _loc28_ = _loc4_.getCellX(0,_loc13_) + _loc14_;
            _loc29_ = _loc4_.getColumnWidth(_loc13_);
            if(_loc27_)
            {
               _loc29_ = horizontalScrollPosition + param1 - _loc28_ - _loc15_;
            }
            _loc10_.setLayoutBoundsSize(_loc29_,_loc22_);
            _loc10_.setLayoutBoundsPosition(_loc28_,_loc21_);
            if(_loc26_ == 0)
            {
               _loc24_ = _loc28_;
            }
            _loc25_ = _loc28_ + _loc29_;
            _loc10_.prepare(!this.createdVisualElement);
            if(_loc28_ + _loc29_ > _loc23_)
            {
               break;
            }
            if(Boolean(_loc9_) && !_loc27_)
            {
               _loc11_ = this.allocateVisualElement(_loc9_);
               this.visibleHeaderSeparators.push(_loc11_);
               _loc11_.visible = true;
               if(_loc11_.parent != _loc8_)
               {
                  _loc8_.addElement(_loc11_);
               }
               _loc31_ = Number(_loc11_.getPreferredBoundsWidth());
               _loc32_ = _loc28_ + _loc29_;
               _loc11_.setLayoutBoundsSize(_loc31_,_loc22_);
               _loc11_.setLayoutBoundsPosition(_loc32_,_loc21_);
            }
            _loc26_++;
         }
         _loc3_.setContentSize(_loc4_.contentWidth,_loc22_);
         this.visibleRenderersBounds.left = _loc24_ - _loc14_;
         this.visibleRenderersBounds.right = _loc25_ = _loc15_;
         this.visibleRenderersBounds.top = _loc21_ - _loc16_;
         this.visibleRenderersBounds.height = _loc22_ + _loc16_ + _loc17_;
         _loc3_.validateNow();
         this.updateRendererHeights(true);
      }
      
      public function getHeaderIndexAt(param1:Number, param2:Number) : int
      {
         var _loc6_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc4_:Grid = this.grid;
         var _loc5_:IList = this.columns;
         if(!_loc3_ || !_loc4_ || !_loc5_)
         {
            return -1;
         }
         _loc6_ = _loc3_.getStyle("paddingLeft");
         var _loc7_:Number = param1 + _loc6_;
         var _loc8_:int;
         if((_loc8_ = _loc4_.getColumnIndexAt(_loc7_,0)) < 0)
         {
            _loc9_ = _loc3_.contentWidth;
            _loc10_ = horizontalScrollPosition + _loc3_.width - _loc3_.getStyle("paddingRight");
            if(_loc7_ >= _loc9_ && _loc7_ < _loc10_)
            {
               _loc8_ = _loc4_.mx_internal::getPreviousVisibleColumnIndex(_loc5_.length);
            }
         }
         return _loc8_;
      }
      
      public function getSeparatorIndexAt(param1:Number, param2:Number) : int
      {
         var _loc6_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc4_:Grid = this.grid;
         var _loc5_:IList = this.columns;
         if(!_loc3_ || !_loc4_ || !_loc5_)
         {
            return -1;
         }
         _loc6_ = _loc3_.getStyle("paddingLeft");
         var _loc7_:int;
         if((_loc7_ = _loc4_.getColumnIndexAt(param1 + _loc6_,0)) == -1)
         {
            return -1;
         }
         var _loc8_:* = _loc7_ == _loc4_.mx_internal::getNextVisibleColumnIndex(-1);
         var _loc9_:* = _loc7_ == _loc4_.mx_internal::getPreviousVisibleColumnIndex(_loc5_.length);
         var _loc11_:Number = (_loc10_ = _loc4_.getCellX(0,_loc7_)) + _loc4_.getColumnWidth(_loc7_);
         var _loc12_:Number = _loc3_.getStyle("separatorAffordance");
         if(!_loc8_ && param1 > _loc10_ - _loc12_ && param1 < _loc10_ + _loc12_)
         {
            return _loc4_.mx_internal::getPreviousVisibleColumnIndex(_loc7_);
         }
         if(!_loc9_ && param1 > _loc11_ - _loc12_ && param1 < _loc11_ + _loc12_)
         {
            return _loc7_;
         }
         return -1;
      }
      
      public function getHeaderBounds(param1:int) : Rectangle
      {
         var _loc4_:* = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc2_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc3_:Grid = this.grid;
         if(!_loc2_ || !_loc3_)
         {
            return null;
         }
         var _loc5_:int = !!(_loc4_ = this.columns) ? _loc4_.length : 0;
         if(param1 >= _loc5_)
         {
            return null;
         }
         var _loc6_:GridColumn;
         if(!(_loc6_ = _loc4_.getItemAt(param1) as GridColumn).visible)
         {
            return null;
         }
         var _loc7_:Number = _loc2_.getStyle("paddingLeft");
         var _loc8_:Number = _loc2_.getStyle("paddingRight");
         _loc9_ = _loc2_.getStyle("paddingTop");
         _loc10_ = _loc2_.getStyle("paddingBottom");
         var _loc11_:* = param1 == _loc3_.mx_internal::getPreviousVisibleColumnIndex(_loc5_);
         var _loc12_:Number = _loc3_.getCellX(0,param1) + _loc7_;
         var _loc13_:Number = _loc9_;
         var _loc14_:Number = _loc3_.getColumnWidth(param1);
         var _loc15_:Number = _loc2_.height - _loc9_ - _loc10_;
         if(_loc11_)
         {
            _loc14_ = horizontalScrollPosition + _loc2_.width - _loc12_ - _loc8_;
         }
         return new Rectangle(_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      public function getHeaderRendererAt(param1:int) : IGridItemRenderer
      {
         var _loc5_:* = null;
         var _loc11_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc2_:GridColumnHeaderGroup = this.columnHeaderGroup;
         var _loc3_:Grid = this.grid;
         if(!_loc2_ || !_loc3_ || param1 < 0)
         {
            return null;
         }
         var _loc4_:Group = this.rendererLayer;
         var _loc6_:int;
         if((_loc6_ = (_loc5_ = _loc3_.getVisibleColumnIndices()).indexOf(param1)) != -1)
         {
            _loc20_ = _loc4_.numElements;
            _loc21_ = 0;
            while(_loc21_ < _loc20_)
            {
               if((_loc22_ = _loc4_.getElementAt(_loc21_) as IGridItemRenderer) && _loc22_.visible && _loc22_.column && _loc22_.column.columnIndex == param1)
               {
                  return _loc22_;
               }
               _loc21_++;
            }
            return null;
         }
         var _loc7_:IList;
         if(!(_loc7_ = this.columns) || _loc7_.length <= param1)
         {
            return null;
         }
         var _loc8_:GridColumn;
         if(!(_loc8_ = _loc7_.getItemAt(param1) as GridColumn).visible)
         {
            return null;
         }
         var _loc9_:IFactory;
         if(!(_loc9_ = _loc8_.headerRenderer))
         {
            _loc9_ = _loc2_.headerRenderer;
         }
         var _loc10_:IGridItemRenderer = this.allocateVisualElement(_loc9_) as IGridItemRenderer;
         _loc4_.addElement(_loc10_);
         this.initializeItemRenderer(_loc10_,param1,_loc8_,_loc10_.visible);
         _loc11_ = _loc2_.getStyle("paddingLeft");
         var _loc12_:Number = _loc2_.getStyle("paddingRight");
         _loc13_ = _loc2_.getStyle("paddingTop");
         _loc14_ = _loc2_.getStyle("paddingBottom");
         var _loc15_:* = param1 == _loc3_.mx_internal::getPreviousVisibleColumnIndex(_loc7_.length);
         var _loc16_:Number = _loc3_.getCellX(0,param1) + _loc11_;
         var _loc17_:Number = _loc13_;
         var _loc18_:Number = _loc2_.height - _loc13_ - _loc14_;
         var _loc19_:Number = _loc3_.getColumnWidth(param1);
         if(_loc15_)
         {
            _loc19_ = horizontalScrollPosition + _loc2_.width - _loc16_ - _loc12_;
         }
         _loc10_.setLayoutBoundsSize(_loc19_,_loc18_);
         _loc10_.setLayoutBoundsPosition(_loc16_,_loc17_);
         _loc4_.removeElement(_loc10_);
         _loc10_.visible = false;
         return _loc10_;
      }
      
      private function initializeItemRenderer(param1:IGridItemRenderer, param2:int, param3:GridColumn, param4:Boolean = true) : void
      {
         var _loc5_:* = null;
         param1.visible = param4;
         param1.column = param3;
         param1.label = param3.headerText;
         var _loc6_:DataGrid;
         if(_loc6_ = (_loc5_ = this.columnHeaderGroup).dataGrid)
         {
            param1.owner = _loc6_;
         }
         param1.hovered = param2 == _loc5_.hoverColumnIndex;
         param1.down = param2 == _loc5_.downColumnIndex;
      }
      
      private function createVisualElement(param1:IFactory) : IVisualElement
      {
         this.createdVisualElement = true;
         var _loc2_:IVisualElement = param1.newInstance() as IVisualElement;
         this.elementToFactoryMap[_loc2_] = param1;
         return _loc2_;
      }
      
      private function allocateVisualElement(param1:IFactory) : IVisualElement
      {
         var _loc3_:* = null;
         this.createdVisualElement = false;
         var _loc2_:Vector.<IVisualElement> = this.freeElementMap[param1] as Vector.<IVisualElement>;
         if(_loc2_)
         {
            _loc3_ = _loc2_.pop();
            if(_loc2_.length == 0)
            {
               delete this.freeElementMap[param1];
            }
            if(_loc3_)
            {
               return _loc3_;
            }
         }
         return this.createVisualElement(param1);
      }
      
      private function freeVisualElement(param1:IVisualElement) : void
      {
         var _loc2_:IFactory = this.elementToFactoryMap[param1];
         var _loc3_:Vector.<IVisualElement> = this.freeElementMap[_loc2_];
         if(!_loc3_)
         {
            _loc3_ = new Vector.<IVisualElement>();
            this.freeElementMap[_loc2_] = _loc3_;
         }
         _loc3_.push(param1);
         param1.visible = false;
      }
      
      private function updateRendererHeights(param1:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc2_:IList = this.columns;
         this.rendererHeights.length = !!_loc2_ ? _loc2_.length : 0;
         var _loc3_:Number = 0;
         for each(_loc4_ in this.visibleHeaderRenderers)
         {
            _loc5_ = Number(_loc4_.getPreferredBoundsHeight());
            this.rendererHeights[_loc4_.column.columnIndex] = _loc5_;
            if(_loc5_ > _loc3_)
            {
               _loc3_ = _loc5_;
            }
         }
         if(_loc3_ == this.maxRendererHeight)
         {
            return;
         }
         if(_loc3_ < this.maxRendererHeight)
         {
            _loc6_ = 0;
            while(_loc6_ < this.rendererHeights.length)
            {
               _loc7_ = Number(this.rendererHeights[_loc6_]);
               if(!isNaN(_loc7_) && _loc7_ > _loc3_)
               {
                  _loc3_ = _loc7_;
               }
               _loc6_++;
            }
         }
         this.maxRendererHeight = _loc3_;
         if(param1)
         {
            this.columnHeaderGroup.invalidateSize();
         }
      }
      
      private function get columnHeaderGroup() : GridColumnHeaderGroup
      {
         return target as GridColumnHeaderGroup;
      }
      
      private function get grid() : Grid
      {
         var _loc1_:GridColumnHeaderGroup = this.columnHeaderGroup;
         if(_loc1_.dataGrid)
         {
            return _loc1_.dataGrid.grid;
         }
         return null;
      }
      
      private function get columns() : IList
      {
         var _loc1_:* = null;
         _loc1_ = this.grid;
         var _loc2_:IList = !!_loc1_ ? _loc1_.columns : null;
         if(_loc2_ != this._columns)
         {
            if(this._columns)
            {
               this._columns.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.columns_collectionChangeHandler);
            }
            this._columns = _loc2_;
            if(this._columns)
            {
               this._columns.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.columns_collectionChangeHandler);
            }
         }
         return this._columns;
      }
      
      private function columns_collectionChangeHandler(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
               this.columns_collectionChangeAdd(param1);
               break;
            case CollectionEventKind.REMOVE:
               this.columns_collectionChangeRemove(param1);
               break;
            case CollectionEventKind.MOVE:
               this.columns_collectionChangeMove(param1);
               break;
            case CollectionEventKind.REPLACE:
            case CollectionEventKind.UPDATE:
               break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
               this.columnHeaderGroup.visibleSortIndicatorIndices = null;
         }
      }
      
      private function columns_collectionChangeAdd(param1:CollectionEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = param1.items.length;
         if(_loc2_ <= 0)
         {
            return;
         }
         _loc3_ = this.columnHeaderGroup;
         var _loc5_:int = (_loc4_ = _loc3_.visibleSortIndicatorIndices).length;
         var _loc6_:int = param1.location;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if(_loc4_[_loc7_] >= _loc6_)
            {
               _loc4_[_loc7_] += _loc2_;
            }
            _loc7_++;
         }
         _loc3_.visibleSortIndicatorIndices = _loc4_;
      }
      
      private function columns_collectionChangeRemove(param1:CollectionEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:int = param1.items.length;
         if(_loc2_ <= 0)
         {
            return;
         }
         _loc3_ = this.columnHeaderGroup;
         var _loc5_:int = (_loc4_ = _loc3_.visibleSortIndicatorIndices).length;
         var _loc7_:int = (_loc6_ = param1.location) + _loc2_;
         var _loc8_:Vector.<int> = new Vector.<int>();
         for each(_loc9_ in _loc4_)
         {
            if(_loc9_ < _loc6_)
            {
               _loc8_.push(_loc9_);
            }
            else if(_loc9_ >= _loc7_)
            {
               _loc8_.push(_loc9_ - _loc7_);
            }
         }
         _loc3_.visibleSortIndicatorIndices = _loc8_;
      }
      
      private function columns_collectionChangeMove(param1:CollectionEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc10_:int = 0;
         var _loc2_:int = param1.items.length;
         if(_loc2_ <= 0)
         {
            return;
         }
         _loc3_ = this.columnHeaderGroup;
         var _loc5_:int = (_loc4_ = _loc3_.visibleSortIndicatorIndices).length;
         var _loc6_:int = param1.oldLocation;
         var _loc7_:int = param1.oldLocation + _loc2_;
         var _loc8_:int = param1.location;
         var _loc9_:int = param1.location + _loc2_;
         var _loc11_:int = 0;
         while(_loc11_ < _loc5_)
         {
            if((_loc10_ = _loc4_[_loc11_]) >= _loc6_ && _loc10_ < _loc7_)
            {
               _loc4_[_loc11_] = _loc8_ + (_loc10_ - _loc6_);
            }
            else if(_loc8_ > _loc6_)
            {
               if(_loc10_ >= _loc7_ && _loc10_ < _loc9_)
               {
                  _loc4_[_loc11_] -= _loc2_;
               }
            }
            else if(_loc8_ < _loc6_)
            {
               if(_loc10_ >= _loc8_ && _loc10_ < _loc6_)
               {
                  _loc4_[_loc11_] += _loc2_;
               }
            }
            _loc11_++;
         }
         _loc3_.visibleSortIndicatorIndices = _loc4_;
      }
   }
}
