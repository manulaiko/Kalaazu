package package_434
{
   import away3d.arcane;
   import package_294.class_2398;
   import package_294.class_2425;
   import package_294.class_2602;
   import package_294.class_2646;
   
   public class class_2450
   {
       
      
      public function class_2450()
      {
         super();
      }
      
      public static function method_5600(param1:Vector.<Number>, param2:Vector.<uint>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number>, param6:Vector.<Number>, param7:Vector.<Number>, param8:Vector.<Number> = null) : Vector.<class_2425>
      {
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = 0;
         var _loc26_:* = 0;
         var _loc27_:* = 0;
         var _loc28_:* = 0;
         var _loc29_:* = 0;
         var _loc30_:* = 0;
         var _loc31_:* = 0;
         var _loc32_:* = 0;
         var _loc33_:* = 0;
         var _loc34_:* = 0;
         var _loc35_:* = 0;
         var _loc36_:* = 0;
         var _loc9_:Number = 196605;
         var _loc10_:Number = 983025;
         var _loc11_:Vector.<class_2425> = new Vector.<class_2425>();
         if(Boolean(param3) && !param3.length)
         {
            param3 = null;
         }
         if(Boolean(param4) && !param4.length)
         {
            param4 = null;
         }
         if(Boolean(param5) && !param5.length)
         {
            param5 = null;
         }
         if(Boolean(param6) && !param6.length)
         {
            param6 = null;
         }
         if(Boolean(param7) && !param7.length)
         {
            param7 = null;
         }
         if(Boolean(param8) && !param8.length)
         {
            param8 = null;
         }
         if(param2.length >= _loc10_ || param1.length >= _loc9_)
         {
            _loc16_ = new Vector.<Number>();
            _loc17_ = new Vector.<uint>();
            _loc18_ = param3 != null ? new Vector.<Number>() : null;
            _loc19_ = param8 != null ? new Vector.<Number>() : null;
            _loc20_ = param4 != null ? new Vector.<Number>() : null;
            _loc21_ = param5 != null ? new Vector.<Number>() : null;
            _loc22_ = param6 != null ? new Vector.<Number>() : null;
            _loc23_ = param7 != null ? new Vector.<Number>() : null;
            _loc12_ = (_loc24_ = new Vector.<int>(param1.length / 3,true)).length;
            while(_loc12_-- > 0)
            {
               _loc24_[_loc12_] = -1;
            }
            _loc14_ = 0;
            _loc13_ = param2.length;
            _loc12_ = 0;
            while(_loc12_ < _loc13_)
            {
               _loc26_ = _loc16_.length + 6;
               if(_loc14_ + 2 >= _loc10_ || _loc26_ >= _loc9_)
               {
                  _loc11_.push(method_2900(_loc16_,_loc17_,_loc18_,_loc20_,_loc21_,_loc22_,_loc23_,param8));
                  _loc16_ = new Vector.<Number>();
                  _loc17_ = new Vector.<uint>();
                  _loc18_ = param3 != null ? new Vector.<Number>() : null;
                  _loc19_ = param8 != null ? new Vector.<Number>() : null;
                  _loc20_ = param4 != null ? new Vector.<Number>() : null;
                  _loc21_ = param5 != null ? new Vector.<Number>() : null;
                  _loc22_ = param6 != null ? new Vector.<Number>() : null;
                  _loc23_ = param7 != null ? new Vector.<Number>() : null;
                  _loc26_ = 0;
                  _loc15_ = _loc24_.length;
                  while(_loc15_-- > 0)
                  {
                     _loc24_[_loc15_] = -1;
                  }
                  _loc14_ = 0;
               }
               _loc15_ = 0;
               while(_loc15_ < 3)
               {
                  _loc25_ = param2[_loc12_ + _loc15_];
                  if(_loc24_[_loc25_] >= 0)
                  {
                     _loc26_ = _loc24_[_loc25_];
                  }
                  else
                  {
                     _loc27_ = _loc25_ * 3 + 0;
                     _loc28_ = _loc25_ * 3 + 1;
                     _loc29_ = _loc25_ * 3 + 2;
                     _loc30_ = (_loc26_ = _loc16_.length / 3) * 3 + 0;
                     _loc31_ = _loc26_ * 3 + 1;
                     _loc32_ = _loc26_ * 3 + 2;
                     _loc16_[_loc30_] = param1[_loc27_];
                     _loc16_[_loc31_] = param1[_loc28_];
                     _loc16_[_loc32_] = param1[_loc29_];
                     if(param3)
                     {
                        _loc33_ = _loc26_ * 2 + 0;
                        _loc35_ = _loc26_ * 2 + 1;
                        _loc34_ = _loc25_ * 2 + 0;
                        _loc36_ = _loc25_ * 2 + 1;
                        _loc18_[_loc33_] = param3[_loc34_];
                        _loc18_[_loc35_] = param3[_loc36_];
                     }
                     if(param8)
                     {
                        _loc33_ = _loc26_ * 2 + 0;
                        _loc35_ = _loc26_ * 2 + 1;
                        _loc34_ = _loc25_ * 2 + 0;
                        _loc36_ = _loc25_ * 2 + 1;
                        _loc19_[_loc33_] = param8[_loc34_];
                        _loc19_[_loc35_] = param8[_loc36_];
                     }
                     if(param4)
                     {
                        _loc20_[_loc30_] = param4[_loc27_];
                        _loc20_[_loc31_] = param4[_loc28_];
                        _loc20_[_loc32_] = param4[_loc29_];
                     }
                     if(param5)
                     {
                        _loc21_[_loc30_] = param5[_loc27_];
                        _loc21_[_loc31_] = param5[_loc28_];
                        _loc21_[_loc32_] = param5[_loc29_];
                     }
                     if(param6)
                     {
                        _loc22_[_loc30_] = param6[_loc27_];
                        _loc22_[_loc31_] = param6[_loc28_];
                        _loc22_[_loc32_] = param6[_loc29_];
                     }
                     if(param7)
                     {
                        _loc23_[_loc30_] = param7[_loc27_];
                        _loc23_[_loc31_] = param7[_loc28_];
                        _loc23_[_loc32_] = param7[_loc29_];
                     }
                     _loc24_[_loc25_] = _loc26_;
                  }
                  _loc17_[_loc14_ + _loc15_] = _loc26_;
                  _loc15_++;
               }
               _loc14_ += 3;
               _loc12_ += 3;
            }
            if(_loc16_.length > 0)
            {
               _loc11_.push(method_2900(_loc16_,_loc17_,_loc18_,_loc20_,_loc21_,_loc22_,_loc23_,_loc19_));
            }
         }
         else
         {
            _loc11_.push(method_2900(param1,param2,param3,param4,param5,param6,param7,param8));
         }
         return _loc11_;
      }
      
      public static function method_2900(param1:Vector.<Number>, param2:Vector.<uint>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number>, param6:Vector.<Number>, param7:Vector.<Number>, param8:Vector.<Number>) : class_2602
      {
         var _loc9_:* = null;
         if(Boolean(param6) && Boolean(param7))
         {
            _loc9_ = new class_2646(param6.length / (param1.length / 3));
            class_2646(_loc9_).arcane::updateJointWeightsData(param6);
            class_2646(_loc9_).arcane::updateJointIndexData(param7);
         }
         else
         {
            _loc9_ = new class_2602();
         }
         _loc9_.updateIndexData(param2);
         _loc9_.method_5600(param1,param3,param4,param5,param8);
         return _loc9_;
      }
      
      public static function method_4833(param1:uint, param2:Vector.<Number> = null, param3:Vector.<Number> = null, param4:Vector.<Number> = null, param5:Vector.<Number> = null, param6:Vector.<Number> = null) : Vector.<Number>
      {
         var _loc7_:Number = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = null;
         _loc11_ = new Vector.<Number>();
         _loc7_ = 0;
         while(_loc7_ < param1)
         {
            _loc9_ = _loc7_ * 2;
            _loc8_ = _loc7_ * 3;
            _loc10_ = _loc7_ * 13;
            _loc11_[_loc10_] = !!param2 ? param2[_loc8_] : 0;
            _loc11_[_loc10_ + 1] = !!param2 ? param2[_loc8_ + 1] : 0;
            _loc11_[_loc10_ + 2] = !!param2 ? param2[_loc8_ + 2] : 0;
            _loc11_[_loc10_ + 3] = !!param3 ? param3[_loc8_] : 0;
            _loc11_[_loc10_ + 4] = !!param3 ? param3[_loc8_ + 1] : 0;
            _loc11_[_loc10_ + 5] = !!param3 ? param3[_loc8_ + 2] : 0;
            _loc11_[_loc10_ + 6] = !!param4 ? param4[_loc8_] : 0;
            _loc11_[_loc10_ + 7] = !!param4 ? param4[_loc8_ + 1] : 0;
            _loc11_[_loc10_ + 8] = !!param4 ? param4[_loc8_ + 2] : 0;
            _loc11_[_loc10_ + 9] = !!param5 ? param5[_loc9_] : 0;
            _loc11_[_loc10_ + 10] = !!param5 ? param5[_loc9_ + 1] : 0;
            _loc11_[_loc10_ + 11] = !!param6 ? param6[_loc9_] : 0;
            _loc11_[_loc10_ + 12] = !!param6 ? param6[_loc9_ + 1] : 0;
            _loc7_++;
         }
         return _loc11_;
      }
      
      public static function method_258(param1:class_2425) : uint
      {
         var _loc2_:* = 0;
         var _loc3_:Vector.<class_2425> = param1.method_747.subGeometries;
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function method_1832(param1:class_2398) : uint
      {
         var _loc2_:* = 0;
         var _loc3_:Vector.<class_2398> = param1.arcane::method_4295.method_3381;
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
