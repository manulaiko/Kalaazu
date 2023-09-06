package flashx.textLayout.container
{
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.IMEEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextLineValidity;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuClipboardItems;
   import flash.utils.Timer;
   import flashx.textLayout.compose.FloatCompositionData;
   import flashx.textLayout.compose.FlowDamageType;
   import flashx.textLayout.compose.IFlowComposer;
   import flashx.textLayout.compose.TextFlowLine;
   import flashx.textLayout.compose.TextLineRecycler;
   import flashx.textLayout.edit.EditingMode;
   import flashx.textLayout.edit.IInteractionEventHandler;
   import flashx.textLayout.edit.ISelectionManager;
   import flashx.textLayout.edit.SelectionFormat;
   import flashx.textLayout.elements.BackgroundManager;
   import flashx.textLayout.elements.Configuration;
   import flashx.textLayout.elements.ContainerFormattedElement;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.FlowValueHolder;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.TCYElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.FlowElementMouseEventManager;
   import flashx.textLayout.events.ModelChange;
   import flashx.textLayout.events.ScrollEvent;
   import flashx.textLayout.events.ScrollEventDirection;
   import flashx.textLayout.events.TextLayoutEvent;
   import flashx.textLayout.events.UpdateCompleteEvent;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.formats.Float;
   import flashx.textLayout.formats.FormatValue;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.formats.TextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   import flashx.textLayout.utils.Twips;
   
   public class ContainerController implements IInteractionEventHandler, ITextLayoutFormat, ISandboxSupport
   {
      
      private static var _containerControllerInitialFormat:ITextLayoutFormat = createContainerControllerInitialFormat();
      
      private static var scratchRectangle:Rectangle = new Rectangle();
       
      
      private var _textFlowCache:TextFlow;
      
      private var _rootElement:ContainerFormattedElement;
      
      private var _absoluteStart:int;
      
      private var _textLength:int;
      
      private var _container:Sprite;
      
      private var _mouseEventManager:FlowElementMouseEventManager;
      
      protected var _computedFormat:TextLayoutFormat;
      
      private var _columnState:ColumnState;
      
      private var _compositionWidth:Number = 0;
      
      private var _compositionHeight:Number = 0;
      
      private var _measureWidth:Boolean;
      
      private var _measureHeight:Boolean;
      
      private var _contentLeft:Number;
      
      private var _contentTop:Number;
      
      private var _contentWidth:Number;
      
      private var _contentHeight:Number;
      
      private var _uncomposedTextLength:int;
      
      private var _finalParcelStart:int;
      
      private var _horizontalScrollPolicy:String;
      
      private var _verticalScrollPolicy:String;
      
      private var _xScroll:Number;
      
      private var _yScroll:Number;
      
      private var _minListenersAttached:Boolean = false;
      
      private var _allListenersAttached:Boolean = false;
      
      private var _selectListenersAttached:Boolean = false;
      
      tlf_internal var _mouseWheelListenerAttached:Boolean = false;
      
      private var _shapesInvalid:Boolean = false;
      
      private var _backgroundShape:Shape;
      
      private var _scrollTimer:Timer = null;
      
      protected var _hasScrollRect:Boolean;
      
      private var _linesInView:Array;
      
      private var _updateStart:int;
      
      private var _composedFloats:Array;
      
      private var _floatsInContainer:Array;
      
      private var _shapeChildren:Array;
      
      private var _format:FlowValueHolder;
      
      private var _containerRoot:DisplayObject;
      
      private var _transparentBGX:Number;
      
      private var _transparentBGY:Number;
      
      private var _transparentBGWidth:Number;
      
      private var _transparentBGHeight:Number;
      
      private var blinkTimer:Timer;
      
      private var blinkObject:DisplayObject;
      
      private var _selectionSprite:Sprite;
      
      public function ContainerController(param1:Sprite, param2:Number = 100, param3:Number = 100)
      {
         super();
         this.initialize(param1,param2,param3);
      }
      
      private static function pinValue(param1:Number, param2:Number, param3:Number) : Number
      {
         return Math.min(Math.max(param1,param2),param3);
      }
      
      tlf_internal static function createDefaultContextMenu() : ContextMenu
      {
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.clipboardMenu = true;
         _loc1_.clipboardItems.clear = true;
         _loc1_.clipboardItems.copy = true;
         _loc1_.clipboardItems.cut = true;
         _loc1_.clipboardItems.paste = true;
         _loc1_.clipboardItems.selectAll = true;
         return _loc1_;
      }
      
      private static function createContainerControllerInitialFormat() : ITextLayoutFormat
      {
         var _loc1_:TextLayoutFormat = new TextLayoutFormat();
         _loc1_.columnCount = FormatValue.INHERIT;
         _loc1_.columnGap = FormatValue.INHERIT;
         _loc1_.columnWidth = FormatValue.INHERIT;
         _loc1_.verticalAlign = FormatValue.INHERIT;
         return _loc1_;
      }
      
      public static function get containerControllerInitialFormat() : ITextLayoutFormat
      {
         return _containerControllerInitialFormat;
      }
      
      public static function set containerControllerInitialFormat(param1:ITextLayoutFormat) : void
      {
         _containerControllerInitialFormat = param1;
      }
      
      tlf_internal function get allListenersAttached() : Boolean
      {
         return this._allListenersAttached;
      }
      
      tlf_internal function get hasScrollRect() : Boolean
      {
         return this._hasScrollRect;
      }
      
      private function initialize(param1:Sprite, param2:Number, param3:Number) : void
      {
         this._container = param1;
         this._containerRoot = null;
         this._textLength = 0;
         this._absoluteStart = -1;
         this._columnState = new ColumnState(null,null,null,0,0);
         this._xScroll = this._yScroll = 0;
         this._contentWidth = this._contentHeight = 0;
         this._uncomposedTextLength = 0;
         this._container.doubleClickEnabled = true;
         this._horizontalScrollPolicy = this._verticalScrollPolicy = String(ScrollPolicy.tlf_internal::scrollPolicyPropertyDefinition.defaultValue);
         this._hasScrollRect = false;
         this._shapeChildren = [];
         this._linesInView = [];
         this.setCompositionSize(param2,param3);
         this.format = _containerControllerInitialFormat;
      }
      
      tlf_internal function get effectiveBlockProgression() : String
      {
         return !!this._rootElement ? this._rootElement.computedFormat.blockProgression : BlockProgression.TB;
      }
      
      tlf_internal function getContainerRoot() : DisplayObject
      {
         var x:int = 0;
         if(this._containerRoot == null && this._container && Boolean(this._container.stage))
         {
            try
            {
               x = this._container.stage.numChildren;
               this._containerRoot = this._container.stage;
            }
            catch(e:Error)
            {
               _containerRoot = _container.root;
            }
         }
         return this._containerRoot;
      }
      
      public function get flowComposer() : IFlowComposer
      {
         return !!this.textFlow ? this.textFlow.flowComposer : null;
      }
      
      tlf_internal function get shapesInvalid() : Boolean
      {
         return this._shapesInvalid;
      }
      
      tlf_internal function set shapesInvalid(param1:Boolean) : void
      {
         this._shapesInvalid = param1;
      }
      
      public function get columnState() : ColumnState
      {
         if(this._rootElement == null)
         {
            return null;
         }
         if(this._computedFormat == null)
         {
            this.computedFormat;
         }
         this._columnState.tlf_internal::computeColumns();
         return this._columnState;
      }
      
      public function get container() : Sprite
      {
         return this._container;
      }
      
      public function get compositionWidth() : Number
      {
         return this._compositionWidth;
      }
      
      public function get compositionHeight() : Number
      {
         return this._compositionHeight;
      }
      
      tlf_internal function get measureWidth() : Boolean
      {
         return this._measureWidth;
      }
      
      tlf_internal function get measureHeight() : Boolean
      {
         return this._measureHeight;
      }
      
      public function setCompositionSize(param1:Number, param2:Number) : void
      {
         var _loc3_:* = !(this._compositionWidth == param1 || isNaN(this._compositionWidth) && isNaN(param1));
         var _loc4_:* = !(this._compositionHeight == param2 || isNaN(this._compositionHeight) && isNaN(param2));
         if(_loc3_ || _loc4_)
         {
            this._compositionHeight = param2;
            this._measureHeight = isNaN(this._compositionHeight);
            this._compositionWidth = param1;
            this._measureWidth = isNaN(this._compositionWidth);
            if(this._computedFormat)
            {
               this.tlf_internal::resetColumnState();
            }
            if(this.tlf_internal::effectiveBlockProgression == BlockProgression.TB ? _loc3_ : _loc4_)
            {
               if(Boolean(this.textFlow) && Boolean(this._textLength))
               {
                  this.textFlow.tlf_internal::damage(this.absoluteStart,this._textLength,TextLineValidity.INVALID,false);
               }
            }
            else
            {
               this.invalidateContents();
            }
            this.tlf_internal::attachTransparentBackgroundForHit(false);
         }
      }
      
      public function get textFlow() : TextFlow
      {
         if(!this._textFlowCache && Boolean(this._rootElement))
         {
            this._textFlowCache = this._rootElement.getTextFlow();
         }
         return this._textFlowCache;
      }
      
      public function get rootElement() : ContainerFormattedElement
      {
         return this._rootElement;
      }
      
      tlf_internal function setRootElement(param1:ContainerFormattedElement) : void
      {
         if(this._rootElement != param1)
         {
            if(this._mouseEventManager)
            {
               this._mouseEventManager.stopHitTests();
            }
            if(!param1)
            {
               this._mouseEventManager = null;
            }
            else if(!this._mouseEventManager)
            {
               this._mouseEventManager = new FlowElementMouseEventManager(this.container,null);
            }
            this.tlf_internal::clearCompositionResults();
            this.detachContainer();
            this._rootElement = param1;
            this._textFlowCache = null;
            this._textLength = 0;
            this._absoluteStart = -1;
            this.tlf_internal::attachContainer();
            if(this._rootElement)
            {
               this.tlf_internal::formatChanged();
            }
            if(Boolean(this._container) && false)
            {
               this._container["needsSoftKeyboard"] = this.interactionManager && this.interactionManager.editingMode == EditingMode.READ_WRITE;
            }
         }
      }
      
      public function get interactionManager() : ISelectionManager
      {
         return !!this.textFlow ? this.textFlow.interactionManager : null;
      }
      
      tlf_internal function get uncomposedTextLength() : int
      {
         return this._uncomposedTextLength;
      }
      
      tlf_internal function get finalParcelStart() : int
      {
         return this._finalParcelStart;
      }
      
      tlf_internal function set finalParcelStart(param1:int) : void
      {
         this._finalParcelStart = param1;
      }
      
      public function get absoluteStart() : int
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this._absoluteStart != -1)
         {
            return this._absoluteStart;
         }
         var _loc1_:int = 0;
         var _loc2_:IFlowComposer = this.flowComposer;
         if(_loc2_)
         {
            _loc3_ = _loc2_.getControllerIndex(this);
            if(_loc3_ != 0)
            {
               _loc1_ = (_loc4_ = _loc2_.getControllerAt(_loc3_ - 1)).absoluteStart + _loc4_.textLength;
            }
         }
         this._absoluteStart = _loc1_;
         return _loc1_;
      }
      
      public function get textLength() : int
      {
         return this._textLength;
      }
      
      tlf_internal function setTextLengthOnly(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this._textLength != param1)
         {
            this._textLength = param1;
            this._uncomposedTextLength = 0;
            if(this._absoluteStart != -1)
            {
               _loc2_ = this.flowComposer;
               if(_loc2_)
               {
                  _loc3_ = _loc2_.getControllerIndex(this) + 1;
                  while(_loc3_ < this.flowComposer.numControllers)
                  {
                     if((_loc4_ = _loc2_.getControllerAt(_loc3_++))._absoluteStart == -1)
                     {
                        break;
                     }
                     _loc4_._absoluteStart = -1;
                     _loc4_._uncomposedTextLength = 0;
                  }
               }
            }
         }
      }
      
      tlf_internal function setTextLength(param1:int) : void
      {
         var _loc3_:* = false;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         if(this.textFlow)
         {
            _loc3_ = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL;
            _loc4_ = this.textFlow.flowComposer;
            if(param1 != 0 && _loc4_.getControllerIndex(this) == _loc4_.numControllers - 1 && (!_loc3_ && this._verticalScrollPolicy != ScrollPolicy.OFF || _loc3_ && this._horizontalScrollPolicy != ScrollPolicy.OFF))
            {
               _loc5_ = this.absoluteStart;
               _loc2_ = this.textFlow.textLength - (param1 + _loc5_);
               param1 = this.textFlow.textLength - _loc5_;
            }
         }
         this.tlf_internal::setTextLengthOnly(param1);
         this._uncomposedTextLength = _loc2_;
      }
      
      tlf_internal function updateLength(param1:int, param2:int) : void
      {
         this.tlf_internal::setTextLengthOnly(this._textLength + param2);
      }
      
      public function isDamaged() : Boolean
      {
         return this.flowComposer.isDamaged(this.absoluteStart + this._textLength);
      }
      
      tlf_internal function formatChanged() : void
      {
         this._computedFormat = null;
         this.invalidateContents();
      }
      
      tlf_internal function styleSelectorChanged() : void
      {
         this.tlf_internal::modelChanged(ModelChange.STYLE_SELECTOR_CHANGED,this,0,this._textLength);
         this._computedFormat = null;
      }
      
      tlf_internal function modelChanged(param1:String, param2:ContainerController, param3:int, param4:int, param5:Boolean = true, param6:Boolean = true) : void
      {
         var _loc7_:TextFlow;
         if(_loc7_ = this._rootElement.getTextFlow())
         {
            _loc7_.tlf_internal::processModelChanged(param1,param2,this.absoluteStart + param3,param4,param5,param6);
         }
      }
      
      private function gatherVisibleLines(param1:String, param2:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc3_:Number = this._measureWidth ? this._contentWidth : this._compositionWidth;
         var _loc4_:Number = this._measureHeight ? this._contentHeight : this._compositionHeight;
         var _loc5_:Number = param1 == BlockProgression.RL ? this._xScroll - _loc3_ : this._xScroll;
         var _loc6_:Number = this._yScroll;
         var _loc7_:int = Twips.roundTo(_loc5_);
         var _loc8_:int = Twips.roundTo(_loc6_);
         var _loc9_:int = Twips.to(_loc3_);
         var _loc10_:int = Twips.to(_loc4_);
         var _loc11_:IFlowComposer;
         var _loc12_:int = (_loc11_ = this.flowComposer).findLineIndexAtPosition(this.absoluteStart);
         var _loc13_:int = _loc11_.findLineIndexAtPosition(this.absoluteStart + this._textLength - 1);
         var _loc14_:int = _loc12_;
         while(_loc14_ <= _loc13_)
         {
            if(!((_loc15_ = _loc11_.getLineAt(_loc14_)) == null || _loc15_.controller != this))
            {
               if(_loc16_ = this.tlf_internal::isLineVisible(param1,_loc7_,_loc8_,_loc9_,_loc10_,_loc15_,null))
               {
                  if(param2)
                  {
                     _loc15_.tlf_internal::createShape(param1,_loc16_);
                  }
                  this._linesInView.push(_loc16_);
               }
            }
            _loc14_++;
         }
         this._updateStart = this.absoluteStart;
      }
      
      tlf_internal function fillShapeChildren() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         if(this._textLength == 0)
         {
            return;
         }
         var _loc1_:String = this.tlf_internal::effectiveBlockProgression;
         if(this._linesInView.length == 0)
         {
            this.gatherVisibleLines(_loc1_,true);
         }
         var _loc2_:Boolean = _loc1_ == BlockProgression.RL && (this._horizontalScrollPolicy == ScrollPolicy.OFF && this._verticalScrollPolicy == ScrollPolicy.OFF);
         if(_loc2_)
         {
            _loc3_ = this._measureWidth ? this._contentWidth : this._compositionWidth;
            _loc4_ = this._measureHeight ? this._contentHeight : this._compositionHeight;
            _loc5_ = this._xScroll - _loc3_;
            _loc6_ = this._yScroll;
            if(_loc5_ != 0 || _loc6_ != 0)
            {
               for each(_loc7_ in this._linesInView)
               {
                  if(_loc7_)
                  {
                     if(_loc2_)
                     {
                        _loc7_.x -= _loc5_;
                        _loc7_.y -= _loc6_;
                     }
                  }
               }
               this._contentLeft -= _loc5_;
               this._contentTop -= _loc6_;
            }
         }
      }
      
      public function get horizontalScrollPolicy() : String
      {
         return this._horizontalScrollPolicy;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         var _loc2_:String = ScrollPolicy.tlf_internal::scrollPolicyPropertyDefinition.setHelper(this._horizontalScrollPolicy,param1) as String;
         if(_loc2_ != this._horizontalScrollPolicy)
         {
            this._horizontalScrollPolicy = _loc2_;
            if(this._horizontalScrollPolicy == ScrollPolicy.OFF)
            {
               this.horizontalScrollPosition = 0;
            }
            this.tlf_internal::formatChanged();
         }
      }
      
      tlf_internal function checkScrollBounds() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(this.tlf_internal::effectiveBlockProgression == BlockProgression.RL)
         {
            _loc1_ = this._contentWidth;
            _loc2_ = this.compositionWidth;
            _loc3_ = this._measureWidth;
         }
         else
         {
            _loc1_ = this._contentHeight;
            _loc2_ = this.compositionHeight;
            _loc3_ = this._measureHeight;
         }
         if(this.textFlow && this._container && !this._minListenersAttached)
         {
            if((_loc4_ = !_loc3_ && _loc1_ > _loc2_) != this.tlf_internal::_mouseWheelListenerAttached)
            {
               if(this.tlf_internal::_mouseWheelListenerAttached)
               {
                  this.tlf_internal::removeMouseWheelListener();
               }
               else
               {
                  this.tlf_internal::addMouseWheelListener();
               }
            }
         }
      }
      
      public function get verticalScrollPolicy() : String
      {
         return this._verticalScrollPolicy;
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         var _loc2_:String = ScrollPolicy.tlf_internal::scrollPolicyPropertyDefinition.setHelper(this._verticalScrollPolicy,param1) as String;
         if(_loc2_ != this._verticalScrollPolicy)
         {
            this._verticalScrollPolicy = _loc2_;
            if(this._verticalScrollPolicy == ScrollPolicy.OFF)
            {
               this.verticalScrollPosition = 0;
            }
            this.tlf_internal::formatChanged();
         }
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this._xScroll;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(!this._rootElement)
         {
            return;
         }
         if(this._horizontalScrollPolicy == ScrollPolicy.OFF)
         {
            this._xScroll = 0;
            return;
         }
         var _loc2_:Number = this._xScroll;
         var _loc3_:Number = this.computeHorizontalScrollPosition(param1,true);
         if(_loc3_ != _loc2_)
         {
            this._shapesInvalid = true;
            this._xScroll = _loc3_;
            this.updateForScroll(ScrollEventDirection.HORIZONTAL,_loc3_ - _loc2_);
         }
      }
      
      private function computeHorizontalScrollPosition(param1:Number, param2:Boolean) : Number
      {
         var _loc3_:String = this.tlf_internal::effectiveBlockProgression;
         var _loc4_:Number = this.tlf_internal::contentWidth;
         var _loc5_:Number = 0;
         if(_loc4_ > this._compositionWidth && !this._measureWidth)
         {
            if(_loc3_ == BlockProgression.RL)
            {
               _loc5_ = pinValue(param1,this._contentLeft + this._compositionWidth,this._contentLeft + _loc4_);
               if(param2 && this._uncomposedTextLength != 0 && _loc5_ != this._xScroll)
               {
                  this._xScroll = param1;
                  if(this._xScroll > this._contentLeft + this._contentWidth)
                  {
                     this._xScroll = this._contentLeft + this._contentWidth;
                  }
                  this.flowComposer.composeToController(this.flowComposer.getControllerIndex(this));
                  _loc5_ = pinValue(param1,this._contentLeft + this._compositionWidth,this._contentLeft + this._contentWidth);
               }
            }
            else
            {
               _loc5_ = pinValue(param1,this._contentLeft,this._contentLeft + _loc4_ - this._compositionWidth);
            }
         }
         return _loc5_;
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this._yScroll;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(!this._rootElement)
         {
            return;
         }
         if(this._verticalScrollPolicy == ScrollPolicy.OFF)
         {
            this._yScroll = 0;
            return;
         }
         var _loc2_:Number = this._yScroll;
         var _loc3_:Number = this.computeVerticalScrollPosition(param1,true);
         if(_loc3_ != _loc2_)
         {
            this._shapesInvalid = true;
            this._yScroll = _loc3_;
            this.updateForScroll(ScrollEventDirection.VERTICAL,_loc3_ - _loc2_);
         }
      }
      
      private function computeVerticalScrollPosition(param1:Number, param2:Boolean) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = this.tlf_internal::contentHeight;
         var _loc5_:String = this.tlf_internal::effectiveBlockProgression;
         if(_loc4_ > this._compositionHeight)
         {
            _loc3_ = pinValue(param1,this._contentTop,this._contentTop + (_loc4_ - this._compositionHeight));
            if(param2 && this._uncomposedTextLength != 0 && _loc5_ == BlockProgression.TB)
            {
               this._yScroll = param1;
               if(this._yScroll < this._contentTop)
               {
                  this._yScroll = this._contentTop;
               }
               this.flowComposer.composeToController(this.flowComposer.getControllerIndex(this));
               _loc3_ = pinValue(param1,this._contentTop,this._contentTop + (_loc4_ - this._compositionHeight));
            }
         }
         return _loc3_;
      }
      
      public function getContentBounds() : Rectangle
      {
         return new Rectangle(this._contentLeft,this._contentTop,this.tlf_internal::contentWidth,this.tlf_internal::contentHeight);
      }
      
      tlf_internal function get contentLeft() : Number
      {
         return this._contentLeft;
      }
      
      tlf_internal function get contentTop() : Number
      {
         return this._contentTop;
      }
      
      tlf_internal function computeScaledContentMeasure(param1:Number) : Number
      {
         var _loc2_:int = this.textFlow.textLength - this._finalParcelStart;
         var _loc3_:Number = _loc2_ / (_loc2_ - this._uncomposedTextLength);
         return param1 * _loc3_;
      }
      
      tlf_internal function get contentHeight() : Number
      {
         if(this._uncomposedTextLength == 0 || this.tlf_internal::effectiveBlockProgression != BlockProgression.TB)
         {
            return this._contentHeight;
         }
         return this.tlf_internal::computeScaledContentMeasure(this._contentHeight);
      }
      
      tlf_internal function get contentWidth() : Number
      {
         if(this._uncomposedTextLength == 0 || this.tlf_internal::effectiveBlockProgression != BlockProgression.RL)
         {
            return this._contentWidth;
         }
         return this.tlf_internal::computeScaledContentMeasure(this._contentWidth);
      }
      
      tlf_internal function setContentBounds(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this._contentWidth = param3;
         this._contentHeight = param4;
         this._contentLeft = param1;
         this._contentTop = param2;
         this.tlf_internal::checkScrollBounds();
      }
      
      private function updateForScroll(param1:String, param2:Number) : void
      {
         this._linesInView.length = 0;
         var _loc3_:IFlowComposer = this.textFlow.flowComposer;
         _loc3_.updateToController(_loc3_.getControllerIndex(this));
         this.tlf_internal::attachTransparentBackgroundForHit(false);
         if(this.textFlow.hasEventListener(TextLayoutEvent.SCROLL))
         {
            this.textFlow.dispatchEvent(new ScrollEvent(TextLayoutEvent.SCROLL,false,false,param1,param2));
         }
      }
      
      private function get containerScrollRectLeft() : Number
      {
         var _loc1_:Number = NaN;
         if(this.horizontalScrollPolicy == ScrollPolicy.OFF && this.verticalScrollPolicy == ScrollPolicy.OFF)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL ? this.horizontalScrollPosition - this.compositionWidth : this.horizontalScrollPosition;
         }
         return _loc1_;
      }
      
      private function get containerScrollRectRight() : Number
      {
         return this.containerScrollRectLeft + this.compositionWidth;
      }
      
      private function get containerScrollRectTop() : Number
      {
         var _loc1_:Number = NaN;
         if(this.horizontalScrollPolicy == ScrollPolicy.OFF && this.verticalScrollPolicy == ScrollPolicy.OFF)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = this.verticalScrollPosition;
         }
         return _loc1_;
      }
      
      private function get containerScrollRectBottom() : Number
      {
         return this.containerScrollRectTop + this.compositionHeight;
      }
      
      public function scrollToRange(param1:int, param2:int) : void
      {
         var _loc16_:Boolean = false;
         var _loc17_:Boolean = false;
         if(!this._hasScrollRect || !this.flowComposer || this.flowComposer.getControllerAt(this.flowComposer.numControllers - 1) != this)
         {
            return;
         }
         var _loc3_:int = this.absoluteStart;
         var _loc4_:int = Math.min(_loc3_ + this._textLength,this.textFlow.textLength - 1);
         param1 = Math.max(_loc3_,Math.min(param1,_loc4_));
         param2 = Math.max(_loc3_,Math.min(param2,_loc4_));
         var _loc5_:* = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL;
         var _loc6_:int = Math.min(param1,param2);
         var _loc7_:int = Math.max(param1,param2);
         var _loc8_:int = this.flowComposer.findLineIndexAtPosition(_loc6_,_loc6_ == this.textFlow.textLength);
         var _loc9_:int = this.flowComposer.findLineIndexAtPosition(_loc7_,_loc7_ == this.textFlow.textLength);
         var _loc10_:Number = this.containerScrollRectLeft;
         var _loc11_:Number = this.containerScrollRectTop;
         var _loc12_:Number = this.containerScrollRectRight;
         var _loc13_:Number = this.containerScrollRectBottom;
         if(this.flowComposer.damageAbsoluteStart <= _loc7_)
         {
            _loc7_ = Math.min(_loc6_ + 100,_loc7_ + 1);
            this.flowComposer.composeToPosition(_loc7_);
            _loc8_ = this.flowComposer.findLineIndexAtPosition(_loc6_,_loc6_ == this.textFlow.textLength);
            _loc9_ = this.flowComposer.findLineIndexAtPosition(_loc7_,_loc7_ == this.textFlow.textLength);
         }
         var _loc14_:Rectangle;
         if(_loc14_ = this.rangeToRectangle(_loc6_,_loc7_,_loc8_,_loc9_))
         {
            if(_loc5_)
            {
               if(_loc16_ = _loc14_.left < _loc10_ || _loc14_.right > _loc10_)
               {
                  if(_loc14_.left < _loc10_)
                  {
                     this.horizontalScrollPosition = _loc14_.left + this._compositionWidth;
                  }
                  if(_loc14_.right > _loc12_)
                  {
                     this.horizontalScrollPosition = _loc14_.right;
                  }
               }
               if(_loc14_.top < _loc11_)
               {
                  this.verticalScrollPosition = _loc14_.top;
               }
               if(param1 == param2)
               {
                  _loc14_.bottom += 2;
               }
               if(_loc14_.bottom > _loc13_)
               {
                  this.verticalScrollPosition = _loc14_.bottom - this._compositionHeight;
               }
            }
            else
            {
               if(_loc17_ = _loc14_.top > _loc11_ || _loc14_.bottom < _loc13_)
               {
                  if(_loc14_.top < _loc11_)
                  {
                     this.verticalScrollPosition = _loc14_.top;
                  }
                  if(_loc14_.bottom > _loc13_)
                  {
                     this.verticalScrollPosition = _loc14_.bottom - this._compositionHeight;
                  }
               }
               if(param1 == param2)
               {
                  _loc14_.right += 2;
               }
               if((_loc16_ = _loc14_.left > _loc10_ || _loc14_.right < _loc12_) && _loc14_.left < _loc10_)
               {
                  this.horizontalScrollPosition = _loc14_.left - this._compositionWidth / 2;
               }
               if(_loc16_ && _loc14_.right > _loc12_)
               {
                  this.horizontalScrollPosition = _loc14_.right - this._compositionWidth / 2;
               }
            }
         }
      }
      
      private function rangeToRectangle(param1:int, param2:int, param3:int, param4:int) : Rectangle
      {
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = false;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc6_:String = this.tlf_internal::effectiveBlockProgression;
         var _loc7_:IFlowComposer = this.textFlow.flowComposer;
         if(!this.container || !_loc7_)
         {
            return null;
         }
         if(param3 == param4)
         {
            if((_loc8_ = _loc7_.getLineAt(param3)).tlf_internal::isDamaged())
            {
               return null;
            }
            _loc9_ = _loc8_.getTextLine(true);
            _loc10_ = _loc8_.paragraph.getAbsoluteStart();
            _loc11_ = false;
            if(_loc6_ == BlockProgression.RL)
            {
               _loc11_ = (_loc14_ = this._rootElement.getTextFlow().findLeaf(param1)).getParentByType(TCYElement) != null;
            }
            _loc12_ = _loc9_.atomCount;
            _loc13_ = 0;
            if(param1 == param2)
            {
               _loc13_ = _loc12_ = _loc9_.getAtomIndexAtCharIndex(param1 - _loc10_);
            }
            else
            {
               _loc16_ = param2 - _loc10_;
               _loc17_ = param1 - _loc10_;
               while(_loc17_ < _loc16_)
               {
                  if((_loc15_ = _loc9_.getAtomIndexAtCharIndex(_loc17_)) < _loc12_)
                  {
                     _loc12_ = _loc15_;
                  }
                  if(_loc15_ > _loc13_)
                  {
                     _loc13_ = _loc15_;
                  }
                  _loc17_++;
               }
            }
            _loc5_ = this.atomToRectangle(_loc12_,_loc8_,_loc9_,_loc6_,_loc11_);
            if(_loc12_ != _loc13_)
            {
               _loc5_ = _loc5_.union(this.atomToRectangle(_loc13_,_loc8_,_loc9_,_loc6_,_loc11_));
            }
         }
         else
         {
            _loc5_ = new Rectangle(this._contentLeft,this._contentTop,this._contentWidth,this._contentHeight);
            _loc18_ = _loc7_.getLineAt(param3);
            _loc19_ = _loc7_.getLineAt(param4);
            if(_loc6_ == BlockProgression.TB)
            {
               _loc5_.top = _loc18_.y;
               _loc5_.bottom = _loc19_.y + _loc19_.textHeight;
            }
            else
            {
               _loc5_.right = _loc18_.x + _loc18_.textHeight;
               _loc5_.left = _loc19_.x;
            }
         }
         return _loc5_;
      }
      
      private function atomToRectangle(param1:int, param2:TextFlowLine, param3:TextLine, param4:String, param5:Boolean) : Rectangle
      {
         var _loc6_:* = null;
         if(param1 > -1)
         {
            _loc6_ = param3.getAtomBounds(param1);
         }
         if(param4 == BlockProgression.RL)
         {
            if(param5)
            {
               return new Rectangle(param2.x + _loc6_.x,param2.y + _loc6_.y,_loc6_.width,_loc6_.height);
            }
            return new Rectangle(param2.x,param2.y + _loc6_.y,param2.height,_loc6_.height);
         }
         return new Rectangle(param2.x + _loc6_.x,param2.y - param2.height + param2.ascent,_loc6_.width,param2.height + param3.descent);
      }
      
      tlf_internal function resetColumnState() : void
      {
         if(this._rootElement)
         {
            this._columnState.tlf_internal::updateInputs(this.tlf_internal::effectiveBlockProgression,this._rootElement.computedFormat.direction,this,this._compositionWidth,this._compositionHeight);
         }
      }
      
      public function invalidateContents() : void
      {
         if(this.textFlow)
         {
            this.textFlow.tlf_internal::damage(this.absoluteStart,Math.min(this._textLength,1),FlowDamageType.GEOMETRY,false);
         }
      }
      
      tlf_internal function attachTransparentBackgroundForHit(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if((this._minListenersAttached || this.tlf_internal::_mouseWheelListenerAttached) && this.attachTransparentBackground)
         {
            _loc2_ = this._container;
            if(_loc2_)
            {
               if(param1)
               {
                  _loc2_.graphics.clear();
                  this._transparentBGX = this._transparentBGY = this._transparentBGWidth = this._transparentBGHeight = NaN;
               }
               else
               {
                  _loc3_ = this._measureWidth ? this._contentWidth : this._compositionWidth;
                  _loc4_ = this._measureHeight ? this._contentHeight : this._compositionHeight;
                  _loc6_ = (_loc5_ = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL && this._horizontalScrollPolicy != ScrollPolicy.OFF) ? this._xScroll - _loc3_ : this._xScroll;
                  _loc7_ = this._yScroll;
                  if(_loc6_ != this._transparentBGX || _loc7_ != this._transparentBGY || _loc3_ != this._transparentBGWidth || _loc4_ != this._transparentBGHeight)
                  {
                     _loc2_.graphics.clear();
                     if(_loc3_ != 0 && _loc4_ != 0)
                     {
                        _loc2_.graphics.beginFill(0,0);
                        _loc2_.graphics.drawRect(_loc6_,_loc7_,_loc3_,_loc4_);
                        _loc2_.graphics.endFill();
                     }
                     this._transparentBGX = _loc6_;
                     this._transparentBGY = _loc7_;
                     this._transparentBGWidth = _loc3_;
                     this._transparentBGHeight = _loc4_;
                  }
               }
            }
         }
      }
      
      tlf_internal function interactionManagerChanged(param1:ISelectionManager) : void
      {
         if(!param1)
         {
            this.detachContainer();
         }
         this.tlf_internal::attachContainer();
         this.tlf_internal::checkScrollBounds();
         if(this._mouseEventManager)
         {
            this._mouseEventManager.needsCtrlKey = this.interactionManager != null && this.interactionManager.editingMode == EditingMode.READ_WRITE;
         }
         if(Boolean(this._container) && false)
         {
            this._container["needsSoftKeyboard"] = this.interactionManager && this.interactionManager.editingMode == EditingMode.READ_WRITE;
         }
      }
      
      tlf_internal function attachContainer() : void
      {
         if(!this._minListenersAttached && this.textFlow && Boolean(this.textFlow.interactionManager))
         {
            this._minListenersAttached = true;
            if(this._container)
            {
               this._container.addEventListener(FocusEvent.FOCUS_IN,this.tlf_internal::requiredFocusInHandler);
               this._container.addEventListener(MouseEvent.MOUSE_OVER,this.tlf_internal::requiredMouseOverHandler);
               this.tlf_internal::attachTransparentBackgroundForHit(false);
               if(Boolean(this._container.stage) && this._container.stage.focus == this._container)
               {
                  this.attachAllListeners();
               }
            }
         }
      }
      
      tlf_internal function attachInteractionHandlers() : void
      {
         var _loc1_:IInteractionEventHandler = this.tlf_internal::getInteractionHandler();
         this._container.addEventListener(MouseEvent.MOUSE_DOWN,this.tlf_internal::requiredMouseDownHandler);
         this._container.addEventListener(FocusEvent.FOCUS_OUT,this.tlf_internal::requiredFocusOutHandler);
         this._container.addEventListener(MouseEvent.DOUBLE_CLICK,_loc1_.mouseDoubleClickHandler);
         this._container.addEventListener(Event.ACTIVATE,_loc1_.activateHandler);
         this._container.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,_loc1_.focusChangeHandler);
         this._container.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,_loc1_.focusChangeHandler);
         this._container.addEventListener(TextEvent.TEXT_INPUT,_loc1_.textInputHandler);
         this._container.addEventListener(MouseEvent.MOUSE_OUT,_loc1_.mouseOutHandler);
         this.tlf_internal::addMouseWheelListener();
         this._container.addEventListener(Event.DEACTIVATE,_loc1_.deactivateHandler);
         this._container.addEventListener("imeStartComposition",_loc1_.imeStartCompositionHandler);
         if(this._container.contextMenu)
         {
            this._container.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,_loc1_.menuSelectHandler);
         }
         this._container.addEventListener(Event.COPY,_loc1_.editHandler);
         this._container.addEventListener(Event.SELECT_ALL,_loc1_.editHandler);
         this._container.addEventListener(Event.CUT,_loc1_.editHandler);
         this._container.addEventListener(Event.PASTE,_loc1_.editHandler);
         this._container.addEventListener(Event.CLEAR,_loc1_.editHandler);
      }
      
      tlf_internal function removeInteractionHandlers() : void
      {
         var _loc1_:IInteractionEventHandler = this.tlf_internal::getInteractionHandler();
         this._container.removeEventListener(MouseEvent.MOUSE_DOWN,this.tlf_internal::requiredMouseDownHandler);
         this._container.removeEventListener(FocusEvent.FOCUS_OUT,this.tlf_internal::requiredFocusOutHandler);
         this._container.removeEventListener(MouseEvent.DOUBLE_CLICK,_loc1_.mouseDoubleClickHandler);
         this._container.removeEventListener(Event.ACTIVATE,_loc1_.activateHandler);
         this._container.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,_loc1_.focusChangeHandler);
         this._container.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,_loc1_.focusChangeHandler);
         this._container.removeEventListener(TextEvent.TEXT_INPUT,_loc1_.textInputHandler);
         this._container.removeEventListener(MouseEvent.MOUSE_OUT,_loc1_.mouseOutHandler);
         this.tlf_internal::removeMouseWheelListener();
         this._container.removeEventListener(Event.DEACTIVATE,_loc1_.deactivateHandler);
         this._container.removeEventListener("imeStartComposition",_loc1_.imeStartCompositionHandler);
         if(this._container.contextMenu)
         {
            this._container.contextMenu.removeEventListener(ContextMenuEvent.MENU_SELECT,_loc1_.menuSelectHandler);
         }
         this._container.removeEventListener(Event.COPY,_loc1_.editHandler);
         this._container.removeEventListener(Event.SELECT_ALL,_loc1_.editHandler);
         this._container.removeEventListener(Event.CUT,_loc1_.editHandler);
         this._container.removeEventListener(Event.PASTE,_loc1_.editHandler);
         this._container.removeEventListener(Event.CLEAR,_loc1_.editHandler);
         this.clearSelectHandlers();
      }
      
      private function detachContainer() : void
      {
         if(this._minListenersAttached)
         {
            if(this._container)
            {
               this._container.removeEventListener(FocusEvent.FOCUS_IN,this.tlf_internal::requiredFocusInHandler);
               this._container.removeEventListener(MouseEvent.MOUSE_OVER,this.tlf_internal::requiredMouseOverHandler);
               if(this._allListenersAttached)
               {
                  this.tlf_internal::removeInteractionHandlers();
                  this.tlf_internal::removeContextMenu();
                  this.tlf_internal::attachTransparentBackgroundForHit(true);
                  this._allListenersAttached = false;
               }
            }
            this._minListenersAttached = false;
         }
         this.tlf_internal::removeMouseWheelListener();
      }
      
      private function attachAllListeners() : void
      {
         if(!this._allListenersAttached && this.textFlow && Boolean(this.textFlow.interactionManager))
         {
            this._allListenersAttached = true;
            if(this._container)
            {
               this.tlf_internal::attachContextMenu();
               this.tlf_internal::attachInteractionHandlers();
            }
         }
      }
      
      tlf_internal function addMouseWheelListener() : void
      {
         if(!this.tlf_internal::_mouseWheelListenerAttached)
         {
            this._container.addEventListener(MouseEvent.MOUSE_WHEEL,this.tlf_internal::getInteractionHandler().mouseWheelHandler);
            this.tlf_internal::_mouseWheelListenerAttached = true;
         }
      }
      
      tlf_internal function removeMouseWheelListener() : void
      {
         if(this.tlf_internal::_mouseWheelListenerAttached)
         {
            this._container.removeEventListener(MouseEvent.MOUSE_WHEEL,this.tlf_internal::getInteractionHandler().mouseWheelHandler);
            this.tlf_internal::_mouseWheelListenerAttached = false;
         }
      }
      
      tlf_internal function attachContextMenu() : void
      {
         this._container.contextMenu = this.createContextMenu();
      }
      
      tlf_internal function removeContextMenu() : void
      {
         this._container.contextMenu = null;
      }
      
      protected function createContextMenu() : ContextMenu
      {
         return tlf_internal::createDefaultContextMenu();
      }
      
      tlf_internal function scrollTimerHandler(param1:Event) : void
      {
         var containerPoint:Point = null;
         var scrollChange:int = 0;
         var mouseEvent:MouseEvent = null;
         var stashedScrollTimer:Timer = null;
         var var_6:Event = param1;
         if(!this._scrollTimer)
         {
            return;
         }
         if(this.textFlow.interactionManager == null || this.textFlow.interactionManager.activePosition < this.absoluteStart || this.textFlow.interactionManager.activePosition > this.absoluteStart + this.textLength)
         {
            var_6 = null;
         }
         if(var_6 is MouseEvent)
         {
            this._scrollTimer.stop();
            this._scrollTimer.removeEventListener(TimerEvent.TIMER,this.tlf_internal::scrollTimerHandler);
            var_6.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,this.tlf_internal::scrollTimerHandler);
            this._scrollTimer = null;
         }
         else if(!var_6)
         {
            this._scrollTimer.stop();
            this._scrollTimer.removeEventListener(TimerEvent.TIMER,this.tlf_internal::scrollTimerHandler);
            if(this.tlf_internal::getContainerRoot())
            {
               this.tlf_internal::getContainerRoot().removeEventListener(MouseEvent.MOUSE_UP,this.tlf_internal::scrollTimerHandler);
            }
            this._scrollTimer = null;
         }
         else if(this._container.stage)
         {
            containerPoint = new Point(this._container.stage.mouseX,this._container.stage.mouseY);
            containerPoint = this._container.globalToLocal(containerPoint);
            scrollChange = this.autoScrollIfNecessaryInternal(containerPoint);
            if(scrollChange != 0 && Boolean(this.interactionManager))
            {
               mouseEvent = new PsuedoMouseEvent(MouseEvent.MOUSE_MOVE,false,false,this._container.stage.mouseX,this._container.stage.mouseY,this._container.stage,false,false,false,true);
               stashedScrollTimer = this._scrollTimer;
               try
               {
                  this._scrollTimer = null;
                  this.interactionManager.mouseMoveHandler(mouseEvent);
               }
               catch(e:Error)
               {
                  throw e;
               }
               finally
               {
                  this._scrollTimer = stashedScrollTimer;
               }
            }
         }
      }
      
      public function autoScrollIfNecessary(param1:int, param2:int) : void
      {
         var _loc4_:* = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.flowComposer.getControllerAt(this.flowComposer.numControllers - 1) != this)
         {
            _loc4_ = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL;
            _loc5_ = this.flowComposer.getControllerAt(this.flowComposer.numControllers - 1);
            if(_loc4_ && this._horizontalScrollPolicy == ScrollPolicy.OFF || !_loc4_ && this._verticalScrollPolicy == ScrollPolicy.OFF)
            {
               return;
            }
            _loc6_ = _loc5_.container.getBounds(this._container.stage);
            if(_loc4_)
            {
               if(param2 >= _loc6_.top && param2 <= _loc6_.bottom)
               {
                  _loc5_.autoScrollIfNecessary(param1,param2);
               }
            }
            else if(param1 >= _loc6_.left && param1 <= _loc6_.right)
            {
               _loc5_.autoScrollIfNecessary(param1,param2);
            }
         }
         if(!this._hasScrollRect)
         {
            return;
         }
         var _loc3_:Point = new Point(param1,param2);
         _loc3_ = this._container.globalToLocal(_loc3_);
         this.autoScrollIfNecessaryInternal(_loc3_);
      }
      
      private function autoScrollIfNecessaryInternal(param1:Point) : int
      {
         var _loc2_:int = 0;
         if(param1.y - this.containerScrollRectBottom > 0)
         {
            this.verticalScrollPosition += this.textFlow.configuration.scrollDragPixels;
            _loc2_ = 1;
         }
         else if(param1.y - this.containerScrollRectTop < 0)
         {
            this.verticalScrollPosition -= this.textFlow.configuration.scrollDragPixels;
            _loc2_ = -1;
         }
         if(param1.x - this.containerScrollRectRight > 0)
         {
            this.horizontalScrollPosition += this.textFlow.configuration.scrollDragPixels;
            _loc2_ = -1;
         }
         else if(param1.x - this.containerScrollRectLeft < 0)
         {
            this.horizontalScrollPosition -= this.textFlow.configuration.scrollDragPixels;
            _loc2_ = 1;
         }
         if(_loc2_ != 0 && !this._scrollTimer)
         {
            this._scrollTimer = new Timer(this.textFlow.configuration.scrollDragDelay);
            this._scrollTimer.addEventListener(TimerEvent.TIMER,this.tlf_internal::scrollTimerHandler,false,0,true);
            if(this.tlf_internal::getContainerRoot())
            {
               this.tlf_internal::getContainerRoot().addEventListener(MouseEvent.MOUSE_UP,this.tlf_internal::scrollTimerHandler,false,0,true);
               this.beginMouseCapture();
            }
            this._scrollTimer.start();
         }
         return _loc2_;
      }
      
      tlf_internal function getFirstVisibleLine() : TextFlowLine
      {
         return !!this._shapeChildren.length ? this._shapeChildren[0].userData : null;
      }
      
      tlf_internal function getLastVisibleLine() : TextFlowLine
      {
         return !!this._shapeChildren.length ? this._shapeChildren[this._shapeChildren.length - 1].userData : null;
      }
      
      public function getScrollDelta(param1:int) : Number
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc2_:IFlowComposer = this.textFlow.flowComposer;
         if(_loc2_.numLines == 0)
         {
            return 0;
         }
         var _loc3_:TextFlowLine = this.tlf_internal::getFirstVisibleLine();
         if(!_loc3_)
         {
            return 0;
         }
         var _loc4_:TextFlowLine = this.tlf_internal::getLastVisibleLine();
         if(param1 > 0)
         {
            _loc6_ = _loc2_.findLineIndexAtPosition(_loc4_.absoluteStart);
            _loc10_ = _loc4_.getTextLine(true);
            if(this.tlf_internal::effectiveBlockProgression == BlockProgression.TB)
            {
               if(_loc10_.y + _loc10_.descent - this.containerScrollRectBottom > 2)
               {
                  _loc6_--;
               }
            }
            else if(this.containerScrollRectLeft - (_loc10_.x - _loc10_.descent) > 2)
            {
               _loc6_--;
            }
            while(_loc6_ + param1 > _loc2_.numLines - 1 && _loc2_.damageAbsoluteStart < this.textFlow.textLength)
            {
               _loc11_ = _loc2_.damageAbsoluteStart;
               _loc2_.composeToPosition(_loc2_.damageAbsoluteStart + 1000);
               if(_loc2_.damageAbsoluteStart == _loc11_)
               {
                  return 0;
               }
            }
            _loc5_ = Math.min(_loc2_.numLines - 1,_loc6_ + param1);
         }
         if(param1 < 0)
         {
            _loc6_ = _loc2_.findLineIndexAtPosition(_loc3_.absoluteStart);
            if(this.tlf_internal::effectiveBlockProgression == BlockProgression.TB)
            {
               if(_loc3_.y + 2 < this.containerScrollRectTop)
               {
                  _loc6_++;
               }
            }
            else if(_loc3_.x + _loc3_.ascent > this.containerScrollRectRight + 2)
            {
               _loc6_++;
            }
            _loc5_ = Math.max(0,_loc6_ + param1);
         }
         var _loc7_:TextFlowLine;
         if((_loc7_ = _loc2_.getLineAt(_loc5_)).absoluteStart < this.absoluteStart)
         {
            return 0;
         }
         if(_loc7_.validity != TextLineValidity.VALID)
         {
            _loc13_ = (_loc12_ = this.textFlow.findLeaf(_loc7_.absoluteStart)).getParagraph();
            this.textFlow.flowComposer.composeToPosition(_loc13_.getAbsoluteStart() + _loc13_.textLength);
            _loc7_ = _loc2_.getLineAt(_loc5_);
         }
         var _loc8_:* = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL;
         if(this.tlf_internal::effectiveBlockProgression == BlockProgression.RL)
         {
            return (_loc9_ = param1 < 0 ? _loc7_.x + _loc7_.textHeight : _loc7_.x - _loc7_.descent + this._compositionWidth) - this.horizontalScrollPosition;
         }
         return (_loc9_ = param1 < 0 ? _loc7_.y : _loc7_.y + _loc7_.textHeight - this._compositionHeight) - this.verticalScrollPosition;
      }
      
      public function mouseOverHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.mouseOverHandler(param1);
         }
      }
      
      tlf_internal function requiredMouseOverHandler(param1:MouseEvent) : void
      {
         this.attachAllListeners();
         this.tlf_internal::getInteractionHandler().mouseOverHandler(param1);
      }
      
      public function mouseOutHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.mouseOutHandler(param1);
         }
      }
      
      public function mouseWheelHandler(param1:MouseEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         var _loc2_:* = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL;
         if(_loc2_)
         {
            if(this.tlf_internal::contentWidth > this._compositionWidth && !this._measureWidth)
            {
               this.horizontalScrollPosition += param1.delta * this.textFlow.configuration.scrollMouseWheelMultiplier;
               param1.preventDefault();
            }
         }
         else if(this.tlf_internal::contentHeight > this._compositionHeight && !this._measureHeight)
         {
            this.verticalScrollPosition -= param1.delta * this.textFlow.configuration.scrollMouseWheelMultiplier;
            param1.preventDefault();
         }
      }
      
      public function mouseDownHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.mouseDownHandler(param1);
            if(this.interactionManager.hasSelection())
            {
               this.tlf_internal::setFocus();
            }
         }
      }
      
      tlf_internal function requiredMouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(!this._selectListenersAttached)
         {
            _loc2_ = this.tlf_internal::getContainerRoot();
            if(_loc2_)
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.tlf_internal::rootMouseMoveHandler,false,0,true);
               _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.tlf_internal::rootMouseUpHandler,false,0,true);
               this.beginMouseCapture();
               this._selectListenersAttached = true;
            }
         }
         this.tlf_internal::getInteractionHandler().mouseDownHandler(param1);
      }
      
      public function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this.interactionManager && param1 && !param1.isDefaultPrevented())
         {
            this.interactionManager.mouseUpHandler(param1);
         }
      }
      
      tlf_internal function rootMouseUpHandler(param1:MouseEvent) : void
      {
         this.clearSelectHandlers();
         this.tlf_internal::getInteractionHandler().mouseUpHandler(param1);
      }
      
      private function clearSelectHandlers() : void
      {
         if(this._selectListenersAttached)
         {
            this.tlf_internal::getContainerRoot().removeEventListener(MouseEvent.MOUSE_MOVE,this.tlf_internal::rootMouseMoveHandler);
            this.tlf_internal::getContainerRoot().removeEventListener(MouseEvent.MOUSE_UP,this.tlf_internal::rootMouseUpHandler);
            this.endMouseCapture();
            this._selectListenersAttached = false;
         }
      }
      
      public function beginMouseCapture() : void
      {
         var _loc1_:ISandboxSupport = this.tlf_internal::getInteractionHandler() as ISandboxSupport;
         if(Boolean(_loc1_) && _loc1_ != this)
         {
            _loc1_.beginMouseCapture();
         }
      }
      
      public function endMouseCapture() : void
      {
         var _loc1_:ISandboxSupport = this.tlf_internal::getInteractionHandler() as ISandboxSupport;
         if(Boolean(_loc1_) && _loc1_ != this)
         {
            _loc1_.endMouseCapture();
         }
      }
      
      public function mouseUpSomewhere(param1:Event) : void
      {
         this.tlf_internal::rootMouseUpHandler(null);
         this.tlf_internal::scrollTimerHandler(null);
      }
      
      public function mouseMoveSomewhere(param1:Event) : void
      {
      }
      
      private function hitOnMyFlowExceptLastContainer(param1:MouseEvent) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1.target is TextLine)
         {
            _loc2_ = TextLine(param1.target).userData as TextFlowLine;
            if(_loc2_)
            {
               _loc3_ = _loc2_.paragraph;
               if(_loc3_.getTextFlow() == this.textFlow)
               {
                  return true;
               }
            }
         }
         else if(param1.target is Sprite)
         {
            _loc4_ = 0;
            while(_loc4_ < this.textFlow.flowComposer.numControllers - 1)
            {
               if(this.textFlow.flowComposer.getControllerAt(_loc4_).container == param1.target)
               {
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      public function mouseMoveHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            if(param1.buttonDown && !this.hitOnMyFlowExceptLastContainer(param1))
            {
               this.autoScrollIfNecessary(param1.stageX,param1.stageY);
            }
            this.interactionManager.mouseMoveHandler(param1);
         }
      }
      
      tlf_internal function rootMouseMoveHandler(param1:MouseEvent) : void
      {
         this.tlf_internal::getInteractionHandler().mouseMoveHandler(param1);
      }
      
      public function mouseDoubleClickHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.mouseDoubleClickHandler(param1);
            if(this.interactionManager.hasSelection())
            {
               this.tlf_internal::setFocus();
            }
         }
      }
      
      tlf_internal function setFocus() : void
      {
         if(this._container.stage)
         {
            this._container.stage.focus = this._container;
         }
      }
      
      tlf_internal function getContainerController(param1:DisplayObject) : ContainerController
      {
         var flowComposer:IFlowComposer = null;
         var var_1:int = 0;
         var controller:ContainerController = null;
         var container:DisplayObject = param1;
         try
         {
            while(container)
            {
               flowComposer = this.flowComposer;
               var_1 = 0;
               while(var_1 < flowComposer.numControllers)
               {
                  controller = flowComposer.getControllerAt(var_1);
                  if(controller.container == container)
                  {
                     return controller;
                  }
                  var_1++;
               }
               container = container.parent;
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      public function focusChangeHandler(param1:FocusEvent) : void
      {
         var _loc2_:ContainerController = this.tlf_internal::getContainerController(DisplayObject(param1.target));
         var _loc3_:ContainerController = this.tlf_internal::getContainerController(param1.relatedObject);
         if(_loc3_ == _loc2_)
         {
            param1.preventDefault();
         }
      }
      
      public function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:int = 0;
         if(this.interactionManager)
         {
            this.interactionManager.focusInHandler(param1);
            if(this.interactionManager.editingMode == EditingMode.READ_WRITE)
            {
               _loc2_ = this.interactionManager.focusedSelectionFormat.pointBlinkRate;
            }
         }
         this.setBlinkInterval(_loc2_);
      }
      
      tlf_internal function requiredFocusInHandler(param1:FocusEvent) : void
      {
         this.attachAllListeners();
         this._container.addEventListener(KeyboardEvent.KEY_DOWN,this.tlf_internal::getInteractionHandler().keyDownHandler);
         this._container.addEventListener(KeyboardEvent.KEY_UP,this.tlf_internal::getInteractionHandler().keyUpHandler);
         this._container.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.tlf_internal::getInteractionHandler().keyFocusChangeHandler);
         if(false && false)
         {
            this._container.addEventListener("softKeyboardActivating",this.tlf_internal::getInteractionHandler().softKeyboardActivatingHandler);
         }
         this.tlf_internal::getInteractionHandler().focusInHandler(param1);
      }
      
      public function focusOutHandler(param1:FocusEvent) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.focusOutHandler(param1);
            this.setBlinkInterval(this.interactionManager.unfocusedSelectionFormat.pointBlinkRate);
         }
         else
         {
            this.setBlinkInterval(0);
         }
      }
      
      tlf_internal function requiredFocusOutHandler(param1:FocusEvent) : void
      {
         this._container.removeEventListener(KeyboardEvent.KEY_DOWN,this.tlf_internal::getInteractionHandler().keyDownHandler);
         this._container.removeEventListener(KeyboardEvent.KEY_UP,this.tlf_internal::getInteractionHandler().keyUpHandler);
         this._container.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.tlf_internal::getInteractionHandler().keyFocusChangeHandler);
         if(false && false)
         {
            this._container.removeEventListener("softKeyboardActivating",this.tlf_internal::getInteractionHandler().softKeyboardActivatingHandler);
         }
         this.tlf_internal::getInteractionHandler().focusOutHandler(param1);
      }
      
      public function activateHandler(param1:Event) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.activateHandler(param1);
         }
      }
      
      public function deactivateHandler(param1:Event) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.deactivateHandler(param1);
         }
      }
      
      public function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.keyDownHandler(param1);
         }
      }
      
      public function keyUpHandler(param1:KeyboardEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.keyUpHandler(param1);
         }
      }
      
      public function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.keyFocusChangeHandler(param1);
         }
      }
      
      public function textInputHandler(param1:TextEvent) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.textInputHandler(param1);
         }
      }
      
      public function softKeyboardActivatingHandler(param1:Event) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.softKeyboardActivatingHandler(param1);
         }
      }
      
      public function imeStartCompositionHandler(param1:IMEEvent) : void
      {
         if(this.interactionManager)
         {
            this.interactionManager.imeStartCompositionHandler(param1);
         }
      }
      
      public function menuSelectHandler(param1:ContextMenuEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.interactionManager)
         {
            this.interactionManager.menuSelectHandler(param1);
         }
         else
         {
            _loc2_ = this._container.contextMenu;
            if(_loc2_)
            {
               _loc3_ = _loc2_.clipboardItems;
               _loc3_.copy = false;
               _loc3_.cut = false;
               _loc3_.paste = false;
               _loc3_.selectAll = false;
               _loc3_.clear = false;
            }
         }
      }
      
      public function editHandler(param1:Event) : void
      {
         if(Boolean(this.interactionManager) && !param1.isDefaultPrevented())
         {
            this.interactionManager.editHandler(param1);
         }
         var _loc2_:ContextMenu = this._container.contextMenu;
         if(_loc2_)
         {
            _loc2_.clipboardItems.clear = true;
            _loc2_.clipboardItems.copy = true;
            _loc2_.clipboardItems.cut = true;
            _loc2_.clipboardItems.paste = true;
            _loc2_.clipboardItems.selectAll = true;
         }
      }
      
      public function selectRange(param1:int, param2:int) : void
      {
         if(Boolean(this.interactionManager) && this.interactionManager.editingMode != EditingMode.READ_ONLY)
         {
            this.interactionManager.selectRange(param1,param2);
         }
      }
      
      private function startBlinkingCursor(param1:DisplayObject, param2:int) : void
      {
         if(!this.blinkTimer)
         {
            this.blinkTimer = new Timer(param2,0);
         }
         this.blinkObject = param1;
         this.blinkTimer.addEventListener(TimerEvent.TIMER,this.blinkTimerHandler,false,0,true);
         this.blinkTimer.start();
      }
      
      protected function stopBlinkingCursor() : void
      {
         if(this.blinkTimer)
         {
            this.blinkTimer.stop();
         }
         this.blinkObject = null;
      }
      
      private function blinkTimerHandler(param1:TimerEvent) : void
      {
         this.blinkObject.alpha = this.blinkObject.alpha == 1 ? 0 : 1;
      }
      
      protected function setBlinkInterval(param1:int) : void
      {
         var _loc2_:int = param1;
         if(_loc2_ == 0)
         {
            if(this.blinkTimer)
            {
               this.blinkTimer.stop();
            }
            if(this.blinkObject)
            {
               this.blinkObject.alpha = 1;
            }
         }
         else if(this.blinkTimer)
         {
            this.blinkTimer.delay = _loc2_;
            if(this.blinkObject)
            {
               this.blinkTimer.start();
            }
         }
      }
      
      tlf_internal function drawPointSelection(param1:SelectionFormat, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Shape = new Shape();
         if(this._hasScrollRect)
         {
            if(this.tlf_internal::effectiveBlockProgression == BlockProgression.TB)
            {
               if(param2 >= this.containerScrollRectRight)
               {
                  param2 -= param4;
               }
            }
            else if(param3 >= this.containerScrollRectBottom)
            {
               param3 -= param5;
            }
         }
         _loc6_.graphics.beginFill(param1.pointColor);
         _loc6_.graphics.drawRect(int(param2),int(param3),param4,param5);
         _loc6_.graphics.endFill();
         if(param1.pointBlinkRate != 0 && this.interactionManager.editingMode == EditingMode.READ_WRITE)
         {
            this.startBlinkingCursor(_loc6_,param1.pointBlinkRate);
         }
         this.tlf_internal::addSelectionChild(_loc6_);
      }
      
      tlf_internal function addSelectionShapes(param1:SelectionFormat, param2:int, param3:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         if(!this.interactionManager || this._textLength == 0 || param2 == -1 || param3 == -1)
         {
            return;
         }
         if(param2 != param3)
         {
            _loc6_ = this.absoluteStart;
            _loc7_ = this.absoluteStart + this.textLength;
            if(param2 < _loc6_)
            {
               param2 = _loc6_;
            }
            else if(param2 >= _loc7_)
            {
               return;
            }
            if(param3 > _loc7_)
            {
               param3 = _loc7_;
            }
            else if(param3 < _loc6_)
            {
               return;
            }
            _loc8_ = this.flowComposer.findLineIndexAtPosition(param2);
            if((_loc9_ = param2 == param3 ? _loc8_ : this.flowComposer.findLineIndexAtPosition(param3)) >= this.flowComposer.numLines)
            {
               _loc9_ = this.flowComposer.numLines - 1;
            }
            _loc10_ = new Shape();
            _loc4_ = !!_loc8_ ? this.flowComposer.getLineAt(_loc8_ - 1) : null;
            _loc11_ = this.flowComposer.getLineAt(_loc8_);
            _loc12_ = _loc8_;
            while(_loc12_ <= _loc9_)
            {
               _loc5_ = _loc12_ != this.flowComposer.numLines - 1 ? this.flowComposer.getLineAt(_loc12_ + 1) : null;
               _loc11_.tlf_internal::hiliteBlockSelection(_loc10_,param1,this._container,param2 < _loc11_.absoluteStart ? _loc11_.absoluteStart : param2,param3 > _loc11_.absoluteStart + _loc11_.textLength ? _loc11_.absoluteStart + _loc11_.textLength : param3,_loc4_,_loc5_);
               _loc13_ = _loc11_;
               _loc11_ = _loc5_;
               _loc4_ = _loc13_;
               _loc12_++;
            }
            this.tlf_internal::addSelectionChild(_loc10_);
         }
         else
         {
            if((_loc14_ = this.flowComposer.findLineIndexAtPosition(param2)) == this.flowComposer.numLines)
            {
               _loc14_--;
            }
            if(this.flowComposer.getLineAt(_loc14_).controller == this)
            {
               _loc4_ = _loc14_ != 0 ? this.flowComposer.getLineAt(_loc14_ - 1) : null;
               _loc5_ = _loc14_ != this.flowComposer.numLines - 1 ? this.flowComposer.getLineAt(_loc14_ + 1) : null;
               this.flowComposer.getLineAt(_loc14_).tlf_internal::hilitePointSelection(param1,param2,this._container,_loc4_,_loc5_);
            }
         }
      }
      
      tlf_internal function clearSelectionShapes() : void
      {
         this.stopBlinkingCursor();
         var _loc1_:DisplayObjectContainer = this.tlf_internal::getSelectionSprite(false);
         if(_loc1_ != null)
         {
            if(_loc1_.parent)
            {
               this.removeSelectionContainer(_loc1_);
            }
            while(_loc1_.numChildren > 0)
            {
               _loc1_.removeChildAt(0);
            }
            return;
         }
      }
      
      tlf_internal function addSelectionChild(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObjectContainer = this.tlf_internal::getSelectionSprite(true);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:SelectionFormat = this.interactionManager.currentSelectionFormat;
         var _loc4_:String = this.interactionManager.activePosition == this.interactionManager.anchorPosition ? _loc3_.pointBlendMode : _loc3_.rangeBlendMode;
         var _loc5_:Number = this.interactionManager.activePosition == this.interactionManager.anchorPosition ? _loc3_.pointAlpha : _loc3_.rangeAlpha;
         if(_loc2_.blendMode != _loc4_)
         {
            _loc2_.blendMode = _loc4_;
         }
         if(_loc2_.alpha != _loc5_)
         {
            _loc2_.alpha = _loc5_;
         }
         if(_loc2_.numChildren == 0)
         {
            this.addSelectionContainer(_loc2_);
         }
         _loc2_.addChild(param1);
      }
      
      tlf_internal function containsSelectionChild(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObjectContainer = this.tlf_internal::getSelectionSprite(false);
         if(_loc2_ == null)
         {
            return false;
         }
         return _loc2_.contains(param1);
      }
      
      tlf_internal function getBackgroundShape() : Shape
      {
         if(!this._backgroundShape)
         {
            this._backgroundShape = new Shape();
            this.addBackgroundShape(this._backgroundShape);
         }
         return this._backgroundShape;
      }
      
      tlf_internal function getEffectivePaddingLeft() : Number
      {
         return this.computedFormat.paddingLeft == FormatValue.AUTO ? 0 : this.computedFormat.paddingLeft;
      }
      
      tlf_internal function getEffectivePaddingRight() : Number
      {
         return this.computedFormat.paddingRight == FormatValue.AUTO ? 0 : this.computedFormat.paddingRight;
      }
      
      tlf_internal function getEffectivePaddingTop() : Number
      {
         return this.computedFormat.paddingTop == FormatValue.AUTO ? 0 : this.computedFormat.paddingTop;
      }
      
      tlf_internal function getEffectivePaddingBottom() : Number
      {
         return this.computedFormat.paddingBottom == FormatValue.AUTO ? 0 : this.computedFormat.paddingBottom;
      }
      
      tlf_internal function getTotalPaddingLeft() : Number
      {
         return this.tlf_internal::getEffectivePaddingLeft() + (!!this._rootElement ? this._rootElement.tlf_internal::getEffectivePaddingLeft() : 0);
      }
      
      tlf_internal function getTotalPaddingRight() : Number
      {
         return this.tlf_internal::getEffectivePaddingRight() + (!!this._rootElement ? this._rootElement.tlf_internal::getEffectivePaddingRight() : 0);
      }
      
      tlf_internal function getTotalPaddingTop() : Number
      {
         return this.tlf_internal::getEffectivePaddingTop() + (!!this._rootElement ? this._rootElement.tlf_internal::getEffectivePaddingTop() : 0);
      }
      
      tlf_internal function getTotalPaddingBottom() : Number
      {
         return this.tlf_internal::getEffectivePaddingBottom() + (!!this._rootElement ? this._rootElement.tlf_internal::getEffectivePaddingBottom() : 0);
      }
      
      tlf_internal function getSelectionSprite(param1:Boolean) : DisplayObjectContainer
      {
         if(param1)
         {
            if(this._selectionSprite == null)
            {
               this._selectionSprite = new Sprite();
               this._selectionSprite.mouseEnabled = false;
               this._selectionSprite.mouseChildren = false;
            }
         }
         return this._selectionSprite;
      }
      
      protected function get attachTransparentBackground() : Boolean
      {
         return true;
      }
      
      tlf_internal function clearCompositionResults() : void
      {
         var _loc1_:* = null;
         this.tlf_internal::setTextLength(0);
         for each(_loc1_ in this._shapeChildren)
         {
            this.removeTextLine(_loc1_);
         }
         this._shapeChildren.length = 0;
         this._linesInView.length = 0;
         if(this._floatsInContainer)
         {
            this._floatsInContainer.length = 0;
         }
         if(this._composedFloats)
         {
            this._composedFloats.length = 0;
         }
      }
      
      tlf_internal function updateCompositionShapes() : void
      {
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         if(!this.tlf_internal::shapesInvalid)
         {
            return;
         }
         var _loc1_:Number = this._yScroll;
         if(this.verticalScrollPolicy != ScrollPolicy.OFF && !this._measureHeight)
         {
            this._yScroll = this.computeVerticalScrollPosition(this._yScroll,false);
         }
         var _loc2_:Number = this._xScroll;
         if(this.horizontalScrollPolicy != ScrollPolicy.OFF && !this._measureWidth)
         {
            this._xScroll = this.computeHorizontalScrollPosition(this._xScroll,false);
         }
         var _loc3_:Boolean = _loc1_ != this._yScroll || _loc2_ != this._xScroll;
         if(_loc3_)
         {
            this._linesInView.length = 0;
         }
         this.tlf_internal::fillShapeChildren();
         var _loc4_:Array = this._linesInView;
         var _loc5_:int = this.getFirstTextLineChildIndex();
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._updateStart > this.absoluteStart && _loc4_.length > 0)
         {
            _loc13_ = _loc4_[0];
            _loc14_ = TextFlowLine(_loc13_.userData);
            _loc16_ = (_loc15_ = this.flowComposer.findLineAtPosition(_loc14_.absoluteStart - 1)).tlf_internal::peekTextLine();
            if((_loc7_ = this._shapeChildren.indexOf(_loc16_)) >= 0)
            {
               _loc7_++;
               _loc5_ += _loc7_;
            }
            else
            {
               _loc7_ = 0;
            }
         }
         var _loc8_:int = _loc7_;
         while(_loc6_ != _loc4_.length)
         {
            if((_loc17_ = _loc4_[_loc6_]) == this._shapeChildren[_loc8_])
            {
               _loc5_++;
               _loc6_++;
               _loc8_++;
            }
            else if((_loc18_ = this._shapeChildren.indexOf(_loc17_)) == -1)
            {
               this.addTextLine(_loc17_,_loc5_++);
               _loc6_++;
            }
            else
            {
               this.removeAndRecycleTextLines(_loc8_,_loc18_);
               _loc8_ = _loc18_;
            }
         }
         this.removeAndRecycleTextLines(_loc8_,this._shapeChildren.length);
         if(_loc7_ > 0)
         {
            this._shapeChildren.length = _loc7_;
            this._shapeChildren = this._shapeChildren.concat(this._linesInView);
            this._linesInView.length = 0;
         }
         else
         {
            this._linesInView = this._shapeChildren;
            this._linesInView.length = 0;
            this._shapeChildren = _loc4_;
         }
         if(this._floatsInContainer && this._floatsInContainer.length > 0 || this._composedFloats && this._composedFloats.length > 0)
         {
            this.tlf_internal::updateGraphics(this._updateStart);
         }
         this.tlf_internal::shapesInvalid = false;
         this.updateVisibleRectangle();
         var _loc9_:TextFlow = this.textFlow;
         var _loc10_:Boolean = this.interactionManager != null && this.interactionManager.editingMode == EditingMode.READ_WRITE;
         var _loc11_:TextFlowLine = this.tlf_internal::getFirstVisibleLine();
         var _loc12_:TextFlowLine = this.tlf_internal::getLastVisibleLine();
         scratchRectangle.left = this._contentLeft;
         scratchRectangle.top = this._contentTop;
         scratchRectangle.width = this._contentWidth;
         scratchRectangle.height = this._contentHeight;
         this._mouseEventManager.updateHitTests(this.tlf_internal::effectiveBlockProgression == BlockProgression.RL && this._hasScrollRect ? this._contentWidth : 0,scratchRectangle,_loc9_,!!_loc11_ ? _loc11_.absoluteStart : this._absoluteStart,!!_loc12_ ? _loc12_.absoluteStart + _loc12_.textLength - 1 : this._absoluteStart,_loc10_);
         this._updateStart = this._rootElement.textLength;
         if(this._measureWidth || this._measureHeight)
         {
            this.tlf_internal::attachTransparentBackgroundForHit(false);
         }
         if(_loc9_.tlf_internal::backgroundManager)
         {
            _loc9_.tlf_internal::backgroundManager.onUpdateComplete(this);
         }
         if(_loc3_ && _loc9_.hasEventListener(TextLayoutEvent.SCROLL))
         {
            if(_loc1_ != this._yScroll)
            {
               _loc9_.dispatchEvent(new ScrollEvent(TextLayoutEvent.SCROLL,false,false,ScrollEventDirection.VERTICAL,this._yScroll - _loc1_));
            }
            if(_loc2_ != this._xScroll)
            {
               _loc9_.dispatchEvent(new ScrollEvent(TextLayoutEvent.SCROLL,false,false,ScrollEventDirection.HORIZONTAL,this._xScroll - _loc2_));
            }
         }
         if(_loc9_.hasEventListener(UpdateCompleteEvent.UPDATE_COMPLETE))
         {
            _loc9_.dispatchEvent(new UpdateCompleteEvent(UpdateCompleteEvent.UPDATE_COMPLETE,false,false,_loc9_,this));
         }
      }
      
      tlf_internal function updateGraphics(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:Boolean = false;
         var _loc26_:int = 0;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc3_:* = [];
         var _loc6_:TextFlowLine = this.tlf_internal::getFirstVisibleLine();
         var _loc7_:TextFlowLine = this.tlf_internal::getLastVisibleLine();
         var _loc8_:int = !!_loc6_ ? _loc6_.absoluteStart : this.absoluteStart;
         var _loc9_:int = !!_loc7_ ? _loc7_.absoluteStart + _loc7_.textLength : this.absoluteStart + this.textLength;
         var _loc10_:TextFlowLine;
         var _loc11_:int = !!(_loc10_ = this.flowComposer.findLineAtPosition(_loc9_)) ? _loc10_.absoluteStart + _loc10_.textLength : this.absoluteStart + this.textLength;
         _loc11_ = Math.min(_loc11_,this.absoluteStart + this.textLength);
         _loc11_ = Math.min(_loc11_,_loc9_ + 2000);
         _loc11_ = Math.min(_loc11_,this.flowComposer.damageAbsoluteStart);
         var _loc12_:String = this.tlf_internal::effectiveBlockProgression;
         var _loc13_:Number = this._measureWidth ? this._contentWidth : this._compositionWidth;
         var _loc14_:Number = this._measureHeight ? this._contentHeight : this._compositionHeight;
         var _loc15_:Number = _loc12_ == BlockProgression.RL ? this._xScroll - _loc13_ : this._xScroll;
         var _loc16_:Number = this._yScroll;
         var _loc17_:int = this.tlf_internal::findFloatIndexAtOrAfter(param1);
         var _loc18_:int = 0;
         var _loc19_:int = this.getFirstTextLineChildIndex();
         if(_loc17_ > 0)
         {
            _loc4_ = this._composedFloats[_loc17_ - 1];
            _loc18_ = this._floatsInContainer.indexOf(_loc4_.graphic);
            while(_loc18_ == -1 && _loc17_ > 0)
            {
               _loc17_--;
               _loc4_ = this._composedFloats[_loc17_ - 1];
               _loc18_ = this._floatsInContainer.indexOf(_loc4_.graphic);
            }
            _loc18_++;
            _loc23_ = 0;
            while(_loc23_ < _loc17_)
            {
               if(this._composedFloats[_loc23_].absolutePosition >= this.absoluteStart)
               {
                  _loc3_.push(this._composedFloats[_loc23_].graphic);
               }
               _loc23_++;
            }
         }
         var _loc20_:int = _loc18_;
         if(!this._floatsInContainer)
         {
            this._floatsInContainer = [];
         }
         var _loc21_:int = this._floatsInContainer.length;
         var _loc22_:int = this._composedFloats.length;
         while(_loc17_ < _loc22_)
         {
            _loc5_ = (_loc4_ = this._composedFloats[_loc17_]).graphic;
            _loc24_ = _loc4_.parent;
            if(!_loc5_)
            {
               _loc25_ = false;
            }
            else if(_loc4_.floatType == Float.NONE)
            {
               _loc25_ = _loc4_.absolutePosition >= _loc8_ && _loc4_.absolutePosition < _loc9_;
            }
            else
            {
               _loc25_ = this.floatIsVisible(_loc12_,_loc15_,_loc16_,_loc13_,_loc14_,_loc4_) && _loc4_.absolutePosition < _loc11_ && _loc4_.absolutePosition >= this.absoluteStart;
            }
            if(!_loc25_)
            {
               if(_loc4_.absolutePosition >= _loc11_)
               {
                  break;
               }
               _loc17_++;
            }
            else
            {
               if(_loc3_.indexOf(_loc5_) < 0)
               {
                  _loc3_.push(_loc5_);
               }
               if(_loc4_.floatType == Float.NONE)
               {
                  if(_loc27_ = _loc24_ as TextLine)
                  {
                     if(!(_loc28_ = _loc27_.userData as TextFlowLine) || _loc4_.absolutePosition < _loc28_.absoluteStart || _loc4_.absolutePosition >= _loc28_.absoluteStart + _loc28_.textLength || _loc27_.parent == null || _loc27_.validity == TextLineValidity.INVALID)
                     {
                        _loc28_ = this.flowComposer.findLineAtPosition(_loc4_.absolutePosition);
                        _loc29_ = 0;
                        while(_loc29_ < this._shapeChildren.length)
                        {
                           if((this._shapeChildren[_loc29_] as TextLine).userData == _loc28_)
                           {
                              break;
                           }
                           _loc29_++;
                        }
                        _loc24_ = _loc29_ < this._shapeChildren.length ? this._shapeChildren[_loc29_] : null;
                     }
                  }
               }
               _loc2_ = _loc5_.parent;
               if(_loc18_ < _loc21_ && _loc4_.parent == this._container && _loc2_ && _loc2_.parent == this._container && _loc5_ == this._floatsInContainer[_loc18_])
               {
                  if(_loc4_.matrix)
                  {
                     _loc2_.transform.matrix = _loc4_.matrix;
                  }
                  else
                  {
                     _loc2_.x = 0;
                     _loc2_.y = 0;
                  }
                  _loc2_.alpha = _loc4_.alpha;
                  _loc2_.x += _loc4_.x;
                  _loc2_.y += _loc4_.y;
                  _loc17_++;
                  _loc18_++;
               }
               else if((_loc26_ = this._floatsInContainer.indexOf(_loc5_)) > _loc18_ && _loc24_ == this._container)
               {
                  if((_loc30_ = this._floatsInContainer[_loc18_++]).parent)
                  {
                     this.removeInlineGraphicElement(this._container,_loc30_.parent);
                  }
               }
               else
               {
                  if(_loc18_ < _loc21_ && _loc5_ == this._floatsInContainer[_loc18_])
                  {
                     _loc18_++;
                  }
                  _loc2_ = new Sprite();
                  if(_loc4_.matrix)
                  {
                     _loc2_.transform.matrix = _loc4_.matrix;
                  }
                  _loc2_.alpha = _loc4_.alpha;
                  _loc2_.x += _loc4_.x;
                  _loc2_.y += _loc4_.y;
                  _loc2_.addChild(_loc5_);
                  if(_loc24_ == this._container)
                  {
                     _loc19_ = Math.min(_loc19_,this._container.numChildren);
                     this.addInlineGraphicElement(this._container,_loc2_,_loc19_++);
                  }
                  else
                  {
                     this.addInlineGraphicElement(_loc24_,_loc2_,0);
                  }
                  _loc17_++;
               }
            }
         }
         while(_loc18_ < this._floatsInContainer.length)
         {
            if((_loc5_ = this._floatsInContainer[_loc18_++]).parent)
            {
               this.removeInlineGraphicElement(this._container,_loc5_.parent);
            }
         }
         this._floatsInContainer = _loc3_;
      }
      
      private function floatIsVisible(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:FloatCompositionData) : Boolean
      {
         var _loc7_:InlineGraphicElement = this.textFlow.findLeaf(param6.absolutePosition) as InlineGraphicElement;
         return param1 == BlockProgression.TB ? param6.y + _loc7_.tlf_internal::elementHeight >= param3 && param6.y <= param3 + param5 : param6.x + _loc7_.tlf_internal::elementWidth >= param2 && param6.x <= param2 + param4;
      }
      
      private function releaseLinesInBlock(param1:TextBlock) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:TextLine = param1.firstLine;
         while(Boolean(_loc2_) && _loc2_.parent == null)
         {
            _loc2_ = _loc2_.nextLine;
         }
         if(!_loc2_ && Boolean(param1.firstLine))
         {
            if(_loc4_ = param1.firstLine.userData as TextFlowLine)
            {
               _loc3_ = _loc4_.paragraph;
            }
            param1.releaseLines(param1.firstLine,param1.lastLine);
            if(_loc3_)
            {
               _loc3_.tlf_internal::releaseTextBlock();
            }
         }
      }
      
      private function removeAndRecycleTextLines(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc3_:BackgroundManager = this.textFlow.tlf_internal::backgroundManager;
         var _loc6_:int = param1;
         while(_loc6_ < param2)
         {
            _loc4_ = this._shapeChildren[_loc6_];
            this.removeTextLine(_loc4_);
            if(_loc4_.textBlock != _loc5_)
            {
               if(_loc5_)
               {
                  this.releaseLinesInBlock(_loc5_);
               }
               _loc5_ = _loc4_.textBlock;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            this.releaseLinesInBlock(_loc5_);
         }
         if(false)
         {
            while(param1 < param2)
            {
               if(!(_loc4_ = this._shapeChildren[param1++]).parent)
               {
                  if(_loc4_.userData == null)
                  {
                     TextLineRecycler.addLineForReuse(_loc4_);
                     if(_loc3_)
                     {
                        _loc3_.removeLineFromCache(_loc4_);
                     }
                  }
                  else if(!((Boolean(_loc7_ = _loc4_.userData as TextFlowLine)) && _loc7_.controller != this))
                  {
                     if(_loc4_.validity == TextLineValidity.INVALID || _loc4_.nextLine == null && _loc4_.previousLine == null && (!_loc4_.textBlock || _loc4_.textBlock.firstLine != _loc4_))
                     {
                        _loc4_.userData = null;
                        TextLineRecycler.addLineForReuse(_loc4_);
                        if(_loc3_)
                        {
                           _loc3_.removeLineFromCache(_loc4_);
                        }
                     }
                  }
               }
            }
         }
      }
      
      protected function getFirstTextLineChildIndex() : int
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this._container.numChildren)
         {
            if(this._container.getChildAt(_loc1_) is TextLine)
            {
               break;
            }
            _loc1_++;
         }
         return _loc1_;
      }
      
      protected function addTextLine(param1:TextLine, param2:int) : void
      {
         this._container.addChildAt(param1,param2);
      }
      
      protected function removeTextLine(param1:TextLine) : void
      {
         if(this._container.contains(param1))
         {
            this._container.removeChild(param1);
         }
      }
      
      protected function addBackgroundShape(param1:Shape) : void
      {
         this._container.addChildAt(this._backgroundShape,this.getFirstTextLineChildIndex());
      }
      
      protected function removeBackgroundShape(param1:Shape) : void
      {
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      protected function addSelectionContainer(param1:DisplayObjectContainer) : void
      {
         if(param1.blendMode == BlendMode.NORMAL && param1.alpha == 1)
         {
            this._container.addChildAt(param1,this.getFirstTextLineChildIndex());
         }
         else
         {
            this._container.addChild(param1);
         }
      }
      
      protected function removeSelectionContainer(param1:DisplayObjectContainer) : void
      {
         param1.parent.removeChild(param1);
      }
      
      protected function addInlineGraphicElement(param1:DisplayObjectContainer, param2:DisplayObject, param3:int) : void
      {
         param1.addChildAt(param2,param3);
      }
      
      protected function removeInlineGraphicElement(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param2.parent == param1)
         {
            param1.removeChild(param2);
         }
      }
      
      tlf_internal function get textLines() : Array
      {
         return this._shapeChildren;
      }
      
      protected function updateVisibleRectangle() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         if(this.horizontalScrollPolicy == ScrollPolicy.OFF && this.verticalScrollPolicy == ScrollPolicy.OFF)
         {
            if(this._hasScrollRect)
            {
               this._container.scrollRect = null;
               this._hasScrollRect = false;
            }
         }
         else
         {
            _loc1_ = this._contentLeft + this.tlf_internal::contentWidth;
            _loc2_ = this._contentTop + this.tlf_internal::contentHeight;
            if(this._measureWidth)
            {
               _loc3_ = this.tlf_internal::contentWidth;
               _loc4_ = this._contentLeft + _loc3_;
            }
            else
            {
               _loc3_ = this._compositionWidth;
               _loc4_ = _loc3_;
            }
            if(this._measureHeight)
            {
               _loc5_ = this.tlf_internal::contentHeight;
               _loc6_ = this._contentTop + _loc5_;
            }
            else
            {
               _loc6_ = _loc5_ = this._compositionHeight;
            }
            _loc7_ = this.tlf_internal::effectiveBlockProgression == BlockProgression.RL ? -_loc3_ : 0;
            _loc8_ = this.horizontalScrollPosition + _loc7_;
            _loc9_ = this.verticalScrollPosition;
            if(this.textLength == 0 || _loc8_ == 0 && _loc9_ == 0 && this._contentLeft >= _loc7_ && this._contentTop >= 0 && _loc1_ <= _loc4_ && _loc2_ <= _loc6_)
            {
               if(this._hasScrollRect)
               {
                  this._container.scrollRect = null;
                  this._hasScrollRect = false;
               }
            }
            else if(!(_loc10_ = this._container.scrollRect) || _loc10_.x != _loc8_ || _loc10_.y != _loc9_ || _loc10_.width != _loc3_ || _loc10_.height != _loc5_)
            {
               this._container.scrollRect = new Rectangle(_loc8_,_loc9_,_loc3_,_loc5_);
               this._hasScrollRect = true;
            }
         }
         this.tlf_internal::attachTransparentBackgroundForHit(false);
      }
      
      public function get color() : *
      {
         return !!this._format ? this._format.color : undefined;
      }
      
      public function set color(param1:*) : void
      {
         this.writableTextLayoutFormat().color = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get backgroundColor() : *
      {
         return !!this._format ? this._format.backgroundColor : undefined;
      }
      
      public function set backgroundColor(param1:*) : void
      {
         this.writableTextLayoutFormat().backgroundColor = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get lineThrough() : *
      {
         return !!this._format ? this._format.lineThrough : undefined;
      }
      
      public function set lineThrough(param1:*) : void
      {
         this.writableTextLayoutFormat().lineThrough = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textAlpha() : *
      {
         return !!this._format ? this._format.textAlpha : undefined;
      }
      
      public function set textAlpha(param1:*) : void
      {
         this.writableTextLayoutFormat().textAlpha = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get backgroundAlpha() : *
      {
         return !!this._format ? this._format.backgroundAlpha : undefined;
      }
      
      public function set backgroundAlpha(param1:*) : void
      {
         this.writableTextLayoutFormat().backgroundAlpha = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get fontSize() : *
      {
         return !!this._format ? this._format.fontSize : undefined;
      }
      
      public function set fontSize(param1:*) : void
      {
         this.writableTextLayoutFormat().fontSize = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get baselineShift() : *
      {
         return !!this._format ? this._format.baselineShift : undefined;
      }
      
      public function set baselineShift(param1:*) : void
      {
         this.writableTextLayoutFormat().baselineShift = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get trackingLeft() : *
      {
         return !!this._format ? this._format.trackingLeft : undefined;
      }
      
      public function set trackingLeft(param1:*) : void
      {
         this.writableTextLayoutFormat().trackingLeft = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get trackingRight() : *
      {
         return !!this._format ? this._format.trackingRight : undefined;
      }
      
      public function set trackingRight(param1:*) : void
      {
         this.writableTextLayoutFormat().trackingRight = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get lineHeight() : *
      {
         return !!this._format ? this._format.lineHeight : undefined;
      }
      
      public function set lineHeight(param1:*) : void
      {
         this.writableTextLayoutFormat().lineHeight = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get breakOpportunity() : *
      {
         return !!this._format ? this._format.breakOpportunity : undefined;
      }
      
      public function set breakOpportunity(param1:*) : void
      {
         this.writableTextLayoutFormat().breakOpportunity = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get digitCase() : *
      {
         return !!this._format ? this._format.digitCase : undefined;
      }
      
      public function set digitCase(param1:*) : void
      {
         this.writableTextLayoutFormat().digitCase = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get digitWidth() : *
      {
         return !!this._format ? this._format.digitWidth : undefined;
      }
      
      public function set digitWidth(param1:*) : void
      {
         this.writableTextLayoutFormat().digitWidth = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get dominantBaseline() : *
      {
         return !!this._format ? this._format.dominantBaseline : undefined;
      }
      
      public function set dominantBaseline(param1:*) : void
      {
         this.writableTextLayoutFormat().dominantBaseline = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get kerning() : *
      {
         return !!this._format ? this._format.kerning : undefined;
      }
      
      public function set kerning(param1:*) : void
      {
         this.writableTextLayoutFormat().kerning = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get ligatureLevel() : *
      {
         return !!this._format ? this._format.ligatureLevel : undefined;
      }
      
      public function set ligatureLevel(param1:*) : void
      {
         this.writableTextLayoutFormat().ligatureLevel = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get alignmentBaseline() : *
      {
         return !!this._format ? this._format.alignmentBaseline : undefined;
      }
      
      public function set alignmentBaseline(param1:*) : void
      {
         this.writableTextLayoutFormat().alignmentBaseline = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get locale() : *
      {
         return !!this._format ? this._format.locale : undefined;
      }
      
      public function set locale(param1:*) : void
      {
         this.writableTextLayoutFormat().locale = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get typographicCase() : *
      {
         return !!this._format ? this._format.typographicCase : undefined;
      }
      
      public function set typographicCase(param1:*) : void
      {
         this.writableTextLayoutFormat().typographicCase = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get fontFamily() : *
      {
         return !!this._format ? this._format.fontFamily : undefined;
      }
      
      public function set fontFamily(param1:*) : void
      {
         this.writableTextLayoutFormat().fontFamily = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textDecoration() : *
      {
         return !!this._format ? this._format.textDecoration : undefined;
      }
      
      public function set textDecoration(param1:*) : void
      {
         this.writableTextLayoutFormat().textDecoration = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get fontWeight() : *
      {
         return !!this._format ? this._format.fontWeight : undefined;
      }
      
      public function set fontWeight(param1:*) : void
      {
         this.writableTextLayoutFormat().fontWeight = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get fontStyle() : *
      {
         return !!this._format ? this._format.fontStyle : undefined;
      }
      
      public function set fontStyle(param1:*) : void
      {
         this.writableTextLayoutFormat().fontStyle = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get whiteSpaceCollapse() : *
      {
         return !!this._format ? this._format.whiteSpaceCollapse : undefined;
      }
      
      public function set whiteSpaceCollapse(param1:*) : void
      {
         this.writableTextLayoutFormat().whiteSpaceCollapse = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get renderingMode() : *
      {
         return !!this._format ? this._format.renderingMode : undefined;
      }
      
      public function set renderingMode(param1:*) : void
      {
         this.writableTextLayoutFormat().renderingMode = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get cffHinting() : *
      {
         return !!this._format ? this._format.cffHinting : undefined;
      }
      
      public function set cffHinting(param1:*) : void
      {
         this.writableTextLayoutFormat().cffHinting = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get fontLookup() : *
      {
         return !!this._format ? this._format.fontLookup : undefined;
      }
      
      public function set fontLookup(param1:*) : void
      {
         this.writableTextLayoutFormat().fontLookup = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textRotation() : *
      {
         return !!this._format ? this._format.textRotation : undefined;
      }
      
      public function set textRotation(param1:*) : void
      {
         this.writableTextLayoutFormat().textRotation = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textIndent() : *
      {
         return !!this._format ? this._format.textIndent : undefined;
      }
      
      public function set textIndent(param1:*) : void
      {
         this.writableTextLayoutFormat().textIndent = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paragraphStartIndent() : *
      {
         return !!this._format ? this._format.paragraphStartIndent : undefined;
      }
      
      public function set paragraphStartIndent(param1:*) : void
      {
         this.writableTextLayoutFormat().paragraphStartIndent = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paragraphEndIndent() : *
      {
         return !!this._format ? this._format.paragraphEndIndent : undefined;
      }
      
      public function set paragraphEndIndent(param1:*) : void
      {
         this.writableTextLayoutFormat().paragraphEndIndent = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paragraphSpaceBefore() : *
      {
         return !!this._format ? this._format.paragraphSpaceBefore : undefined;
      }
      
      public function set paragraphSpaceBefore(param1:*) : void
      {
         this.writableTextLayoutFormat().paragraphSpaceBefore = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paragraphSpaceAfter() : *
      {
         return !!this._format ? this._format.paragraphSpaceAfter : undefined;
      }
      
      public function set paragraphSpaceAfter(param1:*) : void
      {
         this.writableTextLayoutFormat().paragraphSpaceAfter = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textAlign() : *
      {
         return !!this._format ? this._format.textAlign : undefined;
      }
      
      public function set textAlign(param1:*) : void
      {
         this.writableTextLayoutFormat().textAlign = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textAlignLast() : *
      {
         return !!this._format ? this._format.textAlignLast : undefined;
      }
      
      public function set textAlignLast(param1:*) : void
      {
         this.writableTextLayoutFormat().textAlignLast = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get textJustify() : *
      {
         return !!this._format ? this._format.textJustify : undefined;
      }
      
      public function set textJustify(param1:*) : void
      {
         this.writableTextLayoutFormat().textJustify = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get justificationRule() : *
      {
         return !!this._format ? this._format.justificationRule : undefined;
      }
      
      public function set justificationRule(param1:*) : void
      {
         this.writableTextLayoutFormat().justificationRule = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get justificationStyle() : *
      {
         return !!this._format ? this._format.justificationStyle : undefined;
      }
      
      public function set justificationStyle(param1:*) : void
      {
         this.writableTextLayoutFormat().justificationStyle = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get direction() : *
      {
         return !!this._format ? this._format.direction : undefined;
      }
      
      public function set direction(param1:*) : void
      {
         this.writableTextLayoutFormat().direction = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get wordSpacing() : *
      {
         return !!this._format ? this._format.wordSpacing : undefined;
      }
      
      public function set wordSpacing(param1:*) : void
      {
         this.writableTextLayoutFormat().wordSpacing = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get tabStops() : *
      {
         return !!this._format ? this._format.tabStops : undefined;
      }
      
      public function set tabStops(param1:*) : void
      {
         this.writableTextLayoutFormat().tabStops = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get leadingModel() : *
      {
         return !!this._format ? this._format.leadingModel : undefined;
      }
      
      public function set leadingModel(param1:*) : void
      {
         this.writableTextLayoutFormat().leadingModel = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get columnGap() : *
      {
         return !!this._format ? this._format.columnGap : undefined;
      }
      
      public function set columnGap(param1:*) : void
      {
         this.writableTextLayoutFormat().columnGap = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paddingLeft() : *
      {
         return !!this._format ? this._format.paddingLeft : undefined;
      }
      
      public function set paddingLeft(param1:*) : void
      {
         this.writableTextLayoutFormat().paddingLeft = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paddingTop() : *
      {
         return !!this._format ? this._format.paddingTop : undefined;
      }
      
      public function set paddingTop(param1:*) : void
      {
         this.writableTextLayoutFormat().paddingTop = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paddingRight() : *
      {
         return !!this._format ? this._format.paddingRight : undefined;
      }
      
      public function set paddingRight(param1:*) : void
      {
         this.writableTextLayoutFormat().paddingRight = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get paddingBottom() : *
      {
         return !!this._format ? this._format.paddingBottom : undefined;
      }
      
      public function set paddingBottom(param1:*) : void
      {
         this.writableTextLayoutFormat().paddingBottom = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get columnCount() : *
      {
         return !!this._format ? this._format.columnCount : undefined;
      }
      
      public function set columnCount(param1:*) : void
      {
         this.writableTextLayoutFormat().columnCount = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get columnWidth() : *
      {
         return !!this._format ? this._format.columnWidth : undefined;
      }
      
      public function set columnWidth(param1:*) : void
      {
         this.writableTextLayoutFormat().columnWidth = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get firstBaselineOffset() : *
      {
         return !!this._format ? this._format.firstBaselineOffset : undefined;
      }
      
      public function set firstBaselineOffset(param1:*) : void
      {
         this.writableTextLayoutFormat().firstBaselineOffset = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get verticalAlign() : *
      {
         return !!this._format ? this._format.verticalAlign : undefined;
      }
      
      public function set verticalAlign(param1:*) : void
      {
         this.writableTextLayoutFormat().verticalAlign = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get blockProgression() : *
      {
         return !!this._format ? this._format.blockProgression : undefined;
      }
      
      public function set blockProgression(param1:*) : void
      {
         this.writableTextLayoutFormat().blockProgression = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get lineBreak() : *
      {
         return !!this._format ? this._format.lineBreak : undefined;
      }
      
      public function set lineBreak(param1:*) : void
      {
         this.writableTextLayoutFormat().lineBreak = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get listStyleType() : *
      {
         return !!this._format ? this._format.listStyleType : undefined;
      }
      
      public function set listStyleType(param1:*) : void
      {
         this.writableTextLayoutFormat().listStyleType = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get listStylePosition() : *
      {
         return !!this._format ? this._format.listStylePosition : undefined;
      }
      
      public function set listStylePosition(param1:*) : void
      {
         this.writableTextLayoutFormat().listStylePosition = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get listAutoPadding() : *
      {
         return !!this._format ? this._format.listAutoPadding : undefined;
      }
      
      public function set listAutoPadding(param1:*) : void
      {
         this.writableTextLayoutFormat().listAutoPadding = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get clearFloats() : *
      {
         return !!this._format ? this._format.clearFloats : undefined;
      }
      
      public function set clearFloats(param1:*) : void
      {
         this.writableTextLayoutFormat().clearFloats = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get styleName() : *
      {
         return !!this._format ? this._format.styleName : undefined;
      }
      
      public function set styleName(param1:*) : void
      {
         this.writableTextLayoutFormat().styleName = param1;
         this.tlf_internal::styleSelectorChanged();
      }
      
      public function get linkNormalFormat() : *
      {
         return !!this._format ? this._format.linkNormalFormat : undefined;
      }
      
      public function set linkNormalFormat(param1:*) : void
      {
         this.writableTextLayoutFormat().linkNormalFormat = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get linkActiveFormat() : *
      {
         return !!this._format ? this._format.linkActiveFormat : undefined;
      }
      
      public function set linkActiveFormat(param1:*) : void
      {
         this.writableTextLayoutFormat().linkActiveFormat = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get linkHoverFormat() : *
      {
         return !!this._format ? this._format.linkHoverFormat : undefined;
      }
      
      public function set linkHoverFormat(param1:*) : void
      {
         this.writableTextLayoutFormat().linkHoverFormat = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get listMarkerFormat() : *
      {
         return !!this._format ? this._format.listMarkerFormat : undefined;
      }
      
      public function set listMarkerFormat(param1:*) : void
      {
         this.writableTextLayoutFormat().listMarkerFormat = param1;
         this.tlf_internal::formatChanged();
      }
      
      public function get userStyles() : Object
      {
         return !!this._format ? this._format.userStyles : null;
      }
      
      public function set userStyles(param1:Object) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this.userStyles)
         {
            this.setStyle(_loc2_,undefined);
         }
         for(_loc2_ in param1)
         {
            this.setStyle(_loc2_,param1[_loc2_]);
         }
      }
      
      public function get coreStyles() : Object
      {
         return !!this._format ? this._format.coreStyles : null;
      }
      
      public function get styles() : Object
      {
         return !!this._format ? this._format.styles : null;
      }
      
      public function get format() : ITextLayoutFormat
      {
         return this._format;
      }
      
      public function set format(param1:ITextLayoutFormat) : void
      {
         if(param1 == this._format)
         {
            return;
         }
         var _loc2_:String = this.styleName;
         if(param1 == null)
         {
            this._format.tlf_internal::clearStyles();
         }
         else
         {
            this.writableTextLayoutFormat().copy(param1);
         }
         this.tlf_internal::formatChanged();
         if(_loc2_ != this.styleName)
         {
            this.tlf_internal::styleSelectorChanged();
         }
      }
      
      private function writableTextLayoutFormat() : FlowValueHolder
      {
         if(this._format == null)
         {
            this._format = new FlowValueHolder();
         }
         return this._format;
      }
      
      public function getStyle(param1:String) : *
      {
         if(TextLayoutFormat.tlf_internal::description.hasOwnProperty(param1))
         {
            return this.computedFormat.getStyle(param1);
         }
         var _loc2_:TextFlow = this._rootElement.getTextFlow();
         if(!_loc2_ || !_loc2_.formatResolver)
         {
            return this.computedFormat.getStyle(param1);
         }
         return this.tlf_internal::getUserStyleWorker(param1);
      }
      
      tlf_internal function getUserStyleWorker(param1:String) : *
      {
         var _loc2_:* = this._format.getStyle(param1);
         if(_loc2_ !== undefined)
         {
            return _loc2_;
         }
         var _loc3_:TextFlow = !!this._rootElement ? this._rootElement.getTextFlow() : null;
         if(Boolean(_loc3_) && Boolean(_loc3_.formatResolver))
         {
            _loc2_ = _loc3_.formatResolver.resolveUserFormat(this,param1);
            if(_loc2_ !== undefined)
            {
               return _loc2_;
            }
         }
         return !!this._rootElement ? this._rootElement.tlf_internal::getUserStyleWorker(param1) : undefined;
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         if(TextLayoutFormat.tlf_internal::description[param1])
         {
            this[param1] = param2;
         }
         else
         {
            this.writableTextLayoutFormat().setStyle(param1,param2);
            this.tlf_internal::formatChanged();
         }
      }
      
      public function clearStyle(param1:String) : void
      {
         this.setStyle(param1,undefined);
      }
      
      public function get computedFormat() : ITextLayoutFormat
      {
         var _loc1_:* = null;
         if(!this._computedFormat)
         {
            _loc1_ = !!this._rootElement ? TextLayoutFormat(this._rootElement.computedFormat) : null;
            this._computedFormat = FlowElement.tlf_internal::createTextLayoutFormatPrototype(this.tlf_internal::formatForCascade,_loc1_);
            this.tlf_internal::resetColumnState();
         }
         return this._computedFormat;
      }
      
      tlf_internal function get formatForCascade() : ITextLayoutFormat
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._rootElement)
         {
            _loc1_ = this._rootElement.getTextFlow();
            if(_loc1_)
            {
               _loc2_ = _loc1_.tlf_internal::getTextLayoutFormatStyle(this);
               if(_loc2_)
               {
                  _loc3_ = this._format;
                  if(_loc3_ == null)
                  {
                     return _loc2_;
                  }
                  (_loc4_ = new TextLayoutFormat(_loc2_)).apply(_loc3_);
                  return _loc4_;
               }
            }
         }
         return this._format;
      }
      
      tlf_internal function isLineVisible(param1:String, param2:int, param3:int, param4:int, param5:int, param6:TextFlowLine, param7:TextLine) : TextLine
      {
         var _loc8_:* = null;
         if(!param6.tlf_internal::hasLineBounds())
         {
            if(!param7)
            {
               param7 = param6.getTextLine(true);
            }
            param6.tlf_internal::createShape(param1,param7);
            if(param7.numChildren == 0)
            {
               if(param1 == BlockProgression.TB)
               {
                  param6.tlf_internal::cacheLineBounds(param1,param7.x,param7.y - param7.ascent,param7.textWidth,param7.textHeight);
               }
               else
               {
                  param6.tlf_internal::cacheLineBounds(param1,param7.x - param7.descent,param7.y,param7.textHeight,param7.textWidth);
               }
            }
            else
            {
               _loc8_ = this.tlf_internal::getPlacedTextLineBounds(param7);
               if(param7.hasGraphicElement)
               {
                  _loc8_ = this.computeLineBoundsWithGraphics(param6,param7,_loc8_);
               }
               param6.tlf_internal::cacheLineBounds(param1,_loc8_.x,_loc8_.y,_loc8_.width,_loc8_.height);
            }
         }
         if((param1 == BlockProgression.TB ? this._measureHeight : this._measureWidth) || param6.tlf_internal::isLineVisible(param1,param2,param3,param4,param5))
         {
            return !!param7 ? param7 : param6.getTextLine(true);
         }
         return null;
      }
      
      private function computeLineBoundsWithGraphics(param1:TextFlowLine, param2:TextLine, param3:Rectangle) : Rectangle
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._composedFloats)
         {
            _loc4_ = this.tlf_internal::findFloatIndexAtOrAfter(param1.absoluteStart);
            _loc5_ = this.tlf_internal::findFloatIndexAtOrAfter(param1.absoluteStart + param1.textLength);
            _loc6_ = new Rectangle();
            _loc7_ = new Point();
            while(_loc4_ < _loc5_)
            {
               if((_loc8_ = this._composedFloats[_loc4_]).floatType == Float.NONE)
               {
                  if(_loc10_ = (_loc9_ = this.textFlow.findLeaf(_loc8_.absolutePosition) as InlineGraphicElement).tlf_internal::placeholderGraphic.parent)
                  {
                     _loc6_.x = param2.x + _loc10_.x;
                     _loc6_.y = param2.y + _loc10_.y;
                     _loc6_.width = _loc9_.tlf_internal::elementWidth;
                     _loc6_.height = _loc9_.tlf_internal::elementHeight;
                     param3 = param3.union(_loc6_);
                  }
               }
               _loc4_++;
            }
         }
         return param3;
      }
      
      tlf_internal function getPlacedTextLineBounds(param1:TextLine) : Rectangle
      {
         var _loc2_:* = null;
         _loc2_ = param1.getBounds(param1);
         _loc2_.x += param1.x;
         _loc2_.y += param1.y;
         return _loc2_;
      }
      
      tlf_internal function addComposedLine(param1:TextLine) : void
      {
         this._linesInView.push(param1);
      }
      
      tlf_internal function get composedLines() : Array
      {
         if(!this._linesInView)
         {
            this._linesInView = [];
         }
         return this._linesInView;
      }
      
      tlf_internal function clearComposedLines(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this._linesInView)
         {
            if((_loc4_ = _loc3_.userData as TextFlowLine).absoluteStart >= param1)
            {
               break;
            }
            _loc2_++;
         }
         this._linesInView.length = _loc2_;
         this._updateStart = Math.min(this._updateStart,param1);
      }
      
      tlf_internal function get numFloats() : int
      {
         return !!this._composedFloats ? this._composedFloats.length : 0;
      }
      
      tlf_internal function getFloatAt(param1:int) : FloatCompositionData
      {
         return this._composedFloats[param1];
      }
      
      tlf_internal function getFloatAtPosition(param1:int) : FloatCompositionData
      {
         if(!this._composedFloats)
         {
            return null;
         }
         var _loc2_:int = this.tlf_internal::findFloatIndexAtOrAfter(param1);
         return _loc2_ < this._composedFloats.length ? this._composedFloats[_loc2_] : null;
      }
      
      tlf_internal function addFloatAt(param1:int, param2:DisplayObject, param3:String, param4:Number, param5:Number, param6:Number, param7:Matrix, param8:Number, param9:Number, param10:int, param11:DisplayObjectContainer) : void
      {
         var _loc13_:int = 0;
         if(!this._composedFloats)
         {
            this._composedFloats = [];
         }
         var _loc12_:FloatCompositionData = new FloatCompositionData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         if(this._composedFloats.length > 0 && this._composedFloats[this._composedFloats.length - 1] < param1)
         {
            this._composedFloats.push(_loc12_);
         }
         else
         {
            _loc13_ = this.tlf_internal::findFloatIndexAtOrAfter(param1);
            this._composedFloats.splice(_loc13_,0,_loc12_);
         }
      }
      
      tlf_internal function clearFloatsAt(param1:int) : void
      {
         if(this._composedFloats)
         {
            if(param1 == this.absoluteStart)
            {
               this._composedFloats.length = 0;
            }
            else
            {
               this._composedFloats.length = this.tlf_internal::findFloatIndexAtOrAfter(param1);
            }
         }
      }
      
      tlf_internal function findFloatIndexAfter(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._composedFloats.length && this._composedFloats[_loc2_].absolutePosition <= param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      tlf_internal function findFloatIndexAtOrAfter(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._composedFloats.length && this._composedFloats[_loc2_].absolutePosition < param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      tlf_internal function getInteractionHandler() : IInteractionEventHandler
      {
         return this;
      }
   }
}

import flash.display.InteractiveObject;
import flash.events.MouseEvent;

class PsuedoMouseEvent extends MouseEvent
{
    
   
   function PsuedoMouseEvent(param1:String, param2:Boolean = true, param3:Boolean = false, param4:Number = NaN, param5:Number = NaN, param6:InteractiveObject = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
   {
      super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
   }
   
   override public function get currentTarget() : Object
   {
      return relatedObject;
   }
   
   override public function get target() : Object
   {
      return relatedObject;
   }
}
