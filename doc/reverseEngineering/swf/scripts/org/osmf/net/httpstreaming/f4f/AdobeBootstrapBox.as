package org.osmf.net.httpstreaming.f4f
{
   public class AdobeBootstrapBox extends FullBox
   {
       
      
      private var _bootstrapVersion:uint;
      
      private var _profile:uint;
      
      private var _live:Boolean;
      
      private var _update:Boolean;
      
      private var _timeScale:uint;
      
      private var _currentMediaTime:Number;
      
      private var _smpteTimeCodeOffset:Number;
      
      private var _movieIdentifier:String;
      
      private var _serverEntryCount:uint;
      
      private var _serverBaseURLs:Vector.<String>;
      
      private var _qualitySegmentURLModifiers:Vector.<String>;
      
      private var _drmData:String;
      
      private var _metadata:String;
      
      private var _segmentRunTables:Vector.<AdobeSegmentRunTable>;
      
      private var _fragmentRunTables:Vector.<AdobeFragmentRunTable>;
      
      public function AdobeBootstrapBox()
      {
         super();
      }
      
      public function get bootstrapVersion() : uint
      {
         return this._bootstrapVersion;
      }
      
      public function set bootstrapVersion(param1:uint) : void
      {
         this._bootstrapVersion = param1;
      }
      
      public function get profile() : uint
      {
         return this._profile;
      }
      
      public function set profile(param1:uint) : void
      {
         this._profile = param1;
      }
      
      public function get live() : Boolean
      {
         return this._live;
      }
      
      public function set live(param1:Boolean) : void
      {
         this._live = param1;
      }
      
      public function get update() : Boolean
      {
         return this._update;
      }
      
      public function set update(param1:Boolean) : void
      {
         this._update = param1;
      }
      
      public function get timeScale() : uint
      {
         return this._timeScale;
      }
      
      public function set timeScale(param1:uint) : void
      {
         this._timeScale = param1;
      }
      
      public function get currentMediaTime() : Number
      {
         return this._currentMediaTime;
      }
      
      public function set currentMediaTime(param1:Number) : void
      {
         this._currentMediaTime = param1;
      }
      
      public function get smpteTimeCodeOffset() : Number
      {
         return this._smpteTimeCodeOffset;
      }
      
      public function set smpteTimeCodeOffset(param1:Number) : void
      {
         this._smpteTimeCodeOffset = param1;
      }
      
      public function get movieIdentifier() : String
      {
         return this._movieIdentifier;
      }
      
      public function set movieIdentifier(param1:String) : void
      {
         this._movieIdentifier = param1;
      }
      
      public function get serverBaseURLs() : Vector.<String>
      {
         return this._serverBaseURLs;
      }
      
      public function set serverBaseURLs(param1:Vector.<String>) : void
      {
         this._serverBaseURLs = param1;
      }
      
      public function get qualitySegmentURLModifiers() : Vector.<String>
      {
         return this._qualitySegmentURLModifiers;
      }
      
      public function set qualitySegmentURLModifiers(param1:Vector.<String>) : void
      {
         this._qualitySegmentURLModifiers = param1;
      }
      
      public function get drmData() : String
      {
         return this._drmData;
      }
      
      public function set drmData(param1:String) : void
      {
         this._drmData = param1;
      }
      
      public function get metadata() : String
      {
         return this._metadata;
      }
      
      public function set metadata(param1:String) : void
      {
         this._metadata = param1;
      }
      
      public function get segmentRunTables() : Vector.<AdobeSegmentRunTable>
      {
         return this._segmentRunTables;
      }
      
      public function set segmentRunTables(param1:Vector.<AdobeSegmentRunTable>) : void
      {
         this._segmentRunTables = param1;
      }
      
      public function get fragmentRunTables() : Vector.<AdobeFragmentRunTable>
      {
         return this._fragmentRunTables;
      }
      
      public function set fragmentRunTables(param1:Vector.<AdobeFragmentRunTable>) : void
      {
         var _loc2_:* = null;
         this._fragmentRunTables = param1;
         if(param1 != null && param1.length > 0)
         {
            _loc2_ = param1[param1.length - 1];
            _loc2_.adjustEndEntryDurationAccrued(this._currentMediaTime);
         }
      }
      
      public function findSegmentId(param1:uint) : uint
      {
         return this._segmentRunTables[0].findSegmentIdByFragmentId(param1);
      }
      
      public function get totalFragments() : uint
      {
         var _loc1_:AdobeFragmentRunTable = this._fragmentRunTables[this._fragmentRunTables.length - 1];
         var _loc2_:Vector.<FragmentDurationPair> = _loc1_.fragmentDurationPairs;
         var _loc3_:FragmentDurationPair = _loc2_[_loc2_.length - 1];
         if(_loc3_.duration == 0)
         {
            _loc3_ = _loc2_[_loc2_.length - 2];
         }
         var _loc4_:Number;
         var _loc5_:uint = (_loc4_ = this._currentMediaTime - _loc3_.durationAccrued) <= 0 ? 0 : _loc4_ / _loc3_.duration;
         return _loc3_.firstFragment + _loc5_ - 1;
      }
      
      public function get totalDuration() : uint
      {
         if(this._fragmentRunTables == null || this._fragmentRunTables.length < 1)
         {
            return 0;
         }
         var _loc1_:AdobeFragmentRunTable = this._fragmentRunTables[0];
         return this._currentMediaTime - _loc1_.fragmentDurationPairs[0].durationAccrued;
      }
      
      public function contentComplete() : Boolean
      {
         var _loc1_:AdobeFragmentRunTable = this._fragmentRunTables[this._fragmentRunTables.length - 1];
         return _loc1_.tableComplete();
      }
   }
}
