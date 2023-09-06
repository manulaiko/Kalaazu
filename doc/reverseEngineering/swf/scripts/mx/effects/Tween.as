package mx.effects
{
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.TweenEvent;
   
   public class Tween extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var activeTweens:Array = [];
      
      private static var interval:Number = 10;
      
      private static var timer:Timer = null;
      
      mx_internal static var intervalTime:Number = NaN;
       
      
      mx_internal var needToLayout:Boolean = false;
      
      private var id:int;
      
      private var maxDelay:Number = 87.5;
      
      private var arrayMode:Boolean;
      
      private var _doSeek:Boolean = false;
      
      private var _isPlaying:Boolean = true;
      
      private var _doReverse:Boolean = false;
      
      mx_internal var startTime:Number;
      
      private var previousUpdateTime:Number;
      
      private var userEquation:Function;
      
      private var updateFunction:Function;
      
      private var endFunction:Function;
      
      private var endValue:Object;
      
      private var startValue:Object;
      
      private var started:Boolean = false;
      
      public var duration:Number = 3000;
      
      public var listener:Object;
      
      private var _playheadTime:Number = 0;
      
      private var _invertValues:Boolean = false;
      
      public function Tween(param1:Object, param2:Object, param3:Object, param4:Number = -1, param5:Number = -1, param6:Function = null, param7:Function = null)
      {
         this.userEquation = this.defaultEasingFunction;
         super();
         if(!param1)
         {
            return;
         }
         if(param2 is Array)
         {
            this.arrayMode = true;
         }
         this.listener = param1;
         this.startValue = param2;
         this.endValue = param3;
         if(!isNaN(param4) && param4 != -1)
         {
            this.duration = param4;
         }
         if(!isNaN(param5) && param5 != -1)
         {
            this.maxDelay = 1000 / param5;
         }
         this.updateFunction = param6;
         this.endFunction = param7;
         if(param4 == 0)
         {
            this.id = -1;
            this.endTween();
         }
         else
         {
            Tween.addTween(this);
         }
      }
      
      private static function addTween(param1:Tween) : void
      {
         param1.id = mx_internal::activeTweens.length;
         mx_internal::activeTweens.push(param1);
         if(!timer)
         {
            timer = new Timer(interval);
            timer.addEventListener(TimerEvent.TIMER,timerHandler);
            timer.start();
         }
         else
         {
            timer.start();
         }
         if(isNaN(mx_internal::intervalTime))
         {
            mx_internal::intervalTime = getTimer();
         }
         param1.mx_internal::startTime = param1.previousUpdateTime = mx_internal::intervalTime;
      }
      
      private static function removeTweenAt(param1:int) : void
      {
         var _loc4_:* = null;
         if(param1 >= mx_internal::activeTweens.length || param1 < 0)
         {
            return;
         }
         mx_internal::activeTweens.splice(param1,1);
         var _loc2_:int = 0;
         var _loc3_:int = param1;
         while(_loc3_ < _loc2_)
         {
            --(_loc4_ = Tween(mx_internal::activeTweens[_loc3_])).id;
            _loc3_++;
         }
         if(_loc2_ == 0)
         {
            mx_internal::intervalTime = NaN;
            timer.reset();
         }
      }
      
      mx_internal static function removeTween(param1:Tween) : void
      {
         removeTweenAt(param1.id);
      }
      
      private static function timerHandler(param1:TimerEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:Number = mx_internal::intervalTime;
         mx_internal::intervalTime = getTimer();
         var _loc4_:int;
         var _loc5_:int = _loc4_ = 0;
         while(_loc5_ >= 0)
         {
            if(_loc6_ = Tween(mx_internal::activeTweens[_loc5_]))
            {
               _loc6_.mx_internal::needToLayout = false;
               _loc6_.mx_internal::doInterval();
               if(_loc6_.mx_internal::needToLayout)
               {
                  _loc2_ = true;
               }
            }
            _loc5_--;
         }
         if(_loc2_)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateNow();
         }
         param1.updateAfterEvent();
      }
      
      mx_internal function get playheadTime() : Number
      {
         return this._playheadTime;
      }
      
      mx_internal function get playReversed() : Boolean
      {
         return this._invertValues;
      }
      
      mx_internal function set playReversed(param1:Boolean) : void
      {
         this._invertValues = param1;
      }
      
      public function setTweenHandlers(param1:Function, param2:Function) : void
      {
         this.updateFunction = param1;
         this.endFunction = param2;
      }
      
      public function set easingFunction(param1:Function) : void
      {
         this.userEquation = param1;
      }
      
      public function endTween() : void
      {
         var _loc1_:TweenEvent = new TweenEvent(TweenEvent.TWEEN_END);
         var _loc2_:Object = this.mx_internal::getCurrentValue(this.duration);
         _loc1_.value = _loc2_;
         dispatchEvent(_loc1_);
         if(this.endFunction != null)
         {
            this.endFunction(_loc2_);
         }
         else
         {
            this.listener.onTweenEnd(_loc2_);
         }
         if(this.id >= 0)
         {
            Tween.removeTweenAt(this.id);
         }
      }
      
      mx_internal function doInterval() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Boolean = false;
         this.previousUpdateTime = mx_internal::intervalTime;
         if(this._isPlaying || this._doSeek)
         {
            _loc2_ = mx_internal::intervalTime - this.mx_internal::startTime;
            this._playheadTime = _loc2_;
            _loc3_ = this.mx_internal::getCurrentValue(_loc2_);
            if(_loc2_ >= this.duration && !this._doSeek)
            {
               this.endTween();
               _loc1_ = true;
            }
            else
            {
               if(!this.started)
               {
                  _loc5_ = new TweenEvent(TweenEvent.TWEEN_START);
                  dispatchEvent(_loc5_);
                  this.started = true;
               }
               (_loc4_ = new TweenEvent(TweenEvent.TWEEN_UPDATE)).value = _loc3_;
               dispatchEvent(_loc4_);
               if(this.updateFunction != null)
               {
                  this.updateFunction(_loc3_);
               }
               else
               {
                  this.listener.onTweenUpdate(_loc3_);
               }
            }
            this._doSeek = false;
         }
         return _loc1_;
      }
      
      mx_internal function getCurrentValue(param1:Number) : Object
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.duration == 0)
         {
            return this.endValue;
         }
         if(this._invertValues)
         {
            param1 = this.duration - param1;
         }
         if(this.arrayMode)
         {
            _loc2_ = [];
            _loc3_ = int(this.startValue.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_[_loc4_] = this.userEquation(param1,this.startValue[_loc4_],Number(this.endValue[_loc4_]) - Number(this.startValue[_loc4_]),this.duration);
               _loc4_++;
            }
            return _loc2_;
         }
         return this.userEquation(param1,this.startValue,Number(this.endValue) - Number(this.startValue),this.duration);
      }
      
      private function defaultEasingFunction(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 / 2 * (Math.sin(0 * (param1 / param4 - 0.5)) + 1) + param2;
      }
      
      public function seek(param1:Number) : void
      {
         var _loc2_:Number = mx_internal::intervalTime;
         this.previousUpdateTime = _loc2_;
         this.mx_internal::startTime = _loc2_ - param1;
         this._doSeek = true;
         this.mx_internal::doInterval();
      }
      
      public function reverse() : void
      {
         if(this._isPlaying)
         {
            this._doReverse = false;
            this.seek(this.duration - this._playheadTime);
            this._invertValues = !this._invertValues;
         }
         else
         {
            this._doReverse = !this._doReverse;
         }
      }
      
      public function pause() : void
      {
         this._isPlaying = false;
      }
      
      public function stop() : void
      {
         if(this.id >= 0)
         {
            Tween.removeTweenAt(this.id);
         }
      }
      
      public function resume() : void
      {
         this._isPlaying = true;
         this.mx_internal::startTime = mx_internal::intervalTime - this._playheadTime;
         if(this._doReverse)
         {
            this.reverse();
            this._doReverse = false;
         }
      }
   }
}
