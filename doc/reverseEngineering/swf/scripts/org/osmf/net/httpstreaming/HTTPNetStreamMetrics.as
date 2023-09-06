package org.osmf.net.httpstreaming
{
   import org.osmf.net.NetStreamMetricsBase;
   
   public class HTTPNetStreamMetrics extends NetStreamMetricsBase
   {
       
      
      private var httpNetStream:HTTPNetStream;
      
      public function HTTPNetStreamMetrics(param1:HTTPNetStream)
      {
         super(param1);
         this.httpNetStream = param1;
      }
      
      public function get downloadRatio() : Number
      {
         return this.httpNetStream.downloadRatio;
      }
      
      public function getBitrateForIndex(param1:int) : Number
      {
         return this.resource.streamItems[param1].bitrate;
      }
   }
}
