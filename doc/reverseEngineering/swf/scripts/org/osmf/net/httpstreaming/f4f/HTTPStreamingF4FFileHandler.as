package org.osmf.net.httpstreaming.f4f
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import org.osmf.events.HTTPStreamingFileHandlerEvent;
   import org.osmf.net.httpstreaming.HTTPStreamingFileHandlerBase;
   
   public class HTTPStreamingF4FFileHandler extends HTTPStreamingFileHandlerBase
   {
      
      private static const MAX_BYTES_PER_MDAT_READ:uint = 5120;
       
      
      private var _afra:AdobeFragmentRandomAccessBox;
      
      private var _ba:ByteArray;
      
      private var _boxInfoPending:Boolean;
      
      private var _bytesNeeded:uint;
      
      private var _bytesReadSinceAfraStart:uint;
      
      private var _countingReadBytes:Boolean;
      
      private var _mdatBytesPending:uint;
      
      private var _nextBox:BoxInfo;
      
      private var _parser:BoxParser;
      
      private var _seekToTime:Number;
      
      private var _mdatBytesOffset:Number;
      
      private var _processRequestWasSeek:Boolean = false;
      
      public function HTTPStreamingF4FFileHandler()
      {
         this._parser = new BoxParser();
         super();
      }
      
      override public function beginProcessFile(param1:Boolean, param2:Number) : void
      {
         this._processRequestWasSeek = param1;
         this._seekToTime = param1 ? param2 : 0;
         this._bytesNeeded = NaN;
         this._bytesReadSinceAfraStart = 0;
         this._countingReadBytes = false;
         this._boxInfoPending = true;
         this._nextBox = null;
      }
      
      override public function get inputBytesNeeded() : Number
      {
         return this._bytesNeeded;
      }
      
      override public function processFileSegment(param1:IDataInput) : ByteArray
      {
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(param1.bytesAvailable < this._bytesNeeded)
         {
            return null;
         }
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         if(this._boxInfoPending)
         {
            this._ba = new ByteArray();
            param1.readBytes(this._ba,0,_loc3_);
            if(this._countingReadBytes)
            {
               this._bytesReadSinceAfraStart += _loc3_;
            }
            this._parser.init(this._ba);
            this._nextBox = this._parser.getNextBoxInfo();
            if(this._nextBox.size == F4FConstants.FLAG_USE_LARGE_SIZE)
            {
               _loc3_ += F4FConstants.FIELD_LARGE_SIZE_LENGTH;
               this._ba.position = 0;
               param1.readBytes(this._ba,0,F4FConstants.FIELD_LARGE_SIZE_LENGTH);
               if(this._countingReadBytes)
               {
                  this._bytesReadSinceAfraStart += F4FConstants.FIELD_LARGE_SIZE_LENGTH;
               }
               this._nextBox.size = this._parser.readLongUIntToNumber();
            }
            this._boxInfoPending = false;
            if(this._nextBox.type == F4FConstants.BOX_TYPE_MDAT)
            {
               this._bytesNeeded = 0;
               this._mdatBytesPending = this._nextBox.size - _loc3_;
            }
            else
            {
               this._bytesNeeded = this._nextBox.size - _loc3_;
               this._mdatBytesPending = 0;
               if(this._nextBox.type == F4FConstants.BOX_TYPE_AFRA)
               {
                  this._bytesReadSinceAfraStart = _loc3_;
                  this._countingReadBytes = true;
               }
            }
         }
         else if(this._bytesNeeded > 0)
         {
            _loc4_ = this._ba.position;
            param1.readBytes(this._ba,this._ba.length,this._nextBox.size - _loc3_);
            if(this._countingReadBytes)
            {
               this._bytesReadSinceAfraStart += this._nextBox.size - _loc3_;
            }
            this._ba.position = _loc4_;
            if(this._nextBox.type == F4FConstants.BOX_TYPE_ABST)
            {
               if((_loc5_ = this._parser.readAdobeBootstrapBox(this._nextBox)) != null)
               {
                  dispatchEvent(new HTTPStreamingFileHandlerEvent(HTTPStreamingFileHandlerEvent.NOTIFY_BOOTSTRAP_BOX,false,false,0,null,false,false,_loc5_));
               }
            }
            else if(this._nextBox.type == F4FConstants.BOX_TYPE_AFRA)
            {
               this._afra = this._parser.readFragmentRandomAccessBox(this._nextBox);
               this.processSeekToTime();
            }
            else if(this._nextBox.type == F4FConstants.BOX_TYPE_MOOF)
            {
            }
            this._bytesNeeded = NaN;
            this._boxInfoPending = true;
            this._nextBox = null;
         }
         else
         {
            _loc2_ = this.getMDATBytes(param1,false);
         }
         return _loc2_;
      }
      
      override public function endProcessFile(param1:IDataInput) : ByteArray
      {
         if(this._bytesNeeded > 0)
         {
            dispatchEvent(new HTTPStreamingFileHandlerEvent(HTTPStreamingFileHandlerEvent.NOTIFY_ERROR,false,false,0,null,false,false,null,true));
         }
         return this.getMDATBytes(param1,true);
      }
      
      override public function flushFileSegment(param1:IDataInput) : ByteArray
      {
         return null;
      }
      
      private function getMDATBytes(param1:IDataInput, param2:Boolean) : ByteArray
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         if(param1 == null)
         {
            return null;
         }
         this.skipSeekBytes(param1);
         if(this._mdatBytesPending > 0)
         {
            _loc4_ = this._mdatBytesPending < param1.bytesAvailable ? this._mdatBytesPending : uint(param1.bytesAvailable);
            if(!param2 && _loc4_ > MAX_BYTES_PER_MDAT_READ)
            {
               _loc4_ = MAX_BYTES_PER_MDAT_READ;
            }
            _loc3_ = new ByteArray();
            this._mdatBytesPending -= _loc4_;
            param1.readBytes(_loc3_,0,_loc4_);
         }
         return _loc3_;
      }
      
      private function skipSeekBytes(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = null;
         if(this._bytesReadSinceAfraStart < this._mdatBytesOffset)
         {
            _loc2_ = this._mdatBytesOffset - this._bytesReadSinceAfraStart;
            if(param1.bytesAvailable < _loc2_)
            {
               _loc2_ = uint(param1.bytesAvailable);
            }
            _loc3_ = new ByteArray();
            param1.readBytes(_loc3_,0,_loc2_);
            this._bytesReadSinceAfraStart += _loc2_;
            this._mdatBytesPending -= _loc2_;
         }
      }
      
      private function processSeekToTime() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:* = null;
         if(this._seekToTime <= 0)
         {
            this._mdatBytesOffset = 0;
         }
         else
         {
            _loc2_ = this.getMDATBytesOffset(this._seekToTime);
            if(_loc2_ != null)
            {
               this._mdatBytesOffset = _loc2_.offset;
               _loc1_ = _loc2_.time;
            }
            else
            {
               this._mdatBytesOffset = 0;
            }
         }
      }
      
      private function getMDATBytesOffset(param1:Number) : LocalRandomAccessEntry
      {
         return !isNaN(param1) ? this._afra.findNearestKeyFrameOffset(param1 * this._afra.timeScale) : null;
      }
   }
}
