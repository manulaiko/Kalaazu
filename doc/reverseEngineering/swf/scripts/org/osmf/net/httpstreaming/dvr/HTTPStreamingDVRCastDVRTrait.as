package org.osmf.net.httpstreaming.dvr
{
   import flash.net.NetConnection;
   import org.osmf.events.DVRStreamInfoEvent;
   import org.osmf.net.httpstreaming.HTTPNetStream;
   import org.osmf.traits.DVRTrait;
   
   public class HTTPStreamingDVRCastDVRTrait extends DVRTrait
   {
       
      
      private var _connection:NetConnection;
      
      private var _stream:HTTPNetStream;
      
      private var _dvrInfo:DVRInfo;
      
      public function HTTPStreamingDVRCastDVRTrait(param1:NetConnection, param2:HTTPNetStream, param3:DVRInfo)
      {
         this._connection = param1;
         this._stream = param2;
         this._dvrInfo = param3;
         this._stream.addEventListener(DVRStreamInfoEvent.DVRSTREAMINFO,this.onDVRStreamInfo);
         super(param3.isRecording);
      }
      
      private function onDVRStreamInfo(param1:DVRStreamInfoEvent) : void
      {
         this._dvrInfo = param1.info as DVRInfo;
         setIsRecording(this._dvrInfo == null ? false : this._dvrInfo.isRecording);
      }
   }
}
