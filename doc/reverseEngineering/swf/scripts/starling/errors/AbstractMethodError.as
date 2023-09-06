package starling.errors
{
   public class AbstractMethodError extends Error
   {
       
      
      public function AbstractMethodError(param1:* = "Method needs to be implemented in subclass", param2:* = 0)
      {
         super(param1,param2);
      }
   }
}
