package org.osmf.net
{
   import flash.events.NetStatusEvent;
   import flash.net.NetStream;
   import flash.net.NetStreamPlayOptions;
   import flash.net.NetStreamPlayTransitions;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorCodes;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.URLResource;
   import org.osmf.traits.PlayState;
   import org.osmf.traits.PlayTrait;
   import org.osmf.utils.OSMFStrings;
   
   public class NetStreamPlayTrait extends PlayTrait
   {
      
      private static const NETCONNECTION_FAILURE_ERROR_CODE:int = 2154;
       
      
      private var streamStarted:Boolean;
      
      private var netStream:NetStream;
      
      private var urlResource:URLResource;
      
      public function NetStreamPlayTrait(param1:NetStream, param2:MediaResourceBase)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
         }
         this.netStream = param1;
         this.urlResource = param2 as URLResource;
         var _loc3_:StreamingURLResource = param2 as StreamingURLResource;
         if(_loc3_ != null && _loc3_.streamType == StreamType.LIVE)
         {
            setCanPause(false);
         }
         param1.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus,false,1,true);
         NetClient(param1.client).addHandler(NetStreamCodes.ON_PLAY_STATUS,this.onPlayStatus,1);
      }
      
      override protected function playStateChangeStart(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == PlayState.PLAYING)
         {
            if(this.streamStarted)
            {
               this.netStream.resume();
            }
            else if(this.urlResource != null)
            {
               _loc3_ = this.urlResource as StreamingURLResource;
               _loc4_ = !!_loc3_ ? _loc3_.urlIncludesFMSApplicationInstance : false;
               _loc5_ = NetStreamUtils.getStreamNameFromURL(this.urlResource.url,_loc4_);
               _loc2_ = NetStreamUtils.getPlayArgsForResource(this.urlResource);
               _loc6_ = Number(_loc2_.start);
               _loc7_ = Number(_loc2_.len);
               if((_loc8_ = this.urlResource as DynamicStreamingResource) != null)
               {
                  (_loc9_ = new NetStreamPlayOptions()).start = _loc6_;
                  _loc9_.len = _loc7_;
                  _loc9_.streamName = _loc8_.streamItems[_loc8_.initialIndex].streamName;
                  _loc9_.transition = NetStreamPlayTransitions.RESET;
                  this.doPlay2(_loc9_);
               }
               else
               {
                  this.doPlay(_loc5_,_loc6_,_loc7_);
               }
            }
         }
         else
         {
            this.netStream.pause();
         }
      }
      
      private function onNetStatus(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_FAILED:
            case NetStreamCodes.NETSTREAM_PLAY_FILESTRUCTUREINVALID:
            case NetStreamCodes.NETSTREAM_PLAY_STREAMNOTFOUND:
            case NetStreamCodes.NETSTREAM_PLAY_NOSUPPORTEDTRACKFOUND:
            case NetStreamCodes.NETSTREAM_FAILED:
               this.netStream.pause();
               this.streamStarted = false;
               break;
            case NetStreamCodes.NETSTREAM_PLAY_STOP:
               if(this.urlResource != null && NetStreamUtils.isStreamingResource(this.urlResource) == false)
               {
                  stop();
                  break;
               }
         }
      }
      
      private function onPlayStatus(param1:Object) : void
      {
         switch(param1.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_COMPLETE:
               stop();
         }
      }
      
      private function doPlay(... rest) : void
      {
         var args:Array = rest;
         try
         {
            this.netStream.play.apply(this,args);
            this.streamStarted = true;
         }
         catch(error:Error)
         {
            streamStarted = false;
            stop();
            dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(MediaErrorCodes.NETSTREAM_PLAY_FAILED)));
         }
      }
      
      private function doPlay2(param1:NetStreamPlayOptions) : void
      {
         this.netStream.play2(param1);
         this.streamStarted = true;
      }
   }
}
