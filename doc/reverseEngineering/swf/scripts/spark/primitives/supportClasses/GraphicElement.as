package spark.primitives.supportClasses
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Transform;
   import flash.geom.Vector3D;
   import mx.core.AdvancedLayoutFeatures;
   import mx.core.DesignLayer;
   import mx.core.IInvalidating;
   import mx.core.ILayoutDirectionElement;
   import mx.core.ILayoutElement;
   import mx.core.IMXMLObject;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.core.LayoutDirection;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.BaseFilter;
   import mx.filters.IBitmapFilter;
   import mx.geom.Transform;
   import mx.geom.TransformOffsets;
   import mx.graphics.shaderClasses.ColorBurnShader;
   import mx.graphics.shaderClasses.ColorDodgeShader;
   import mx.graphics.shaderClasses.ColorShader;
   import mx.graphics.shaderClasses.ExclusionShader;
   import mx.graphics.shaderClasses.HueShader;
   import mx.graphics.shaderClasses.LuminosityShader;
   import mx.graphics.shaderClasses.SaturationShader;
   import mx.graphics.shaderClasses.SoftLightShader;
   import mx.managers.ILayoutManagerClient;
   import mx.utils.MatrixUtil;
   import spark.components.supportClasses.InvalidatingSprite;
   import spark.core.DisplayObjectSharingMode;
   import spark.core.IGraphicElement;
   import spark.core.IGraphicElementContainer;
   import spark.utils.FTETextUtil;
   import spark.utils.MaskUtil;
   
   public class GraphicElement extends EventDispatcher implements IGraphicElement, IInvalidating, ILayoutElement, IVisualElement, IMXMLObject
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const DEFAULT_MAX_WIDTH:Number = 10000;
      
      private static const DEFAULT_MAX_HEIGHT:Number = 10000;
      
      private static const DEFAULT_MIN_WIDTH:Number = 0;
      
      private static const DEFAULT_MIN_HEIGHT:Number = 0;
      
      mx_internal static var _strokeExtents:Rectangle = new Rectangle();
       
      
      private var displayObjectChanged:Boolean;
      
      private var _colorTransform:ColorTransform;
      
      private var colorTransformChanged:Boolean;
      
      private var _drawnDisplayObject:InvalidatingSprite;
      
      mx_internal var invalidatePropertiesFlag:Boolean = false;
      
      mx_internal var invalidateSizeFlag:Boolean = false;
      
      mx_internal var invalidateDisplayListFlag:Boolean = false;
      
      protected var layoutFeatures:AdvancedLayoutFeatures;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _alpha:Number = 1;
      
      private var _effectiveAlpha:Number = 1;
      
      private var alphaChanged:Boolean = false;
      
      private var _alwaysCreateDisplayObject:Boolean;
      
      private var _baseline:Object;
      
      private var _blendMode:String = "auto";
      
      private var blendModeChanged:Boolean;
      
      private var blendShaderChanged:Boolean;
      
      private var blendModeExplicitlySet:Boolean = false;
      
      private var _bottom:Object;
      
      private var _owner:DisplayObjectContainer;
      
      private var _designLayer:DesignLayer;
      
      private var _parent:IGraphicElementContainer;
      
      private var _explicitHeight:Number;
      
      private var _explicitWidth:Number;
      
      private var _filters:Array;
      
      private var filtersChanged:Boolean;
      
      private var _clonedFilters:Array;
      
      mx_internal var _height:Number = 0;
      
      private var _horizontalCenter:Object;
      
      private var _id:String;
      
      private var _left:Object;
      
      private var _mask:DisplayObject;
      
      private var maskChanged:Boolean;
      
      private var _maskType:String = "clip";
      
      private var maskTypeChanged:Boolean;
      
      private var _luminosityInvert:Boolean = false;
      
      private var luminositySettingsChanged:Boolean;
      
      private var _luminosityClip:Boolean = false;
      
      private var _maxHeight:Number;
      
      mx_internal var _maxWidth:Number;
      
      private var _measuredHeight:Number = 0;
      
      private var _measuredWidth:Number = 0;
      
      private var _measuredX:Number = 0;
      
      private var _measuredY:Number = 0;
      
      private var _minHeight:Number;
      
      private var _minWidth:Number;
      
      private var _percentHeight:Number;
      
      private var _percentWidth:Number;
      
      private var _right:Object;
      
      private var _top:Object;
      
      private var _transform:flash.geom.Transform;
      
      private var _verticalCenter:Object;
      
      mx_internal var _width:Number = 0;
      
      private var _visible:Boolean = true;
      
      protected var _effectiveVisibility:Boolean = true;
      
      private var visibleChanged:Boolean;
      
      private var _displayObject:DisplayObject;
      
      private var _includeInLayout:Boolean = true;
      
      private var _displayObjectSharingMode:String;
      
      private var _layoutDirection:String = null;
      
      public function GraphicElement()
      {
         this._filters = [];
         super();
      }
      
      public function get postLayoutTransformOffsets() : TransformOffsets
      {
         return this.layoutFeatures == null ? null : this.layoutFeatures.postLayoutTransformOffsets;
      }
      
      public function set postLayoutTransformOffsets(param1:TransformOffsets) : void
      {
         if(param1 != null)
         {
            this.mx_internal::allocateLayoutFeatures();
         }
         if(this.layoutFeatures.postLayoutTransformOffsets != null)
         {
            this.layoutFeatures.postLayoutTransformOffsets.removeEventListener(Event.CHANGE,this.transformOffsetsChangedHandler);
         }
         this.layoutFeatures.postLayoutTransformOffsets = param1;
         if(this.layoutFeatures.postLayoutTransformOffsets != null)
         {
            this.layoutFeatures.postLayoutTransformOffsets.addEventListener(Event.CHANGE,this.transformOffsetsChangedHandler);
         }
      }
      
      mx_internal function allocateLayoutFeatures() : void
      {
         if(this.layoutFeatures != null)
         {
            return;
         }
         this.layoutFeatures = new AdvancedLayoutFeatures();
         this.layoutFeatures.layoutX = this._x;
         this.layoutFeatures.layoutY = this._y;
         this.layoutFeatures.layoutWidth = this.mx_internal::_width;
      }
      
      private function invalidateTransform(param1:Boolean = true, param2:Boolean = true) : void
      {
         if(param1)
         {
            this.invalidateDisplayObjectSharing();
         }
         if(this.layoutFeatures != null)
         {
            this.layoutFeatures.updatePending = true;
         }
         if(this.displayObjectSharingMode != DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
         {
            this.invalidateDisplayList();
         }
         else
         {
            this.invalidateProperties();
         }
         if(param2)
         {
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      private function transformOffsetsChangedHandler(param1:Event) : void
      {
         this.invalidateTransform();
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(this._alpha == param1)
         {
            return;
         }
         var _loc2_:Boolean = this.needsDisplayObject;
         this._alpha = param1;
         if(this.designLayer)
         {
            param1 *= this.designLayer.effectiveAlpha;
         }
         if(this._blendMode == "auto")
         {
            if(param1 > 0 && param1 < 1 && (this._effectiveAlpha == 0 || this._effectiveAlpha == 1) || (param1 == 0 || param1 == 1) && (this._effectiveAlpha > 0 && this._effectiveAlpha < 1))
            {
               this.blendModeChanged = true;
            }
         }
         this._effectiveAlpha = param1;
         var _loc3_:mx.geom.Transform = this._transform as mx.geom.Transform;
         if(_loc3_)
         {
            _loc3_.mx_internal::applyColorTransformAlpha = false;
         }
         if(_loc2_ != this.needsDisplayObject)
         {
            this.invalidateDisplayObjectSharing();
         }
         this.alphaChanged = true;
         this.invalidateProperties();
      }
      
      public function get alwaysCreateDisplayObject() : Boolean
      {
         return this._alwaysCreateDisplayObject;
      }
      
      public function set alwaysCreateDisplayObject(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         if(param1 != this._alwaysCreateDisplayObject)
         {
            _loc2_ = this.needsDisplayObject;
            this._alwaysCreateDisplayObject = param1;
            if(_loc2_ != this.needsDisplayObject)
            {
               this.invalidateDisplayObjectSharing();
            }
         }
      }
      
      public function get baseline() : Object
      {
         return this._baseline;
      }
      
      public function set baseline(param1:Object) : void
      {
         if(this._baseline == param1)
         {
            return;
         }
         this._baseline = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get baselinePosition() : Number
      {
         var _loc1_:UIComponent = this.parent as UIComponent;
         if(_loc1_)
         {
            if(!_loc1_.mx_internal::validateBaselinePosition())
            {
               return NaN;
            }
            return FTETextUtil.calculateFontBaseline(_loc1_,this.height,_loc1_.moduleFactory);
         }
         return 0;
      }
      
      public function get blendMode() : String
      {
         return this._blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(param1 == this._blendMode)
         {
            return;
         }
         var _loc2_:String = this._blendMode;
         this._blendMode = param1;
         this.blendModeChanged = true;
         if(this.isAIMBlendMode(param1))
         {
            this.blendShaderChanged = true;
         }
         if((_loc2_ == BlendMode.NORMAL || param1 == BlendMode.NORMAL) && !(_loc2_ == BlendMode.NORMAL && param1 == BlendMode.NORMAL))
         {
            this.invalidateDisplayObjectSharing();
         }
         this.invalidateProperties();
      }
      
      public function get bottom() : Object
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Object) : void
      {
         if(this._bottom == param1)
         {
            return;
         }
         this._bottom = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return !!this._owner ? this._owner : this.parent;
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
         this._owner = param1;
      }
      
      public function get designLayer() : DesignLayer
      {
         return this._designLayer;
      }
      
      public function set designLayer(param1:DesignLayer) : void
      {
         if(this._designLayer)
         {
            this._designLayer.removeEventListener("layerPropertyChange",this.layer_PropertyChange,false);
         }
         this._designLayer = param1;
         if(this._designLayer)
         {
            this._designLayer.addEventListener("layerPropertyChange",this.layer_PropertyChange,false,0,true);
         }
         this._effectiveAlpha = !!this._designLayer ? this._alpha * this._designLayer.effectiveAlpha : this._alpha;
         this._effectiveVisibility = !!this._designLayer ? this._visible && this._designLayer.effectiveVisibility : this._visible;
         this.alphaChanged = true;
         this.visibleChanged = true;
         this.invalidateProperties();
      }
      
      public function get parent() : DisplayObjectContainer
      {
         return this._parent as DisplayObjectContainer;
      }
      
      public function parentChanged(param1:IGraphicElementContainer) : void
      {
         this._parent = param1;
         this.invalidateLayoutDirection();
         if(this.parent)
         {
            if(this.mx_internal::invalidatePropertiesFlag)
            {
               IGraphicElementContainer(this.parent).invalidateGraphicElementProperties(this);
            }
            if(this.mx_internal::invalidateSizeFlag)
            {
               IGraphicElementContainer(this.parent).invalidateGraphicElementSize(this);
            }
            if(this.mx_internal::invalidateDisplayListFlag)
            {
               IGraphicElementContainer(this.parent).invalidateGraphicElementDisplayList(this);
            }
         }
      }
      
      public function get explicitHeight() : Number
      {
         return this._explicitHeight;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         if(this._explicitHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            this.percentHeight = NaN;
         }
         this._explicitHeight = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get explicitMaxHeight() : Number
      {
         return this.maxHeight;
      }
      
      public function set explicitMaxHeight(param1:Number) : void
      {
         this.maxHeight = param1;
      }
      
      public function get explicitMaxWidth() : Number
      {
         return this.maxWidth;
      }
      
      public function set explicitMaxWidth(param1:Number) : void
      {
         this.maxWidth = param1;
      }
      
      public function get explicitMinHeight() : Number
      {
         return this.minHeight;
      }
      
      public function set explicitMinHeight(param1:Number) : void
      {
         this.minHeight = param1;
      }
      
      public function get explicitMinWidth() : Number
      {
         return this.minWidth;
      }
      
      public function set explicitMinWidth(param1:Number) : void
      {
         this.minWidth = param1;
      }
      
      public function get explicitWidth() : Number
      {
         return this._explicitWidth;
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         if(this._explicitWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            this.percentWidth = NaN;
         }
         this._explicitWidth = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get filters() : Array
      {
         return this._filters.slice();
      }
      
      public function set filters(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = !!this._filters ? this._filters.length : 0;
         var _loc4_:int = !!param1 ? param1.length : 0;
         if(_loc3_ == 0 && _loc4_ == 0)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(_loc5_ = this._filters[_loc2_] as IEventDispatcher)
            {
               _loc5_.removeEventListener(BaseFilter.CHANGE,this.filterChangedHandler);
            }
            _loc2_++;
         }
         var _loc6_:Boolean = this.needsDisplayObject;
         this._filters = param1;
         if(_loc6_ != this.needsDisplayObject)
         {
            this.invalidateDisplayObjectSharing();
         }
         this._clonedFilters = [];
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(param1[_loc2_] is IBitmapFilter)
            {
               if(_loc5_ = param1[_loc2_] as IEventDispatcher)
               {
                  _loc5_.addEventListener(BaseFilter.CHANGE,this.filterChangedHandler);
               }
               this._clonedFilters.push(IBitmapFilter(param1[_loc2_]).clone());
            }
            else
            {
               this._clonedFilters.push(param1[_loc2_]);
            }
            _loc2_++;
         }
         this.filtersChanged = true;
         this.invalidateProperties();
      }
      
      [Bindable("propertyChange")]
      public function get height() : Number
      {
         return this.mx_internal::_height;
      }
      
      public function set height(param1:Number) : void
      {
         this.explicitHeight = param1;
         if(this.mx_internal::_height == param1)
         {
            return;
         }
         var _loc2_:Number = this.mx_internal::_height;
         this.mx_internal::_height = param1;
         this.mx_internal::dispatchPropertyChangeEvent("height",_loc2_,param1);
         this.invalidateDisplayList();
      }
      
      public function get horizontalCenter() : Object
      {
         return this._horizontalCenter;
      }
      
      public function set horizontalCenter(param1:Object) : void
      {
         if(this._horizontalCenter == param1)
         {
            return;
         }
         this._horizontalCenter = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get left() : Object
      {
         return this._left;
      }
      
      public function set left(param1:Object) : void
      {
         if(this._left == param1)
         {
            return;
         }
         this._left = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get mask() : DisplayObject
      {
         return this._mask;
      }
      
      public function set mask(param1:DisplayObject) : void
      {
         if(this._mask == param1)
         {
            return;
         }
         var _loc2_:UIComponent = this._mask as UIComponent;
         var _loc3_:Boolean = this.needsDisplayObject;
         this._mask = param1;
         if(Boolean(_loc2_) && _loc2_.mx_internal::$parent === this.displayObject)
         {
            if(_loc2_.parent is UIComponent)
            {
               UIComponent(_loc2_.parent).mx_internal::childRemoved(_loc2_);
            }
            _loc2_.mx_internal::$parent.removeChild(_loc2_);
         }
         if(!this._mask || Boolean(this._mask.parent))
         {
            if(this.drawnDisplayObject)
            {
               this.drawnDisplayObject.mask = null;
            }
            if(this._drawnDisplayObject)
            {
               if(this._drawnDisplayObject.parent)
               {
                  this._drawnDisplayObject.parent.removeChild(this._drawnDisplayObject);
               }
               this._drawnDisplayObject = null;
            }
         }
         this.maskChanged = true;
         this.maskTypeChanged = true;
         if(_loc3_ != this.needsDisplayObject)
         {
            this.invalidateDisplayObjectSharing();
         }
         this.invalidateProperties();
         this.invalidateDisplayList();
      }
      
      public function get maskType() : String
      {
         return this._maskType;
      }
      
      public function set maskType(param1:String) : void
      {
         if(this._maskType == param1)
         {
            return;
         }
         this._maskType = param1;
         this.maskTypeChanged = true;
         this.invalidateProperties();
      }
      
      public function get luminosityInvert() : Boolean
      {
         return this._luminosityInvert;
      }
      
      public function set luminosityInvert(param1:Boolean) : void
      {
         if(this._luminosityInvert == param1)
         {
            return;
         }
         this._luminosityInvert = param1;
         this.luminositySettingsChanged = true;
      }
      
      public function get luminosityClip() : Boolean
      {
         return this._luminosityClip;
      }
      
      public function set luminosityClip(param1:Boolean) : void
      {
         if(this._luminosityClip == param1)
         {
            return;
         }
         this._luminosityClip = param1;
         this.luminositySettingsChanged = true;
      }
      
      public function get maxHeight() : Number
      {
         return !isNaN(this._maxHeight) ? this._maxHeight : DEFAULT_MAX_HEIGHT;
      }
      
      public function set maxHeight(param1:Number) : void
      {
         if(this._maxHeight == param1)
         {
            return;
         }
         this._maxHeight = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get maxWidth() : Number
      {
         return !isNaN(this.mx_internal::_maxWidth) ? this.mx_internal::_maxWidth : DEFAULT_MAX_WIDTH;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(this.mx_internal::_maxWidth == param1)
         {
            return;
         }
         this.mx_internal::_maxWidth = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get measuredHeight() : Number
      {
         return this._measuredHeight;
      }
      
      public function set measuredHeight(param1:Number) : void
      {
         this._measuredHeight = param1;
      }
      
      public function get measuredWidth() : Number
      {
         return this._measuredWidth;
      }
      
      public function set measuredWidth(param1:Number) : void
      {
         this._measuredWidth = param1;
      }
      
      public function get measuredX() : Number
      {
         return this._measuredX;
      }
      
      public function set measuredX(param1:Number) : void
      {
         this._measuredX = param1;
      }
      
      public function get measuredY() : Number
      {
         return this._measuredY;
      }
      
      public function set measuredY(param1:Number) : void
      {
         this._measuredY = param1;
      }
      
      public function get minHeight() : Number
      {
         return !isNaN(this._minHeight) ? this._minHeight : DEFAULT_MIN_HEIGHT;
      }
      
      public function set minHeight(param1:Number) : void
      {
         if(this._minHeight == param1)
         {
            return;
         }
         this._minHeight = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get minWidth() : Number
      {
         return !isNaN(this._minWidth) ? this._minWidth : DEFAULT_MIN_WIDTH;
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(this._minWidth == param1)
         {
            return;
         }
         this._minWidth = param1;
         this.invalidateSize();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get percentHeight() : Number
      {
         return this._percentHeight;
      }
      
      public function set percentHeight(param1:Number) : void
      {
         if(this._percentHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            this.explicitHeight = NaN;
         }
         this._percentHeight = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get percentWidth() : Number
      {
         return this._percentWidth;
      }
      
      public function set percentWidth(param1:Number) : void
      {
         if(this._percentWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            this.explicitWidth = NaN;
         }
         this._percentWidth = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get right() : Object
      {
         return this._right;
      }
      
      public function set right(param1:Object) : void
      {
         if(this._right == param1)
         {
            return;
         }
         this._right = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get rotationX() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.layoutRotationX;
      }
      
      public function set rotationX(param1:Number) : void
      {
         if(this.rotationX == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutRotationX = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get rotationY() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.layoutRotationY;
      }
      
      public function set rotationY(param1:Number) : void
      {
         if(this.rotationY == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutRotationY = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get rotationZ() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.layoutRotationZ;
      }
      
      public function set rotationZ(param1:Number) : void
      {
         if(this.rotationZ == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutRotationZ = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get rotation() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.layoutRotationZ;
      }
      
      public function set rotation(param1:Number) : void
      {
         this.rotationZ = param1;
      }
      
      public function get scaleX() : Number
      {
         return this.layoutFeatures == null ? 1 : this.layoutFeatures.layoutScaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this.scaleX == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutScaleX = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get scaleY() : Number
      {
         return this.layoutFeatures == null ? 1 : this.layoutFeatures.layoutScaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this.scaleY == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutScaleY = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get scaleZ() : Number
      {
         return this.layoutFeatures == null ? 1 : this.layoutFeatures.layoutScaleZ;
      }
      
      public function set scaleZ(param1:Number) : void
      {
         if(this.scaleZ == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutScaleZ = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get top() : Object
      {
         return this._top;
      }
      
      public function set top(param1:Object) : void
      {
         if(this._top == param1)
         {
            return;
         }
         this._top = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get transform() : flash.geom.Transform
      {
         if(!this._transform)
         {
            this.setTransform(new mx.geom.Transform());
         }
         return this._transform;
      }
      
      public function set transform(param1:flash.geom.Transform) : void
      {
         var _loc2_:* = Boolean(param1) && Boolean(param1.matrix) ? param1.matrix.clone() : null;
         var _loc3_:* = Boolean(param1) && Boolean(param1.matrix3D) ? param1.matrix3D.clone() : null;
         var _loc4_:ColorTransform = !!param1 ? param1.colorTransform : null;
         var _loc5_:mx.geom.Transform;
         if(_loc5_ = param1 as mx.geom.Transform)
         {
            if(!_loc5_.mx_internal::applyMatrix)
            {
               _loc2_ = null;
            }
            if(!_loc5_.mx_internal::applyMatrix3D)
            {
               _loc3_ = null;
            }
         }
         this.setTransform(param1);
         var _loc6_:Boolean = this.needsDisplayObject;
         if(this._transform)
         {
            this.mx_internal::allocateLayoutFeatures();
            if(_loc2_ != null)
            {
               this.layoutFeatures.layoutMatrix = _loc2_;
            }
            else if(_loc3_ != null)
            {
               this.layoutFeatures.layoutMatrix3D = _loc3_;
            }
         }
         this.applyColorTransform(_loc4_,Boolean(_loc5_) && _loc5_.mx_internal::applyColorTransformAlpha);
         this.invalidateTransform(_loc6_ != this.needsDisplayObject);
      }
      
      private function setTransform(param1:flash.geom.Transform) : void
      {
         var _loc2_:mx.geom.Transform = this._transform as mx.geom.Transform;
         if(_loc2_)
         {
            _loc2_.target = null;
         }
         var _loc3_:mx.geom.Transform = param1 as mx.geom.Transform;
         if(_loc3_)
         {
            _loc3_.target = this;
         }
         this._transform = param1;
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
         this.applyColorTransform(param1,true);
      }
      
      private function applyColorTransform(param1:ColorTransform, param2:Boolean) : void
      {
         var _loc3_:Boolean = false;
         if(this._colorTransform != param1)
         {
            _loc3_ = this.needsDisplayObject;
            this._colorTransform = new ColorTransform(param1.redMultiplier,param1.greenMultiplier,param1.blueMultiplier,param1.alphaMultiplier,param1.redOffset,param1.greenOffset,param1.blueOffset,param1.alphaOffset);
            if(param2)
            {
               this._alpha = param1.alphaMultiplier;
               this._effectiveAlpha = this._alpha;
            }
            if(Boolean(this.displayObject) && this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
            {
               this.displayObject.transform.colorTransform = this._colorTransform;
            }
            else
            {
               this.colorTransformChanged = true;
               this.invalidateProperties();
               if(_loc3_ != this.needsDisplayObject)
               {
                  this.invalidateDisplayObjectSharing();
               }
            }
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
      
      public function transformAround(param1:Vector3D, param2:Vector3D = null, param3:Vector3D = null, param4:Vector3D = null, param5:Vector3D = null, param6:Vector3D = null, param7:Vector3D = null, param8:Boolean = true) : void
      {
         this.mx_internal::allocateLayoutFeatures();
         var _loc9_:Boolean = this.needsDisplayObject;
         var _loc10_:Number = this.layoutFeatures.layoutX;
         var _loc11_:Number = this.layoutFeatures.layoutY;
         var _loc12_:Number = this.layoutFeatures.layoutZ;
         this.layoutFeatures.transformAround(param1,param2,param3,param4,param5,param6,param7);
         this.invalidateTransform(_loc9_ != this.needsDisplayObject,param8);
         if(_loc10_ != this.layoutFeatures.layoutX)
         {
            this.mx_internal::dispatchPropertyChangeEvent("x",_loc10_,this.layoutFeatures.layoutX);
         }
         if(_loc11_ != this.layoutFeatures.layoutY)
         {
            this.mx_internal::dispatchPropertyChangeEvent("y",_loc11_,this.layoutFeatures.layoutY);
         }
         if(_loc12_ != this.layoutFeatures.layoutZ)
         {
            this.mx_internal::dispatchPropertyChangeEvent("z",_loc12_,this.layoutFeatures.layoutZ);
         }
      }
      
      public function transformPointToParent(param1:Vector3D, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc4_:* = null;
         if(this.layoutFeatures != null)
         {
            this.layoutFeatures.transformPointToParent(true,param1,param2,param3);
         }
         else
         {
            _loc4_ = new Point();
            if(param1)
            {
               _loc4_.x = param1.x;
               _loc4_.y = param1.y;
            }
            if(param2 != null)
            {
               param2.x = _loc4_.x + this._x;
               param2.y = _loc4_.y + this._y;
               param2.z = 0;
            }
            if(param3 != null)
            {
               param3.x = _loc4_.x + this._x;
               param3.y = _loc4_.y + this._y;
               param3.z = 0;
            }
         }
      }
      
      public function get transformX() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.transformX;
      }
      
      public function set transformX(param1:Number) : void
      {
         if(this.transformX == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         this.layoutFeatures.transformX = param1;
         this.invalidateTransform(false);
      }
      
      public function get transformY() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.transformY;
      }
      
      public function set transformY(param1:Number) : void
      {
         if(this.transformY == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         this.layoutFeatures.transformY = param1;
         this.invalidateTransform(false);
      }
      
      public function get transformZ() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.transformZ;
      }
      
      public function set transformZ(param1:Number) : void
      {
         if(this.transformZ == param1)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         var _loc2_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.transformZ = param1;
         this.invalidateTransform(_loc2_ != this.needsDisplayObject);
      }
      
      public function get verticalCenter() : Object
      {
         return this._verticalCenter;
      }
      
      public function set verticalCenter(param1:Object) : void
      {
         if(this._verticalCenter == param1)
         {
            return;
         }
         this._verticalCenter = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      [Bindable("propertyChange")]
      public function get width() : Number
      {
         return this.mx_internal::_width;
      }
      
      public function set width(param1:Number) : void
      {
         this.explicitWidth = param1;
         if(this.mx_internal::_width == param1)
         {
            return;
         }
         var _loc2_:Number = this.mx_internal::_width;
         this.mx_internal::_width = param1;
         if(this.layoutFeatures)
         {
            this.layoutFeatures.layoutWidth = param1;
            this.invalidateTransform();
         }
         this.mx_internal::dispatchPropertyChangeEvent("width",_loc2_,param1);
         this.invalidateDisplayList();
      }
      
      public function get depth() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.depth;
      }
      
      public function set depth(param1:Number) : void
      {
         if(param1 == this.depth)
         {
            return;
         }
         this.mx_internal::allocateLayoutFeatures();
         this.layoutFeatures.depth = param1;
         if(this._parent is UIComponent)
         {
            UIComponent(this._parent).invalidateLayering();
         }
         this.invalidateProperties();
      }
      
      [Bindable("propertyChange")]
      public function get x() : Number
      {
         return this.layoutFeatures == null ? this._x : this.layoutFeatures.layoutX;
      }
      
      public function set x(param1:Number) : void
      {
         var _loc2_:Number = this.x;
         if(_loc2_ == param1)
         {
            return;
         }
         if(this.layoutFeatures != null)
         {
            this.layoutFeatures.layoutX = param1;
         }
         else
         {
            this._x = param1;
         }
         this.mx_internal::dispatchPropertyChangeEvent("x",_loc2_,param1);
         this.invalidateTransform(false);
      }
      
      [Bindable("propertyChange")]
      public function get y() : Number
      {
         return this.layoutFeatures == null ? this._y : this.layoutFeatures.layoutY;
      }
      
      public function set y(param1:Number) : void
      {
         var _loc2_:Number = this.y;
         if(_loc2_ == param1)
         {
            return;
         }
         if(this.layoutFeatures != null)
         {
            this.layoutFeatures.layoutY = param1;
         }
         else
         {
            this._y = param1;
         }
         this.mx_internal::dispatchPropertyChangeEvent("y",_loc2_,param1);
         this.invalidateTransform(false);
      }
      
      [Bindable("propertyChange")]
      public function get z() : Number
      {
         return this.layoutFeatures == null ? 0 : this.layoutFeatures.layoutZ;
      }
      
      public function set z(param1:Number) : void
      {
         if(this.z == param1)
         {
            return;
         }
         var _loc2_:Number = this.z;
         this.mx_internal::allocateLayoutFeatures();
         var _loc3_:Boolean = this.needsDisplayObject;
         this.layoutFeatures.layoutZ = param1;
         this.invalidateTransform(_loc3_ != this.needsDisplayObject);
         this.mx_internal::dispatchPropertyChangeEvent("z",_loc2_,param1);
      }
      
      public function get visible() : Boolean
      {
         return this._visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this._visible = param1;
         if(Boolean(this.designLayer) && !this.designLayer.effectiveVisibility)
         {
            param1 = false;
         }
         if(this._effectiveVisibility == param1)
         {
            return;
         }
         this._effectiveVisibility = param1;
         this.visibleChanged = true;
         this.invalidateProperties();
      }
      
      [Bindable("propertyChange")]
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      protected function setDisplayObject(param1:DisplayObject) : void
      {
         if(this._displayObject == param1)
         {
            return;
         }
         var _loc2_:DisplayObject = this._displayObject;
         if(Boolean(_loc2_) && this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
         {
            _loc2_.transform.matrix3D = null;
         }
         this._displayObject = param1;
         this.mx_internal::dispatchPropertyChangeEvent("displayObject",_loc2_,param1);
         this.displayObjectChanged = true;
         this.invalidateProperties();
      }
      
      protected function get drawX() : Number
      {
         if(this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
         {
            return 0;
         }
         if(this.layoutFeatures != null && this.layoutFeatures.postLayoutTransformOffsets != null)
         {
            return this.x + this.layoutFeatures.postLayoutTransformOffsets.x;
         }
         return this.x;
      }
      
      protected function get drawY() : Number
      {
         if(this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
         {
            return 0;
         }
         if(this.layoutFeatures != null && this.layoutFeatures.postLayoutTransformOffsets != null)
         {
            return this.y + this.layoutFeatures.postLayoutTransformOffsets.y;
         }
         return this.y;
      }
      
      protected function get hasComplexLayoutMatrix() : Boolean
      {
         return this.layoutFeatures == null ? false : !MatrixUtil.isDeltaIdentity(this.layoutFeatures.layoutMatrix);
      }
      
      public function get includeInLayout() : Boolean
      {
         return this._includeInLayout;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         if(this._includeInLayout == param1)
         {
            return;
         }
         this._includeInLayout = true;
         this.invalidateParentSizeAndDisplayList();
         this._includeInLayout = param1;
      }
      
      public function set displayObjectSharingMode(param1:String) : void
      {
         if(param1 == this._displayObjectSharingMode)
         {
            return;
         }
         if(param1 != DisplayObjectSharingMode.USES_SHARED_OBJECT || this._displayObjectSharingMode != DisplayObjectSharingMode.USES_SHARED_OBJECT)
         {
            this.displayObjectChanged = true;
            this.invalidateProperties();
         }
         this._displayObjectSharingMode = param1;
      }
      
      public function get displayObjectSharingMode() : String
      {
         return this._displayObjectSharingMode;
      }
      
      public function get layoutDirection() : String
      {
         if(this._layoutDirection != null)
         {
            return this._layoutDirection;
         }
         var _loc1_:ILayoutDirectionElement = this.parent as ILayoutDirectionElement;
         return !!_loc1_ ? _loc1_.layoutDirection : LayoutDirection.LTR;
      }
      
      public function set layoutDirection(param1:String) : void
      {
         if(this._layoutDirection == param1)
         {
            return;
         }
         this._layoutDirection = param1;
         this.invalidateLayoutDirection();
      }
      
      public function invalidateLayoutDirection() : void
      {
         var _loc3_:Boolean = false;
         var _loc1_:ILayoutDirectionElement = this.parent as ILayoutDirectionElement;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Boolean = _loc1_.layoutDirection != null && this._layoutDirection != null && this._layoutDirection != _loc1_.layoutDirection;
         if(!!this.layoutFeatures ? _loc2_ != this.layoutFeatures.mirror : _loc2_)
         {
            if(this.layoutFeatures == null)
            {
               this.mx_internal::allocateLayoutFeatures();
            }
            _loc3_ = this.needsDisplayObject;
            this.layoutFeatures.mirror = _loc2_;
            this.invalidateTransform(_loc3_ != this.needsDisplayObject);
         }
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
      }
      
      public function localToGlobal(param1:Point) : Point
      {
         if(!this.displayObject || !this.displayObject.parent)
         {
            return new Point(this.x,this.y);
         }
         var _loc2_:Point = this.displayObject.localToGlobal(param1);
         if(!this.needsDisplayObject)
         {
            _loc2_.x += this.drawX;
            _loc2_.y += this.drawY;
         }
         return _loc2_;
      }
      
      public function createDisplayObject() : DisplayObject
      {
         this.setDisplayObject(new InvalidatingSprite());
         return this.displayObject;
      }
      
      protected function get needsDisplayObject() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:Boolean = this.alwaysCreateDisplayObject || this._filters && this._filters.length > 0 || this._blendMode != BlendMode.NORMAL && this._blendMode != "auto" || this._mask || this.layoutFeatures != null && (this.layoutFeatures.layoutScaleX != 1 || this.layoutFeatures.layoutScaleY != 1 || this.layoutFeatures.layoutScaleZ != 1 || this.layoutFeatures.layoutRotationX != 0 || this.layoutFeatures.layoutRotationY != 0 || this.layoutFeatures.layoutRotationZ != 0 || this.layoutFeatures.layoutZ != 0 || this.layoutFeatures.mirror) || this._colorTransform != null || this._effectiveAlpha != 1;
         if(this.layoutFeatures != null && this.layoutFeatures.postLayoutTransformOffsets != null)
         {
            _loc2_ = this.layoutFeatures.postLayoutTransformOffsets;
            _loc1_ = _loc1_ || (_loc2_.scaleX != 1 || _loc2_.scaleY != 1 || _loc2_.scaleZ != 1 || _loc2_.rotationX != 0 || _loc2_.rotationY != 0 || _loc2_.rotationZ != 0 || _loc2_.z != 0);
         }
         return _loc1_;
      }
      
      public function setSharedDisplayObject(param1:DisplayObject) : Boolean
      {
         if(!(param1 is Sprite) || this._alwaysCreateDisplayObject || this.needsDisplayObject)
         {
            return false;
         }
         this.setDisplayObject(param1);
         return true;
      }
      
      public function canShareWithPrevious(param1:IGraphicElement) : Boolean
      {
         return param1 is GraphicElement;
      }
      
      public function canShareWithNext(param1:IGraphicElement) : Boolean
      {
         return param1 is GraphicElement && !this._alwaysCreateDisplayObject && !this.needsDisplayObject;
      }
      
      protected function get drawnDisplayObject() : DisplayObject
      {
         return !!this._drawnDisplayObject ? this._drawnDisplayObject : this.displayObject;
      }
      
      mx_internal function captureBitmapData(param1:Boolean = true, param2:uint = 4294967295, param3:Boolean = true, param4:Rectangle = null) : BitmapData
      {
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(!this.layoutFeatures || !this.layoutFeatures.is3D)
         {
            _loc5_ = false;
            if(!this.displayObject || this.displayObjectSharingMode != DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
            {
               _loc5_ = true;
               _loc6_ = this.displayObject;
               this.setDisplayObject(new InvalidatingSprite());
               if(this.parent is UIComponent)
               {
                  UIComponent(this.parent).mx_internal::$addChild(this.displayObject);
               }
               else
               {
                  this.parent.addChild(this.displayObject);
               }
               this.invalidateDisplayList();
               this.validateDisplayList();
            }
            _loc7_ = Sprite(IUIComponent(this.parent).systemManager.getSandboxRoot());
            if((_loc8_ = param3 ? new Rectangle(this.getLayoutBoundsX(),this.getLayoutBoundsY(),this.getLayoutBoundsWidth(),this.getLayoutBoundsHeight()) : this.displayObject.getBounds(_loc7_)).width == 0 || _loc8_.height == 0)
            {
               return null;
            }
            _loc9_ = new BitmapData(Math.ceil(_loc8_.width),Math.ceil(_loc8_.height),param1,param2);
            if(_loc10_ = param3 ? this.displayObject.transform.matrix : MatrixUtil.getConcatenatedMatrix(this.displayObject,null))
            {
               _loc10_.translate(-_loc8_.x,-_loc8_.y);
            }
            _loc9_.draw(this.displayObject,_loc10_,null,null,param4);
            if(_loc5_)
            {
               if(this.parent is UIComponent)
               {
                  UIComponent(this.parent).mx_internal::$removeChild(this.displayObject);
               }
               else
               {
                  this.parent.removeChild(this.displayObject);
               }
               this.setDisplayObject(_loc6_);
            }
            return _loc9_;
         }
         return this.get3DSnapshot(param1,param2,param3);
      }
      
      private function get3DSnapshot(param1:Boolean = true, param2:uint = 4294967295, param3:Boolean = true) : BitmapData
      {
         var _loc4_:Sprite = Sprite(IUIComponent(this.parent).systemManager);
         var _loc5_:DisplayObjectContainer = this.displayObject.parent;
         var _loc6_:Sprite = new Sprite();
         var _loc7_:Rectangle = this.displayObject.getBounds(_loc4_);
         var _loc8_:Rectangle = this.displayObject.getBounds(_loc5_);
         var _loc9_:Matrix3D = this.displayObject.transform.matrix3D.clone();
         var _loc10_:Matrix3D = this.displayObject.transform.getRelativeMatrix3D(_loc4_);
         var _loc11_:Matrix3D = _loc9_.clone();
         var _loc12_:int = this.parent.getChildIndex(this.displayObject);
         if(this.parent is UIComponent)
         {
            UIComponent(this.parent).mx_internal::$removeChild(this.displayObject);
         }
         else
         {
            this.parent.removeChild(this.displayObject);
         }
         _loc4_.addChild(_loc6_);
         _loc6_.addChild(this.displayObject);
         if(param3)
         {
            _loc11_.position = _loc10_.position;
            this.displayObject.transform.matrix3D = _loc11_;
         }
         else
         {
            this.displayObject.transform.matrix3D = _loc10_;
         }
         var _loc13_:Matrix;
         (_loc13_ = new Matrix()).translate(-_loc7_.left,-_loc7_.top);
         var _loc14_:BitmapData;
         (_loc14_ = new BitmapData(_loc7_.width,_loc7_.height,param1,param2)).draw(_loc6_,_loc13_,null,null,null,true);
         _loc6_.removeChild(this.displayObject);
         _loc4_.removeChild(_loc6_);
         if(this.parent is UIComponent)
         {
            UIComponent(this.parent).mx_internal::$addChildAt(this.displayObject,_loc12_);
         }
         else
         {
            this.parent.addChildAt(this.displayObject,_loc12_);
         }
         this.displayObject.transform.matrix3D = _loc9_;
         return _loc14_;
      }
      
      protected function layer_PropertyChange(param1:PropertyChangeEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         switch(param1.property)
         {
            case "effectiveVisibility":
               _loc2_ = Boolean(param1.newValue) && this._visible;
               if(_loc2_ != this._effectiveVisibility)
               {
                  this._effectiveVisibility = _loc2_;
                  this.visibleChanged = true;
                  this.invalidateProperties();
                  break;
               }
               break;
            case "effectiveAlpha":
               _loc3_ = Number(param1.newValue) * this._alpha;
               if(_loc3_ != this._effectiveAlpha)
               {
                  this._effectiveAlpha = _loc3_;
                  this.alphaChanged = true;
                  if(_loc4_ = this._transform as mx.geom.Transform)
                  {
                     _loc4_.mx_internal::applyColorTransformAlpha = false;
                  }
                  this.invalidateDisplayObjectSharing();
                  this.invalidateProperties();
                  break;
               }
         }
      }
      
      mx_internal function dispatchPropertyChangeEvent(param1:String, param2:*, param3:*) : void
      {
         if(hasEventListener("propertyChange"))
         {
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,param1,param2,param3));
         }
      }
      
      protected function invalidateDisplayObjectSharing() : void
      {
         if(this.parent)
         {
            IGraphicElementContainer(this.parent).invalidateGraphicElementSharing(this);
         }
      }
      
      public function invalidateProperties() : void
      {
         if(this.mx_internal::invalidatePropertiesFlag)
         {
            return;
         }
         this.mx_internal::invalidatePropertiesFlag = true;
         if(this.parent)
         {
            IGraphicElementContainer(this.parent).invalidateGraphicElementProperties(this);
         }
      }
      
      public function invalidateSize() : void
      {
         if(this.mx_internal::invalidateSizeFlag)
         {
            return;
         }
         this.mx_internal::invalidateSizeFlag = true;
         if(this.parent)
         {
            IGraphicElementContainer(this.parent).invalidateGraphicElementSize(this);
         }
      }
      
      protected function invalidateParentSizeAndDisplayList() : void
      {
         if(!this.includeInLayout)
         {
            return;
         }
         if(Boolean(this.parent) && this.parent is IInvalidating)
         {
            IInvalidating(this.parent).invalidateSize();
            IInvalidating(this.parent).invalidateDisplayList();
         }
      }
      
      public function invalidateDisplayList() : void
      {
         if(this.mx_internal::invalidateDisplayListFlag)
         {
            return;
         }
         this.mx_internal::invalidateDisplayListFlag = true;
         if(this.parent)
         {
            IGraphicElementContainer(this.parent).invalidateGraphicElementDisplayList(this);
         }
      }
      
      public function validateNow() : void
      {
         if(this.parent)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(this.parent));
         }
      }
      
      public function validateProperties() : void
      {
         if(!this.mx_internal::invalidatePropertiesFlag)
         {
            return;
         }
         this.commitProperties();
         this.mx_internal::invalidatePropertiesFlag = false;
         if(!this.mx_internal::invalidatePropertiesFlag && !this.mx_internal::invalidateSizeFlag && !this.mx_internal::invalidateDisplayListFlag)
         {
            this.dispatchUpdateComplete();
         }
      }
      
      protected function commitProperties() : void
      {
         var _loc2_:* = null;
         var _loc1_:Boolean = false;
         if(this.displayObjectSharingMode != DisplayObjectSharingMode.USES_SHARED_OBJECT && Boolean(this.displayObject))
         {
            if(this.colorTransformChanged || this.displayObjectChanged)
            {
               this.colorTransformChanged = false;
               if(this._colorTransform)
               {
                  this.displayObject.transform.colorTransform = this._colorTransform;
               }
            }
            if(this.alphaChanged || this.displayObjectChanged)
            {
               this.alphaChanged = false;
               _loc2_ = this._transform as mx.geom.Transform;
               if(!_loc2_ || !_loc2_.mx_internal::applyColorTransformAlpha)
               {
                  this.displayObject.alpha = this._effectiveAlpha;
               }
            }
            if(this.blendModeChanged || this.displayObjectChanged)
            {
               this.blendModeChanged = false;
               if(this._blendMode == "auto")
               {
                  if(this.alpha == 0 || this.alpha == 1)
                  {
                     this.displayObject.blendMode = BlendMode.NORMAL;
                  }
                  else
                  {
                     this.displayObject.blendMode = BlendMode.LAYER;
                  }
               }
               else if(!this.isAIMBlendMode(this._blendMode))
               {
                  this.displayObject.blendMode = this._blendMode;
               }
               else
               {
                  this.displayObject.blendMode = "normal";
               }
               if(this.blendShaderChanged)
               {
                  this.blendShaderChanged = false;
                  switch(this._blendMode)
                  {
                     case "color":
                        this.displayObject.blendShader = new ColorShader();
                        break;
                     case "colordodge":
                        this.displayObject.blendShader = new ColorDodgeShader();
                        break;
                     case "colorburn":
                        this.displayObject.blendShader = new ColorBurnShader();
                        break;
                     case "exclusion":
                        this.displayObject.blendShader = new ExclusionShader();
                        break;
                     case "hue":
                        this.displayObject.blendShader = new HueShader();
                        break;
                     case "luminosity":
                        this.displayObject.blendShader = new LuminosityShader();
                        break;
                     case "saturation":
                        this.displayObject.blendShader = new SaturationShader();
                        break;
                     case "softlight":
                        this.displayObject.blendShader = new SoftLightShader();
                  }
               }
            }
            if(this.filtersChanged || this.displayObjectChanged)
            {
               this.filtersChanged = false;
               if(this.filtersChanged || Boolean(this._clonedFilters))
               {
                  this.displayObject.filters = this._clonedFilters;
               }
            }
            if(this.maskChanged || this.displayObjectChanged)
            {
               this.maskChanged = false;
               if(this._mask)
               {
                  if(!this._mask.parent)
                  {
                     Sprite(this.displayObject).addChild(this._mask);
                     MaskUtil.mx_internal::applyMask(this._mask,this.parent);
                     if(!this._drawnDisplayObject)
                     {
                        if(this.displayObject is Sprite)
                        {
                           Sprite(this.displayObject).graphics.clear();
                        }
                        else if(this.displayObject is Shape)
                        {
                           Shape(this.displayObject).graphics.clear();
                        }
                        this._drawnDisplayObject = new InvalidatingSprite();
                        Sprite(this.displayObject).addChild(this._drawnDisplayObject);
                     }
                  }
                  this.drawnDisplayObject.mask = this._mask;
               }
            }
            if(this.luminositySettingsChanged)
            {
               this.luminositySettingsChanged = false;
               MaskUtil.mx_internal::applyLuminositySettings(this._mask,this._maskType,this._luminosityInvert,this._luminosityClip);
            }
            if(this.maskTypeChanged || this.displayObjectChanged)
            {
               this.maskTypeChanged = false;
               MaskUtil.mx_internal::applyMaskType(this._mask,this._maskType,this._luminosityInvert,this._luminosityClip,this.drawnDisplayObject);
            }
            if(this.displayObjectChanged)
            {
               this.displayObject.visible = this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT ? this._effectiveVisibility : true;
            }
            _loc1_ = true;
            this.displayObjectChanged = false;
         }
         if(this.visibleChanged)
         {
            this.visibleChanged = false;
            if(this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
            {
               this.displayObject.visible = this._effectiveVisibility;
            }
            else
            {
               this.invalidateDisplayList();
            }
         }
         if(this.layoutFeatures == null || this.layoutFeatures.updatePending || _loc1_)
         {
            this.mx_internal::applyComputedTransform();
         }
      }
      
      public function validateSize() : void
      {
         if(!this.mx_internal::invalidateSizeFlag)
         {
            return;
         }
         this.mx_internal::invalidateSizeFlag = false;
         var _loc1_:Boolean = this.measureSizes();
         if(!_loc1_ || !this.includeInLayout)
         {
            if(!this.mx_internal::invalidatePropertiesFlag && !this.mx_internal::invalidateSizeFlag && !this.mx_internal::invalidateDisplayListFlag)
            {
               this.dispatchUpdateComplete();
            }
            return;
         }
         this.invalidateParentSizeAndDisplayList();
      }
      
      protected function canSkipMeasurement() : Boolean
      {
         return !isNaN(this.explicitWidth) && !isNaN(this.explicitHeight);
      }
      
      private function measureSizes() : Boolean
      {
         var _loc1_:Number = this.preferredWidthPreTransform();
         var _loc2_:Number = this.preferredHeightPreTransform();
         var _loc3_:Number = this.measuredX;
         var _loc4_:Number = this.measuredY;
         if(!this.canSkipMeasurement())
         {
            this.measure();
         }
         if(!isNaN(this.explicitMinWidth) && this.measuredWidth < this.explicitMinWidth)
         {
            this.measuredWidth = this.explicitMinWidth;
         }
         if(!isNaN(this.explicitMaxWidth) && this.measuredWidth > this.explicitMaxWidth)
         {
            this.measuredWidth = this.explicitMaxWidth;
         }
         if(!isNaN(this.explicitMinHeight) && this.measuredHeight < this.explicitMinHeight)
         {
            this.measuredHeight = this.explicitMinHeight;
         }
         if(!isNaN(this.explicitMaxHeight) && this.measuredHeight > this.explicitMaxHeight)
         {
            this.measuredHeight = this.explicitMaxHeight;
         }
         if(_loc1_ != this.preferredWidthPreTransform() || _loc2_ != this.preferredHeightPreTransform() || _loc3_ != this.measuredX || _loc4_ != this.measuredY)
         {
            return true;
         }
         return false;
      }
      
      protected function measure() : void
      {
         this.measuredWidth = 0;
         this.measuredHeight = 0;
         this.measuredX = 0;
         this.measuredY = 0;
      }
      
      public function validateDisplayList() : void
      {
         var _loc1_:Boolean = this.mx_internal::invalidateDisplayListFlag;
         this.mx_internal::invalidateDisplayListFlag = false;
         if(this.layoutFeatures == null || this.layoutFeatures.updatePending)
         {
            this.mx_internal::applyComputedTransform();
         }
         if(this.displayObjectSharingMode != DisplayObjectSharingMode.USES_SHARED_OBJECT)
         {
            if(this.drawnDisplayObject is Sprite)
            {
               Sprite(this.drawnDisplayObject).graphics.clear();
            }
         }
         this.mx_internal::doUpdateDisplayList();
         if(!this.mx_internal::invalidatePropertiesFlag && !this.mx_internal::invalidateSizeFlag && !this.mx_internal::invalidateDisplayListFlag && _loc1_)
         {
            this.dispatchUpdateComplete();
         }
      }
      
      mx_internal function doUpdateDisplayList() : void
      {
         if(this._effectiveVisibility || this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
         {
            this.updateDisplayList(this.mx_internal::_width,this.mx_internal::_height);
         }
      }
      
      protected function updateDisplayList(param1:Number, param2:Number) : void
      {
      }
      
      private function dispatchUpdateComplete() : void
      {
         if(hasEventListener(FlexEvent.UPDATE_COMPLETE))
         {
            dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
         }
      }
      
      public function getMaxBoundsWidth(param1:Boolean = true) : Number
      {
         return this.transformWidthForLayout(this.maxWidth,this.maxHeight,param1);
      }
      
      public function getMaxBoundsHeight(param1:Boolean = true) : Number
      {
         return this.transformHeightForLayout(this.maxWidth,this.maxHeight,param1);
      }
      
      public function getMinBoundsWidth(param1:Boolean = true) : Number
      {
         return this.transformWidthForLayout(this.minWidth,this.minHeight,param1);
      }
      
      public function getMinBoundsHeight(param1:Boolean = true) : Number
      {
         return this.transformHeightForLayout(this.minWidth,this.minHeight,param1);
      }
      
      public function getPreferredBoundsWidth(param1:Boolean = true) : Number
      {
         return this.transformWidthForLayout(this.preferredWidthPreTransform(),this.preferredHeightPreTransform(),param1);
      }
      
      public function getPreferredBoundsHeight(param1:Boolean = true) : Number
      {
         return this.transformHeightForLayout(this.preferredWidthPreTransform(),this.preferredHeightPreTransform(),param1);
      }
      
      public function getBoundsXAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Rectangle = this.getStrokeExtents(param3);
         var _loc5_:Matrix;
         if(!(_loc5_ = this.mx_internal::getComplexMatrix(param3)))
         {
            return _loc4_.left + this.measuredX + this.x;
         }
         if(!isNaN(param1))
         {
            param1 -= _loc4_.width;
         }
         if(!isNaN(param2))
         {
            param2 -= _loc4_.height;
         }
         var _loc6_:Point;
         if(!(_loc6_ = MatrixUtil.fitBounds(param1,param2,_loc5_,this.explicitWidth,this.explicitHeight,this.preferredWidthPreTransform(),this.preferredHeightPreTransform(),this.minWidth,this.minHeight,this.maxWidth,this.maxHeight)))
         {
            _loc6_ = new Point(this.minWidth,this.minHeight);
         }
         var _loc7_:Point = new Point(this.measuredX,this.measuredY);
         MatrixUtil.transformBounds(_loc6_.x,_loc6_.y,_loc5_,_loc7_);
         return _loc4_.left + _loc7_.x;
      }
      
      public function getBoundsYAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Rectangle = this.getStrokeExtents(param3);
         var _loc5_:Matrix;
         if(!(_loc5_ = this.mx_internal::getComplexMatrix(param3)))
         {
            return _loc4_.top + this.measuredY + this.y;
         }
         if(!isNaN(param1))
         {
            param1 -= _loc4_.width;
         }
         if(!isNaN(param2))
         {
            param2 -= _loc4_.height;
         }
         var _loc6_:Point;
         if(!(_loc6_ = MatrixUtil.fitBounds(param1,param2,_loc5_,this.explicitWidth,this.explicitHeight,this.preferredWidthPreTransform(),this.preferredHeightPreTransform(),this.minWidth,this.minHeight,this.maxWidth,this.maxHeight)))
         {
            _loc6_ = new Point(this.minWidth,this.minHeight);
         }
         var _loc7_:Point = new Point(this.measuredX,this.measuredY);
         MatrixUtil.transformBounds(_loc6_.x,_loc6_.y,_loc5_,_loc7_);
         return _loc4_.top + _loc7_.y;
      }
      
      public function getLayoutBoundsX(param1:Boolean = true) : Number
      {
         var _loc2_:Number = this.getStrokeExtents(param1).left;
         var _loc3_:Matrix = this.mx_internal::getComplexMatrix(param1);
         if(!_loc3_)
         {
            return _loc2_ + this.measuredX + this.x;
         }
         var _loc4_:Point = new Point(this.measuredX,this.measuredY);
         MatrixUtil.transformBounds(this.mx_internal::_width,this.mx_internal::_height,_loc3_,_loc4_);
         return _loc2_ + _loc4_.x;
      }
      
      public function getLayoutBoundsY(param1:Boolean = true) : Number
      {
         var _loc2_:Number = this.getStrokeExtents(param1).top;
         var _loc3_:Matrix = this.mx_internal::getComplexMatrix(param1);
         if(!_loc3_)
         {
            return _loc2_ + this.measuredY + this.y;
         }
         var _loc4_:Point = new Point(this.measuredX,this.measuredY);
         MatrixUtil.transformBounds(this.mx_internal::_width,this.mx_internal::_height,_loc3_,_loc4_);
         return _loc2_ + _loc4_.y;
      }
      
      public function getLayoutBoundsWidth(param1:Boolean = true) : Number
      {
         return this.transformWidthForLayout(this.mx_internal::_width,this.mx_internal::_height,param1);
      }
      
      public function getLayoutBoundsHeight(param1:Boolean = true) : Number
      {
         return this.transformHeightForLayout(this.mx_internal::_width,this.mx_internal::_height,param1);
      }
      
      protected function transformWidthForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         if(param3 && this.hasComplexLayoutMatrix)
         {
            param1 = MatrixUtil.transformSize(param1,param2,this.layoutFeatures.layoutMatrix).x;
         }
         return param1 + this.getStrokeExtents(param3).width;
      }
      
      protected function transformHeightForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         if(param3 && this.hasComplexLayoutMatrix)
         {
            param2 = MatrixUtil.transformSize(param1,param2,this.layoutFeatures.layoutMatrix).y;
         }
         return param2 + this.getStrokeExtents(param3).height;
      }
      
      protected function preferredWidthPreTransform() : Number
      {
         return isNaN(this.explicitWidth) ? this.measuredWidth : this.explicitWidth;
      }
      
      protected function preferredHeightPreTransform() : Number
      {
         return isNaN(this.explicitHeight) ? this.measuredHeight : this.explicitHeight;
      }
      
      public function setLayoutBoundsPosition(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:Number = this.getLayoutBoundsX(param3);
         var _loc5_:Number = this.getLayoutBoundsY(param3);
         var _loc6_:Number = this.x;
         var _loc7_:Number = this.y;
         var _loc8_:Number = _loc6_ + param1 - _loc4_;
         var _loc9_:Number = _loc7_ + param2 - _loc5_;
         if(_loc8_ != _loc6_ || _loc9_ != _loc7_)
         {
            if(this.layoutFeatures != null)
            {
               this.layoutFeatures.layoutX = _loc8_;
               this.layoutFeatures.layoutY = _loc9_;
               this.layoutFeatures.updatePending = true;
            }
            else
            {
               this._x = _loc8_;
               this._y = _loc9_;
            }
            if(_loc8_ != _loc6_)
            {
               this.mx_internal::dispatchPropertyChangeEvent("x",_loc6_,_loc8_);
            }
            if(_loc9_ != _loc7_)
            {
               this.mx_internal::dispatchPropertyChangeEvent("y",_loc7_,_loc9_);
            }
            this.invalidateDisplayList();
         }
      }
      
      public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!isNaN(param1) || !isNaN(param2))
         {
            _loc5_ = this.getStrokeExtents(param3);
            if(!isNaN(param1))
            {
               param1 -= _loc5_.width;
            }
            if(!isNaN(param2))
            {
               param2 -= _loc5_.height;
            }
         }
         if(param3 && this.hasComplexLayoutMatrix)
         {
            _loc4_ = this.layoutFeatures.layoutMatrix;
         }
         if(!_loc4_)
         {
            if(isNaN(param1))
            {
               param1 = this.preferredWidthPreTransform();
            }
            if(isNaN(param2))
            {
               param2 = this.preferredHeightPreTransform();
            }
         }
         else if(_loc6_ = MatrixUtil.fitBounds(param1,param2,_loc4_,this.explicitWidth,this.explicitHeight,this.preferredWidthPreTransform(),this.preferredHeightPreTransform(),this.minWidth,this.minHeight,this.maxWidth,this.maxHeight))
         {
            param1 = _loc6_.x;
            param2 = _loc6_.y;
         }
         else
         {
            param1 = this.minWidth;
            param2 = this.minHeight;
         }
         this.mx_internal::setActualSize(param1,param2);
      }
      
      mx_internal function setActualSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.mx_internal::_width != param1 || this.mx_internal::_height != param2)
         {
            _loc3_ = this.mx_internal::_width;
            _loc4_ = this.mx_internal::_height;
            this.mx_internal::_width = param1;
            this.mx_internal::_height = param2;
            if(this.layoutFeatures)
            {
               this.layoutFeatures.layoutWidth = param1;
               this.invalidateTransform(false,false);
            }
            if(param1 != _loc3_)
            {
               this.mx_internal::dispatchPropertyChangeEvent("width",_loc3_,param1);
            }
            if(param2 != _loc4_)
            {
               this.mx_internal::dispatchPropertyChangeEvent("height",_loc4_,param2);
            }
            this.invalidateDisplayList();
         }
      }
      
      public function getLayoutMatrix() : Matrix
      {
         if(this.layoutFeatures != null)
         {
            return this.layoutFeatures.layoutMatrix.clone();
         }
         var _loc1_:Matrix = new Matrix();
         _loc1_.translate(this._x,this._y);
         return _loc1_;
      }
      
      public function setLayoutMatrix(param1:Matrix, param2:Boolean) : void
      {
         this.mx_internal::allocateLayoutFeatures();
         var _loc3_:Boolean = this.needsDisplayObject;
         if(MatrixUtil.isEqual(this.layoutFeatures.layoutMatrix,param1))
         {
            return;
         }
         this.layoutFeatures.layoutMatrix = param1;
         this.invalidateTransform(_loc3_ != this.needsDisplayObject,param2);
      }
      
      public function get hasLayoutMatrix3D() : Boolean
      {
         return !!this.layoutFeatures ? this.layoutFeatures.layoutIs3D : false;
      }
      
      public function get is3D() : Boolean
      {
         return !!this.layoutFeatures ? this.layoutFeatures.is3D : false;
      }
      
      public function getLayoutMatrix3D() : Matrix3D
      {
         if(this.layoutFeatures != null)
         {
            return this.layoutFeatures.layoutMatrix3D.clone();
         }
         var _loc1_:Matrix3D = new Matrix3D();
         _loc1_.appendTranslation(this._x,this._y,0);
         return _loc1_;
      }
      
      public function setLayoutMatrix3D(param1:Matrix3D, param2:Boolean) : void
      {
         this.mx_internal::allocateLayoutFeatures();
         var _loc3_:Boolean = this.needsDisplayObject;
         if(MatrixUtil.isEqual3D(this.layoutFeatures.layoutMatrix3D,param1))
         {
            return;
         }
         this.layoutFeatures.layoutMatrix3D = param1;
         this.invalidateTransform(_loc3_ != this.needsDisplayObject,param2);
      }
      
      mx_internal function applyComputedTransform() : void
      {
         var _loc1_:* = null;
         if(this.layoutFeatures != null)
         {
            this.layoutFeatures.updatePending = false;
         }
         if(this.displayObjectSharingMode == DisplayObjectSharingMode.USES_SHARED_OBJECT || !this.displayObject)
         {
            return;
         }
         if(this.layoutFeatures != null)
         {
            if(this.layoutFeatures.is3D)
            {
               this.displayObject.transform.matrix3D = this.layoutFeatures.computedMatrix3D;
            }
            else
            {
               _loc1_ = this.layoutFeatures.computedMatrix.clone();
               if(this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_SHARED_OBJECT)
               {
                  _loc1_.tx = 0;
                  _loc1_.ty = 0;
               }
               this.displayObject.transform.matrix = _loc1_;
            }
         }
         else if(this.displayObjectSharingMode == DisplayObjectSharingMode.OWNS_SHARED_OBJECT)
         {
            this.displayObject.x = 0;
            this.displayObject.y = 0;
         }
         else
         {
            this.displayObject.x = this._x;
            this.displayObject.y = this._y;
         }
      }
      
      mx_internal function getComplexMatrix(param1:Boolean) : Matrix
      {
         return param1 && this.hasComplexLayoutMatrix ? this.layoutFeatures.layoutMatrix : null;
      }
      
      protected function getStrokeExtents(param1:Boolean = true) : Rectangle
      {
         mx_internal::_strokeExtents.x = 0;
         mx_internal::_strokeExtents.y = 0;
         mx_internal::_strokeExtents.width = 0;
         mx_internal::_strokeExtents.height = 0;
         return mx_internal::_strokeExtents;
      }
      
      private function filterChangedHandler(param1:Event) : void
      {
         this.filters = this._filters;
      }
   }
}
