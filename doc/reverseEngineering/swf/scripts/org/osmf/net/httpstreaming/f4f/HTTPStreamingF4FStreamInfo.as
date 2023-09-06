package org.osmf.net.httpstreaming.f4f
{
   import flash.utils.ByteArray;
   import org.osmf.elements.f4mClasses.BootstrapInfo;
   
   public class HTTPStreamingF4FStreamInfo
   {
       
      
      private var _streamName:String;
      
      private var _bitrate:Number;
      
      private var _bootstrap:BootstrapInfo;
      
      private var _additionalHeader:ByteArray;
      
      private var _streamMetadata:Object;
      
      private var _xmpMetadata:ByteArray;
      
      public function HTTPStreamingF4FStreamInfo(param1:BootstrapInfo, param2:String, param3:Number, param4:ByteArray, param5:Object, param6:ByteArray)
      {
         super();
         this._streamName = param2;
         this._bitrate = param3;
         this._additionalHeader = param4;
         this._bootstrap = param1;
         this._streamMetadata = param5;
         this._xmpMetadata = param6;
      }
      
      public function get streamName() : String
      {
         return this._streamName;
      }
      
      public function get bitrate() : Number
      {
         return this._bitrate;
      }
      
      public function get additionalHeader() : ByteArray
      {
         return this._additionalHeader;
      }
      
      public function get bootstrapInfo() : BootstrapInfo
      {
         return this._bootstrap;
      }
      
      public function get streamMetadata() : Object
      {
         return this._streamMetadata;
      }
      
      public function get xmpMetadata() : ByteArray
      {
         return this._xmpMetadata;
      }
   }
}
