package mx.collections.errors
{
   import mx.core.mx_internal;
   
   public class SortError extends Error
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function SortError(param1:String)
      {
         super(param1);
      }
   }
}
