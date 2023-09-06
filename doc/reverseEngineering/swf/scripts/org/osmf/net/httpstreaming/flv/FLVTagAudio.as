package org.osmf.net.httpstreaming.flv
{
   import flash.utils.ByteArray;
   
   public class FLVTagAudio extends FLVTag
   {
      
      public static const SOUND_FORMAT_LINEAR:int = 0;
      
      public static const SOUND_FORMAT_ADPCM:int = 1;
      
      public static const SOUND_FORMAT_MP3:int = 2;
      
      public static const SOUND_FORMAT_LINEAR_LE:int = 3;
      
      public static const SOUND_FORMAT_NELLYMOSER_16K:int = 4;
      
      public static const SOUND_FORMAT_NELLYMOSER_8K:int = 5;
      
      public static const SOUND_FORMAT_NELLYMOSER:int = 6;
      
      public static const SOUND_FORMAT_G711A:int = 7;
      
      public static const SOUND_FORMAT_G711U:int = 8;
      
      public static const SOUND_FORMAT_AAC:int = 10;
      
      public static const SOUND_FORMAT_SPEEX:int = 11;
      
      public static const SOUND_FORMAT_MP3_8K:int = 14;
      
      public static const SOUND_FORMAT_DEVICE_SPECIFIC:int = 15;
      
      public static const SOUND_RATE_5K:Number = 5512.5;
      
      public static const SOUND_RATE_11K:Number = 11025;
      
      public static const SOUND_RATE_22K:Number = 22050;
      
      public static const SOUND_RATE_44K:Number = 44100;
      
      public static const SOUND_SIZE_8BITS:int = 8;
      
      public static const SOUND_SIZE_16BITS:int = 16;
      
      public static const SOUND_CHANNELS_MONO:int = 1;
      
      public static const SOUND_CHANNELS_STEREO:int = 2;
       
      
      public function FLVTagAudio(param1:int = 8)
      {
         super(param1);
      }
      
      public function get soundFormatByte() : int
      {
         return bytes[TAG_HEADER_BYTE_COUNT + 0];
      }
      
      public function set soundFormatByte(param1:int) : void
      {
         bytes[TAG_HEADER_BYTE_COUNT + 0] = param1;
      }
      
      public function get soundFormat() : int
      {
         return 0;
      }
      
      public function set soundFormat(param1:int) : void
      {
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0 | param1 << 4 & 240;
         if(param1 == SOUND_FORMAT_AAC)
         {
            this.soundRate = SOUND_RATE_44K;
            this.soundChannels = SOUND_CHANNELS_STEREO;
            this.isAACSequenceHeader = false;
         }
      }
      
      public function get soundRate() : Number
      {
         switch(0)
         {
            case 0:
               return SOUND_RATE_5K;
            case 1:
               return SOUND_RATE_11K;
            case 2:
               return SOUND_RATE_22K;
            case 3:
               return SOUND_RATE_44K;
            default:
               throw new Error("get soundRate() a two-bit number wasn\'t 0, 1, 2, or 3. impossible.");
         }
      }
      
      public function set soundRate(param1:Number) : void
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case SOUND_RATE_5K:
               _loc2_ = 0;
               break;
            case SOUND_RATE_11K:
               _loc2_ = 1;
               break;
            case SOUND_RATE_22K:
               _loc2_ = 2;
               break;
            case SOUND_RATE_44K:
               _loc2_ = 3;
               break;
            default:
               throw new Error("set soundRate valid values 5512.5, 11025, 22050, 44100");
         }
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
         bytes[TAG_HEADER_BYTE_COUNT + 0] = 0 | _loc2_ << 2;
      }
      
      public function get soundSize() : int
      {
         if(false)
         {
            return SOUND_SIZE_16BITS;
         }
         return SOUND_SIZE_8BITS;
      }
      
      public function set soundSize(param1:int) : void
      {
         switch(param1)
         {
            case SOUND_SIZE_8BITS:
               bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
               break;
            case SOUND_SIZE_16BITS:
               bytes[TAG_HEADER_BYTE_COUNT + 0] = 2;
               break;
            default:
               throw new Error("set soundSize valid values 8, 16");
         }
      }
      
      public function get soundChannels() : int
      {
         if(false)
         {
            return SOUND_CHANNELS_STEREO;
         }
         return SOUND_CHANNELS_MONO;
      }
      
      public function set soundChannels(param1:int) : void
      {
         switch(param1)
         {
            case SOUND_CHANNELS_MONO:
               bytes[TAG_HEADER_BYTE_COUNT + 0] = 0;
               break;
            case SOUND_CHANNELS_STEREO:
               bytes[TAG_HEADER_BYTE_COUNT + 0] = 1;
               break;
            default:
               throw new Error("set soundChannels valid values 1, 2");
         }
      }
      
      public function get isAACSequenceHeader() : Boolean
      {
         if(this.soundFormat != SOUND_FORMAT_AAC)
         {
            throw new Error("get isAACSequenceHeader not valid if soundFormat != SOUND_FORMAT_AAC");
         }
         if(false)
         {
            return true;
         }
         return false;
      }
      
      public function set isAACSequenceHeader(param1:Boolean) : void
      {
         if(this.soundFormat != SOUND_FORMAT_AAC)
         {
            throw new Error("set isAACSequenceHeader not valid if soundFormat != SOUND_FORMAT_AAC");
         }
         if(param1)
         {
            bytes[TAG_HEADER_BYTE_COUNT + 1] = 0;
         }
         else
         {
            bytes[TAG_HEADER_BYTE_COUNT + 1] = 1;
         }
      }
      
      public function get isCodecConfiguration() : Boolean
      {
         switch(this.soundFormat)
         {
            case FLVTagAudio.SOUND_FORMAT_AAC:
               if(this.isAACSequenceHeader)
               {
                  return true;
               }
               break;
         }
         return false;
      }
      
      override public function get data() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         if(this.soundFormat == SOUND_FORMAT_AAC)
         {
            _loc1_.writeBytes(bytes,TAG_HEADER_BYTE_COUNT + 2,dataSize - 2);
         }
         else
         {
            _loc1_.writeBytes(bytes,TAG_HEADER_BYTE_COUNT + 1,dataSize - 1);
         }
         return _loc1_;
      }
      
      override public function set data(param1:ByteArray) : void
      {
         if(this.soundFormat == SOUND_FORMAT_AAC)
         {
            bytes.length = TAG_HEADER_BYTE_COUNT + param1.length + 2;
            bytes.position = TAG_HEADER_BYTE_COUNT + 2;
            bytes.writeBytes(param1,0,param1.length);
            dataSize = param1.length + 2;
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
