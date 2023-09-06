package org.osmf.net.httpstreaming.flv
{
   import flash.utils.ByteArray;
   
   public class FLVTagVideo extends FLVTag
   {
      
      public static const FRAME_TYPE_KEYFRAME:int = 1;
      
      public static const FRAME_TYPE_INTER:int = 2;
      
      public static const FRAME_TYPE_DISPOSABLE_INTER:int = 3;
      
      public static const FRAME_TYPE_GENERATED_KEYFRAME:int = 4;
      
      public static const FRAME_TYPE_INFO:int = 5;
      
      public static const CODEC_ID_JPEG:int = 1;
      
      public static const CODEC_ID_SORENSON:int = 2;
      
      public static const CODEC_ID_SCREEN:int = 3;
      
      public static const CODEC_ID_VP6:int = 4;
      
      public static const CODEC_ID_VP6_ALPHA:int = 5;
      
      public static const CODEC_ID_SCREEN_V2:int = 6;
      
      public static const CODEC_ID_AVC:int = 7;
      
      public static const AVC_PACKET_TYPE_SEQUENCE_HEADER:int = 0;
      
      public static const AVC_PACKET_TYPE_NALU:int = 1;
      
      public static const AVC_PACKET_TYPE_END_OF_SEQUENCE:int = 2;
      
      public static const INFO_PACKET_SEEK_START:int = 0;
      
      public static const INFO_PACKET_SEEK_END:int = 1;
       
      
      public function FLVTagVideo(param1:int = 9)
      {
         super(param1);
      }
      
      public function get frameType() : int
      {
         return 0;
      }
      
      public function set frameType(param1:int) : void
      {
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0 | (param1 & 15) << 4;
      }
      
      public function get codecID() : int
      {
         return 0;
      }
      
      public function set codecID(param1:int) : void
      {
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0 | param1 & 15;
      }
      
      public function get infoPacketValue() : int
      {
         if(this.frameType != FRAME_TYPE_INFO)
         {
            throw new Error("get infoPacketValue() not permitted unless frameType is FRAME_TYPE_INFO");
         }
         return bytes[TAG_HEADER_BYTE_COUNT + 1];
      }
      
      public function set infoPacketValue(param1:int) : void
      {
         if(this.frameType != FRAME_TYPE_INFO)
         {
            throw new Error("get infoPacketValue() not permitted unless frameType is FRAME_TYPE_INFO");
         }
         bytes[TAG_HEADER_BYTE_COUNT + 1] = param1;
         bytes.length = TAG_HEADER_BYTE_COUNT + 2;
         dataSize = 2;
      }
      
      public function get avcPacketType() : int
      {
         if(this.codecID != CODEC_ID_AVC)
         {
            throw new Error("get avcPacketType() not permitted unless codecID is CODEC_ID_AVC");
         }
         return bytes[TAG_HEADER_BYTE_COUNT + 1];
      }
      
      public function set avcPacketType(param1:int) : void
      {
         if(this.codecID != CODEC_ID_AVC)
         {
            throw new Error("set avcPacketType() not permitted unless codecID is CODEC_ID_AVC");
         }
         bytes[TAG_HEADER_BYTE_COUNT + 1] = param1;
         if(this.avcPacketType != AVC_PACKET_TYPE_NALU)
         {
            bytes[TAG_HEADER_BYTE_COUNT + 2] = 0;
            bytes[TAG_HEADER_BYTE_COUNT + 3] = 0;
            bytes[TAG_HEADER_BYTE_COUNT + 4] = 0;
            bytes.length = TAG_HEADER_BYTE_COUNT + 5;
            dataSize = 5;
         }
      }
      
      public function get avcCompositionTimeOffset() : int
      {
         if(this.codecID != CODEC_ID_AVC || this.avcPacketType != AVC_PACKET_TYPE_NALU)
         {
            throw new Error("get avcCompositionTimeOffset() not permitted unless codecID is CODEC_ID_AVC and avcPacketType is AVC NALU");
         }
         var _loc1_:* = 0;
         _loc1_ |= 0;
         _loc1_ |= 0;
         if(_loc1_ & 8388608)
         {
            _loc1_ |= 4278190080;
         }
         return _loc1_;
      }
      
      public function set avcCompositionTimeOffset(param1:int) : void
      {
         if(this.codecID != CODEC_ID_AVC || this.avcPacketType != AVC_PACKET_TYPE_NALU)
         {
            throw new Error("set avcCompositionTimeOffset() not permitted unless codecID is CODEC_ID_AVC and avcPacketType is AVC NALU");
         }
         bytes[TAG_HEADER_BYTE_COUNT + 2] = param1 >> 16 & 255;
         bytes[TAG_HEADER_BYTE_COUNT + 3] = param1 >> 8 & 255;
         bytes[TAG_HEADER_BYTE_COUNT + 4] = param1 & 255;
      }
      
      override public function get data() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         if(this.codecID == CODEC_ID_AVC)
         {
            _loc1_.writeBytes(bytes,TAG_HEADER_BYTE_COUNT + 5,dataSize - 5);
         }
         else
         {
            _loc1_.writeBytes(bytes,TAG_HEADER_BYTE_COUNT + 1,dataSize - 1);
         }
         return _loc1_;
      }
      
      override public function set data(param1:ByteArray) : void
      {
         if(this.codecID == CODEC_ID_AVC)
         {
            bytes.length = TAG_HEADER_BYTE_COUNT + param1.length + 5;
            bytes.position = TAG_HEADER_BYTE_COUNT + 5;
            bytes.writeBytes(param1,0,param1.length);
            dataSize = param1.length + 5;
         }
         else
         {
            bytes.length = TAG_HEADER_BYTE_COUNT + param1.length + 1;
            bytes.position = TAG_HEADER_BYTE_COUNT + 1;
            bytes.writeBytes(param1,0,param1.length);
            dataSize = param1.length + 1;
         }
      }
   }
}
