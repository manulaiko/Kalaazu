package spark.core
{
   import flash.ui.Keyboard;
   
   public final class NavigationUnit
   {
      
      public static const HOME:uint = Keyboard.HOME;
      
      public static const END:uint = Keyboard.END;
      
      public static const UP:uint = Keyboard.UP;
      
      public static const DOWN:uint = Keyboard.DOWN;
      
      public static const LEFT:uint = Keyboard.LEFT;
      
      public static const RIGHT:uint = Keyboard.RIGHT;
      
      public static const PAGE_UP:uint = Keyboard.PAGE_UP;
      
      public static const PAGE_DOWN:uint = Keyboard.PAGE_DOWN;
      
      public static const PAGE_LEFT:uint = 9111;
      
      public static const PAGE_RIGHT:uint = 9112;
       
      
      public function NavigationUnit()
      {
         super();
      }
      
      public static function isNavigationUnit(param1:uint) : Boolean
      {
         switch(param1)
         {
            case Keyboard.LEFT:
               return true;
            case Keyboard.RIGHT:
               return true;
            case Keyboard.UP:
               return true;
            case Keyboard.DOWN:
               return true;
            case Keyboard.PAGE_UP:
               return true;
            case Keyboard.PAGE_DOWN:
               return true;
            case Keyboard.HOME:
               return true;
            case Keyboard.END:
               return true;
            default:
               return false;
         }
      }
   }
}
