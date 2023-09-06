package mx.core
{
   import flash.text.TextField;
   import mx.utils.NameUtil;
   
   public class FlexTextField extends TextField
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function FlexTextField()
      {
         super();
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
   }
}
