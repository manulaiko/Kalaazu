package org.osmf.net.httpstreaming.f4f
{
   class AdobeFragmentRandomAccessBox extends FullBox
   {
       
      
      private var _timeScale:uint;
      
      private var _localRandomAccessEntries:Vector.<LocalRandomAccessEntry>;
      
      private var _globalRandomAccessEntries:Vector.<GlobalRandomAccessEntry>;
      
      function AdobeFragmentRandomAccessBox()
      {
         super();
      }
      
      public function get timeScale() : uint
      {
         return this._timeScale;
      }
      
      public function set timeScale(param1:uint) : void
      {
         this._timeScale = param1;
      }
      
      public function get localRandomAccessEntries() : Vector.<LocalRandomAccessEntry>
      {
         return this._localRandomAccessEntries;
      }
      
      public function set localRandomAccessEntries(param1:Vector.<LocalRandomAccessEntry>) : void
      {
         this._localRandomAccessEntries = param1;
      }
      
      public function get globalRandomAccessEntries() : Vector.<GlobalRandomAccessEntry>
      {
         return this._globalRandomAccessEntries;
      }
      
      public function set globalRandomAccessEntries(param1:Vector.<GlobalRandomAccessEntry>) : void
      {
         this._globalRandomAccessEntries = param1;
      }
      
      public function findNearestKeyFrameOffset(param1:Number) : LocalRandomAccessEntry
      {
         var _loc3_:* = null;
         var _loc2_:int = this._localRandomAccessEntries.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this._localRandomAccessEntries[_loc2_];
            if(_loc3_.time <= param1)
            {
               return _loc3_;
            }
            _loc2_--;
         }
         return null;
      }
   }
}
