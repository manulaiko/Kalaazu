package spark.components
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.SoftKeyboardEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.Dictionary;
   import flash.utils.setInterval;
   import mx.core.EventPriority;
   import mx.core.FlexGlobals;
   import mx.core.IInvalidating;
   import mx.core.InteractionMode;
   import mx.core.Singleton;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.managers.FocusManager;
   import mx.managers.IActiveWindowManager;
   import mx.managers.ILayoutManager;
   import mx.managers.ISystemManager;
   import mx.managers.SystemManager;
   import mx.managers.ToolTipManager;
   import mx.utils.BitFlagUtil;
   import mx.utils.DensityUtil;
   import mx.utils.LoaderUtil;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class Application extends SkinnableContainer
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const CONTROLBAR_PROPERTY_FLAG:uint = 1;
      
      private static const LAYOUT_PROPERTY_FLAG:uint = 2;
      
      private static const VISIBLE_PROPERTY_FLAG:uint = 4;
      
      private static var _softKeyboardBehavior:String = null;
       
      
      private var isIOS:Boolean = false;
      
      private var softKeyboardTarget:Object = null;
      
      private var explicitSizingForOrientation:Boolean = false;
      
      private var cachedDimensions:Dictionary;
      
      private var previousWidth:Number;
      
      private var previousHeight:Number;
      
      private var keyboardActiveInOrientationChange:Boolean = false;
      
      private var resizeHandlerAdded:Boolean = false;
      
      private var percentBoundsChanged:Boolean;
      
      private var preloadObj:Object;
      
      private var resizeWidth:Boolean = true;
      
      private var resizeHeight:Boolean = true;
      
      mx_internal var isSoftKeyboardActive:Boolean = false;
      
      private var synchronousResize:Boolean = false;
      
      private var viewSourceCMI:ContextMenuItem;
      
      private var controlBarGroupProperties:Object;
      
      [SkinPart(required="false")]
      public var controlBarGroup:Group;
      
      public var frameRate:Number;
      
      public var pageTitle:String;
      
      public var preloader:Object;
      
      public var preloaderChromeColor:uint;
      
      public var scriptRecursionLimit:int;
      
      public var scriptTimeLimit:Number;
      
      public var splashScreenScaleMode:String;
      
      public var splashScreenMinimumDisplayTime:Number;
      
      private var _applicationDPI:Number = NaN;
      
      public var usePreloader:Boolean;
      
      mx_internal var _parameters:Object;
      
      private var _resizeForSoftKeyboard:Boolean = false;
      
      mx_internal var _url:String;
      
      private var _viewSourceURL:String;
      
      public function Application()
      {
         this.controlBarGroupProperties = {"visible":true};
         UIComponentGlobals.mx_internal::layoutManager = ILayoutManager(Singleton.getInstance("mx.managers::ILayoutManager"));
         UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = true;
         if(true)
         {
            FlexGlobals.topLevelApplication = this;
         }
         super();
         showInAutomationHierarchy = true;
         this.initResizeBehavior();
      }
      
      mx_internal static function get softKeyboardBehavior() : String
      {
         var nativeApp:Object = null;
         var appXML:XML = null;
         var ns:Namespace = null;
         if(_softKeyboardBehavior != null)
         {
            return _softKeyboardBehavior;
         }
         nativeApp = FlexGlobals.topLevelApplication.systemManager.getDefinitionByName("flash.desktop.NativeApplication");
         if(nativeApp)
         {
            try
            {
               appXML = XML(nativeApp["nativeApplication"]["applicationDescriptor"]);
               ns = appXML.namespace();
               _softKeyboardBehavior = String(appXML..ns::softKeyboardBehavior);
            }
            catch(e:Error)
            {
               _softKeyboardBehavior = "";
            }
         }
         else
         {
            _softKeyboardBehavior = "";
         }
         return _softKeyboardBehavior;
      }
      
      private function get scaleFactor() : Number
      {
         if(systemManager)
         {
            return (systemManager as SystemManager).mx_internal::densityScale;
         }
         return 1;
      }
      
      public function get colorCorrection() : String
      {
         var _loc1_:* = null;
         try
         {
            _loc1_ = systemManager;
            if(Boolean(_loc1_) && Boolean(_loc1_.stage))
            {
               return _loc1_.stage.colorCorrection;
            }
         }
         catch(e:SecurityError)
         {
         }
         return null;
      }
      
      public function set colorCorrection(param1:String) : void
      {
         var _loc2_:ISystemManager = systemManager;
         if(_loc2_ && _loc2_.stage && Boolean(_loc2_.isTopLevelRoot()))
         {
            _loc2_.stage.colorCorrection = param1;
         }
      }
      
      public function get controlBarContent() : Array
      {
         if(this.controlBarGroup)
         {
            return this.controlBarGroup.mx_internal::getMXMLContent();
         }
         return this.controlBarGroupProperties.controlBarContent;
      }
      
      public function set controlBarContent(param1:Array) : void
      {
         if(this.controlBarGroup)
         {
            this.controlBarGroup.mxmlContent = param1;
            this.controlBarGroupProperties = BitFlagUtil.update(this.controlBarGroupProperties as uint,CONTROLBAR_PROPERTY_FLAG,param1 != null);
         }
         else
         {
            this.controlBarGroupProperties.controlBarContent = param1;
         }
         invalidateSkinState();
      }
      
      public function get controlBarLayout() : LayoutBase
      {
         return !!this.controlBarGroup ? this.controlBarGroup.layout : this.controlBarGroupProperties.layout;
      }
      
      public function set controlBarLayout(param1:LayoutBase) : void
      {
         if(this.controlBarGroup)
         {
            this.controlBarGroup.layout = param1;
            this.controlBarGroupProperties = BitFlagUtil.update(this.controlBarGroupProperties as uint,LAYOUT_PROPERTY_FLAG,true);
         }
         else
         {
            this.controlBarGroupProperties.layout = param1;
         }
      }
      
      public function get controlBarVisible() : Boolean
      {
         return !!this.controlBarGroup ? this.controlBarGroup.visible : Boolean(this.controlBarGroupProperties.visible);
      }
      
      public function set controlBarVisible(param1:Boolean) : void
      {
         if(this.controlBarGroup)
         {
            this.controlBarGroup.visible = param1;
            this.controlBarGroupProperties = BitFlagUtil.update(this.controlBarGroupProperties as uint,VISIBLE_PROPERTY_FLAG,param1);
         }
         else
         {
            this.controlBarGroupProperties.visible = param1;
         }
         invalidateSkinState();
         if(skin)
         {
            skin.invalidateSize();
         }
      }
      
      public function get splashScreenImage() : Class
      {
         return systemManager.info()["splashScreenImage"];
      }
      
      public function set splashScreenImage(param1:Class) : void
      {
         systemManager.info()["splashScreenImage"] = param1;
      }
      
      public function get applicationDPI() : Number
      {
         var _loc1_:* = null;
         if(isNaN(this._applicationDPI))
         {
            _loc1_ = systemManager.info()["applicationDPI"];
            this._applicationDPI = !!_loc1_ ? Number(_loc1_) : this.runtimeDPI;
         }
         return this._applicationDPI;
      }
      
      public function set applicationDPI(param1:Number) : void
      {
      }
      
      public function get runtimeDPI() : Number
      {
         return DensityUtil.getRuntimeDPI();
      }
      
      public function get runtimeDPIProvider() : Class
      {
         return systemManager.info()["runtimeDPIProvider"];
      }
      
      public function set runtimeDPIProvider(param1:Class) : void
      {
      }
      
      override public function get id() : String
      {
         if(!super.id && this == FlexGlobals.topLevelApplication && false)
         {
            return ExternalInterface.objectID;
         }
         return super.id;
      }
      
      override public function set percentHeight(param1:Number) : void
      {
         if(param1 != super.percentHeight)
         {
            super.percentHeight = param1;
            this.percentBoundsChanged = true;
            invalidateProperties();
         }
      }
      
      override public function set percentWidth(param1:Number) : void
      {
         if(param1 != super.percentWidth)
         {
            super.percentWidth = param1;
            this.percentBoundsChanged = true;
            invalidateProperties();
         }
      }
      
      override public function set tabIndex(param1:int) : void
      {
      }
      
      override public function set toolTip(param1:String) : void
      {
      }
      
      public function get aspectRatio() : String
      {
         var _loc1_:Number = height;
         if(this.mx_internal::isSoftKeyboardActive && mx_internal::softKeyboardBehavior == "none" && this.resizeForSoftKeyboard)
         {
            _loc1_ += stage.softKeyboardRect.height;
         }
         return width > _loc1_ ? "landscape" : "portrait";
      }
      
      public function get parameters() : Object
      {
         return this.mx_internal::_parameters;
      }
      
      public function get resizeForSoftKeyboard() : Boolean
      {
         return this._resizeForSoftKeyboard;
      }
      
      public function set resizeForSoftKeyboard(param1:Boolean) : void
      {
         if(this._resizeForSoftKeyboard != param1)
         {
            this._resizeForSoftKeyboard = param1;
         }
      }
      
      public function get url() : String
      {
         return this.mx_internal::_url;
      }
      
      public function get viewSourceURL() : String
      {
         return this._viewSourceURL;
      }
      
      public function set viewSourceURL(param1:String) : void
      {
         this._viewSourceURL = param1;
      }
      
      override protected function invalidateParentSizeAndDisplayList() : void
      {
         if(!includeInLayout)
         {
            return;
         }
         var _loc1_:IInvalidating = parent as IInvalidating;
         if(!_loc1_)
         {
            if(parent is ISystemManager)
            {
               ISystemManager(parent).invalidateParentSizeAndDisplayList();
            }
            return;
         }
         super.invalidateParentSizeAndDisplayList();
      }
      
      override public function initialize() : void
      {
         var _loc1_:ISystemManager = systemManager;
         if(hasEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR))
         {
            systemManager.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorRedispatcher);
         }
         this.isIOS = Capabilities.version.indexOf("IOS") == 0;
         if(this.isIOS && _loc1_ && _loc1_.stage && Boolean(_loc1_.isTopLevelRoot()))
         {
            _loc1_.stage.addEventListener("orientationChanging",this.stage_orientationChangingHandler);
            _loc1_.stage.addEventListener("orientationChange",this.stage_orientationChange);
         }
         this.mx_internal::_url = LoaderUtil.normalizeURL(_loc1_.loaderInfo);
         this.mx_internal::_parameters = _loc1_.loaderInfo.parameters;
         this.initManagers(_loc1_);
         this.initContextMenu();
         super.initialize();
         if(Boolean(_loc1_.isTopLevel()) && false)
         {
            setInterval(this.debugTickler,1500);
         }
      }
      
      private function stage_orientationChangingHandler(param1:Event) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:ISystemManager = systemManager;
         if(!stage || !isNaN(explicitWidth) || !isNaN(explicitHeight))
         {
            return;
         }
         if(!this.cachedDimensions)
         {
            this.cachedDimensions = new Dictionary();
         }
         this.previousWidth = width;
         this.previousHeight = height;
         var _loc3_:String = width + ":" + height;
         this.keyboardActiveInOrientationChange = this.mx_internal::isSoftKeyboardActive;
         var _loc4_:String = param1["beforeOrientation"];
         var _loc5_:String = param1["afterOrientation"];
         if(_loc4_ == "default" && _loc5_ == "upsideDown" || _loc4_ == "upsideDown" && _loc5_ == "default" || _loc4_ == "rotatedLeft" && _loc5_ == "rotatedRight" || _loc4_ == "rotatedRight" && _loc5_ == "rotatedLeft")
         {
            return;
         }
         if(this.cachedDimensions[_loc3_])
         {
            _loc6_ = Number(this.cachedDimensions[_loc3_].width);
            _loc7_ = Number(this.cachedDimensions[_loc3_].height);
         }
         else
         {
            _loc6_ = !!stage ? 0 / this.scaleFactor : height;
            _loc7_ = width;
         }
         setActualSize(_loc6_,_loc7_);
         this.explicitSizingForOrientation = true;
         validateNow();
      }
      
      private function stage_orientationChange(param1:Event) : void
      {
         if(!stage || !this.explicitSizingForOrientation)
         {
            return;
         }
         if(!this.keyboardActiveInOrientationChange)
         {
            this.updateScreenSizeCache(0 / this.scaleFactor,0 / this.scaleFactor);
         }
         this.explicitSizingForOrientation = false;
      }
      
      private function updateScreenSizeCache(param1:Number, param2:Number) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.previousWidth == param1 && this.previousHeight == param2)
         {
            return;
         }
         var _loc3_:String = this.previousWidth + ":" + this.previousHeight;
         if(this.cachedDimensions[_loc3_])
         {
            this.cachedDimensions[_loc3_].width = param1;
            this.cachedDimensions[_loc3_].height = param2;
         }
         else
         {
            _loc4_ = this.previousWidth + ":" + this.previousHeight;
            _loc5_ = param1 + ":" + param2;
            this.cachedDimensions[_loc4_] = {
               "width":param1,
               "height":param2
            };
            this.cachedDimensions[_loc5_] = {
               "width":this.previousWidth,
               "height":this.previousHeight
            };
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:* = null;
         super.createChildren();
         if(mx_internal::softKeyboardBehavior != "")
         {
            this.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE,this.softKeyboardActivateHandler,true,EventPriority.DEFAULT,true);
            this.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.softKeyboardDeactivateHandler,true,EventPriority.DEFAULT,true);
            _loc1_ = FlexGlobals.topLevelApplication.systemManager.getDefinitionByName("flash.desktop.NativeApplication");
            if(Boolean(_loc1_) && Boolean(_loc1_["nativeApplication"]))
            {
               EventDispatcher(_loc1_["nativeApplication"]).addEventListener(Event.DEACTIVATE,this.nativeApplication_deactivateHandler);
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         this.resizeWidth = isNaN(explicitWidth);
         this.resizeHeight = isNaN(explicitHeight);
         if(this.resizeWidth || this.resizeHeight)
         {
            this.resizeHandler(new Event(Event.RESIZE));
            if(!this.resizeHandlerAdded)
            {
               systemManager.addEventListener(Event.RESIZE,this.resizeHandler,false,0,true);
               this.resizeHandlerAdded = true;
            }
         }
         else if(this.resizeHandlerAdded)
         {
            systemManager.removeEventListener(Event.RESIZE,this.resizeHandler);
            this.resizeHandlerAdded = false;
         }
         if(this.percentBoundsChanged)
         {
            this.updateBounds();
            this.percentBoundsChanged = false;
         }
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         if(this.viewSourceCMI)
         {
            this.viewSourceCMI.caption = resourceManager.getString("components","viewSource");
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:* = 0;
         super.partAdded(param1,param2);
         if(param2 == this.controlBarGroup)
         {
            _loc3_ = 0;
            if(this.controlBarGroupProperties.controlBarContent !== undefined)
            {
               this.controlBarGroup.mxmlContent = this.controlBarGroupProperties.controlBarContent;
               _loc3_ = BitFlagUtil.update(_loc3_,CONTROLBAR_PROPERTY_FLAG,true);
            }
            if(this.controlBarGroupProperties.layout !== undefined)
            {
               this.controlBarGroup.layout = this.controlBarGroupProperties.layout;
               _loc3_ = BitFlagUtil.update(_loc3_,LAYOUT_PROPERTY_FLAG,true);
            }
            if(this.controlBarGroupProperties.visible !== undefined)
            {
               this.controlBarGroup.visible = this.controlBarGroupProperties.visible;
               _loc3_ = BitFlagUtil.update(_loc3_,VISIBLE_PROPERTY_FLAG,true);
            }
            this.controlBarGroupProperties = _loc3_;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         super.partRemoved(param1,param2);
         if(param2 == this.controlBarGroup)
         {
            _loc3_ = {};
            if(BitFlagUtil.isSet(this.controlBarGroupProperties as uint,CONTROLBAR_PROPERTY_FLAG))
            {
               _loc3_.controlBarContent = this.controlBarGroup.mx_internal::getMXMLContent();
            }
            if(BitFlagUtil.isSet(this.controlBarGroupProperties as uint,LAYOUT_PROPERTY_FLAG))
            {
               _loc3_.layout = this.controlBarGroup.layout;
            }
            if(BitFlagUtil.isSet(this.controlBarGroupProperties as uint,VISIBLE_PROPERTY_FLAG))
            {
               _loc3_.visible = this.controlBarGroup.visible;
            }
            this.controlBarGroupProperties = _loc3_;
            this.controlBarGroup.mxmlContent = null;
            this.controlBarGroup.layout = null;
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         var _loc1_:* = enabled ? "normal" : "disabled";
         if(this.controlBarGroup)
         {
            if(BitFlagUtil.isSet(this.controlBarGroupProperties as uint,CONTROLBAR_PROPERTY_FLAG) && BitFlagUtil.isSet(this.controlBarGroupProperties as uint,VISIBLE_PROPERTY_FLAG))
            {
               _loc1_ += "WithControlBar";
            }
         }
         else if(Boolean(this.controlBarGroupProperties.controlBarContent) && Boolean(this.controlBarGroupProperties.visible))
         {
            _loc1_ += "WithControlBar";
         }
         return _loc1_;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(!param1 || param1 == "styleName" || param1 == "interactionMode")
         {
            ToolTipManager.enabled = getStyle("interactionMode") != InteractionMode.TOUCH;
         }
      }
      
      override mx_internal function setUnscaledHeight(param1:Number) : void
      {
         invalidateProperties();
         super.mx_internal::setUnscaledHeight(param1);
      }
      
      override mx_internal function setUnscaledWidth(param1:Number) : void
      {
         invalidateProperties();
         super.mx_internal::setUnscaledWidth(param1);
      }
      
      private function debugTickler() : void
      {
      }
      
      private function initManagers(param1:ISystemManager) : void
      {
         var _loc2_:* = null;
         if(param1.isTopLevel())
         {
            focusManager = new FocusManager(this);
            _loc2_ = IActiveWindowManager(param1.getImplementation("mx.managers::IActiveWindowManager"));
            if(_loc2_)
            {
               _loc2_.activate(this);
            }
            else
            {
               focusManager.activate();
            }
         }
      }
      
      private function initContextMenu() : void
      {
         var _loc2_:* = null;
         if(flexContextMenu != null)
         {
            if(systemManager is InteractiveObject)
            {
               InteractiveObject(systemManager).contextMenu = contextMenu as ContextMenu;
            }
            return;
         }
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         _loc1_.builtInItems.print = true;
         if(this._viewSourceURL)
         {
            _loc2_ = resourceManager.getString("components","viewSource");
            this.viewSourceCMI = new ContextMenuItem(_loc2_,true);
            this.viewSourceCMI.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.menuItemSelectHandler);
            if(_loc1_.customItems)
            {
               _loc1_.customItems.push(this.viewSourceCMI);
            }
         }
         contextMenu = _loc1_;
         if(systemManager is InteractiveObject)
         {
            InteractiveObject(systemManager).contextMenu = _loc1_;
         }
      }
      
      private function initResizeBehavior() : void
      {
         var _loc1_:Array = Capabilities.version.split(" ")[1].split(",");
         var _loc2_:String = Capabilities.version.substr(0,3).toLowerCase();
         var _loc3_:Boolean = _loc2_ != "win" && _loc2_ != "mac" && _loc2_ != "lnx";
         this.synchronousResize = (parseFloat(_loc1_[0]) > 10 || parseFloat(_loc1_[0]) == 10 && parseFloat(_loc1_[1]) >= 1) && (true || _loc3_);
      }
      
      private function softKeyboardActivateHandler(param1:SoftKeyboardEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this === FlexGlobals.topLevelApplication)
         {
            if(Boolean(this.softKeyboardTarget) && this.softKeyboardTarget != param1.target)
            {
               this.clearSoftKeyboardTarget();
            }
            this.softKeyboardTarget = param1.target;
            this.softKeyboardTarget.addEventListener(Event.REMOVED_FROM_STAGE,this.softKeyboardTarget_removeFromStageHandler,false,EventPriority.DEFAULT,true);
            if(this.isIOS)
            {
               this.softKeyboardTarget.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.softKeyboardDeactivateHandler,false,EventPriority.DEFAULT,true);
            }
            _loc2_ = stage.softKeyboardRect;
            if(_loc2_.height > 0)
            {
               this.mx_internal::isSoftKeyboardActive = true;
            }
            if(mx_internal::softKeyboardBehavior == "none" && this.resizeForSoftKeyboard)
            {
               _loc3_ = (0 - _loc2_.height) / this.scaleFactor;
               _loc4_ = 0 / this.scaleFactor;
               if(_loc3_ != height || _loc4_ != width)
               {
                  setActualSize(_loc4_,_loc3_);
                  validateNow();
               }
               if(this.keyboardActiveInOrientationChange)
               {
                  this.keyboardActiveInOrientationChange = false;
                  this.updateScreenSizeCache(_loc4_,_loc3_);
               }
            }
         }
      }
      
      private function softKeyboardDeactivateHandler(param1:SoftKeyboardEvent) : void
      {
         if(this === FlexGlobals.topLevelApplication && this.mx_internal::isSoftKeyboardActive)
         {
            if(this.softKeyboardTarget)
            {
               this.clearSoftKeyboardTarget();
            }
            this.mx_internal::isSoftKeyboardActive = false;
            if(mx_internal::softKeyboardBehavior == "none" && this.resizeForSoftKeyboard && !this.keyboardActiveInOrientationChange)
            {
               setActualSize(0 / this.scaleFactor,0 / this.scaleFactor);
               validateNow();
            }
         }
      }
      
      private function nativeApplication_deactivateHandler(param1:Event) : void
      {
         if(this.mx_internal::isSoftKeyboardActive)
         {
            stage.focus = null;
            this.softKeyboardDeactivateHandler(null);
         }
      }
      
      private function softKeyboardTarget_removeFromStageHandler(param1:Event) : void
      {
         if(stage.focus == this.softKeyboardTarget)
         {
            stage.focus = null;
         }
      }
      
      private function clearSoftKeyboardTarget() : void
      {
         if(this.softKeyboardTarget)
         {
            if(this.isIOS)
            {
               this.softKeyboardTarget.removeEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.softKeyboardDeactivateHandler);
            }
            this.softKeyboardTarget.removeEventListener(Event.REMOVED_FROM_STAGE,this.softKeyboardTarget_removeFromStageHandler);
            this.softKeyboardTarget = null;
         }
      }
      
      private function resizeHandler(param1:Event) : void
      {
         if(this.keyboardActiveInOrientationChange)
         {
            return;
         }
         if(!this.percentBoundsChanged)
         {
            this.updateBounds();
            if(this.synchronousResize)
            {
               UIComponentGlobals.mx_internal::layoutManager.validateNow();
            }
         }
      }
      
      protected function menuItemSelectHandler(param1:Event) : void
      {
         navigateToURL(new URLRequest(this._viewSourceURL),"_blank");
      }
      
      private function updateBounds() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.keyboardActiveInOrientationChange)
         {
            return;
         }
         if(this.resizeWidth)
         {
            if(isNaN(percentWidth))
            {
               _loc1_ = Number(DisplayObject(systemManager).width);
            }
            else
            {
               super.percentWidth = Math.max(percentWidth,0);
               super.percentWidth = Math.min(percentWidth,100);
               _loc1_ = percentWidth * Number(DisplayObject(systemManager).width) / 100;
            }
            if(!isNaN(explicitMaxWidth))
            {
               _loc1_ = Math.min(_loc1_,explicitMaxWidth);
            }
            if(!isNaN(explicitMinWidth))
            {
               _loc1_ = Math.max(_loc1_,explicitMinWidth);
            }
         }
         else
         {
            _loc1_ = width;
         }
         if(this.resizeHeight)
         {
            if(isNaN(percentHeight))
            {
               _loc2_ = Number(DisplayObject(systemManager).height);
            }
            else
            {
               super.percentHeight = Math.max(percentHeight,0);
               super.percentHeight = Math.min(percentHeight,100);
               _loc2_ = percentHeight * Number(DisplayObject(systemManager).height) / 100;
            }
            if(!isNaN(explicitMaxHeight))
            {
               _loc2_ = Math.min(_loc2_,explicitMaxHeight);
            }
            if(!isNaN(explicitMinHeight))
            {
               _loc2_ = Math.max(_loc2_,explicitMinHeight);
            }
         }
         else
         {
            _loc2_ = height;
         }
         if(_loc1_ != width || _loc2_ != height)
         {
            invalidateProperties();
            invalidateSize();
         }
         setActualSize(_loc1_,_loc2_);
         invalidateDisplayList();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(param1 == UncaughtErrorEvent.UNCAUGHT_ERROR && Boolean(systemManager))
         {
            systemManager.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorRedispatcher);
         }
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == UncaughtErrorEvent.UNCAUGHT_ERROR && Boolean(systemManager))
         {
            systemManager.loaderInfo.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorRedispatcher);
         }
      }
      
      private function uncaughtErrorRedispatcher(param1:Event) : void
      {
         if(!dispatchEvent(param1))
         {
            param1.preventDefault();
         }
      }
   }
}
