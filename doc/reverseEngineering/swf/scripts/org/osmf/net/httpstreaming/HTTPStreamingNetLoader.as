package org.osmf.net.httpstreaming
{
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import org.osmf.events.DVRStreamInfoEvent;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.URLResource;
   import org.osmf.metadata.Metadata;
   import org.osmf.metadata.MetadataNamespaces;
   import org.osmf.net.DynamicStreamingResource;
   import org.osmf.net.NetLoader;
   import org.osmf.net.NetStreamLoadTrait;
   import org.osmf.net.NetStreamSwitchManager;
   import org.osmf.net.NetStreamSwitchManagerBase;
   import org.osmf.net.SwitchingRuleBase;
   import org.osmf.net.httpstreaming.dvr.DVRInfo;
   import org.osmf.net.httpstreaming.dvr.HTTPStreamingDVRCastDVRTrait;
   import org.osmf.net.httpstreaming.dvr.HTTPStreamingDVRCastTimeTrait;
   import org.osmf.net.httpstreaming.f4f.HTTPStreamingF4FFileHandler;
   import org.osmf.net.httpstreaming.f4f.HTTPStreamingF4FIndexHandler;
   import org.osmf.net.rtmpstreaming.DroppedFramesRule;
   import org.osmf.traits.LoadState;
   
   public class HTTPStreamingNetLoader extends NetLoader
   {
       
      
      public function HTTPStreamingNetLoader()
      {
         super();
      }
      
      override public function canHandleResource(param1:MediaResourceBase) : Boolean
      {
         return param1.getMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA) as Metadata != null;
      }
      
      override protected function createNetStream(param1:NetConnection, param2:URLResource) : NetStream
      {
         var _loc3_:HTTPStreamingFileHandlerBase = new HTTPStreamingF4FFileHandler();
         var _loc4_:HTTPStreamingIndexHandlerBase = new HTTPStreamingF4FIndexHandler(_loc3_);
         var _loc5_:HTTPNetStream;
         (_loc5_ = new HTTPNetStream(param1,_loc4_,_loc3_)).manualSwitchMode = true;
         _loc5_.indexInfo = HTTPStreamingUtils.createF4FIndexInfo(param2);
         return _loc5_;
      }
      
      override protected function createNetStreamSwitchManager(param1:NetConnection, param2:NetStream, param3:DynamicStreamingResource) : NetStreamSwitchManagerBase
      {
         var _loc4_:* = null;
         if(param3 != null)
         {
            _loc4_ = new HTTPNetStreamMetrics(param2 as HTTPNetStream);
            return new NetStreamSwitchManager(param1,param2,param3,_loc4_,this.getDefaultSwitchingRules(_loc4_));
         }
         return null;
      }
      
      override protected function processFinishLoading(param1:NetStreamLoadTrait) : void
      {
         var netStream:HTTPNetStream = null;
         var onDVRStreamInfo:Function = null;
         var loadTrait:NetStreamLoadTrait = param1;
         onDVRStreamInfo = function(param1:DVRStreamInfoEvent):void
         {
            netStream.removeEventListener(DVRStreamInfoEvent.DVRSTREAMINFO,onDVRStreamInfo);
            loadTrait.setTrait(new HTTPStreamingDVRCastDVRTrait(loadTrait.connection,netStream,param1.info as DVRInfo));
            loadTrait.setTrait(new HTTPStreamingDVRCastTimeTrait(loadTrait.connection,netStream,param1.info as DVRInfo));
            updateLoadTrait(loadTrait,LoadState.READY);
         };
         var resource:URLResource = loadTrait.resource as URLResource;
         if(!this.dvrMetadataPresent(resource))
         {
            updateLoadTrait(loadTrait,LoadState.READY);
            return;
         }
         netStream = loadTrait.netStream as HTTPNetStream;
         netStream.addEventListener(DVRStreamInfoEvent.DVRSTREAMINFO,onDVRStreamInfo);
         netStream.DVRGetStreamInfo(null);
      }
      
      private function dvrMetadataPresent(param1:URLResource) : Boolean
      {
         var _loc2_:Metadata = param1.getMetadataValue(MetadataNamespaces.DVR_METADATA) as Metadata;
         return _loc2_ != null;
      }
      
      private function getDefaultSwitchingRules(param1:HTTPNetStreamMetrics) : Vector.<SwitchingRuleBase>
      {
         var _loc2_:Vector.<SwitchingRuleBase> = new Vector.<SwitchingRuleBase>();
         _loc2_.push(new DownloadRatioRule(param1));
         _loc2_.push(new DroppedFramesRule(param1));
         return _loc2_;
      }
   }
}
