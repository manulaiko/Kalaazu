package starling.text
{
   import starling.errors.AbstractClassError;
   
   public class TextFieldAutoSize
   {
      
      public static const NONE:String = "none";
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
      
      public static const BOTH_DIRECTIONS:String = "bothDirections";
       
      
      public function TextFieldAutoSize()
      {
         super();
         throw new AbstractClassError();
      }
   }
}
