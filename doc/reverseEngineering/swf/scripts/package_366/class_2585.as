package package_366
{
   import away3d.arcane;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import package_199.class_2123;
   import package_293.class_1751;
   import package_293.class_2689;
   import package_369.class_2117;
   import package_369.class_2118;
   import package_369.class_2433;
   import package_369.class_2621;
   import package_434.class_2413;
   
   public class class_2585 extends class_2105
   {
       
      
      private var var_2617:ByteArray;
      
      private var var_1216:Boolean;
      
      private var var_434:Boolean;
      
      private var _loader:Loader;
      
      public function class_2585()
      {
         super(class_2419.BINARY);
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "jpg" || param1 == "jpeg" || param1 == "png" || param1 == "gif" || param1 == "bmp" || param1 == "atf";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         if(param1 is Bitmap)
         {
            return true;
         }
         if(param1 is BitmapData)
         {
            return true;
         }
         if(!(param1 is ByteArray))
         {
            return false;
         }
         var _loc2_:ByteArray = param1 as ByteArray;
         _loc2_.position = 0;
         if(_loc2_.readUnsignedShort() == 65496)
         {
            return true;
         }
         _loc2_.position = 0;
         if(_loc2_.readShort() == 16973)
         {
            return true;
         }
         _loc2_.position = 1;
         if(_loc2_.readUTFBytes(3) == "PNG")
         {
            return true;
         }
         _loc2_.position = 0;
         if(_loc2_.readUTFBytes(3) == "GIF" && _loc2_.readShort() == 14393 && _loc2_.readByte() == 97)
         {
            return true;
         }
         _loc2_.position = 0;
         if(_loc2_.readUTFBytes(3) == "ATF")
         {
            return true;
         }
         return false;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_data is Bitmap)
         {
            _loc1_ = new class_2117(Bitmap(_data).bitmapData);
            method_3342(_loc1_,arcane::var_677);
            return const_2361;
         }
         if(_data is BitmapData)
         {
            _loc1_ = new class_2117(_data as BitmapData);
            method_3342(_loc1_,arcane::var_677);
            return const_2361;
         }
         this.var_2617 = method_5043();
         if(!this.var_1216)
         {
            this.var_2617.position = 0;
            if(this.var_2617.readUTFBytes(3) == "ATF")
            {
               this.var_2617.position = 0;
               _loc2_ = new class_2433(this.var_2617);
               this.var_2617.position = 0;
               switch(_loc2_.type)
               {
                  case 0:
                     _loc1_ = new class_2118(this.var_2617);
                     break;
                  case 1:
                     _loc1_ = new class_2621(this.var_2617);
                     break;
                  default:
                     throw new Error("Invalid ATF type");
               }
               if(_loc1_)
               {
                  method_3342(_loc1_,arcane::var_677);
               }
               return const_2361;
            }
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.name_130);
            this._loader.loadBytes(this.var_2617);
            this.var_1216 = true;
         }
         return this.var_434;
      }
      
      private function name_130(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc2_:BitmapData = Bitmap(this._loader.content).bitmapData;
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.name_130);
         if(!class_2413.method_2090(_loc2_))
         {
            (_loc4_ = new class_2689(_loc2_)).name = arcane::var_677;
            dispatchEvent(new class_2123(class_2123.const_963,_loc4_));
            _loc2_ = new BitmapData(8,8,false,0);
            _loc5_ = 0;
            while(_loc5_ < 8)
            {
               _loc6_ = 0;
               while(_loc6_ < 8)
               {
                  if(_loc6_ & 1 ^ _loc5_ & 1)
                  {
                     _loc2_.setPixel(_loc5_,_loc6_,16777215);
                  }
                  _loc6_++;
               }
               _loc5_++;
            }
         }
         _loc3_ = new class_2117(_loc2_);
         method_3342(_loc3_,arcane::var_677);
         this.var_434 = true;
      }
   }
}
