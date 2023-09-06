package org.osmf.events
{
   import org.osmf.utils.OSMFStrings;
   
   public final class MediaErrorCodes
   {
      
      public static const IO_ERROR:int = 1;
      
      public static const SECURITY_ERROR:int = 2;
      
      public static const ASYNC_ERROR:int = 3;
      
      public static const ARGUMENT_ERROR:int = 4;
      
      public static const URL_SCHEME_INVALID:int = 5;
      
      public static const HTTP_GET_FAILED:int = 6;
      
      public static const MEDIA_LOAD_FAILED:int = 7;
      
      public static const PLUGIN_VERSION_INVALID:int = 8;
      
      public static const PLUGIN_IMPLEMENTATION_INVALID:int = 9;
      
      public static const SOUND_PLAY_FAILED:int = 10;
      
      public static const NETCONNECTION_REJECTED:int = 11;
      
      public static const NETCONNECTION_APPLICATION_INVALID:int = 12;
      
      public static const NETCONNECTION_FAILED:int = 13;
      
      public static const NETCONNECTION_TIMEOUT:int = 14;
      
      public static const NETSTREAM_PLAY_FAILED:int = 15;
      
      public static const NETSTREAM_STREAM_NOT_FOUND:int = 16;
      
      public static const NETSTREAM_FILE_STRUCTURE_INVALID:int = 17;
      
      public static const NETSTREAM_NO_SUPPORTED_TRACK_FOUND:int = 18;
      
      public static const DRM_SYSTEM_UPDATE_ERROR:int = 19;
      
      public static const DVRCAST_SUBSCRIBE_FAILED:int = 20;
      
      public static const DVRCAST_CONTENT_OFFLINE:int = 21;
      
      public static const DVRCAST_STREAM_INFO_RETRIEVAL_FAILED:int = 22;
      
      private static const errorMap:Array = [{
         "errorID":IO_ERROR,
         "message":OSMFStrings.IO_ERROR
      },{
         "errorID":SECURITY_ERROR,
         "message":OSMFStrings.SECURITY_ERROR
      },{
         "errorID":ASYNC_ERROR,
         "message":OSMFStrings.ASYNC_ERROR
      },{
         "errorID":ARGUMENT_ERROR,
         "message":OSMFStrings.ARGUMENT_ERROR
      },{
         "errorID":URL_SCHEME_INVALID,
         "message":OSMFStrings.URL_SCHEME_INVALID
      },{
         "errorID":HTTP_GET_FAILED,
         "message":OSMFStrings.HTTP_GET_FAILED
      },{
         "errorID":MEDIA_LOAD_FAILED,
         "message":OSMFStrings.MEDIA_LOAD_FAILED
      },{
         "errorID":PLUGIN_VERSION_INVALID,
         "message":OSMFStrings.PLUGIN_VERSION_INVALID
      },{
         "errorID":PLUGIN_IMPLEMENTATION_INVALID,
         "message":OSMFStrings.PLUGIN_IMPLEMENTATION_INVALID
      },{
         "errorID":SOUND_PLAY_FAILED,
         "message":OSMFStrings.SOUND_PLAY_FAILED
      },{
         "errorID":NETCONNECTION_REJECTED,
         "message":OSMFStrings.NETCONNECTION_REJECTED
      },{
         "errorID":NETCONNECTION_APPLICATION_INVALID,
         "message":OSMFStrings.NETCONNECTION_APPLICATION_INVALID
      },{
         "errorID":NETCONNECTION_FAILED,
         "message":OSMFStrings.NETCONNECTION_FAILED
      },{
         "errorID":NETCONNECTION_TIMEOUT,
         "message":OSMFStrings.NETCONNECTION_TIMEOUT
      },{
         "errorID":NETSTREAM_PLAY_FAILED,
         "message":OSMFStrings.NETSTREAM_PLAY_FAILED
      },{
         "errorID":NETSTREAM_STREAM_NOT_FOUND,
         "message":OSMFStrings.NETSTREAM_STREAM_NOT_FOUND
      },{
         "errorID":NETSTREAM_FILE_STRUCTURE_INVALID,
         "message":OSMFStrings.NETSTREAM_FILE_STRUCTURE_INVALID
      },{
         "errorID":NETSTREAM_NO_SUPPORTED_TRACK_FOUND,
         "message":OSMFStrings.NETSTREAM_NO_SUPPORTED_TRACK_FOUND
      },{
         "errorID":DRM_SYSTEM_UPDATE_ERROR,
         "message":OSMFStrings.DRM_SYSTEM_UPDATE_ERROR
      },{
         "errorID":DVRCAST_SUBSCRIBE_FAILED,
         "message":OSMFStrings.DVRCAST_SUBSCRIBE_FAILED
      },{
         "errorID":DVRCAST_CONTENT_OFFLINE,
         "message":OSMFStrings.DVRCAST_CONTENT_OFFLINE
      },{
         "errorID":DVRCAST_STREAM_INFO_RETRIEVAL_FAILED,
         "message":OSMFStrings.DVRCAST_STREAM_INFO_RETRIEVAL_FAILED
      }];
       
      
      public function MediaErrorCodes()
      {
         super();
      }
      
      static function getMessageForErrorID(param1:int) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < errorMap.length)
         {
            if(errorMap[_loc3_].errorID == param1)
            {
               _loc2_ = OSMFStrings.getString(errorMap[_loc3_].message);
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
