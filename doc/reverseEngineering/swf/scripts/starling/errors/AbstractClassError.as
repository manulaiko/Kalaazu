package starling.errors
{
   public class AbstractClassError extends Error
   {
       
      
      public function AbstractClassError(param1:* = "Cannot instantiate abstract class", param2:* = 0)
      {
         super(param1,param2);
      }
   }
}
