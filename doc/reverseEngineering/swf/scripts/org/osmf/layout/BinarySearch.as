package org.osmf.layout
{
   import org.osmf.utils.OSMFStrings;
   
   class BinarySearch
   {
       
      
      function BinarySearch()
      {
         super();
      }
      
      public static function search(param1:Object, param2:Function, param3:*, param4:int = 0, param5:int = -2147483648) : int
      {
         var _loc7_:int = 0;
         var _loc8_:* = undefined;
         if(param1 == null || param2 == null)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
         }
         var _loc6_:int = -param4;
         param5 = param5 == int.MIN_VALUE ? param1.length - 1 : param5;
         if(param1.length > 0 && param4 <= param5)
         {
            _loc7_ = (param4 + param5) / 2;
            _loc8_ = param1[_loc7_];
            switch(param2(param3,_loc8_))
            {
               case -1:
                  _loc6_ = search(param1,param2,param3,param4,_loc7_ - 1);
                  break;
               case 0:
                  _loc6_ = _loc7_;
                  break;
               case 1:
                  _loc6_ = search(param1,param2,param3,_loc7_ + 1,param5);
            }
         }
         return _loc6_;
      }
   }
}
