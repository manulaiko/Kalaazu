package org.osmf.elements
{
   import flash.events.DRMErrorEvent;
   import flash.events.DRMStatusEvent;
   import flash.events.Event;
   import flash.events.NetStatusEvent;
   import flash.events.StatusEvent;
   import flash.media.Video;
   import flash.net.NetStream;
   import flash.system.SystemUpdater;
   import flash.system.SystemUpdaterType;
   import flash.utils.ByteArray;
   import org.osmf.events.DRMEvent;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorCodes;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.events.TimeEvent;
   import org.osmf.media.DefaultTraitResolver;
   import org.osmf.media.LoadableElementBase;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.URLResource;
   import org.osmf.metadata.CuePoint;
   import org.osmf.metadata.TimelineMetadata;
   import org.osmf.net.DynamicStreamingResource;
   import org.osmf.net.ModifiableTimeTrait;
   import org.osmf.net.NetClient;
   import org.osmf.net.NetLoader;
   import org.osmf.net.NetStreamAudioTrait;
   import org.osmf.net.NetStreamBufferTrait;
   import org.osmf.net.NetStreamCodes;
   import org.osmf.net.NetStreamDisplayObjectTrait;
   import org.osmf.net.NetStreamDynamicStreamTrait;
   import org.osmf.net.NetStreamLoadTrait;
   import org.osmf.net.NetStreamPlayTrait;
   import org.osmf.net.NetStreamSeekTrait;
   import org.osmf.net.NetStreamTimeTrait;
   import org.osmf.net.NetStreamUtils;
   import org.osmf.net.StreamType;
   import org.osmf.net.StreamingURLResource;
   import org.osmf.net.drm.NetStreamDRMTrait;
   import org.osmf.traits.DRMState;
   import org.osmf.traits.DisplayObjectTrait;
   import org.osmf.traits.LoadState;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   import org.osmf.traits.MediaTraitBase;
   import org.osmf.traits.MediaTraitType;
   import org.osmf.traits.TimeTrait;
   import org.osmf.utils.OSMFStrings;
   
   public class LightweightVideoElement extends LoadableElementBase
   {
      
      private static const DRM_STATUS_CODE:String = "DRM.encryptedFLV";
      
      private static const DRM_NEEDS_AUTHENTICATION:int = 3330;
       
      
      private var displayObjectTrait:DisplayObjectTrait;
      
      private var defaultTimeTrait:ModifiableTimeTrait;
      
      private var stream:NetStream;
      
      private var video:Video;
      
      private var embeddedCuePoints:TimelineMetadata;
      
      private var _smoothing:Boolean;
      
      private var _deblocking:int;
      
      private var drmTrait:NetStreamDRMTrait;
      
      public function LightweightVideoElement(param1:MediaResourceBase = null, param2:NetLoader = null)
      {
         if(param2 == null)
         {
            param2 = new NetLoader();
         }
         super(param1,param2);
         if(!(param1 == null || param1 is URLResource))
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
      }
      
      public function get client() : NetClient
      {
         return this.stream != null ? this.stream.client as NetClient : null;
      }
      
      public function get defaultDuration() : Number
      {
         return !!this.defaultTimeTrait ? this.defaultTimeTrait.duration : NaN;
      }
      
      public function set defaultDuration(param1:Number) : void
      {
         if(isNaN(param1) || param1 < 0)
         {
            if(this.defaultTimeTrait != null)
            {
               removeTraitResolver(MediaTraitType.TIME);
               this.defaultTimeTrait = null;
            }
         }
         else
         {
            if(this.defaultTimeTrait == null)
            {
               this.defaultTimeTrait = new ModifiableTimeTrait();
               addTraitResolver(MediaTraitType.TIME,new DefaultTraitResolver(MediaTraitType.TIME,this.defaultTimeTrait));
            }
            this.defaultTimeTrait.duration = param1;
         }
      }
      
      public function get smoothing() : Boolean
      {
         return this._smoothing;
      }
      
      public function set smoothing(param1:Boolean) : void
      {
         this._smoothing = param1;
         if(this.video != null)
         {
            this.video.smoothing = param1;
         }
      }
      
      public function get deblocking() : int
      {
         return this._deblocking;
      }
      
      public function set deblocking(param1:int) : void
      {
         this._deblocking = param1;
         if(this.video != null)
         {
            this.video.deblocking = param1;
         }
      }
      
      public function get currentFPS() : Number
      {
         return this.stream != null ? this.stream.currentFPS : 0;
      }
      
      override protected function createLoadTrait(param1:MediaResourceBase, param2:LoaderBase) : LoadTrait
      {
         return new NetStreamLoadTrait(param2,param1);
      }
      
      protected function createVideo() : Video
      {
         return new Video();
      }
      
      override protected function processReadyState() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:NetStreamLoadTrait = getTrait(MediaTraitType.LOAD) as NetStreamLoadTrait;
         this.stream = _loc1_.netStream;
         this.video = this.createVideo();
         this.video.smoothing = this._smoothing;
         this.video.deblocking = this._deblocking;
         this.video.height = 0;
         this.video.width = 0;
         this.video.attachNetStream(this.stream);
         NetClient(this.stream.client).addHandler(NetStreamCodes.ON_META_DATA,this.onMetaData);
         NetClient(this.stream.client).addHandler(NetStreamCodes.ON_CUE_POINT,this.onCuePoint);
         this.stream.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatusEvent);
         this.stream.addEventListener(DRMErrorEvent.DRM_ERROR,this.onDRMErrorEvent);
         _loc2_ = resource as StreamingURLResource;
         if(_loc2_ != null && Boolean(_loc2_.drmContentData))
         {
            _loc3_ = _loc2_.drmContentData;
            this.setupDRMTrait(_loc3_);
         }
         else
         {
            this.stream.addEventListener(StatusEvent.STATUS,this.onStatus);
            this.stream.addEventListener(DRMStatusEvent.DRM_STATUS,this.onDRMStatus);
         }
         this.finishLoad();
      }
      
      private function finishLoad() : void
      {
         var dsResource:DynamicStreamingResource;
         var trait:MediaTraitBase = null;
         var timeTrait:TimeTrait = null;
         var onDurationChange:Function = null;
         var dsTrait:MediaTraitBase = null;
         var loadTrait:NetStreamLoadTrait = getTrait(MediaTraitType.LOAD) as NetStreamLoadTrait;
         trait = loadTrait.getTrait(MediaTraitType.DVR);
         if(trait != null)
         {
            addTrait(MediaTraitType.DVR,trait);
         }
         trait = loadTrait.getTrait(MediaTraitType.AUDIO);
         addTrait(MediaTraitType.AUDIO,trait || new NetStreamAudioTrait(this.stream));
         trait = loadTrait.getTrait(MediaTraitType.BUFFER);
         addTrait(MediaTraitType.BUFFER,trait || new NetStreamBufferTrait(this.stream));
         timeTrait = (trait = loadTrait.getTrait(MediaTraitType.TIME)) as TimeTrait;
         if(timeTrait == null)
         {
            timeTrait = new NetStreamTimeTrait(this.stream,loadTrait.resource,this.defaultDuration);
         }
         addTrait(MediaTraitType.TIME,timeTrait);
         trait = loadTrait.getTrait(MediaTraitType.DISPLAY_OBJECT);
         addTrait(MediaTraitType.DISPLAY_OBJECT,trait || new NetStreamDisplayObjectTrait(this.stream,this.video,NaN,NaN));
         trait = loadTrait.getTrait(MediaTraitType.PLAY);
         addTrait(MediaTraitType.PLAY,trait || new NetStreamPlayTrait(this.stream,resource));
         trait = loadTrait.getTrait(MediaTraitType.SEEK);
         if(trait == null && NetStreamUtils.getStreamType(resource) != StreamType.LIVE)
         {
            trait = new NetStreamSeekTrait(timeTrait,loadTrait,this.stream);
         }
         if(trait != null)
         {
            if(isNaN(timeTrait.duration) || timeTrait.duration == 0)
            {
               onDurationChange = function(param1:TimeEvent):void
               {
                  timeTrait.removeEventListener(TimeEvent.DURATION_CHANGE,onDurationChange);
                  addTrait(MediaTraitType.SEEK,trait);
               };
               timeTrait.addEventListener(TimeEvent.DURATION_CHANGE,onDurationChange);
            }
            else
            {
               addTrait(MediaTraitType.SEEK,trait);
            }
         }
         dsResource = resource as DynamicStreamingResource;
         if(dsResource != null && loadTrait.switchManager != null)
         {
            dsTrait = loadTrait.getTrait(MediaTraitType.DYNAMIC_STREAM);
            addTrait(MediaTraitType.DYNAMIC_STREAM,dsTrait || new NetStreamDynamicStreamTrait(this.stream,loadTrait.switchManager,dsResource));
         }
      }
      
      override protected function processUnloadingState() : void
      {
         NetClient(this.stream.client).removeHandler(NetStreamCodes.ON_META_DATA,this.onMetaData);
         this.stream.removeEventListener(NetStatusEvent.NET_STATUS,this.onNetStatusEvent);
         removeTrait(MediaTraitType.AUDIO);
         removeTrait(MediaTraitType.BUFFER);
         removeTrait(MediaTraitType.PLAY);
         removeTrait(MediaTraitType.TIME);
         removeTrait(MediaTraitType.DISPLAY_OBJECT);
         removeTrait(MediaTraitType.SEEK);
         removeTrait(MediaTraitType.DYNAMIC_STREAM);
         removeTrait(MediaTraitType.DVR);
         this.stream.removeEventListener(DRMErrorEvent.DRM_ERROR,this.onDRMErrorEvent);
         this.stream.removeEventListener(DRMStatusEvent.DRM_STATUS,this.onDRMStatus);
         this.stream.removeEventListener(StatusEvent.STATUS,this.onStatus);
         if(this.drmTrait != null)
         {
            this.drmTrait.removeEventListener(DRMEvent.DRM_STATE_CHANGE,this.reloadAfterAuth);
            removeTrait(MediaTraitType.DRM);
            this.drmTrait = null;
         }
         this.video.attachNetStream(null);
         this.stream = null;
         this.video = null;
         this.displayObjectTrait = null;
      }
      
      private function onMetaData(param1:Object) : void
      {
         var dynamicCuePoints:TimelineMetadata = null;
         var var_1:int = 0;
         var cuePoint:CuePoint = null;
         var info:Object = param1;
         var cuePoints:Array = info.cuePoints;
         if(cuePoints != null && cuePoints.length > 0)
         {
            dynamicCuePoints = getMetadata(CuePoint.DYNAMIC_CUEPOINTS_NAMESPACE) as TimelineMetadata;
            if(dynamicCuePoints == null)
            {
               dynamicCuePoints = new TimelineMetadata(this);
               addMetadata(CuePoint.DYNAMIC_CUEPOINTS_NAMESPACE,dynamicCuePoints);
            }
            var_1 = 0;
            while(var_1 < cuePoints.length)
            {
               cuePoint = new CuePoint(cuePoints[var_1].type,cuePoints[var_1].time,cuePoints[var_1].name,cuePoints[var_1].parameters);
               try
               {
                  dynamicCuePoints.addMarker(cuePoint);
               }
               catch(error:ArgumentError)
               {
               }
               var_1++;
            }
         }
      }
      
      private function onCuePoint(param1:Object) : void
      {
         var cuePoint:CuePoint;
         var info:Object = param1;
         if(this.embeddedCuePoints == null)
         {
            this.embeddedCuePoints = new TimelineMetadata(this);
            addMetadata(CuePoint.EMBEDDED_CUEPOINTS_NAMESPACE,this.embeddedCuePoints);
         }
         cuePoint = new CuePoint(info.type,info.time,info.name,info.parameters);
         try
         {
            this.embeddedCuePoints.addMarker(cuePoint);
         }
         catch(error:ArgumentError)
         {
         }
      }
      
      private function onUpdateComplete(param1:Event) : void
      {
         (getTrait(MediaTraitType.LOAD) as LoadTrait).unload();
         (getTrait(MediaTraitType.LOAD) as LoadTrait).load();
      }
      
      private function onNetStatusEvent(param1:NetStatusEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.info.code)
         {
            case NetStreamCodes.NETSTREAM_PLAY_FAILED:
            case NetStreamCodes.NETSTREAM_FAILED:
               _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_PLAY_FAILED,param1.info.description);
               break;
            case NetStreamCodes.NETSTREAM_PLAY_STREAMNOTFOUND:
               _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_STREAM_NOT_FOUND,param1.info.description);
               break;
            case NetStreamCodes.NETSTREAM_PLAY_FILESTRUCTUREINVALID:
               _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_FILE_STRUCTURE_INVALID,param1.info.description);
               break;
            case NetStreamCodes.NETSTREAM_PLAY_NOSUPPORTEDTRACKFOUND:
               _loc2_ = new MediaError(MediaErrorCodes.NETSTREAM_NO_SUPPORTED_TRACK_FOUND,param1.info.description);
         }
         if(param1.info.code == NetStreamCodes.NETSTREAM_DRM_UPDATE)
         {
            this.update(SystemUpdaterType.DRM);
         }
         if(_loc2_ != null)
         {
            dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,_loc2_));
         }
      }
      
      private function onStatus(param1:StatusEvent) : void
      {
         if(param1.code == DRM_STATUS_CODE && getTrait(MediaTraitType.DRM) == null)
         {
            this.createDRMTrait();
         }
      }
      
      private function onDRMStatus(param1:DRMStatusEvent) : void
      {
         this.drmTrait.inlineOnVoucher(param1);
      }
      
      private function reloadAfterAuth(param1:DRMEvent) : void
      {
         var _loc2_:* = null;
         if(this.drmTrait.drmState == DRMState.AUTHENTICATION_COMPLETE)
         {
            _loc2_ = getTrait(MediaTraitType.LOAD) as NetStreamLoadTrait;
            if(_loc2_.loadState == LoadState.READY)
            {
               _loc2_.unload();
            }
            _loc2_.load();
         }
      }
      
      private function createDRMTrait() : void
      {
         this.drmTrait = new NetStreamDRMTrait();
         addTrait(MediaTraitType.DRM,this.drmTrait);
      }
      
      private function setupDRMTrait(param1:ByteArray) : void
      {
         this.createDRMTrait();
         this.drmTrait.drmMetadata = param1;
      }
      
      private function onDRMErrorEvent(param1:DRMErrorEvent) : void
      {
         if(param1.errorID == DRM_NEEDS_AUTHENTICATION)
         {
            this.drmTrait.addEventListener(DRMEvent.DRM_STATE_CHANGE,this.reloadAfterAuth);
            this.drmTrait.drmMetadata = param1.contentData;
         }
         else if(param1.drmUpdateNeeded)
         {
            this.update(SystemUpdaterType.DRM);
         }
         else if(param1.systemUpdateNeeded)
         {
            this.update(SystemUpdaterType.SYSTEM);
         }
         else
         {
            this.drmTrait.inlineDRMFailed(new MediaError(param1.errorID));
         }
      }
      
      private function update(param1:String) : void
      {
         if(this.drmTrait == null)
         {
            this.createDRMTrait();
         }
         var _loc2_:SystemUpdater = this.drmTrait.update(param1);
         _loc2_.addEventListener(Event.COMPLETE,this.onUpdateComplete);
      }
   }
}
