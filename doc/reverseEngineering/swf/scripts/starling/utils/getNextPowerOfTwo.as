package starling.utils
{
   public function getNextPowerOfTwo(param1:int) : int
   {
      var _loc2_:* = 0;
      if(param1 > 0 && (param1 & param1 - 1) == 0)
      {
         return param1;
      }
      _loc2_ = 1;
      while(_loc2_ < param1)
      {
         _loc2_ <<= 1;
      }
      return _loc2_;
   }
}
