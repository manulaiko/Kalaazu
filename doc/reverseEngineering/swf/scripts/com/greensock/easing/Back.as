package com.greensock.easing
{
   public class Back
   {
       
      
      public function Back()
      {
         super();
      }
      
      public static function easeIn(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 1.70158) : Number
      {
         var _loc6_:* = param1 / param4;
         param1 /= param4;
         return param3 * _loc6_ * param1 * ((param5 + 1) * param1 - param5) + param2;
      }
      
      public static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 1.70158) : Number
      {
         return param3 * ((param1 = param1 / param4 - 1) * param1 * ((param5 + 1) * param1 + param5) + 1) + param2;
      }
      
      public static function easeInOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 1.70158) : Number
      {
         var _loc6_:* = param1 / (param4 * 0.5);
         param1 /= param4 * 0.5;
         if(_loc6_ < 1)
         {
            _loc6_ = param5 * 1.525;
            param5 *= 1.525;
            return param3 * 0.5 * (param1 * param1 * ((_loc6_ + 1) * param1 - param5)) + param2;
         }
         _loc6_ = param1 - 2;
         param1 -= 2;
         _loc6_ = param5 * 1.525;
         param5 *= 1.525;
         return param3 / 2 * (_loc6_ * param1 * ((_loc6_ + 1) * param1 + param5) + 2) + param2;
      }
   }
}
