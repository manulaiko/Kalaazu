package package_440
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class class_2423 extends EventDispatcher
   {
      
      static const const_112:uint = 33639248;
      
      static const const_516:uint = 808471376;
      
      static const const_2557:uint = 67324752;
      
      static const const_1470:uint = 84233040;
      
      static const const_360:uint = 101010256;
      
      static const const_1080:uint = 101075792;
      
      static const const_2041:uint = 117853008;
      
      static const const_2344:uint = 134695760;
      
      static const const_2210:uint = 134630224;
      
      static const const_2112:uint = 134695760;
       
      
      public var debug:String = "";
      
      protected var var_1830:Array;
      
      protected var var_1208:Dictionary;
      
      protected var var_207:URLStream;
      
      protected var var_2017:String;
      
      protected var var_2719:Function;
      
      protected var var_3544:class_2601;
      
      protected var var_4127:ByteArray;
      
      protected var var_1910:uint;
      
      protected var var_467:uint;
      
      public function class_2423(param1:String = "utf-8")
      {
         super();
         this.var_2017 = param1;
         this.var_2719 = this.method_3580;
      }
      
      public function get active() : Boolean
      {
         return this.var_2719 !== this.method_3580;
      }
      
      public function load(param1:URLRequest) : void
      {
         if(!this.var_207 && this.var_2719 == this.method_3580)
         {
            this.var_207 = new URLStream();
            this.var_207.endian = Endian.LITTLE_ENDIAN;
            this.method_662();
            this.var_1830 = [];
            this.var_1208 = new Dictionary();
            this.var_2719 = this.method_2371;
            this.var_207.load(param1);
         }
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         if(!this.var_207 && this.var_2719 == this.method_3580)
         {
            this.var_1830 = [];
            this.var_1208 = new Dictionary();
            param1.position = 0;
            param1.endian = Endian.LITTLE_ENDIAN;
            this.var_2719 = this.method_2371;
            if(this.parse(param1))
            {
               this.var_2719 = this.method_3580;
               dispatchEvent(new Event(Event.COMPLETE));
            }
            else
            {
               dispatchEvent(new class_2600(class_2600.PARSE_ERROR,"EOF"));
            }
         }
      }
      
      public function close() : void
      {
         if(this.var_207)
         {
            this.var_2719 = this.method_3580;
            this.method_72();
            this.var_207.close();
            this.var_207 = null;
         }
      }
      
      public function method_1976(param1:IDataOutput, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(param1 != null && this.var_1830.length > 0)
         {
            _loc3_ = param1.endian;
            _loc4_ = new ByteArray();
            param1.endian = _loc4_.endian = Endian.LITTLE_ENDIAN;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < this.var_1830.length)
            {
               if((_loc8_ = this.var_1830[_loc7_] as class_2601) != null)
               {
                  _loc8_.method_1976(_loc4_,param2,true,_loc5_);
                  _loc5_ += _loc8_.method_1976(param1,param2);
                  _loc6_++;
               }
               _loc7_++;
            }
            if(_loc4_.length > 0)
            {
               param1.writeBytes(_loc4_);
            }
            param1.writeUnsignedInt(const_360);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeShort(_loc6_);
            param1.writeShort(_loc6_);
            param1.writeUnsignedInt(_loc4_.length);
            param1.writeUnsignedInt(_loc5_);
            param1.writeShort(0);
            param1.endian = _loc3_;
         }
      }
      
      public function method_466() : uint
      {
         return !!this.var_1830 ? uint(this.var_1830.length) : 0;
      }
      
      public function method_3331(param1:uint) : class_2601
      {
         return !!this.var_1830 ? this.var_1830[param1] as class_2601 : null;
      }
      
      public function method_3506(param1:String) : class_2601
      {
         return !!this.var_1208[param1] ? this.var_1208[param1] as class_2601 : null;
      }
      
      public function method_1042(param1:String, param2:ByteArray = null, param3:Boolean = true) : class_2601
      {
         return this.method_2606(!!this.var_1830 ? uint(this.var_1830.length) : 0,param1,param2,param3);
      }
      
      public function method_5672(param1:String, param2:String, param3:String = "utf-8", param4:Boolean = true) : class_2601
      {
         return this.method_3462(!!this.var_1830 ? uint(this.var_1830.length) : 0,param1,param2,param3,param4);
      }
      
      public function method_2606(param1:uint, param2:String, param3:ByteArray = null, param4:Boolean = true) : class_2601
      {
         if(this.var_1830 == null)
         {
            this.var_1830 = [];
         }
         if(this.var_1208 == null)
         {
            this.var_1208 = new Dictionary();
         }
         else if(this.var_1208[param2])
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc5_:class_2601;
         (_loc5_ = new class_2601()).method_4082 = param2;
         _loc5_.setContent(param3,param4);
         if(param1 >= this.var_1830.length)
         {
            this.var_1830.push(_loc5_);
         }
         else
         {
            this.var_1830.splice(param1,0,_loc5_);
         }
         this.var_1208[param2] = _loc5_;
         return _loc5_;
      }
      
      public function method_3462(param1:uint, param2:String, param3:String, param4:String = "utf-8", param5:Boolean = true) : class_2601
      {
         if(this.var_1830 == null)
         {
            this.var_1830 = [];
         }
         if(this.var_1208 == null)
         {
            this.var_1208 = new Dictionary();
         }
         else if(this.var_1208[param2])
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc6_:class_2601;
         (_loc6_ = new class_2601()).method_4082 = param2;
         _loc6_.method_3885(param3,param4,param5);
         if(param1 >= this.var_1830.length)
         {
            this.var_1830.push(_loc6_);
         }
         else
         {
            this.var_1830.splice(param1,0,_loc6_);
         }
         this.var_1208[param2] = _loc6_;
         return _loc6_;
      }
      
      public function method_6433(param1:uint) : class_2601
      {
         var _loc2_:* = null;
         if(this.var_1830 != null && this.var_1208 != null && param1 < this.var_1830.length)
         {
            _loc2_ = this.var_1830[param1] as class_2601;
            if(_loc2_ != null)
            {
               this.var_1830.splice(param1,1);
               delete this.var_1208[_loc2_.method_4082];
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function parse(param1:IDataInput) : Boolean
      {
         while(this.var_2719(param1))
         {
         }
         return this.var_2719 === this.method_3580;
      }
      
      protected function method_3580(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function method_2371(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         if(param1.bytesAvailable >= 4)
         {
            _loc2_ = uint(param1.readUnsignedInt());
            switch(_loc2_)
            {
               case const_2557:
                  this.var_2719 = this.method_2706;
                  this.var_3544 = new class_2601(this.var_2017);
                  break;
               case const_112:
               case const_360:
               case const_516:
               case const_1470:
               case const_1080:
               case const_2041:
               case const_2344:
               case const_2210:
               case const_2112:
                  this.var_2719 = this.method_3580;
                  break;
               default:
                  throw new Error("Unknown record signature: 0x" + _loc2_.toString(16) + " debug[" + this.debug + "]");
            }
            return true;
         }
         return false;
      }
      
      protected function method_2706(param1:IDataInput) : Boolean
      {
         if(this.var_3544.parse(param1))
         {
            if(this.var_3544.method_368)
            {
               this.var_2719 = this.method_5323;
               this.var_4127 = new ByteArray();
               this.var_1910 = 0;
               this.var_467 = 0;
               return true;
            }
            this.method_350();
            if(this.var_2719 != this.method_3580)
            {
               this.var_2719 = this.method_2371;
               return true;
            }
         }
         return false;
      }
      
      protected function method_5323(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         while(param1.bytesAvailable > 0)
         {
            _loc2_ = uint(param1.readUnsignedByte());
            this.var_1910 = Number(this.var_1910) >>> 8 | _loc2_ << 24;
            if(this.var_1910 == const_2344)
            {
               this.var_4127.length -= 3;
               this.var_2719 = this.method_5267;
               return true;
            }
            this.var_4127.writeByte(_loc2_);
         }
         return false;
      }
      
      protected function method_5267(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         if(param1.bytesAvailable >= 12)
         {
            _loc2_ = uint(param1.readUnsignedInt());
            _loc3_ = uint(param1.readUnsignedInt());
            _loc4_ = uint(param1.readUnsignedInt());
            if(this.var_4127.length == _loc3_)
            {
               this.var_4127.position = 0;
               this.var_3544.var_2434 = _loc2_;
               this.var_3544.var_1184 = _loc3_;
               this.var_3544.var_2069 = _loc4_;
               this.var_3544.parseContent(this.var_4127);
               this.method_350();
               this.var_2719 = this.method_2371;
            }
            else
            {
               this.var_4127.writeUnsignedInt(_loc2_);
               this.var_4127.writeUnsignedInt(_loc3_);
               this.var_4127.writeUnsignedInt(_loc4_);
               this.var_2719 = this.method_5323;
            }
            return true;
         }
         return false;
      }
      
      protected function method_350() : void
      {
         this.var_1830.push(this.var_3544);
         if(this.var_3544.method_4082)
         {
            this.var_1208[this.var_3544.method_4082] = this.var_3544;
         }
         dispatchEvent(new class_2424(class_2424.FILE_LOADED,this.var_3544));
         this.var_3544 = null;
      }
      
      protected function progressHandler(param1:Event) : void
      {
         var evt:Event = param1;
         dispatchEvent(evt.clone());
         try
         {
            if(this.parse(this.var_207))
            {
               this.close();
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         catch(e:Error)
         {
            close();
            if(!hasEventListener(class_2600.PARSE_ERROR))
            {
               throw e;
            }
            dispatchEvent(new class_2600(class_2600.PARSE_ERROR,e.message));
         }
      }
      
      protected function method_3538(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
      
      protected function defaultErrorHandler(param1:Event) : void
      {
         this.close();
         dispatchEvent(param1.clone());
      }
      
      protected function method_662() : void
      {
         this.var_207.addEventListener(Event.COMPLETE,this.method_3538);
         this.var_207.addEventListener(Event.OPEN,this.method_3538);
         this.var_207.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.method_3538);
         this.var_207.addEventListener(IOErrorEvent.IO_ERROR,this.defaultErrorHandler);
         this.var_207.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.defaultErrorHandler);
         this.var_207.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
      }
      
      protected function method_72() : void
      {
         this.var_207.removeEventListener(Event.COMPLETE,this.method_3538);
         this.var_207.removeEventListener(Event.OPEN,this.method_3538);
         this.var_207.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.method_3538);
         this.var_207.removeEventListener(IOErrorEvent.IO_ERROR,this.defaultErrorHandler);
         this.var_207.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.defaultErrorHandler);
         this.var_207.removeEventListener(ProgressEvent.PROGRESS,this.progressHandler);
      }
   }
}
