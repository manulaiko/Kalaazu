package package_434
{
   import flash.display.BitmapData;
   
   public class class_2413
   {
      
      private static const const_1638:uint = 4096;
       
      
      public function class_2413()
      {
         super();
      }
      
      public static function method_2090(param1:BitmapData) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         return Boolean(method_5589(param1.width)) && Boolean(method_5589(param1.height));
      }
      
      public static function method_5589(param1:uint) : Boolean
      {
         return param1 >= 1 && param1 <= const_1638 && Boolean(method_1762(param1));
      }
      
      public static function method_1762(param1:int) : Boolean
      {
         return !!param1 ? (param1 & -param1) == param1 : false;
      }
      
      public static function method_4086(param1:uint) : uint
      {
         var _loc2_:* = 1;
         while(_loc2_ < param1)
         {
            _loc2_ <<= 1;
         }
         if(_loc2_ > const_1638)
         {
            _loc2_ = uint(const_1638);
         }
         return _loc2_;
      }
   }
}
