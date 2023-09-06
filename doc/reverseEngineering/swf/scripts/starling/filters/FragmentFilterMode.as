package starling.filters
{
   import starling.errors.AbstractClassError;
   
   public class FragmentFilterMode
   {
      
      public static const BELOW:String = "below";
      
      public static const REPLACE:String = "replace";
      
      public static const ABOVE:String = "above";
       
      
      public function FragmentFilterMode()
      {
         super();
         throw new AbstractClassError();
      }
   }
}
