package mx.utils
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   
   public class GraphicsUtil
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function GraphicsUtil()
      {
         super();
      }
      
      public static function drawRoundRectComplex(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = param2 + param4;
         var _loc11_:Number = param3 + param5;
         var _loc12_:Number = param4 < param5 ? param4 * 2 : param5 * 2;
         param6 = param6 < _loc12_ ? param6 : _loc12_;
         param7 = param7 < _loc12_ ? param7 : _loc12_;
         param8 = param8 < _loc12_ ? param8 : _loc12_;
         var _loc13_:Number = (param9 = param9 < _loc12_ ? param9 : _loc12_) * 0.292893218813453;
         var _loc14_:Number = param9 * 0.585786437626905;
         param1.moveTo(_loc10_,_loc11_ - param9);
         param1.curveTo(_loc10_,_loc11_ - _loc14_,_loc10_ - _loc13_,_loc11_ - _loc13_);
         param1.curveTo(_loc10_ - _loc14_,_loc11_,_loc10_ - param9,_loc11_);
         _loc13_ = param8 * 0.292893218813453;
         _loc14_ = param8 * 0.585786437626905;
         param1.lineTo(param2 + param8,_loc11_);
         param1.curveTo(param2 + _loc14_,_loc11_,param2 + _loc13_,_loc11_ - _loc13_);
         param1.curveTo(param2,_loc11_ - _loc14_,param2,_loc11_ - param8);
         _loc13_ = param6 * 0.292893218813453;
         _loc14_ = param6 * 0.585786437626905;
         param1.lineTo(param2,param3 + param6);
         param1.curveTo(param2,param3 + _loc14_,param2 + _loc13_,param3 + _loc13_);
         param1.curveTo(param2 + _loc14_,param3,param2 + param6,param3);
         _loc13_ = param7 * 0.292893218813453;
         _loc14_ = param7 * 0.585786437626905;
         param1.lineTo(_loc10_ - param7,param3);
         param1.curveTo(_loc10_ - _loc14_,param3,_loc10_ - _loc13_,param3 + _loc13_);
         param1.curveTo(_loc10_,param3 + _loc14_,_loc10_,param3 + param7);
         param1.lineTo(_loc10_,_loc11_ - param9);
      }
      
      public static function drawRoundRectComplex2(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number) : void
      {
         var _loc16_:Number = param2 + param4;
         var _loc17_:Number = param3 + param5;
         var _loc18_:Number = param4 / 2;
         var _loc19_:Number = param5 / 2;
         if(param7 == 0)
         {
            param7 = param6;
         }
         if(isNaN(param8))
         {
            param8 = param6;
         }
         if(isNaN(param9))
         {
            param9 = param8;
         }
         if(isNaN(param10))
         {
            param10 = param6;
         }
         if(isNaN(param11))
         {
            param11 = param10;
         }
         if(isNaN(param12))
         {
            param12 = param6;
         }
         if(isNaN(param13))
         {
            param13 = param12;
         }
         if(isNaN(param14))
         {
            param14 = param6;
         }
         if(isNaN(param15))
         {
            param15 = param14;
         }
         if(param8 > _loc18_)
         {
            param8 = _loc18_;
         }
         if(param9 > _loc19_)
         {
            param9 = _loc19_;
         }
         if(param10 > _loc18_)
         {
            param10 = _loc18_;
         }
         if(param11 > _loc19_)
         {
            param11 = _loc19_;
         }
         if(param12 > _loc18_)
         {
            param12 = _loc18_;
         }
         if(param13 > _loc19_)
         {
            param13 = _loc19_;
         }
         if(param14 > _loc18_)
         {
            param14 = _loc18_;
         }
         if(param15 > _loc19_)
         {
            param15 = _loc19_;
         }
         var _loc20_:Number = param14 * 0.292893218813453;
         var _loc21_:Number = param15 * 0.292893218813453;
         var _loc22_:Number = param14 * 0.585786437626905;
         var _loc23_:Number = param15 * 0.585786437626905;
         param1.moveTo(_loc16_,_loc17_ - param15);
         param1.curveTo(_loc16_,_loc17_ - _loc23_,_loc16_ - _loc20_,_loc17_ - _loc21_);
         param1.curveTo(_loc16_ - _loc22_,_loc17_,_loc16_ - param14,_loc17_);
         _loc20_ = param12 * 0.292893218813453;
         _loc21_ = param13 * 0.292893218813453;
         _loc22_ = param12 * 0.585786437626905;
         _loc23_ = param13 * 0.585786437626905;
         param1.lineTo(param2 + param12,_loc17_);
         param1.curveTo(param2 + _loc22_,_loc17_,param2 + _loc20_,_loc17_ - _loc21_);
         param1.curveTo(param2,_loc17_ - _loc23_,param2,_loc17_ - param13);
         _loc20_ = param8 * 0.292893218813453;
         _loc21_ = param9 * 0.292893218813453;
         _loc22_ = param8 * 0.585786437626905;
         _loc23_ = param9 * 0.585786437626905;
         param1.lineTo(param2,param3 + param9);
         param1.curveTo(param2,param3 + _loc23_,param2 + _loc20_,param3 + _loc21_);
         param1.curveTo(param2 + _loc22_,param3,param2 + param8,param3);
         _loc20_ = param10 * 0.292893218813453;
         _loc21_ = param11 * 0.292893218813453;
         _loc22_ = param10 * 0.585786437626905;
         _loc23_ = param11 * 0.585786437626905;
         param1.lineTo(_loc16_ - param10,param3);
         param1.curveTo(_loc16_ - _loc22_,param3,_loc16_ - _loc20_,param3 + _loc21_);
         param1.curveTo(_loc16_,param3 + _loc23_,_loc16_,param3 + param11);
         param1.lineTo(_loc16_,_loc17_ - param15);
      }
   }
}
