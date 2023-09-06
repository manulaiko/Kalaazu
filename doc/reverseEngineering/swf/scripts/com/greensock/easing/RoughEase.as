package com.greensock.easing
{
   public class RoughEase
   {
      
      private static var _all:Object = {};
      
      private static var _count:uint = 0;
       
      
      private var _name:String;
      
      private var _first:EasePoint;
      
      private var _last:EasePoint;
      
      public function RoughEase(param1:Number = 1, param2:uint = 20, param3:Boolean = false, param4:Function = null, param5:String = "none", param6:Boolean = true, param7:String = "")
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null;
         super();
         if(param7 == "")
         {
            ++_count;
            this._name = "roughEase" + _count;
         }
         else
         {
            this._name = param7;
         }
         if(param5 == "" || param5 == null)
         {
            param5 = "none";
         }
         _all[this._name] = this;
         var _loc8_:* = [];
         var _loc9_:Number = 0;
         var _loc15_:uint = param2;
         while(_loc15_--)
         {
            _loc10_ = param6 ? Math.random() : 1 / param2 * _loc15_;
            _loc11_ = param4 != null ? param4(_loc10_,0,1,1) : _loc10_;
            if(param5 == "none")
            {
               _loc12_ = 0.4 * param1;
            }
            else if(param5 == "out")
            {
               _loc13_ = 1 - _loc10_;
               _loc12_ = _loc13_ * _loc13_ * param1 * 0.4;
            }
            else
            {
               _loc12_ = _loc10_ * _loc10_ * param1 * 0.4;
            }
            if(param6)
            {
               _loc11_ += Math.random() * _loc12_ - _loc12_ * 0.5;
            }
            else if(_loc15_ % 2)
            {
               _loc11_ += _loc12_ * 0.5;
            }
            else
            {
               _loc11_ -= _loc12_ * 0.5;
            }
            if(param3)
            {
               if(_loc11_ > 1)
               {
                  _loc11_ = 1;
               }
               else if(_loc11_ < 0)
               {
                  _loc11_ = 0;
               }
            }
            var _loc16_:*;
            _loc8_[_loc16_ = _loc9_++] = {
               "x":_loc10_,
               "y":_loc11_
            };
         }
         _loc8_.sortOn("x",Array.NUMERIC);
         this._first = this._last = new EasePoint(1,1,null);
         _loc15_ = param2;
         while(_loc15_--)
         {
            _loc14_ = _loc8_[_loc15_];
            this._first = new EasePoint(_loc14_.x,_loc14_.y,this._first);
         }
         this._first = new EasePoint(0,0,this._first);
      }
      
      public static function create(param1:Number = 1, param2:uint = 20, param3:Boolean = false, param4:Function = null, param5:String = "none", param6:Boolean = true, param7:String = "") : Function
      {
         return new RoughEase(param1,param2,param3,param4,param5,param6,param7).ease;
      }
      
      public static function byName(param1:String) : Function
      {
         return _all[param1].ease;
      }
      
      public function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc6_:* = null;
         var _loc5_:Number;
         if((_loc5_ = param1 / param4) < 0.5)
         {
            _loc6_ = this._first;
            while(_loc6_.time <= _loc5_)
            {
               _loc6_ = _loc6_.next;
            }
            _loc6_ = _loc6_.prev;
         }
         else
         {
            _loc6_ = this._last;
            while(_loc6_.time >= _loc5_)
            {
               _loc6_ = _loc6_.prev;
            }
         }
         return param2 + (_loc6_.value + (_loc5_ - _loc6_.time) / _loc6_.gap * _loc6_.change) * param3;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         delete _all[this._name];
         this._name = param1;
         _all[param1] = this;
      }
   }
}

class EasePoint
{
    
   
   public var time:Number;
   
   public var gap:Number;
   
   public var value:Number;
   
   public var change:Number;
   
   public var next:EasePoint;
   
   public var prev:EasePoint;
   
   function EasePoint(param1:Number, param2:Number, param3:EasePoint)
   {
      super();
      this.time = param1;
      this.value = param2;
      if(param3)
      {
         this.next = param3;
         param3.prev = this;
         this.change = param3.value - param2;
         this.gap = param3.time - param1;
      }
   }
}
