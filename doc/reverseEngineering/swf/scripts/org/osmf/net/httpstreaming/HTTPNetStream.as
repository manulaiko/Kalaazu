package org.osmf.net.httpstreaming
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.NetStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.net.NetStreamAppendBytesAction;
   import flash.net.NetStreamPlayOptions;
   import flash.net.NetStreamPlayTransitions;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.Timer;
   import org.osmf.events.DVRStreamInfoEvent;
   import org.osmf.events.HTTPStreamingFileHandlerEvent;
   import org.osmf.events.HTTPStreamingIndexHandlerEvent;
   import org.osmf.net.NetStreamCodes;
   import org.osmf.net.httpstreaming.dvr.DVRInfo;
   import org.osmf.net.httpstreaming.flv.FLVHeader;
   import org.osmf.net.httpstreaming.flv.FLVParser;
   import org.osmf.net.httpstreaming.flv.FLVTag;
   import org.osmf.net.httpstreaming.flv.FLVTagAudio;
   import org.osmf.net.httpstreaming.flv.FLVTagScriptDataObject;
   import org.osmf.net.httpstreaming.flv.FLVTagVideo;
   
   public class HTTPNetStream extends NetStream
   {
      
      private static const MAIN_TIMER_INTERVAL:int = 25;
       
      
      private var _indexInfo:HTTPStreamingIndexInfoBase = null;
      
      private var _numQualityLevels:int = 0;
      
      private var _qualityRates:Array;
      
      private var _streamNames:Array;
      
      private var _segmentDuration:Number = -1;
      
      private var _urlStreamVideo:URLStream = null;
      
      private var _loadComplete:Boolean = false;
      
      private var mainTimer:Timer;
      
      private var _dataAvailable:Boolean = false;
      
      private var _qualityLevel:int = 0;
      
      private var qualityLevelHasChanged:Boolean = false;
      
      private var _seekTarget:Number = -1;
      
      private var _lastDownloadStartTime:Number = -1;
      
      private var _lastDownloadDuration:Number;
      
      private var _lastDownloadRatio:Number = 0;
      
      private var _manualSwitchMode:Boolean = false;
      
      private var _aggressiveUpswitch:Boolean = true;
      
      private var indexHandler:HTTPStreamingIndexHandlerBase;
      
      private var fileHandler:HTTPStreamingFileHandlerBase;
      
      private var _totalDuration:Number = -1;
      
      private var _enhancedSeekTarget:Number = -1;
      
      private var _enhancedSeekEnabled:Boolean = false;
      
      private var _enhancedSeekTags:Vector.<FLVTagVideo>;
      
      private var _flvParserIsSegmentStart:Boolean = false;
      
      private var _savedBytes:ByteArray = null;
      
      private var _state:String = "init";
      
      private var _prevState:String = null;
      
      private var _seekAfterInit:Boolean;
      
      private var indexIsReady:Boolean = false;
      
      private var _insertScriptDataTags:Vector.<FLVTagScriptDataObject> = null;
      
      private var _flvParser:FLVParser = null;
      
      private var _flvParserDone:Boolean = true;
      
      private var _flvParserProcessed:uint;
      
      private var _initialTime:Number = -1;
      
      private var _seekTime:Number = -1;
      
      private var _fileTimeAdjustment:Number = 0;
      
      private var _playForDuration:Number = -1;
      
      private var _lastValidTimeTime:Number = 0;
      
      private var _retryAfterWaitUntil:Number = 0;
      
      private var _dvrInfo:DVRInfo = null;
      
      private var _unpublishNotifyPending:Boolean = false;
      
      public function HTTPNetStream(param1:NetConnection, param2:HTTPStreamingIndexHandlerBase, param3:HTTPStreamingFileHandlerBase)
      {
         super(param1);
         this._savedBytes = new ByteArray();
         this.indexHandler = param2;
         this.fileHandler = param3;
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.NOTIFY_INDEX_READY,this.onIndexReady);
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.NOTIFY_RATES,this.onRates);
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.REQUEST_LOAD_INDEX,this.onRequestLoadIndexFile);
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.NOTIFY_ERROR,this.onIndexError);
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.NOTIFY_SEGMENT_DURATION,this.onSegmentDurationFromIndexHandler);
         param2.addEventListener(HTTPStreamingIndexHandlerEvent.NOTIFY_SCRIPT_DATA,this.onScriptDataFromIndexHandler);
         param2.addEventListener(DVRStreamInfoEvent.DVRSTREAMINFO,this.onDVRStreamInfo);
         param3.addEventListener(HTTPStreamingFileHandlerEvent.NOTIFY_SEGMENT_DURATION,this.onSegmentDurationFromFileHandler);
         param3.addEventListener(HTTPStreamingFileHandlerEvent.NOTIFY_SCRIPT_DATA,this.onScriptDataFromFileHandler);
         param3.addEventListener(HTTPStreamingFileHandlerEvent.NOTIFY_ERROR,this.onErrorFromFileHandler);
         this.mainTimer = new Timer(MAIN_TIMER_INTERVAL);
         this.mainTimer.addEventListener(TimerEvent.TIMER,this.onMainTimer);
         this.mainTimer.start();
         this.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
      }
      
      public function set enhancedSeek(param1:Boolean) : void
      {
         this._enhancedSeekEnabled = param1;
      }
      
      public function get enhancedSeek() : Boolean
      {
         return this._enhancedSeekEnabled;
      }
      
      public function get downloadRatio() : Number
      {
         return this._lastDownloadRatio;
      }
      
      public function set qualityLevel(param1:int) : void
      {
         if(this._manualSwitchMode)
         {
            this.setQualityLevel(param1);
            return;
         }
         throw new Error("qualityLevel cannot be set to this value at this time");
      }
      
      public function get qualityLevel() : int
      {
         return this._qualityLevel;
      }
      
      public function get manualSwitchMode() : Boolean
      {
         return this._manualSwitchMode;
      }
      
      public function set manualSwitchMode(param1:Boolean) : void
      {
         this._manualSwitchMode = param1;
      }
      
      public function get indexInfo() : HTTPStreamingIndexInfoBase
      {
         return this._indexInfo;
      }
      
      public function set indexInfo(param1:HTTPStreamingIndexInfoBase) : void
      {
         this._indexInfo = param1;
      }
      
      public function DVRGetStreamInfo(param1:Object) : void
      {
         if(!this.indexIsReady)
         {
            this.indexHandler.dvrGetStreamInfo(this._indexInfo != null ? this._indexInfo : param1);
         }
      }
      
      override public function play(... rest) : void
      {
         if(rest.length < 1)
         {
            throw new Error("HTTPStream.play() requires at least one argument");
         }
         super.play(null);
         dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
            "code":NetStreamCodes.NETSTREAM_PLAY_START,
            "level":"status"
         }));
         var _loc2_:FLVHeader = new FLVHeader();
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.write(_loc3_);
         this.attemptAppendBytes(_loc3_);
         this.setState(HTTPStreamingState.INIT);
         this._initialTime = -1;
         this._seekTime = -1;
         this.indexIsReady = false;
         this.indexHandler.initialize(this._indexInfo != null ? this._indexInfo : rest[0]);
         if(rest.length >= 2)
         {
            this._seekTarget = Number(rest[1]);
            if(this._seekTarget < 0)
            {
               if(this._dvrInfo != null)
               {
                  this._seekTarget = this._dvrInfo.startTime;
               }
               else
               {
                  this._seekTarget = 0;
               }
            }
         }
         else
         {
            this._seekTarget = 0;
         }
         if(rest.length >= 3)
         {
            this._playForDuration = Number(rest[2]);
         }
         else
         {
            this._playForDuration = -1;
         }
         this._unpublishNotifyPending = false;
      }
      
      override public function play2(param1:NetStreamPlayOptions) : void
      {
         if(param1.transition == NetStreamPlayTransitions.RESET)
         {
            this.setQualityLevelForStreamName(param1.streamName);
            this.play(param1.streamName,param1.start,param1.len);
         }
         else if(param1.transition == NetStreamPlayTransitions.SWITCH)
         {
            this.setQualityLevelForStreamName(param1.streamName);
         }
         else
         {
            super.play2(param1);
         }
      }
      
      override public function seek(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._state != HTTPStreamingState.INIT)
         {
            if(this._initialTime < 0)
            {
               this._seekTarget = param1 + 0;
            }
            else
            {
               this._seekTarget = param1 + this._initialTime;
            }
            this._seekTime = -1;
            this.setState(HTTPStreamingState.SEEK);
            super.seek(param1);
         }
         this._unpublishNotifyPending = false;
      }
      
      override public function close() : void
      {
         this.indexIsReady = false;
         switch(this._state)
         {
            case HTTPStreamingState.PLAY:
            case HTTPStreamingState.PLAY_START_NEXT:
            case HTTPStreamingState.PLAY_START_SEEK:
               this._urlStreamVideo.close();
         }
         this.setState(HTTPStreamingState.HALT);
         this.mainTimer.stop();
         dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
            "code":NetStreamCodes.NETSTREAM_PLAY_STOP,
            "level":"status"
         }));
         super.close();
      }
      
      override public function get time() : Number
      {
         if(this._seekTime >= 0 && this._initialTime >= 0)
         {
            this._lastValidTimeTime = super.time + this._seekTime - this._initialTime;
         }
         return this._lastValidTimeTime;
      }
      
      private function setState(param1:String) : void
      {
         this._prevState = this._state;
         this._state = param1;
      }
      
      private function insertScriptDataTag(param1:FLVTagScriptDataObject, param2:Boolean = false) : void
      {
         if(!this._insertScriptDataTags)
         {
            this._insertScriptDataTags = new Vector.<FLVTagScriptDataObject>();
         }
         if(param2)
         {
            this._insertScriptDataTags.unshift(param1);
         }
         else
         {
            this._insertScriptDataTags.push(param1);
         }
      }
      
      private function flvTagHandler(param1:FLVTag) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(this._insertScriptDataTags)
         {
            _loc2_ = 0;
            while(_loc2_ < this._insertScriptDataTags.length)
            {
               _loc3_ = this._insertScriptDataTags[_loc2_];
               _loc3_.timestamp = param1.timestamp;
               _loc4_ = new ByteArray();
               _loc3_.write(_loc4_);
               this._flvParserProcessed += _loc4_.length;
               this.attemptAppendBytes(_loc4_);
               _loc2_++;
            }
            this._insertScriptDataTags = null;
         }
         if(this._playForDuration >= 0)
         {
            if(this._initialTime >= 0)
            {
               if((_loc5_ = param1.timestamp / 1000 + this._fileTimeAdjustment) > this._initialTime + this._playForDuration)
               {
                  this.setState(HTTPStreamingState.STOP);
                  this._flvParserDone = true;
                  if(this._seekTime < 0)
                  {
                     this._seekTime = this._playForDuration + this._initialTime;
                  }
                  return false;
               }
            }
         }
         if(this._enhancedSeekTarget < 0)
         {
            if(this._initialTime < 0)
            {
               this._initialTime = param1.timestamp / 1000 + this._fileTimeAdjustment;
            }
            if(this._seekTime < 0)
            {
               this._seekTime = param1.timestamp / 1000 + this._fileTimeAdjustment;
            }
            _loc4_ = new ByteArray();
            param1.write(_loc4_);
            this._flvParserProcessed += _loc4_.length;
            this.attemptAppendBytes(_loc4_);
            if(this._playForDuration >= 0)
            {
               if(this._segmentDuration >= 0 && this._flvParserIsSegmentStart)
               {
                  this._flvParserIsSegmentStart = false;
                  if((_loc5_ = param1.timestamp / 1000 + this._fileTimeAdjustment) + this._segmentDuration >= this._initialTime + this._playForDuration)
                  {
                     return true;
                  }
                  this._flvParserDone = true;
                  return false;
               }
               return true;
            }
            this._flvParserDone = true;
            return false;
         }
         if(param1 is FLVTagVideo)
         {
            if(this._flvParserIsSegmentStart)
            {
               (_loc6_ = new FLVTagVideo()).timestamp = param1.timestamp;
               _loc6_.codecID = FLVTagVideo(param1).codecID;
               _loc6_.frameType = FLVTagVideo.FRAME_TYPE_INFO;
               _loc6_.infoPacketValue = FLVTagVideo.INFO_PACKET_SEEK_START;
               this._enhancedSeekTags = new Vector.<FLVTagVideo>();
               this._enhancedSeekTags.push(_loc6_);
               this._flvParserIsSegmentStart = false;
            }
            if(param1.timestamp / 1000 + this._fileTimeAdjustment >= this._enhancedSeekTarget)
            {
               this._enhancedSeekTarget = -1;
               this._seekTime = param1.timestamp / 1000 + this._fileTimeAdjustment;
               if(this._initialTime < 0)
               {
                  this._initialTime = this._seekTime;
               }
               (_loc7_ = new FLVTagVideo()).timestamp = param1.timestamp;
               _loc7_.codecID = this._enhancedSeekTags[0].codecID;
               _loc7_.frameType = FLVTagVideo.FRAME_TYPE_INFO;
               _loc7_.infoPacketValue = FLVTagVideo.INFO_PACKET_SEEK_END;
               this._enhancedSeekTags.push(_loc7_);
               _loc2_ = 0;
               while(_loc2_ < this._enhancedSeekTags.length)
               {
                  if((_loc8_ = this._enhancedSeekTags[_loc2_]).codecID == FLVTagVideo.CODEC_ID_AVC && _loc8_.avcPacketType == FLVTagVideo.AVC_PACKET_TYPE_NALU)
                  {
                     _loc9_ = param1.timestamp - _loc8_.timestamp;
                     _loc10_ = _loc8_.avcCompositionTimeOffset;
                     _loc10_ = (_loc10_ = _loc8_.avcCompositionTimeOffset) - _loc9_;
                     _loc8_.avcCompositionTimeOffset = _loc10_;
                     _loc8_.timestamp = param1.timestamp;
                  }
                  else
                  {
                     _loc8_.timestamp = param1.timestamp;
                  }
                  _loc4_ = new ByteArray();
                  _loc8_.write(_loc4_);
                  this._flvParserProcessed += _loc4_.length;
                  this.attemptAppendBytes(_loc4_);
                  _loc2_++;
               }
               this._enhancedSeekTags = null;
               _loc4_ = new ByteArray();
               param1.write(_loc4_);
               this._flvParserProcessed += _loc4_.length;
               this.attemptAppendBytes(_loc4_);
               if(this._playForDuration >= 0)
               {
                  return true;
               }
               this._flvParserDone = true;
               return false;
            }
            this._enhancedSeekTags.push(param1);
         }
         else if(param1 is FLVTagScriptDataObject)
         {
            _loc4_ = new ByteArray();
            param1.write(_loc4_);
            this._flvParserProcessed += _loc4_.length;
            this.attemptAppendBytes(_loc4_);
         }
         else if(param1 is FLVTagAudio)
         {
            if((_loc11_ = param1 as FLVTagAudio).isCodecConfiguration)
            {
               _loc4_ = new ByteArray();
               param1.write(_loc4_);
               this._flvParserProcessed += _loc4_.length;
               this.attemptAppendBytes(_loc4_);
            }
         }
         return true;
      }
      
      private function autoAdjustQuality(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(!this._manualSwitchMode)
         {
            if(param1)
            {
               this.setQualityLevel(0);
               return;
            }
            if(this._lastDownloadRatio < 1)
            {
               if(this.qualityLevel > 0)
               {
                  _loc2_ = this.qualityLevel - 1;
                  _loc3_ = Number(this._qualityRates[_loc2_]) / Number(this._qualityRates[this.qualityLevel]);
                  if(this._lastDownloadRatio < _loc3_)
                  {
                     this.setQualityLevel(0);
                  }
                  else
                  {
                     this.setQualityLevel(_loc2_);
                  }
               }
            }
            else if(this.qualityLevel < this._numQualityLevels - 1)
            {
               _loc2_ = this.qualityLevel + 1;
               _loc3_ = Number(this._qualityRates[_loc2_]) / Number(this._qualityRates[this.qualityLevel]);
               if(this._lastDownloadRatio >= _loc3_)
               {
                  if(!(this._lastDownloadRatio > 100 || !this._aggressiveUpswitch))
                  {
                     while(++_loc2_ < this._numQualityLevels)
                     {
                        _loc3_ = Number(this._qualityRates[_loc2_]) / Number(this._qualityRates[this.qualityLevel]);
                        if(this._lastDownloadRatio < _loc3_)
                        {
                           break;
                        }
                     }
                     _loc2_--;
                  }
                  this.setQualityLevel(_loc2_);
               }
            }
         }
      }
      
      private function byteSource(param1:IDataInput, param2:Number) : IDataInput
      {
         var _loc3_:int = 0;
         if(param2 < 0)
         {
            return null;
         }
         if(param2)
         {
            if(this._savedBytes.bytesAvailable + param1.bytesAvailable < param2)
            {
               return null;
            }
         }
         else if(this._savedBytes.bytesAvailable + param1.bytesAvailable < 1)
         {
            return null;
         }
         if(this._savedBytes.bytesAvailable)
         {
            _loc3_ = param2 - this._savedBytes.bytesAvailable;
            if(_loc3_ > 0)
            {
               param1.readBytes(this._savedBytes,this._savedBytes.length,_loc3_);
            }
            return this._savedBytes;
         }
         this._savedBytes.length = 0;
         return param1;
      }
      
      private function processAndAppend(param1:ByteArray) : uint
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(!param1)
         {
            return 0;
         }
         if(this._flvParser)
         {
            param1.position = 0;
            this._flvParserProcessed = 0;
            this._flvParser.parse(param1,true,this.flvTagHandler);
            _loc3_ += this._flvParserProcessed;
            if(!this._flvParserDone)
            {
               return _loc3_;
            }
            _loc2_ = new ByteArray();
            this._flvParser.flush(_loc2_);
            this._flvParser = null;
         }
         else
         {
            _loc2_ = param1;
         }
         _loc3_ += _loc2_.length;
         if(this._state != HTTPStreamingState.STOP)
         {
            this.attemptAppendBytes(_loc2_);
         }
         return _loc3_;
      }
      
      private function onMainTimer(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         loop1:
         switch(this._state)
         {
            case HTTPStreamingState.INIT:
               this._seekAfterInit = true;
               break;
            case HTTPStreamingState.SEEK:
               switch(this._prevState)
               {
                  case HTTPStreamingState.PLAY:
                  case HTTPStreamingState.PLAY_START_NEXT:
                  case HTTPStreamingState.PLAY_START_SEEK:
                     this._urlStreamVideo.close();
               }
               this._dataAvailable = false;
               this._savedBytes.length = 0;
               if(this._enhancedSeekEnabled)
               {
                  this._enhancedSeekTarget = this._seekTarget;
               }
               this.setState(HTTPStreamingState.LOAD_SEEK);
               break;
            case HTTPStreamingState.LOAD_WAIT:
               if(this._lastDownloadRatio < 2)
               {
                  if(this.bufferLength < Math.max(7.5,this.bufferTime))
                  {
                     this.setState(HTTPStreamingState.LOAD_NEXT);
                     break;
                  }
                  break;
               }
               if(this.bufferLength < Math.max(3.75,this.bufferTime))
               {
                  this.setState(HTTPStreamingState.LOAD_NEXT);
                  break;
               }
               break;
            case HTTPStreamingState.LOAD_NEXT:
               this.autoAdjustQuality(false);
               if(this.qualityLevelHasChanged)
               {
                  _loc2_ = this.fileHandler.flushFileSegment(!!this._savedBytes.bytesAvailable ? this._savedBytes : null);
                  this.processAndAppend(_loc2_);
                  (_loc9_ = new Object()).code = NetStreamCodes.NETSTREAM_PLAY_TRANSITION_COMPLETE;
                  _loc9_.level = "status";
                  (_loc10_ = new FLVTagScriptDataObject()).objects = ["onPlayStatus",_loc9_];
                  this.insertScriptDataTag(_loc10_);
                  this.qualityLevelHasChanged = false;
               }
               this.setState(HTTPStreamingState.LOAD);
               break;
            case HTTPStreamingState.LOAD_SEEK:
               if(!this._seekAfterInit)
               {
                  _loc2_ = this.fileHandler.flushFileSegment(!!this._savedBytes.bytesAvailable ? this._savedBytes : null);
               }
               appendBytesAction(NetStreamAppendBytesAction.RESET_SEEK);
               if(!this._seekAfterInit)
               {
                  this.autoAdjustQuality(true);
               }
               this._seekAfterInit = false;
               this.setState(HTTPStreamingState.LOAD);
               break;
            case HTTPStreamingState.LOAD:
               this._segmentDuration = -1;
               switch(this._prevState)
               {
                  case HTTPStreamingState.LOAD_SEEK:
                  case HTTPStreamingState.LOAD_SEEK_RETRY_WAIT:
                     _loc3_ = this.indexHandler.getFileForTime(this._seekTarget,this.qualityLevel);
                     break;
                  case HTTPStreamingState.LOAD_NEXT:
                  case HTTPStreamingState.LOAD_NEXT_RETRY_WAIT:
                     _loc3_ = this.indexHandler.getNextFile(this.qualityLevel);
                     break;
                  default:
                     throw new Error("in HTTPStreamState.LOAD with unknown _prevState " + this._prevState);
               }
               if(_loc3_ != null && _loc3_.urlRequest != null)
               {
                  this._loadComplete = false;
                  this._urlStreamVideo.load(_loc3_.urlRequest);
                  _loc4_ = new Date();
                  this._lastDownloadStartTime = _loc4_.getTime();
                  switch(this._prevState)
                  {
                     case HTTPStreamingState.LOAD_SEEK:
                     case HTTPStreamingState.LOAD_SEEK_RETRY_WAIT:
                        this.setState(HTTPStreamingState.PLAY_START_SEEK);
                        break loop1;
                     case HTTPStreamingState.LOAD_NEXT:
                     case HTTPStreamingState.LOAD_NEXT_RETRY_WAIT:
                        this.setState(HTTPStreamingState.PLAY_START_NEXT);
                        break loop1;
                     default:
                        throw new Error("in HTTPStreamState.LOAD(2) with unknown _prevState " + this._prevState);
                  }
               }
               else
               {
                  if(!(_loc3_ != null && _loc3_.retryAfter >= 0))
                  {
                     _loc2_ = this.fileHandler.flushFileSegment(!!this._savedBytes.bytesAvailable ? this._savedBytes : null);
                     this.processAndAppend(_loc2_);
                     this.setState(HTTPStreamingState.STOP);
                     if(_loc3_ != null && _loc3_.unpublishNotify)
                     {
                        this._unpublishNotifyPending = true;
                        break;
                     }
                     break;
                  }
                  _loc4_ = new Date();
                  this._retryAfterWaitUntil = _loc4_.getTime() + 1000 * _loc3_.retryAfter;
                  switch(this._prevState)
                  {
                     case HTTPStreamingState.LOAD_SEEK:
                     case HTTPStreamingState.LOAD_SEEK_RETRY_WAIT:
                        this.setState(HTTPStreamingState.LOAD_SEEK_RETRY_WAIT);
                        break loop1;
                     case HTTPStreamingState.LOAD_NEXT:
                     case HTTPStreamingState.LOAD_NEXT_RETRY_WAIT:
                        this.setState(HTTPStreamingState.LOAD_NEXT_RETRY_WAIT);
                        break loop1;
                     default:
                        throw new Error("in HTTPStreamState.LOAD(3) with unknown _prevState " + this._prevState);
                  }
               }
               break;
            case HTTPStreamingState.LOAD_SEEK_RETRY_WAIT:
            case HTTPStreamingState.LOAD_NEXT_RETRY_WAIT:
               if((_loc4_ = new Date()).getTime() > this._retryAfterWaitUntil)
               {
                  this.setState(HTTPStreamingState.LOAD);
                  break;
               }
               break;
            case HTTPStreamingState.PLAY_START_NEXT:
               this.fileHandler.beginProcessFile(false,0);
               this.setState(HTTPStreamingState.PLAY_START_COMMON);
               break;
            case HTTPStreamingState.PLAY_START_SEEK:
               this.fileHandler.beginProcessFile(true,this._seekTarget);
               this.setState(HTTPStreamingState.PLAY_START_COMMON);
               break;
            case HTTPStreamingState.PLAY_START_COMMON:
               if(this._initialTime < 0 || this._seekTime < 0 || this._insertScriptDataTags || this._enhancedSeekTarget >= 0 || this._playForDuration >= 0)
               {
                  if(this._enhancedSeekTarget >= 0 || this._playForDuration >= 0)
                  {
                     this._flvParserIsSegmentStart = true;
                  }
                  this._flvParser = new FLVParser(false);
                  this._flvParserDone = false;
               }
               this.setState(HTTPStreamingState.PLAY);
               break;
            case HTTPStreamingState.PLAY:
               _loc5_ = false;
               if(this._dataAvailable)
               {
                  _loc11_ = 260000;
                  _loc12_ = 0;
                  if(this._enhancedSeekTarget >= 0)
                  {
                     _loc11_ = 0;
                  }
                  _loc13_ = null;
                  this._dataAvailable = false;
                  while(this._state == HTTPStreamingState.PLAY && (Boolean(_loc13_ = this.byteSource(this._urlStreamVideo,this.fileHandler.inputBytesNeeded))))
                  {
                     _loc2_ = this.fileHandler.processFileSegment(_loc13_);
                     _loc12_ += this.processAndAppend(_loc2_);
                     if(_loc11_ > 0 && _loc12_ >= _loc11_)
                     {
                        this._dataAvailable = true;
                        break;
                     }
                  }
                  if(this._state != HTTPStreamingState.PLAY)
                  {
                     break;
                  }
                  if(this._loadComplete && !_loc13_)
                  {
                     _loc5_ = true;
                  }
               }
               else if(this._loadComplete)
               {
                  _loc5_ = true;
               }
               if(_loc5_)
               {
                  if(this._urlStreamVideo.bytesAvailable)
                  {
                     this._urlStreamVideo.readBytes(this._savedBytes);
                  }
                  else
                  {
                     this._savedBytes.length = 0;
                  }
                  this.setState(HTTPStreamingState.END_SEGMENT);
                  break;
               }
               break;
            case HTTPStreamingState.END_SEGMENT:
               _loc2_ = this.fileHandler.endProcessFile(!!this._savedBytes.bytesAvailable ? this._savedBytes : null);
               this.processAndAppend(_loc2_);
               this._lastDownloadRatio = this._segmentDuration / this._lastDownloadDuration;
               if(this._state != HTTPStreamingState.STOP && this._state != HTTPStreamingState.HALT)
               {
                  this.setState(HTTPStreamingState.LOAD_WAIT);
                  break;
               }
               break;
            case HTTPStreamingState.STOP:
               (_loc6_ = new Object()).code = NetStreamCodes.NETSTREAM_PLAY_COMPLETE;
               _loc6_.level = "status";
               (_loc7_ = new FLVTagScriptDataObject()).objects = ["onPlayStatus",_loc6_];
               _loc8_ = new ByteArray();
               _loc7_.write(_loc8_);
               appendBytesAction(NetStreamAppendBytesAction.END_SEQUENCE);
               appendBytesAction(NetStreamAppendBytesAction.RESET_SEEK);
               this.attemptAppendBytes(_loc8_);
               this.setState(HTTPStreamingState.HALT);
               break;
            case HTTPStreamingState.HALT:
               break;
            default:
               throw new Error("HTTPStream cannot run undefined _state " + this._state);
         }
      }
      
      private function onURLStatus(param1:ProgressEvent) : void
      {
         this._dataAvailable = true;
      }
      
      private function onURLComplete(param1:Event) : void
      {
         var _loc2_:Date = new Date();
         this._lastDownloadDuration = (_loc2_.getTime() - this._lastDownloadStartTime) / 1000;
         this._loadComplete = true;
      }
      
      private function onRequestLoadIndexFile(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         var urlLoader:URLLoader = null;
         var requestContext:Object = null;
         var onIndexLoadComplete:Function = null;
         var onIndexURLError:Function = null;
         var var_6:HTTPStreamingIndexHandlerEvent = param1;
         onIndexLoadComplete = function(param1:Event):void
         {
            urlLoader.removeEventListener(Event.COMPLETE,onIndexLoadComplete);
            urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onIndexURLError);
            urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onIndexURLError);
            indexHandler.processIndexData(urlLoader.data,requestContext);
         };
         onIndexURLError = function(param1:Event):void
         {
            urlLoader.removeEventListener(Event.COMPLETE,onIndexLoadComplete);
            urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onIndexURLError);
            urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onIndexURLError);
            handleURLError();
         };
         urlLoader = new URLLoader(var_6.request);
         requestContext = var_6.requestContext;
         if(var_6.binaryData)
         {
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         }
         else
         {
            urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
         }
         urlLoader.addEventListener(Event.COMPLETE,onIndexLoadComplete);
         urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onIndexURLError);
         urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onIndexURLError);
      }
      
      private function onSegmentDurationFromFileHandler(param1:HTTPStreamingFileHandlerEvent) : void
      {
         this._segmentDuration = param1.segmentDuration;
      }
      
      private function onSegmentDurationFromIndexHandler(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         this._segmentDuration = param1.segmentDuration;
      }
      
      private function onRates(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         this._qualityRates = param1.rates;
         this._streamNames = param1.streamNames;
         this._numQualityLevels = this._qualityRates.length;
      }
      
      private function onIndexReady(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         if(!this.indexIsReady)
         {
            if(param1.live && this._dvrInfo == null && !isNaN(param1.offset))
            {
               this._seekTarget = param1.offset;
            }
            this._urlStreamVideo = new URLStream();
            this._urlStreamVideo.addEventListener(ProgressEvent.PROGRESS,this.onURLStatus,false,0,true);
            this._urlStreamVideo.addEventListener(Event.COMPLETE,this.onURLComplete,false,0,true);
            this._urlStreamVideo.addEventListener(IOErrorEvent.IO_ERROR,this.onVideoURLError,false,0,true);
            this._urlStreamVideo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onVideoURLError,false,0,true);
            this.setState(HTTPStreamingState.SEEK);
            this.indexIsReady = true;
         }
      }
      
      private function onVideoURLError(param1:Event) : void
      {
         this.handleURLError();
      }
      
      private function handleURLError() : void
      {
         dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
            "code":NetStreamCodes.NETSTREAM_PLAY_STREAMNOTFOUND,
            "level":"error"
         }));
      }
      
      private function onScriptDataFromIndexHandler(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         this.onScriptData(param1.scriptDataObject,param1.scriptDataFirst,param1.scriptDataImmediate);
      }
      
      private function onScriptDataFromFileHandler(param1:HTTPStreamingFileHandlerEvent) : void
      {
         this.onScriptData(param1.scriptDataObject,param1.scriptDataFirst,param1.scriptDataImmediate);
      }
      
      private function onErrorFromFileHandler(param1:HTTPStreamingFileHandlerEvent) : void
      {
         this.setState(HTTPStreamingState.HALT);
         dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
            "code":NetStreamCodes.NETSTREAM_PLAY_FILESTRUCTUREINVALID,
            "level":"error"
         }));
      }
      
      private function onScriptData(param1:FLVTagScriptDataObject, param2:Boolean, param3:Boolean) : void
      {
         if(param3)
         {
            if(client)
            {
               if(client.hasOwnProperty(param1.objects[0]))
               {
                  client[param1.objects[0]](param1.objects[1]);
               }
            }
         }
         else
         {
            this.insertScriptDataTag(param1,param2);
         }
      }
      
      private function onDVRStreamInfo(param1:DVRStreamInfoEvent) : void
      {
         this._dvrInfo = param1.info as DVRInfo;
         dispatchEvent(param1.clone());
      }
      
      private function onIndexError(param1:HTTPStreamingIndexHandlerEvent) : void
      {
         dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
            "code":NetStreamCodes.NETSTREAM_PLAY_STREAMNOTFOUND,
            "level":"error"
         }));
      }
      
      private function setQualityLevel(param1:int) : void
      {
         if(param1 >= 0 && param1 < this._numQualityLevels)
         {
            if(param1 != this._qualityLevel)
            {
               this._qualityLevel = param1;
               this.qualityLevelHasChanged = true;
               dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
                  "code":NetStreamCodes.NETSTREAM_PLAY_TRANSITION,
                  "level":"status",
                  "details":this._streamNames[param1]
               }));
            }
            return;
         }
         throw new Error("qualityLevel cannot be set to this value at this time");
      }
      
      private function setQualityLevelForStreamName(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = -1;
         if(this._streamNames != null)
         {
            _loc3_ = 0;
            while(_loc3_ < this._streamNames.length)
            {
               if(param1 == this._streamNames[_loc3_])
               {
                  _loc2_ = _loc3_;
                  break;
               }
               _loc3_++;
            }
         }
         if(_loc2_ != -1)
         {
            this.setQualityLevel(_loc2_);
         }
      }
      
      private function attemptAppendBytes(param1:ByteArray) : void
      {
         super.appendBytes(param1);
      }
      
      private function onNetStatus(param1:NetStatusEvent) : void
      {
         if(param1.info.code == NetStreamCodes.NETSTREAM_BUFFER_EMPTY && this._state == HTTPStreamingState.HALT)
         {
            this.finishStopProcess();
         }
      }
      
      private function finishStopProcess() : void
      {
         if(this._unpublishNotifyPending)
         {
            dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS,false,false,{
               "code":NetStreamCodes.NETSTREAM_PLAY_UNPUBLISH_NOTIFY,
               "level":"status"
            }));
            this._unpublishNotifyPending = false;
         }
      }
   }
}
