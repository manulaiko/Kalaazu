package org.osmf.net.dvr
{
   public class DVRUtils
   {
       
      
      public function DVRUtils()
      {
         super();
      }
      
      public static function calculateOffset(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = 0;
         if(param2 != 0)
         {
            if(param3 > param2)
            {
               _loc4_ = param3 - param2;
            }
            else
            {
               _loc4_ = Math.min(param1,param3);
            }
         }
         else if(param1 != 0)
         {
            _loc4_ = Math.min(param1,param3);
         }
         return _loc4_;
      }
   }
}
