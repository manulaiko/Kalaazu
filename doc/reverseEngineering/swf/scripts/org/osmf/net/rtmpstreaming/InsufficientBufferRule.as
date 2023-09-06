package org.osmf.net.rtmpstreaming
{
   import flash.events.NetStatusEvent;
   import org.osmf.net.NetStreamCodes;
   import org.osmf.net.SwitchingRuleBase;
   
   public class InsufficientBufferRule extends SwitchingRuleBase
   {
       
      
      private var _panic:Boolean;
      
      private var _moreDetail:String;
      
      private var minBufferLength:Number;
      
      public function InsufficientBufferRule(param1:RTMPNetStreamMetrics, param2:Number = 2)
      {
         super(param1);
         this._panic = false;
         this.minBufferLength = param2;
         param1.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.monitorNetStatus,false,0,true);
      }
      
      override public function getNewIndex() : int
      {
         var _loc1_:int = -1;
         if(this._panic || this.rtmpMetrics.netStream.bufferLength < this.minBufferLength && this.rtmpMetrics.netStream.bufferLength > this.rtmpMetrics.netStream.bufferTime)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      private function monitorNetStatus(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case NetStreamCodes.NETSTREAM_BUFFER_FULL:
               this._panic = false;
               break;
            case NetStreamCodes.NETSTREAM_BUFFER_EMPTY:
               if(Math.round(this.rtmpMetrics.netStream.time) != 0)
               {
                  this._panic = true;
                  this._moreDetail = "Buffer was empty";
                  break;
               }
               break;
            case NetStreamCodes.NETSTREAM_PLAY_INSUFFICIENTBW:
               this._panic = true;
               this._moreDetail = "Stream had insufficient bandwidth";
         }
      }
      
      private function get rtmpMetrics() : RTMPNetStreamMetrics
      {
         return metrics as RTMPNetStreamMetrics;
      }
   }
}
