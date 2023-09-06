package mx.styles
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   import flash.utils.Timer;
   import mx.core.FlexVersion;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexChangeEvent;
   import mx.events.ModuleEvent;
   import mx.events.Request;
   import mx.events.StyleEvent;
   import mx.managers.ISystemManager;
   import mx.managers.SystemManagerGlobals;
   import mx.modules.IModuleInfo;
   import mx.modules.ModuleManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.MediaQueryParser;
   
   public class StyleManagerImpl extends EventDispatcher implements IStyleManager2
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var instance:IStyleManager2;
      
      private static var _qualifiedTypeSelectors:Boolean = true;
      
      private static var propNames:Array = ["class","id","pseudo","unconditional"];
       
      
      private var selectorIndex:int = 0;
      
      private var mqp:MediaQueryParser;
      
      private var inheritingTextFormatStyles:Object;
      
      private var sizeInvalidatingStyles:Object;
      
      private var parentSizeInvalidatingStyles:Object;
      
      private var parentDisplayListInvalidatingStyles:Object;
      
      private var colorNames:Object;
      
      private var _hasAdvancedSelectors:Boolean;
      
      private var _pseudoCSSStates:Object;
      
      private var _selectors:Object;
      
      private var styleModules:Object;
      
      private var _subjects:Object;
      
      private var resourceManager:IResourceManager;
      
      private var mergedInheritingStylesCache:Object;
      
      private var moduleFactory:IFlexModuleFactory;
      
      private var _parent:IStyleManager2;
      
      private var _stylesRoot:Object;
      
      private var _inheritingStyles:Object;
      
      private var _typeHierarchyCache:Object;
      
      private var _typeSelectorCache:Object;
      
      public function StyleManagerImpl(param1:IFlexModuleFactory)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.inheritingTextFormatStyles = {
            "align":true,
            "bold":true,
            "color":true,
            "font":true,
            "indent":true,
            "italic":true,
            "size":true
         };
         this.sizeInvalidatingStyles = {
            "alignmentBaseline":true,
            "baselineShift":true,
            "blockProgression":true,
            "borderStyle":true,
            "borderThickness":true,
            "breakOpportunity":true,
            "cffHinting":true,
            "columnCount":true,
            "columnGap":true,
            "columnWidth":true,
            "digitCase":true,
            "digitWidth":true,
            "direction":true,
            "dominantBaseline":true,
            "firstBaselineOffset":true,
            "fontAntiAliasType":true,
            "fontFamily":true,
            "fontGridFitType":true,
            "fontLookup":true,
            "fontSharpness":true,
            "fontSize":true,
            "fontStyle":true,
            "fontThickness":true,
            "fontWeight":true,
            "headerHeight":true,
            "horizontalAlign":true,
            "horizontalGap":true,
            "justificationRule":true,
            "justificationStyle":true,
            "kerning":true,
            "leading":true,
            "leadingModel":true,
            "letterSpacing":true,
            "ligatureLevel":true,
            "lineBreak":true,
            "lineHeight":true,
            "lineThrough":true,
            "listAutoPadding":true,
            "listStylePosition":true,
            "listStyleType":true,
            "locale":true,
            "marginBottom":true,
            "marginLeft":true,
            "marginRight":true,
            "marginTop":true,
            "paddingBottom":true,
            "paddingLeft":true,
            "paddingRight":true,
            "paddingTop":true,
            "paragraphEndIndent":true,
            "paragraphStartIndent":true,
            "paragraphSpaceAfter":true,
            "paragraphSpaceBefore":true,
            "renderingMode":true,
            "strokeWidth":true,
            "tabHeight":true,
            "tabWidth":true,
            "tabStops":true,
            "textAlign":true,
            "textAlignLast":true,
            "textDecoration":true,
            "textIndent":true,
            "textJustify":true,
            "textRotation":true,
            "tracking":true,
            "trackingLeft":true,
            "trackingRight":true,
            "typographicCase":true,
            "verticalAlign":true,
            "verticalGap":true,
            "wordSpacing":true,
            "whitespaceCollapse":true
         };
         this.parentSizeInvalidatingStyles = {
            "baseline":true,
            "bottom":true,
            "horizontalCenter":true,
            "left":true,
            "right":true,
            "top":true,
            "verticalCenter":true
         };
         this.parentDisplayListInvalidatingStyles = {
            "baseline":true,
            "bottom":true,
            "horizontalCenter":true,
            "left":true,
            "right":true,
            "top":true,
            "verticalCenter":true
         };
         this.colorNames = {
            "transparent":"transparent",
            "black":0,
            "blue":255,
            "green":32768,
            "gray":8421504,
            "silver":12632256,
            "lime":65280,
            "olive":8421376,
            "white":16777215,
            "yellow":16776960,
            "maroon":8388608,
            "navy":128,
            "red":16711680,
            "purple":8388736,
            "teal":32896,
            "fuchsia":16711935,
            "aqua":65535,
            "magenta":16711935,
            "cyan":65535,
            "halogreen":8453965,
            "haloblue":40447,
            "haloorange":16758272,
            "halosilver":11455193
         };
         this._selectors = {};
         this.styleModules = {};
         this._subjects = {};
         this.resourceManager = ResourceManager.getInstance();
         this._inheritingStyles = {};
         super();
         this.moduleFactory = param1;
         this.moduleFactory.registerImplementation("mx.styles::IStyleManager2",this);
         if(param1 is DisplayObject)
         {
            _loc2_ = new Request(Request.GET_PARENT_FLEX_MODULE_FACTORY_REQUEST);
            DisplayObject(param1).dispatchEvent(_loc2_);
            _loc3_ = _loc2_.value as IFlexModuleFactory;
            if(_loc3_)
            {
               this._parent = IStyleManager2(_loc3_.getImplementation("mx.styles::IStyleManager2"));
               if(this._parent is IEventDispatcher)
               {
                  IEventDispatcher(this._parent).addEventListener(FlexChangeEvent.STYLE_MANAGER_CHANGE,this.styleManagerChangeHandler,false,0,true);
               }
            }
         }
      }
      
      public static function getInstance() : IStyleManager2
      {
         if(!instance)
         {
            instance = IStyleManager2(IFlexModuleFactory(SystemManagerGlobals.topLevelSystemManagers[0]).getImplementation("mx.styles::IStyleManager2"));
            if(!instance)
            {
               instance = new StyleManagerImpl(SystemManagerGlobals.topLevelSystemManagers[0]);
            }
         }
         return instance;
      }
      
      public function get parent() : IStyleManager2
      {
         return this._parent;
      }
      
      public function get qualifiedTypeSelectors() : Boolean
      {
         if(false)
         {
            return false;
         }
         if(_qualifiedTypeSelectors)
         {
            return _qualifiedTypeSelectors;
         }
         if(this.parent)
         {
            return this.parent.qualifiedTypeSelectors;
         }
         return false;
      }
      
      public function set qualifiedTypeSelectors(param1:Boolean) : void
      {
         _qualifiedTypeSelectors = param1;
      }
      
      public function get stylesRoot() : Object
      {
         return this._stylesRoot;
      }
      
      public function set stylesRoot(param1:Object) : void
      {
         this._stylesRoot = param1;
      }
      
      public function get inheritingStyles() : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.mergedInheritingStylesCache)
         {
            return this.mergedInheritingStylesCache;
         }
         var _loc1_:Object = this._inheritingStyles;
         if(this.parent)
         {
            _loc2_ = this.parent.inheritingStyles;
            for(_loc3_ in _loc2_)
            {
               if(_loc1_[_loc3_] === undefined)
               {
                  _loc1_[_loc3_] = _loc2_[_loc3_];
               }
            }
         }
         this.mergedInheritingStylesCache = _loc1_;
         return _loc1_;
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
         this._inheritingStyles = param1;
         this.mergedInheritingStylesCache = null;
         if(hasEventListener(FlexChangeEvent.STYLE_MANAGER_CHANGE))
         {
            this.dispatchInheritingStylesChangeEvent();
         }
      }
      
      public function get typeHierarchyCache() : Object
      {
         if(this._typeHierarchyCache == null)
         {
            this._typeHierarchyCache = {};
         }
         return this._typeHierarchyCache;
      }
      
      public function set typeHierarchyCache(param1:Object) : void
      {
         this._typeHierarchyCache = param1;
      }
      
      public function get typeSelectorCache() : Object
      {
         if(this._typeSelectorCache == null)
         {
            this._typeSelectorCache = {};
         }
         return this._typeSelectorCache;
      }
      
      public function set typeSelectorCache(param1:Object) : void
      {
         this._typeSelectorCache = param1;
      }
      
      public function initProtoChainRoots() : void
      {
         var _loc1_:* = null;
         if(!this.stylesRoot)
         {
            _loc1_ = this.getMergedStyleDeclaration("global");
            if(_loc1_ != null)
            {
               this.stylesRoot = _loc1_.mx_internal::addStyleToProtoChain({},null);
            }
         }
      }
      
      public function get selectors() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = [];
         for(_loc2_ in this._selectors)
         {
            _loc1_.push(_loc2_);
         }
         if(this.parent)
         {
            _loc3_ = this.parent.selectors;
            for(_loc2_ in _loc3_)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function hasAdvancedSelectors() : Boolean
      {
         if(this._hasAdvancedSelectors)
         {
            return true;
         }
         if(this.parent)
         {
            return this.parent.hasAdvancedSelectors();
         }
         return false;
      }
      
      public function hasPseudoCondition(param1:String) : Boolean
      {
         if(this._pseudoCSSStates != null && this._pseudoCSSStates[param1] != null)
         {
            return true;
         }
         if(this.parent)
         {
            return this.parent.hasPseudoCondition(param1);
         }
         return false;
      }
      
      public function getStyleDeclarations(param1:String) : Object
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(false)
         {
            if(param1.charAt(0) != ".")
            {
               if((_loc4_ = param1.lastIndexOf(".")) != -1)
               {
                  param1 = param1.substr(_loc4_ + 1);
               }
            }
         }
         var _loc2_:* = null;
         if(this.parent)
         {
            _loc2_ = this.parent.getStyleDeclarations(param1);
         }
         var _loc3_:Object = this._subjects[param1];
         if(!_loc2_)
         {
            if(_loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         else if(_loc3_)
         {
            _loc5_ = {};
            for each(_loc6_ in propNames)
            {
               _loc5_[_loc6_] = _loc3_[_loc6_];
            }
            _loc5_.parent = _loc2_;
            _loc2_ = _loc5_;
         }
         return _loc2_;
      }
      
      private function isUnique(param1:*, param2:int, param3:Array) : Boolean
      {
         return param3.indexOf(param1) >= 0;
      }
      
      public function getStyleDeclaration(param1:String) : CSSStyleDeclaration
      {
         var _loc2_:int = 0;
         if(false)
         {
            if(param1.charAt(0) != ".")
            {
               _loc2_ = param1.lastIndexOf(".");
               if(_loc2_ != -1)
               {
                  param1 = param1.substr(_loc2_ + 1);
               }
            }
         }
         return this._selectors[param1];
      }
      
      public function getMergedStyleDeclaration(param1:String) : CSSStyleDeclaration
      {
         var _loc2_:CSSStyleDeclaration = this.getStyleDeclaration(param1);
         var _loc3_:* = null;
         if(this.parent)
         {
            _loc3_ = this.parent.getMergedStyleDeclaration(param1);
         }
         if(Boolean(_loc2_) || Boolean(_loc3_))
         {
            _loc2_ = new CSSMergedStyleDeclaration(_loc2_,_loc3_,!!_loc2_ ? _loc2_.mx_internal::selectorString : _loc3_.mx_internal::selectorString,this,false);
         }
         return _loc2_;
      }
      
      public function setStyleDeclaration(param1:String, param2:CSSStyleDeclaration, param3:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(false)
         {
            if(param1.charAt(0) != ".")
            {
               if((_loc6_ = param1.lastIndexOf(".")) != -1)
               {
                  param1 = param1.substr(_loc6_ + 1);
               }
            }
         }
         ++param2.mx_internal::selectorRefCount;
         param2.selectorIndex = this.selectorIndex++;
         this._selectors[param1] = param2;
         var _loc4_:String = param2.subject;
         if(param1)
         {
            if(!param2.subject)
            {
               param2.mx_internal::selectorString = param1;
               _loc4_ = param2.subject;
            }
            else if(param1 != param2.mx_internal::selectorString)
            {
               if((_loc7_ = param1.charAt(0)) == "." || _loc7_ == ":" || _loc7_ == "#")
               {
                  _loc4_ = "package_1";
               }
               else
               {
                  _loc4_ = param1;
               }
               param2.mx_internal::selectorString = param1;
            }
         }
         if(_loc4_ != null)
         {
            _loc8_ = !!param2.selector.conditions ? param2.selector.conditions[0].kind : "unconditional";
            if((_loc9_ = this._subjects[_loc4_]) == null)
            {
               (_loc9_ = {})[_loc8_] = [param2];
               this._subjects[_loc4_] = _loc9_;
            }
            else if((_loc10_ = _loc9_[_loc8_] as Array) == null)
            {
               _loc9_[_loc8_] = [param2];
            }
            else
            {
               _loc10_.push(param2);
            }
         }
         var _loc5_:String;
         if((_loc5_ = param2.mx_internal::getPseudoCondition()) != null)
         {
            if(this._pseudoCSSStates == null)
            {
               this._pseudoCSSStates = {};
            }
            this._pseudoCSSStates[_loc5_] = true;
         }
         if(param2.mx_internal::isAdvanced())
         {
            this._hasAdvancedSelectors = true;
         }
         if(this._typeSelectorCache)
         {
            this._typeSelectorCache = {};
         }
         if(param3)
         {
            this.styleDeclarationsChanged();
         }
      }
      
      public function clearStyleDeclaration(param1:String, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc3_:CSSStyleDeclaration = this.getStyleDeclaration(param1);
         if(Boolean(_loc3_) && _loc3_.mx_internal::selectorRefCount > 0)
         {
            --_loc3_.mx_internal::selectorRefCount;
         }
         delete this._selectors[param1];
         if(Boolean(_loc3_) && Boolean(_loc3_.subject))
         {
            if(_loc4_ = this._subjects[_loc3_.subject] as Array)
            {
               _loc5_ = _loc4_.length - 1;
               while(_loc5_ >= 0)
               {
                  if((Boolean(_loc6_ = _loc4_[_loc5_])) && _loc6_.mx_internal::selectorString == param1)
                  {
                     if(_loc4_.length == 1)
                     {
                        delete this._subjects[_loc3_.subject];
                     }
                     else
                     {
                        _loc4_.splice(_loc5_,1);
                     }
                  }
                  _loc5_--;
               }
            }
         }
         else
         {
            _loc7_ = false;
            for each(_loc4_ in this._subjects)
            {
               if(_loc4_)
               {
                  _loc5_ = _loc4_.length - 1;
                  while(_loc5_ >= 0)
                  {
                     if((Boolean(_loc6_ = _loc4_[_loc5_])) && _loc6_.mx_internal::selectorString == param1)
                     {
                        _loc7_ = true;
                        if(_loc4_.length == 1)
                        {
                           delete this._subjects[_loc6_.subject];
                        }
                        else
                        {
                           _loc4_.splice(_loc5_,1);
                        }
                     }
                     _loc5_--;
                  }
                  if(_loc7_)
                  {
                     break;
                  }
               }
            }
         }
         if(param2)
         {
            this.styleDeclarationsChanged();
         }
      }
      
      public function styleDeclarationsChanged() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = SystemManagerGlobals.topLevelSystemManagers;
         var _loc2_:int = _loc1_.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = (_loc4_ = _loc1_[_loc3_]).getImplementation("mx.managers::ISystemManagerChildManager");
            Object(_loc5_).regenerateStyleCache(true);
            Object(_loc5_).notifyStyleChangeInChildren(null,true);
            _loc3_++;
         }
      }
      
      public function registerInheritingStyle(param1:String) : void
      {
         if(this._inheritingStyles[param1] != true)
         {
            this._inheritingStyles[param1] = true;
            this.mergedInheritingStylesCache = null;
            if(hasEventListener(FlexChangeEvent.STYLE_MANAGER_CHANGE))
            {
               this.dispatchInheritingStylesChangeEvent();
            }
         }
      }
      
      public function isInheritingStyle(param1:String) : Boolean
      {
         if(this.mergedInheritingStylesCache)
         {
            return this.mergedInheritingStylesCache[param1] == true;
         }
         if(this._inheritingStyles[param1] == true)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isInheritingStyle(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function isInheritingTextFormatStyle(param1:String) : Boolean
      {
         if(this.inheritingTextFormatStyles[param1] == true)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isInheritingTextFormatStyle(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function registerSizeInvalidatingStyle(param1:String) : void
      {
         this.sizeInvalidatingStyles[param1] = true;
      }
      
      public function isSizeInvalidatingStyle(param1:String) : Boolean
      {
         if(this.sizeInvalidatingStyles[param1] == true)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isSizeInvalidatingStyle(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function registerParentSizeInvalidatingStyle(param1:String) : void
      {
         this.parentSizeInvalidatingStyles[param1] = true;
      }
      
      public function isParentSizeInvalidatingStyle(param1:String) : Boolean
      {
         if(this.parentSizeInvalidatingStyles[param1] == true)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isParentSizeInvalidatingStyle(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function registerParentDisplayListInvalidatingStyle(param1:String) : void
      {
         this.parentDisplayListInvalidatingStyles[param1] = true;
      }
      
      public function isParentDisplayListInvalidatingStyle(param1:String) : Boolean
      {
         if(this.parentDisplayListInvalidatingStyles[param1] == true)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isParentDisplayListInvalidatingStyle(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function registerColorName(param1:String, param2:uint) : void
      {
         this.colorNames[param1.toLowerCase()] = param2;
      }
      
      public function isColorName(param1:String) : Boolean
      {
         if(this.colorNames[param1.toLowerCase()] !== undefined)
         {
            return true;
         }
         if(Boolean(this.parent) && Boolean(this.parent.isColorName(param1)))
         {
            return true;
         }
         return false;
      }
      
      public function getColorName(param1:Object) : uint
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = undefined;
         if(param1 is String)
         {
            if(param1.charAt(0) == "#")
            {
               _loc2_ = Number("0x" + param1.slice(1));
               return isNaN(_loc2_) ? 0 : uint(_loc2_);
            }
            if(param1.charAt(1) == "x" && param1.charAt(0) == "0")
            {
               _loc2_ = Number(param1);
               return isNaN(_loc2_) ? 0 : uint(_loc2_);
            }
            _loc3_ = this.colorNames[param1.toLowerCase()];
            if(_loc3_ === undefined)
            {
               if(this.parent)
               {
                  _loc3_ = this.parent.getColorName(param1);
               }
            }
            if(_loc3_ === undefined)
            {
               return StyleManager.NOT_A_COLOR;
            }
            return uint(_loc3_);
         }
         return uint(param1);
      }
      
      public function getColorNames(param1:Array) : void
      {
         var _loc4_:* = 0;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1[_loc3_] != null && isNaN(param1[_loc3_]))
            {
               if((_loc4_ = this.getColorName(param1[_loc3_])) != StyleManager.NOT_A_COLOR)
               {
                  param1[_loc3_] = _loc4_;
               }
            }
            _loc3_++;
         }
      }
      
      public function isValidStyleValue(param1:*) : Boolean
      {
         if(param1 !== undefined)
         {
            return true;
         }
         if(this.parent)
         {
            return this.parent.isValidStyleValue(param1);
         }
         return false;
      }
      
      public function loadStyleDeclarations(param1:String, param2:Boolean = true, param3:Boolean = false, param4:ApplicationDomain = null, param5:SecurityDomain = null) : IEventDispatcher
      {
         return this.loadStyleDeclarations2(param1,param2,param4,param5);
      }
      
      public function loadStyleDeclarations2(param1:String, param2:Boolean = true, param3:ApplicationDomain = null, param4:SecurityDomain = null) : IEventDispatcher
      {
         var errorHandler:Function;
         var module:IModuleInfo = null;
         var thisStyleManager:IStyleManager2 = null;
         var styleEventDispatcher:StyleEventDispatcher = null;
         var timer:Timer = null;
         var timerHandler:Function = null;
         var url:String = param1;
         var update:Boolean = param2;
         var var_4:ApplicationDomain = param3;
         var securityDomain:SecurityDomain = param4;
         module = ModuleManager.getModule(url);
         thisStyleManager = {};
         var readyHandler:Function = function(param1:ModuleEvent):void
         {
            var _loc2_:IStyleModule = IStyleModule(param1.module.factory.create());
            param1.module.factory.registerImplementation("mx.styles::IStyleManager2",thisStyleManager);
            _loc2_.setStyleDeclarations(thisStyleManager);
            styleModules[param1.module.url].styleModule = _loc2_;
            if(update)
            {
               styleDeclarationsChanged();
            }
         };
         module.addEventListener(ModuleEvent.READY,readyHandler,false,0,true);
         styleEventDispatcher = new StyleEventDispatcher(module);
         errorHandler = function(param1:ModuleEvent):void
         {
            var _loc3_:* = null;
            var _loc2_:String = resourceManager.getString("styles","unableToLoad",[param1.errorText,url]);
            if(styleEventDispatcher.willTrigger(StyleEvent.ERROR))
            {
               _loc3_ = new StyleEvent(StyleEvent.ERROR,param1.bubbles,param1.cancelable);
               _loc3_.bytesLoaded = 0;
               _loc3_.bytesTotal = 0;
               _loc3_.errorText = _loc2_;
               styleEventDispatcher.dispatchEvent(_loc3_);
               return;
            }
            throw new Error(_loc2_);
         };
         module.addEventListener(ModuleEvent.ERROR,errorHandler,false,0,true);
         this.styleModules[url] = new StyleModuleInfo(module,readyHandler,errorHandler);
         timer = new Timer(0);
         timerHandler = function(param1:TimerEvent):void
         {
            timer.removeEventListener(TimerEvent.TIMER,timerHandler);
            timer.stop();
            module.load(var_4,securityDomain);
         };
         timer.addEventListener(TimerEvent.TIMER,timerHandler,false,0,true);
         timer.start();
         return styleEventDispatcher;
      }
      
      public function unloadStyleDeclarations(param1:String, param2:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc3_:StyleModuleInfo = this.styleModules[param1];
         if(_loc3_)
         {
            _loc3_.styleModule.unload();
            (_loc4_ = _loc3_.module).unload();
            _loc4_.removeEventListener(ModuleEvent.READY,_loc3_.readyHandler);
            _loc4_.removeEventListener(ModuleEvent.ERROR,_loc3_.errorHandler);
            this.styleModules[param1] = null;
         }
         if(param2)
         {
            this.styleDeclarationsChanged();
         }
      }
      
      private function dispatchInheritingStylesChangeEvent() : void
      {
         var _loc1_:Event = new FlexChangeEvent(FlexChangeEvent.STYLE_MANAGER_CHANGE,false,false,{"property":"inheritingStyles"});
         dispatchEvent(_loc1_);
      }
      
      public function acceptMediaList(param1:String) : Boolean
      {
         if(!this.mqp)
         {
            this.mqp = MediaQueryParser.instance;
            if(!this.mqp)
            {
               this.mqp = new MediaQueryParser(this.moduleFactory);
               MediaQueryParser.instance = this.mqp;
            }
         }
         return this.mqp.parse(param1);
      }
      
      private function styleManagerChangeHandler(param1:FlexChangeEvent) : void
      {
         if(!param1.data)
         {
            return;
         }
         var _loc2_:String = param1.data["property"];
         if(_loc2_ == "inheritingStyles")
         {
            this.mergedInheritingStylesCache = null;
         }
         if(hasEventListener(FlexChangeEvent.STYLE_MANAGER_CHANGE))
         {
            dispatchEvent(param1);
         }
      }
   }
}

import flash.events.EventDispatcher;
import mx.events.ModuleEvent;
import mx.events.StyleEvent;
import mx.modules.IModuleInfo;

class StyleEventDispatcher extends EventDispatcher
{
    
   
   function StyleEventDispatcher(param1:IModuleInfo)
   {
      super();
      param1.addEventListener(ModuleEvent.PROGRESS,this.moduleInfo_progressHandler,false,0,true);
      param1.addEventListener(ModuleEvent.READY,this.moduleInfo_readyHandler,false,0,true);
   }
   
   private function moduleInfo_progressHandler(param1:ModuleEvent) : void
   {
      var _loc2_:StyleEvent = new StyleEvent(StyleEvent.PROGRESS,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      dispatchEvent(_loc2_);
   }
   
   private function moduleInfo_readyHandler(param1:ModuleEvent) : void
   {
      var _loc2_:StyleEvent = new StyleEvent(StyleEvent.COMPLETE);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      dispatchEvent(_loc2_);
   }
}

import mx.modules.IModuleInfo;
import mx.styles.IStyleModule;

class StyleModuleInfo
{
    
   
   public var errorHandler:Function;
   
   public var readyHandler:Function;
   
   public var styleModule:IStyleModule;
   
   public var module:IModuleInfo;
   
   function StyleModuleInfo(param1:IModuleInfo, param2:Function, param3:Function)
   {
      super();
      this.module = param1;
      this.readyHandler = param2;
      this.errorHandler = param3;
   }
}
