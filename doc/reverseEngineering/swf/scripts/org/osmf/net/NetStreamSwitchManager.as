package org.osmf.net
{
   import flash.errors.IllegalOperationError;
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.net.NetStreamPlayOptions;
   import flash.net.NetStreamPlayTransitions;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import org.osmf.utils.OSMFStrings;
   
   public class NetStreamSwitchManager extends NetStreamSwitchManagerBase
   {
      
      private static const RULE_CHECK_INTERVAL:Number = 500;
      
      private static const DEFAULT_MAX_UP_SWITCHES_PER_STREAM_ITEM:int = 3;
      
      private static const DEFAULT_WAIT_DURATION_AFTER_DOWN_SWITCH:int = 30000;
      
      private static const DEFAULT_CLEAR_FAILED_COUNTS_INTERVAL:Number = 300000;
       
      
      private var netStream:NetStream;
      
      private var dsResource:DynamicStreamingResource;
      
      private var switchingRules:Vector.<SwitchingRuleBase>;
      
      private var metrics:NetStreamMetricsBase;
      
      private var checkRulesTimer:Timer;
      
      private var clearFailedCountsTimer:Timer;
      
      private var actualIndex:int = -1;
      
      private var oldStreamName:String;
      
      private var switching:Boolean;
      
      private var _currentIndex:int;
      
      private var lastTransitionIndex:int = -1;
      
      private var connection:NetConnection;
      
      private var dsiFailedCounts:Vector.<int>;
      
      private var failedDSI:Dictionary;
      
      private var _bandwidthLimit:Number = 0;
      
      public function NetStreamSwitchManager(param1:NetConnection, param2:NetStream, param3:DynamicStreamingResource, param4:NetStreamMetricsBase, param5:Vector.<SwitchingRuleBase>)
      {
         super();
         this.connection = param1;
         this.netStream = param2;
         this.dsResource = param3;
         this.metrics = param4;
         this.switchingRules = param5 || new Vector.<SwitchingRuleBase>();
         this._currentIndex = Math.max(0,Math.min(this.maxAllowedIndex,this.dsResource.initialIndex));
         this.checkRulesTimer = new Timer(RULE_CHECK_INTERVAL);
         this.checkRulesTimer.addEventListener(TimerEvent.TIMER,this.checkRules);
         this.failedDSI = new Dictionary();
         this._bandwidthLimit = 1.4 * param3.streamItems[param3.streamItems.length - 1].bitrate * 1000 / 8;
         param2.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         NetClient(param2.client).addHandler(NetStreamCodes.ON_PLAY_STATUS,this.onPlayStatus,int.MAX_VALUE);
      }
      
      override public function set autoSwitch(param1:Boolean) : void
      {
         super.autoSwitch = param1;
         if(autoSwitch)
         {
            this.checkRulesTimer.start();
         }
         else
         {
            this.checkRulesTimer.stop();
         }
      }
      
      override public function get currentIndex() : uint
      {
         return this._currentIndex;
      }
      
      override public function get maxAllowedIndex() : int
      {
         var _loc1_:int = this.dsResource.streamItems.length - 1;
         return _loc1_ < super.maxAllowedIndex ? _loc1_ : super.maxAllowedIndex;
      }
      
      override public function set maxAllowedIndex(param1:int) : void
      {
         if(param1 > this.dsResource.streamItems.length)
         {
            throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
         }
         super.maxAllowedIndex = param1;
         this.metrics.maxAllowedIndex = param1;
      }
      
      override public function switchTo(param1:int) : void
      {
         if(!autoSwitch)
         {
            if(param1 < 0 || param1 > this.maxAllowedIndex)
            {
               throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
            }
            if(this.actualIndex == -1)
            {
               this.prepareForSwitching();
            }
            this.executeSwitch(param1);
            return;
         }
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_STREAM_NOT_IN_MANUAL_MODE));
      }
      
      protected function canAutoSwitchNow(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(this.dsiFailedCounts[param1] >= 1)
         {
            _loc2_ = getTimer();
            if(_loc2_ - Number(this.failedDSI[param1]) < DEFAULT_WAIT_DURATION_AFTER_DOWN_SWITCH)
            {
               return false;
            }
         }
         else if(this.dsiFailedCounts[param1] > DEFAULT_MAX_UP_SWITCHES_PER_STREAM_ITEM)
         {
            return false;
         }
         return true;
      }
      
      protected final function get bandwidthLimit() : Number
      {
         return this._bandwidthLimit;
      }
      
      protected final function set bandwidthLimit(param1:Number) : void
      {
         this._bandwidthLimit = param1;
      }
      
      private function executeSwitch(param1:int) : void
      {
         var _loc2_:NetStreamPlayOptions = new NetStreamPlayOptions();
         var _loc3_:Object = NetStreamUtils.getPlayArgsForResource(this.dsResource);
         _loc2_.start = _loc3_.start;
         _loc2_.len = _loc3_.len;
         _loc2_.streamName = this.dsResource.streamItems[param1].streamName;
         _loc2_.oldStreamName = this.oldStreamName;
         _loc2_.transition = NetStreamPlayTransitions.SWITCH;
         this.switching = true;
         this.netStream.play2(_loc2_);
         this.oldStreamName = this.dsResource.streamItems[param1].streamName;
         if(param1 < this.actualIndex && autoSwitch)
         {
            this.incrementDSIFailedCount(this.actualIndex);
            this.failedDSI[this.actualIndex] = getTimer();
         }
      }
      
      private function checkRules(param1:TimerEvent) : void
      {
         var _loc4_:int = 0;
         if(this.switchingRules == null || this.switching)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.switchingRules.length)
         {
            if((_loc4_ = this.switchingRules[_loc3_].getNewIndex()) != -1 && _loc4_ < _loc2_)
            {
               _loc2_ = _loc4_;
            }
            _loc3_++;
         }
         if(_loc2_ != -1 && _loc2_ != int.MAX_VALUE && _loc2_ != this.actualIndex)
         {
            _loc2_ = Math.min(_loc2_,this.maxAllowedIndex);
         }
         if(_loc2_ != -1 && _loc2_ != int.MAX_VALUE && _loc2_ != this.actualIndex && !this.switching && _loc2_ <= this.maxAllowedIndex && this.canAutoSwitchNow(_loc2_))
         {
            this.executeSwitch(_loc2_);
         }
      }
      
      private function onNetStatus(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_START:
               if(this.actualIndex == -1)
               {
                  this.prepareForSwitching();
                  break;
               }
               if(autoSwitch && this.checkRulesTimer.running == false)
               {
                  this.checkRulesTimer.start();
                  break;
               }
               break;
            case NetStreamCodes.NETSTREAM_PLAY_TRANSITION:
               this.switching = false;
               this.actualIndex = this.dsResource.indexFromName(param1.info.details);
               this.metrics.currentIndex = this.actualIndex;
               this.lastTransitionIndex = this.actualIndex;
               break;
            case NetStreamCodes.NETSTREAM_PLAY_FAILED:
               this.switching = false;
               break;
            case NetStreamCodes.NETSTREAM_SEEK_NOTIFY:
               this.switching = false;
               if(this.lastTransitionIndex >= 0)
               {
                  this._currentIndex = this.lastTransitionIndex;
                  break;
               }
               break;
            case NetStreamCodes.NETSTREAM_PLAY_STOP:
               this.checkRulesTimer.stop();
         }
      }
      
      private function onPlayStatus(param1:Object) : void
      {
         switch(param1.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_TRANSITION_COMPLETE:
               if(this.lastTransitionIndex >= 0)
               {
                  this._currentIndex = this.lastTransitionIndex;
                  this.lastTransitionIndex = -1;
                  break;
               }
         }
      }
      
      private function prepareForSwitching() : void
      {
         this.initDSIFailedCounts();
         this.metrics.resource = this.dsResource;
         this.actualIndex = 0;
         this.lastTransitionIndex = -1;
         if(this.dsResource.initialIndex >= 0 && this.dsResource.initialIndex < this.dsResource.streamItems.length)
         {
            this.actualIndex = this.dsResource.initialIndex;
         }
         if(autoSwitch)
         {
            this.checkRulesTimer.start();
         }
         this.setThrottleLimits(this.dsResource.streamItems.length - 1);
         this.metrics.currentIndex = this.actualIndex;
      }
      
      private function initDSIFailedCounts() : void
      {
         if(this.dsiFailedCounts != null)
         {
            this.dsiFailedCounts.length = 0;
            this.dsiFailedCounts = null;
         }
         this.dsiFailedCounts = new Vector.<int>();
         var _loc1_:int = 0;
         while(_loc1_ < this.dsResource.streamItems.length)
         {
            this.dsiFailedCounts.push(0);
            _loc1_++;
         }
      }
      
      private function incrementDSIFailedCount(param1:int) : void
      {
         ++this.dsiFailedCounts[param1];
         if(this.dsiFailedCounts[param1] > DEFAULT_MAX_UP_SWITCHES_PER_STREAM_ITEM)
         {
            if(this.clearFailedCountsTimer == null)
            {
               this.clearFailedCountsTimer = new Timer(DEFAULT_CLEAR_FAILED_COUNTS_INTERVAL,1);
               this.clearFailedCountsTimer.addEventListener(TimerEvent.TIMER,this.clearFailedCounts);
            }
            this.clearFailedCountsTimer.start();
         }
      }
      
      private function clearFailedCounts(param1:TimerEvent) : void
      {
         this.clearFailedCountsTimer.removeEventListener(TimerEvent.TIMER,this.clearFailedCounts);
         this.clearFailedCountsTimer = null;
         this.initDSIFailedCounts();
      }
      
      private function setThrottleLimits(param1:int) : void
      {
         this.connection.call("setBandwidthLimit",null,this._bandwidthLimit,this._bandwidthLimit);
      }
   }
}
