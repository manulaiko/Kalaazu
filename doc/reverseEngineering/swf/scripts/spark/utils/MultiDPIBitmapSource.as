package spark.utils
{
   import mx.core.DPIClassification;
   import mx.core.mx_internal;
   
   public class MultiDPIBitmapSource
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var source160dpi:Object;
      
      public var source240dpi:Object;
      
      public var source320dpi:Object;
      
      public function MultiDPIBitmapSource()
      {
         super();
      }
      
      public function getSource(param1:Number) : Object
      {
         var _loc2_:Object = this.source160dpi;
         switch(param1)
         {
            case DPIClassification.DPI_160:
               _loc2_ = this.source160dpi;
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source240dpi;
               }
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source320dpi;
                  break;
               }
               break;
            case DPIClassification.DPI_240:
               _loc2_ = this.source240dpi;
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source320dpi;
               }
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source160dpi;
                  break;
               }
               break;
            case DPIClassification.DPI_320:
               _loc2_ = this.source320dpi;
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source240dpi;
               }
               if(!_loc2_ || _loc2_ == "")
               {
                  _loc2_ = this.source160dpi;
                  break;
               }
         }
         return _loc2_;
      }
   }
}
