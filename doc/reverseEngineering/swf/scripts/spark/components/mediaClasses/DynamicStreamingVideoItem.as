package spark.components.mediaClasses
{
   public class DynamicStreamingVideoItem
   {
       
      
      private var _bitrate:Number = 0;
      
      private var _streamName:String;
      
      public function DynamicStreamingVideoItem()
      {
         super();
      }
      
      public function get bitrate() : Number
      {
         return this._bitrate;
      }
      
      public function set bitrate(param1:Number) : void
      {
         this._bitrate = param1;
      }
      
      public function get streamName() : String
      {
         return this._streamName;
      }
      
      public function set streamName(param1:String) : void
      {
         this._streamName = param1;
      }
   }
}
