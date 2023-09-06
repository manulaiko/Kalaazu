package org.osmf.net.dvr
{
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.Responder;
   import flash.utils.Timer;
   import org.osmf.utils.OSMFStrings;
   
   class DVRCastStreamInfoRetriever extends EventDispatcher
   {
       
      
      private var connection:NetConnection;
      
      private var streamName:String;
      
      private var retries:Number;
      
      private var timer:Timer;
      
      private var _streamInfo:DVRCastStreamInfo;
      
      private var _error:Object;
      
      function DVRCastStreamInfoRetriever(param1:NetConnection, param2:String)
      {
         super();
         if(param1 == null || param2 == null)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
         }
         this.connection = param1;
         this.streamName = param2;
      }
      
      public function get streamInfo() : DVRCastStreamInfo
      {
         return this._streamInfo;
      }
      
      public function get error() : Object
      {
         return this._error;
      }
      
      public function retrieve(param1:int = 5, param2:Number = 3) : void
      {
         if(isNaN(this.retries))
         {
            param1 = int(param1 || true);
            this._streamInfo = null;
            this._error = this._error = {"message":OSMFStrings.getString(OSMFStrings.DVR_MAXIMUM_RPC_ATTEMPTS).replace("%i",param1)};
            this.retries = param1;
            this.timer = new Timer(param2 * 1000,1);
            this.getStreamInfo();
         }
      }
      
      private function getStreamInfo() : void
      {
         var _loc1_:Responder = new TestableResponder(this.onGetStreamInfoResult,this.onServerCallError);
         --this.retries;
         this.connection.call(DVRCastConstants.RPC_GET_STREAM_INFO,_loc1_,this.streamName);
      }
      
      private function onGetStreamInfoResult(param1:Object) : void
      {
         if(Boolean(param1) && param1.code == DVRCastConstants.RESULT_GET_STREAM_INFO_SUCCESS)
         {
            this._error = null;
            this._streamInfo = new DVRCastStreamInfo(param1.data);
            this.complete();
         }
         else if(Boolean(param1) && param1.code == DVRCastConstants.RESULT_GET_STREAM_INFO_RETRY)
         {
            if(this.retries != 0)
            {
               this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
               this.timer.start();
            }
            else
            {
               this.complete();
            }
         }
         else
         {
            this._error = {"message":OSMFStrings.getString(OSMFStrings.DVR_UNEXPECTED_SERVER_RESPONSE) + param1.code};
            this.complete();
         }
      }
      
      private function onServerCallError(param1:Object) : void
      {
         this._error = param1;
         this.complete();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.getStreamInfo();
      }
      
      private function complete() : void
      {
         this.retries = NaN;
         this.timer = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
