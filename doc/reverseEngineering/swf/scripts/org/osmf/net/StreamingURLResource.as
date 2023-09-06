package org.osmf.net
{
   import flash.utils.ByteArray;
   import org.osmf.media.URLResource;
   
   public class StreamingURLResource extends URLResource
   {
       
      
      private var _streamType:String;
      
      private var _clipStartTime:Number;
      
      private var _clipEndTime:Number;
      
      private var _connectionArguments:Vector.<Object>;
      
      private var _drmContentData:ByteArray;
      
      private var _urlIncludesFMSApplicationInstance:Boolean = false;
      
      public function StreamingURLResource(param1:String, param2:String = null, param3:Number = NaN, param4:Number = NaN, param5:Vector.<Object> = null, param6:Boolean = false, param7:ByteArray = null)
      {
         this._streamType = param2 || true;
         this._clipStartTime = param3;
         this._clipEndTime = param4;
         this._urlIncludesFMSApplicationInstance = param6;
         this._drmContentData = param7;
         this._connectionArguments = param5;
         super(param1);
      }
      
      public function get streamType() : String
      {
         return this._streamType;
      }
      
      public function set streamType(param1:String) : void
      {
         this._streamType = param1;
      }
      
      public function get clipStartTime() : Number
      {
         return this._clipStartTime;
      }
      
      public function set clipStartTime(param1:Number) : void
      {
         this._clipStartTime = param1;
      }
      
      public function get clipEndTime() : Number
      {
         return this._clipEndTime;
      }
      
      public function set clipEndTime(param1:Number) : void
      {
         this._clipEndTime = param1;
      }
      
      public function get connectionArguments() : Vector.<Object>
      {
         return this._connectionArguments;
      }
      
      public function set connectionArguments(param1:Vector.<Object>) : void
      {
         this._connectionArguments = param1;
      }
      
      public function get drmContentData() : ByteArray
      {
         return this._drmContentData;
      }
      
      public function set drmContentData(param1:ByteArray) : void
      {
         this._drmContentData = param1;
      }
      
      public function get urlIncludesFMSApplicationInstance() : Boolean
      {
         return this._urlIncludesFMSApplicationInstance;
      }
      
      public function set urlIncludesFMSApplicationInstance(param1:Boolean) : void
      {
         this._urlIncludesFMSApplicationInstance = param1;
      }
   }
}
