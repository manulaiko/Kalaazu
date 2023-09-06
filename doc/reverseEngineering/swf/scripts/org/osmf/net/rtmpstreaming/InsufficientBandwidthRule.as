package org.osmf.net.rtmpstreaming
{
   import org.osmf.net.SwitchingRuleBase;
   
   public class InsufficientBandwidthRule extends SwitchingRuleBase
   {
       
      
      private var bitrateMultiplier:Number;
      
      public function InsufficientBandwidthRule(param1:RTMPNetStreamMetrics, param2:Number = 1.15)
      {
         super(param1);
         this.bitrateMultiplier = param2;
      }
      
      override public function getNewIndex() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = -1;
         if(this.rtmpMetrics.averageMaxBytesPerSecond != 0)
         {
            _loc3_ = this.rtmpMetrics.currentIndex;
            while(_loc3_ >= 0)
            {
               if(this.rtmpMetrics.averageMaxBytesPerSecond * 8 / 1024 > this.rtmpMetrics.resource.streamItems[_loc3_].bitrate * this.bitrateMultiplier)
               {
                  _loc1_ = _loc3_;
                  break;
               }
               _loc3_--;
            }
            _loc1_ = _loc1_ == this.rtmpMetrics.currentIndex ? -1 : _loc1_;
         }
         return _loc1_;
      }
      
      private function get rtmpMetrics() : RTMPNetStreamMetrics
      {
         return metrics as RTMPNetStreamMetrics;
      }
   }
}
