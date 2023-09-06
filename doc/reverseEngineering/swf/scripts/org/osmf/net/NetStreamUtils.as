package org.osmf.net
{
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.URLResource;
   import org.osmf.metadata.MetadataNamespaces;
   import org.osmf.utils.URL;
   
   public class NetStreamUtils
   {
      
      public static const PLAY_START_ARG_ANY:int = -2;
      
      public static const PLAY_START_ARG_LIVE:int = -1;
      
      public static const PLAY_START_ARG_RECORDED:int = 0;
      
      public static const PLAY_LEN_ARG_ALL:int = -1;
       
      
      public function NetStreamUtils()
      {
         super();
      }
      
      public static function getStreamNameFromURL(param1:String, param2:Boolean = false) : String
      {
         var _loc4_:* = null;
         var _loc3_:String = "";
         if(param1 != null)
         {
            if(isRTMPStream(param1))
            {
               _loc3_ = (_loc4_ = new FMSURL(param1,param2)).streamName;
               if(_loc4_.query != null && _loc4_.query != "")
               {
                  _loc3_ += "?" + _loc4_.query;
               }
            }
            else
            {
               _loc3_ = param1;
            }
         }
         return _loc3_;
      }
      
      public static function isStreamingResource(param1:MediaResourceBase) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:* = false;
         if(param1 != null)
         {
            _loc3_ = param1 as URLResource;
            if(_loc3_ != null)
            {
               _loc2_ = NetStreamUtils.isRTMPStream(_loc3_.url);
               if(_loc2_ == false)
               {
                  _loc2_ = _loc3_.getMetadataValue(MetadataNamespaces.HTTP_STREAMING_METADATA) != null;
               }
            }
         }
         return _loc2_;
      }
      
      public static function isRTMPStream(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = false;
         if(param1 != null)
         {
            _loc3_ = new URL(param1);
            if((_loc4_ = _loc3_.protocol) != null && _loc4_.length > 0)
            {
               _loc2_ = _loc4_.search(/^rtmp$|rtmp[tse]$|rtmpte$/i) != -1;
            }
         }
         return _loc2_;
      }
      
      public static function getStreamType(param1:MediaResourceBase) : String
      {
         var _loc2_:String = "null";
         var _loc3_:StreamingURLResource = param1 as StreamingURLResource;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.streamType;
         }
         return _loc2_;
      }
      
      public static function getPlayArgsForResource(param1:MediaResourceBase) : Object
      {
         var _loc4_:* = null;
         var _loc2_:Number = PLAY_START_ARG_ANY;
         var _loc3_:Number = PLAY_LEN_ARG_ALL;
         switch(getStreamType(param1))
         {
            case StreamType.LIVE_OR_RECORDED:
               _loc2_ = PLAY_START_ARG_ANY;
               break;
            case StreamType.LIVE:
               _loc2_ = PLAY_START_ARG_LIVE;
               break;
            case StreamType.RECORDED:
               _loc2_ = PLAY_START_ARG_RECORDED;
         }
         if(_loc2_ != PLAY_START_ARG_LIVE && param1 != null)
         {
            if((_loc4_ = param1 as StreamingURLResource) != null && isStreamingResource(_loc4_))
            {
               if(!isNaN(_loc4_.clipStartTime))
               {
                  _loc2_ = _loc4_.clipStartTime;
               }
               if(!isNaN(_loc4_.clipEndTime))
               {
                  _loc2_ = Math.max(0,_loc2_);
                  _loc3_ = Math.max(0,_loc4_.clipEndTime - _loc2_);
               }
            }
         }
         return {
            "start":_loc2_,
            "len":_loc3_
         };
      }
   }
}
