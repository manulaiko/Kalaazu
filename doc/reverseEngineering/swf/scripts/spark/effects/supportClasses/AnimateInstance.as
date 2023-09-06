package spark.effects.supportClasses
{
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.Effect;
   import mx.effects.EffectInstance;
   import mx.events.EffectEvent;
   import mx.managers.SystemManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.styles.IStyleClient;
   import spark.effects.animation.Animation;
   import spark.effects.animation.IAnimationTarget;
   import spark.effects.animation.Keyframe;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.effects.easing.IEaser;
   import spark.effects.interpolation.IInterpolator;
   import spark.primitives.supportClasses.GraphicElement;
   
   public class AnimateInstance extends EffectInstance implements IAnimationTarget
   {
       
      
      public var animation:Animation;
      
      private var isStyleMap:Object;
      
      private var _seekTime:Number = 0;
      
      private var reverseAnimation:Boolean;
      
      private var needsRemoval:Boolean;
      
      private var numUpdateListeners:int = 0;
      
      private var resourceManager:IResourceManager;
      
      private var oldWidth:Number;
      
      private var oldHeight:Number;
      
      private var disabledConstraintsMap:Object;
      
      private var _motionPaths:Vector.<MotionPath>;
      
      protected var autoRemoveTarget:Boolean = false;
      
      public var disableLayout:Boolean;
      
      private var _easer:IEaser;
      
      private var _interpolator:IInterpolator;
      
      private var _repeatBehavior:String;
      
      private var constraintsHolder:Object;
      
      public function AnimateInstance(param1:Object)
      {
         this.isStyleMap = new Object();
         this.resourceManager = ResourceManager.getInstance();
         super(param1);
      }
      
      override public function set suspendBackgroundProcessing(param1:Boolean) : void
      {
      }
      
      public function get motionPaths() : Vector.<MotionPath>
      {
         return this._motionPaths;
      }
      
      public function set motionPaths(param1:Vector.<MotionPath>) : void
      {
         if(!this._motionPaths)
         {
            this._motionPaths = param1;
         }
      }
      
      public function set easer(param1:IEaser) : void
      {
         this._easer = param1;
      }
      
      public function get easer() : IEaser
      {
         return this._easer;
      }
      
      public function set interpolator(param1:IInterpolator) : void
      {
         this._interpolator = param1;
      }
      
      public function get interpolator() : IInterpolator
      {
         return this._interpolator;
      }
      
      public function set repeatBehavior(param1:String) : void
      {
         this._repeatBehavior = param1;
      }
      
      public function get repeatBehavior() : String
      {
         return this._repeatBehavior;
      }
      
      override mx_internal function set playReversed(param1:Boolean) : void
      {
         super.mx_internal::playReversed = param1;
         if(param1 && Boolean(this.animation))
         {
            this.animation.mx_internal::reverse();
         }
         this.reverseAnimation = param1;
      }
      
      override public function get playheadTime() : Number
      {
         return !!this.animation ? this.animation.playheadTime : this._seekTime;
      }
      
      override public function set playheadTime(param1:Number) : void
      {
         if(this.animation)
         {
            this.animation.playheadTime = param1;
         }
         this._seekTime = param1;
      }
      
      override public function pause() : void
      {
         super.pause();
         if(this.animation)
         {
            this.animation.pause();
         }
      }
      
      override public function stop() : void
      {
         super.stop();
         if(this.animation)
         {
            this.animation.stop();
         }
      }
      
      override public function resume() : void
      {
         super.resume();
         if(this.animation)
         {
            this.animation.resume();
         }
      }
      
      override public function reverse() : void
      {
         super.reverse();
         if(this.animation)
         {
            this.animation.mx_internal::reverse();
         }
         this.reverseAnimation = !this.reverseAnimation;
      }
      
      override public function end() : void
      {
         if(this.animation)
         {
            this.animation.end();
            this.animation = null;
         }
         super.end();
      }
      
      override public function startEffect() : void
      {
         if(target is UIComponent)
         {
            UIComponent(target).effectStarted(this);
         }
         if(this.autoRemoveTarget)
         {
            this.addDisappearingTarget();
         }
         this.play();
      }
      
      override public function play() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super.play();
         if(!this.motionPaths || this.motionPaths.length == 0)
         {
            (_loc5_ = new Timer(duration,1)).addEventListener(TimerEvent.TIMER,this.noopAnimationHandler);
            _loc5_.start();
            return;
         }
         this.isStyleMap = new Array(this.motionPaths.length);
         _loc3_ = 0;
         while(_loc3_ < this.motionPaths.length)
         {
            if(_loc7_ = (_loc6_ = MotionPath(this.motionPaths[_loc3_])).keyframes)
            {
               if(propertyChanges != null && (_loc6_.property == "left" || _loc6_.property == "right" || _loc6_.property == "top" || _loc6_.property == "bottom" || _loc6_.property == "percentWidth" || _loc6_.property == "percentHeight" || _loc6_.property == "horizontalCenter" || _loc6_.property == "verticalCenter"))
               {
                  if(!this.isValidValue(propertyChanges.start[_loc6_.property]) || !this.isValidValue(propertyChanges.end[_loc6_.property]) && _loc7_.length == 2 && !this.isValidValue(_loc7_[0].value) && !this.isValidValue(_loc7_[1].value))
                  {
                     if(_loc6_.property == "percentWidth")
                     {
                        _loc6_.property = "width";
                     }
                     else if(_loc6_.property == "percentHeight")
                     {
                        _loc6_.property = "height";
                     }
                     else if(_loc6_.property == "left" || _loc6_.property == "right" || _loc6_.property == "horizontalCenter")
                     {
                        if(!this.disabledConstraintsMap)
                        {
                           this.disabledConstraintsMap = new Object();
                        }
                        this.disabledConstraintsMap[_loc6_.property] = true;
                        _loc6_.property = "x";
                        if(this.isValidValue(propertyChanges.start["width"]) && this.isValidValue(propertyChanges.end["width"]) && propertyChanges.start["width"] != propertyChanges.end["width"])
                        {
                           _loc1_ = true;
                        }
                     }
                     else
                     {
                        if(!this.disabledConstraintsMap)
                        {
                           this.disabledConstraintsMap = new Object();
                        }
                        this.disabledConstraintsMap[_loc6_.property] = true;
                        _loc6_.property = "y";
                        if(this.isValidValue(propertyChanges.start["height"]) && this.isValidValue(propertyChanges.end["height"]) && propertyChanges.start["height"] != propertyChanges.end["height"])
                        {
                           _loc2_ = true;
                        }
                     }
                  }
               }
               if(this.interpolator)
               {
                  _loc6_.interpolator = this.interpolator;
               }
               if(duration > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc7_.length)
                  {
                     if(!isNaN(_loc7_[_loc4_].time))
                     {
                        duration = Math.max(duration,_loc7_[_loc4_].time);
                     }
                     _loc4_++;
                  }
               }
            }
            _loc3_++;
         }
         if(_loc1_)
         {
            this.motionPaths.push(new SimpleMotionPath("width"));
         }
         if(_loc2_)
         {
            this.motionPaths.push(new SimpleMotionPath("height"));
         }
         this.animation = new Animation(duration);
         this.animation.animationTarget = this;
         this.animation.motionPaths = this.motionPaths;
         if(this.reverseAnimation)
         {
            this.animation.playReversed = true;
         }
         this.animation.interpolator = this.interpolator;
         this.animation.repeatCount = repeatCount;
         this.animation.repeatDelay = repeatDelay;
         this.animation.repeatBehavior = this.repeatBehavior;
         this.animation.easer = this.easer;
         this.animation.startDelay = startDelay;
         this.animation.play();
         if(this._seekTime > 0)
         {
            this.animation.playheadTime = this._seekTime;
         }
      }
      
      protected function applyValues(param1:Animation) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.motionPaths.length)
         {
            _loc3_ = this.motionPaths[_loc2_].property;
            this.setValue(_loc3_,param1.currentValue[_loc3_]);
            _loc2_++;
         }
      }
      
      private function isValidValue(param1:Object) : Boolean
      {
         return param1 is Number && !isNaN(Number(param1)) || !(param1 is Number) && param1 !== null;
      }
      
      private function finalizeValues() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.motionPaths.length)
         {
            if(!(!(_loc6_ = (_loc5_ = MotionPath(this.motionPaths[_loc4_])).keyframes) || _loc6_.length == 0))
            {
               if(!this.isValidValue(_loc6_[0].value))
               {
                  if(_loc6_.length > 0 && this.isValidValue(_loc6_[1].valueBy) && this.isValidValue(_loc6_[1].value))
                  {
                     _loc6_[0].value = _loc5_.interpolator.decrement(_loc6_[1].value,_loc6_[1].valueBy);
                  }
                  else if((mx_internal::playReversed || Effect(effect).mx_internal::transitionInterruption) && propertyChanges && propertyChanges.start[_loc5_.property] !== undefined)
                  {
                     _loc6_[0].value = propertyChanges.start[_loc5_.property];
                  }
                  else
                  {
                     _loc6_[0].value = this.getCurrentValue(_loc5_.property);
                  }
               }
               _loc3_ = _loc6_[0].value;
               _loc2_ = 1;
               while(_loc2_ < _loc6_.length)
               {
                  _loc7_ = Keyframe(_loc6_[_loc2_]);
                  if(!this.isValidValue(_loc7_.value))
                  {
                     if(this.isValidValue(_loc7_.valueBy))
                     {
                        _loc7_.value = _loc5_.interpolator.increment(_loc3_,_loc7_.valueBy);
                     }
                     else if(_loc2_ <= _loc6_.length - 2 && this.isValidValue(_loc6_[_loc2_ + 1].value) && this.isValidValue(_loc6_[_loc2_ + 1].valueBy))
                     {
                        _loc7_.value = _loc5_.interpolator.decrement(_loc6_[_loc2_ + 1].value,_loc6_[_loc2_ + 1].valueBy);
                     }
                     else if(_loc2_ == _loc6_.length - 1 && propertyChanges && propertyChanges.end[_loc5_.property] !== undefined)
                     {
                        _loc7_.value = propertyChanges.end[_loc5_.property];
                     }
                     else
                     {
                        _loc7_.value = _loc3_;
                     }
                  }
                  _loc3_ = _loc7_.value;
                  _loc2_++;
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      protected function setupConstraintAnimation(param1:String) : void
      {
         var _loc2_:* = propertyChanges.start[param1];
         var _loc3_:* = propertyChanges.end[param1];
         if(_loc2_ !== undefined && _loc3_ !== undefined && _loc2_ !== null && _loc3_ !== null && !isNaN(_loc2_) && !isNaN(_loc3_) && _loc2_ != _loc3_)
         {
            this.motionPaths.push(new SimpleMotionPath(param1,_loc2_,_loc3_));
         }
      }
      
      public function animationStart(param1:Animation) : void
      {
         var _loc2_:* = null;
         if(this.disableLayout)
         {
            this.setupParentLayout(false);
            this.cacheConstraints();
         }
         else if(this.disabledConstraintsMap)
         {
            for(_loc2_ in this.disabledConstraintsMap)
            {
               this.cacheConstraint(_loc2_);
            }
            this.disabledConstraintsMap = null;
         }
         this.finalizeValues();
      }
      
      public function animationUpdate(param1:Animation) : void
      {
         var _loc2_:* = null;
         this.applyValues(param1);
         if(this.numUpdateListeners > 0)
         {
            _loc2_ = new EffectEvent(EffectEvent.EFFECT_UPDATE);
            _loc2_.effectInstance = this;
            dispatchEvent(_loc2_);
         }
      }
      
      public function animationRepeat(param1:Animation) : void
      {
         var _loc2_:EffectEvent = new EffectEvent(EffectEvent.EFFECT_REPEAT);
         _loc2_.effectInstance = this;
         dispatchEvent(_loc2_);
      }
      
      private function animationCleanup() : void
      {
         if(this.disableLayout)
         {
            this.reenableConstraints();
            if(this.disableLayout)
            {
               this.setupParentLayout(true);
            }
         }
      }
      
      public function animationEnd(param1:Animation) : void
      {
         this.animationCleanup();
         this.finishEffect();
      }
      
      public function animationStop(param1:Animation) : void
      {
         this.animationCleanup();
      }
      
      private function noopAnimationHandler(param1:TimerEvent) : void
      {
         this.finishEffect();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            ++this.numUpdateListeners;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            --this.numUpdateListeners;
         }
      }
      
      override public function finishEffect() : void
      {
         if(this.autoRemoveTarget)
         {
            this.removeDisappearingTarget();
         }
         super.finishEffect();
      }
      
      private function addDisappearingTarget() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.needsRemoval = false;
         if(propertyChanges)
         {
            if("parent" in target && true)
            {
               _loc1_ = propertyChanges.start["parent"];
               _loc2_ = propertyChanges.end["parent"];
               if(mx_internal::playReversed)
               {
                  _loc3_ = _loc1_;
                  _loc1_ = _loc2_;
                  _loc2_ = _loc3_;
               }
               if(_loc1_ && !_loc2_ && (_loc1_ is IVisualElementContainer || _loc1_ is SystemManager))
               {
                  _loc4_ = !mx_internal::playReversed ? propertyChanges.start["index"] : propertyChanges.end["index"];
                  if(_loc1_ is IVisualElementContainer)
                  {
                     _loc5_ = IVisualElementContainer(_loc1_);
                     if(_loc4_ !== undefined && _loc4_ <= _loc5_.numElements)
                     {
                        _loc5_.addElementAt(target as IVisualElement,int(_loc4_));
                     }
                     else
                     {
                        _loc5_.addElement(target as IVisualElement);
                     }
                  }
                  else
                  {
                     _loc6_ = _loc1_ as SystemManager;
                     if(_loc4_ !== undefined && _loc4_ <= _loc6_.numChildren)
                     {
                        _loc6_.addChildAt(target as DisplayObject,int(_loc4_));
                     }
                     else
                     {
                        _loc6_.addChild(target as DisplayObject);
                     }
                  }
                  if(target is GraphicElement)
                  {
                     GraphicElement(target).validateNow();
                  }
                  this.needsRemoval = true;
               }
            }
         }
      }
      
      private function removeDisappearingTarget() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(this.needsRemoval && Boolean(propertyChanges))
         {
            if("parent" in target && false)
            {
               _loc1_ = propertyChanges.start["parent"];
               _loc2_ = propertyChanges.end["parent"];
               if(mx_internal::playReversed)
               {
                  _loc3_ = _loc1_;
                  _loc1_ = _loc2_;
                  _loc2_ = _loc3_;
               }
               if(_loc1_ && !_loc2_)
               {
                  if(_loc1_ is IVisualElementContainer)
                  {
                     IVisualElementContainer(_loc1_).removeElement(target as IVisualElement);
                  }
                  else
                  {
                     _loc1_.removeChild(target);
                  }
               }
            }
         }
      }
      
      private function reenableConstraint(param1:String) : void
      {
         var _loc2_:* = this.constraintsHolder[param1];
         if(_loc2_ !== undefined)
         {
            if(param1 in target)
            {
               target[param1] = _loc2_;
            }
            else
            {
               target.setStyle(param1,_loc2_);
            }
            delete this.constraintsHolder[param1];
         }
      }
      
      private function reenableConstraints() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(this.constraintsHolder)
         {
            _loc1_ = this.reenableConstraint("left");
            _loc2_ = this.reenableConstraint("right");
            _loc3_ = this.reenableConstraint("top");
            _loc4_ = this.reenableConstraint("bottom");
            this.reenableConstraint("horizontalCenter");
            this.reenableConstraint("verticalCenter");
            this.reenableConstraint("baseline");
            this.constraintsHolder = null;
            if(_loc1_ != undefined && _loc2_ != undefined && "explicitWidth" in target)
            {
               target.explicitWidth = this.oldWidth;
            }
            if(_loc3_ != undefined && _loc4_ != undefined && "explicitHeight" in target)
            {
               target.explicitHeight = this.oldHeight;
            }
         }
      }
      
      private function cacheConstraint(param1:String) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = param1 in target;
         if(_loc2_)
         {
            _loc3_ = target[param1];
         }
         else
         {
            _loc3_ = target.getStyle(param1);
         }
         if(!isNaN(_loc3_) && _loc3_ != null)
         {
            if(!this.constraintsHolder)
            {
               this.constraintsHolder = new Object();
            }
            this.constraintsHolder[param1] = _loc3_;
            if(_loc2_)
            {
               target[param1] = NaN;
            }
            else if(target is IStyleClient)
            {
               target.setStyle(param1,undefined);
            }
         }
         return _loc3_;
      }
      
      private function cacheConstraints() : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:* = this.cacheConstraint("left");
         var _loc2_:* = this.cacheConstraint("right");
         var _loc3_:* = this.cacheConstraint("top");
         var _loc4_:* = this.cacheConstraint("bottom");
         this.cacheConstraint("verticalCenter");
         this.cacheConstraint("horizontalCenter");
         this.cacheConstraint("baseline");
         if(_loc1_ != undefined && _loc2_ != undefined && "explicitWidth" in target)
         {
            _loc5_ = 0;
            this.oldWidth = target.explicitWidth;
            target.width = _loc5_;
         }
         if(_loc3_ != undefined && _loc4_ != undefined && "explicitHeight" in target)
         {
            _loc6_ = 0;
            this.oldHeight = target.explicitHeight;
            target.height = _loc6_;
         }
      }
      
      protected function setupStyleMapEntry(param1:String) : void
      {
         var property:String = param1;
         if(this.isStyleMap[property] == undefined)
         {
            if(property in target)
            {
               this.isStyleMap[property] = false;
            }
            else
            {
               try
               {
                  target.getStyle(property);
                  this.isStyleMap[property] = true;
               }
               catch(err:Error)
               {
                  throw new Error(resourceManager.getString("sparkEffects","propNotPropOrStyle",[property,target,err]));
               }
            }
         }
      }
      
      protected function setValue(param1:String, param2:Object) : void
      {
         this.setupStyleMapEntry(param1);
         if(!this.isStyleMap[param1])
         {
            target[param1] = param2;
         }
         else
         {
            target.setStyle(param1,param2);
         }
      }
      
      protected function getCurrentValue(param1:String) : *
      {
         this.setupStyleMapEntry(param1);
         if(!this.isStyleMap[param1])
         {
            return target[param1];
         }
         return target.getStyle(param1);
      }
      
      private function setupParentLayout(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if("parent" in target && false)
         {
            _loc2_ = target.parent;
         }
         if(_loc2_ && "autoLayout" in _loc2_)
         {
            _loc2_.autoLayout = param1;
         }
      }
   }
}
