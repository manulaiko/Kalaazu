package package_368
{
   import away3d.arcane;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import package_199.LoaderEvent;
   import package_199.class_2123;
   import package_199.class_2415;
   import package_366.class_2105;
   import package_366.class_2419;
   import package_366.class_2585;
   
   public class class_2412 extends EventDispatcher
   {
      
      private static var var_212:Vector.<Class> = Vector.<Class>([class_2585]);
       
      
      protected var _parser:class_2105;
      
      protected var var_1272:URLRequest;
      
      protected var var_1449:Boolean;
      
      protected var _data;
      
      private var var_784:String;
      
      private var var_677:String;
      
      private var var_496:uint;
      
      public function class_2412(param1:uint = 0)
      {
         super();
         this.var_496 = param1;
      }
      
      public static function method_605(param1:Class) : void
      {
         if(var_212.indexOf(param1) < 0)
         {
            var_212.push(param1);
         }
      }
      
      public static function method_2343(param1:Vector.<Class>) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            method_605(_loc2_);
         }
      }
      
      public function get url() : String
      {
         return !!this.var_1272 ? this.var_1272.url : "";
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      public function get method_5788() : Boolean
      {
         return this.var_1449;
      }
      
      public function load(param1:URLRequest, param2:class_2105 = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_1449 = param3;
         this.var_1272 = param1;
         this.method_2625(this.var_1272.url);
         if(this.var_1449)
         {
            _loc5_ = "null";
         }
         else
         {
            if(param2)
            {
               this._parser = param2;
            }
            if(!this._parser)
            {
               this._parser = this.method_5649();
            }
            if(this._parser)
            {
               switch(this._parser.dataFormat)
               {
                  case class_2419.BINARY:
                     _loc5_ = "null";
                     break;
                  case class_2419.const_65:
                     _loc5_ = "null";
               }
            }
            else
            {
               _loc5_ = "null";
            }
         }
         (_loc4_ = new URLLoader()).dataFormat = _loc5_;
         _loc4_.addEventListener(Event.COMPLETE,this.method_2907);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.method_4922);
         _loc4_.load(param1);
      }
      
      public function parseData(param1:*, param2:class_2105 = null, param3:URLRequest = null) : void
      {
         if(param1 is Class)
         {
            param1 = new param1();
         }
         if(param2)
         {
            this._parser = param2;
         }
         this.var_1272 = param3;
         this._data = param1;
         this.parse(param1);
      }
      
      public function get parser() : class_2105
      {
         return this._parser;
      }
      
      public function get method_728() : Vector.<class_2416>
      {
         return !!this._parser ? this._parser.method_728 : new Vector.<class_2416>();
      }
      
      protected function method_2625(param1:String) : void
      {
         var _loc2_:String = param1.indexOf("?") > 0 ? param1.split("?")[0] : param1;
         var _loc3_:int = _loc2_.lastIndexOf(".");
         this.var_784 = _loc2_.substr(_loc3_ + 1).toLowerCase();
         this.var_677 = _loc2_.substr(0,_loc3_);
      }
      
      protected function method_5649() : class_2105
      {
         var _loc1_:Number = 0;
         var _loc2_:int = _loc1_ - 1;
         while(_loc2_ >= 0)
         {
            if(var_212[_loc2_].supportsType(this.var_784))
            {
               return new var_212[_loc2_]();
            }
            _loc2_--;
         }
         return null;
      }
      
      private function method_4617(param1:*) : class_2105
      {
         var _loc2_:Number = 0;
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(var_212[_loc3_].supportsData(param1))
            {
               return new var_212[_loc3_]();
            }
            _loc3_--;
         }
         return null;
      }
      
      private function method_25(param1:URLLoader) : void
      {
         param1.removeEventListener(Event.COMPLETE,this.method_2907);
         param1.removeEventListener(IOErrorEvent.IO_ERROR,this.method_4922);
      }
      
      private function method_4922(param1:IOErrorEvent) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.currentTarget);
         this.method_25(_loc2_);
         if(hasEventListener(LoaderEvent.LOAD_ERROR))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.LOAD_ERROR,this.var_1272.url,true,param1.text));
         }
      }
      
      private function method_2907(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.currentTarget);
         this.method_25(_loc2_);
         this._data = _loc2_.data;
         if(this.var_1449)
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.const_1253));
         }
         else
         {
            this.parse(this._data);
         }
      }
      
      protected function parse(param1:*) : void
      {
         var _loc2_:* = null;
         if(!this._parser)
         {
            this._parser = this.method_4617(param1);
         }
         if(this._parser)
         {
            this._parser.addEventListener(class_2415.const_2819,this.method_1015);
            this._parser.addEventListener(class_2415.PARSE_ERROR,this.method_4143);
            this._parser.addEventListener(class_2415.const_2203,this.method_6260);
            this._parser.addEventListener(class_2123.const_963,this.method_531);
            this._parser.addEventListener(class_2123.const_269,this.method_3095);
            this._parser.addEventListener(class_2123.const_363,this.method_3095);
            this._parser.addEventListener(class_2123.const_3299,this.method_3095);
            this._parser.addEventListener(class_2123.const_2373,this.method_3095);
            this._parser.addEventListener(class_2123.const_54,this.method_3095);
            this._parser.addEventListener(class_2123.const_255,this.method_3095);
            this._parser.addEventListener(class_2123.const_2364,this.method_3095);
            this._parser.addEventListener(class_2123.const_2111,this.method_3095);
            this._parser.addEventListener(class_2123.const_814,this.method_3095);
            this._parser.addEventListener(class_2123.const_1065,this.method_3095);
            this._parser.addEventListener(class_2123.const_2878,this.method_3095);
            this._parser.addEventListener(class_2123.const_102,this.method_3095);
            this._parser.addEventListener(class_2123.const_736,this.method_3095);
            if(Boolean(this.var_1272) && Boolean(this.var_1272.url))
            {
               this._parser.arcane::var_677 = this.var_1272.url;
            }
            this._parser.method_810 = this.var_496;
            this._parser.method_5169(param1);
         }
         else
         {
            _loc2_ = "No parser defined. To enable all parsers for auto-detection, use Parsers.enableAllBundled()";
            if(Boolean(this.var_1272) && Boolean(this.var_1272.url))
            {
               _loc2_ += ", url: " + this.var_1272.url;
            }
            if(!hasEventListener(LoaderEvent.LOAD_ERROR))
            {
               throw new Error(_loc2_);
            }
            this.dispatchEvent(new LoaderEvent(LoaderEvent.LOAD_ERROR,"",true,_loc2_));
         }
      }
      
      private function method_4143(param1:class_2415) : void
      {
         if(hasEventListener(class_2415.PARSE_ERROR))
         {
            dispatchEvent(param1.clone());
         }
      }
      
      private function method_1015(param1:class_2415) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function method_3095(param1:class_2123) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function method_531(param1:class_2123) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      protected function method_6260(param1:class_2415) : void
      {
         this.dispatchEvent(new LoaderEvent(LoaderEvent.const_1253,this.url));
         this._parser.removeEventListener(class_2415.const_2819,this.method_1015);
         this._parser.removeEventListener(class_2415.const_2203,this.method_6260);
         this._parser.removeEventListener(class_2415.PARSE_ERROR,this.method_4143);
         this._parser.removeEventListener(class_2123.const_963,this.method_531);
         this._parser.removeEventListener(class_2123.const_269,this.method_3095);
         this._parser.removeEventListener(class_2123.const_363,this.method_3095);
         this._parser.removeEventListener(class_2123.const_3299,this.method_3095);
         this._parser.removeEventListener(class_2123.const_2373,this.method_3095);
         this._parser.removeEventListener(class_2123.const_54,this.method_3095);
         this._parser.removeEventListener(class_2123.const_255,this.method_3095);
         this._parser.removeEventListener(class_2123.const_2364,this.method_3095);
         this._parser.removeEventListener(class_2123.const_2111,this.method_3095);
         this._parser.removeEventListener(class_2123.const_814,this.method_3095);
         this._parser.removeEventListener(class_2123.const_1065,this.method_3095);
         this._parser.removeEventListener(class_2123.const_2878,this.method_3095);
         this._parser.removeEventListener(class_2123.const_102,this.method_3095);
         this._parser.removeEventListener(class_2123.const_736,this.method_3095);
      }
   }
}
