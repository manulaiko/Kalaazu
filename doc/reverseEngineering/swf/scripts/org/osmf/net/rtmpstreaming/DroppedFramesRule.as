package org.osmf.net.rtmpstreaming
{
   import flash.utils.getTimer;
   import org.osmf.net.NetStreamMetricsBase;
   import org.osmf.net.SwitchingRuleBase;
   
   public class DroppedFramesRule extends SwitchingRuleBase
   {
      
      private static const LOCK_INTERVAL:Number = 30000;
       
      
      private var downSwitchByOne:int;
      
      private var downSwitchByTwo:int;
      
      private var downSwitchToZero:int;
      
      private var lockLevel:Number;
      
      private var lastLockTime:Number;
      
      public function DroppedFramesRule(param1:NetStreamMetricsBase, param2:int = 10, param3:int = 20, param4:int = 24)
      {
         super(param1);
         this.downSwitchByOne = param2;
         this.downSwitchByTwo = param3;
         this.downSwitchToZero = param4;
         this.lastLockTime = 0;
         this.lockLevel = int.MAX_VALUE;
      }
      
      override public function getNewIndex() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = -1;
         if(metrics.averageDroppedFPS > this.downSwitchToZero)
         {
            _loc1_ = 0;
            _loc2_ = "Average droppedFPS of " + Math.round(metrics.averageDroppedFPS) + " > " + this.downSwitchToZero;
         }
         else if(metrics.averageDroppedFPS > this.downSwitchByTwo)
         {
            _loc1_ = true ? 0 : -2;
            _loc2_ = "Average droppedFPS of " + Math.round(metrics.averageDroppedFPS) + " > " + this.downSwitchByTwo;
         }
         else if(metrics.averageDroppedFPS > this.downSwitchByOne)
         {
            _loc1_ = true ? 0 : -1;
            _loc2_ = "Average droppedFPS of " + Math.round(metrics.averageDroppedFPS) + " > " + this.downSwitchByOne;
         }
         if(_loc1_ != -1 && _loc1_ < metrics.currentIndex)
         {
            this.lockIndex(_loc1_);
         }
         if(_loc1_ == -1 && this.isLocked(metrics.currentIndex))
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      private function lockIndex(param1:int) : void
      {
         if(!this.isLocked(param1))
         {
            this.lockLevel = param1;
            this.lastLockTime = getTimer();
         }
      }
      
      private function isLocked(param1:int) : Boolean
      {
         return param1 >= this.lockLevel && getTimer() - this.lastLockTime < LOCK_INTERVAL;
      }
   }
}
