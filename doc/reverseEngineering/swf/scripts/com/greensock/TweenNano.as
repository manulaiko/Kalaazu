package com.greensock
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class TweenNano
   {
      
      protected static var _time:Number;
      
      protected static var _frame:uint;
      
      protected static var _masterList:Dictionary = new Dictionary(false);
      
      protected static var _shape:Shape = new Shape();
      
      protected static var _tnInitted:Boolean;
      
      protected static var _reservedProps:Object = {
         "ease":1,
         "delay":1,
         "useFrames":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "runBackwards":1,
         "immediateRender":1,
         "onUpdate":1,
         "onUpdateParams":1
      };
       
      
      public var duration:Number;
      
      public var vars:Object;
      
      public var startTime:Number;
      
      public var target:Object;
      
      public var active:Boolean;
      
      public var gc:Boolean;
      
      public var useFrames:Boolean;
      
      public var ratio:Number = 0;
      
      protected var _ease:Function;
      
      protected var _initted:Boolean;
      
      protected var _propTweens:Array;
      
      public function TweenNano(param1:Object, param2:Number, param3:Object)
      {
         super();
         if(!_tnInitted)
         {
            _time = getTimer() * 0.001;
            _frame = 0;
            _shape.addEventListener(Event.ENTER_FRAME,updateAll,false,0,true);
            _tnInitted = true;
         }
         this.vars = param3;
         this.duration = param2;
         this.active = Boolean(param2 == 0 && this.vars.delay == 0 && this.vars.immediateRender != false);
         this.target = param1;
         if(typeof this.vars.ease != "function")
         {
            this._ease = TweenNano.easeOut;
         }
         else
         {
            this._ease = this.vars.ease;
         }
         this._propTweens = [];
         this.useFrames = Boolean(param3.useFrames == true);
         var _loc4_:Number = "delay" in this.vars ? Number(this.vars.delay) : 0;
         this.startTime = this.useFrames ? _frame + _loc4_ : _time + _loc4_;
         var _loc5_:Array;
         if((_loc5_ = _masterList[param1]) == null || int(this.vars.overwrite))
         {
            _masterList[param1] = [this];
         }
         else
         {
            _loc5_[_loc5_.length] = this;
         }
         if(this.vars.immediateRender == true || this.active)
         {
            this.renderTime(0);
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenNano
      {
         return new TweenNano(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenNano
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new TweenNano(param1,param2,param3);
      }
      
      public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenNano
      {
         return new TweenNano(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function updateAll(param1:Event = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         ++_frame;
         _time = getTimer() * 0.001;
         var _loc2_:Dictionary = _masterList;
         for(_loc4_ in _loc2_)
         {
            _loc3_ = _loc2_[_loc4_];
            _loc5_ = _loc3_.length;
            while(--_loc5_ > -1)
            {
               _loc6_ = (_loc7_ = _loc3_[_loc5_]).useFrames ? _frame : _time;
               if(_loc7_.active || !_loc7_.gc && _loc6_ >= _loc7_.startTime)
               {
                  _loc7_.renderTime(_loc6_ - _loc7_.startTime);
               }
               else if(_loc7_.gc)
               {
                  _loc3_.splice(_loc5_,1);
               }
            }
            if(_loc3_.length == 0)
            {
               delete _loc2_[_loc4_];
            }
         }
      }
      
      public static function killTweensOf(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 in _masterList)
         {
            if(param2)
            {
               _loc3_ = _masterList[param1];
               _loc4_ = _loc3_.length;
               while(--_loc4_ > -1)
               {
                  if(!TweenNano(_loc3_[_loc4_]).gc)
                  {
                     TweenNano(_loc3_[_loc4_]).complete(false);
                  }
               }
            }
            delete _masterList[param1];
         }
      }
      
      private static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:* = param1 / param4;
         param1 /= param4;
         return -1 * _loc5_ * (param1 - 2);
      }
      
      public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in _reservedProps))
            {
               this._propTweens[this._propTweens.length] = [_loc1_,this.target[_loc1_],typeof this.vars[_loc1_] == "number" ? Number(this.vars[_loc1_]) - Number(this.target[_loc1_]) : Number(this.vars[_loc1_])];
            }
         }
         if(this.vars.runBackwards)
         {
            _loc3_ = this._propTweens.length;
            while(--_loc3_ > -1)
            {
               _loc2_ = this._propTweens[_loc3_];
               _loc2_[1] += _loc2_[2];
               _loc2_[2] = -Number(_loc2_[2]);
            }
         }
         this._initted = true;
      }
      
      public function renderTime(param1:Number) : void
      {
         var _loc2_:* = null;
         if(!this._initted)
         {
            this.init();
         }
         var _loc3_:int = this._propTweens.length;
         if(param1 >= this.duration)
         {
            param1 = this.duration;
            this.ratio = 1;
         }
         else if(param1 <= 0)
         {
            this.ratio = 0;
         }
         else
         {
            this.ratio = this._ease(param1,0,1,this.duration);
         }
         while(--_loc3_ > -1)
         {
            _loc2_ = this._propTweens[_loc3_];
            this.target[_loc2_[0]] = _loc2_[1] + this.ratio * Number(_loc2_[2]);
         }
         if(this.vars.onUpdate)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(param1 == this.duration)
         {
            this.complete(true);
         }
      }
      
      public function complete(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this.renderTime(this.duration);
            return;
         }
         this.kill();
         if(this.vars.onComplete)
         {
            this.vars.onComplete.apply(null,this.vars.onCompleteParams);
         }
      }
      
      public function kill() : void
      {
         this.gc = true;
         this.active = false;
      }
   }
}
