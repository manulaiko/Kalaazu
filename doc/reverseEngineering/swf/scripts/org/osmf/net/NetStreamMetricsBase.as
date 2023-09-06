package org.osmf.net
{
   import flash.events.EventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.NetStream;
   import flash.utils.Timer;
   
   public class NetStreamMetricsBase extends EventDispatcher
   {
      
      private static const DEFAULT_UPDATE_INTERVAL:Number = 100;
      
      private static const DEFAULT_AVG_FRAMERATE_SAMPLE_SIZE:Number = 50;
       
      
      private var _netStream:NetStream;
      
      private var _resource:DynamicStreamingResource;
      
      private var _currentIndex:int;
      
      private var _maxAllowedIndex:int;
      
      private var _timer:Timer;
      
      private var _averageDroppedFPSArray:Array;
      
      private var _averageDroppedFPS:Number;
      
      private var _droppedFPS:Number;
      
      private var _lastFrameDropValue:Number;
      
      private var _lastFrameDropCounter:Number;
      
      private var _maxFPS:Number;
      
      public function NetStreamMetricsBase(param1:NetStream)
      {
         super();
         this._netStream = param1;
         this._droppedFPS = 0;
         this._lastFrameDropCounter = 0;
         this._lastFrameDropValue = 0;
         this._maxFPS = 0;
         this._averageDroppedFPSArray = new Array();
         this._timer = new Timer(DEFAULT_UPDATE_INTERVAL);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
         param1.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatusEvent);
      }
      
      public function get resource() : DynamicStreamingResource
      {
         return this._resource;
      }
      
      public function set resource(param1:DynamicStreamingResource) : void
      {
         this._resource = param1;
         this._maxAllowedIndex = param1 != null ? param1.streamItems.length - 1 : 0;
      }
      
      public function get netStream() : NetStream
      {
         return this._netStream;
      }
      
      public function get currentIndex() : int
      {
         return this._currentIndex;
      }
      
      public function set currentIndex(param1:int) : void
      {
         this._currentIndex = param1;
      }
      
      public function get maxAllowedIndex() : int
      {
         return this._maxAllowedIndex;
      }
      
      public function set maxAllowedIndex(param1:int) : void
      {
         this._maxAllowedIndex = param1;
      }
      
      public function get updateInterval() : Number
      {
         return this._timer.delay;
      }
      
      public function set updateInterval(param1:Number) : void
      {
         this._timer.delay = param1;
         if(param1 <= 0)
         {
            this._timer.stop();
         }
      }
      
      public function get maxFPS() : Number
      {
         return this._maxFPS;
      }
      
      public function get droppedFPS() : Number
      {
         return this._droppedFPS;
      }
      
      public function get averageDroppedFPS() : Number
      {
         return this._averageDroppedFPS;
      }
      
      protected function calculateMetrics() : void
      {
         var totalDroppedFrameRate:Number = NaN;
         var f:uint = 0;
         try
         {
            this._maxFPS = this.netStream.currentFPS > this._maxFPS ? this.netStream.currentFPS : this._maxFPS;
            if(this._timer.currentCount - this._lastFrameDropCounter > 1000 / this._timer.delay)
            {
               this._droppedFPS = (this.netStream.info.droppedFrames - this._lastFrameDropValue) / ((this._timer.currentCount - this._lastFrameDropCounter) * this._timer.delay / 1000);
               this._lastFrameDropCounter = this._timer.currentCount;
               this._lastFrameDropValue = this.netStream.info.droppedFrames;
            }
            this._averageDroppedFPSArray.unshift(this._droppedFPS);
            if(this._averageDroppedFPSArray.length > DEFAULT_AVG_FRAMERATE_SAMPLE_SIZE)
            {
               this._averageDroppedFPSArray.pop();
            }
            totalDroppedFrameRate = 0;
            f = 0;
            while(f < this._averageDroppedFPSArray.length)
            {
               totalDroppedFrameRate += this._averageDroppedFPSArray[f];
               f++;
            }
            this._averageDroppedFPS = this._averageDroppedFPSArray.length < DEFAULT_AVG_FRAMERATE_SAMPLE_SIZE ? 0 : totalDroppedFrameRate / this._averageDroppedFPSArray.length;
         }
         catch(error:Error)
         {
            throw error;
         }
      }
      
      private function onNetStatusEvent(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_START:
               if(!this._timer.running && this.updateInterval > 0)
               {
                  this._timer.start();
                  break;
               }
               break;
            case NetStreamCodes.NETSTREAM_PLAY_STOP:
               this._timer.stop();
         }
      }
      
      private function onTimerEvent(param1:TimerEvent) : void
      {
         if(isNaN(this.netStream.time))
         {
            this._timer.stop();
         }
         else
         {
            this.calculateMetrics();
         }
      }
   }
}
