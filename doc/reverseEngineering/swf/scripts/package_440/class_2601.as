package package_440
{
   import flash.utils.*;
   import package_486.class_2696;
   
   public class class_2601
   {
      
      public static const const_2177:int = 0;
      
      public static const const_581:int = 1;
      
      public static const const_275:int = 2;
      
      public static const const_2270:int = 3;
      
      public static const const_56:int = 4;
      
      public static const const_1924:int = 5;
      
      public static const const_2974:int = 6;
      
      public static const const_1223:int = 7;
      
      public static const const_435:int = 8;
      
      public static const const_1554:int = 9;
      
      public static const const_590:int = 10;
      
      protected static var var_2465:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").parameter.length() > 0;
      
      protected static var var_2143:Boolean = describeType(ByteArray).factory.method.(@name == "inflate").length() > 0;
       
      
      protected var var_2229:int = 0;
      
      protected var var_1204:String = "2.0";
      
      protected var var_3466:int = 8;
      
      protected var var_4730:Boolean = false;
      
      protected var var_835:int = -1;
      
      protected var var_105:int = -1;
      
      protected var var_4420:int = -1;
      
      protected var var_555:Boolean = false;
      
      protected var var_1193:Boolean = false;
      
      protected var var_2406:Date;
      
      protected var var_4386:uint;
      
      protected var var_1466:Boolean = false;
      
      protected var var_2814:uint = 0;
      
      protected var var_3754:uint = 0;
      
      protected var var_1558:String = "";
      
      protected var var_3468:String;
      
      protected var var_455:Dictionary;
      
      protected var var_1803:String = "";
      
      protected var _content:ByteArray;
      
      var var_2434:uint;
      
      var var_1184:uint = 0;
      
      var var_2069:uint = 0;
      
      protected var var_2453:Boolean = false;
      
      protected var var_2719:Function;
      
      public function class_2601(param1:String = "utf-8")
      {
         this.var_2719 = this.method_1541;
         super();
         this.var_3468 = param1;
         this.var_455 = new Dictionary();
         this._content = new ByteArray();
         this._content.endian = Endian.BIG_ENDIAN;
      }
      
      public function get date() : Date
      {
         return this.var_2406;
      }
      
      public function set date(param1:Date) : void
      {
         this.var_2406 = param1 != null ? param1 : new Date();
      }
      
      public function get method_4082() : String
      {
         return this.var_1558;
      }
      
      public function set method_4082(param1:String) : void
      {
         this.var_1558 = param1;
      }
      
      function get method_368() : Boolean
      {
         return this.var_555;
      }
      
      public function get content() : ByteArray
      {
         if(this.var_2453)
         {
            this.uncompress();
         }
         return this._content;
      }
      
      public function set content(param1:ByteArray) : void
      {
         this.setContent(param1);
      }
      
      public function setContent(param1:ByteArray, param2:Boolean = true) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(this._content,0,param1.length);
            this.var_2434 = class_2696.method_6456(this._content);
            this.var_1466 = false;
         }
         else
         {
            this._content.length = 0;
            this._content.position = 0;
            this.var_2453 = false;
         }
         if(param2)
         {
            this.compress();
         }
         else
         {
            this.var_2069 = this.var_1184 = this._content.length;
         }
      }
      
      public function get method_4450() : String
      {
         return this.var_1204;
      }
      
      public function get method_1725() : uint
      {
         return this.var_1184;
      }
      
      public function get method_4020() : uint
      {
         return this.var_2069;
      }
      
      public function method_5611(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(this.var_2453)
         {
            this.uncompress();
         }
         this._content.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = this._content.readUTFBytes(this._content.bytesAvailable);
         }
         else
         {
            _loc3_ = this._content.readMultiByte(this._content.bytesAvailable,param2);
         }
         this._content.position = 0;
         if(param1)
         {
            this.compress();
         }
         return _loc3_;
      }
      
      public function method_3885(param1:String, param2:String = "utf-8", param3:Boolean = true) : void
      {
         this._content.length = 0;
         this._content.position = 0;
         this.var_2453 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               this._content.writeUTFBytes(param1);
            }
            else
            {
               this._content.writeMultiByte(param1,param2);
            }
            this.var_2434 = class_2696.method_6456(this._content);
            this.var_1466 = false;
         }
         if(param3)
         {
            this.compress();
         }
         else
         {
            this.var_2069 = this.var_1184 = this._content.length;
         }
      }
      
      public function method_1976(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(class_2423.const_112);
            param1.writeShort(Number(this.var_2229) << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(class_2423.const_2557);
         }
         param1.writeShort(Number(this.var_2229) << 8 | 20);
         param1.writeShort(this.var_3468 == "utf-8" ? 2048 : 0);
         param1.writeShort(!!this.var_2453 ? int(const_435) : int(const_2177));
         var _loc5_:Date = this.var_2406 != null ? this.var_2406 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(this.var_2434);
         param1.writeUnsignedInt(this.var_1184);
         param1.writeUnsignedInt(this.var_2069);
         var _loc8_:ByteArray;
         (_loc8_ = new ByteArray()).endian = Endian.LITTLE_ENDIAN;
         if(this.var_3468 == "utf-8")
         {
            _loc8_.writeUTFBytes(this.var_1558);
         }
         else
         {
            _loc8_.writeMultiByte(this.var_1558,this.var_3468);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in this.var_455)
         {
            if((_loc15_ = this.var_455[_loc10_] as ByteArray) != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!this.var_1466)
            {
               if(_loc16_ = Boolean(this.var_2453))
               {
                  this.uncompress();
               }
               this.var_4386 = class_2696.method_3728(this._content,0,this._content.length);
               this.var_1466 = true;
               if(_loc16_)
               {
                  this.compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(this.var_4386);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && this.var_1803.length > 0)
         {
            if(this.var_3468 == "utf-8")
            {
               _loc8_.writeUTFBytes(this.var_1803);
            }
            else
            {
               _loc8_.writeMultiByte(this.var_1803,this.var_3468);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:* = 0;
         if(!param3 && this._content.length > 0)
         {
            if(this.var_2453)
            {
               if(Boolean(var_2465) || Boolean(var_2143))
               {
                  _loc13_ = uint(this._content.length);
                  param1.writeBytes(this._content,0,_loc13_);
               }
               else
               {
                  _loc13_ = Number(this._content.length) - 6;
                  param1.writeBytes(this._content,2,_loc13_);
               }
            }
            else
            {
               _loc13_ = uint(this._content.length);
               param1.writeBytes(this._content,0,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(Boolean(param1.bytesAvailable) && Boolean(this.var_2719(param1)))
         {
         }
         return this.var_2719 === this.method_5269;
      }
      
      protected function method_5269(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function method_1541(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            this.method_5794(param1);
            if(this.var_2814 + this.var_3754 > 0)
            {
               this.var_2719 = this.method_1539;
            }
            else
            {
               this.var_2719 = this.method_2375;
            }
            return true;
         }
         return false;
      }
      
      protected function method_1539(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= this.var_2814 + this.var_3754)
         {
            this.method_5925(param1);
            this.var_2719 = this.method_2375;
            return true;
         }
         return false;
      }
      
      protected function method_2375(param1:IDataInput) : Boolean
      {
         var _loc2_:Boolean = true;
         if(this.var_555)
         {
            this.var_2719 = this.method_5269;
            _loc2_ = false;
         }
         else if(this.var_1184 == 0)
         {
            this.var_2719 = this.method_5269;
         }
         else if(param1.bytesAvailable >= this.var_1184)
         {
            this.parseContent(param1);
            this.var_2719 = this.method_5269;
         }
         else
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      protected function method_5794(param1:IDataInput) : void
      {
         var _loc2_:uint = uint(param1.readUnsignedShort());
         this.var_2229 = _loc2_ >> 8;
         this.var_1204 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = uint(param1.readUnsignedShort());
         this.var_3466 = param1.readUnsignedShort();
         this.var_4730 = (_loc3_ & 1) !== 0;
         this.var_555 = (_loc3_ & 8) !== 0;
         this.var_1193 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            this.var_3468 = "utf-8";
         }
         if(this.var_3466 === const_2974)
         {
            this.var_835 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            this.var_105 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(this.var_3466 === const_435)
         {
            this.var_4420 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = uint(param1.readUnsignedShort());
         var _loc5_:uint = uint(param1.readUnsignedShort());
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         this.var_2406 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         this.var_2434 = param1.readUnsignedInt();
         this.var_1184 = param1.readUnsignedInt();
         this.var_2069 = param1.readUnsignedInt();
         this.var_2814 = param1.readUnsignedShort();
         this.var_3754 = param1.readUnsignedShort();
      }
      
      protected function method_5925(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(this.var_3468 == "utf-8")
         {
            this.var_1558 = param1.readUTFBytes(this.var_2814);
         }
         else
         {
            this.var_1558 = param1.readMultiByte(this.var_2814,this.var_3468);
         }
         var _loc2_:uint = uint(this.var_3754);
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            if((_loc4_ = uint(param1.readUnsignedShort())) > _loc2_)
            {
               throw new Error("Parse error in file " + this.var_1558 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               this.var_4386 = param1.readUnsignedInt();
               this.var_1466 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               this.var_455[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(this.var_3466 === const_435 && !this.var_4730)
         {
            if(Boolean(var_2465) || Boolean(var_2143))
            {
               param1.readBytes(this._content,0,this.var_1184);
            }
            else
            {
               if(!this.var_1466)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               this._content.writeByte(120);
               _loc2_ = ~int(this.var_4420) << 6 & 192;
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               this._content.writeByte(_loc2_);
               param1.readBytes(this._content,2,this.var_1184);
               this._content.position = this._content.length;
               this._content.writeUnsignedInt(this.var_4386);
            }
            this.var_2453 = true;
         }
         else
         {
            if(this.var_3466 != const_2177)
            {
               throw new Error("Compression method " + this.var_3466 + " is not supported.");
            }
            param1.readBytes(this._content,0,this.var_1184);
            this.var_2453 = false;
         }
         this._content.position = 0;
      }
      
      protected function compress() : void
      {
         if(!this.var_2453)
         {
            if(this._content.length > 0)
            {
               this._content.position = 0;
               this.var_2069 = this._content.length;
               if(var_2143)
               {
                  this._content.deflate();
                  this.var_1184 = this._content.length;
               }
               else if(var_2465)
               {
                  this._content.compress.apply(this._content,["deflate"]);
                  this.var_1184 = this._content.length;
               }
               else
               {
                  this._content.compress();
                  this.var_1184 = Number(this._content.length) - 6;
               }
               this._content.position = 0;
               this.var_2453 = true;
            }
            else
            {
               this.var_1184 = 0;
               this.var_2069 = 0;
            }
         }
      }
      
      protected function uncompress() : void
      {
         if(Boolean(this.var_2453) && this._content.length > 0)
         {
            this._content.position = 0;
            if(var_2143)
            {
               this._content.inflate();
            }
            else if(var_2465)
            {
               this._content.uncompress.apply(this._content,["deflate"]);
            }
            else
            {
               this._content.uncompress();
            }
            this._content.position = 0;
            this.var_2453 = false;
         }
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + this.var_1558 + "\n  date:" + this.var_2406 + "\n  sizeCompressed:" + this.var_1184 + "\n  sizeUncompressed:" + this.var_2069 + "\n  versionHost:" + this.var_2229 + "\n  versionNumber:" + this.var_1204 + "\n  compressionMethod:" + this.var_3466 + "\n  encrypted:" + this.var_4730 + "\n  hasDataDescriptor:" + this.var_555 + "\n  hasCompressedPatchedData:" + this.var_1193 + "\n  filenameEncoding:" + this.var_3468 + "\n  crc32:" + this.var_2434.toString(16) + "\n  adler32:" + this.var_4386.toString(16);
      }
   }
}
