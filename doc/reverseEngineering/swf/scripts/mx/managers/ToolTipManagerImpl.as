package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import mx.controls.ToolTip;
   import mx.core.FlexGlobals;
   import mx.core.FlexVersion;
   import mx.core.IFlexModule;
   import mx.core.IInvalidating;
   import mx.core.ILayoutDirectionElement;
   import mx.core.IToolTip;
   import mx.core.IUIComponent;
   import mx.core.LayoutDirection;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.effects.IAbstractEffect;
   import mx.events.DynamicEvent;
   import mx.events.EffectEvent;
   import mx.events.ToolTipEvent;
   import mx.styles.IStyleClient;
   import mx.validators.IValidatorListener;
   
   public class ToolTipManagerImpl extends EventDispatcher implements IToolTipManager2
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var instance:IToolTipManager2;
      
      public static var mixins:Array;
       
      
      mx_internal var initialized:Boolean = false;
      
      mx_internal var showTimer:Timer;
      
      mx_internal var hideTimer:Timer;
      
      mx_internal var scrubTimer:Timer;
      
      mx_internal var currentText:String;
      
      mx_internal var isError:Boolean;
      
      mx_internal var previousTarget:DisplayObject;
      
      private var _currentTarget:DisplayObject;
      
      mx_internal var _currentToolTip:DisplayObject;
      
      private var _enabled:Boolean = true;
      
      private var _hideDelay:Number = 10000;
      
      private var _hideEffect:IAbstractEffect;
      
      private var _scrubDelay:Number = 100;
      
      private var _showDelay:Number = 500;
      
      private var _showEffect:IAbstractEffect;
      
      private var _toolTipClass:Class;
      
      public function ToolTipManagerImpl()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._toolTipClass = ToolTip;
         super();
         if(instance)
         {
            throw new Error("Instance already exists.");
         }
         if(mixins)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               new mixins[_loc2_](this);
               _loc2_++;
            }
         }
         if(hasEventListener("initialize"))
         {
            dispatchEvent(new Event("initialize"));
         }
      }
      
      public static function getInstance() : IToolTipManager2
      {
         if(!instance)
         {
            instance = new ToolTipManagerImpl();
         }
         return instance;
      }
      
      public function get currentTarget() : DisplayObject
      {
         return this._currentTarget;
      }
      
      public function set currentTarget(param1:DisplayObject) : void
      {
         this._currentTarget = param1;
      }
      
      public function get currentToolTip() : IToolTip
      {
         return this.mx_internal::_currentToolTip as IToolTip;
      }
      
      public function set currentToolTip(param1:IToolTip) : void
      {
         this.mx_internal::_currentToolTip = param1 as DisplayObject;
         if(hasEventListener("currentToolTip"))
         {
            dispatchEvent(new Event("currentToolTip"));
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get hideDelay() : Number
      {
         return this._hideDelay;
      }
      
      public function set hideDelay(param1:Number) : void
      {
         this._hideDelay = param1;
      }
      
      public function get hideEffect() : IAbstractEffect
      {
         return this._hideEffect;
      }
      
      public function set hideEffect(param1:IAbstractEffect) : void
      {
         this._hideEffect = param1 as IAbstractEffect;
      }
      
      public function get scrubDelay() : Number
      {
         return this._scrubDelay;
      }
      
      public function set scrubDelay(param1:Number) : void
      {
         this._scrubDelay = param1;
      }
      
      public function get showDelay() : Number
      {
         return this._showDelay;
      }
      
      public function set showDelay(param1:Number) : void
      {
         this._showDelay = param1;
      }
      
      public function get showEffect() : IAbstractEffect
      {
         return this._showEffect;
      }
      
      public function set showEffect(param1:IAbstractEffect) : void
      {
         this._showEffect = param1 as IAbstractEffect;
      }
      
      public function get toolTipClass() : Class
      {
         return this._toolTipClass;
      }
      
      public function set toolTipClass(param1:Class) : void
      {
         this._toolTipClass = param1;
      }
      
      mx_internal function initialize() : void
      {
         if(!this.mx_internal::showTimer)
         {
            this.mx_internal::showTimer = new Timer(0,1);
            this.mx_internal::showTimer.addEventListener(TimerEvent.TIMER,this.mx_internal::showTimer_timerHandler);
         }
         if(!this.mx_internal::hideTimer)
         {
            this.mx_internal::hideTimer = new Timer(0,1);
            this.mx_internal::hideTimer.addEventListener(TimerEvent.TIMER,this.mx_internal::hideTimer_timerHandler);
         }
         if(!this.mx_internal::scrubTimer)
         {
            this.mx_internal::scrubTimer = new Timer(0,1);
         }
         this.mx_internal::initialized = true;
      }
      
      public function registerToolTip(param1:DisplayObject, param2:String, param3:String) : void
      {
         if(!param2 && Boolean(param3))
         {
            param1.addEventListener(MouseEvent.MOUSE_OVER,this.mx_internal::toolTipMouseOverHandler);
            param1.addEventListener(MouseEvent.MOUSE_OUT,this.mx_internal::toolTipMouseOutHandler);
            if(this.mouseIsOver(param1))
            {
               this.showImmediately(param1);
            }
         }
         else if(Boolean(param2) && !param3)
         {
            param1.removeEventListener(MouseEvent.MOUSE_OVER,this.mx_internal::toolTipMouseOverHandler);
            param1.removeEventListener(MouseEvent.MOUSE_OUT,this.mx_internal::toolTipMouseOutHandler);
            if(this.mouseIsOver(param1))
            {
               this.hideImmediately(param1);
            }
         }
      }
      
      public function registerErrorString(param1:DisplayObject, param2:String, param3:String) : void
      {
         if(!param2 && Boolean(param3))
         {
            param1.addEventListener(MouseEvent.MOUSE_OVER,this.mx_internal::errorTipMouseOverHandler);
            param1.addEventListener(MouseEvent.MOUSE_OUT,this.mx_internal::errorTipMouseOutHandler);
            if(this.mouseIsOver(param1))
            {
               this.showImmediately(param1);
            }
         }
         else if(Boolean(param2) && !param3)
         {
            param1.removeEventListener(MouseEvent.MOUSE_OVER,this.mx_internal::errorTipMouseOverHandler);
            param1.removeEventListener(MouseEvent.MOUSE_OUT,this.mx_internal::errorTipMouseOutHandler);
            if(this.mouseIsOver(param1))
            {
               this.hideImmediately(param1);
            }
         }
      }
      
      private function mouseIsOver(param1:DisplayObject) : Boolean
      {
         if(!param1 || !param1.stage)
         {
            return false;
         }
         if(param1.stage.mouseX == 0 && param1.stage.mouseY == 0)
         {
            return false;
         }
         if(param1 is ILayoutManagerClient && !ILayoutManagerClient(param1).initialized)
         {
            return false;
         }
         return param1.hitTestPoint(param1.stage.mouseX,param1.stage.mouseY,true);
      }
      
      private function showImmediately(param1:DisplayObject) : void
      {
         var _loc2_:Number = 0;
         ToolTipManager.showDelay = 0;
         this.mx_internal::checkIfTargetChanged(param1);
         ToolTipManager.showDelay = _loc2_;
      }
      
      private function hideImmediately(param1:DisplayObject) : void
      {
         this.mx_internal::checkIfTargetChanged(null);
      }
      
      mx_internal function checkIfTargetChanged(param1:DisplayObject) : void
      {
         if(!this.enabled)
         {
            return;
         }
         this.mx_internal::findTarget(param1);
         if(this.currentTarget != this.mx_internal::previousTarget)
         {
            this.mx_internal::targetChanged();
            this.mx_internal::previousTarget = this.currentTarget;
         }
      }
      
      mx_internal function findTarget(param1:DisplayObject) : void
      {
         var _loc2_:Boolean = false;
         while(param1)
         {
            if(param1 is IValidatorListener)
            {
               this.mx_internal::currentText = IValidatorListener(param1).errorString;
               if(param1 is IStyleClient)
               {
                  _loc2_ = Boolean(IStyleClient(param1).getStyle("showErrorTip"));
               }
               if(this.mx_internal::currentText != null && this.mx_internal::currentText != "" && _loc2_)
               {
                  this.currentTarget = param1;
                  this.mx_internal::isError = true;
                  return;
               }
            }
            if(param1 is IToolTipManagerClient)
            {
               this.mx_internal::currentText = IToolTipManagerClient(param1).toolTip;
               if(this.mx_internal::currentText != null)
               {
                  this.currentTarget = param1;
                  this.mx_internal::isError = false;
                  return;
               }
            }
            param1 = param1.parent;
         }
         this.mx_internal::currentText = null;
         this.currentTarget = null;
      }
      
      mx_internal function targetChanged() : void
      {
         var _loc1_:* = null;
         if(!this.mx_internal::initialized)
         {
            this.mx_internal::initialize();
         }
         if(Boolean(this.mx_internal::previousTarget) && Boolean(this.currentToolTip))
         {
            if(this.currentToolTip is IToolTip)
            {
               _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_HIDE);
               _loc1_.toolTip = this.currentToolTip;
               this.mx_internal::previousTarget.dispatchEvent(_loc1_);
            }
            else if(hasEventListener(ToolTipEvent.TOOL_TIP_HIDE))
            {
               dispatchEvent(new Event(ToolTipEvent.TOOL_TIP_HIDE));
            }
         }
         this.mx_internal::reset();
         if(this.currentTarget)
         {
            if(this.mx_internal::currentText == "")
            {
               return;
            }
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_START);
            this.currentTarget.dispatchEvent(_loc1_);
            if(this.showDelay == 0 || this.mx_internal::scrubTimer.running)
            {
               this.mx_internal::createTip();
               this.mx_internal::initializeTip();
               this.mx_internal::positionTip();
               this.mx_internal::showTip();
            }
            else
            {
               this.mx_internal::showTimer.delay = this.showDelay;
               this.mx_internal::showTimer.start();
            }
         }
      }
      
      mx_internal function createTip() : void
      {
         var _loc1_:ToolTipEvent = new ToolTipEvent(ToolTipEvent.TOOL_TIP_CREATE);
         this.currentTarget.dispatchEvent(_loc1_);
         if(_loc1_.toolTip)
         {
            this.currentToolTip = _loc1_.toolTip;
         }
         else
         {
            this.currentToolTip = new this.toolTipClass();
         }
         this.currentToolTip.visible = false;
         if(this.currentToolTip is IFlexModule && IFlexModule(this.currentToolTip).moduleFactory == null && this.currentTarget is IFlexModule)
         {
            IFlexModule(this.currentToolTip).moduleFactory = IFlexModule(this.currentTarget).moduleFactory;
         }
         if(hasEventListener("createTip"))
         {
            if(!dispatchEvent(new Event("createTip",false,true)))
            {
               return;
            }
         }
         var _loc2_:ISystemManager = this.mx_internal::getSystemManager(this.currentTarget) as ISystemManager;
         _loc2_.topLevelSystemManager.toolTipChildren.addChild(this.currentToolTip as DisplayObject);
      }
      
      mx_internal function initializeTip() : void
      {
         if(this.currentToolTip is IToolTip)
         {
            IToolTip(this.currentToolTip).text = this.mx_internal::currentText;
         }
         if(this.mx_internal::isError && this.currentToolTip is IStyleClient)
         {
            IStyleClient(this.currentToolTip).setStyle("styleName","errorTip");
         }
         this.sizeTip(this.currentToolTip);
         if(this.currentToolTip is IStyleClient)
         {
            if(this.showEffect)
            {
               IStyleClient(this.currentToolTip).setStyle("showEffect",this.showEffect);
            }
            if(this.hideEffect)
            {
               IStyleClient(this.currentToolTip).setStyle("hideEffect",this.hideEffect);
            }
         }
         if(Boolean(this.showEffect) || Boolean(this.hideEffect))
         {
            this.currentToolTip.addEventListener(EffectEvent.EFFECT_END,this.mx_internal::effectEndHandler);
         }
      }
      
      public function sizeTip(param1:IToolTip) : void
      {
         if(param1 is IInvalidating)
         {
            IInvalidating(param1).validateNow();
         }
         param1.setActualSize(param1.getExplicitOrMeasuredWidth(),param1.getExplicitOrMeasuredHeight());
      }
      
      mx_internal function positionTip() : void
      {
         var _loc1_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:* = null;
         if(this.currentTarget is ILayoutDirectionElement)
         {
            _loc1_ = ILayoutDirectionElement(this.currentTarget).layoutDirection;
         }
         else
         {
            _loc1_ = "null";
         }
         var _loc2_:* = _loc1_ == LayoutDirection.RTL;
         var _loc5_:Number = this.currentToolTip.screen.width;
         var _loc6_:Number = this.currentToolTip.screen.height;
         if(this.mx_internal::isError)
         {
            if((Boolean(_loc7_ = this.currentToolTip as ILayoutDirectionElement)) && _loc7_.layoutDirection != _loc1_)
            {
               _loc7_.layoutDirection = _loc1_;
               _loc7_.invalidateLayoutDirection();
            }
            _loc8_ = this.getGlobalBounds(this.currentTarget,this.currentToolTip.root,_loc2_);
            _loc3_ = _loc2_ ? _loc8_.left - 4 : _loc8_.right + 4;
            _loc4_ = _loc8_.top - 1;
            if(_loc9_ = _loc2_ ? _loc3_ < this.currentToolTip.width : _loc3_ + this.currentToolTip.width > _loc5_)
            {
               _loc10_ = NaN;
               _loc11_ = NaN;
               _loc3_ = _loc2_ ? _loc8_.right + 2 - Number(this.currentToolTip.width) : _loc8_.left - 2;
               if(_loc2_)
               {
                  if(_loc3_ < this.currentToolTip.width + 4)
                  {
                     _loc3_ = 4;
                     _loc10_ = _loc8_.right - 2;
                  }
               }
               else if(_loc3_ + this.currentToolTip.width + 4 > _loc5_)
               {
                  _loc10_ = _loc5_ - _loc3_ - 4;
               }
               if(!isNaN(_loc10_))
               {
                  _loc11_ = Number(Object(this.toolTipClass).maxWidth);
                  Object(this.toolTipClass).maxWidth = _loc10_;
                  if(this.currentToolTip is IStyleClient)
                  {
                     IStyleClient(this.currentToolTip).setStyle("borderStyle","errorTipAbove");
                  }
                  this.currentToolTip["text"] = this.currentToolTip["text"];
               }
               else
               {
                  if(this.currentToolTip is IStyleClient)
                  {
                     IStyleClient(this.currentToolTip).setStyle("borderStyle","errorTipAbove");
                  }
                  this.currentToolTip["text"] = this.currentToolTip["text"];
               }
               if(this.currentToolTip.height + 2 < _loc8_.top)
               {
                  _loc4_ = _loc8_.top - (this.currentToolTip.height + 2);
               }
               else
               {
                  _loc4_ = _loc8_.bottom + 2;
                  if(!isNaN(_loc10_))
                  {
                     Object(this.toolTipClass).maxWidth = _loc10_;
                  }
                  if(this.currentToolTip is IStyleClient)
                  {
                     IStyleClient(this.currentToolTip).setStyle("borderStyle","errorTipBelow");
                  }
                  this.currentToolTip["text"] = this.currentToolTip["text"];
               }
            }
            this.sizeTip(this.currentToolTip);
            if(!isNaN(_loc11_))
            {
               Object(this.toolTipClass).maxWidth = _loc11_;
            }
            else if(_loc2_)
            {
               _loc3_ = _loc8_.right + 2 - Number(this.currentToolTip.width);
            }
         }
         else
         {
            _loc12_ = this.mx_internal::getSystemManager(this.currentTarget);
            _loc3_ = DisplayObject(_loc12_).mouseX + 11;
            if(_loc2_)
            {
               _loc3_ -= this.currentToolTip.width;
            }
            _loc4_ = DisplayObject(_loc12_).mouseY + 22;
            _loc13_ = Number(this.currentToolTip.width);
            if(_loc2_)
            {
               if(_loc3_ < 2)
               {
                  _loc3_ = 2;
               }
            }
            else if(_loc3_ + _loc13_ > _loc5_)
            {
               _loc3_ = _loc5_ - _loc13_;
            }
            _loc14_ = Number(this.currentToolTip.height);
            if(_loc4_ + _loc14_ > _loc6_)
            {
               _loc4_ = _loc6_ - _loc14_;
            }
            _loc15_ = new Point(_loc3_,_loc4_);
            _loc15_ = DisplayObject(_loc12_).localToGlobal(_loc15_);
            _loc3_ = (_loc15_ = DisplayObject(_loc12_.getSandboxRoot()).globalToLocal(_loc15_)).x;
            _loc4_ = _loc15_.y;
         }
         this.currentToolTip.move(_loc3_,_loc4_);
      }
      
      mx_internal function showTip() : void
      {
         var _loc2_:* = null;
         var _loc1_:ToolTipEvent = new ToolTipEvent(ToolTipEvent.TOOL_TIP_SHOW);
         _loc1_.toolTip = this.currentToolTip;
         this.currentTarget.dispatchEvent(_loc1_);
         if(this.mx_internal::isError)
         {
            this.currentTarget.addEventListener(Event.CHANGE,this.mx_internal::changeHandler);
         }
         else
         {
            _loc2_ = this.mx_internal::getSystemManager(this.currentTarget);
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.mx_internal::systemManager_mouseDownHandler);
         }
         this.currentToolTip.visible = true;
         if(!this.showEffect)
         {
            this.mx_internal::showEffectEnded();
         }
      }
      
      mx_internal function hideTip() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this.mx_internal::previousTarget)
         {
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_HIDE);
            _loc1_.toolTip = this.currentToolTip;
            this.mx_internal::previousTarget.dispatchEvent(_loc1_);
         }
         if(this.currentToolTip)
         {
            this.currentToolTip.visible = false;
         }
         if(this.mx_internal::isError)
         {
            if(this.currentTarget)
            {
               this.currentTarget.removeEventListener(Event.CHANGE,this.mx_internal::changeHandler);
            }
         }
         else if(this.mx_internal::previousTarget)
         {
            _loc2_ = this.mx_internal::getSystemManager(this.mx_internal::previousTarget);
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this.mx_internal::systemManager_mouseDownHandler);
         }
         if(!this.hideEffect)
         {
            this.mx_internal::hideEffectEnded();
         }
      }
      
      mx_internal function reset() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.mx_internal::showTimer.reset();
         this.mx_internal::hideTimer.reset();
         if(this.currentToolTip)
         {
            if(Boolean(this.showEffect) || Boolean(this.hideEffect))
            {
               this.currentToolTip.removeEventListener(EffectEvent.EFFECT_END,this.mx_internal::effectEndHandler);
            }
            EffectManager.endEffectsForTarget(this.currentToolTip);
            if(hasEventListener("removeChild"))
            {
               _loc1_ = new DynamicEvent("removeChild",false,true);
               _loc1_.sm = this.currentToolTip.systemManager;
               _loc1_.toolTip = this.currentToolTip;
            }
            if(!_loc1_ || dispatchEvent(_loc1_))
            {
               _loc2_ = this.currentToolTip.systemManager as ISystemManager;
               _loc2_.topLevelSystemManager.toolTipChildren.removeChild(this.currentToolTip as DisplayObject);
            }
            this.currentToolTip = null;
            this.mx_internal::scrubTimer.delay = this.scrubDelay;
            this.mx_internal::scrubTimer.reset();
            if(this.scrubDelay > 0)
            {
               this.mx_internal::scrubTimer.delay = this.scrubDelay;
               this.mx_internal::scrubTimer.start();
            }
         }
      }
      
      public function createToolTip(param1:String, param2:Number, param3:Number, param4:String = null, param5:IUIComponent = null) : IToolTip
      {
         var _loc8_:* = null;
         var _loc6_:ToolTip = new ToolTip();
         var _loc7_:ISystemManager = !!param5 ? param5.systemManager as ISystemManager : FlexGlobals.topLevelApplication.systemManager as ISystemManager;
         if(param5 is IFlexModule)
         {
            _loc6_.moduleFactory = IFlexModule(param5).moduleFactory;
         }
         else
         {
            _loc6_.moduleFactory = _loc7_;
         }
         if(hasEventListener("addChild"))
         {
            (_loc8_ = new DynamicEvent("addChild",false,true)).sm = _loc7_;
            _loc8_.toolTip = _loc6_;
         }
         if(!_loc8_ || dispatchEvent(_loc8_))
         {
            _loc7_.topLevelSystemManager.toolTipChildren.addChild(_loc6_ as DisplayObject);
         }
         if(param4)
         {
            _loc6_.setStyle("styleName","errorTip");
            _loc6_.setStyle("borderStyle",param4);
         }
         _loc6_.text = param1;
         this.sizeTip(_loc6_);
         _loc6_.move(param2,param3);
         return _loc6_ as IToolTip;
      }
      
      public function destroyToolTip(param1:IToolTip) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(hasEventListener("removeChild"))
         {
            _loc2_ = new DynamicEvent("removeChild",false,true);
            _loc2_.sm = param1.systemManager;
            _loc2_.toolTip = param1;
         }
         if(!_loc2_ || dispatchEvent(_loc2_))
         {
            _loc3_ = param1.systemManager as ISystemManager;
            _loc3_.topLevelSystemManager.toolTipChildren.removeChild(param1 as DisplayObject);
         }
      }
      
      mx_internal function showEffectEnded() : void
      {
         var _loc1_:* = null;
         if(this.hideDelay == 0)
         {
            this.mx_internal::hideTip();
         }
         else if(this.hideDelay < Infinity)
         {
            this.mx_internal::hideTimer.delay = this.hideDelay;
            this.mx_internal::hideTimer.start();
         }
         if(this.currentTarget)
         {
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_SHOWN);
            _loc1_.toolTip = this.currentToolTip;
            this.currentTarget.dispatchEvent(_loc1_);
         }
      }
      
      mx_internal function hideEffectEnded() : void
      {
         var _loc1_:* = null;
         this.mx_internal::reset();
         if(this.mx_internal::previousTarget)
         {
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_END);
            _loc1_.toolTip = this.currentToolTip;
            this.mx_internal::previousTarget.dispatchEvent(_loc1_);
         }
      }
      
      mx_internal function getSystemManager(param1:DisplayObject) : ISystemManager
      {
         return param1 is IUIComponent ? IUIComponent(param1).systemManager : null;
      }
      
      private function getGlobalBounds(param1:DisplayObject, param2:DisplayObject, param3:Boolean) : Rectangle
      {
         var _loc4_:Point = new Point(0,0);
         _loc4_ = param1.localToGlobal(_loc4_);
         if(param3)
         {
            _loc4_.x -= param1.width;
         }
         _loc4_ = param2.globalToLocal(_loc4_);
         return new Rectangle(_loc4_.x,_loc4_.y,param1.width,param1.height);
      }
      
      mx_internal function toolTipMouseOverHandler(param1:MouseEvent) : void
      {
         this.mx_internal::checkIfTargetChanged(DisplayObject(param1.target));
      }
      
      mx_internal function toolTipMouseOutHandler(param1:MouseEvent) : void
      {
         this.mx_internal::checkIfTargetChanged(param1.relatedObject);
      }
      
      mx_internal function errorTipMouseOverHandler(param1:MouseEvent) : void
      {
         this.mx_internal::checkIfTargetChanged(DisplayObject(param1.target));
      }
      
      mx_internal function errorTipMouseOutHandler(param1:MouseEvent) : void
      {
         this.mx_internal::checkIfTargetChanged(param1.relatedObject);
      }
      
      mx_internal function showTimer_timerHandler(param1:TimerEvent) : void
      {
         if(this.currentTarget)
         {
            this.mx_internal::createTip();
            this.mx_internal::initializeTip();
            this.mx_internal::positionTip();
            this.mx_internal::showTip();
         }
      }
      
      mx_internal function hideTimer_timerHandler(param1:TimerEvent) : void
      {
         this.mx_internal::hideTip();
      }
      
      mx_internal function effectEndHandler(param1:EffectEvent) : void
      {
         if(param1.effectInstance.effect == this.showEffect)
         {
            this.mx_internal::showEffectEnded();
         }
         else if(param1.effectInstance.effect == this.hideEffect)
         {
            this.mx_internal::hideEffectEnded();
         }
      }
      
      mx_internal function systemManager_mouseDownHandler(param1:MouseEvent) : void
      {
         this.mx_internal::reset();
      }
      
      mx_internal function changeHandler(param1:Event) : void
      {
         this.mx_internal::reset();
      }
   }
}
