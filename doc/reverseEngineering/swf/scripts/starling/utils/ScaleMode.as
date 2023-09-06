package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public class ScaleMode
   {
      
      public static const NONE:String = "none";
      
      public static const NO_BORDER:String = "noBorder";
      
      public static const SHOW_ALL:String = "showAll";
       
      
      public function ScaleMode()
      {
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         return param1 == NONE || param1 == NO_BORDER || param1 == SHOW_ALL;
      }
   }
}
