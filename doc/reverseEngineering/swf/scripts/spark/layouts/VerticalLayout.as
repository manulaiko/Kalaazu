package spark.layouts
{
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.containers.utilityClasses.Flex;
   import mx.core.FlexVersion;
   import mx.core.ILayoutElement;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.DataGroup;
   import spark.components.supportClasses.GroupBase;
   import spark.core.NavigationUnit;
   import spark.layouts.supportClasses.DropLocation;
   import spark.layouts.supportClasses.LayoutBase;
   import spark.layouts.supportClasses.LayoutElementHelper;
   import spark.layouts.supportClasses.LinearLayoutVector;
   
   public class VerticalLayout extends LayoutBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var llv:LinearLayoutVector;
      
      private var _gap:int = 6;
      
      private var _rowCount:int = -1;
      
      private var _horizontalAlign:String = "left";
      
      private var _verticalAlign:String = "top";
      
      private var _paddingLeft:Number = 0;
      
      private var _paddingRight:Number = 0;
      
      private var _paddingTop:Number = 0;
      
      private var _paddingBottom:Number = 0;
      
      private var _requestedMaxRowCount:int = -1;
      
      private var _requestedMinRowCount:int = -1;
      
      private var _requestedRowCount:int = -1;
      
      private var _rowHeight:Number;
      
      private var _variableRowHeight:Boolean = true;
      
      private var _firstIndexInView:int = -1;
      
      private var _lastIndexInView:int = -1;
      
      public function VerticalLayout()
      {
         super();
         mx_internal::dragScrollRegionSizeHorizontal = 0;
      }
      
      private static function calculatePercentWidth(param1:ILayoutElement, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(false)
         {
            _loc3_ = LayoutElementHelper.pinBetween(Math.round(param1.percentWidth * 0.01 * param2),param1.getMinBoundsWidth(),param1.getMaxBoundsWidth());
            return _loc3_ < param2 ? _loc3_ : param2;
         }
         return LayoutElementHelper.pinBetween(Math.min(Math.round(param1.percentWidth * 0.01 * param2),param2),param1.getMinBoundsWidth(),param1.getMaxBoundsWidth());
      }
      
      private static function sizeLayoutElement(param1:ILayoutElement, param2:Number, param3:String, param4:Number, param5:Number, param6:Boolean, param7:Number) : void
      {
         var _loc8_:Number = NaN;
         if(param3 == HorizontalAlign.JUSTIFY || param3 == HorizontalAlign.CONTENT_JUSTIFY)
         {
            _loc8_ = param4;
         }
         else if(!isNaN(param1.percentWidth))
         {
            _loc8_ = calculatePercentWidth(param1,param2);
         }
         if(param6)
         {
            param1.setLayoutBoundsSize(_loc8_,param5);
         }
         else
         {
            param1.setLayoutBoundsSize(_loc8_,param7);
         }
      }
      
      private static function findIndexAt(param1:Number, param2:int, param3:GroupBase, param4:int, param5:int) : int
      {
         var _loc6_:int = (param4 + param5) / 2;
         var _loc7_:ILayoutElement;
         var _loc8_:Number = (_loc7_ = param3.getElementAt(_loc6_)).getLayoutBoundsY();
         var _loc9_:Number = _loc7_.getLayoutBoundsHeight();
         if(param1 >= _loc8_ && param1 < _loc8_ + _loc9_ + param2)
         {
            return _loc6_;
         }
         if(param4 == param5)
         {
            return -1;
         }
         if(param1 < _loc8_)
         {
            return findIndexAt(param1,param2,param3,param4,Math.max(param4,_loc6_ - 1));
         }
         return findIndexAt(param1,param2,param3,Math.min(_loc6_ + 1,param5),param5);
      }
      
      private static function findLayoutElementIndex(param1:GroupBase, param2:int, param3:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = param1.numElements;
         while(param2 >= 0 && param2 < _loc4_)
         {
            if((Boolean(_loc5_ = param1.getElementAt(param2))) && _loc5_.includeInLayout)
            {
               return param2;
            }
            param2 += param3;
         }
         return -1;
      }
      
      public function get gap() : int
      {
         return this._gap;
      }
      
      public function set gap(param1:int) : void
      {
         if(this._gap == param1)
         {
            return;
         }
         this._gap = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      [Bindable("propertyChange")]
      public function get rowCount() : int
      {
         return this._rowCount;
      }
      
      mx_internal function setRowCount(param1:int) : void
      {
         if(this._rowCount == param1)
         {
            return;
         }
         var _loc2_:int = this._rowCount;
         this._rowCount = param1;
         dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowCount",_loc2_,param1));
      }
      
      public function get horizontalAlign() : String
      {
         return this._horizontalAlign;
      }
      
      public function set horizontalAlign(param1:String) : void
      {
         if(param1 == this._horizontalAlign)
         {
            return;
         }
         this._horizontalAlign = param1;
         var _loc2_:GroupBase = target;
         if(_loc2_)
         {
            _loc2_.invalidateDisplayList();
         }
      }
      
      public function get verticalAlign() : String
      {
         return this._verticalAlign;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         if(param1 == this._verticalAlign)
         {
            return;
         }
         this._verticalAlign = param1;
         var _loc2_:GroupBase = target;
         if(_loc2_)
         {
            _loc2_.invalidateDisplayList();
         }
      }
      
      public function get paddingLeft() : Number
      {
         return this._paddingLeft;
      }
      
      public function set paddingLeft(param1:Number) : void
      {
         if(this._paddingLeft == param1)
         {
            return;
         }
         this._paddingLeft = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingRight() : Number
      {
         return this._paddingRight;
      }
      
      public function set paddingRight(param1:Number) : void
      {
         if(this._paddingRight == param1)
         {
            return;
         }
         this._paddingRight = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingTop() : Number
      {
         return this._paddingTop;
      }
      
      public function set paddingTop(param1:Number) : void
      {
         if(this._paddingTop == param1)
         {
            return;
         }
         this._paddingTop = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingBottom() : Number
      {
         return this._paddingBottom;
      }
      
      public function set paddingBottom(param1:Number) : void
      {
         if(this._paddingBottom == param1)
         {
            return;
         }
         this._paddingBottom = param1;
         this.invalidateTargetSizeAndDisplayList();
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
         if(target)
         {
            target.invalidateSize();
         }
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
         if(target)
         {
            target.invalidateSize();
         }
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
         if(target)
         {
            target.invalidateSize();
         }
      }
      
      public function get rowHeight() : Number
      {
         var _loc1_:* = null;
         if(!isNaN(this._rowHeight))
         {
            return this._rowHeight;
         }
         _loc1_ = typicalLayoutElement;
         return !!_loc1_ ? _loc1_.getPreferredBoundsHeight() : 0;
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(this._rowHeight == param1)
         {
            return;
         }
         this._rowHeight = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get variableRowHeight() : Boolean
      {
         return this._variableRowHeight;
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         if(param1 == this._variableRowHeight)
         {
            return;
         }
         this._variableRowHeight = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      [Bindable("indexInViewChanged")]
      public function get firstIndexInView() : int
      {
         return this._firstIndexInView;
      }
      
      [Bindable("indexInViewChanged")]
      public function get lastIndexInView() : int
      {
         return this._lastIndexInView;
      }
      
      mx_internal function setIndexInView(param1:int, param2:int) : void
      {
         if(this._firstIndexInView == param1 && this._lastIndexInView == param2)
         {
            return;
         }
         this._firstIndexInView = param1;
         this._lastIndexInView = param2;
         dispatchEvent(new Event("indexInViewChanged"));
      }
      
      override public function set clipAndEnableScrolling(param1:Boolean) : void
      {
         var _loc3_:* = null;
         super.clipAndEnableScrolling = param1;
         var _loc2_:String = this.verticalAlign;
         if(_loc2_ == VerticalAlign.MIDDLE || _loc2_ == VerticalAlign.BOTTOM)
         {
            _loc3_ = target;
            if(_loc3_)
            {
               _loc3_.invalidateDisplayList();
            }
         }
      }
      
      override public function clearVirtualLayoutCache() : void
      {
         this.llv = null;
         var _loc1_:GroupBase = GroupBase(target);
         if(!_loc1_)
         {
            return;
         }
         target.invalidateSize();
         target.invalidateDisplayList();
      }
      
      override public function getElementBounds(param1:int) : Rectangle
      {
         if(!useVirtualLayout)
         {
            return super.getElementBounds(param1);
         }
         var _loc2_:GroupBase = GroupBase(target);
         if(!_loc2_ || param1 < 0 || param1 >= _loc2_.numElements || !this.llv)
         {
            return null;
         }
         return this.llv.getBounds(param1);
      }
      
      public function fractionOfElementInView(param1:int) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc11_:* = null;
         var _loc2_:GroupBase = GroupBase(target);
         if(!_loc2_)
         {
            return 0;
         }
         if(param1 < 0 || param1 >= _loc2_.numElements)
         {
            return 0;
         }
         if(!clipAndEnableScrolling)
         {
            return 1;
         }
         var _loc3_:int = this.firstIndexInView;
         var _loc4_:int = this.lastIndexInView;
         if(_loc3_ == -1 || _loc4_ == -1 || param1 < _loc3_ || param1 > _loc4_)
         {
            return 0;
         }
         if(param1 > _loc3_ && param1 < _loc4_)
         {
            return 1;
         }
         if(useVirtualLayout)
         {
            if(!this.llv)
            {
               return 0;
            }
            _loc5_ = this.llv.start(param1);
            _loc6_ = this.llv.getMajorSize(param1);
         }
         else
         {
            if(!(_loc11_ = _loc2_.getElementAt(param1)) || !_loc11_.includeInLayout)
            {
               return 0;
            }
            _loc5_ = _loc11_.getLayoutBoundsY();
            _loc6_ = _loc11_.getLayoutBoundsHeight();
         }
         var _loc7_:Number;
         var _loc8_:Number = (_loc7_ = _loc2_.verticalScrollPosition) + _loc2_.height;
         var _loc9_:Number;
         var _loc10_:Number = (_loc9_ = _loc5_) + _loc6_;
         if(_loc9_ >= _loc10_)
         {
            return 1;
         }
         if(_loc9_ >= _loc7_ && _loc10_ <= _loc8_)
         {
            return 1;
         }
         return (Math.min(_loc8_,_loc10_) - Math.max(_loc7_,_loc9_)) / (_loc10_ - _loc9_);
      }
      
      override protected function scrollPositionChanged() : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         super.scrollPositionChanged();
         var _loc1_:GroupBase = target;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = _loc1_.numElements - 1;
         if(_loc2_ < 0)
         {
            this.mx_internal::setIndexInView(-1,-1);
            return;
         }
         var _loc3_:Rectangle = getScrollRect();
         if(!_loc3_)
         {
            this.mx_internal::setIndexInView(0,_loc2_);
            return;
         }
         var _loc4_:Number = _loc3_.top;
         var _loc5_:Number;
         if((_loc5_ = _loc3_.bottom - 0.0001) <= _loc4_)
         {
            this.mx_internal::setIndexInView(-1,-1);
            return;
         }
         if(useVirtualLayout && !this.llv)
         {
            this.mx_internal::setIndexInView(-1,-1);
            return;
         }
         if(useVirtualLayout)
         {
            _loc6_ = this.llv.indexOf(_loc4_);
            _loc7_ = this.llv.indexOf(_loc5_);
         }
         else
         {
            _loc6_ = findIndexAt(_loc4_ + this.gap,this.gap,_loc1_,0,_loc2_);
            _loc7_ = findIndexAt(_loc5_,this.gap,_loc1_,0,_loc2_);
         }
         if(_loc6_ == -1)
         {
            if((_loc8_ = findLayoutElementIndex(_loc1_,0,1)) != -1)
            {
               _loc10_ = (_loc9_ = _loc1_.getElementAt(_loc8_)).getLayoutBoundsY();
               _loc11_ = _loc9_.getLayoutBoundsHeight();
               if(_loc10_ < _loc5_ && _loc10_ + _loc11_ > _loc4_)
               {
                  _loc6_ = _loc8_;
               }
            }
         }
         if(_loc7_ == -1)
         {
            if((_loc12_ = findLayoutElementIndex(_loc1_,_loc2_,-1)) != -1)
            {
               _loc14_ = (_loc13_ = _loc1_.getElementAt(_loc12_)).getLayoutBoundsY();
               _loc15_ = _loc13_.getLayoutBoundsHeight();
               if(_loc14_ < _loc5_ && _loc14_ + _loc15_ > _loc4_)
               {
                  _loc7_ = _loc12_;
               }
            }
         }
         if(useVirtualLayout)
         {
            _loc16_ = _loc1_.getElementAt(this._firstIndexInView);
            _loc17_ = _loc1_.getElementAt(this._lastIndexInView);
            _loc18_ = getScrollRect();
            if(!_loc16_ || !_loc17_ || _loc18_.top < _loc16_.getLayoutBoundsY() || _loc18_.bottom >= _loc17_.getLayoutBoundsY() + _loc17_.getLayoutBoundsHeight())
            {
               _loc1_.invalidateDisplayList();
            }
         }
         this.mx_internal::setIndexInView(_loc6_,_loc7_);
      }
      
      private function findLayoutElementBounds(param1:GroupBase, param2:int, param3:int, param4:Rectangle) : Rectangle
      {
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc5_:int = param1.numElements;
         if(this.fractionOfElementInView(param2) >= 1)
         {
            param2 += param3;
            if(param2 < 0)
            {
               return new Rectangle(0,0,0,this.paddingTop);
            }
            if(param2 >= _loc5_)
            {
               return new Rectangle(0,this.getElementBounds(_loc5_ - 1).bottom,0,this.paddingBottom);
            }
         }
         while(param2 >= 0 && param2 < _loc5_)
         {
            if(_loc6_ = this.getElementBounds(param2))
            {
               _loc7_ = param3 == -1 && _loc6_.top == param4.top && _loc6_.bottom >= param4.bottom;
               _loc8_ = param3 == 1 && _loc6_.bottom == param4.bottom && _loc6_.top <= param4.top;
               if(!(_loc7_ || _loc8_))
               {
                  return _loc6_;
               }
            }
            param2 += param3;
         }
         return null;
      }
      
      override protected function getElementBoundsAboveScrollRect(param1:Rectangle) : Rectangle
      {
         return this.findLayoutElementBounds(target,this.firstIndexInView,-1,param1);
      }
      
      override protected function getElementBoundsBelowScrollRect(param1:Rectangle) : Rectangle
      {
         return this.findLayoutElementBounds(target,this.lastIndexInView,1,param1);
      }
      
      private function getElementWidth(param1:ILayoutElement, param2:Boolean, param3:SizesAndLimit) : void
      {
         var _loc4_:Number = Math.ceil(param1.getPreferredBoundsWidth());
         var _loc5_:Boolean;
         var _loc6_:Number = (_loc5_ = !isNaN(param1.percentWidth) || param2) ? Math.ceil(param1.getMinBoundsWidth()) : _loc4_;
         param3.preferredSize = _loc4_;
         param3.minSize = _loc6_;
      }
      
      private function getElementHeight(param1:ILayoutElement, param2:Number, param3:SizesAndLimit) : void
      {
         var _loc4_:Number = isNaN(param2) ? Math.ceil(param1.getPreferredBoundsHeight()) : param2;
         var _loc5_:* = !isNaN(param1.percentHeight);
         var _loc6_:Number = !isNaN(param1.percentHeight) ? Math.ceil(param1.getMinBoundsHeight()) : _loc4_;
         param3.preferredSize = _loc4_;
         param3.minSize = _loc6_;
      }
      
      mx_internal function getRowsToMeasure(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.requestedRowCount != -1)
         {
            _loc2_ = this.requestedRowCount;
         }
         else
         {
            _loc2_ = param1;
            if(this.requestedMaxRowCount != -1)
            {
               _loc2_ = Math.min(this.requestedMaxRowCount,_loc2_);
            }
            if(this.requestedMinRowCount != -1)
            {
               _loc2_ = Math.max(this.requestedMinRowCount,_loc2_);
            }
         }
         return _loc2_;
      }
      
      private function measureReal(param1:GroupBase) : void
      {
         var _loc14_:* = null;
         var _loc18_:Number = NaN;
         var _loc2_:SizesAndLimit = new SizesAndLimit();
         var _loc3_:* = this.horizontalAlign == HorizontalAlign.JUSTIFY;
         var _loc4_:int;
         var _loc5_:int = _loc4_ = param1.numElements;
         var _loc6_:int = this.requestedRowCount;
         var _loc7_:int = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = NaN;
         if(!this.variableRowHeight)
         {
            _loc12_ = this.rowHeight;
         }
         var _loc13_:int = this.mx_internal::getRowsToMeasure(_loc5_);
         var _loc15_:int = 0;
         while(_loc15_ < _loc4_)
         {
            if(!(_loc14_ = param1.getElementAt(_loc15_)) || !_loc14_.includeInLayout)
            {
               _loc5_--;
            }
            else
            {
               if(_loc7_ < _loc13_)
               {
                  this.getElementHeight(_loc14_,_loc12_,_loc2_);
                  _loc8_ += _loc2_.preferredSize;
                  _loc10_ += _loc2_.minSize;
                  _loc7_++;
               }
               this.getElementWidth(_loc14_,_loc3_,_loc2_);
               _loc9_ = Math.max(_loc9_,_loc2_.preferredSize);
               _loc11_ = Math.max(_loc11_,_loc2_.minSize);
            }
            _loc15_++;
         }
         _loc13_ = this.mx_internal::getRowsToMeasure(_loc5_);
         if(_loc7_ < _loc13_)
         {
            if(_loc14_ = typicalLayoutElement)
            {
               this.getElementHeight(_loc14_,_loc12_,_loc2_);
               _loc8_ += _loc2_.preferredSize * (_loc13_ - _loc7_);
               _loc10_ += _loc2_.minSize * (_loc13_ - _loc7_);
               this.getElementWidth(_loc14_,_loc3_,_loc2_);
               _loc9_ = Math.max(_loc9_,_loc2_.preferredSize);
               _loc11_ = Math.max(_loc11_,_loc2_.minSize);
               _loc7_ = _loc13_;
            }
         }
         if(_loc7_ > 1)
         {
            _loc18_ = this.gap * (_loc7_ - 1);
            _loc8_ += _loc18_;
            _loc10_ += _loc18_;
         }
         var _loc16_:Number = this.paddingLeft + this.paddingRight;
         var _loc17_:Number = this.paddingTop + this.paddingBottom;
         param1.measuredHeight = _loc8_ + _loc17_;
         param1.measuredWidth = _loc9_ + _loc16_;
         param1.measuredMinHeight = _loc10_ + _loc17_;
         param1.measuredMinWidth = _loc11_ + _loc16_;
      }
      
      private function updateLLV(param1:GroupBase) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!this.llv)
         {
            this.llv = new LinearLayoutVector();
            this.llv.defaultMinorSize = 71;
            this.llv.defaultMajorSize = 22;
         }
         var _loc2_:ILayoutElement = typicalLayoutElement;
         if(_loc2_)
         {
            _loc3_ = _loc2_.getPreferredBoundsWidth();
            _loc4_ = _loc2_.getPreferredBoundsHeight();
            this.llv.defaultMinorSize = _loc3_;
            this.llv.defaultMajorSize = _loc4_;
         }
         if(!isNaN(this._rowHeight))
         {
            this.llv.defaultMajorSize = this._rowHeight;
         }
         if(param1)
         {
            this.llv.length = param1.numElements;
         }
         this.llv.gap = this.gap;
         this.llv.majorAxisOffset = this.paddingTop;
      }
      
      override public function elementAdded(param1:int) : void
      {
         if(this.llv && param1 >= 0 && useVirtualLayout)
         {
            this.llv.insert(param1);
         }
      }
      
      override public function elementRemoved(param1:int) : void
      {
         if(this.llv && param1 >= 0 && useVirtualLayout)
         {
            this.llv.remove(param1);
         }
      }
      
      private function measureVirtual(param1:GroupBase) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         var _loc2_:int = param1.numElements;
         var _loc3_:int = this.mx_internal::getRowsToMeasure(_loc2_);
         var _loc4_:Number = this.paddingLeft + this.paddingRight;
         var _loc5_:Number = this.paddingTop + this.paddingBottom;
         if(_loc3_ <= 0)
         {
            param1.measuredWidth = param1.measuredMinWidth = _loc4_;
            param1.measuredHeight = param1.measuredMinHeight = _loc5_;
            return;
         }
         this.updateLLV(param1);
         if(this.variableRowHeight)
         {
            _loc6_ = -1;
            if(_loc3_ > this.llv.length)
            {
               _loc6_ = this.llv.length;
               this.llv.length = _loc3_;
            }
            _loc7_ = this.llv.end(_loc3_ - 1) + this.paddingBottom;
            if(_loc8_ = param1 as DataGroup)
            {
               _loc9_ = _loc8_.getItemIndicesInView();
               for each(_loc10_ in _loc9_)
               {
                  if(_loc11_ = _loc8_.getElementAt(_loc10_))
                  {
                     _loc7_ = (_loc7_ -= this.llv.getMajorSize(_loc10_)) + _loc11_.getPreferredBoundsHeight();
                  }
               }
            }
            param1.measuredHeight = _loc7_;
            if(_loc6_ != -1)
            {
               this.llv.length = _loc6_;
            }
         }
         else
         {
            _loc12_ = _loc3_ > 1 ? (_loc3_ - 1) * this.gap : 0;
            param1.measuredHeight = _loc3_ * this.rowHeight + _loc12_ + _loc5_;
         }
         param1.measuredWidth = this.llv.minorSize + _loc4_;
         param1.measuredMinWidth = this.horizontalAlign == HorizontalAlign.JUSTIFY ? this.llv.minMinorSize + _loc4_ : param1.measuredWidth;
         param1.measuredMinHeight = param1.measuredHeight;
      }
      
      override public function measure() : void
      {
         var _loc1_:GroupBase = target;
         if(!_loc1_)
         {
            return;
         }
         if(useVirtualLayout)
         {
            this.measureVirtual(_loc1_);
         }
         else
         {
            this.measureReal(_loc1_);
         }
         _loc1_.measuredWidth = Math.ceil(_loc1_.measuredWidth);
         _loc1_.measuredHeight = Math.ceil(_loc1_.measuredHeight);
         _loc1_.measuredMinWidth = Math.ceil(_loc1_.measuredMinWidth);
         _loc1_.measuredMinHeight = Math.ceil(_loc1_.measuredMinHeight);
      }
      
      override public function getNavigationDestinationIndex(param1:int, param2:uint, param3:Boolean) : int
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(!target || true)
         {
            return -1;
         }
         var _loc4_:int = -1;
         if(param1 == -1)
         {
            if(param2 == NavigationUnit.UP)
            {
               return param3 ? _loc4_ : -1;
            }
            if(param2 == NavigationUnit.DOWN)
            {
               return 0;
            }
         }
         param1 = Math.max(0,Math.min(_loc4_,param1));
         loop2:
         switch(param2)
         {
            case NavigationUnit.UP:
               if(param3 && param1 == 0)
               {
                  _loc5_ = _loc4_;
                  break;
               }
               _loc5_ = param1 - 1;
               break;
            case NavigationUnit.DOWN:
               if(param3 && param1 == _loc4_)
               {
                  _loc5_ = 0;
                  break;
               }
               _loc5_ = param1 + 1;
               break;
            case NavigationUnit.PAGE_UP:
               _loc9_ = _loc8_ = this.firstIndexInView;
               if(this.fractionOfElementInView(_loc9_) < 1)
               {
                  _loc9_ += 1;
               }
               if(_loc9_ < param1 && param1 <= this.lastIndexInView)
               {
                  _loc5_ = _loc9_;
                  break;
               }
               if(param1 == _loc9_ || param1 == _loc8_)
               {
                  _loc7_ = getVerticalScrollPositionDelta(NavigationUnit.PAGE_UP) + getScrollRect().top;
               }
               else
               {
                  _loc7_ = this.getElementBounds(param1).bottom - getScrollRect().height;
               }
               _loc5_ = param1 - 1;
               while(true)
               {
                  if(0 > _loc5_)
                  {
                     break loop2;
                  }
                  if((Boolean(_loc6_ = this.getElementBounds(_loc5_))) && _loc6_.top < _loc7_)
                  {
                     _loc5_ = Math.min(param1 - 1,_loc5_ + 1);
                     break loop2;
                  }
                  _loc5_--;
               }
               break;
            case NavigationUnit.PAGE_DOWN:
               _loc11_ = _loc10_ = this.lastIndexInView;
               if(this.fractionOfElementInView(_loc11_) < 1)
               {
                  _loc11_--;
               }
               if(this.firstIndexInView <= param1 && param1 < _loc11_)
               {
                  _loc5_ = _loc11_;
                  break;
               }
               if(param1 == _loc11_ || param1 == _loc10_)
               {
                  _loc7_ = getVerticalScrollPositionDelta(NavigationUnit.PAGE_DOWN) + getScrollRect().bottom;
               }
               else
               {
                  _loc7_ = this.getElementBounds(param1).top + getScrollRect().height;
               }
               _loc5_ = param1 + 1;
               while(true)
               {
                  if(_loc5_ > _loc4_)
                  {
                     break loop2;
                  }
                  if((Boolean(_loc6_ = this.getElementBounds(_loc5_))) && _loc6_.bottom > _loc7_)
                  {
                     _loc5_ = Math.max(param1 + 1,_loc5_ - 1);
                     break loop2;
                  }
                  _loc5_++;
               }
               break;
            default:
               return super.getNavigationDestinationIndex(param1,param2,param3);
         }
         return Math.max(0,Math.min(_loc4_,_loc5_));
      }
      
      private function calculateElementWidth(param1:ILayoutElement, param2:Number, param3:Number) : Number
      {
         var _loc5_:Number = NaN;
         var _loc4_:Number = param1.percentWidth;
         if(!isNaN(_loc4_))
         {
            _loc5_ = _loc4_ * 0.01 * param2;
            return Math.min(param2,Math.min(param1.getMaxBoundsWidth(),Math.max(param1.getMinBoundsWidth(),_loc5_)));
         }
         switch(this.horizontalAlign)
         {
            case HorizontalAlign.JUSTIFY:
               return param2;
            case HorizontalAlign.CONTENT_JUSTIFY:
               return Math.max(param1.getPreferredBoundsWidth(),param3);
            default:
               return NaN;
         }
      }
      
      private function calculateElementX(param1:ILayoutElement, param2:Number, param3:Number) : Number
      {
         switch(this.horizontalAlign)
         {
            case HorizontalAlign.CENTER:
               return Math.round((param3 - param2) * 0.5);
            case HorizontalAlign.RIGHT:
               return param3 - param2;
            default:
               return 0;
         }
      }
      
      private function updateDisplayListVirtual() : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc21_:* = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:* = null;
         var _loc1_:GroupBase = target;
         var _loc2_:int = _loc1_.numElements;
         var _loc3_:Number = Math.max(0,_loc1_.width - this.paddingLeft - this.paddingRight);
         var _loc4_:Number;
         var _loc5_:Number = (_loc4_ = _loc1_.verticalScrollPosition) + _loc1_.height;
         this.updateLLV(_loc1_);
         var _loc8_:int;
         if((_loc8_ = this.llv.indexOf(Math.max(0,_loc4_ + this.gap))) == -1)
         {
            _loc6_ = this.llv.end(this.llv.length - 1) - this.paddingTop;
            _loc7_ = Math.ceil(_loc6_ + this.paddingTop + this.paddingBottom);
            _loc1_.setContentSize(_loc1_.contentWidth,_loc7_);
            return;
         }
         var _loc9_:Number = NaN;
         if(!this.variableRowHeight)
         {
            _loc9_ = this.rowHeight;
         }
         var _loc10_:* = this.horizontalAlign == HorizontalAlign.JUSTIFY;
         var _loc11_:Number = this.horizontalAlign == HorizontalAlign.JUSTIFY ? _loc3_ : NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = _loc10_ ? Math.max(this.llv.minMinorSize,_loc3_) : this.llv.minorSize;
         var _loc14_:Number = Math.max(_loc13_,_loc3_);
         var _loc15_:Number = this.llv.start(_loc8_);
         var _loc16_:int = _loc8_;
         var _loc17_:Number = this.paddingLeft;
         while(_loc15_ < _loc5_ && _loc16_ < _loc2_)
         {
            _loc21_ = _loc1_.getVirtualElementAt(_loc16_,_loc11_,_loc12_);
            _loc22_ = this.calculateElementWidth(_loc21_,_loc3_,_loc14_);
            _loc23_ = _loc9_;
            _loc21_.setLayoutBoundsSize(_loc22_,_loc23_);
            _loc22_ = _loc21_.getLayoutBoundsWidth();
            _loc23_ = _loc21_.getLayoutBoundsHeight();
            _loc24_ = _loc17_ + this.calculateElementX(_loc21_,_loc22_,_loc14_);
            _loc21_.setLayoutBoundsPosition(_loc24_,_loc15_);
            this.llv.cacheDimensions(_loc16_,_loc21_);
            _loc15_ += _loc23_ + this.gap;
            _loc16_++;
         }
         var _loc18_:int = _loc16_ - 1;
         if(!_loc10_ && this.llv.minorSize != _loc13_)
         {
            _loc13_ = this.llv.minorSize;
            _loc14_ = Math.max(_loc13_,_loc3_);
            if(this.horizontalAlign != HorizontalAlign.LEFT)
            {
               _loc16_ = _loc8_;
               while(_loc16_ <= _loc18_)
               {
                  _loc21_ = _loc1_.getElementAt(_loc16_);
                  _loc22_ = this.calculateElementWidth(_loc21_,_loc3_,_loc14_);
                  _loc21_.setLayoutBoundsSize(_loc22_,_loc21_.getLayoutBoundsHeight());
                  _loc22_ = _loc21_.getLayoutBoundsWidth();
                  _loc24_ = _loc17_ + this.calculateElementX(_loc21_,_loc22_,_loc14_);
                  _loc21_.setLayoutBoundsPosition(_loc24_,_loc21_.getLayoutBoundsY());
                  _loc16_++;
               }
            }
         }
         _loc6_ = this.llv.end(this.llv.length - 1) - this.paddingTop;
         var _loc19_:Number = Math.max(0,_loc1_.height - this.paddingTop - this.paddingBottom);
         if(_loc6_ < _loc19_)
         {
            _loc25_ = _loc19_ - _loc6_;
            _loc26_ = 0;
            if((_loc27_ = this.verticalAlign) == VerticalAlign.MIDDLE)
            {
               _loc26_ = Math.round(_loc25_ / 2);
            }
            else if(_loc27_ == VerticalAlign.BOTTOM)
            {
               _loc26_ = _loc25_;
            }
            if(_loc26_ > 0)
            {
               _loc16_ = _loc8_;
               while(_loc16_ <= _loc18_)
               {
                  _loc21_ = _loc1_.getElementAt(_loc16_);
                  _loc21_.setLayoutBoundsPosition(_loc21_.getLayoutBoundsX(),_loc26_ + _loc21_.getLayoutBoundsY());
                  _loc16_++;
               }
               _loc6_ += _loc26_;
            }
         }
         this.mx_internal::setRowCount(_loc16_ - _loc8_);
         this.mx_internal::setIndexInView(_loc8_,_loc18_);
         var _loc20_:Number = Math.ceil(_loc13_ + this.paddingLeft + this.paddingRight);
         _loc7_ = Math.ceil(_loc6_ + this.paddingTop + this.paddingBottom);
         _loc1_.setContentSize(_loc20_,_loc7_);
      }
      
      private function updateDisplayListReal() : void
      {
         var _loc4_:* = null;
         var _loc19_:int = 0;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc1_:GroupBase = target;
         var _loc2_:Number = Math.max(0,_loc1_.width - this.paddingLeft - this.paddingRight);
         var _loc3_:Number = Math.max(0,_loc1_.height - this.paddingTop - this.paddingBottom);
         var _loc5_:int = _loc1_.numElements;
         var _loc6_:Number = _loc2_;
         if(this.horizontalAlign == HorizontalAlign.CONTENT_JUSTIFY || clipAndEnableScrolling && (this.horizontalAlign == HorizontalAlign.CENTER || this.horizontalAlign == HorizontalAlign.RIGHT))
         {
            _loc19_ = 0;
            while(_loc19_ < _loc5_)
            {
               if(!(!(_loc4_ = _loc1_.getElementAt(_loc19_)) || !_loc4_.includeInLayout))
               {
                  if(!isNaN(_loc4_.percentWidth))
                  {
                     _loc20_ = calculatePercentWidth(_loc4_,_loc2_);
                  }
                  else
                  {
                     _loc20_ = _loc4_.getPreferredBoundsWidth();
                  }
                  _loc6_ = Math.max(_loc6_,Math.ceil(_loc20_));
               }
               _loc19_++;
            }
         }
         var _loc7_:Number = this.distributeHeight(_loc2_,_loc3_,_loc6_);
         var _loc8_:Number = 0;
         if(this.horizontalAlign == HorizontalAlign.CENTER)
         {
            _loc8_ = 0.5;
         }
         else if(this.horizontalAlign == HorizontalAlign.RIGHT)
         {
            _loc8_ = 1;
         }
         var _loc9_:* = 0;
         var _loc10_:Number;
         var _loc11_:Number = (_loc10_ = _loc1_.verticalScrollPosition) + _loc3_;
         var _loc12_:Number = this.paddingLeft;
         var _loc13_:Number = this.paddingTop;
         var _loc14_:Number = this.paddingLeft;
         var _loc15_:Number = this.paddingTop;
         var _loc16_:int = -1;
         var _loc17_:int = -1;
         if(_loc7_ > 0 || !clipAndEnableScrolling)
         {
            if((_loc21_ = this.verticalAlign) == VerticalAlign.MIDDLE)
            {
               _loc13_ = this.paddingTop + Math.round(_loc7_ / 2);
            }
            else if(_loc21_ == VerticalAlign.BOTTOM)
            {
               _loc13_ = this.paddingTop + _loc7_;
            }
         }
         var _loc18_:int = 0;
         while(_loc18_ < _loc5_)
         {
            if(!(!(_loc4_ = _loc1_.getElementAt(_loc18_)) || !_loc4_.includeInLayout))
            {
               _loc22_ = Math.ceil(_loc4_.getLayoutBoundsWidth());
               _loc23_ = Math.ceil(_loc4_.getLayoutBoundsHeight());
               _loc24_ = _loc12_ + (_loc6_ - _loc22_) * _loc8_;
               if(_loc8_ == 0.5)
               {
                  _loc24_ = Math.round(_loc24_);
               }
               _loc4_.setLayoutBoundsPosition(_loc24_,_loc13_);
               _loc14_ = Math.max(_loc14_,_loc24_ + _loc22_);
               _loc15_ = Math.max(_loc15_,_loc13_ + _loc23_);
               if(!clipAndEnableScrolling || _loc13_ < _loc11_ && _loc13_ + _loc23_ > _loc10_ || _loc23_ <= 0 && (_loc13_ == _loc11_ || _loc13_ == _loc10_))
               {
                  _loc9_ += 1;
                  if(_loc16_ == -1)
                  {
                     _loc16_ = _loc17_ = _loc18_;
                  }
                  else
                  {
                     _loc17_ = _loc18_;
                  }
               }
               _loc13_ += _loc23_ + this.gap;
            }
            _loc18_++;
         }
         this.mx_internal::setRowCount(_loc9_);
         this.mx_internal::setIndexInView(_loc16_,_loc17_);
         _loc1_.setContentSize(Math.ceil(_loc14_ + this.paddingRight),Math.ceil(_loc15_ + this.paddingBottom));
      }
      
      private function distributeHeight(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc4_:Number = param2;
         var _loc5_:Number = 0;
         var _loc6_:* = [];
         var _loc9_:Number = this.variableRowHeight ? 0 : Math.ceil(this.rowHeight);
         var _loc10_:int;
         var _loc11_:int = _loc10_ = 0;
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_)
         {
            if(!(_loc8_ = target.getElementAt(_loc12_)) || !_loc8_.includeInLayout)
            {
               _loc11_--;
            }
            else if(!isNaN(_loc8_.percentHeight) && this.variableRowHeight)
            {
               _loc5_ += _loc8_.percentHeight;
               (_loc7_ = new LayoutElementFlexChildInfo()).layoutElement = _loc8_;
               _loc7_.percent = _loc8_.percentHeight;
               _loc7_.min = _loc8_.getMinBoundsHeight();
               _loc7_.max = _loc8_.getMaxBoundsHeight();
               _loc6_.push(_loc7_);
            }
            else
            {
               sizeLayoutElement(_loc8_,param1,this.horizontalAlign,param3,NaN,this.variableRowHeight,_loc9_);
               _loc4_ -= Math.ceil(_loc8_.getLayoutBoundsHeight());
            }
            _loc12_++;
         }
         if(_loc11_ > 1)
         {
            _loc4_ -= (_loc11_ - 1) * this.gap;
         }
         if(_loc5_)
         {
            Flex.flexChildrenProportionally(param2,_loc4_,_loc5_,_loc6_);
            _loc13_ = 0;
            for each(_loc7_ in _loc6_)
            {
               _loc14_ = Math.round(_loc7_.size + _loc13_);
               _loc13_ += Number(_loc7_.size) - _loc14_;
               sizeLayoutElement(_loc7_.layoutElement,param1,this.horizontalAlign,param3,_loc14_,this.variableRowHeight,_loc9_);
               _loc4_ -= _loc14_;
            }
         }
         return _loc4_;
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:GroupBase = target;
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_.numElements == 0 || param1 == 0 || param2 == 0)
         {
            this.mx_internal::setRowCount(0);
            this.mx_internal::setIndexInView(-1,-1);
            if(_loc3_.numElements == 0)
            {
               _loc3_.setContentSize(Math.ceil(this.paddingLeft + this.paddingRight),Math.ceil(this.paddingTop + this.paddingBottom));
            }
            return;
         }
         if(useVirtualLayout)
         {
            this.updateDisplayListVirtual();
         }
         else
         {
            this.updateDisplayListReal();
         }
      }
      
      private function invalidateTargetSizeAndDisplayList() : void
      {
         var _loc1_:GroupBase = target;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.invalidateSize();
         _loc1_.invalidateDisplayList();
      }
      
      override protected function calculateDropIndex(param1:Number, param2:Number) : int
      {
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:GroupBase = target;
         var _loc4_:int;
         if((_loc4_ = _loc3_.numElements) == 0)
         {
            return 0;
         }
         var _loc5_:Number = 0;
         var _loc6_:int = -1;
         var _loc7_:int = this.firstIndexInView;
         var _loc8_:int = this.lastIndexInView;
         var _loc9_:int = _loc7_;
         while(_loc9_ <= _loc8_)
         {
            if(_loc10_ = this.getElementBounds(_loc9_))
            {
               if(_loc10_.top <= param2 && param2 <= _loc10_.bottom)
               {
                  _loc12_ = _loc10_.y + _loc10_.height / 2;
                  return param2 < _loc12_ ? _loc9_ : _loc9_ + 1;
               }
               if((_loc11_ = Math.min(Math.abs(param2 - _loc10_.top),Math.abs(param2 - _loc10_.bottom))) < _loc5_)
               {
                  _loc5_ = _loc11_;
                  _loc6_ = param2 < _loc10_.top ? _loc9_ : _loc9_ + 1;
               }
            }
            _loc9_++;
         }
         if(_loc6_ == -1)
         {
            _loc6_ = this.getElementBounds(0).y < param2 ? _loc4_ : 0;
         }
         return _loc6_;
      }
      
      override protected function calculateDropIndicatorBounds(param1:DropLocation) : Rectangle
      {
         var _loc11_:* = null;
         var _loc2_:int = param1.dropIndex;
         var _loc3_:int = 0;
         var _loc4_:Number;
         if((_loc4_ = this.gap) < 0 && _loc2_ == _loc3_)
         {
            _loc4_ = 0;
         }
         var _loc5_:Number = 0 < _loc4_ ? _loc4_ : 0;
         var _loc6_:Number = 0;
         if(false)
         {
            _loc6_ = _loc2_ < _loc3_ ? this.getElementBounds(_loc2_).top - _loc5_ : this.getElementBounds(_loc2_ - 1).bottom + _loc4_ - _loc5_;
         }
         var _loc7_:Number = Math.max(target.width,target.contentWidth) - this.paddingLeft - this.paddingRight;
         var _loc8_:Number = _loc5_;
         if(dropIndicator is IVisualElement)
         {
            _loc11_ = IVisualElement(dropIndicator);
            _loc8_ = Math.max(Math.min(_loc8_,_loc11_.getMaxBoundsHeight(false)),_loc11_.getMinBoundsHeight(false));
         }
         var _loc9_:Number = this.paddingLeft;
         var _loc10_:Number = _loc6_ + Math.round((_loc5_ - _loc8_) / 2);
         _loc10_ = Math.max(-1,Math.min(0 - _loc8_ + 1,_loc10_));
         return new Rectangle(_loc9_,_loc10_,_loc7_,_loc8_);
      }
      
      override protected function calculateDragScrollDelta(param1:DropLocation, param2:Number) : Point
      {
         var _loc3_:Point = super.calculateDragScrollDelta(param1,param2);
         if(_loc3_)
         {
            _loc3_.x = 0;
         }
         return _loc3_;
      }
      
      override mx_internal function getElementNearestScrollPosition(param1:Point, param2:String = "center") : int
      {
         var _loc6_:* = null;
         if(!useVirtualLayout)
         {
            return super.mx_internal::getElementNearestScrollPosition(param1,param2);
         }
         var _loc3_:GroupBase = GroupBase(target);
         if(!_loc3_)
         {
            return -1;
         }
         this.updateLLV(_loc3_);
         var _loc4_:int;
         if((_loc4_ = this.llv.indexOf(param1.y)) == -1)
         {
            _loc4_ = param1.y < 0 ? 0 : _loc3_.numElements - 1;
         }
         var _loc5_:Rectangle = this.llv.getBounds(_loc4_);
         if((param2 == "bottomLeft" || param2 == "bottomRight") && _loc4_ > 0)
         {
            _loc6_ = this.llv.getBounds(_loc4_ - 1);
            if(Point.distance(param1,_loc6_.bottomRight) < Point.distance(param1,_loc5_.bottomRight))
            {
               _loc4_--;
            }
         }
         if((param2 == "topLeft" || param2 == "topRight") && _loc4_ < _loc3_.numElements - 1)
         {
            _loc6_ = this.llv.getBounds(_loc4_ + 1);
            if(Point.distance(param1,_loc6_.topLeft) < Point.distance(param1,_loc5_.topLeft))
            {
               _loc4_++;
            }
         }
         return _loc4_;
      }
   }
}

import mx.containers.utilityClasses.FlexChildInfo;
import mx.core.ILayoutElement;

class LayoutElementFlexChildInfo extends FlexChildInfo
{
    
   
   public var layoutElement:ILayoutElement;
   
   function LayoutElementFlexChildInfo()
   {
      super();
   }
}

class SizesAndLimit
{
    
   
   public var preferredSize:Number;
   
   public var minSize:Number;
   
   function SizesAndLimit()
   {
      super();
   }
}
