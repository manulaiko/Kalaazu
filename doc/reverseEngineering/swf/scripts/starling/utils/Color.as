package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public class Color
   {
      
      public static const WHITE:uint = 16777215;
      
      public static const SILVER:uint = 12632256;
      
      public static const GRAY:uint = 8421504;
      
      public static const BLACK:uint = 0;
      
      public static const RED:uint = 16711680;
      
      public static const MAROON:uint = 8388608;
      
      public static const YELLOW:uint = 16776960;
      
      public static const OLIVE:uint = 8421376;
      
      public static const LIME:uint = 65280;
      
      public static const GREEN:uint = 32768;
      
      public static const AQUA:uint = 65535;
      
      public static const TEAL:uint = 32896;
      
      public static const BLUE:uint = 255;
      
      public static const NAVY:uint = 128;
      
      public static const FUCHSIA:uint = 16711935;
      
      public static const PURPLE:uint = 8388736;
       
      
      public function Color()
      {
         super();
         throw new AbstractClassError();
      }
      
      public static function getAlpha(param1:uint) : int
      {
         return param1 >> 24 & 255;
      }
      
      public static function getRed(param1:uint) : int
      {
         return param1 >> 16 & 255;
      }
      
      public static function getGreen(param1:uint) : int
      {
         return param1 >> 8 & 255;
      }
      
      public static function getBlue(param1:uint) : int
      {
         return param1 & 255;
      }
      
      public static function rgb(param1:int, param2:int, param3:int) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function argb(param1:int, param2:int, param3:int, param4:int) : uint
      {
         return param1 << 24 | param2 << 16 | param3 << 8 | param4;
      }
   }
}
