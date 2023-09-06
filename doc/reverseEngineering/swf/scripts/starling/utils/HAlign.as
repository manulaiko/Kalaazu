package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public final class HAlign
   {
      
      public static const LEFT:String = "left";
      
      public static const CENTER:String = "center";
      
      public static const RIGHT:String = "right";
       
      
      public function HAlign()
      {
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         return param1 == LEFT || param1 == CENTER || param1 == RIGHT;
      }
   }
}
