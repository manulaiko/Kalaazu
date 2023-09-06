package org.osmf.net.httpstreaming
{
   import org.osmf.net.SwitchingRuleBase;
   
   public class DownloadRatioRule extends SwitchingRuleBase
   {
       
      
      private var aggressiveUpswitch:Boolean = false;
      
      public function DownloadRatioRule(param1:HTTPNetStreamMetrics, param2:Boolean = true)
      {
         super(param1);
         this.aggressiveUpswitch = param2;
      }
      
      override public function getNewIndex() : int
      {
         var _loc2_:Number = NaN;
         var _loc1_:int = -1;
         if(this.httpMetrics.downloadRatio < 1)
         {
            if(this.httpMetrics.currentIndex > 0)
            {
               _loc2_ = this.getSwitchRatio(this.httpMetrics.currentIndex - 1);
               if(this.httpMetrics.downloadRatio < _loc2_)
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc1_ = this.httpMetrics.currentIndex - 1;
               }
            }
         }
         else if(this.httpMetrics.currentIndex < this.httpMetrics.maxAllowedIndex)
         {
            _loc2_ = this.getSwitchRatio(this.httpMetrics.currentIndex + 1);
            if(this.httpMetrics.downloadRatio >= _loc2_)
            {
               if(this.httpMetrics.downloadRatio > 100 || !this.aggressiveUpswitch)
               {
                  _loc1_ = this.httpMetrics.currentIndex + 1;
               }
               else
               {
                  while(++_loc1_ < this.httpMetrics.maxAllowedIndex + 1)
                  {
                     _loc2_ = this.getSwitchRatio(_loc1_);
                     if(this.httpMetrics.downloadRatio < _loc2_)
                     {
                        break;
                     }
                  }
                  _loc1_--;
               }
            }
         }
         return _loc1_;
      }
      
      private function getSwitchRatio(param1:int) : Number
      {
         return this.httpMetrics.getBitrateForIndex(param1) / this.httpMetrics.getBitrateForIndex(metrics.currentIndex);
      }
      
      private function get httpMetrics() : HTTPNetStreamMetrics
      {
         return metrics as HTTPNetStreamMetrics;
      }
   }
}
