package spark.components
{
   import flash.events.Event;
   import flash.geom.Point;
   import flash.media.Video;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import org.osmf.containers.MediaContainer;
   import org.osmf.elements.VideoElement;
   import org.osmf.events.AudioEvent;
   import org.osmf.events.DisplayObjectEvent;
   import org.osmf.events.LoadEvent;
   import org.osmf.events.MediaPlayerCapabilityChangeEvent;
   import org.osmf.events.MediaPlayerStateChangeEvent;
   import org.osmf.events.SeekEvent;
   import org.osmf.events.TimeEvent;
   import org.osmf.layout.HorizontalAlign;
   import org.osmf.layout.LayoutMetadata;
   import org.osmf.layout.ScaleMode;
   import org.osmf.layout.VerticalAlign;
   import org.osmf.media.DefaultMediaFactory;
   import org.osmf.media.MediaElement;
   import org.osmf.media.MediaFactory;
   import org.osmf.media.MediaFactoryItem;
   import org.osmf.media.MediaPlayer;
   import org.osmf.media.MediaPlayerState;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.MediaType;
   import org.osmf.media.URLResource;
   import org.osmf.net.DynamicStreamingItem;
   import org.osmf.net.DynamicStreamingResource;
   import org.osmf.net.rtmpstreaming.RTMPDynamicStreamingNetLoader;
   import org.osmf.utils.OSMFStrings;
   import org.osmf.utils.URL;
   import spark.components.mediaClasses.DynamicStreamingVideoItem;
   import spark.components.mediaClasses.DynamicStreamingVideoSource;
   import spark.primitives.BitmapImage;
   
   public class VideoDisplay extends UIComponent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      mx_internal var videoPlayer:MediaPlayer;
      
      mx_internal var videoContainer:MediaContainer;
      
      mx_internal var mediaFactory:MediaFactory;
      
      private var _isOnDisplayList:Boolean = false;
      
      private var playTheVideoOnVisible:Boolean = true;
      
      private var effectiveVisibility:Boolean = false;
      
      private var effectiveVisibilityChanged:Boolean = false;
      
      private var effectiveEnabled:Boolean = false;
      
      private var effectiveEnabledChanged:Boolean = false;
      
      private var initializedOnce:Boolean = false;
      
      private var beforeLoadMuted:Boolean;
      
      private var inLoadingState1:Boolean;
      
      private var inLoadingState2:Boolean;
      
      private var inLoadingState3:Boolean;
      
      private var oldCurrentTimeUpdateInterval:Number = NaN;
      
      private var oldBytesLoadedUpdateInterval:Number = NaN;
      
      private var _autoDisplayFirstFrame:Boolean = true;
      
      private var _autoPlay:Boolean = true;
      
      private var _pauseWhenHidden:Boolean = true;
      
      private var _scaleMode:String = "letterbox";
      
      private var _source:Object;
      
      private var sourceChanged:Boolean;
      
      private var _thumbnailSource:Object;
      
      private var thumbnailGroup:Group;
      
      private var thumbnailBitmapImage:BitmapImage;
      
      public function VideoDisplay()
      {
         super();
         this.createUnderlyingVideoPlayer();
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStageHandler);
         OSMFStrings.resourceStringFunction = getResourceString;
      }
      
      private static function getResourceString(param1:String, param2:Array = null) : String
      {
         var _loc3_:IResourceManager = ResourceManager.getInstance();
         return _loc3_.getString("osmf",param1,param2);
      }
      
      private static function getScaledSize(param1:String, param2:Number, param3:Number, param4:Number, param5:Number) : Point
      {
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         switch(param1)
         {
            case ScaleMode.ZOOM:
            case ScaleMode.LETTERBOX:
               _loc7_ = param2 / param3;
               _loc8_ = (param4 || param2) / (param5 || param3);
               if(param1 == ScaleMode.ZOOM && _loc8_ < _loc7_ || param1 == ScaleMode.LETTERBOX && _loc8_ > _loc7_)
               {
                  _loc6_ = new Point(param2,param2 / _loc8_);
                  break;
               }
               _loc6_ = new Point(param3 * _loc8_,param3);
               break;
            case ScaleMode.STRETCH:
               _loc6_ = new Point(param2,param3);
               break;
            case ScaleMode.NONE:
               _loc6_ = new Point(param4 || param2,param5 || param3);
         }
         return _loc6_;
      }
      
      public function get autoDisplayFirstFrame() : Boolean
      {
         return this._autoDisplayFirstFrame;
      }
      
      public function set autoDisplayFirstFrame(param1:Boolean) : void
      {
         this._autoDisplayFirstFrame = param1;
      }
      
      public function get autoPlay() : Boolean
      {
         return this._autoPlay;
      }
      
      public function set autoPlay(param1:Boolean) : void
      {
         if(this.autoPlay == param1)
         {
            return;
         }
         this._autoPlay = param1;
         this.changePlayback(false,false);
      }
      
      public function get autoRewind() : Boolean
      {
         return this.mx_internal::videoPlayer.autoRewind;
      }
      
      public function set autoRewind(param1:Boolean) : void
      {
         this.mx_internal::videoPlayer.autoRewind = param1;
      }
      
      [Bindable("mediaPlayerStateChange")]
      [Bindable("bytesLoadedChange")]
      public function get bytesLoaded() : Number
      {
         return this.mx_internal::videoPlayer.bytesLoaded;
      }
      
      [Bindable("mediaPlayerStateChange")]
      public function get bytesTotal() : Number
      {
         return this.mx_internal::videoPlayer.bytesTotal;
      }
      
      [Bindable("mediaPlayerStateChange")]
      [Bindable("currentTimeChange")]
      public function get currentTime() : Number
      {
         return this.mx_internal::videoPlayer.currentTime;
      }
      
      [Bindable("mediaPlayerStateChange")]
      [Bindable("durationChange")]
      public function get duration() : Number
      {
         return this.mx_internal::videoPlayer.duration;
      }
      
      public function get loop() : Boolean
      {
         return this.mx_internal::videoPlayer.loop;
      }
      
      public function set loop(param1:Boolean) : void
      {
         if(this.loop == param1)
         {
            return;
         }
         this.mx_internal::videoPlayer.loop = param1;
      }
      
      [Bindable("mediaPlayerStateChange")]
      public function get mediaPlayerState() : String
      {
         return this.mx_internal::videoPlayer.state;
      }
      
      [Bindable("volumeChanged")]
      public function get muted() : Boolean
      {
         if(this.inLoadingState2)
         {
            return this.beforeLoadMuted;
         }
         return this.mx_internal::videoPlayer.muted;
      }
      
      public function set muted(param1:Boolean) : void
      {
         if(this.muted == param1)
         {
            return;
         }
         if(this.inLoadingState2)
         {
            this.beforeLoadMuted = param1;
            return;
         }
         this.mx_internal::videoPlayer.muted = param1;
      }
      
      public function get pauseWhenHidden() : Boolean
      {
         return this._pauseWhenHidden;
      }
      
      public function set pauseWhenHidden(param1:Boolean) : void
      {
         if(this._pauseWhenHidden == param1)
         {
            return;
         }
         this._pauseWhenHidden = param1;
         if(this._pauseWhenHidden)
         {
            this.addVisibilityListeners();
            this.computeEffectiveVisibilityAndEnabled();
         }
         else
         {
            this.removeVisibilityListeners();
         }
         this.changePlayback(param1,false);
      }
      
      [Bindable("mediaPlayerStateChange")]
      public function get playing() : Boolean
      {
         return this.mx_internal::videoPlayer.playing;
      }
      
      public function get scaleMode() : String
      {
         return this._scaleMode;
      }
      
      public function set scaleMode(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.scaleMode == param1)
         {
            return;
         }
         switch(param1)
         {
            case ScaleMode.NONE:
               this._scaleMode = ScaleMode.NONE;
               break;
            case ScaleMode.STRETCH:
               this._scaleMode = ScaleMode.STRETCH;
               break;
            case ScaleMode.LETTERBOX:
               this._scaleMode = ScaleMode.LETTERBOX;
               break;
            case ScaleMode.ZOOM:
               this._scaleMode = ScaleMode.ZOOM;
               break;
            default:
               this._scaleMode = ScaleMode.LETTERBOX;
         }
         if(this.mx_internal::videoPlayer.media)
         {
            _loc2_ = this.mx_internal::videoPlayer.media.getMetadata(LayoutMetadata.LAYOUT_NAMESPACE) as LayoutMetadata;
            if(_loc2_)
            {
               _loc2_.scaleMode = this._scaleMode;
            }
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      [Bindable("sourceChanged")]
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         this._source = param1;
         if(!this.initializedOnce)
         {
            this.sourceChanged = true;
            invalidateProperties();
         }
         else
         {
            this.setUpSource();
         }
         dispatchEvent(new Event("sourceChanged"));
      }
      
      mx_internal function get thumbnailSource() : Object
      {
         return this._thumbnailSource;
      }
      
      mx_internal function set thumbnailSource(param1:Object) : void
      {
         if(this._thumbnailSource == param1)
         {
            return;
         }
         this._thumbnailSource = param1;
         if(!this.initializedOnce)
         {
            this.sourceChanged = true;
            invalidateProperties();
         }
         else
         {
            this.setUpThumbnailSource();
         }
      }
      
      private function setUpThumbnailSource() : void
      {
         if(this.mx_internal::thumbnailSource)
         {
            if(!this.thumbnailGroup)
            {
               this.thumbnailBitmapImage = new BitmapImage();
               this.thumbnailBitmapImage.includeInLayout = false;
               this.thumbnailGroup = new Group();
               addChild(this.thumbnailGroup);
               this.thumbnailGroup.clipAndEnableScrolling = true;
               this.thumbnailGroup.addElement(this.thumbnailBitmapImage);
            }
            if(!this.contains(this.thumbnailGroup))
            {
               addChild(this.thumbnailGroup);
            }
            this.thumbnailBitmapImage.source = this.mx_internal::thumbnailSource;
            invalidateSize();
            invalidateDisplayList();
         }
         else if(this.thumbnailGroup)
         {
            if(this.thumbnailBitmapImage)
            {
               this.thumbnailBitmapImage.source = null;
            }
            if(this.contains(this.thumbnailGroup))
            {
               removeChild(this.thumbnailGroup);
            }
            invalidateSize();
         }
      }
      
      public function get videoObject() : Video
      {
         return this.mx_internal::videoPlayer.displayObject as Video;
      }
      
      [Bindable("volumeChanged")]
      public function get volume() : Number
      {
         return this.mx_internal::videoPlayer.volume;
      }
      
      public function set volume(param1:Number) : void
      {
         if(this.volume == param1)
         {
            return;
         }
         this.mx_internal::videoPlayer.volume = param1;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:* = false;
         var _loc2_:Boolean = false;
         super.commitProperties();
         this.initializedOnce = true;
         if(this.effectiveVisibilityChanged || this.effectiveEnabledChanged)
         {
            this.computeEffectiveVisibilityAndEnabled();
            _loc1_ = false;
            _loc2_ = false;
            if(this.effectiveVisibilityChanged && this.pauseWhenHidden)
            {
               _loc1_ = !this.effectiveVisibility;
               _loc2_ = this.effectiveVisibility;
            }
            if(this.effectiveEnabledChanged)
            {
               if(!this.effectiveEnabled)
               {
                  _loc1_ = true;
               }
            }
            this.changePlayback(_loc1_,_loc2_);
            this.effectiveVisibilityChanged = false;
            this.effectiveEnabledChanged = false;
         }
         if(this.sourceChanged)
         {
            this.sourceChanged = false;
            if(this.mx_internal::thumbnailSource)
            {
               this.setUpThumbnailSource();
            }
            else
            {
               this.setUpSource();
            }
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super.measure();
         if(Boolean(this.mx_internal::thumbnailSource) && Boolean(this.thumbnailGroup))
         {
            _loc1_ = this.thumbnailBitmapImage.getPreferredBoundsWidth();
            _loc2_ = this.thumbnailBitmapImage.getPreferredBoundsHeight();
         }
         else
         {
            _loc1_ = this.mx_internal::videoPlayer.mediaWidth;
            if(isNaN(_loc1_))
            {
               _loc1_ = 0;
            }
            _loc2_ = this.mx_internal::videoPlayer.mediaHeight;
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
            }
         }
         measuredWidth = _loc1_;
         measuredHeight = _loc2_;
         var _loc3_:* = !isNaN(explicitWidth);
         var _loc4_:* = !isNaN(explicitHeight);
         if(_loc3_ && !_loc4_ && _loc1_ > 0)
         {
            measuredHeight = explicitWidth * _loc2_ / _loc1_;
         }
         else if(_loc4_ && !_loc3_ && _loc2_ > 0)
         {
            measuredWidth = explicitHeight * _loc1_ / _loc2_;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         super.updateDisplayList(param1,param2);
         if(Boolean(this.mx_internal::thumbnailSource) && Boolean(this.thumbnailGroup))
         {
            _loc3_ = getScaledSize(this.scaleMode,param1,param2,this.thumbnailBitmapImage.getPreferredBoundsWidth(),this.thumbnailBitmapImage.getPreferredBoundsHeight());
            this.thumbnailGroup.setLayoutBoundsSize(param1,param2);
            this.thumbnailBitmapImage.setLayoutBoundsSize(_loc3_.x,_loc3_.y);
            this.thumbnailBitmapImage.x = (param1 - _loc3_.x) / 2;
            this.thumbnailBitmapImage.y = (param2 - _loc3_.y) / 2;
            return;
         }
         this.mx_internal::videoContainer.width = Math.floor(param1);
         this.mx_internal::videoContainer.height = Math.floor(param2);
         this.mx_internal::videoContainer.validateNow();
      }
      
      public function pause() : void
      {
         if(!this.videoPlayerResponsive())
         {
            return;
         }
         this.playTheVideoOnVisible = false;
         if(!this.inLoadingState1 && this.mx_internal::videoPlayer.canPause)
         {
            this.mx_internal::videoPlayer.pause();
         }
         else if(!this.mx_internal::videoPlayer.canPause && this.autoDisplayFirstFrame)
         {
            this.load();
         }
      }
      
      public function play() : void
      {
         if(!this.videoPlayerResponsive())
         {
            return;
         }
         this.playTheVideoOnVisible = false;
         if(this.inLoadingState1)
         {
            this.cancelLoadAndPlay();
         }
         else if(this.mx_internal::videoPlayer.canPlay)
         {
            this.mx_internal::videoPlayer.play();
         }
      }
      
      public function seek(param1:Number) : void
      {
         if(!this.videoPlayerResponsive())
         {
            return;
         }
         if(this.mx_internal::videoPlayer.canSeek)
         {
            this.mx_internal::videoPlayer.seek(param1);
         }
      }
      
      public function stop() : void
      {
         if(!this.videoPlayerResponsive())
         {
            return;
         }
         this.playTheVideoOnVisible = false;
         if(!this.inLoadingState1 && this.mx_internal::videoPlayer.canPause)
         {
            this.mx_internal::videoPlayer.stop();
         }
         else if(!this.mx_internal::videoPlayer.canPause && this.autoDisplayFirstFrame)
         {
            this.load();
         }
      }
      
      private function videoPlayerResponsive() : Boolean
      {
         if(!this.initializedOnce)
         {
            return false;
         }
         if(this.mx_internal::thumbnailSource)
         {
            return false;
         }
         if(this.mx_internal::videoPlayer.state == MediaPlayerState.PLAYBACK_ERROR || this.mx_internal::videoPlayer.state == MediaPlayerState.UNINITIALIZED || this.mx_internal::videoPlayer.state == MediaPlayerState.LOADING)
         {
            return false;
         }
         if(!this.source)
         {
            return false;
         }
         return true;
      }
      
      private function createUnderlyingVideoPlayer() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.mx_internal::videoPlayer = new MediaPlayer();
         this.mx_internal::videoContainer = new MediaContainer();
         this.mx_internal::videoContainer.clipChildren = true;
         this.mx_internal::mediaFactory = new DefaultMediaFactory();
         var _loc1_:* = ["org.osmf.elements.video.dvr.dvrcast","org.osmf.elements.image","org.osmf.elements.swf"];
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = this.mx_internal::mediaFactory.getItemById(_loc2_);
            if(_loc3_)
            {
               this.mx_internal::mediaFactory.removeItem(_loc3_);
            }
         }
         this.mx_internal::videoPlayer.addEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE,this.videoPlayer_mediaSizeChangeHandler);
         this.mx_internal::videoPlayer.addEventListener(AudioEvent.VOLUME_CHANGE,this.videoPlayer_volumeChangeHandler);
         this.mx_internal::videoPlayer.addEventListener(AudioEvent.MUTED_CHANGE,this.videoPlayer_mutedChangeHandler);
         this.mx_internal::videoPlayer.addEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE,this.videoPlayer_mediaPlayerStateChangeHandler);
         this.mx_internal::videoPlayer.addEventListener(TimeEvent.CURRENT_TIME_CHANGE,dispatchEvent);
         this.mx_internal::videoPlayer.addEventListener(LoadEvent.BYTES_LOADED_CHANGE,dispatchEvent);
         this.mx_internal::videoPlayer.addEventListener(TimeEvent.DURATION_CHANGE,this.videoPlayer_durationChangeHandler);
         this.mx_internal::videoPlayer.addEventListener(TimeEvent.COMPLETE,dispatchEvent);
         addChild(this.mx_internal::videoContainer);
      }
      
      private function setUpSource() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         this.cleanUpSource();
         if(Boolean(this.mx_internal::videoPlayer.media) && this.mx_internal::videoContainer.containsMediaElement(this.mx_internal::videoPlayer.media))
         {
            this.mx_internal::videoContainer.removeMediaElement(this.mx_internal::videoPlayer.media);
         }
         var _loc1_:* = null;
         if(this.source is DynamicStreamingVideoSource)
         {
            _loc2_ = this.source as DynamicStreamingVideoSource;
            if(_loc2_.host is String)
            {
               _loc3_ = new DynamicStreamingResource(_loc2_.host as String,_loc2_.streamType);
            }
            else if(_loc2_.host is URL)
            {
               _loc3_ = new DynamicStreamingResource(URL(_loc2_.host).host,_loc2_.streamType);
            }
            if(_loc3_)
            {
               _loc4_ = _loc2_.streamItems.length;
               _loc7_ = new Vector.<DynamicStreamingItem>(_loc4_);
               _loc8_ = 0;
               while(_loc8_ < _loc4_)
               {
                  _loc5_ = _loc2_.streamItems[_loc8_];
                  _loc6_ = new DynamicStreamingItem(_loc5_.streamName,_loc5_.bitrate);
                  _loc7_[_loc8_] = _loc6_;
                  _loc8_++;
               }
               _loc3_.streamItems = _loc7_;
               _loc3_.initialIndex = _loc2_.initialIndex;
               _loc3_.mediaType = MediaType.VIDEO;
               _loc1_ = new VideoElement(_loc3_,new RTMPDynamicStreamingNetLoader());
            }
         }
         else if(this.source is String && this.source != "")
         {
            _loc9_ = new URLResource(this.source as String);
            _loc1_ = this.mx_internal::mediaFactory.createMediaElement(_loc9_);
            if(_loc1_ == null)
            {
               _loc9_.mediaType = MediaType.VIDEO;
               _loc1_ = this.mx_internal::mediaFactory.createMediaElement(_loc9_);
            }
         }
         else if(this.source is MediaResourceBase)
         {
            _loc1_ = this.mx_internal::mediaFactory.createMediaElement(MediaResourceBase(this.source));
         }
         else if(this.source is VideoElement)
         {
            _loc1_ = this.source as VideoElement;
         }
         this.playTheVideoOnVisible = true;
         this.changePlayback(false,false);
         if(_loc1_ && (!this.autoPlay || !this.shouldBePlaying) && this.autoDisplayFirstFrame)
         {
            this.load();
         }
         this.mx_internal::videoPlayer.media = _loc1_;
         if(_loc1_)
         {
            if(!isNaN(this.oldCurrentTimeUpdateInterval))
            {
               this.mx_internal::videoPlayer.currentTimeUpdateInterval = this.oldCurrentTimeUpdateInterval;
               this.mx_internal::videoPlayer.bytesLoadedUpdateInterval = this.oldBytesLoadedUpdateInterval;
            }
            if(_loc1_.getMetadata(LayoutMetadata.LAYOUT_NAMESPACE) == null)
            {
               (_loc10_ = new LayoutMetadata()).scaleMode = this.scaleMode;
               _loc10_.verticalAlign = VerticalAlign.MIDDLE;
               _loc10_.horizontalAlign = HorizontalAlign.CENTER;
               _loc10_.percentWidth = 100;
               _loc10_.percentHeight = 100;
               _loc1_.addMetadata(LayoutMetadata.LAYOUT_NAMESPACE,_loc10_);
            }
            if(Boolean(_loc1_) && !this.mx_internal::videoContainer.containsMediaElement(_loc1_))
            {
               this.mx_internal::videoContainer.addMediaElement(_loc1_);
            }
         }
         else
         {
            invalidateSize();
         }
      }
      
      private function load() : void
      {
         this.inLoadingState1 = true;
         this.mx_internal::videoPlayer.addEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE,this.videoPlayer_mediaPlayerStateChangeHandlerForLoading);
      }
      
      private function get shouldBePlaying() : Boolean
      {
         if(!this.effectiveEnabled)
         {
            return false;
         }
         if(this.pauseWhenHidden)
         {
            if(!this._isOnDisplayList)
            {
               return false;
            }
            if(!this.effectiveVisibility)
            {
               return false;
            }
         }
         return true;
      }
      
      private function changePlayback(param1:Boolean, param2:Boolean) : void
      {
         if(this.shouldBePlaying)
         {
            this.mx_internal::videoPlayer.autoPlay = this.autoPlay;
            if(param2 && (this.playTheVideoOnVisible && this.autoPlay))
            {
               this.playTheVideoOnVisible = false;
               if(this.inLoadingState1)
               {
                  this.cancelLoadAndPlay();
               }
               else if(this.mx_internal::videoPlayer.canPlay)
               {
                  this.mx_internal::videoPlayer.play();
               }
            }
         }
         else
         {
            if(param1 && (this.playing || this.mx_internal::videoPlayer.state == MediaPlayerState.LOADING && this.autoPlay))
            {
               this.playTheVideoOnVisible = true;
            }
            this.mx_internal::videoPlayer.autoPlay = false;
            if(param1)
            {
               if(!this.inLoadingState1 && this.mx_internal::videoPlayer.canPause)
               {
                  this.mx_internal::videoPlayer.pause();
               }
               else if(!this.mx_internal::videoPlayer.canPause && this.autoDisplayFirstFrame)
               {
                  this.load();
               }
            }
         }
      }
      
      private function cancelLoadAndPlay() : void
      {
         if(this.inLoadingState1)
         {
            if(this.inLoadingState2)
            {
               if(!this.inLoadingState3)
               {
                  this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
                  if(this.mx_internal::videoPlayer.displayObject)
                  {
                     this.mx_internal::videoPlayer.displayObject.visible = true;
                  }
                  this.mx_internal::videoPlayer.removeEventListener(TimeEvent.CURRENT_TIME_CHANGE,this.videoPlayer_currentTimeChangeHandler);
                  this.mx_internal::videoPlayer.removeEventListener(MediaPlayerCapabilityChangeEvent.CAN_SEEK_CHANGE,this.videoPlayer_canSeekChangeHandler);
               }
               else
               {
                  this.mx_internal::videoPlayer.removeEventListener(SeekEvent.SEEKING_CHANGE,this.videoPlayer_seekChangeHandler);
                  this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
                  if(this.mx_internal::videoPlayer.displayObject)
                  {
                     this.mx_internal::videoPlayer.displayObject.visible = true;
                  }
                  if(this.mx_internal::videoPlayer.canPlay)
                  {
                     this.mx_internal::videoPlayer.play();
                  }
               }
            }
            this.inLoadingState1 = false;
            this.inLoadingState2 = false;
            this.inLoadingState3 = false;
         }
      }
      
      private function cleanUpSource() : void
      {
         this.mx_internal::videoPlayer.removeEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE,this.videoPlayer_mediaPlayerStateChangeHandlerForLoading);
         if(this.inLoadingState1)
         {
            if(this.inLoadingState2)
            {
               if(!this.inLoadingState3)
               {
                  this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
                  this.mx_internal::videoPlayer.displayObject.visible = true;
                  this.mx_internal::videoPlayer.pause();
               }
               else
               {
                  this.mx_internal::videoPlayer.removeEventListener(SeekEvent.SEEKING_CHANGE,this.videoPlayer_seekChangeHandler);
                  this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
                  this.mx_internal::videoPlayer.displayObject.visible = true;
               }
            }
            this.inLoadingState1 = false;
            this.inLoadingState2 = false;
            this.inLoadingState3 = false;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         this._isOnDisplayList = true;
         if(this.pauseWhenHidden)
         {
            this.addVisibilityListeners();
         }
         this.addEnabledListeners();
         this.computeEffectiveVisibilityAndEnabled();
         if(!isNaN(this.oldCurrentTimeUpdateInterval))
         {
            this.mx_internal::videoPlayer.currentTimeUpdateInterval = this.oldCurrentTimeUpdateInterval;
            this.mx_internal::videoPlayer.bytesLoadedUpdateInterval = this.oldBytesLoadedUpdateInterval;
            this.oldCurrentTimeUpdateInterval = NaN;
            this.oldBytesLoadedUpdateInterval = NaN;
         }
         this.changePlayback(false,this.pauseWhenHidden);
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         this._isOnDisplayList = false;
         if(this.pauseWhenHidden)
         {
            this.removeVisibilityListeners();
         }
         this.removeEnabledListeners();
         if(this.pauseWhenHidden)
         {
            this.oldCurrentTimeUpdateInterval = this.mx_internal::videoPlayer.currentTimeUpdateInterval;
            this.oldBytesLoadedUpdateInterval = this.mx_internal::videoPlayer.bytesLoadedUpdateInterval;
            this.mx_internal::videoPlayer.currentTimeUpdateInterval = -1;
            this.mx_internal::videoPlayer.bytesLoadedUpdateInterval = -1;
         }
         this.changePlayback(this.pauseWhenHidden,false);
      }
      
      private function addVisibilityListeners() : void
      {
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            _loc1_.addEventListener(FlexEvent.HIDE,this.visibilityChangedHandler,false,0,true);
            _loc1_.addEventListener(FlexEvent.SHOW,this.visibilityChangedHandler,false,0,true);
            if(_loc1_.designLayer)
            {
               _loc1_.designLayer.addEventListener("layerPropertyChange",this.designLayer_layerPropertyChangeHandler,false,0,true);
            }
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function addEnabledListeners() : void
      {
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            _loc1_.addEventListener("enabledChanged",this.enabledChangedHandler,false,0,true);
            _loc1_.addEventListener("enabledChanged",this.enabledChangedHandler,false,0,true);
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function removeVisibilityListeners() : void
      {
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            _loc1_.removeEventListener(FlexEvent.HIDE,this.visibilityChangedHandler,false);
            _loc1_.removeEventListener(FlexEvent.SHOW,this.visibilityChangedHandler,false);
            if(_loc1_.designLayer)
            {
               _loc1_.designLayer.removeEventListener("layerPropertyChange",this.designLayer_layerPropertyChangeHandler,false);
            }
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function removeEnabledListeners() : void
      {
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            _loc1_.removeEventListener("enabledChanged",this.enabledChangedHandler,false);
            _loc1_.removeEventListener("enabledChanged",this.enabledChangedHandler,false);
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function visibilityChangedHandler(param1:FlexEvent) : void
      {
         this.effectiveVisibilityChanged = true;
         invalidateProperties();
      }
      
      private function designLayer_layerPropertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "effectiveVisibility")
         {
            this.effectiveVisibilityChanged = true;
            invalidateProperties();
         }
      }
      
      private function enabledChangedHandler(param1:Event) : void
      {
         this.effectiveEnabledChanged = true;
         invalidateProperties();
      }
      
      private function computeEffectiveVisibilityAndEnabled() : void
      {
         this.effectiveVisibility = true;
         this.effectiveEnabled = true;
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            if(!_loc1_.visible || _loc1_.designLayer && !_loc1_.designLayer.effectiveVisibility)
            {
               this.effectiveVisibility = false;
               if(!this.effectiveEnabled)
               {
                  break;
               }
            }
            if(_loc1_ is IUIComponent && !IUIComponent(_loc1_).enabled)
            {
               this.effectiveEnabled = false;
               if(!this.effectiveVisibility)
               {
                  break;
               }
            }
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function videoPlayer_volumeChangeHandler(param1:AudioEvent) : void
      {
         dispatchEvent(new Event("volumeChanged"));
      }
      
      private function videoPlayer_mutedChangeHandler(param1:AudioEvent) : void
      {
         dispatchEvent(new Event("volumeChanged"));
      }
      
      private function videoPlayer_mediaPlayerStateChangeHandler(param1:MediaPlayerStateChangeEvent) : void
      {
         if(param1.state == MediaPlayerState.PLAYBACK_ERROR)
         {
            invalidateSize();
         }
         dispatchEvent(param1);
      }
      
      private function videoPlayer_mediaPlayerStateChangeHandlerForLoading(param1:MediaPlayerStateChangeEvent) : void
      {
         if(param1.state == MediaPlayerState.READY)
         {
            this.mx_internal::videoPlayer.removeEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE,this.videoPlayer_mediaPlayerStateChangeHandlerForLoading);
            if(this.mx_internal::videoPlayer.playing)
            {
               return;
            }
            if(this.inLoadingState1)
            {
               this.beforeLoadMuted = this.mx_internal::videoPlayer.muted;
               this.mx_internal::videoPlayer.muted = true;
               if(this.mx_internal::videoPlayer.displayObject)
               {
                  this.mx_internal::videoPlayer.displayObject.visible = false;
               }
               this.inLoadingState2 = true;
            }
            this.mx_internal::videoPlayer.play();
         }
      }
      
      private function videoPlayer_mediaSizeChangeHandler(param1:DisplayObjectEvent) : void
      {
         invalidateSize();
         if(this.inLoadingState2)
         {
            if(this.mx_internal::videoPlayer.canSeek && this.mx_internal::videoPlayer.canSeekTo(0))
            {
               this.inLoadingState3 = true;
               callLater(this.pauseAndSeekCallBack);
            }
            else if(this.duration < 0)
            {
               this.mx_internal::videoPlayer.addEventListener(TimeEvent.CURRENT_TIME_CHANGE,this.videoPlayer_currentTimeChangeHandler);
            }
            else
            {
               this.mx_internal::videoPlayer.addEventListener(MediaPlayerCapabilityChangeEvent.CAN_SEEK_CHANGE,this.videoPlayer_canSeekChangeHandler);
            }
         }
      }
      
      private function pauseAndSeekCallBack() : void
      {
         this.mx_internal::videoPlayer.addEventListener(SeekEvent.SEEKING_CHANGE,this.videoPlayer_seekChangeHandler);
         this.mx_internal::videoPlayer.pause();
         this.mx_internal::videoPlayer.seek(0);
      }
      
      private function videoPlayer_canSeekChangeHandler(param1:Event) : void
      {
         this.mx_internal::videoPlayer.removeEventListener(MediaPlayerCapabilityChangeEvent.CAN_SEEK_CHANGE,this.videoPlayer_canSeekChangeHandler);
         if(this.inLoadingState2)
         {
            if(this.mx_internal::videoPlayer.canSeek && this.mx_internal::videoPlayer.canSeekTo(0))
            {
               this.inLoadingState3 = true;
               callLater(this.pauseAndSeekCallBack);
            }
         }
      }
      
      private function videoPlayer_seekChangeHandler(param1:SeekEvent) : void
      {
         if(!param1.seeking)
         {
            this.inLoadingState1 = false;
            this.inLoadingState2 = false;
            this.inLoadingState3 = false;
            this.mx_internal::videoPlayer.removeEventListener(SeekEvent.SEEKING_CHANGE,this.videoPlayer_seekChangeHandler);
            this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
            if(this.mx_internal::videoPlayer.displayObject)
            {
               this.mx_internal::videoPlayer.displayObject.visible = true;
            }
            if(!isNaN(this.oldCurrentTimeUpdateInterval))
            {
               this.mx_internal::videoPlayer.currentTimeUpdateInterval = -1;
               this.mx_internal::videoPlayer.bytesLoadedUpdateInterval = -1;
            }
         }
      }
      
      private function videoPlayer_currentTimeChangeHandler(param1:TimeEvent) : void
      {
         this.mx_internal::videoPlayer.removeEventListener(TimeEvent.CURRENT_TIME_CHANGE,this.videoPlayer_currentTimeChangeHandler);
         this.mx_internal::videoPlayer.removeEventListener(MediaPlayerCapabilityChangeEvent.CAN_SEEK_CHANGE,this.videoPlayer_canSeekChangeHandler);
         this.mx_internal::videoPlayer.pause();
         this.mx_internal::videoPlayer.muted = this.beforeLoadMuted;
         if(this.mx_internal::videoPlayer.displayObject)
         {
            this.mx_internal::videoPlayer.displayObject.visible = true;
         }
         this.inLoadingState1 = false;
         this.inLoadingState2 = false;
         this.inLoadingState3 = false;
         if(!isNaN(this.oldCurrentTimeUpdateInterval))
         {
            this.mx_internal::videoPlayer.currentTimeUpdateInterval = -1;
            this.mx_internal::videoPlayer.bytesLoadedUpdateInterval = -1;
         }
      }
      
      private function videoPlayer_durationChangeHandler(param1:TimeEvent) : void
      {
         dispatchEvent(param1);
         if(this.inLoadingState2)
         {
            if(param1.time < 0)
            {
               this.mx_internal::videoPlayer.addEventListener(TimeEvent.CURRENT_TIME_CHANGE,this.videoPlayer_currentTimeChangeHandler);
            }
         }
      }
   }
}
