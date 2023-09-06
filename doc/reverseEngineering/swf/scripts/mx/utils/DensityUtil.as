package mx.utils
{
   import mx.core.DPIClassification;
   import mx.core.RuntimeDPIProvider;
   import mx.core.Singleton;
   
   public class DensityUtil
   {
      
      private static var runtimeDPI:Number;
       
      
      public function DensityUtil()
      {
         super();
      }
      
      public static function getRuntimeDPI() : Number
      {
         if(!isNaN(runtimeDPI))
         {
            return runtimeDPI;
         }
         var _loc1_:Class = Singleton.getClass("mx.core::RuntimeDPIProvider");
         if(!_loc1_)
         {
            _loc1_ = RuntimeDPIProvider;
         }
         var _loc2_:RuntimeDPIProvider = RuntimeDPIProvider(new _loc1_());
         runtimeDPI = _loc2_.runtimeDPI;
         return runtimeDPI;
      }
      
      public static function getDPIScale(param1:Number, param2:Number) : Number
      {
         if(param1 != DPIClassification.DPI_160 && param1 != DPIClassification.DPI_240 && param1 != DPIClassification.DPI_320 || param2 != DPIClassification.DPI_160 && param2 != DPIClassification.DPI_240 && param2 != DPIClassification.DPI_320)
         {
            return NaN;
         }
         return param2 / param1;
      }
   }
}
