package org.osmf.net.httpstreaming
{
   class HTTPStreamingState
   {
      
      static const INIT:String = "init";
      
      static const LOAD_SEEK:String = "loadSeek";
      
      static const LOAD_SEEK_RETRY_WAIT:String = "loadSeekRetryWait";
      
      static const LOAD:String = "load";
      
      static const LOAD_WAIT:String = "loadWait";
      
      static const LOAD_NEXT:String = "loadNext";
      
      static const LOAD_NEXT_RETRY_WAIT:String = "loadNextRetryWait";
      
      static const PLAY_START_SEEK:String = "playStartSeek";
      
      static const PLAY_START_NEXT:String = "playStartNext";
      
      static const PLAY_START_COMMON:String = "playStartCommon";
      
      static const PLAY:String = "play";
      
      static const END_SEGMENT:String = "endSegment";
      
      static const SEEK:String = "seek";
      
      static const STOP:String = "stop";
      
      static const HALT:String = "halt";
       
      
      function HTTPStreamingState()
      {
         super();
      }
   }
}
