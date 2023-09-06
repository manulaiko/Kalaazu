package spark.effects
{
   import mx.core.mx_internal;
   import mx.effects.Effect;
   import mx.effects.IEffectInstance;
   import mx.events.EffectEvent;
   import spark.effects.animation.MotionPath;
   import spark.effects.easing.IEaser;
   import spark.effects.easing.Sine;
   import spark.effects.interpolation.IInterpolator;
   import spark.effects.supportClasses.AnimateInstance;
   
   public class Animate extends Effect
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var defaultEaser:IEaser = new Sine(0.5);
       
      
      private var affectedProperties:Array = null;
      
      private var _relevantStyles:Array = null;
      
      private var numUpdateListeners:int = 0;
      
      private var _motionPaths:Vector.<MotionPath>;
      
      private var _easer:IEaser;
      
      private var _interpolator:IInterpolator = null;
      
      private var _repeatBehavior:String = "loop";
      
      private var _disableLayout:Boolean = false;
      
      public function Animate(param1:Object = null)
      {
         this._easer = defaultEaser;
         super(param1);
         instanceClass = AnimateInstance;
      }
      
      public function get motionPaths() : Vector.<MotionPath>
      {
         return this._motionPaths;
      }
      
      public function set motionPaths(param1:Vector.<MotionPath>) : void
      {
         this._motionPaths = param1;
      }
      
      public function get easer() : IEaser
      {
         return this._easer;
      }
      
      public function set easer(param1:IEaser) : void
      {
         this._easer = param1;
      }
      
      public function get interpolator() : IInterpolator
      {
         return this._interpolator;
      }
      
      public function set interpolator(param1:IInterpolator) : void
      {
         this._interpolator = param1;
      }
      
      public function get repeatBehavior() : String
      {
         return this._repeatBehavior;
      }
      
      public function set repeatBehavior(param1:String) : void
      {
         this._repeatBehavior = param1;
      }
      
      public function get disableLayout() : Boolean
      {
         return this._disableLayout;
      }
      
      public function set disableLayout(param1:Boolean) : void
      {
         this._disableLayout = param1;
      }
      
      override public function getAffectedProperties() : Array
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(!this.affectedProperties)
         {
            if(this.motionPaths)
            {
               this.affectedProperties = new Array();
               _loc3_ = 0;
               while(_loc3_ < this.motionPaths.length)
               {
                  _loc4_ = MotionPath(this.motionPaths[_loc3_]);
                  this.affectedProperties.push(_loc4_.property);
                  switch(_loc4_.property)
                  {
                     case "left":
                     case "right":
                     case "horizontalCenter":
                        _loc1_ = true;
                        break;
                     case "top":
                     case "bottom":
                     case "verticalCenter":
                        _loc2_ = true;
                        break;
                     case "width":
                        if(this.affectedProperties.indexOf("explicitWidth") < 0)
                        {
                           this.affectedProperties.push("explicitWidth");
                        }
                        if(this.affectedProperties.indexOf("percentWidth") < 0)
                        {
                           this.affectedProperties.push("percentWidth");
                        }
                        break;
                     case "height":
                        if(this.affectedProperties.indexOf("explicitHeight") < 0)
                        {
                           this.affectedProperties.push("explicitHeight");
                        }
                        if(this.affectedProperties.indexOf("percentHeight") < 0)
                        {
                           this.affectedProperties.push("percentHeight");
                        }
                        break;
                  }
                  _loc3_++;
               }
               if(_loc1_)
               {
                  if(this.affectedProperties.indexOf("x") < 0)
                  {
                     this.affectedProperties.push("x");
                  }
                  if(this.affectedProperties.indexOf("width") < 0)
                  {
                     this.affectedProperties.push("width");
                  }
                  if(this.affectedProperties.indexOf("explicitWidth") < 0)
                  {
                     this.affectedProperties.push("explicitWidth");
                  }
               }
               if(_loc2_)
               {
                  if(this.affectedProperties.indexOf("y") < 0)
                  {
                     this.affectedProperties.push("y");
                  }
                  if(this.affectedProperties.indexOf("height") < 0)
                  {
                     this.affectedProperties.push("height");
                  }
                  if(this.affectedProperties.indexOf("explicitHeight") < 0)
                  {
                     this.affectedProperties.push("explicitHeight");
                  }
               }
            }
            else
            {
               this.affectedProperties = [];
            }
         }
         return this.affectedProperties;
      }
      
      override public function get relevantStyles() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!this._relevantStyles)
         {
            if(this.motionPaths)
            {
               this._relevantStyles = new Array(this.motionPaths.length);
               _loc1_ = 0;
               while(_loc1_ < this.motionPaths.length)
               {
                  _loc2_ = MotionPath(this.motionPaths[_loc1_]);
                  this._relevantStyles[_loc1_] = _loc2_.property;
                  _loc1_++;
               }
            }
            else
            {
               this._relevantStyles = [];
            }
         }
         return this._relevantStyles;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc3_:int = 0;
         super.initInstance(param1);
         var _loc2_:AnimateInstance = AnimateInstance(param1);
         _loc2_.addEventListener(EffectEvent.EFFECT_REPEAT,this.animationEventHandler);
         if(this.numUpdateListeners > 0)
         {
            _loc2_.addEventListener(EffectEvent.EFFECT_UPDATE,this.animationEventHandler);
         }
         if(this.easer)
         {
            _loc2_.easer = this.easer;
         }
         if(this.interpolator)
         {
            _loc2_.interpolator = this.interpolator;
         }
         if(isNaN(repeatCount))
         {
            _loc2_.repeatCount = repeatCount;
         }
         _loc2_.repeatBehavior = this.repeatBehavior;
         _loc2_.disableLayout = this.disableLayout;
         if(this.motionPaths)
         {
            _loc2_.motionPaths = new Vector.<MotionPath>();
            _loc3_ = 0;
            while(_loc3_ < this.motionPaths.length)
            {
               _loc2_.motionPaths[_loc3_] = this.motionPaths[_loc3_].clone();
               _loc3_++;
            }
         }
      }
      
      override protected function applyValueToTarget(param1:Object, param2:String, param3:*, param4:Object) : void
      {
         if(param2 in param1)
         {
            try
            {
               param1[param2] = param3;
            }
            catch(e:Error)
            {
            }
         }
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
      
      private function animationEventHandler(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
      }
      
      override mx_internal function captureValues(param1:Array, param2:Boolean, param3:Array = null) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:Array = super.mx_internal::captureValues(param1,param2,param3);
         var _loc5_:Boolean;
         if((_loc5_ = this.getAffectedProperties().indexOf("explicitWidth") >= 0 || this.getAffectedProperties().indexOf("explicitHeight") >= 0) && param2)
         {
            _loc6_ = _loc4_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(param3 == null || param3.length == 0 || param3.indexOf(_loc4_[_loc7_].target) >= 0)
               {
                  _loc4_[_loc7_].stripUnchangedValues = false;
               }
               _loc7_++;
            }
         }
         return _loc4_;
      }
      
      override mx_internal function applyStartValues(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         super.mx_internal::applyStartValues(param1,param2);
         if(param1)
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = param1[_loc4_].target;
               if(param1[_loc4_].start["percentWidth"] !== undefined && "percentWidth" in _loc5_)
               {
                  _loc5_.percentWidth = param1[_loc4_].start["percentWidth"];
               }
               if(param1[_loc4_].start["percentHeight"] !== undefined && "percentHeight" in _loc5_)
               {
                  _loc5_.percentHeight = param1[_loc4_].start["percentHeight"];
               }
               _loc4_++;
            }
         }
      }
      
      override mx_internal function applyEndValues(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         super.mx_internal::applyEndValues(param1,param2);
         if(param1)
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = param1[_loc4_].target;
               if(param1[_loc4_].end["explicitWidth"] !== undefined)
               {
                  if(isNaN(param1[_loc4_].end["explicitWidth"]) && "explicitWidth" in _loc5_)
                  {
                     _loc5_.explicitWidth = NaN;
                     if(param1[_loc4_].end["percentWidth"] !== undefined && "percentWidth" in _loc5_)
                     {
                        _loc5_.percentWidth = param1[_loc4_].end["percentWidth"];
                     }
                  }
               }
               if(param1[_loc4_].end["explicitHeight"] !== undefined)
               {
                  if(isNaN(param1[_loc4_].end["explicitHeight"]) && "explicitHeight" in _loc5_)
                  {
                     _loc5_.explicitHeight = NaN;
                     if(param1[_loc4_].end["percentHeight"] !== undefined && "percentHeight" in _loc5_)
                     {
                        _loc5_.percentHeight = param1[_loc4_].end["percentHeight"];
                     }
                  }
               }
               _loc4_++;
            }
         }
      }
   }
}
