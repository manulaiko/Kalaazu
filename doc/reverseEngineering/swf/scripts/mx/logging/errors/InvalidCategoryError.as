package mx.logging.errors
{
   import mx.core.mx_internal;
   
   public class InvalidCategoryError extends Error
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function InvalidCategoryError(param1:String)
      {
         super(param1);
      }
      
      public function toString() : String
      {
         return String(message);
      }
   }
}
