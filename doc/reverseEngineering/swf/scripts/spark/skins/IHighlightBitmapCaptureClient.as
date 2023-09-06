package spark.skins
{
   public interface IHighlightBitmapCaptureClient
   {
       
      
      function beginHighlightBitmapCapture() : Boolean;
      
      function endHighlightBitmapCapture() : Boolean;
      
      function validateNow() : void;
   }
}
