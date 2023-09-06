package spark.components
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.SoftKeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.core.EventPriority;
   import mx.core.FlexGlobals;
   import mx.core.IFactory;
   import mx.core.IInvalidating;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.InteractionMode;
   import mx.core.LayoutDirection;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.TouchInteractionEvent;
   import mx.managers.IFocusManagerComponent;
   import mx.styles.IStyleClient;
   import spark.components.supportClasses.GroupBase;
   import spark.components.supportClasses.ScrollerLayout;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.components.supportClasses.TouchScrollHelper;
   import spark.core.IGraphicElement;
   import spark.core.IViewport;
   import spark.core.NavigationUnit;
   import spark.effects.Animate;
   import spark.effects.ThrowEffect;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.events.CaretBoundsChangeEvent;
   import spark.layouts.supportClasses.LayoutBase;
   import spark.utils.MouseEventUtil;
   
   public class Scroller extends SkinnableComponent implements IFocusManagerComponent, IVisualElementContainer
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const PULL_TENSION_RATIO:Number = 0.5;
      
      private static const ZERO_POINT:Point = new Point(0,0);
      
      private static const MAX_DRAG_RATE:Number = 30;
      
      private static const HORIZONTAL_SCROLL_POSITION:String = "horizontalScrollPosition";
      
      private static const VERTICAL_SCROLL_POSITION:String = "verticalScrollPosition";
      
      mx_internal static var dragEventThinning:Boolean = true;
      
      private static const TEXT_SELECTION_AUTO_SCROLL_FPS:int = 10;
       
      
      mx_internal var minSlopInches:Number = 0.079365;
      
      mx_internal var throwEffectDecelFactor:Number = 0.998;
      
      mx_internal var pageDragDistanceThreshold:Number = 0.5;
      
      mx_internal var pageThrowVelocityThreshold:Number = 0.8;
      
      private var scrollRangesChanged:Boolean = false;
      
      private var pageScrollingChanged:Boolean = false;
      
      private var snappingModeChanged:Boolean = false;
      
      private var _pullEnabled:Boolean = true;
      
      private var _bounceEnabled:Boolean = true;
      
      private var touchScrollHelper:TouchScrollHelper;
      
      private var hspBeforeTouchScroll:Number;
      
      private var vspBeforeTouchScroll:Number;
      
      mx_internal var throwEffect:ThrowEffect;
      
      private var throwFinalVSP:Number;
      
      private var throwFinalHSP:Number;
      
      private var throwReachedMaximumScrollPosition:Boolean;
      
      private var stoppedPreemptively:Boolean = false;
      
      private var captureNextClick:Boolean = false;
      
      private var captureNextMouseDown:Boolean = false;
      
      private var hideScrollBarAnimation:Animate;
      
      private var hideScrollBarAnimationPrematurelyStopped:Boolean;
      
      mx_internal var inTouchInteraction:Boolean = false;
      
      private var minVerticalScrollPosition:Number = 0;
      
      private var maxVerticalScrollPosition:Number = 0;
      
      private var minHorizontalScrollPosition:Number = 0;
      
      private var maxHorizontalScrollPosition:Number = 0;
      
      private var snapElementAnimation:Animate;
      
      private var currentPageScrollPosition:Number;
      
      private var lastSnappedElement:int = -1;
      
      private var orientationChangeSnapElement:int = -1;
      
      private var previousOrientationPageCount:int = 0;
      
      mx_internal var ensureElementIsVisibleForSoftKeyboard:Boolean = true;
      
      private var lastFocusedElement:IVisualElement;
      
      private var aspectRatio:String;
      
      private var oldSoftKeyboardHeight:Number = NaN;
      
      private var oldSoftKeyboardWidth:Number = NaN;
      
      mx_internal var preventThrows:Boolean = false;
      
      private var lastFocusedElementCaretBounds:Rectangle;
      
      private var captureNextCaretBoundsChange:Boolean = false;
      
      private var _42694078horizontalScrollBar:HScrollBar;
      
      [SkinPart(type="spark.components.HScrollBar",required="false")]
      public var horizontalScrollBarFactory:IFactory;
      
      private var _horizontalScrollInProgress:Boolean = false;
      
      private var _1618627376verticalScrollBar:VScrollBar;
      
      [SkinPart(type="spark.components.VScrollBar",required="false")]
      public var verticalScrollBarFactory:IFactory;
      
      private var _verticalScrollInProgress:Boolean = false;
      
      private var _viewport:IViewport;
      
      private var _minViewportInset:Number = 0;
      
      private var _measuredSizeIncludesScrollBars:Boolean = true;
      
      private var _pageScrollingEnabled:Boolean = false;
      
      private var _scrollSnappingMode:String = "none";
      
      private var settingScrollPosition:Boolean = false;
      
      mx_internal var textSelectionAutoScrollEnabled:Boolean = false;
      
      private var textSelectionAutoScrollTimer:Timer;
      
      private var minTextSelectionVScrollPos:int = 0;
      
      private var maxTextSelectionVScrollPos:int = -1;
      
      private var minTextSelectionHScrollPos:int = 0;
      
      private var maxTextSelectionHScrollPos:int = -1;
      
      public function Scroller()
      {
         super();
         hasFocusableChildren = true;
         focusEnabled = false;
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStageHandler);
      }
      
      mx_internal function get pullEnabled() : Boolean
      {
         return this._pullEnabled;
      }
      
      mx_internal function set pullEnabled(param1:Boolean) : void
      {
         if(this._pullEnabled == param1)
         {
            return;
         }
         this._pullEnabled = param1;
         this.scrollRangesChanged = true;
         invalidateProperties();
      }
      
      mx_internal function get bounceEnabled() : Boolean
      {
         return this._bounceEnabled;
      }
      
      mx_internal function set bounceEnabled(param1:Boolean) : void
      {
         if(this._bounceEnabled == param1)
         {
            return;
         }
         this._bounceEnabled = param1;
         this.scrollRangesChanged = true;
         invalidateProperties();
      }
      
      private function ensureDeferredHScrollBarCreated() : void
      {
         if(!this.horizontalScrollBar && Boolean(this.horizontalScrollBarFactory))
         {
            this.horizontalScrollBar = HScrollBar(createDynamicPartInstance("horizontalScrollBarFactory"));
            Group(this.skin).addElement(this.horizontalScrollBar);
            this.partAdded("horizontalScrollBar",this.horizontalScrollBar);
         }
      }
      
      mx_internal function get horizontalScrollInProgress() : Boolean
      {
         return this._horizontalScrollInProgress;
      }
      
      mx_internal function set horizontalScrollInProgress(param1:Boolean) : void
      {
         this._horizontalScrollInProgress = param1;
         if(param1 && getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            this.ensureDeferredHScrollBarCreated();
         }
      }
      
      private function ensureDeferredVScrollBarCreated() : void
      {
         if(!this.verticalScrollBar && Boolean(this.verticalScrollBarFactory))
         {
            this.verticalScrollBar = VScrollBar(createDynamicPartInstance("verticalScrollBarFactory"));
            Group(this.skin).addElement(this.verticalScrollBar);
            this.partAdded("verticalScrollBar",this.verticalScrollBar);
         }
      }
      
      mx_internal function get verticalScrollInProgress() : Boolean
      {
         return this._verticalScrollInProgress;
      }
      
      mx_internal function set verticalScrollInProgress(param1:Boolean) : void
      {
         this._verticalScrollInProgress = param1;
         if(param1 && getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            this.ensureDeferredVScrollBarCreated();
         }
      }
      
      [Bindable(event="viewportChanged")]
      public function get viewport() : IViewport
      {
         return this._viewport;
      }
      
      public function set viewport(param1:IViewport) : void
      {
         if(param1 == this._viewport)
         {
            return;
         }
         this.uninstallViewport();
         this._viewport = param1;
         this.installViewport();
         dispatchEvent(new Event("viewportChanged"));
      }
      
      private function installViewport() : void
      {
         if(Boolean(skin) && Boolean(this.viewport))
         {
            this.viewport.clipAndEnableScrolling = true;
            Group(skin).addElementAt(this.viewport,0);
            this.viewport.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.viewport_propertyChangeHandler);
            this.viewport.addEventListener(Event.RESIZE,this.viewport_resizeHandler);
         }
         if(this.verticalScrollBar)
         {
            this.verticalScrollBar.viewport = this.viewport;
         }
         if(this.horizontalScrollBar)
         {
            this.horizontalScrollBar.viewport = this.viewport;
         }
      }
      
      private function uninstallViewport() : void
      {
         if(this.horizontalScrollBar)
         {
            this.horizontalScrollBar.viewport = null;
         }
         if(this.verticalScrollBar)
         {
            this.verticalScrollBar.viewport = null;
         }
         if(Boolean(skin) && Boolean(this.viewport))
         {
            this.viewport.clipAndEnableScrolling = false;
            Group(skin).removeElement(this.viewport);
            this.viewport.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.viewport_propertyChangeHandler);
            this.viewport.removeEventListener(Event.RESIZE,this.viewport_resizeHandler);
         }
      }
      
      public function get minViewportInset() : Number
      {
         return this._minViewportInset;
      }
      
      public function set minViewportInset(param1:Number) : void
      {
         if(param1 == this._minViewportInset)
         {
            return;
         }
         this._minViewportInset = param1;
         this.invalidateSkin();
      }
      
      public function get measuredSizeIncludesScrollBars() : Boolean
      {
         return this._measuredSizeIncludesScrollBars;
      }
      
      public function set measuredSizeIncludesScrollBars(param1:Boolean) : void
      {
         if(param1 == this._measuredSizeIncludesScrollBars)
         {
            return;
         }
         this._measuredSizeIncludesScrollBars = param1;
         this.invalidateSkin();
      }
      
      public function get pageScrollingEnabled() : Boolean
      {
         return this._pageScrollingEnabled;
      }
      
      public function set pageScrollingEnabled(param1:Boolean) : void
      {
         if(param1 == this._pageScrollingEnabled)
         {
            return;
         }
         this._pageScrollingEnabled = param1;
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            if(this.canScrollHorizontally && this.canScrollVertically)
            {
               throw new Error(resourceManager.getString("components","operationSupportedForOneAxisOnly"));
            }
            this.scrollRangesChanged = true;
            this.pageScrollingChanged = true;
            invalidateProperties();
         }
      }
      
      public function get scrollSnappingMode() : String
      {
         return this._scrollSnappingMode;
      }
      
      public function set scrollSnappingMode(param1:String) : void
      {
         if(param1 == this._scrollSnappingMode)
         {
            return;
         }
         this._scrollSnappingMode = param1;
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            if(this.canScrollHorizontally && this.canScrollVertically)
            {
               throw new Error(resourceManager.getString("components","operationSupportedForOneAxisOnly"));
            }
            this.scrollRangesChanged = true;
            this.snappingModeChanged = true;
            invalidateProperties();
         }
      }
      
      public function ensureElementIsVisible(param1:IVisualElement) : void
      {
         this.ensureElementPositionIsVisible(param1);
      }
      
      private function ensureElementPositionIsVisible(param1:IVisualElement, param2:Rectangle = null, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc5_:DisplayObject = param1 as DisplayObject;
         if(param1 is IGraphicElement)
         {
            _loc5_ = IGraphicElement(param1).parent as DisplayObject;
         }
         if(!_loc5_ || !contains(_loc5_))
         {
            return;
         }
         var _loc6_:LayoutBase;
         if(_loc6_ = this.viewportLayout)
         {
            if(Boolean(this.mx_internal::throwEffect) && this.mx_internal::throwEffect.isPlaying)
            {
               this.mx_internal::throwEffect.stop();
               this.snapContentScrollPosition();
            }
            _loc7_ = _loc6_.mx_internal::getScrollPositionDeltaToAnyElement(param1,param2,param3);
            if(_loc10_ = (Boolean(_loc8_ = FlexGlobals.topLevelApplication as Application)) && !_loc8_.resizeForSoftKeyboard && (Boolean(stage) && stage.softKeyboardRect.height > 0))
            {
               _loc9_ = _loc6_.mx_internal::getChildElementBounds(param1);
               _loc11_ = this.globalToLocal(stage.softKeyboardRect.topLeft).y;
               _loc12_ = this.getLayoutBoundsHeight();
               if(_loc11_ >= 0 && _loc11_ < _loc12_ && _loc9_.bottom - this.viewport.verticalScrollPosition > _loc11_)
               {
                  _loc13_ = 0;
                  if(_loc9_.height > _loc11_)
                  {
                     _loc13_ = _loc9_.top;
                  }
                  else
                  {
                     _loc13_ = _loc9_.bottom - _loc11_;
                  }
                  _loc14_ = !!_loc7_ ? _loc7_.x : 0;
                  _loc7_ = new Point(_loc14_,_loc13_ - this.viewport.verticalScrollPosition);
               }
            }
            if(_loc7_)
            {
               this.viewport.horizontalScrollPosition += _loc7_.x;
               this.viewport.verticalScrollPosition += _loc7_.y;
               if(!param2)
               {
                  if(!_loc9_)
                  {
                     _loc9_ = _loc6_.mx_internal::getChildElementBounds(param1);
                  }
                  _loc15_ = 0;
                  if(param1 is IStyleClient)
                  {
                     _loc15_ = Number(IStyleClient(param1).getStyle("focusThickness"));
                  }
                  if(_loc15_)
                  {
                     if(this.viewport.verticalScrollPosition > _loc9_.top - _loc15_)
                     {
                        this.viewport.verticalScrollPosition = _loc9_.top - _loc15_;
                     }
                     else if(this.viewport.verticalScrollPosition + height < _loc9_.bottom + _loc15_)
                     {
                        this.viewport.verticalScrollPosition = _loc9_.bottom + _loc15_ - height;
                     }
                     if(this.viewport.horizontalScrollPosition > _loc9_.left - _loc15_)
                     {
                        this.viewport.horizontalScrollPosition = _loc9_.left - _loc15_;
                     }
                     else if(this.viewport.horizontalScrollPosition + width < _loc9_.right + _loc15_)
                     {
                        this.viewport.horizontalScrollPosition = _loc9_.right + _loc15_ - width;
                     }
                  }
               }
               if(param4 && this.viewport is UIComponent)
               {
                  UIComponent(this.viewport).validateNow();
               }
            }
         }
      }
      
      mx_internal function snapElement(param1:int, param2:Boolean) : Animate
      {
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:LayoutBase = this.viewportLayout;
         if(!_loc3_)
         {
            throw new Error(resourceManager.getString("components","operationRequiresViewportLayout"));
         }
         var _loc4_:Rectangle = _loc3_.getElementBounds(param1);
         switch(this.scrollSnappingMode)
         {
            case ScrollSnappingMode.NONE:
               throw new Error(resourceManager.getString("components","operationRequiresSnappingMode"));
            case ScrollSnappingMode.LEADING_EDGE:
               if(this.canScrollHorizontally)
               {
                  _loc5_ = _loc4_.left;
                  break;
               }
               if(this.canScrollVertically)
               {
                  _loc5_ = _loc4_.top;
                  break;
               }
               break;
            case ScrollSnappingMode.CENTER:
               if(this.canScrollHorizontally)
               {
                  _loc5_ = _loc4_.left + _loc4_.width / 2 - Number(this.viewport.width) / 2;
                  break;
               }
               if(this.canScrollVertically)
               {
                  _loc5_ = _loc4_.top + _loc4_.height / 2 - Number(this.viewport.height) / 2;
                  break;
               }
               break;
            case ScrollSnappingMode.TRAILING_EDGE:
               if(this.canScrollHorizontally)
               {
                  _loc5_ = _loc4_.right - Number(this.viewport.width);
                  break;
               }
               if(this.canScrollVertically)
               {
                  _loc5_ = _loc4_.bottom - Number(this.viewport.height);
                  break;
               }
               break;
         }
         if(this.canScrollHorizontally)
         {
            _loc6_ = HORIZONTAL_SCROLL_POSITION;
         }
         else if(this.canScrollVertically)
         {
            _loc6_ = VERTICAL_SCROLL_POSITION;
         }
         this.mx_internal::stopAnimations();
         if(param2)
         {
            if(!this.snapElementAnimation)
            {
               this.snapElementAnimation = new Animate();
               this.snapElementAnimation.duration = 300;
               this.snapElementAnimation.target = this.viewport;
            }
            _loc7_ = Vector.<MotionPath>([new SimpleMotionPath(_loc6_,null,_loc5_)]);
            this.snapElementAnimation.motionPaths = _loc7_;
            this.snapElementAnimation.play();
            if(this.pageScrollingEnabled)
            {
               this.currentPageScrollPosition = _loc5_;
            }
            return this.snapElementAnimation;
         }
         this.viewport[_loc6_] = _loc5_;
         return null;
      }
      
      mx_internal function stopAnimations() : void
      {
         if(Boolean(this.mx_internal::throwEffect) && this.mx_internal::throwEffect.isPlaying)
         {
            this.mx_internal::throwEffect.stop();
         }
         if(Boolean(this.snapElementAnimation) && this.snapElementAnimation.isPlaying)
         {
            this.snapElementAnimation.stop();
         }
      }
      
      private function getCurrentPageCount() : int
      {
         var _loc1_:Number = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
         var _loc2_:Number = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
         var _loc3_:int = 0;
         if(this.canScrollHorizontally && _loc1_ != 0)
         {
            _loc3_ = Math.ceil(this.viewport.contentWidth / _loc1_);
         }
         else if(this.canScrollVertically && _loc2_ != 0)
         {
            _loc3_ = Math.ceil(this.viewport.contentHeight / _loc2_);
         }
         return _loc3_;
      }
      
      private function checkScrollPosition() : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this.determineScrollRanges();
         var _loc1_:* = this.aspectRatio != FlexGlobals.topLevelApplication.aspectRatio;
         this.aspectRatio = FlexGlobals.topLevelApplication.aspectRatio;
         var _loc2_:Boolean = false;
         if(!this.pageScrollingEnabled)
         {
            if(this.throwReachedMaximumScrollPosition && (this.throwFinalVSP < this.maxVerticalScrollPosition || this.throwFinalHSP < this.maxHorizontalScrollPosition))
            {
               _loc2_ = true;
            }
            if(this.throwFinalVSP > this.maxVerticalScrollPosition || this.throwFinalHSP > this.maxHorizontalScrollPosition)
            {
               _loc2_ = true;
            }
         }
         if(this.scrollSnappingMode != ScrollSnappingMode.NONE || this.pageScrollingEnabled)
         {
            if(this.canScrollHorizontally)
            {
               if(this.getSnappedPosition(this.throwFinalHSP,HORIZONTAL_SCROLL_POSITION) != this.throwFinalHSP)
               {
                  _loc2_ = true;
               }
            }
            if(this.canScrollVertically)
            {
               if(this.getSnappedPosition(this.throwFinalVSP,VERTICAL_SCROLL_POSITION) != this.throwFinalVSP)
               {
                  _loc2_ = true;
               }
            }
         }
         if(this.mx_internal::throwEffect && this.mx_internal::throwEffect.isPlaying && _loc2_)
         {
            if(_loc1_)
            {
               this.mx_internal::throwEffect.stop();
               this.snapContentScrollPosition();
            }
            else
            {
               _loc3_ = this.mx_internal::throwEffect.mx_internal::getCurrentVelocity();
               this.stoppedPreemptively = true;
               this.mx_internal::throwEffect.stop();
               this.stoppedPreemptively = false;
               if(this.setUpThrowEffect(-_loc3_.x,-_loc3_.y))
               {
                  this.mx_internal::throwEffect.play();
               }
            }
         }
         else if(!this.mx_internal::inTouchInteraction)
         {
            if(_loc1_ && this.orientationChangeSnapElement != -1)
            {
               if(this.scrollSnappingMode == ScrollSnappingMode.NONE && this.pageScrollingEnabled)
               {
                  if(this.previousOrientationPageCount == this.getCurrentPageCount())
                  {
                     _loc4_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
                     _loc5_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
                     if(this.canScrollHorizontally)
                     {
                        this.viewport.horizontalScrollPosition = this.orientationChangeSnapElement * _loc4_;
                        this.currentPageScrollPosition = this.viewport.horizontalScrollPosition;
                     }
                     else if(this.canScrollVertically)
                     {
                        this.viewport.verticalScrollPosition = this.orientationChangeSnapElement * _loc5_;
                        this.currentPageScrollPosition = this.viewport.verticalScrollPosition;
                     }
                  }
               }
               else
               {
                  this.mx_internal::snapElement(this.orientationChangeSnapElement,false);
               }
               this.orientationChangeSnapElement = -1;
            }
            this.snapContentScrollPosition();
         }
      }
      
      private function handleSizeChange() : void
      {
         this.checkScrollPosition();
         if(this.pageScrollingEnabled && isNaN(this.currentPageScrollPosition))
         {
            this.determineCurrentPageScrollPosition();
         }
      }
      
      private function determineLeadingEdgeSnappingScrollRanges() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:LayoutBase = this.viewportLayout;
         var _loc4_:int = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,0),"topLeft");
         var _loc5_:Rectangle = _loc1_.getElementBounds(_loc4_);
         if(this.canScrollHorizontally)
         {
            this.minHorizontalScrollPosition = _loc5_.left;
            _loc6_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
            _loc2_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(this.viewport.contentWidth - _loc6_,0),"topLeft");
            do
            {
               _loc3_ = _loc1_.getElementBounds(_loc2_);
               if(this.viewport.contentWidth - _loc3_.left <= _loc6_)
               {
                  break;
               }
            }
            while(++_loc2_ < _loc1_.target.numElements);
            
            this.maxHorizontalScrollPosition = _loc3_.left;
         }
         else if(this.canScrollVertically)
         {
            this.minVerticalScrollPosition = _loc5_.top;
            _loc7_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            _loc2_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,this.viewport.contentHeight - _loc7_),"topLeft");
            do
            {
               _loc3_ = _loc1_.getElementBounds(_loc2_);
               if(this.viewport.contentHeight - _loc3_.top <= _loc7_)
               {
                  break;
               }
            }
            while(++_loc2_ < _loc1_.target.numElements);
            
            this.maxVerticalScrollPosition = _loc3_.top;
         }
      }
      
      private function determineCenterSnappingScrollRanges() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:LayoutBase = this.viewportLayout;
         _loc2_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,0),"center");
         _loc3_ = _loc1_.getElementBounds(_loc2_);
         if(this.canScrollHorizontally)
         {
            _loc6_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
            _loc4_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(this.viewport.contentWidth,0),"center");
            _loc5_ = _loc1_.getElementBounds(_loc4_);
            this.minVerticalScrollPosition = this.maxVerticalScrollPosition = 0;
            this.minHorizontalScrollPosition = _loc3_.left + _loc3_.width / 2 - _loc6_ / 2;
            this.maxHorizontalScrollPosition = _loc5_.left + _loc5_.width / 2 - _loc6_ / 2;
         }
         else if(this.canScrollVertically)
         {
            _loc7_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            _loc4_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,this.viewport.contentHeight),"center");
            _loc5_ = _loc1_.getElementBounds(_loc4_);
            this.minHorizontalScrollPosition = this.maxHorizontalScrollPosition = 0;
            this.minVerticalScrollPosition = _loc3_.top + _loc3_.height / 2 - _loc7_ / 2;
            this.maxVerticalScrollPosition = _loc5_.top + _loc5_.height / 2 - _loc7_ / 2;
         }
      }
      
      private function determineTrailingEdgeSnappingScrollRanges() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:LayoutBase = this.viewportLayout;
         if(this.canScrollHorizontally)
         {
            _loc6_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
            _loc4_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(this.viewport.contentWidth,0),"bottomRight");
            _loc5_ = _loc1_.getElementBounds(_loc4_);
            this.maxHorizontalScrollPosition = _loc5_.right - _loc6_;
            _loc2_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(_loc6_,0),"bottomRight");
            do
            {
               _loc3_ = _loc1_.getElementBounds(_loc2_);
               if(_loc3_.right <= _loc6_)
               {
                  break;
               }
            }
            while(--_loc2_ >= 0);
            
            this.minHorizontalScrollPosition = _loc3_.right - _loc6_;
         }
         else if(this.canScrollVertically)
         {
            _loc7_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            _loc4_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,this.viewport.contentHeight),"bottomRight");
            _loc5_ = _loc1_.getElementBounds(_loc4_);
            this.maxVerticalScrollPosition = _loc5_.bottom - _loc7_;
            _loc2_ = _loc1_.mx_internal::getElementNearestScrollPosition(new Point(0,_loc7_),"bottomRight");
            do
            {
               _loc3_ = _loc1_.getElementBounds(_loc2_);
               if(_loc3_.bottom <= _loc7_)
               {
                  break;
               }
            }
            while(--_loc2_ >= 0);
            
            this.minVerticalScrollPosition = _loc3_.bottom - _loc7_;
         }
      }
      
      private function determineScrollRanges() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         this.minVerticalScrollPosition = this.maxVerticalScrollPosition = 0;
         this.minHorizontalScrollPosition = this.maxHorizontalScrollPosition = 0;
         if(this.viewport)
         {
            _loc1_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            _loc2_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
            if(!this.mx_internal::bounceEnabled && !this.mx_internal::pullEnabled)
            {
               this.minVerticalScrollPosition = this.minHorizontalScrollPosition = 0;
               this.maxVerticalScrollPosition = this.maxHorizontalScrollPosition = Number.MAX_VALUE;
            }
            else if(this.scrollSnappingMode == ScrollSnappingMode.NONE)
            {
               this.maxVerticalScrollPosition = this.viewport.contentHeight > _loc1_ ? this.viewport.contentHeight - _loc1_ : 0;
               if(this.pageScrollingEnabled && this.canScrollVertically && _loc1_ != 0)
               {
                  _loc3_ = this.viewport.contentHeight % _loc1_;
                  if(_loc3_)
                  {
                     this.maxVerticalScrollPosition += _loc1_ - _loc3_;
                  }
               }
               this.maxHorizontalScrollPosition = this.viewport.contentWidth > _loc2_ ? this.viewport.contentWidth - _loc2_ : 0;
               if(this.pageScrollingEnabled && this.canScrollHorizontally && _loc2_ != 0)
               {
                  _loc3_ = this.viewport.contentWidth % _loc2_;
                  if(_loc3_)
                  {
                     this.maxHorizontalScrollPosition += _loc2_ - _loc3_;
                  }
               }
            }
            else
            {
               if(!(_loc4_ = this.viewportLayout) || _loc4_.target.numElements == 0)
               {
                  return;
               }
               if(this.canScrollHorizontally && _loc2_ == 0 || this.canScrollVertically && _loc1_ == 0)
               {
                  return;
               }
               switch(this.scrollSnappingMode)
               {
                  case ScrollSnappingMode.LEADING_EDGE:
                     this.determineLeadingEdgeSnappingScrollRanges();
                     break;
                  case ScrollSnappingMode.CENTER:
                     this.determineCenterSnappingScrollRanges();
                     break;
                  case ScrollSnappingMode.TRAILING_EDGE:
                     this.determineTrailingEdgeSnappingScrollRanges();
               }
            }
         }
         if(this.verticalScrollBar)
         {
            this.verticalScrollBar.mx_internal::contentMinimum = this.minVerticalScrollPosition;
            this.verticalScrollBar.mx_internal::contentMaximum = this.maxVerticalScrollPosition;
         }
         if(this.horizontalScrollBar)
         {
            this.horizontalScrollBar.mx_internal::contentMinimum = this.minHorizontalScrollPosition;
            this.horizontalScrollBar.mx_internal::contentMaximum = this.maxHorizontalScrollPosition;
         }
      }
      
      private function determineCurrentPageScrollPosition() : void
      {
         if(this.canScrollHorizontally)
         {
            this.viewport.horizontalScrollPosition = this.getSnappedPosition(this.viewport.horizontalScrollPosition,HORIZONTAL_SCROLL_POSITION);
            this.currentPageScrollPosition = this.viewport.horizontalScrollPosition;
         }
         else if(this.canScrollVertically)
         {
            this.viewport.verticalScrollPosition = this.getSnappedPosition(this.viewport.verticalScrollPosition,VERTICAL_SCROLL_POSITION);
            this.currentPageScrollPosition = this.viewport.verticalScrollPosition;
         }
      }
      
      private function handleSizeChangeOnUpdateComplete(param1:FlexEvent) : void
      {
         this.viewport.removeEventListener(FlexEvent.UPDATE_COMPLETE,this.handleSizeChangeOnUpdateComplete);
         this.handleSizeChange();
      }
      
      private function viewport_resizeHandler(param1:Event) : void
      {
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            this.viewport.addEventListener(FlexEvent.UPDATE_COMPLETE,this.handleSizeChangeOnUpdateComplete);
         }
      }
      
      private function viewport_propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         switch(param1.property)
         {
            case "contentWidth":
            case "contentHeight":
               this.invalidateSkin();
               if(getStyle("interactionMode") == InteractionMode.TOUCH)
               {
                  this.viewport.addEventListener(FlexEvent.UPDATE_COMPLETE,this.handleSizeChangeOnUpdateComplete);
                  break;
               }
               break;
            case VERTICAL_SCROLL_POSITION:
            case HORIZONTAL_SCROLL_POSITION:
               if(getStyle("interactionMode") == InteractionMode.TOUCH)
               {
                  if(!this.mx_internal::inTouchInteraction && (!this.snapElementAnimation || !this.snapElementAnimation.isPlaying))
                  {
                     if(!this.settingScrollPosition)
                     {
                        this.settingScrollPosition = true;
                        this.viewport[param1.property] = this.getSnappedPosition(Number(param1.newValue),String(param1.property));
                        this.settingScrollPosition = false;
                     }
                     if(this.canScrollHorizontally && param1.property == HORIZONTAL_SCROLL_POSITION)
                     {
                        this.currentPageScrollPosition = this.viewport.horizontalScrollPosition;
                     }
                     if(this.canScrollVertically && param1.property == VERTICAL_SCROLL_POSITION)
                     {
                        this.currentPageScrollPosition = this.viewport.verticalScrollPosition;
                        break;
                     }
                     break;
                  }
                  if(this.mx_internal::throwEffect && this.mx_internal::throwEffect.isPlaying && this.mx_internal::throwEffect.mx_internal::isSnapping)
                  {
                     if(Math.abs(this.viewport.horizontalScrollPosition - this.mx_internal::throwEffect.mx_internal::finalPosition.x) < 1 && Math.abs(this.viewport.verticalScrollPosition - this.mx_internal::throwEffect.mx_internal::finalPosition.y) < 1)
                     {
                        this.mx_internal::throwEffect.stop();
                        this.snapContentScrollPosition();
                        break;
                     }
                     break;
                  }
                  break;
               }
         }
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:* = null;
         super.focusInHandler(param1);
         if(Boolean(this.viewport) && this.mx_internal::ensureElementIsVisibleForSoftKeyboard)
         {
            _loc2_ = focusManager.getFocus() as IVisualElement;
            this.lastFocusedElement = _loc2_;
         }
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         this.lastFocusedElement = null;
      }
      
      private function orientationChangingHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         this.orientationChangeSnapElement = -1;
         if(this.scrollSnappingMode == ScrollSnappingMode.NONE && this.pageScrollingEnabled)
         {
            _loc2_ = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
            _loc3_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            if(this.canScrollHorizontally && _loc2_ != 0)
            {
               this.orientationChangeSnapElement = this.currentPageScrollPosition / _loc2_;
            }
            else if(this.canScrollVertically && _loc3_ != 0)
            {
               this.orientationChangeSnapElement = this.currentPageScrollPosition / _loc3_;
            }
            this.previousOrientationPageCount = this.getCurrentPageCount();
         }
         else if(this.scrollSnappingMode != ScrollSnappingMode.NONE)
         {
            if(this.canScrollHorizontally)
            {
               this.getSnappedPosition(this.viewport.horizontalScrollPosition,HORIZONTAL_SCROLL_POSITION);
            }
            else if(this.canScrollVertically)
            {
               this.getSnappedPosition(this.viewport.verticalScrollPosition,VERTICAL_SCROLL_POSITION);
            }
            this.orientationChangeSnapElement = this.lastSnappedElement;
         }
         if(this.viewportLayout)
         {
            this.viewportLayout.clearVirtualLayoutCache();
         }
      }
      
      public function get numElements() : int
      {
         return !!this.viewport ? 1 : 0;
      }
      
      public function getElementAt(param1:int) : IVisualElement
      {
         if(Boolean(this.viewport) && param1 == 0)
         {
            return this.viewport;
         }
         throw new RangeError(resourceManager.getString("components","indexOutOfRange",[param1]));
      }
      
      public function getElementIndex(param1:IVisualElement) : int
      {
         if(param1 != null && param1 == this.viewport)
         {
            return 0;
         }
         throw ArgumentError(resourceManager.getString("components","elementNotFoundInScroller",[param1]));
      }
      
      public function addElement(param1:IVisualElement) : IVisualElement
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function addElementAt(param1:IVisualElement, param2:int) : IVisualElement
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function removeElement(param1:IVisualElement) : IVisualElement
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function removeElementAt(param1:int) : IVisualElement
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function removeAllElements() : void
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function setElementIndex(param1:IVisualElement, param2:int) : void
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function swapElements(param1:IVisualElement, param2:IVisualElement) : void
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         throw new ArgumentError(resourceManager.getString("components","operationNotSupported"));
      }
      
      private function invalidateSkin() : void
      {
         if(skin)
         {
            skin.invalidateSize();
            skin.invalidateDisplayList();
         }
      }
      
      mx_internal function get scrollerLayout() : ScrollerLayout
      {
         if(skin)
         {
            return Group(skin).layout as ScrollerLayout;
         }
         return null;
      }
      
      private function get canScrollHorizontally() : Boolean
      {
         var _loc1_:ScrollerLayout = this.mx_internal::scrollerLayout;
         if(_loc1_)
         {
            return _loc1_.mx_internal::canScrollHorizontally;
         }
         return false;
      }
      
      private function get canScrollVertically() : Boolean
      {
         var _loc1_:ScrollerLayout = this.mx_internal::scrollerLayout;
         if(_loc1_)
         {
            return _loc1_.mx_internal::canScrollVertically;
         }
         return false;
      }
      
      private function get viewportLayout() : LayoutBase
      {
         if(this.viewport is GroupBase)
         {
            return GroupBase(this.viewport).layout;
         }
         if(this.viewport is SkinnableContainer)
         {
            return SkinnableContainer(this.viewport).layout;
         }
         return null;
      }
      
      private function installTouchListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_STARTING,this.touchInteractionStartingHandler);
         addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_START,this.touchInteractionStartHandler);
         addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_END,this.touchInteractionEndHandler);
         addEventListener(MouseEvent.CLICK,this.touchScrolling_captureMouseHandler,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.touchScrolling_captureMouseHandler,true);
      }
      
      private function uninstallTouchListeners() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         removeEventListener(TouchInteractionEvent.TOUCH_INTERACTION_STARTING,this.touchInteractionStartingHandler);
         removeEventListener(TouchInteractionEvent.TOUCH_INTERACTION_START,this.touchInteractionStartHandler);
         removeEventListener(TouchInteractionEvent.TOUCH_INTERACTION_END,this.touchInteractionEndHandler);
         removeEventListener(MouseEvent.CLICK,this.touchScrolling_captureMouseHandler,true);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.touchScrolling_captureMouseHandler,true);
      }
      
      private function determineNewPageScrollPosition(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this.mx_internal::pageThrowVelocityThreshold * 0 / 1000;
         if(this.canScrollHorizontally)
         {
            if(param1 < -_loc3_ || this.viewport.horizontalScrollPosition >= this.currentPageScrollPosition + Number(this.viewport.width) * this.mx_internal::pageDragDistanceThreshold)
            {
               this.currentPageScrollPosition = Math.min(this.currentPageScrollPosition + this.viewport.width,this.maxHorizontalScrollPosition);
            }
            else if(param1 > _loc3_ || this.viewport.horizontalScrollPosition <= this.currentPageScrollPosition - Number(this.viewport.width) * this.mx_internal::pageDragDistanceThreshold)
            {
               this.currentPageScrollPosition = Math.max(this.currentPageScrollPosition - Number(this.viewport.width),this.minHorizontalScrollPosition);
            }
            this.currentPageScrollPosition = this.getSnappedPosition(this.currentPageScrollPosition,HORIZONTAL_SCROLL_POSITION);
         }
         else if(this.canScrollVertically)
         {
            if(param2 < -_loc3_ || this.viewport.verticalScrollPosition >= this.currentPageScrollPosition + Number(this.viewport.height) * this.mx_internal::pageDragDistanceThreshold)
            {
               this.currentPageScrollPosition = Math.min(this.currentPageScrollPosition + this.viewport.height,this.maxVerticalScrollPosition);
            }
            else if(param2 > _loc3_ || this.viewport.verticalScrollPosition <= this.currentPageScrollPosition - Number(this.viewport.height) * this.mx_internal::pageDragDistanceThreshold)
            {
               this.currentPageScrollPosition = Math.max(this.currentPageScrollPosition - Number(this.viewport.height),this.minVerticalScrollPosition);
            }
            this.currentPageScrollPosition = this.getSnappedPosition(this.currentPageScrollPosition,VERTICAL_SCROLL_POSITION);
         }
      }
      
      private function setUpThrowEffect(param1:Number, param2:Number) : Boolean
      {
         var _loc7_:Number = NaN;
         if(!this.mx_internal::throwEffect)
         {
            this.mx_internal::throwEffect = new ThrowEffect();
            this.mx_internal::throwEffect.target = this.viewport;
            this.mx_internal::throwEffect.addEventListener(EffectEvent.EFFECT_END,this.throwEffect_effectEndHandler);
         }
         var _loc3_:Number = this.minHorizontalScrollPosition;
         var _loc4_:Number = this.minVerticalScrollPosition;
         var _loc5_:Number = this.maxHorizontalScrollPosition;
         var _loc6_:Number = this.maxVerticalScrollPosition;
         if(this.pageScrollingEnabled)
         {
            this.determineNewPageScrollPosition(param1,param2);
            _loc7_ = 0.25;
            param1 *= _loc7_;
            param2 *= _loc7_;
            if(this.canScrollHorizontally)
            {
               _loc3_ = _loc5_ = this.currentPageScrollPosition;
            }
            else if(this.canScrollVertically)
            {
               _loc4_ = _loc6_ = this.currentPageScrollPosition;
            }
         }
         this.mx_internal::throwEffect.mx_internal::propertyNameX = this.canScrollHorizontally ? HORIZONTAL_SCROLL_POSITION : null;
         this.mx_internal::throwEffect.mx_internal::propertyNameY = this.canScrollVertically ? VERTICAL_SCROLL_POSITION : null;
         this.mx_internal::throwEffect.mx_internal::startingVelocityX = param1;
         this.mx_internal::throwEffect.mx_internal::startingVelocityY = param2;
         this.mx_internal::throwEffect.mx_internal::startingPositionX = this.viewport.horizontalScrollPosition;
         this.mx_internal::throwEffect.mx_internal::startingPositionY = this.viewport.verticalScrollPosition;
         this.mx_internal::throwEffect.mx_internal::minPositionX = _loc3_;
         this.mx_internal::throwEffect.mx_internal::minPositionY = _loc4_;
         this.mx_internal::throwEffect.mx_internal::maxPositionX = _loc5_;
         this.mx_internal::throwEffect.mx_internal::maxPositionY = _loc6_;
         this.mx_internal::throwEffect.mx_internal::decelerationFactor = this.mx_internal::throwEffectDecelFactor;
         this.mx_internal::throwEffect.mx_internal::finalPositionFilterFunction = this.scrollSnappingMode == ScrollSnappingMode.NONE ? null : this.getSnappedPosition;
         this.throwReachedMaximumScrollPosition = false;
         if(this.mx_internal::throwEffect.mx_internal::setup())
         {
            this.throwFinalHSP = this.mx_internal::throwEffect.mx_internal::finalPosition.x;
            if(this.canScrollHorizontally && this.mx_internal::bounceEnabled && this.throwFinalHSP == this.maxHorizontalScrollPosition)
            {
               this.throwReachedMaximumScrollPosition = true;
            }
            this.throwFinalVSP = this.mx_internal::throwEffect.mx_internal::finalPosition.y;
            if(this.canScrollVertically && this.mx_internal::bounceEnabled && this.throwFinalVSP == this.maxVerticalScrollPosition)
            {
               this.throwReachedMaximumScrollPosition = true;
            }
            return true;
         }
         this.touchScrollHelper.mx_internal::endTouchScroll();
         return false;
      }
      
      private function getSnappedPosition(param1:Number, param2:String) : Number
      {
         var _loc5_:* = null;
         var _loc8_:Number = NaN;
         var _loc3_:LayoutBase = this.viewportLayout;
         var _loc4_:int = -1;
         var _loc6_:Number = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
         var _loc7_:Number = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
         if(this.scrollSnappingMode == ScrollSnappingMode.NONE && this.pageScrollingEnabled)
         {
            if(this.canScrollHorizontally && param2 == HORIZONTAL_SCROLL_POSITION && _loc6_ != 0 && this.viewport.contentWidth != 0)
            {
               if((_loc8_ = param1 % _loc6_) < _loc6_ / 2)
               {
                  param1 -= _loc8_;
               }
               else
               {
                  param1 += _loc6_ - _loc8_;
               }
               param1 = Math.min(Math.max(this.minHorizontalScrollPosition,param1),this.maxHorizontalScrollPosition);
            }
            else if(this.canScrollVertically && param2 == VERTICAL_SCROLL_POSITION && _loc7_ != 0 && this.viewport.contentHeight != 0)
            {
               if((_loc8_ = param1 % _loc7_) < _loc7_ / 2)
               {
                  param1 -= _loc8_;
               }
               else
               {
                  param1 += _loc7_ - _loc8_;
               }
               param1 = Math.min(Math.max(this.minVerticalScrollPosition,param1),this.maxVerticalScrollPosition);
            }
         }
         if(Boolean(_loc3_) && _loc3_.target.numElements > 0)
         {
            switch(this._scrollSnappingMode)
            {
               case ScrollSnappingMode.LEADING_EDGE:
                  if(this.canScrollHorizontally && param2 == HORIZONTAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(param1,0),"topLeft");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).left;
                     break;
                  }
                  if(this.canScrollVertically && param2 == VERTICAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(0,param1),"topLeft");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).top;
                     break;
                  }
                  break;
               case ScrollSnappingMode.CENTER:
                  if(this.canScrollHorizontally && param2 == HORIZONTAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(param1 + _loc6_ / 2,0),"center");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).left + _loc5_.width / 2 - _loc6_ / 2;
                     break;
                  }
                  if(this.canScrollVertically && param2 == VERTICAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(0,param1 + _loc7_ / 2),"center");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).top + _loc5_.height / 2 - _loc7_ / 2;
                     break;
                  }
                  break;
               case ScrollSnappingMode.TRAILING_EDGE:
                  if(this.canScrollHorizontally && param2 == HORIZONTAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(param1 + _loc6_,0),"bottomRight");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).right - _loc6_;
                     break;
                  }
                  if(this.canScrollVertically && param2 == VERTICAL_SCROLL_POSITION)
                  {
                     _loc4_ = _loc3_.mx_internal::getElementNearestScrollPosition(new Point(0,param1 + _loc7_),"bottomRight");
                     param1 = (_loc5_ = _loc3_.getElementBounds(_loc4_)).bottom - _loc7_;
                     break;
                  }
                  break;
            }
         }
         this.lastSnappedElement = _loc4_;
         return Math.round(param1);
      }
      
      private function hideScrollBars() : void
      {
         var _loc2_:* = null;
         if(!this.hideScrollBarAnimation)
         {
            this.hideScrollBarAnimation = new Animate();
            this.hideScrollBarAnimation.addEventListener(EffectEvent.EFFECT_END,this.hideScrollBarAnimation_effectEndHandler);
            this.hideScrollBarAnimation.duration = 500;
            _loc2_ = Vector.<MotionPath>([new SimpleMotionPath("alpha",1,0)]);
            this.hideScrollBarAnimation.motionPaths = _loc2_;
         }
         var _loc1_:* = [];
         if(Boolean(this.horizontalScrollBar) && this.horizontalScrollBar.visible)
         {
            _loc1_.push(this.horizontalScrollBar);
         }
         if(Boolean(this.verticalScrollBar) && this.verticalScrollBar.visible)
         {
            _loc1_.push(this.verticalScrollBar);
         }
         this.hideScrollBarAnimationPrematurelyStopped = false;
         this.hideScrollBarAnimation.play(_loc1_);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(false)
         {
            addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE,this.softKeyboardActivateHandler,false,EventPriority.DEFAULT,true);
            addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE,this.softKeyboardActivateCaptureHandler,true,EventPriority.DEFAULT,true);
            addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.softKeyboardDeactivateHandler,false,EventPriority.DEFAULT,true);
            addEventListener(CaretBoundsChangeEvent.CARET_BOUNDS_CHANGE,this.caretBoundsChangeHandler);
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:* = undefined;
         super.styleChanged(param1);
         var _loc2_:Boolean = param1 == null || param1 == "styleName";
         if(_loc2_ || param1 == "horizontalScrollPolicy" || param1 == "verticalScrollPolicy")
         {
            this.invalidateSkin();
         }
         if(_loc2_ || param1 == "interactionMode")
         {
            if(getStyle("interactionMode") == InteractionMode.TOUCH)
            {
               this.installTouchListeners();
               this.scrollRangesChanged = true;
               invalidateProperties();
               if(!this.touchScrollHelper)
               {
                  this.touchScrollHelper = new TouchScrollHelper();
                  this.touchScrollHelper.mx_internal::target = this;
                  this.touchScrollHelper.mx_internal::dragFunction = this.mx_internal::performDrag;
                  this.touchScrollHelper.mx_internal::throwFunction = this.mx_internal::performThrow;
               }
               if(this.horizontalScrollBar)
               {
                  this.horizontalScrollBar.mouseEnabled = false;
                  this.horizontalScrollBar.mouseChildren = false;
               }
               if(this.verticalScrollBar)
               {
                  this.verticalScrollBar.mouseEnabled = false;
                  this.verticalScrollBar.mouseChildren = false;
               }
            }
            else
            {
               this.ensureDeferredHScrollBarCreated();
               this.ensureDeferredHScrollBarCreated();
               this.uninstallTouchListeners();
               if(this.horizontalScrollBar)
               {
                  this.horizontalScrollBar.mouseEnabled = true;
                  this.horizontalScrollBar.mouseChildren = true;
               }
               if(this.verticalScrollBar)
               {
                  this.verticalScrollBar.mouseEnabled = true;
                  this.verticalScrollBar.mouseChildren = true;
               }
            }
         }
         if(_loc2_ || param1 == "liveScrolling")
         {
            _loc3_ = getStyle("liveScrolling");
            if(_loc3_ === true || _loc3_ === false)
            {
               if(this.verticalScrollBar)
               {
                  this.verticalScrollBar.setStyle("liveDragging",Boolean(_loc3_));
               }
               if(this.horizontalScrollBar)
               {
                  this.horizontalScrollBar.setStyle("liveDragging",Boolean(_loc3_));
               }
            }
         }
      }
      
      override protected function attachSkin() : void
      {
         super.attachSkin();
         if(getStyle("interactionMode") != InteractionMode.TOUCH)
         {
            this.ensureDeferredHScrollBarCreated();
            this.ensureDeferredVScrollBarCreated();
         }
         Group(skin).layout = new ScrollerLayout();
         this.installViewport();
         skin.addEventListener(MouseEvent.MOUSE_WHEEL,this.skin_mouseWheelHandler);
      }
      
      override protected function detachSkin() : void
      {
         this.uninstallViewport();
         Group(skin).layout = null;
         skin.removeEventListener(MouseEvent.MOUSE_WHEEL,this.skin_mouseWheelHandler);
         super.detachSkin();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:* = undefined;
         super.partAdded(param1,param2);
         _loc3_ = getStyle("liveScrolling");
         var _loc4_:Boolean = _loc3_ === true || _loc3_ === false;
         var _loc5_:* = getStyle("interactionMode") == InteractionMode.TOUCH;
         if(param2 == this.verticalScrollBar)
         {
            this.verticalScrollBar.viewport = this.viewport;
            if(_loc4_)
            {
               this.verticalScrollBar.setStyle("liveDragging",Boolean(_loc3_));
            }
            this.verticalScrollBar.mx_internal::contentMinimum = this.minVerticalScrollPosition;
            this.verticalScrollBar.mx_internal::contentMaximum = this.maxVerticalScrollPosition;
            if(_loc5_)
            {
               this.verticalScrollBar.mouseEnabled = false;
               this.verticalScrollBar.mouseChildren = false;
            }
         }
         else if(param2 == this.horizontalScrollBar)
         {
            this.horizontalScrollBar.viewport = this.viewport;
            if(_loc4_)
            {
               this.horizontalScrollBar.setStyle("liveDragging",Boolean(_loc3_));
            }
            this.horizontalScrollBar.mx_internal::contentMinimum = this.minHorizontalScrollPosition;
            this.horizontalScrollBar.mx_internal::contentMaximum = this.maxHorizontalScrollPosition;
            if(_loc5_)
            {
               this.horizontalScrollBar.mouseEnabled = false;
               this.horizontalScrollBar.mouseChildren = false;
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.verticalScrollBar)
         {
            this.verticalScrollBar.viewport = null;
         }
         else if(param2 == this.horizontalScrollBar)
         {
            this.horizontalScrollBar.viewport = null;
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.scrollRangesChanged)
         {
            this.determineScrollRanges();
            this.scrollRangesChanged = false;
         }
         if(this.pageScrollingChanged)
         {
            this.mx_internal::stopAnimations();
            this.determineCurrentPageScrollPosition();
            this.pageScrollingChanged = false;
         }
         if(this.snappingModeChanged)
         {
            this.mx_internal::stopAnimations();
            this.snapContentScrollPosition();
            this.snappingModeChanged = false;
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.keyDownHandler(param1);
         var _loc2_:IViewport = this.viewport;
         if(!_loc2_ || param1.isDefaultPrevented())
         {
            return;
         }
         if(getFocus() is TextField)
         {
            return;
         }
         if(Boolean(this.verticalScrollBar) && this.verticalScrollBar.visible)
         {
            _loc3_ = NaN;
            switch(param1.keyCode)
            {
               case Keyboard.UP:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.UP);
                  break;
               case Keyboard.DOWN:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.DOWN);
                  break;
               case Keyboard.PAGE_UP:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.PAGE_UP);
                  break;
               case Keyboard.PAGE_DOWN:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.PAGE_DOWN);
                  break;
               case Keyboard.HOME:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.HOME);
                  break;
               case Keyboard.END:
                  _loc3_ = _loc2_.getVerticalScrollPositionDelta(NavigationUnit.END);
            }
            if(!isNaN(_loc3_))
            {
               _loc2_.verticalScrollPosition += _loc3_;
               param1.preventDefault();
            }
         }
         if(Boolean(this.horizontalScrollBar) && this.horizontalScrollBar.visible)
         {
            _loc4_ = NaN;
            switch(param1.keyCode)
            {
               case Keyboard.LEFT:
                  _loc4_ = layoutDirection == LayoutDirection.LTR ? _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.LEFT) : _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.RIGHT);
                  break;
               case Keyboard.RIGHT:
                  _loc4_ = layoutDirection == LayoutDirection.LTR ? _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.RIGHT) : _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.LEFT);
                  break;
               case Keyboard.HOME:
                  _loc4_ = _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.HOME);
                  break;
               case Keyboard.END:
                  _loc4_ = _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.END);
                  break;
               case Keyboard.PAGE_UP:
                  if(!this.verticalScrollBar || !this.verticalScrollBar.visible)
                  {
                     _loc4_ = !true ? _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.LEFT) : _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.RIGHT);
                     break;
                  }
                  break;
               case Keyboard.PAGE_DOWN:
                  if(!this.verticalScrollBar || !this.verticalScrollBar.visible)
                  {
                     _loc4_ = !true ? _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.RIGHT) : _loc2_.getHorizontalScrollPositionDelta(NavigationUnit.LEFT);
                     break;
                  }
            }
            if(!isNaN(_loc4_))
            {
               _loc2_.horizontalScrollPosition += _loc4_;
               param1.preventDefault();
            }
         }
      }
      
      private function skin_mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc2_:IViewport = this.viewport;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible)
         {
            return;
         }
         var _loc3_:FlexMouseEvent = MouseEventUtil.createMouseWheelChangingEvent(param1);
         if(!dispatchEvent(_loc3_))
         {
            param1.preventDefault();
            return;
         }
         var _loc4_:int = _loc3_.delta;
         var _loc5_:uint = Math.abs(param1.delta);
         if(Boolean(this.verticalScrollBar) && this.verticalScrollBar.visible)
         {
            _loc6_ = _loc4_ < 0 ? 0 : NavigationUnit.UP;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc8_ = _loc2_.getVerticalScrollPositionDelta(_loc6_);
               if(!isNaN(_loc8_))
               {
                  _loc2_.verticalScrollPosition += _loc8_;
                  if(_loc2_ is IInvalidating)
                  {
                     IInvalidating(_loc2_).validateNow();
                  }
               }
               _loc7_++;
            }
            param1.preventDefault();
         }
         else if(Boolean(this.horizontalScrollBar) && this.horizontalScrollBar.visible)
         {
            _loc6_ = _loc4_ < 0 ? 0 : NavigationUnit.LEFT;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc10_ = _loc2_.getHorizontalScrollPositionDelta(_loc6_);
               if(!isNaN(_loc10_))
               {
                  _loc2_.horizontalScrollPosition += _loc10_;
                  if(_loc2_ is IInvalidating)
                  {
                     IInvalidating(_loc2_).validateNow();
                  }
               }
               _loc9_++;
            }
            param1.preventDefault();
         }
      }
      
      private function touchInteractionStartingHandler(param1:TouchInteractionEvent) : void
      {
         if(param1.relatedObject != this && this.mx_internal::inTouchInteraction)
         {
            param1.preventDefault();
         }
      }
      
      private function touchInteractionStartHandler(param1:TouchInteractionEvent) : void
      {
         if(param1.relatedObject != this)
         {
            this.touchScrollHelper.mx_internal::stopScrollWatch();
         }
         else
         {
            this.captureNextClick = true;
            this.captureNextMouseDown = true;
            this.mx_internal::preventThrows = false;
            this.hspBeforeTouchScroll = this.viewport.horizontalScrollPosition;
            this.vspBeforeTouchScroll = this.viewport.verticalScrollPosition;
            if(this.canScrollHorizontally)
            {
               this.mx_internal::horizontalScrollInProgress = true;
            }
            if(this.canScrollVertically)
            {
               this.mx_internal::verticalScrollInProgress = true;
            }
            skin.invalidateDisplayList();
            if(Boolean(this.hideScrollBarAnimation) && this.hideScrollBarAnimation.isPlaying)
            {
               this.hideScrollBarAnimationPrematurelyStopped = true;
               this.hideScrollBarAnimation.stop();
            }
            if(this.horizontalScrollBar)
            {
               this.horizontalScrollBar.alpha = this.maxHorizontalScrollPosition == 0 && this.minHorizontalScrollPosition == 0 ? 0 : 1;
            }
            if(this.verticalScrollBar)
            {
               this.verticalScrollBar.alpha = this.maxVerticalScrollPosition == 0 && this.minVerticalScrollPosition == 0 ? 0 : 1;
            }
            this.mx_internal::inTouchInteraction = true;
         }
      }
      
      private function snapContentScrollPosition(param1:Boolean = true, param2:Boolean = true) : void
      {
         if(param1 && this.viewport.contentWidth != 0)
         {
            this.viewport.horizontalScrollPosition = this.getSnappedPosition(Math.min(Math.max(this.minHorizontalScrollPosition,this.viewport.horizontalScrollPosition),this.maxHorizontalScrollPosition),HORIZONTAL_SCROLL_POSITION);
         }
         if(param2 && this.viewport.contentHeight != 0)
         {
            this.viewport.verticalScrollPosition = this.getSnappedPosition(Math.min(Math.max(this.minVerticalScrollPosition,this.viewport.verticalScrollPosition),this.maxVerticalScrollPosition),VERTICAL_SCROLL_POSITION);
         }
      }
      
      private function stopThrowEffectOnMouseDown() : void
      {
         if(Boolean(this.mx_internal::throwEffect) && this.mx_internal::throwEffect.isPlaying)
         {
            this.stoppedPreemptively = true;
            this.mx_internal::throwEffect.stop();
            this.snapContentScrollPosition();
            this.hspBeforeTouchScroll = this.viewport.horizontalScrollPosition;
            this.vspBeforeTouchScroll = this.viewport.verticalScrollPosition;
         }
      }
      
      private function touchScrolling_captureMouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               _loc2_ = 0.01984;
               _loc3_ = Math.round(_loc2_ * 0);
               _loc3_ = globalToLocal(new Point(_loc3_,0)).subtract(globalToLocal(ZERO_POINT)).x;
               if(this.captureNextMouseDown && (Math.abs(this.viewport.verticalScrollPosition - this.throwFinalVSP) > _loc3_ || Math.abs(this.viewport.horizontalScrollPosition - this.throwFinalHSP) > _loc3_))
               {
                  this.stopThrowEffectOnMouseDown();
                  this.touchScrollHelper.mx_internal::startScrollWatch(param1,this.canScrollHorizontally,this.canScrollVertically,Math.round(this.mx_internal::minSlopInches * 0),mx_internal::dragEventThinning ? MAX_DRAG_RATE : NaN);
                  param1.stopImmediatePropagation();
                  break;
               }
               if(Boolean(this.mx_internal::throwEffect) && this.mx_internal::throwEffect.isPlaying)
               {
                  this.mx_internal::throwEffect.stop();
                  this.snapContentScrollPosition();
                  break;
               }
               break;
            case MouseEvent.CLICK:
               if(!this.captureNextClick)
               {
                  return;
               }
               param1.stopImmediatePropagation();
               break;
         }
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         this.stopThrowEffectOnMouseDown();
         if(Boolean(this.snapElementAnimation) && this.snapElementAnimation.isPlaying)
         {
            this.snapElementAnimation.stop();
            if(this.pageScrollingEnabled)
            {
               this.determineCurrentPageScrollPosition();
            }
         }
         this.captureNextClick = false;
         this.touchScrollHelper.mx_internal::startScrollWatch(param1,this.canScrollHorizontally,this.canScrollVertically,Math.round(this.mx_internal::minSlopInches * 0),mx_internal::dragEventThinning ? MAX_DRAG_RATE : NaN);
      }
      
      mx_internal function performDrag(param1:Number, param2:Number) : void
      {
         var _loc9_:Number = NaN;
         if(this.mx_internal::textSelectionAutoScrollEnabled)
         {
            this.mx_internal::setUpTextSelectionAutoScroll();
            return;
         }
         var _loc3_:Point = globalToLocal(new Point(param1,param2)).subtract(globalToLocal(ZERO_POINT));
         param1 = _loc3_.x;
         param2 = _loc3_.y;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.canScrollHorizontally)
         {
            _loc4_ = param1;
         }
         if(this.canScrollVertically)
         {
            _loc5_ = param2;
         }
         var _loc6_:Number = this.hspBeforeTouchScroll - _loc4_;
         var _loc7_:Number = this.vspBeforeTouchScroll - _loc5_;
         var _loc8_:Number = isNaN(this.viewport.width) ? 0 : Number(this.viewport.width);
         if(this.mx_internal::pullEnabled)
         {
            if(_loc6_ < this.minHorizontalScrollPosition)
            {
               _loc6_ = Math.round(this.minHorizontalScrollPosition + (_loc6_ - this.minHorizontalScrollPosition) * PULL_TENSION_RATIO);
            }
            if(_loc6_ > this.maxHorizontalScrollPosition)
            {
               _loc6_ = Math.round(this.maxHorizontalScrollPosition + (_loc6_ - this.maxHorizontalScrollPosition) * PULL_TENSION_RATIO);
            }
            _loc9_ = isNaN(this.viewport.height) ? 0 : Number(this.viewport.height);
            if(_loc7_ < this.minVerticalScrollPosition)
            {
               _loc7_ = Math.round(this.minVerticalScrollPosition + (_loc7_ - this.minVerticalScrollPosition) * PULL_TENSION_RATIO);
            }
            if(_loc7_ > this.maxVerticalScrollPosition)
            {
               _loc7_ = Math.round(this.maxVerticalScrollPosition + (_loc7_ - this.maxVerticalScrollPosition) * PULL_TENSION_RATIO);
            }
            _loc6_ = Math.min(Math.max(_loc6_,-_loc8_),this.maxHorizontalScrollPosition + _loc8_);
            _loc7_ = Math.min(Math.max(_loc7_,-_loc9_),this.maxVerticalScrollPosition + _loc9_);
         }
         this.viewport.horizontalScrollPosition = _loc6_;
         this.viewport.verticalScrollPosition = _loc7_;
      }
      
      private function throwEffect_effectEndHandler(param1:EffectEvent) : void
      {
         if(this.stoppedPreemptively)
         {
            return;
         }
         this.touchScrollHelper.mx_internal::endTouchScroll();
      }
      
      mx_internal function performThrow(param1:Number, param2:Number) : void
      {
         if(this.mx_internal::textSelectionAutoScrollEnabled)
         {
            this.mx_internal::stopTextSelectionAutoScroll();
            this.touchScrollHelper.mx_internal::endTouchScroll();
            return;
         }
         if(this.mx_internal::preventThrows || !stage)
         {
            this.touchScrollHelper.mx_internal::endTouchScroll();
            return;
         }
         this.stoppedPreemptively = false;
         var _loc3_:Point = new Point(param1,param2);
         _loc3_.x *= 100000;
         _loc3_.y *= 100000;
         _loc3_ = this.globalToLocal(_loc3_).subtract(this.globalToLocal(new Point(0,0)));
         _loc3_.x /= 100000;
         _loc3_.y /= 100000;
         if(this.setUpThrowEffect(_loc3_.x,_loc3_.y))
         {
            this.mx_internal::throwEffect.play();
         }
      }
      
      private function touchInteractionEndHandler(param1:TouchInteractionEvent) : void
      {
         if(param1.relatedObject == this)
         {
            this.captureNextMouseDown = false;
            this.hideScrollBars();
            this.mx_internal::inTouchInteraction = false;
         }
      }
      
      private function hideScrollBarAnimation_effectEndHandler(param1:EffectEvent) : void
      {
         if(this.hideScrollBarAnimationPrematurelyStopped)
         {
            return;
         }
         this.mx_internal::horizontalScrollInProgress = false;
         this.mx_internal::verticalScrollInProgress = false;
         skin.invalidateDisplayList();
      }
      
      mx_internal function enableTextSelectionAutoScroll(param1:Boolean, param2:int = 0, param3:int = -1, param4:int = 0, param5:int = -1) : void
      {
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            this.mx_internal::textSelectionAutoScrollEnabled = param1;
            this.minTextSelectionHScrollPos = param2;
            this.maxTextSelectionHScrollPos = param3;
            this.minTextSelectionVScrollPos = param4;
            this.maxTextSelectionVScrollPos = param5;
         }
      }
      
      mx_internal function setUpTextSelectionAutoScroll() : void
      {
         if(!this.textSelectionAutoScrollTimer)
         {
            this.textSelectionAutoScrollTimer = new Timer(1000 / TEXT_SELECTION_AUTO_SCROLL_FPS);
            this.textSelectionAutoScrollTimer.addEventListener(TimerEvent.TIMER,this.textSelectionAutoScrollTimerHandler);
            this.textSelectionAutoScrollTimer.start();
         }
      }
      
      mx_internal function stopTextSelectionAutoScroll() : void
      {
         if(this.textSelectionAutoScrollTimer)
         {
            this.textSelectionAutoScrollTimer.stop();
            this.textSelectionAutoScrollTimer.removeEventListener(TimerEvent.TIMER,this.textSelectionAutoScrollTimerHandler);
            this.textSelectionAutoScrollTimer = null;
         }
      }
      
      private function textSelectionAutoScrollTimerHandler(param1:TimerEvent) : void
      {
         var _loc6_:Number = this.viewport.verticalScrollPosition;
         var _loc7_:Number = this.viewport.horizontalScrollPosition;
         if(this.canScrollHorizontally)
         {
            if(mouseX > width - 12)
            {
               _loc7_ += 20;
               if(mouseX > width - 3)
               {
                  _loc7_ += 30;
               }
               if(this.maxTextSelectionHScrollPos != -1 && _loc7_ > this.maxTextSelectionHScrollPos)
               {
                  _loc7_ = this.maxTextSelectionHScrollPos;
               }
            }
            if(mouseX < 12)
            {
               _loc7_ -= 20;
               if(mouseX < 3)
               {
                  _loc7_ -= 30;
               }
               if(_loc7_ < this.minTextSelectionHScrollPos)
               {
                  _loc7_ = this.minTextSelectionHScrollPos;
               }
            }
         }
         if(this.canScrollVertically)
         {
            if(mouseY > height - 12)
            {
               _loc6_ += 20;
               if(mouseY > height - 3)
               {
                  _loc6_ += 30;
               }
               if(this.maxTextSelectionVScrollPos != -1 && _loc6_ > this.maxTextSelectionVScrollPos)
               {
                  _loc6_ = this.maxTextSelectionVScrollPos;
               }
            }
            if(mouseY < 12)
            {
               _loc6_ -= 20;
               if(mouseY < 3)
               {
                  _loc6_ -= 30;
               }
               if(_loc6_ < this.minTextSelectionVScrollPos)
               {
                  _loc6_ = this.minTextSelectionVScrollPos;
               }
            }
         }
         if(_loc7_ != this.viewport.horizontalScrollPosition)
         {
            this.viewport.horizontalScrollPosition = _loc7_;
         }
         if(_loc6_ != this.viewport.verticalScrollPosition)
         {
            this.viewport.verticalScrollPosition = _loc6_;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            systemManager.stage.addEventListener("orientationChanging",this.orientationChangingHandler,true);
         }
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         if(getStyle("interactionMode") == InteractionMode.TOUCH)
         {
            systemManager.stage.removeEventListener("orientationChanging",this.orientationChangingHandler,true);
         }
      }
      
      private function softKeyboardActivateHandler(param1:SoftKeyboardEvent) : void
      {
         var _loc3_:Boolean = false;
         this.mx_internal::preventThrows = true;
         var _loc2_:Rectangle = stage.softKeyboardRect;
         if(_loc2_.width > 0 && _loc2_.height > 0)
         {
            if(this.lastFocusedElement && this.mx_internal::ensureElementIsVisibleForSoftKeyboard && (_loc2_.height != this.oldSoftKeyboardHeight || _loc2_.width != this.oldSoftKeyboardWidth))
            {
               if(this.lastFocusedElementCaretBounds == null)
               {
                  this.ensureElementIsVisible(this.lastFocusedElement);
               }
               else
               {
                  _loc3_ = this.oldSoftKeyboardHeight > 0 || this.oldSoftKeyboardWidth > 0;
                  this.ensureElementPositionIsVisible(this.lastFocusedElement,this.lastFocusedElementCaretBounds,!_loc3_);
                  this.lastFocusedElementCaretBounds = null;
               }
            }
            this.oldSoftKeyboardHeight = _loc2_.height;
            this.oldSoftKeyboardWidth = _loc2_.width;
         }
      }
      
      private function softKeyboardActivateCaptureHandler(param1:SoftKeyboardEvent) : void
      {
         var _loc2_:Rectangle = stage.softKeyboardRect;
         if(_loc2_.width > 0 && _loc2_.height > 0)
         {
            this.captureNextCaretBoundsChange = true;
         }
      }
      
      private function softKeyboardDeactivateHandler(param1:SoftKeyboardEvent) : void
      {
         this.mx_internal::adjustScrollPositionAfterSoftKeyboardDeactivate();
         this.oldSoftKeyboardHeight = NaN;
         this.oldSoftKeyboardWidth = NaN;
         this.mx_internal::preventThrows = false;
      }
      
      mx_internal function adjustScrollPositionAfterSoftKeyboardDeactivate() : void
      {
         if(Boolean(this.mx_internal::throwEffect) && this.mx_internal::throwEffect.isPlaying)
         {
            this.mx_internal::throwEffect.stop();
         }
         this.snapContentScrollPosition();
      }
      
      private function caretBoundsChangeHandler(param1:CaretBoundsChangeEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         param1.preventDefault();
         if(this.captureNextCaretBoundsChange)
         {
            this.lastFocusedElementCaretBounds = param1.newCaretBounds;
            this.captureNextCaretBoundsChange = false;
            return;
         }
         this.ensureElementPositionIsVisible(this.lastFocusedElement,param1.newCaretBounds,false,false);
      }
      
      [Bindable(event="propertyChange")]
      [SkinPart(required="false")]
      public function get horizontalScrollBar() : HScrollBar
      {
         return this._42694078horizontalScrollBar;
      }
      
      [SkinPart(required="false")]
      public function set horizontalScrollBar(param1:HScrollBar) : void
      {
         var _loc2_:Object = this._42694078horizontalScrollBar;
         if(_loc2_ !== param1)
         {
            this._42694078horizontalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalScrollBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      [SkinPart(required="false")]
      public function get verticalScrollBar() : VScrollBar
      {
         return this._1618627376verticalScrollBar;
      }
      
      [SkinPart(required="false")]
      public function set verticalScrollBar(param1:VScrollBar) : void
      {
         var _loc2_:Object = this._1618627376verticalScrollBar;
         if(_loc2_ !== param1)
         {
            this._1618627376verticalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalScrollBar",_loc2_,param1));
            }
         }
      }
   }
}
