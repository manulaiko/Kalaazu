package org.osmf.net.dvr
{
   import flash.events.Event;
   import flash.net.NetConnection;
   import flash.net.Responder;
   import flash.utils.Dictionary;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorCodes;
   import org.osmf.events.NetConnectionFactoryEvent;
   import org.osmf.media.URLResource;
   import org.osmf.net.NetConnectionFactory;
   import org.osmf.net.NetConnectionFactoryBase;
   import org.osmf.net.NetStreamUtils;
   import org.osmf.net.StreamingURLResource;
   
   public class DVRCastNetConnectionFactory extends NetConnectionFactoryBase
   {
       
      
      private var innerFactory:NetConnectionFactoryBase;
      
      private var subscribedStreams:Dictionary;
      
      public function DVRCastNetConnectionFactory(param1:NetConnectionFactoryBase = null)
      {
         this.subscribedStreams = new Dictionary();
         this.innerFactory = param1 || new NetConnectionFactory();
         this.innerFactory.addEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE,this.onCreationComplete);
         this.innerFactory.addEventListener(NetConnectionFactoryEvent.CREATION_ERROR,this.onCreationError);
         super();
      }
      
      override public function create(param1:URLResource) : void
      {
         this.innerFactory.create(param1);
      }
      
      override public function closeNetConnection(param1:NetConnection) : void
      {
         var _loc2_:String = this.subscribedStreams[param1];
         if(_loc2_ != null)
         {
            param1.call(DVRCastConstants.RPC_UNSUBSCRIBE,null,_loc2_);
            delete this.subscribedStreams[param1];
         }
         this.innerFactory.closeNetConnection(param1);
      }
      
      private function onCreationComplete(param1:NetConnectionFactoryEvent) : void
      {
         var urlIncludesFMSApplicationInstance:Boolean;
         var responder:Responder;
         var urlResource:URLResource = null;
         var netConnection:NetConnection = null;
         var streamName:String = null;
         var streamingResource:StreamingURLResource = null;
         var onStreamSubscriptionResult:Function = null;
         var onStreamInfoRetrieverComplete:Function = null;
         var onServerCallError:Function = null;
         var var_6:NetConnectionFactoryEvent = param1;
         onStreamSubscriptionResult = function(param1:Object):void
         {
            var _loc2_:DVRCastStreamInfoRetriever = new DVRCastStreamInfoRetriever(netConnection,streamName);
            _loc2_.addEventListener(Event.COMPLETE,onStreamInfoRetrieverComplete);
            _loc2_.retrieve();
         };
         onStreamInfoRetrieverComplete = function(param1:Event):void
         {
            var _loc3_:* = null;
            var _loc2_:DVRCastStreamInfoRetriever = param1.target as DVRCastStreamInfoRetriever;
            if(_loc2_.streamInfo != null)
            {
               removeEventListener(NetConnectionFactoryEvent.CREATION_COMPLETE,onCreationComplete);
               if(_loc2_.streamInfo.offline == true)
               {
                  dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_ERROR,false,false,netConnection,urlResource,new MediaError(MediaErrorCodes.DVRCAST_CONTENT_OFFLINE)));
                  netConnection.call(DVRCastConstants.RPC_UNSUBSCRIBE,null,streamName);
                  netConnection = null;
               }
               else
               {
                  _loc3_ = new DVRCastRecordingInfo();
                  _loc3_.startDuration = _loc2_.streamInfo.currentLength;
                  _loc3_.startOffset = calculateOffset(_loc2_.streamInfo);
                  _loc3_.startTime = new Date();
                  streamingResource.addMetadataValue(DVRCastConstants.STREAM_INFO_KEY,_loc2_.streamInfo);
                  streamingResource.addMetadataValue(DVRCastConstants.RECORDING_INFO_KEY,_loc3_);
                  subscribedStreams[netConnection] = streamName;
                  dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_COMPLETE,false,false,netConnection,urlResource));
               }
            }
            else
            {
               onServerCallError(_loc2_.error);
            }
         };
         onServerCallError = function(param1:Object):void
         {
            dispatchEvent(new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_ERROR,false,false,netConnection,urlResource,new MediaError(MediaErrorCodes.DVRCAST_SUBSCRIBE_FAILED,!!param1 ? param1.message : "")));
         };
         urlResource = var_6.resource as URLResource;
         netConnection = var_6.netConnection;
         var_6.stopImmediatePropagation();
         streamingResource = urlResource as StreamingURLResource;
         urlIncludesFMSApplicationInstance = !!streamingResource ? streamingResource.urlIncludesFMSApplicationInstance : false;
         streamName = NetStreamUtils.getStreamNameFromURL(urlResource.url,urlIncludesFMSApplicationInstance);
         responder = new TestableResponder(onStreamSubscriptionResult,onServerCallError);
         var_6.netConnection.call(DVRCastConstants.RPC_SUBSCRIBE,responder,streamName);
      }
      
      private function onCreationError(param1:NetConnectionFactoryEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function calculateOffset(param1:DVRCastStreamInfo) : Number
      {
         return DVRUtils.calculateOffset(param1.beginOffset,param1.endOffset,param1.currentLength);
      }
   }
}
