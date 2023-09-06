package net.bigpoint.darkorbit.fui.components.core
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.repository.SkinRepository;
   import net.bigpoint.darkorbit.fui.components.core.data.IDataReceptible;
   import net.bigpoint.darkorbit.fui.components.core.interfaces.IFocusable;
   import net.bigpoint.darkorbit.fui.components.core.layout.Alignment;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   import net.bigpoint.darkorbit.fui.components.tooltip.DefaultTooltipDataAssigner;
   import net.bigpoint.darkorbit.fui.components.tooltip.ITooltipDataAssigner;
   import net.bigpoint.darkorbit.fui.system.utils.FuiComponentSelectorUtil;
   import package_99.class_266;
   
   public class Coreponent extends Sprite implements ICoreponent, IDataReceptible, IFocusable
   {
      
      public static const EVENT_SIZE_CHANGED:String = "core.sizeChanged";
      
      public static const EVENT_DRAWN:String = "core.Drawn";
      
      public static const SIZE_NORMAL:uint = 0;
      
      public static const SIZE_RELATIVE:uint = 1;
      
      public static const SIZE_FILL:uint = 2;
      
      private static var _ID_:uint = 0;
       
      
      private var _ID:uint = 0;
      
      private var _BINDING_ID_:String;
      
      protected var _invalidates:Dictionary;
      
      protected var delayedUpdate:Boolean = true;
      
      protected var _alignment:Alignment;
      
      protected var _skin:ISkin;
      
      protected var _x:Number = 0;
      
      protected var _y:Number = 0;
      
      protected var _width:Number = 2;
      
      protected var _height:Number = 2;
      
      protected var _minWidth:Number = 0;
      
      protected var _minHeight:Number = 0;
      
      protected var _maxWidth:Number = 4294967295;
      
      protected var _maxHeight:Number = 4294967295;
      
      protected var _relativeWidth:Number = 0;
      
      protected var _relativeHeight:Number = 0;
      
      protected var _sizeHandling:uint = 0;
      
      protected var _autoSizeWidth:Boolean = false;
      
      protected var _autoSizeHeight:Boolean = false;
      
      protected var _skinMask:Sprite;
      
      protected var _cacheSkinMaskAsBitmap:Boolean = true;
      
      protected var _enabled:Boolean = true;
      
      protected var _mouseEnabled:Boolean = false;
      
      protected var _mouseChildrenEnabled:Boolean = true;
      
      protected var _pixelSnapping:Boolean = false;
      
      protected var _tooltipTemplateID:String;
      
      protected var _tooltipDataAssigner:ITooltipDataAssigner;
      
      protected var _tooltipData:Object;
      
      protected var _focusGroupId:String;
      
      private var _data:Object;
      
      public function Coreponent()
      {
         super();
         this.initialize();
      }
      
      protected function initialize() : void
      {
         this._ID = _ID_++;
         this._invalidates = new Dictionary();
         this._alignment = new Alignment(this);
         this._tooltipDataAssigner = new DefaultTooltipDataAssigner();
         this.mouseEnabled = this._mouseEnabled;
         this.mouseChildren = this._mouseChildrenEnabled;
         this.addEventListeners();
      }
      
      protected function addEventListeners() : void
      {
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage,false,0,true);
      }
      
      protected function removeEventListeners() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.updateNow);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
      }
      
      public function assignChildren() : void
      {
      }
      
      public function invalidate(param1:uint = 0) : void
      {
         if(param1 > 0)
         {
            if(this._invalidates == null)
            {
               this._invalidates = new Dictionary();
            }
            this._invalidates[param1] = true;
         }
         if(this.delayedUpdate)
         {
            this.addEventListener(Event.ENTER_FRAME,this.updateNow);
         }
         else
         {
            this.updateNow();
         }
      }
      
      protected function updateNow(param1:Event = null) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.updateNow);
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:* = null;
         if(this.isInvalidate(InvalidationType.SKIN))
         {
            this.drawSkin();
         }
         if(this.isInvalidate(InvalidationType.SIZE))
         {
            this.drawSize();
         }
         if(this.isInvalidate(InvalidationType.POSITION))
         {
            this.drawPosition();
         }
         if(this.isInvalidate(InvalidationType.SKIN))
         {
            if(this._skin)
            {
               _loc1_ = this._skin as DisplayObject;
               _loc1_.visible = true;
               this.attemptToSetSkinMask();
            }
         }
         if(this.isInvalidate(InvalidationType.ENABLE))
         {
            this.drawEnabled();
            this.validate(InvalidationType.ENABLE);
         }
         this.validate(InvalidationType.POSITION);
         this.validate(InvalidationType.SIZE);
         this.validate(InvalidationType.SKIN);
         if(false)
         {
            this.drawDebugBorder();
         }
         dispatchEvent(new Event(EVENT_DRAWN));
      }
      
      protected function drawPosition() : void
      {
         var _loc1_:Number = this.getCalculatedX();
         var _loc2_:Number = this.getCalculatedY();
         if(this._pixelSnapping)
         {
            super.x = int(_loc1_);
            super.y = int(_loc2_);
         }
         else
         {
            super.x = _loc1_;
            super.y = _loc2_;
         }
      }
      
      protected function drawSkin() : void
      {
         if(this._skin)
         {
            this._skin.init();
         }
      }
      
      protected function drawEnabled() : void
      {
         if(this._skin)
         {
            if(this._enabled)
            {
               this.setSkinState(SkinLayerNames.NORMAL);
            }
            else
            {
               this.setSkinState(SkinLayerNames.DISABLED);
            }
         }
      }
      
      protected function drawSize() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._skin)
         {
            _loc1_ = this.getCalculatedWidth();
            _loc2_ = this.getCalculatedHeight();
            this._drawSizeWithValues(_loc1_,_loc2_);
         }
      }
      
      protected function _drawSizeWithValues(param1:Number, param2:Number) : void
      {
         this._skin.width = param1;
         this._skin.height = param2;
         if(this._skinMask)
         {
            this._skinMask.width = param1;
            this._skinMask.height = param2;
         }
         dispatchEvent(new Event(EVENT_SIZE_CHANGED));
      }
      
      protected function validate(param1:uint) : void
      {
         this._invalidates[param1] = false;
      }
      
      protected function isInvalidate(param1:uint) : Boolean
      {
         if(this._invalidates)
         {
            return this._invalidates[param1];
         }
         return true;
      }
      
      public function forceRedraws(param1:Array = null, param2:Boolean = false) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(param1)
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = uint(param1[_loc4_]);
               this.invalidate(_loc5_);
               _loc4_++;
            }
         }
         this.updateNow();
         if(param2)
         {
            _loc6_ = this.getAllCoreponentChildren();
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               (_loc8_ = _loc6_[_loc7_]).forceRedraws(param1,param2);
               _loc7_++;
            }
         }
      }
      
      public function forceRedraw(param1:uint = 4294967295) : void
      {
         if(param1 != uint.MAX_VALUE)
         {
            this.invalidate(param1);
         }
         this.updateNow();
      }
      
      public function dispose() : void
      {
         this.removeEventListeners();
         if(this._tooltipDataAssigner)
         {
            this._tooltipDataAssigner = null;
         }
         if(this._skin)
         {
            this._skin.dispose();
            this._skin = null;
         }
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      override public function set x(param1:Number) : void
      {
         this._x = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      override public function get x() : Number
      {
         return this._x;
      }
      
      override public function set y(param1:Number) : void
      {
         this._y = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      override public function get y() : Number
      {
         return this._y;
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      protected function getCalculatedX() : Number
      {
         return this._alignment.calculateX();
      }
      
      protected function getCalculatedY() : Number
      {
         return this._alignment.calculateY();
      }
      
      public function getExplicitX() : Number
      {
         return super.x;
      }
      
      public function getExplicitY() : Number
      {
         return super.y;
      }
      
      public function get globalPosition() : Point
      {
         return this.localToGlobal(new Point(0,0));
      }
      
      public function get pixelSnapping() : Boolean
      {
         return this._pixelSnapping;
      }
      
      public function set pixelSnapping(param1:Boolean) : void
      {
         this._pixelSnapping = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      override public function get width() : Number
      {
         return this.getCalculatedWidth();
      }
      
      override public function set width(param1:Number) : void
      {
         if(this._width != param1)
         {
            this._width = param1 > this._minWidth ? param1 : this._minWidth;
         }
         this.invalidate(InvalidationType.SIZE);
      }
      
      override public function get height() : Number
      {
         return this.getCalculatedHeight();
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._height != param1)
         {
            this._height = param1 > this._minHeight ? param1 : this._minHeight;
         }
         this.invalidate(InvalidationType.SIZE);
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         if(this._width != param1)
         {
            this._width = param1 > this._minWidth ? param1 : this._minWidth;
         }
         if(this._height != param2)
         {
            this._height = param2 > this._minHeight ? param2 : this._minHeight;
         }
         this.invalidate(InvalidationType.SIZE);
      }
      
      public function getExplicitWidth() : Number
      {
         return super.width;
      }
      
      public function getExplicitHeight() : Number
      {
         return super.height;
      }
      
      public function getCalculatedWidth() : Number
      {
         if(this._autoSizeWidth)
         {
            return this._alignment.calculatePercentageWidth();
         }
         return this._width;
      }
      
      public function getCalculatedHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(this._autoSizeHeight)
         {
            return this._alignment.calculatePercentageHeight();
         }
         return this._height;
      }
      
      public function get autoSizeWidth() : Boolean
      {
         return this._autoSizeWidth;
      }
      
      public function set autoSizeWidth(param1:Boolean) : void
      {
         this._autoSizeWidth = param1;
         this.invalidate(InvalidationType.POSITION);
         this.invalidate(InvalidationType.SIZE);
      }
      
      public function get autoSizeHeight() : Boolean
      {
         return this._autoSizeHeight;
      }
      
      public function set autoSizeHeight(param1:Boolean) : void
      {
         this._autoSizeHeight = param1;
         this.invalidate(InvalidationType.POSITION);
         this.invalidate(InvalidationType.SIZE);
      }
      
      public function set autoSizeMode(param1:String) : void
      {
         this._alignment.autoSizeMode = param1;
         this.invalidate(InvalidationType.POSITION);
         this.invalidate(InvalidationType.SIZE);
      }
      
      public function get autoSizeMode() : String
      {
         return this._alignment.autoSizeMode;
      }
      
      public function set sizeHandling(param1:uint) : void
      {
         this._sizeHandling = param1;
      }
      
      public function get sizeHandling() : uint
      {
         return this._sizeHandling;
      }
      
      public function set relativeWidth(param1:Number) : void
      {
         this._relativeWidth = param1 <= 0 ? 0 : (param1 >= 1 ? 1 : param1);
      }
      
      public function get relativeWidth() : Number
      {
         return this._relativeWidth;
      }
      
      public function set relativeHeight(param1:Number) : void
      {
         this._relativeHeight = param1 <= 0 ? 0 : (param1 >= 1 ? 1 : param1);
      }
      
      public function get relativeHeight() : Number
      {
         return this._relativeHeight;
      }
      
      public function set alignX(param1:String) : void
      {
         this._alignment.alignmentX = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function get alignX() : String
      {
         return this._alignment.alignmentX;
      }
      
      public function set alignY(param1:String) : void
      {
         this._alignment.alignmentY = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function get alignY() : String
      {
         return this._alignment.alignmentY;
      }
      
      public function setAlignmentActivation(param1:uint, param2:Boolean = true) : void
      {
         this._alignment.setAlignmentActivation(param1,param2);
      }
      
      public function set marginX(param1:Number) : void
      {
         this._alignment.marginX = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function set marginY(param1:Number) : void
      {
         this._alignment.marginY = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function set marginLeft(param1:Number) : void
      {
         this._alignment.marginLeft = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function get marginLeft() : Number
      {
         return this._alignment.marginLeft;
      }
      
      public function get marginRight() : Number
      {
         return this._alignment.marginRight;
      }
      
      public function set marginRight(param1:Number) : void
      {
         this._alignment.marginRight = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function set marginTop(param1:Number) : void
      {
         this._alignment.marginTop = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function get marginTop() : Number
      {
         return this._alignment.marginTop;
      }
      
      public function get marginBottom() : Number
      {
         return this._alignment.marginBottom;
      }
      
      public function set marginBottom(param1:Number) : void
      {
         this._alignment.marginBottom = param1;
         this.invalidate(InvalidationType.POSITION);
      }
      
      public function set skin(param1:ISkin) : void
      {
         var _loc3_:* = null;
         if(this._skin != null)
         {
            _loc3_ = this._skin as DisplayObject;
            this.removeChild(_loc3_);
         }
         this._skin = param1;
         var _loc2_:DisplayObject = this._skin as DisplayObject;
         _loc2_.visible = false;
         this.addChild(_loc2_);
         this.invalidate(InvalidationType.SKIN);
      }
      
      public function get skin() : ISkin
      {
         return this._skin;
      }
      
      public function set registeredSkinName(param1:String) : void
      {
         this.skin = SkinRepository.getInstance().getSkin(param1);
      }
      
      public function setSkinState(param1:String) : void
      {
         if(this.getCurrentSkinState() != param1)
         {
            this.skin.state = param1;
         }
      }
      
      public function getCurrentSkinState() : String
      {
         return this.skin.getCurrentState();
      }
      
      private function attemptToSetSkinMask() : void
      {
         if(this._skin)
         {
            this._skinMask = this._skin.getSkinLayer(SkinLayerNames.MASK) as Sprite;
            this.maskWithSkin();
         }
      }
      
      protected function maskWithSkin() : void
      {
         if(this._skinMask)
         {
            if(this.contains(this._skinMask))
            {
               this.removeChild(this._skinMask);
            }
            this.addChild(this._skinMask);
            this._skinMask.cacheAsBitmap = this._cacheSkinMaskAsBitmap;
            this.cacheAsBitmap = this._cacheSkinMaskAsBitmap;
            this._skinMask.mouseEnabled = false;
            this.mask = this._skinMask;
         }
      }
      
      public function set cacheSkinMaskAsBitmap(param1:Boolean) : void
      {
         this._cacheSkinMaskAsBitmap = param1;
      }
      
      public function get cacheSkinMaskAsBitmap() : Boolean
      {
         return this._cacheSkinMaskAsBitmap;
      }
      
      public function getChildByNameRecursively(param1:String) : ICoreponent
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:ICoreponent = this.getChildByName(param1) as ICoreponent;
         if(_loc2_)
         {
            return _loc2_;
         }
         _loc3_ = this.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc5_ = this.getChildAt(_loc4_) as ICoreponent)
            {
               if(_loc6_ = _loc5_.getChildByNameRecursively(param1))
               {
                  return _loc6_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public function selectChild(param1:String) : ICoreponent
      {
         return FuiComponentSelectorUtil.selectComponent(param1,this);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return super.addChild(param1);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return super.removeChild(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         if(this.numChildren == 0)
         {
            return null;
         }
         return super.removeChildAt(param1);
      }
      
      override public function removeChildren(param1:int = 0, param2:int = 2147483647) : void
      {
         this.removeAllCoreponents();
         super.removeChildren();
      }
      
      public function removeAllCoreponents() : void
      {
         var _loc3_:* = null;
         var _loc1_:Vector.<ICoreponent> = this.getAllCoreponentChildren();
         var _loc2_:Number = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc3_.dispose();
            _loc2_++;
         }
      }
      
      public function getAllCoreponentChildren() : Vector.<ICoreponent>
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:Vector.<ICoreponent> = new Vector.<ICoreponent>();
         var _loc2_:int = 0;
         while(_loc2_ < this.numChildren)
         {
            _loc3_ = this.getChildAt(_loc2_);
            if(_loc4_ = _loc3_ as ICoreponent)
            {
               _loc1_.push(_loc4_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get ID() : String
      {
         return name + "_" + this._ID.toString();
      }
      
      public function get bindingID() : String
      {
         return this._BINDING_ID_;
      }
      
      public function set bindingID(param1:String) : void
      {
         this._BINDING_ID_ = param1;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.invalidate(InvalidationType.ENABLE);
         }
         if(this._enabled)
         {
            this.mouseEnabled = this._mouseEnabled;
            this.mouseChildren = this._mouseChildrenEnabled;
         }
         else
         {
            this.mouseEnabled = false;
            this.mouseChildren = false;
         }
      }
      
      public function isEnabled() : Boolean
      {
         return this._enabled;
      }
      
      public function get tooltipTemplateID() : String
      {
         return this._tooltipTemplateID;
      }
      
      public function set tooltipTemplateID(param1:String) : void
      {
         this._tooltipTemplateID = param1;
      }
      
      public function get tooltipDataAssigner() : ITooltipDataAssigner
      {
         return this._tooltipDataAssigner;
      }
      
      public function set tooltipDataAssigner(param1:ITooltipDataAssigner) : void
      {
         this._tooltipDataAssigner = param1;
      }
      
      public function get tooltipData() : Object
      {
         return this._tooltipData;
      }
      
      public function set tooltipData(param1:Object) : void
      {
         this._tooltipData = param1;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         super.mouseEnabled = param1;
         if(param1)
         {
            this.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonRollover);
            this.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonRollout);
         }
         else
         {
            this.removeEventListener(MouseEvent.MOUSE_OVER,this.handleButtonRollover);
            this.removeEventListener(MouseEvent.MOUSE_OUT,this.handleButtonRollout);
         }
      }
      
      protected function handleButtonRollover(param1:MouseEvent) : void
      {
         if(this._tooltipData == null || this._tooltipTemplateID == null || !this.isEnabled())
         {
            return;
         }
         if(this.tooltipTemplateID)
         {
            UISystem.getInstance().tooltipManager.assignTooltipTemplateID(this.tooltipTemplateID,this);
         }
      }
      
      protected function handleButtonRollout(param1:MouseEvent) : void
      {
         if(this._tooltipData == null || this._tooltipTemplateID == null || !this.isEnabled())
         {
            return;
         }
         if(this.tooltipTemplateID)
         {
            UISystem.getInstance().tooltipManager.attemptToRemoveTooltip();
         }
      }
      
      public function focused() : void
      {
      }
      
      public function unfocused() : void
      {
      }
      
      public function set focusGroupId(param1:String) : void
      {
         this._focusGroupId = param1;
      }
      
      public function get focusGroupId() : String
      {
         return this._focusGroupId;
      }
      
      protected function drawDebugBorder() : void
      {
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,16777215 * Number(class_266.method_2266(this._ID,0,1)),0.5);
         _loc1_.beginFill(13421772,0.1);
         _loc1_.drawRect(0,0,this.getCalculatedWidth(),this.getCalculatedHeight());
         _loc1_.endFill();
      }
   }
}
