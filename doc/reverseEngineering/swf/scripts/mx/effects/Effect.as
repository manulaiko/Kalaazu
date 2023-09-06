package mx.effects
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.AddRemoveEffectTargetFilter;
   import mx.effects.effectClasses.HideShowEffectTargetFilter;
   import mx.effects.effectClasses.PropertyChanges;
   import mx.events.EffectEvent;
   import mx.managers.LayoutManager;
   import mx.styles.IStyleClient;
   import mx.utils.NameUtil;
   
   public class Effect extends EventDispatcher implements IEffect
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      mx_internal var applyEndValuesWhenDone:Boolean = false;
      
      private var _transitionInterruption:Boolean = false;
      
      protected var applyTransitionEndProperties:Boolean;
      
      private var _instances:Array;
      
      private var _callValidateNow:Boolean = false;
      
      private var isPaused:Boolean = false;
      
      mx_internal var filterObject:EffectTargetFilter;
      
      mx_internal var applyActualDimensions:Boolean = true;
      
      mx_internal var propertyChangesArray:Array;
      
      mx_internal var playReversed:Boolean;
      
      private var effectStopped:Boolean;
      
      mx_internal var parentCompositeEffect:Effect;
      
      private var _customFilter:EffectTargetFilter;
      
      private var _duration:Number = 500;
      
      mx_internal var durationExplicitlySet:Boolean = false;
      
      private var _effectTargetHost:IEffectTargetHost;
      
      protected var endValuesCaptured:Boolean = false;
      
      private var _filter:String;
      
      private var _hideFocusRing:Boolean = false;
      
      public var instanceClass:Class;
      
      private var _perElementOffset:Number = 0;
      
      private var _relevantProperties:Array;
      
      private var _relevantStyles:Array;
      
      public var repeatCount:int = 1;
      
      public var repeatDelay:int = 0;
      
      public var startDelay:int = 0;
      
      public var suspendBackgroundProcessing:Boolean = false;
      
      private var _targets:Array;
      
      private var _triggerEvent:Event;
      
      private var _playheadTime:Number = 0;
      
      public function Effect(param1:Object = null)
      {
         this.applyTransitionEndProperties = FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_0 ? false : true;
         this._instances = [];
         this.instanceClass = IEffectInstance;
         this._relevantStyles = [];
         this._targets = [];
         super();
         this.target = param1;
      }
      
      private static function mergeArrays(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               _loc4_ = true;
               _loc5_ = 0;
               while(_loc5_ < param1.length)
               {
                  if(param1[_loc5_] == param2[_loc3_])
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc5_++;
               }
               if(_loc4_)
               {
                  param1.push(param2[_loc3_]);
               }
               _loc3_++;
            }
         }
         return param1;
      }
      
      private static function stripUnchangedValues(param1:Array) : Array
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].stripUnchangedValues != false)
            {
               for(_loc3_ in param1[_loc2_].start)
               {
                  if(param1[_loc2_].start[_loc3_] == param1[_loc2_].end[_loc3_] || typeof param1[_loc2_].start[_loc3_] == "number" && typeof param1[_loc2_].end[_loc3_] == "number" && isNaN(param1[_loc2_].start[_loc3_]) && isNaN(param1[_loc2_].end[_loc3_]))
                  {
                     delete param1[_loc2_].start[_loc3_];
                     delete param1[_loc2_].end[_loc3_];
                  }
               }
            }
            _loc2_++;
         }
         return param1;
      }
      
      mx_internal function get transitionInterruption() : Boolean
      {
         return this._transitionInterruption;
      }
      
      mx_internal function set transitionInterruption(param1:Boolean) : void
      {
         this._transitionInterruption = param1;
      }
      
      public function get className() : String
      {
         return NameUtil.getUnqualifiedClassName(this);
      }
      
      public function get customFilter() : EffectTargetFilter
      {
         return this._customFilter;
      }
      
      public function set customFilter(param1:EffectTargetFilter) : void
      {
         this._customFilter = param1;
         this.mx_internal::filterObject = param1;
      }
      
      public function get duration() : Number
      {
         if(!this.mx_internal::durationExplicitlySet && Boolean(this.mx_internal::parentCompositeEffect))
         {
            return this.mx_internal::parentCompositeEffect.duration;
         }
         return this._duration;
      }
      
      public function set duration(param1:Number) : void
      {
         this.mx_internal::durationExplicitlySet = true;
         this._duration = param1;
      }
      
      public function get effectTargetHost() : IEffectTargetHost
      {
         return this._effectTargetHost;
      }
      
      public function set effectTargetHost(param1:IEffectTargetHost) : void
      {
         this._effectTargetHost = param1;
      }
      
      public function get filter() : String
      {
         return this._filter;
      }
      
      public function set filter(param1:String) : void
      {
         if(!this.customFilter)
         {
            this._filter = param1;
            switch(param1)
            {
               case "add":
               case "remove":
                  this.mx_internal::filterObject = new AddRemoveEffectTargetFilter();
                  AddRemoveEffectTargetFilter(this.mx_internal::filterObject).add = param1 == "add";
                  break;
               case "hide":
               case "show":
                  this.mx_internal::filterObject = new HideShowEffectTargetFilter();
                  HideShowEffectTargetFilter(this.mx_internal::filterObject).show = param1 == "show";
                  break;
               case "move":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.filterProperties = ["x","y"];
                  break;
               case "resize":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.filterProperties = ["width","height"];
                  break;
               case "addItem":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.requiredSemantics = {"added":true};
                  break;
               case "removeItem":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.requiredSemantics = {"removed":true};
                  break;
               case "replacedItem":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.requiredSemantics = {"replaced":true};
                  break;
               case "replacementItem":
                  this.mx_internal::filterObject = new EffectTargetFilter();
                  this.mx_internal::filterObject.requiredSemantics = {"replacement":true};
                  break;
               default:
                  this.mx_internal::filterObject = null;
            }
         }
      }
      
      public function get hideFocusRing() : Boolean
      {
         return this._hideFocusRing;
      }
      
      public function set hideFocusRing(param1:Boolean) : void
      {
         this._hideFocusRing = param1;
      }
      
      public function get isPlaying() : Boolean
      {
         return Boolean(this._instances) && this._instances.length > 0;
      }
      
      public function get perElementOffset() : Number
      {
         return this._perElementOffset;
      }
      
      public function set perElementOffset(param1:Number) : void
      {
         this._perElementOffset = param1;
      }
      
      public function get relevantProperties() : Array
      {
         if(this._relevantProperties)
         {
            return this._relevantProperties;
         }
         return this.getAffectedProperties();
      }
      
      public function set relevantProperties(param1:Array) : void
      {
         this._relevantProperties = param1;
      }
      
      public function get relevantStyles() : Array
      {
         return this._relevantStyles;
      }
      
      public function set relevantStyles(param1:Array) : void
      {
         this._relevantStyles = param1;
      }
      
      public function get target() : Object
      {
         if(this._targets.length > 0)
         {
            return this._targets[0];
         }
         return null;
      }
      
      public function set target(param1:Object) : void
      {
         this._targets.splice(0);
         if(param1)
         {
            this._targets[0] = param1;
         }
      }
      
      public function get targets() : Array
      {
         return this._targets;
      }
      
      public function set targets(param1:Array) : void
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(param1[_loc3_] == null)
            {
               param1.splice(_loc3_,1);
            }
            _loc3_--;
         }
         this._targets = param1;
      }
      
      public function get triggerEvent() : Event
      {
         return this._triggerEvent;
      }
      
      public function set triggerEvent(param1:Event) : void
      {
         this._triggerEvent = param1;
      }
      
      public function get playheadTime() : Number
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._instances.length)
         {
            if(this._instances[_loc1_])
            {
               return IEffectInstance(this._instances[_loc1_]).playheadTime;
            }
            _loc1_++;
         }
         return this._playheadTime;
      }
      
      public function set playheadTime(param1:Number) : void
      {
         var _loc2_:Boolean = false;
         if(this._instances.length == 0)
         {
            this.play();
            _loc2_ = true;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._instances.length)
         {
            if(this._instances[_loc3_])
            {
               EffectInstance(this._instances[_loc3_]).playheadTime = param1;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            this.pause();
         }
         this._playheadTime = param1;
      }
      
      public function getAffectedProperties() : Array
      {
         return [];
      }
      
      public function createInstances(param1:Array = null) : Array
      {
         var _loc6_:* = null;
         if(!param1)
         {
            param1 = this.targets;
         }
         var _loc2_:* = [];
         var _loc3_:int = param1.length;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc6_ = this.createInstance(param1[_loc5_]))
            {
               _loc6_.startDelay += _loc4_;
               _loc4_ += this.perElementOffset;
               _loc2_.push(_loc6_);
            }
            _loc5_++;
         }
         this.triggerEvent = null;
         return _loc2_;
      }
      
      public function createInstance(param1:Object = null) : IEffectInstance
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            param1 = this.target;
         }
         var _loc2_:* = null;
         var _loc4_:Boolean = true;
         var _loc5_:Boolean = false;
         if(this.mx_internal::propertyChangesArray)
         {
            _loc5_ = true;
            _loc4_ = this.filterInstance(this.mx_internal::propertyChangesArray,param1);
         }
         if(_loc4_)
         {
            _loc2_ = IEffectInstance(new this.instanceClass(param1));
            this.initInstance(_loc2_);
            if(_loc5_)
            {
               _loc6_ = this.mx_internal::propertyChangesArray.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(this.mx_internal::propertyChangesArray[_loc7_].target == param1)
                  {
                     _loc2_.propertyChanges = this.mx_internal::propertyChangesArray[_loc7_];
                  }
                  _loc7_++;
               }
            }
            EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_START,this.effectStartHandler);
            EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_STOP,this.effectStopHandler);
            EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_END,this.effectEndHandler);
            this._instances.push(_loc2_);
            if(this.triggerEvent)
            {
               _loc2_.initEffect(this.triggerEvent);
            }
         }
         return _loc2_;
      }
      
      protected function initInstance(param1:IEffectInstance) : void
      {
         param1.duration = this.duration;
         Object(param1).durationExplicitlySet = this.mx_internal::durationExplicitlySet;
         param1.effect = this;
         param1.effectTargetHost = this.effectTargetHost;
         param1.hideFocusRing = this.hideFocusRing;
         param1.repeatCount = this.repeatCount;
         param1.repeatDelay = this.repeatDelay;
         param1.startDelay = this.startDelay;
         param1.suspendBackgroundProcessing = this.suspendBackgroundProcessing;
      }
      
      public function deleteInstance(param1:IEffectInstance) : void
      {
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_START,this.effectStartHandler);
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_STOP,this.effectStopHandler);
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_END,this.effectEndHandler);
         var _loc2_:int = this._instances.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._instances[_loc3_] === param1)
            {
               this._instances.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      public function play(param1:Array = null, param2:Boolean = false) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         this.effectStopped = false;
         this.isPaused = false;
         this.mx_internal::playReversed = param2;
         if(param1 == null && this.mx_internal::propertyChangesArray != null)
         {
            if(this._callValidateNow)
            {
               LayoutManager.getInstance().validateNow();
            }
            if(!this.endValuesCaptured)
            {
               this.mx_internal::propertyChangesArray = this.mx_internal::captureValues(this.mx_internal::propertyChangesArray,false);
            }
            this.mx_internal::propertyChangesArray = stripUnchangedValues(this.mx_internal::propertyChangesArray);
            this.mx_internal::applyStartValues(this.mx_internal::propertyChangesArray,this.targets);
            if(param2)
            {
               _loc6_ = 0;
               while(_loc6_ < this.mx_internal::propertyChangesArray.length)
               {
                  _loc7_ = this.mx_internal::propertyChangesArray[_loc6_].start;
                  this.mx_internal::propertyChangesArray[_loc6_].start = this.mx_internal::propertyChangesArray[_loc6_].end;
                  this.mx_internal::propertyChangesArray[_loc6_].end = _loc7_;
                  _loc6_++;
               }
            }
            LayoutManager.getInstance().validateNow();
            this.mx_internal::applyEndValuesWhenDone = true;
         }
         var _loc3_:Array = this.createInstances(param1);
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = IEffectInstance(_loc3_[_loc5_]);
            Object(_loc8_).playReversed = param2;
            _loc8_.startEffect();
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function pause() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying && !this.isPaused)
         {
            this.isPaused = true;
            _loc1_ = this._instances.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(this._instances[_loc2_]).pause();
               _loc2_++;
            }
         }
      }
      
      public function stop() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = this._instances.length - 1;
         var _loc2_:int = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = IEffectInstance(this._instances[_loc2_]);
            if(_loc3_)
            {
               _loc3_.stop();
            }
            _loc2_--;
         }
      }
      
      public function resume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying && this.isPaused)
         {
            this.isPaused = false;
            _loc1_ = this._instances.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(this._instances[_loc2_]).resume();
               _loc2_++;
            }
         }
      }
      
      public function reverse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.isPlaying)
         {
            _loc1_ = this._instances.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(this._instances[_loc2_]).reverse();
               _loc2_++;
            }
         }
      }
      
      public function end(param1:IEffectInstance = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(param1)
         {
            param1.end();
         }
         else
         {
            _loc2_ = this._instances.length;
            _loc3_ = _loc2_ - 1;
            while(_loc3_ >= 0)
            {
               if(_loc4_ = IEffectInstance(this._instances[_loc3_]))
               {
                  _loc4_.end();
               }
               _loc3_--;
            }
         }
      }
      
      protected function filterInstance(param1:Array, param2:Object) : Boolean
      {
         if(this.mx_internal::filterObject)
         {
            return this.mx_internal::filterObject.filterInstance(param1,this.effectTargetHost,param2);
         }
         return true;
      }
      
      public function captureStartValues() : void
      {
         if(this.targets.length > 0)
         {
            this.mx_internal::propertyChangesArray = this.mx_internal::captureValues(null,true);
            this._callValidateNow = true;
         }
         this.endValuesCaptured = false;
      }
      
      public function captureMoreStartValues(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length > 0)
         {
            _loc2_ = this.mx_internal::captureValues(null,true);
            this.mx_internal::propertyChangesArray = this.mx_internal::propertyChangesArray != null ? this.mx_internal::propertyChangesArray.concat(_loc2_) : _loc2_;
         }
      }
      
      public function captureEndValues() : void
      {
         this.mx_internal::propertyChangesArray = this.mx_internal::captureValues(this.mx_internal::propertyChangesArray,false);
         this.endValuesCaptured = true;
      }
      
      mx_internal function captureValues(param1:Array, param2:Boolean, param3:Array = null) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:* = undefined;
         if(!param1)
         {
            param1 = [];
            _loc4_ = this.targets.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               param1.push(new PropertyChanges(this.targets[_loc5_]));
               _loc5_++;
            }
         }
         var _loc6_:Array;
         if((Boolean(_loc6_ = !this.mx_internal::filterObject ? this.relevantProperties : mergeArrays(this.relevantProperties,this.mx_internal::filterObject.filterProperties))) && _loc6_.length > 0)
         {
            _loc4_ = param1.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc8_ = param1[_loc5_].target;
               if(param3 == null || param3.length == 0 || param3.indexOf(_loc8_) >= 0)
               {
                  _loc7_ = param2 ? param1[_loc5_].start : param1[_loc5_].end;
                  _loc9_ = _loc6_.length;
                  _loc10_ = 0;
                  while(_loc10_ < _loc9_)
                  {
                     if(_loc7_[_loc6_[_loc10_]] === undefined)
                     {
                        _loc7_[_loc6_[_loc10_]] = this.getValueFromTarget(_loc8_,_loc6_[_loc10_]);
                     }
                     _loc10_++;
                  }
               }
               _loc5_++;
            }
         }
         var _loc11_:Array;
         if((Boolean(_loc11_ = !this.mx_internal::filterObject ? this.relevantStyles : mergeArrays(this.relevantStyles,this.mx_internal::filterObject.filterStyles))) && _loc11_.length > 0)
         {
            _loc4_ = param1.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc8_ = param1[_loc5_].target;
               if(param3 == null || param3.length == 0 || param3.indexOf(_loc8_) >= 0)
               {
                  if(_loc8_ is IStyleClient)
                  {
                     _loc7_ = param2 ? param1[_loc5_].start : param1[_loc5_].end;
                     _loc9_ = _loc11_.length;
                     _loc10_ = 0;
                     while(_loc10_ < _loc9_)
                     {
                        if(_loc7_[_loc11_[_loc10_]] === undefined)
                        {
                           _loc12_ = _loc8_.getStyle(_loc11_[_loc10_]);
                           _loc7_[_loc11_[_loc10_]] = _loc12_;
                        }
                        _loc10_++;
                     }
                  }
               }
               _loc5_++;
            }
         }
         return param1;
      }
      
      protected function getValueFromTarget(param1:Object, param2:String) : *
      {
         if(param2 in param1)
         {
            return param1[param2];
         }
         return undefined;
      }
      
      mx_internal function applyStartValues(param1:Array, param2:Array) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = null;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc3_:Array = this.relevantProperties;
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = param1[_loc5_].target;
            _loc9_ = false;
            _loc6_ = param2.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(param2[_loc7_] == _loc8_)
               {
                  _loc9_ = this.filterInstance(param1,_loc8_);
                  break;
               }
               _loc7_++;
            }
            if(_loc9_)
            {
               _loc6_ = _loc3_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc10_ = _loc3_[_loc7_];
                  _loc11_ = param1[_loc5_].start[_loc10_];
                  _loc12_ = param1[_loc5_].end[_loc10_];
                  if(_loc10_ in param1[_loc5_].start && _loc12_ != _loc11_ && (!(_loc11_ is Number) || !(isNaN(_loc12_) && isNaN(_loc11_))))
                  {
                     this.applyValueToTarget(_loc8_,_loc3_[_loc7_],param1[_loc5_].start[_loc3_[_loc7_]],param1[_loc5_].start);
                  }
                  _loc7_++;
               }
               _loc6_ = this.relevantStyles.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc13_ = this.relevantStyles[_loc7_];
                  _loc14_ = param1[_loc5_].start[_loc13_];
                  _loc15_ = param1[_loc5_].end[_loc13_];
                  if(_loc13_ in param1[_loc5_].start && _loc15_ != _loc14_ && (!(_loc14_ is Number) || !(isNaN(_loc15_) && isNaN(_loc14_))) && _loc8_ is IStyleClient)
                  {
                     if(param1[_loc5_].end[this.relevantStyles[_loc7_]] !== undefined)
                     {
                        _loc8_.setStyle(this.relevantStyles[_loc7_],param1[_loc5_].start[this.relevantStyles[_loc7_]]);
                     }
                     else
                     {
                        _loc8_.clearStyle(this.relevantStyles[_loc7_]);
                     }
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
      }
      
      mx_internal function applyEndValues(param1:Array, param2:Array) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = null;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         if(!this.applyTransitionEndProperties)
         {
            return;
         }
         var _loc3_:Array = this.relevantProperties;
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = param1[_loc5_].target;
            _loc9_ = false;
            _loc6_ = param2.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(param2[_loc7_] == _loc8_)
               {
                  _loc9_ = this.filterInstance(param1,_loc8_);
                  break;
               }
               _loc7_++;
            }
            if(_loc9_)
            {
               _loc6_ = _loc3_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc10_ = _loc3_[_loc7_];
                  _loc11_ = param1[_loc5_].start[_loc10_];
                  _loc12_ = param1[_loc5_].end[_loc10_];
                  if(_loc10_ in param1[_loc5_].end && (!(_loc12_ is Number) || !(isNaN(_loc12_) && isNaN(_loc11_))))
                  {
                     this.applyValueToTarget(_loc8_,_loc10_,param1[_loc5_].end[_loc10_],param1[_loc5_].end);
                  }
                  _loc7_++;
               }
               _loc6_ = this.relevantStyles.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc13_ = this.relevantStyles[_loc7_];
                  _loc14_ = param1[_loc5_].start[_loc13_];
                  _loc15_ = param1[_loc5_].end[_loc13_];
                  if(_loc13_ in param1[_loc5_].end && (!(_loc15_ is Number) || !(isNaN(_loc15_) && isNaN(_loc14_))) && _loc8_ is IStyleClient)
                  {
                     if(param1[_loc5_].end[_loc13_] !== undefined)
                     {
                        _loc8_.setStyle(_loc13_,param1[_loc5_].end[_loc13_]);
                     }
                     else
                     {
                        _loc8_.clearStyle(_loc13_);
                     }
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
      }
      
      protected function applyValueToTarget(param1:Object, param2:String, param3:*, param4:Object) : void
      {
         if(param2 in param1)
         {
            try
            {
               if(this.mx_internal::applyActualDimensions && param1 is IFlexDisplayObject && param2 == "height")
               {
                  param1.setActualSize(param1.width,param3);
               }
               else if(this.mx_internal::applyActualDimensions && param1 is IFlexDisplayObject && param2 == "width")
               {
                  param1.setActualSize(param3,param1.height);
               }
               else
               {
                  param1[param2] = param3;
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      protected function effectStartHandler(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
      }
      
      protected function effectStopHandler(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
         this.effectStopped = true;
      }
      
      protected function effectEndHandler(param1:EffectEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(this.mx_internal::playReversed && this.mx_internal::propertyChangesArray != null)
         {
            _loc4_ = 0;
            while(_loc4_ < this.mx_internal::propertyChangesArray.length)
            {
               _loc5_ = this.mx_internal::propertyChangesArray[_loc4_].start;
               this.mx_internal::propertyChangesArray[_loc4_].start = this.mx_internal::propertyChangesArray[_loc4_].end;
               this.mx_internal::propertyChangesArray[_loc4_].end = _loc5_;
               _loc4_++;
            }
         }
         var _loc2_:Boolean = !this._instances || this._instances.length == 1;
         if(this.mx_internal::applyEndValuesWhenDone && !this.effectStopped && _loc2_)
         {
            this.mx_internal::applyEndValues(this.mx_internal::propertyChangesArray,this.targets);
         }
         var _loc3_:IEffectInstance = IEffectInstance(param1.effectInstance);
         this.deleteInstance(_loc3_);
         dispatchEvent(param1);
         if(_loc2_)
         {
            this.mx_internal::propertyChangesArray = null;
            this.mx_internal::applyEndValuesWhenDone = false;
         }
      }
   }
}
