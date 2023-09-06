package spark.components.supportClasses
{
   import flash.geom.Point;
   import mx.core.IUIComponent;
   import mx.core.InteractionMode;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   import mx.utils.MatrixUtil;
   import spark.components.Scroller;
   import spark.core.IViewport;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class ScrollerLayout extends LayoutBase
   {
      
      mx_internal static const SDT:Number = 1;
       
      
      private var invalidationCount:int = 0;
      
      private var _canScrollHorizontally:Boolean;
      
      private var _canScrollVertically:Boolean;
      
      private var hsbScaleX:Number = 1;
      
      private var hsbScaleY:Number = 1;
      
      private var vsbScaleX:Number = 1;
      
      private var vsbScaleY:Number = 1;
      
      public function ScrollerLayout()
      {
         super();
      }
      
      private function getScroller() : Scroller
      {
         var _loc1_:Skin = target as Skin;
         return Boolean(_loc1_) && "hostComponent" in _loc1_ ? Object(_loc1_).hostComponent as Scroller : null;
      }
      
      private function getLayoutContentSize(param1:IViewport) : Point
      {
         var _loc2_:Number = param1.contentWidth;
         var _loc3_:Number = param1.contentHeight;
         if(_loc2_ == 0 && _loc3_ == 0 || (isNaN(_loc2_) || isNaN(_loc3_)))
         {
            return new Point(0,0);
         }
         return MatrixUtil.transformSize(_loc2_,_loc3_,param1.getLayoutMatrix());
      }
      
      mx_internal function get canScrollHorizontally() : Boolean
      {
         return this._canScrollHorizontally;
      }
      
      mx_internal function get canScrollVertically() : Boolean
      {
         return this._canScrollVertically;
      }
      
      private function get hsbVisible() : Boolean
      {
         var _loc1_:ScrollBarBase = this.getScroller().horizontalScrollBar;
         return Boolean(_loc1_) && _loc1_.visible;
      }
      
      private function set hsbVisible(param1:Boolean) : void
      {
         var _loc2_:ScrollBarBase = this.getScroller().horizontalScrollBar;
         if(!_loc2_ || _loc2_.visible == param1)
         {
            return;
         }
         _loc2_.includeInLayout = _loc2_.visible = param1;
         if(param1)
         {
            if(_loc2_.scaleX == 0)
            {
               _loc2_.scaleX = this.hsbScaleX;
            }
            if(_loc2_.scaleY == 0)
            {
               _loc2_.scaleY = this.hsbScaleY;
            }
         }
         else
         {
            if(_loc2_.scaleX != 0)
            {
               this.hsbScaleX = _loc2_.scaleX;
            }
            if(_loc2_.scaleY != 0)
            {
               this.hsbScaleY = _loc2_.scaleY;
            }
            _loc2_.scaleX = _loc2_.scaleY = 0;
         }
      }
      
      private function hsbRequiredHeight() : Number
      {
         var _loc1_:Scroller = this.getScroller();
         var _loc2_:Number = _loc1_.minViewportInset;
         var _loc3_:ScrollBarBase = _loc1_.horizontalScrollBar;
         var _loc4_:Number = this.hsbVisible ? 1 : this.hsbScaleY;
         return Math.max(_loc2_,_loc3_.getPreferredBoundsHeight(this.hsbVisible) * _loc4_);
      }
      
      private function hsbFits(param1:Number, param2:Number, param3:Boolean = true) : Boolean
      {
         var _loc5_:* = null;
         if(this.vsbVisible && param3)
         {
            _loc5_ = this.getScroller().verticalScrollBar;
            param1 -= _loc5_.getPreferredBoundsWidth();
            param2 -= _loc5_.getMinBoundsHeight();
         }
         var _loc4_:ScrollBarBase = this.getScroller().horizontalScrollBar;
         return param1 >= _loc4_.getMinBoundsWidth() && param2 >= _loc4_.getPreferredBoundsHeight();
      }
      
      private function get vsbVisible() : Boolean
      {
         var _loc1_:ScrollBarBase = this.getScroller().verticalScrollBar;
         return Boolean(_loc1_) && _loc1_.visible;
      }
      
      private function set vsbVisible(param1:Boolean) : void
      {
         var _loc2_:ScrollBarBase = this.getScroller().verticalScrollBar;
         if(!_loc2_ || _loc2_.visible == param1)
         {
            return;
         }
         _loc2_.includeInLayout = _loc2_.visible = param1;
         if(param1)
         {
            if(_loc2_.scaleX == 0)
            {
               _loc2_.scaleX = this.vsbScaleX;
            }
            if(_loc2_.scaleY == 0)
            {
               _loc2_.scaleY = this.vsbScaleY;
            }
         }
         else
         {
            if(_loc2_.scaleX != 0)
            {
               this.vsbScaleX = _loc2_.scaleX;
            }
            if(_loc2_.scaleY != 0)
            {
               this.vsbScaleY = _loc2_.scaleY;
            }
            _loc2_.scaleX = _loc2_.scaleY = 0;
         }
      }
      
      private function vsbRequiredWidth() : Number
      {
         var _loc1_:Scroller = this.getScroller();
         var _loc2_:Number = _loc1_.minViewportInset;
         var _loc3_:ScrollBarBase = _loc1_.verticalScrollBar;
         var _loc4_:Number = this.vsbVisible ? 1 : this.vsbScaleX;
         return Math.max(_loc2_,_loc3_.getPreferredBoundsWidth(this.vsbVisible) * _loc4_);
      }
      
      private function vsbFits(param1:Number, param2:Number, param3:Boolean = true) : Boolean
      {
         var _loc5_:* = null;
         if(this.hsbVisible && param3)
         {
            _loc5_ = this.getScroller().horizontalScrollBar;
            param1 -= _loc5_.getMinBoundsWidth();
            param2 -= _loc5_.getPreferredBoundsHeight();
         }
         var _loc4_:ScrollBarBase = this.getScroller().verticalScrollBar;
         return param1 >= _loc4_.getPreferredBoundsWidth() && param2 >= _loc4_.getMinBoundsHeight();
      }
      
      override public function measure() : void
      {
         var _loc19_:* = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Boolean = false;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Boolean = false;
         var _loc1_:Scroller = this.getScroller();
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Number = _loc1_.minViewportInset;
         var _loc3_:Boolean = _loc1_.measuredSizeIncludesScrollBars && _loc1_.getStyle("interactionMode") == InteractionMode.MOUSE;
         var _loc4_:Number = _loc2_;
         var _loc5_:Number = _loc2_;
         var _loc6_:ScrollBarBase = _loc1_.horizontalScrollBar;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         if(_loc3_)
         {
            switch(_loc1_.getStyle("horizontalScrollPolicy"))
            {
               case ScrollPolicy.ON:
                  if(_loc6_)
                  {
                     _loc7_ = true;
                     break;
                  }
                  break;
               case ScrollPolicy.AUTO:
                  if(_loc6_)
                  {
                     _loc7_ = _loc6_.visible;
                  }
                  _loc8_ = true;
            }
         }
         var _loc9_:ScrollBarBase = _loc1_.verticalScrollBar;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(_loc3_)
         {
            switch(_loc1_.getStyle("verticalScrollPolicy"))
            {
               case ScrollPolicy.ON:
                  if(_loc9_)
                  {
                     _loc10_ = true;
                     break;
                  }
                  break;
               case ScrollPolicy.AUTO:
                  if(_loc9_)
                  {
                     _loc10_ = _loc9_.visible;
                  }
                  _loc11_ = true;
            }
         }
         _loc5_ += _loc7_ ? this.hsbRequiredHeight() : _loc2_;
         _loc4_ += _loc10_ ? this.vsbRequiredWidth() : _loc2_;
         var _loc12_:IViewport;
         if(_loc12_ = _loc1_.viewport)
         {
            if(_loc3_)
            {
               _loc19_ = this.getLayoutContentSize(_loc12_);
               _loc20_ = Number(_loc12_.getPreferredBoundsWidth());
               _loc21_ = _loc19_.x;
               _loc22_ = Number(_loc12_.getLayoutBoundsWidth());
               _loc23_ = !isNaN(_loc22_) && _loc22_ + mx_internal::SDT > _loc21_;
               if(_loc8_ && !_loc7_ && _loc20_ + mx_internal::SDT <= _loc21_ && _loc23_)
               {
                  _loc4_ += _loc22_;
               }
               else
               {
                  _loc4_ += Math.max(_loc20_,_loc7_ ? _loc6_.getMinBoundsWidth() : 0);
               }
               _loc24_ = Number(_loc12_.getPreferredBoundsHeight());
               _loc25_ = _loc19_.y;
               _loc26_ = Number(_loc12_.getLayoutBoundsHeight());
               _loc27_ = !isNaN(_loc26_) && _loc26_ + mx_internal::SDT > _loc25_;
               if(_loc11_ && !_loc10_ && _loc24_ + mx_internal::SDT <= _loc25_ && _loc27_)
               {
                  _loc5_ += _loc26_;
               }
               else
               {
                  _loc5_ += Math.max(_loc24_,_loc10_ ? _loc9_.getMinBoundsHeight() : 0);
               }
            }
            else
            {
               _loc4_ += _loc12_.getPreferredBoundsWidth();
               _loc5_ += _loc12_.getPreferredBoundsHeight();
            }
         }
         var _loc13_:Number = _loc2_ * 2;
         var _loc14_:Number = _loc2_ * 2;
         var _loc15_:IUIComponent;
         var _loc16_:Number = !!(_loc15_ = _loc12_ as IUIComponent) ? Number(_loc15_.explicitWidth) : NaN;
         var _loc17_:Number = !!_loc15_ ? Number(_loc15_.explicitHeight) : NaN;
         if(!isNaN(_loc16_))
         {
            _loc13_ += _loc16_;
         }
         if(!isNaN(_loc17_))
         {
            _loc14_ += _loc17_;
         }
         var _loc18_:GroupBase;
         (_loc18_ = target).measuredWidth = Math.ceil(_loc4_);
         _loc18_.measuredHeight = Math.ceil(_loc5_);
         _loc18_.measuredMinWidth = Math.ceil(_loc13_);
         _loc18_.measuredMinHeight = Math.ceil(_loc14_);
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc23_:* = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:* = null;
         var _loc3_:Scroller = this.getScroller();
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IViewport = _loc3_.viewport;
         var _loc5_:ScrollBarBase = _loc3_.horizontalScrollBar;
         var _loc6_:ScrollBarBase = _loc3_.verticalScrollBar;
         var _loc7_:Number = _loc3_.minViewportInset;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         if(_loc4_)
         {
            _loc8_ = (_loc23_ = this.getLayoutContentSize(_loc4_)).x;
            _loc9_ = _loc23_.y;
         }
         var _loc10_:IUIComponent;
         var _loc11_:Number = !!(_loc10_ = _loc4_ as IUIComponent) ? Number(_loc10_.explicitWidth) : NaN;
         var _loc12_:Number = !!_loc10_ ? Number(_loc10_.explicitHeight) : NaN;
         var _loc13_:Number = isNaN(_loc11_) ? param1 - _loc7_ * 2 : _loc11_;
         var _loc14_:Number = isNaN(_loc12_) ? param2 - _loc7_ * 2 : _loc12_;
         var _loc15_:Boolean = this.hsbVisible;
         var _loc16_:Boolean = this.vsbVisible;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = true;
         switch(_loc3_.getStyle("horizontalScrollPolicy"))
         {
            case ScrollPolicy.ON:
               this._canScrollHorizontally = true;
               this.hsbVisible = true;
               break;
            case ScrollPolicy.AUTO:
               if(_loc4_)
               {
                  _loc17_ = true;
                  this._canScrollHorizontally = _loc8_ >= _loc13_ + mx_internal::SDT;
                  this.hsbVisible = Boolean(_loc5_) && this._canScrollHorizontally;
                  break;
               }
               break;
            default:
               this._canScrollHorizontally = false;
               this.hsbVisible = false;
         }
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = true;
         switch(_loc3_.getStyle("verticalScrollPolicy"))
         {
            case ScrollPolicy.ON:
               this._canScrollVertically = true;
               this.vsbVisible = true;
               break;
            case ScrollPolicy.AUTO:
               if(_loc4_)
               {
                  _loc19_ = true;
                  this._canScrollVertically = _loc9_ >= _loc14_ + mx_internal::SDT;
                  this.vsbVisible = Boolean(_loc6_) && this._canScrollVertically;
                  break;
               }
               break;
            default:
               this._canScrollVertically = false;
               this.vsbVisible = false;
         }
         if(_loc3_.getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            _loc18_ = false;
            this.hsbVisible = _loc3_.mx_internal::horizontalScrollInProgress;
            _loc20_ = false;
            this.vsbVisible = _loc3_.mx_internal::verticalScrollInProgress;
         }
         if(isNaN(_loc11_))
         {
            _loc13_ = param1 - (this.vsbVisible && _loc20_ ? _loc7_ + this.vsbRequiredWidth() : _loc7_ * 2);
         }
         else
         {
            _loc13_ = _loc11_;
         }
         if(isNaN(_loc12_))
         {
            _loc14_ = param2 - (this.hsbVisible && _loc18_ ? _loc7_ + this.hsbRequiredHeight() : _loc7_ * 2);
         }
         else
         {
            _loc14_ = _loc12_;
         }
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = false;
         if(this.vsbVisible && !this.hsbVisible && _loc17_ && _loc8_ >= _loc13_ + mx_internal::SDT)
         {
            this.hsbVisible = _loc21_ = this._canScrollHorizontally = true;
         }
         else if(!this.vsbVisible && this.hsbVisible && _loc19_ && _loc9_ >= _loc14_ + mx_internal::SDT)
         {
            this.vsbVisible = _loc22_ = this._canScrollVertically = true;
         }
         if(this.hsbVisible && _loc18_ && (this.vsbVisible && _loc20_))
         {
            if(!(this.hsbFits(param1,param2) && this.vsbFits(param1,param2)))
            {
               if(!this.hsbFits(param1,param2,false) && !this.vsbFits(param1,param2,false))
               {
                  this.hsbVisible = false;
                  this.vsbVisible = false;
               }
               else if(_loc21_)
               {
                  if(this.vsbFits(param1,param2,false))
                  {
                     this.hsbVisible = false;
                  }
                  else
                  {
                     this.vsbVisible = this.hsbVisible = false;
                  }
               }
               else if(_loc22_)
               {
                  if(this.hsbFits(param1,param2,false))
                  {
                     this.vsbVisible = false;
                  }
                  else
                  {
                     this.hsbVisible = this.vsbVisible = false;
                  }
               }
               else if(this.vsbFits(param1,param2,false))
               {
                  this.hsbVisible = false;
               }
               else
               {
                  this.vsbVisible = false;
               }
            }
         }
         else if(this.hsbVisible && _loc18_ && !this.hsbFits(param1,param2))
         {
            this.hsbVisible = false;
         }
         else if(this.vsbVisible && _loc20_ && !this.vsbFits(param1,param2))
         {
            this.vsbVisible = false;
         }
         if(_loc21_ && !this.vsbVisible)
         {
            this._canScrollHorizontally = false;
         }
         if(_loc22_ && !this.hsbVisible)
         {
            this._canScrollVertically = false;
         }
         if(isNaN(_loc11_))
         {
            _loc13_ = param1 - (this.vsbVisible && _loc20_ ? _loc7_ + this.vsbRequiredWidth() : _loc7_ * 2);
         }
         else
         {
            _loc13_ = _loc11_;
         }
         if(isNaN(_loc12_))
         {
            _loc14_ = param2 - (this.hsbVisible && _loc18_ ? _loc7_ + this.hsbRequiredHeight() : _loc7_ * 2);
         }
         else
         {
            _loc14_ = _loc12_;
         }
         if(_loc4_)
         {
            _loc4_.setLayoutBoundsSize(_loc13_,_loc14_);
            _loc4_.setLayoutBoundsPosition(_loc7_,_loc7_);
         }
         if(this.hsbVisible)
         {
            _loc24_ = _loc5_.getPreferredBoundsHeight();
            _loc25_ = this.vsbVisible ? param1 - _loc6_.getPreferredBoundsWidth() : param1;
            _loc5_.setLayoutBoundsSize(Math.max(_loc5_.getMinBoundsWidth(),_loc25_),_loc24_);
            _loc5_.setLayoutBoundsPosition(0,param2 - _loc24_);
         }
         if(this.vsbVisible)
         {
            _loc26_ = _loc6_.getPreferredBoundsWidth();
            _loc27_ = this.hsbVisible ? param2 - _loc5_.getPreferredBoundsHeight() : param2;
            _loc6_.setLayoutBoundsSize(_loc26_,Math.max(_loc6_.getMinBoundsHeight(),_loc27_));
            _loc6_.setLayoutBoundsPosition(param1 - _loc26_,0);
         }
         if(this.invalidationCount < 2 && (this.vsbVisible != _loc16_ && _loc19_ || this.hsbVisible != _loc15_ && _loc17_))
         {
            target.invalidateSize();
            if((_loc28_ = _loc4_ as GroupBase) && _loc28_.layout && _loc28_.layout.useVirtualLayout)
            {
               _loc28_.invalidateSize();
            }
            this.invalidationCount += 1;
         }
         else
         {
            this.invalidationCount = 0;
         }
         target.setContentSize(param1,param2);
      }
   }
}
