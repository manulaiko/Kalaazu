package mx.core
{
   import flash.system.Capabilities;
   
   public class RuntimeDPIProvider
   {
       
      
      public function RuntimeDPIProvider()
      {
         super();
      }
      
      mx_internal static function classifyDPI(param1:Number) : Number
      {
         if(param1 < 200)
         {
            return DPIClassification.DPI_160;
         }
         if(param1 <= 280)
         {
            return DPIClassification.DPI_240;
         }
         return DPIClassification.DPI_320;
      }
      
      public function get runtimeDPI() : Number
      {
         return mx_internal::classifyDPI(Capabilities.screenDPI);
      }
   }
}
