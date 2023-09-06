package spark.components
{
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import mx.core.FlexVersion;
   import mx.core.IFlexModule;
   import mx.core.IFontContextComponent;
   import mx.core.IUIComponent;
   import mx.core.IUITextField;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.graphics.shaderClasses.ColorBurnShader;
   import mx.graphics.shaderClasses.ColorDodgeShader;
   import mx.graphics.shaderClasses.ColorShader;
   import mx.graphics.shaderClasses.ExclusionShader;
   import mx.graphics.shaderClasses.HueShader;
   import mx.graphics.shaderClasses.LuminosityShader;
   import mx.graphics.shaderClasses.SaturationShader;
   import mx.graphics.shaderClasses.SoftLightShader;
   import mx.styles.IAdvancedStyleClient;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleProtoChain;
   import spark.components.supportClasses.GroupBase;
   import spark.core.DisplayObjectSharingMode;
   import spark.core.IGraphicElement;
   import spark.core.IGraphicElementContainer;
   import spark.core.ISharedDisplayObject;
   import spark.events.ElementExistenceEvent;
   
   public class Group extends GroupBase implements IVisualElementContainer, IGraphicElementContainer, ISharedDisplayObject
   {
      
      private static const ITEM_ORDERED_LAYERING:uint = 0;
      
      private static const SPARSE_LAYERING:uint = 1;
       
      
      private var needsDisplayObjectAssignment:Boolean = false;
      
      private var layeringMode:uint = 0;
      
      private var numGraphicElements:uint = 0;
      
      private var _baselinePositionElement:IVisualElement;
      
      private var _blendMode:String = "auto";
      
      private var blendModeChanged:Boolean;
      
      private var blendShaderChanged:Boolean;
      
      private var mxmlContentChanged:Boolean = false;
      
      private var _mxmlContent:Array;
      
      private var scaleGridChanged:Boolean = false;
      
      private var scaleGridStorageVariable:Rectangle;
      
      private var createChildrenCalled:Boolean = false;
      
      private var _redrawRequested:Boolean = false;
      
      public function Group()
      {
         super();
      }
      
      override public function get baselinePosition() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(false)
         {
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         var _loc1_:IVisualElement = this.baselinePositionElement;
         if(_loc1_ == null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.numElements)
            {
               _loc3_ = this.getElementAt(_loc2_);
               if(_loc3_.includeInLayout)
               {
                  _loc1_ = _loc3_;
                  break;
               }
               _loc2_++;
            }
         }
         if(_loc1_)
         {
            return _loc1_.baselinePosition + _loc1_.y;
         }
         return super.baselinePosition;
      }
      
      override public function set resizeMode(param1:String) : void
      {
         if(this.isValidScaleGrid())
         {
            param1 = "null";
         }
         super.resizeMode = param1;
      }
      
      override public function set scrollRect(param1:Rectangle) : void
      {
         var _loc2_:Boolean = this.canShareDisplayObject;
         super.scrollRect = param1;
         if(this.numGraphicElements > 0 && _loc2_ != this.canShareDisplayObject)
         {
            this.invalidateDisplayObjectOrdering();
         }
         if(mouseEnabledWhereTransparent && mx_internal::hasMouseListeners)
         {
            this.redrawRequested = true;
            super.mx_internal::$invalidateDisplayList();
         }
      }
      
      override mx_internal function set hasMouseListeners(param1:Boolean) : void
      {
         if(mouseEnabledWhereTransparent)
         {
            this.redrawRequested = true;
         }
         super.mx_internal::hasMouseListeners = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         if(mx_internal::_width != param1)
         {
            if(mouseEnabledWhereTransparent && mx_internal::hasMouseListeners)
            {
               this.redrawRequested = true;
               super.mx_internal::$invalidateDisplayList();
            }
         }
         super.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         if(mx_internal::_height != param1)
         {
            if(mouseEnabledWhereTransparent && mx_internal::hasMouseListeners)
            {
               this.redrawRequested = true;
               super.mx_internal::$invalidateDisplayList();
            }
         }
         super.height = param1;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(super.alpha == param1)
         {
            return;
         }
         if(this._blendMode == "auto")
         {
            if(param1 > 0 && param1 < 1 && (super.alpha == 0 || super.alpha == 1) || (param1 == 0 || param1 == 1) && (super.alpha > 0 && super.alpha < 1))
            {
               this.blendModeChanged = true;
               this.invalidateDisplayObjectOrdering();
               invalidateProperties();
            }
         }
         super.alpha = param1;
      }
      
      public function get baselinePositionElement() : IVisualElement
      {
         return this._baselinePositionElement;
      }
      
      public function set baselinePositionElement(param1:IVisualElement) : void
      {
         if(param1 === this._baselinePositionElement)
         {
            return;
         }
         this._baselinePositionElement = param1;
         invalidateParentSizeAndDisplayList();
      }
      
      override public function get blendMode() : String
      {
         return this._blendMode;
      }
      
      override public function set blendMode(param1:String) : void
      {
         var _loc2_:* = null;
         if(param1 == this._blendMode)
         {
            return;
         }
         invalidateProperties();
         this.blendModeChanged = true;
         if(param1 == "auto")
         {
            this._blendMode = param1;
            if(alpha > 0 && alpha < 1 && super.mx_internal::$blendMode != BlendMode.LAYER || (alpha == 1 || alpha == 0) && super.mx_internal::$blendMode != BlendMode.NORMAL)
            {
               this.invalidateDisplayObjectOrdering();
            }
         }
         else
         {
            _loc2_ = this._blendMode;
            this._blendMode = param1;
            if(this.isAIMBlendMode(param1))
            {
               this.blendShaderChanged = true;
            }
            if((_loc2_ == BlendMode.NORMAL || param1 == BlendMode.NORMAL) && !(_loc2_ == BlendMode.NORMAL && param1 == BlendMode.NORMAL))
            {
               this.invalidateDisplayObjectOrdering();
            }
         }
      }
      
      public function set mxmlContent(param1:Array) : void
      {
         if(this.createChildrenCalled)
         {
            this.setMXMLContent(param1);
         }
         else
         {
            this.mxmlContentChanged = true;
            this._mxmlContent = param1;
         }
      }
      
      mx_internal function getMXMLContent() : Array
      {
         if(this._mxmlContent)
         {
            return this._mxmlContent.concat();
         }
         return null;
      }
      
      private function setMXMLContent(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this._mxmlContent != null && this._mxmlContent != param1)
         {
            _loc2_ = this._mxmlContent.length - 1;
            while(_loc2_ >= 0)
            {
               this.mx_internal::elementRemoved(this._mxmlContent[_loc2_],_loc2_);
               _loc2_--;
            }
         }
         this._mxmlContent = !!param1 ? param1.concat() : null;
         if(this._mxmlContent != null)
         {
            _loc3_ = this._mxmlContent.length;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               if(Boolean((_loc4_ = this._mxmlContent[_loc2_]).parent) && _loc4_.parent != this)
               {
                  throw new Error(resourceManager.getString("components","mxmlElementNoMultipleParents",[_loc4_]));
               }
               this.mx_internal::elementAdded(_loc4_,_loc2_);
               _loc2_++;
            }
         }
      }
      
      override public function set scale9Grid(param1:Rectangle) : void
      {
         if(param1 != null)
         {
            this.scaleGridTop = param1.top;
            this.scaleGridBottom = param1.bottom;
            this.scaleGridLeft = param1.left;
            this.scaleGridRight = param1.right;
         }
         else
         {
            this.scaleGridTop = NaN;
            this.scaleGridBottom = NaN;
            this.scaleGridLeft = NaN;
            this.scaleGridRight = NaN;
         }
      }
      
      public function get scaleGridBottom() : Number
      {
         if(this.scaleGridStorageVariable)
         {
            return this.scaleGridStorageVariable.height;
         }
         return NaN;
      }
      
      public function set scaleGridBottom(param1:Number) : void
      {
         if(!this.scaleGridStorageVariable)
         {
            this.scaleGridStorageVariable = new Rectangle(NaN,NaN,NaN,NaN);
         }
         if(param1 != this.scaleGridStorageVariable.height)
         {
            this.scaleGridStorageVariable.height = param1;
            this.scaleGridChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      public function get scaleGridLeft() : Number
      {
         if(this.scaleGridStorageVariable)
         {
            return this.scaleGridStorageVariable.x;
         }
         return NaN;
      }
      
      public function set scaleGridLeft(param1:Number) : void
      {
         if(!this.scaleGridStorageVariable)
         {
            this.scaleGridStorageVariable = new Rectangle(NaN,NaN,NaN,NaN);
         }
         if(param1 != this.scaleGridStorageVariable.x)
         {
            this.scaleGridStorageVariable.x = param1;
            this.scaleGridChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      public function get scaleGridRight() : Number
      {
         if(this.scaleGridStorageVariable)
         {
            return this.scaleGridStorageVariable.width;
         }
         return NaN;
      }
      
      public function set scaleGridRight(param1:Number) : void
      {
         if(!this.scaleGridStorageVariable)
         {
            this.scaleGridStorageVariable = new Rectangle(NaN,NaN,NaN,NaN);
         }
         if(param1 != this.scaleGridStorageVariable.width)
         {
            this.scaleGridStorageVariable.width = param1;
            this.scaleGridChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      public function get scaleGridTop() : Number
      {
         if(this.scaleGridStorageVariable)
         {
            return this.scaleGridStorageVariable.y;
         }
         return NaN;
      }
      
      public function set scaleGridTop(param1:Number) : void
      {
         if(!this.scaleGridStorageVariable)
         {
            this.scaleGridStorageVariable = new Rectangle(NaN,NaN,NaN,NaN);
         }
         if(param1 != this.scaleGridStorageVariable.y)
         {
            this.scaleGridStorageVariable.y = param1;
            this.scaleGridChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      private function isValidScaleGrid() : Boolean
      {
         return !isNaN(this.scaleGridLeft) && !isNaN(this.scaleGridTop) && !isNaN(this.scaleGridRight) && !isNaN(this.scaleGridBottom);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.createChildrenCalled = true;
         if(this.mxmlContentChanged)
         {
            this.mxmlContentChanged = false;
            this.setMXMLContent(this._mxmlContent);
         }
      }
      
      override public function validateProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         super.validateProperties();
         if(this.numGraphicElements > 0)
         {
            _loc1_ = this.numElements;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.getElementAt(_loc2_) as IGraphicElement;
               if(_loc3_)
               {
                  _loc3_.validateProperties();
               }
               _loc2_++;
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         mx_internal::invalidatePropertiesFlag = false;
         if(this.blendModeChanged)
         {
            this.blendModeChanged = false;
            if(this._blendMode == "auto")
            {
               if(alpha == 0 || alpha == 1)
               {
                  super.mx_internal::$blendMode = BlendMode.NORMAL;
               }
               else
               {
                  super.mx_internal::$blendMode = BlendMode.LAYER;
               }
            }
            else if(!this.isAIMBlendMode(this._blendMode))
            {
               super.mx_internal::$blendMode = this._blendMode;
            }
            if(this.blendShaderChanged)
            {
               this.blendShaderChanged = false;
               switch(this._blendMode)
               {
                  case "color":
                     super.blendShader = new ColorShader();
                     break;
                  case "colordodge":
                     super.blendShader = new ColorDodgeShader();
                     break;
                  case "colorburn":
                     super.blendShader = new ColorBurnShader();
                     break;
                  case "exclusion":
                     super.blendShader = new ExclusionShader();
                     break;
                  case "hue":
                     super.blendShader = new HueShader();
                     break;
                  case "luminosity":
                     super.blendShader = new LuminosityShader();
                     break;
                  case "saturation":
                     super.blendShader = new SaturationShader();
                     break;
                  case "softlight":
                     super.blendShader = new SoftLightShader();
               }
            }
         }
         if(mx_internal::invalidatePropertiesFlag)
         {
            super.commitProperties();
            mx_internal::invalidatePropertiesFlag = false;
         }
         if(this.needsDisplayObjectAssignment)
         {
            this.needsDisplayObjectAssignment = false;
            this.assignDisplayObjects();
         }
         if(this.scaleGridChanged)
         {
            if(this.isValidScaleGrid())
            {
               this.resizeMode = ResizeMode.SCALE;
            }
         }
      }
      
      override public function validateSize(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this.numGraphicElements > 0)
         {
            _loc2_ = this.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.getElementAt(_loc3_) as IGraphicElement)
               {
                  _loc4_.validateSize();
               }
               _loc3_++;
            }
         }
         super.validateSize(param1);
      }
      
      override public function setActualSize(param1:Number, param2:Number) : void
      {
         if(mx_internal::_width != param1 || mx_internal::_height != param2)
         {
            if(mouseEnabledWhereTransparent && mx_internal::hasMouseListeners)
            {
               this.redrawRequested = true;
               super.mx_internal::$invalidateDisplayList();
            }
         }
         super.setActualSize(param1,param2);
      }
      
      override public function validateDisplayList() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         super.validateDisplayList();
         if(this.needsDisplayObjectAssignment && Boolean(mx_internal::invalidatePropertiesFlag))
         {
            return;
         }
         var _loc1_:ISharedDisplayObject = this;
         if(this.numGraphicElements > 0)
         {
            _loc2_ = this.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.getElementAt(_loc3_) as IGraphicElement)
               {
                  if(_loc4_.depth == 0)
                  {
                     if(_loc4_.displayObjectSharingMode != DisplayObjectSharingMode.USES_SHARED_OBJECT)
                     {
                        if(_loc1_)
                        {
                           _loc1_.redrawRequested = false;
                        }
                        _loc1_ = _loc4_.displayObject as ISharedDisplayObject;
                     }
                     if(!_loc1_ || _loc1_.redrawRequested)
                     {
                        _loc4_.validateDisplayList();
                     }
                  }
                  else if(!(_loc5_ = _loc4_.displayObject as ISharedDisplayObject) || _loc5_.redrawRequested)
                  {
                     _loc4_.validateDisplayList();
                     if(_loc5_)
                     {
                        _loc5_.redrawRequested = false;
                     }
                  }
               }
               _loc3_++;
            }
         }
         if(_loc1_)
         {
            _loc1_.redrawRequested = false;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         super.updateDisplayList(param1,param2);
         var _loc3_:ISharedDisplayObject = this;
         if(_loc3_.redrawRequested)
         {
            graphics.clear();
            mx_internal::drawBackground();
            if(this.isValidScaleGrid() && resizeMode == ResizeMode.SCALE)
            {
               graphics.lineStyle();
               graphics.beginFill(0,0);
               graphics.drawRect(0,0,1,1);
               graphics.drawRect(measuredWidth - 1,measuredHeight - 1,1,1);
               graphics.endFill();
            }
         }
         if(this.scaleGridChanged)
         {
            this.scaleGridChanged = false;
            if(this.isValidScaleGrid())
            {
               _loc4_ = !!mx_internal::_overlay ? 0 : 0;
               if(numChildren - _loc4_ > 0)
               {
                  throw new Error(resourceManager.getString("components","scaleGridGroupError"));
               }
               super.scale9Grid = new Rectangle(this.scaleGridLeft,this.scaleGridTop,this.scaleGridRight - this.scaleGridLeft,this.scaleGridBottom - this.scaleGridTop);
            }
            else
            {
               super.scale9Grid = null;
            }
         }
      }
      
      override public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.mxmlContentChanged || !param2)
         {
            return;
         }
         var _loc3_:int = this.numElements;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc5_ = this.getElementAt(_loc4_) as ISimpleStyleClient)
            {
               _loc5_.styleChanged(param1);
               if(_loc5_ is IStyleClient)
               {
                  IStyleClient(_loc5_).notifyStyleChangeInChildren(param1,param2);
               }
            }
            _loc4_++;
         }
         if(mx_internal::advanceStyleClientChildren != null)
         {
            for(_loc6_ in mx_internal::advanceStyleClientChildren)
            {
               if(_loc7_ = _loc6_ as IAdvancedStyleClient)
               {
                  _loc7_.styleChanged(param1);
               }
            }
         }
      }
      
      override public function regenerateStyleCache(param1:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         mx_internal::initProtoChain();
         var _loc2_:int = this.numElements;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.getElementAt(_loc3_)) is IStyleClient)
            {
               if(IStyleClient(_loc4_).inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED)
               {
                  IStyleClient(_loc4_).regenerateStyleCache(param1);
               }
            }
            else if(_loc4_ is IUITextField)
            {
               if(IUITextField(_loc4_).inheritingStyles)
               {
                  StyleProtoChain.initTextField(IUITextField(_loc4_));
               }
            }
            _loc3_++;
         }
         if(mx_internal::advanceStyleClientChildren != null)
         {
            for(_loc5_ in mx_internal::advanceStyleClientChildren)
            {
               if((Boolean(_loc6_ = _loc5_ as IAdvancedStyleClient)) && _loc6_.inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED)
               {
                  _loc6_.regenerateStyleCache(param1);
               }
            }
         }
      }
      
      override public function get numElements() : int
      {
         if(this._mxmlContent == null)
         {
            return 0;
         }
         return this._mxmlContent.length;
      }
      
      override public function getElementAt(param1:int) : IVisualElement
      {
         this.checkForRangeError(param1);
         return this._mxmlContent[param1];
      }
      
      private function checkForRangeError(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = this._mxmlContent == null ? -1 : this._mxmlContent.length - 1;
         if(param2)
         {
            _loc3_++;
         }
         if(param1 < 0 || param1 > _loc3_)
         {
            throw new RangeError(resourceManager.getString("components","indexOutOfRange",[param1]));
         }
      }
      
      private function isAIMBlendMode(param1:String) : Boolean
      {
         if(param1 == "colordodge" || param1 == "colorburn" || param1 == "exclusion" || param1 == "softlight" || param1 == "hue" || param1 == "saturation" || param1 == "color" || param1 == "luminosity")
         {
            return true;
         }
         return false;
      }
      
      public function addElement(param1:IVisualElement) : IVisualElement
      {
         var _loc2_:int = this.numElements;
         if(param1.parent == this)
         {
            _loc2_ = this.numElements - 1;
         }
         return this.addElementAt(param1,_loc2_);
      }
      
      public function addElementAt(param1:IVisualElement, param2:int) : IVisualElement
      {
         if(param1 == this)
         {
            throw new ArgumentError(resourceManager.getString("components","cannotAddYourselfAsYourChild"));
         }
         this.checkForRangeError(param2,true);
         var _loc3_:DisplayObject = param1.parent;
         if(_loc3_ == this)
         {
            this.setElementIndex(param1,param2);
            return param1;
         }
         if(_loc3_ is IVisualElementContainer)
         {
            IVisualElementContainer(_loc3_).removeElement(param1);
         }
         if(this._mxmlContent == null)
         {
            this._mxmlContent = [];
         }
         this._mxmlContent.splice(param2,0,param1);
         if(!this.mxmlContentChanged)
         {
            this.mx_internal::elementAdded(param1,param2);
         }
         this.scaleGridChanged = true;
         return param1;
      }
      
      public function removeElement(param1:IVisualElement) : IVisualElement
      {
         return this.removeElementAt(this.getElementIndex(param1));
      }
      
      public function removeElementAt(param1:int) : IVisualElement
      {
         this.checkForRangeError(param1);
         var _loc2_:IVisualElement = this._mxmlContent[param1];
         if(!this.mxmlContentChanged)
         {
            this.mx_internal::elementRemoved(_loc2_,param1);
         }
         this._mxmlContent.splice(param1,1);
         return _loc2_;
      }
      
      public function removeAllElements() : void
      {
         var _loc1_:int = this.numElements - 1;
         while(_loc1_ >= 0)
         {
            this.removeElementAt(_loc1_);
            _loc1_--;
         }
      }
      
      override public function getElementIndex(param1:IVisualElement) : int
      {
         var _loc2_:int = !!this._mxmlContent ? this._mxmlContent.indexOf(param1) : -1;
         if(_loc2_ == -1)
         {
            throw ArgumentError(resourceManager.getString("components","elementNotFoundInGroup",[param1]));
         }
         return _loc2_;
      }
      
      public function setElementIndex(param1:IVisualElement, param2:int) : void
      {
         this.checkForRangeError(param2);
         if(this.getElementIndex(param1) == param2)
         {
            return;
         }
         this.removeElement(param1);
         this.addElementAt(param1,param2);
      }
      
      public function swapElements(param1:IVisualElement, param2:IVisualElement) : void
      {
         this.swapElementsAt(this.getElementIndex(param1),this.getElementIndex(param2));
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         this.checkForRangeError(param1);
         this.checkForRangeError(param2);
         if(param1 > param2)
         {
            _loc5_ = param2;
            param2 = param1;
            param1 = _loc5_;
         }
         else if(param1 == param2)
         {
            return;
         }
         var _loc3_:IVisualElement = this._mxmlContent[param1];
         var _loc4_:IVisualElement = this._mxmlContent[param2];
         if(!this.mxmlContentChanged)
         {
            this.mx_internal::elementRemoved(_loc3_,param1,false);
            this.mx_internal::elementRemoved(_loc4_,param2,false);
         }
         this._mxmlContent.splice(param2,1);
         this._mxmlContent.splice(param1,1);
         this._mxmlContent.splice(param1,0,_loc4_);
         this._mxmlContent.splice(param2,0,_loc3_);
         if(!this.mxmlContentChanged)
         {
            this.mx_internal::elementAdded(_loc4_,param1,false);
            this.mx_internal::elementAdded(_loc3_,param2,false);
         }
      }
      
      override public function invalidateLayering() : void
      {
         if(this.layeringMode == ITEM_ORDERED_LAYERING)
         {
            this.layeringMode = SPARSE_LAYERING;
         }
         this.invalidateDisplayObjectOrdering();
      }
      
      mx_internal function elementAdded(param1:IVisualElement, param2:int, param3:Boolean = true) : void
      {
         if(layout)
         {
            layout.elementAdded(param2);
         }
         if(param1.depth != 0)
         {
            this.invalidateLayering();
         }
         if(param1 is IFlexModule && IFlexModule(param1).moduleFactory == null)
         {
            if(moduleFactory != null)
            {
               IFlexModule(param1).moduleFactory = moduleFactory;
            }
            else if(document is IFlexModule && false)
            {
               IFlexModule(param1).moduleFactory = document.moduleFactory;
            }
            else if(parent is IFlexModule && IFlexModule(param1).moduleFactory != null)
            {
               IFlexModule(param1).moduleFactory = IFlexModule(parent).moduleFactory;
            }
         }
         if(param1 is IFontContextComponent && !(param1 is UIComponent) && IFontContextComponent(param1).fontContext == null)
         {
            IFontContextComponent(param1).fontContext = moduleFactory;
         }
         if(param1 is IGraphicElement)
         {
            ++this.numGraphicElements;
            this.mx_internal::addingGraphicElementChild(param1 as IGraphicElement);
            this.invalidateDisplayObjectOrdering();
         }
         else if(this.invalidateDisplayObjectOrdering())
         {
            this.addDisplayObjectToDisplayList(DisplayObject(param1));
         }
         else
         {
            this.addDisplayObjectToDisplayList(DisplayObject(param1),param2);
         }
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_ADD))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_ADD,false,false,param1,param2));
            }
            if(param1 is IUIComponent && Boolean(param1.hasEventListener(FlexEvent.ADD)))
            {
               param1.dispatchEvent(new FlexEvent(FlexEvent.ADD));
            }
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      mx_internal function elementRemoved(param1:IVisualElement, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:DisplayObject = param1 as DisplayObject;
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_REMOVE))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_REMOVE,false,false,param1,param2));
            }
            if(param1 is IUIComponent && Boolean(param1.hasEventListener(FlexEvent.REMOVE)))
            {
               param1.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
            }
         }
         if(Boolean(param1) && param1 is IGraphicElement)
         {
            --this.numGraphicElements;
            this.mx_internal::removingGraphicElementChild(param1 as IGraphicElement);
         }
         else if(Boolean(_loc4_) && _loc4_.parent == this)
         {
            super.removeChild(_loc4_);
         }
         this.invalidateDisplayObjectOrdering();
         invalidateSize();
         invalidateDisplayList();
         if(layout)
         {
            layout.elementRemoved(param2);
         }
      }
      
      mx_internal function addingGraphicElementChild(param1:IGraphicElement) : void
      {
         if(Boolean(param1.displayObject) && param1.displayObjectSharingMode == DisplayObjectSharingMode.USES_SHARED_OBJECT)
         {
            this.invalidateGraphicElementDisplayList(param1);
         }
         param1.parentChanged(this);
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).regenerateStyleCache(true);
         }
         if(param1 is ISimpleStyleClient)
         {
            ISimpleStyleClient(param1).styleChanged(null);
         }
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).notifyStyleChangeInChildren(null,true);
         }
      }
      
      mx_internal function removingGraphicElementChild(param1:IGraphicElement) : void
      {
         this.mx_internal::discardDisplayObject(param1);
         param1.parentChanged(null);
      }
      
      mx_internal function discardDisplayObject(param1:IGraphicElement) : void
      {
         var _loc2_:DisplayObject = param1.displayObject;
         if(!_loc2_)
         {
            return;
         }
         if(param1.displayObjectSharingMode != DisplayObjectSharingMode.USES_SHARED_OBJECT && _loc2_.parent == this)
         {
            super.removeChild(_loc2_);
            this.invalidateDisplayObjectOrdering();
         }
         else if(_loc2_ is ISharedDisplayObject)
         {
            ISharedDisplayObject(_loc2_).redrawRequested = true;
            super.mx_internal::$invalidateDisplayList();
         }
      }
      
      private function get canShareDisplayObject() : Boolean
      {
         if(scrollRect)
         {
            return false;
         }
         return (this._blendMode == "normal" || this._blendMode == "auto" && (alpha == 0 || alpha == 1)) && this.layeringMode == ITEM_ORDERED_LAYERING;
      }
      
      private function invalidateDisplayObjectOrdering() : Boolean
      {
         if(this.layeringMode == SPARSE_LAYERING || this.numGraphicElements > 0)
         {
            this.needsDisplayObjectAssignment = true;
            invalidateProperties();
            return true;
         }
         return false;
      }
      
      private function assignDisplayObjects() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc9_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         if(this.canShareDisplayObject)
         {
            _loc5_ = this;
         }
         var _loc6_:int = this.numElements;
         var _loc7_:int = 0;
         for(; _loc7_ < _loc6_; _loc7_++)
         {
            _loc8_ = this.getElementAt(_loc7_);
            if(this.layeringMode != ITEM_ORDERED_LAYERING)
            {
               if((_loc9_ = _loc8_.depth) != 0)
               {
                  if(_loc9_ > 0)
                  {
                     if(_loc1_ == null)
                     {
                        _loc1_ = new Vector.<IVisualElement>();
                     }
                     _loc1_.push(_loc8_);
                  }
                  else
                  {
                     if(_loc2_ == null)
                     {
                        _loc2_ = new Vector.<IVisualElement>();
                     }
                     _loc2_.push(_loc8_);
                  }
                  continue;
               }
            }
            _loc4_ = this.assignDisplayObjectTo(_loc8_,_loc5_,_loc4_);
            _loc5_ = _loc8_;
         }
         if(_loc1_ != null)
         {
            _loc3_ = true;
            GroupBase.mx_internal::sortOnLayer(_loc1_);
            _loc6_ = _loc1_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = this.assignDisplayObjectTo(_loc1_[_loc7_],null,_loc4_);
               _loc7_++;
            }
         }
         if(_loc2_ != null)
         {
            _loc3_ = true;
            _loc4_ = 0;
            GroupBase.mx_internal::sortOnLayer(_loc2_);
            _loc6_ = _loc2_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = this.assignDisplayObjectTo(_loc2_[_loc7_],null,_loc4_);
               _loc7_++;
            }
         }
         if(_loc3_ == false)
         {
            this.layeringMode = ITEM_ORDERED_LAYERING;
         }
         super.mx_internal::$invalidateDisplayList();
      }
      
      private function assignDisplayObjectTo(param1:IVisualElement, param2:IVisualElement, param3:int) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = false;
         var _loc9_:* = null;
         if(param1 is DisplayObject)
         {
            super.setChildIndex(param1 as DisplayObject,param3++);
         }
         else if(param1 is IGraphicElement)
         {
            _loc4_ = IGraphicElement(param1);
            _loc5_ = param2 as IGraphicElement;
            _loc6_ = _loc4_.displayObject;
            _loc7_ = _loc4_.displayObjectSharingMode;
            if(_loc5_ && _loc5_.canShareWithNext(_loc4_) && _loc4_.canShareWithPrevious(_loc5_) && _loc4_.setSharedDisplayObject(_loc5_.displayObject))
            {
               if(_loc5_.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
               {
                  _loc5_.displayObjectSharingMode = DisplayObjectSharingMode.OWNS_SHARED_OBJECT;
               }
               _loc4_.displayObjectSharingMode = DisplayObjectSharingMode.USES_SHARED_OBJECT;
            }
            else if(param2 == this && _loc4_.setSharedDisplayObject(this))
            {
               _loc4_.displayObjectSharingMode = DisplayObjectSharingMode.USES_SHARED_OBJECT;
            }
            else
            {
               _loc8_ = _loc7_ != DisplayObjectSharingMode.USES_SHARED_OBJECT;
               _loc9_ = _loc6_;
               if(!_loc8_ || !_loc9_)
               {
                  _loc9_ = _loc4_.createDisplayObject();
               }
               if(_loc9_)
               {
                  this.addDisplayObjectToDisplayList(_loc9_,param3++);
               }
               _loc4_.displayObjectSharingMode = DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT;
            }
            this.invalidateAfterAssignment(_loc4_,_loc7_,_loc6_);
         }
         return param3;
      }
      
      private function invalidateAfterAssignment(param1:IGraphicElement, param2:String, param3:DisplayObject) : void
      {
         var _loc4_:DisplayObject = param1.displayObject;
         var _loc5_:String = param1.displayObjectSharingMode;
         if(param3 == _loc4_ && _loc5_ == param2)
         {
            return;
         }
         if(_loc4_ is ISharedDisplayObject)
         {
            ISharedDisplayObject(_loc4_).redrawRequested = true;
         }
         if(param3 is ISharedDisplayObject)
         {
            ISharedDisplayObject(param3).redrawRequested = true;
         }
         if(param3 && param3.parent == this && param3 != _loc4_ && param2 != DisplayObjectSharingMode.USES_SHARED_OBJECT)
         {
            super.removeChild(param3);
         }
      }
      
      private function addDisplayObjectToDisplayList(param1:DisplayObject, param2:int = -1) : void
      {
         var _loc3_:int = !!mx_internal::_overlay ? 0 : 0;
         if(param1.parent == this)
         {
            super.setChildIndex(param1,param2 != -1 ? param2 : super.numChildren - 1 - _loc3_);
         }
         else
         {
            super.addChildAt(param1,param2 != -1 ? param2 : super.numChildren - _loc3_);
         }
      }
      
      public function invalidateGraphicElementDisplayList(param1:IGraphicElement) : void
      {
         if(param1.displayObject is ISharedDisplayObject)
         {
            ISharedDisplayObject(param1.displayObject).redrawRequested = true;
         }
         super.mx_internal::$invalidateDisplayList();
      }
      
      public function invalidateGraphicElementProperties(param1:IGraphicElement) : void
      {
         invalidateProperties();
      }
      
      public function invalidateGraphicElementSize(param1:IGraphicElement) : void
      {
         super.mx_internal::$invalidateSize();
      }
      
      public function invalidateGraphicElementSharing(param1:IGraphicElement) : void
      {
         this.invalidateDisplayObjectOrdering();
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error(resourceManager.getString("components","addChildError"));
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error(resourceManager.getString("components","addChildAtError"));
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error(resourceManager.getString("components","removeChildError"));
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error(resourceManager.getString("components","removeChildAtError"));
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error(resourceManager.getString("components","setChildIndexError"));
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         throw new Error(resourceManager.getString("components","swapChildrenError"));
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         throw new Error(resourceManager.getString("components","swapChildrenAtError"));
      }
      
      override public function set mouseEnabledWhereTransparent(param1:Boolean) : void
      {
         if(param1 == mouseEnabledWhereTransparent)
         {
            return;
         }
         super.mouseEnabledWhereTransparent = param1;
         this.redrawRequested = true;
      }
      
      public function get redrawRequested() : Boolean
      {
         return this._redrawRequested;
      }
      
      public function set redrawRequested(param1:Boolean) : void
      {
         this._redrawRequested = param1;
      }
   }
}
