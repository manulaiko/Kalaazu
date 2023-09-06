package org.osmf.net.rtmpstreaming
{
   import org.osmf.net.SwitchingRuleBase;
   
   public class SufficientBandwidthRule extends SwitchingRuleBase
   {
      
      private static const BANDWIDTH_SAFETY_MULTIPLE:Number = 1.15;
      
      private static const MIN_DROPPED_FPS:int = 2;
       
      
      public function SufficientBandwidthRule(param1:RTMPNetStreamMetrics)
      {
         super(param1);
      }
      
      override public function getNewIndex() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = -1;
         if(this.rtmpMetrics.averageMaxBytesPerSecond != 0)
         {
            _loc3_ = this.rtmpMetrics.resource.streamItems.length - 1;
            while(_loc3_ >= 0)
            {
               if(this.rtmpMetrics.averageMaxBytesPerSecond * 8 / 1024 > this.rtmpMetrics.resource.streamItems[_loc3_].bitrate * BANDWIDTH_SAFETY_MULTIPLE)
               {
                  _loc1_ = _loc3_;
                  break;
               }
               _loc3_--;
            }
            if(_loc1_ > this.rtmpMetrics.currentIndex)
            {
               _loc1_ = this.rtmpMetrics.droppedFPS < MIN_DROPPED_FPS && this.rtmpMetrics.netStream.bufferLength > this.rtmpMetrics.netStream.bufferTime ? _loc1_ : -1;
            }
            else
            {
               _loc1_ = -1;
            }
         }
         return _loc1_;
      }
      
      private function get rtmpMetrics() : RTMPNetStreamMetrics
      {
         return metrics as RTMPNetStreamMetrics;
      }
   }
}
