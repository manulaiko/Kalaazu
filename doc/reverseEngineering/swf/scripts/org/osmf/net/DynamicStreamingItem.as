package org.osmf.net
{
   public class DynamicStreamingItem
   {
       
      
      private var _bitrate:Number;
      
      private var _stream:String;
      
      private var _width:int;
      
      private var _height:int;
      
      public function DynamicStreamingItem(param1:String, param2:Number, param3:int = -1, param4:int = -1)
      {
         super();
         this._stream = param1;
         this._bitrate = param2;
         this._width = param3;
         this._height = param4;
      }
      
      public function get streamName() : String
      {
         return this._stream;
      }
      
      public function set streamName(param1:String) : void
      {
         this._stream = param1;
      }
      
      public function get bitrate() : Number
      {
         return this._bitrate;
      }
      
      public function set bitrate(param1:Number) : void
      {
         this._bitrate = param1;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set width(param1:int) : void
      {
         this._width = param1;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function set height(param1:int) : void
      {
         this._height = param1;
      }
   }
}
