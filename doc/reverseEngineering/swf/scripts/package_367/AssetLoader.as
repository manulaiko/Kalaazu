package package_367
{
   import away3d.*;
   import flash.events.*;
   import flash.net.*;
   import package_199.*;
   import package_366.*;
   import package_368.*;
   
   public class AssetLoader extends EventDispatcher
   {
       
      
      private var _context:class_2110;
      
      private var _token:class_2409;
      
      private var var_2196:String;
      
      private var var_3769:Vector.<Function>;
      
      private var var_4000:Vector.<Function>;
      
      private var _stack:Vector.<class_2416>;
      
      private var var_3667:class_2416;
      
      private var var_2897:class_2416;
      
      private var var_790:String;
      
      public function AssetLoader()
      {
         super();
         this._stack = new Vector.<class_2416>();
         this.var_3769 = new Vector.<Function>();
         this.var_4000 = new Vector.<Function>();
      }
      
      public static function method_605(param1:Class) : void
      {
         class_2412.method_605(param1);
      }
      
      public static function method_2343(param1:Vector.<Class>) : void
      {
         class_2412.method_2343(param1);
      }
      
      public function get method_1865() : class_2416
      {
         return this.var_3667;
      }
      
      public function load(param1:URLRequest, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         if(!this._token)
         {
            this._token = new class_2409(this);
            this.var_2196 = param1.url = param1.url.replace(/\\/g,"/");
            this._context = param2;
            this.var_790 = param3;
            this.var_3667 = new class_2416("",param1,null,null);
            this.method_5140(this.var_3667,param4);
            return this._token;
         }
         return null;
      }
      
      public function loadData(param1:*, param2:String, param3:class_2110 = null, param4:String = null, param5:class_2105 = null) : class_2409
      {
         if(!this._token)
         {
            this._token = new class_2409(this);
            this.var_2196 = param2;
            this._context = param3;
            this.var_790 = param4;
            this.var_3667 = new class_2416(param2,null,param1,null);
            this.method_5140(this.var_3667,param5);
            return this._token;
         }
         return null;
      }
      
      private function method_674(param1:class_2105 = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_2897.method_728.length)
         {
            _loc2_ = this.var_2897.method_728.pop();
            this._stack.push(this.var_2897);
            this.method_5140(_loc2_);
         }
         else if(Boolean(this.var_2897.arcane::loader.parser) && Boolean(this.var_2897.arcane::loader.parser.method_3984))
         {
            this.var_2897.arcane::loader.parser.arcane::method_4486();
            this._stack.pop();
         }
         else if(this._stack.length)
         {
            _loc3_ = this.var_2897;
            this.var_2897 = this._stack.pop();
            if(_loc3_.arcane::success)
            {
               _loc3_.method_5358();
            }
            this.method_674(param1);
         }
         else
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.const_2719,this.var_2196));
         }
      }
      
      private function method_5140(param1:class_2416, param2:class_2105 = null) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = 0;
         if(Boolean(this._context) && this._context.method_810 != 0)
         {
            _loc4_ = uint(this._context.method_810);
         }
         this.var_2897 = param1;
         this.var_2897.arcane::loader = !!this._context ? this._context.method_6396(_loc4_) : new class_2412(_loc4_);
         this.addEventListeners(this.var_2897.arcane::loader);
         _loc3_ = this.var_2897.data;
         if(this._context && this.var_2897.request && Boolean(this._context.arcane::method_6142(this.var_2897.request.url)))
         {
            _loc3_ = this._context.arcane::method_4860(this.var_2897.request.url);
         }
         if(_loc3_)
         {
            if(this.var_2897.method_5288)
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.const_1253,this.var_2897.request.url,true));
               this.var_2897.arcane::setData(_loc3_);
               this.var_2897.method_5358();
               this.method_674();
            }
            else
            {
               this.var_2897.arcane::loader.parseData(_loc3_,param2,this.var_2897.request);
            }
         }
         else
         {
            param1.request.url = this.method_4487(param1);
            this.var_2897.arcane::loader.load(param1.request,param2,this.var_2897.method_5288);
         }
      }
      
      private function method_607(param1:String, param2:String) : String
      {
         if(param2.charAt(0) == "/")
         {
            param2 = param2.substr(1);
         }
         if(param1.length == 0)
         {
            return param2;
         }
         if(param1.charAt(param1.length - 1) == "/")
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         return param1.concat("/",param2);
      }
      
      private function method_4487(param1:class_2416) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = param1.request.url;
         if(Boolean(this._context) && Boolean(this._context.method_5804(_loc4_)))
         {
            return this._context.method_1190(_loc4_);
         }
         if(_loc4_ == this.var_2196)
         {
            return _loc4_;
         }
         _loc2_ = new RegExp(/^[a-zA-Z]{3,4}:\/\//);
         if(_loc4_.charAt(0) == "/")
         {
            if(Boolean(this._context) && Boolean(this._context.method_2162))
            {
               return this.method_607(this._context.method_2890,_loc4_);
            }
            return _loc4_;
         }
         if(_loc2_.test(_loc4_))
         {
            if(Boolean(this._context) && Boolean(this._context.method_3524))
            {
               _loc5_ = _loc4_.replace(_loc2_);
               return this.method_607(this._context.method_2890,_loc5_);
            }
         }
         if(Boolean(this._context) && Boolean(this._context.method_2890))
         {
            _loc3_ = this._context.method_2890;
            return this.method_607(_loc3_,_loc4_);
         }
         _loc3_ = this.var_2196.substring(0,this.var_2196.lastIndexOf("/") + 1);
         return this.method_607(_loc3_,_loc4_);
      }
      
      private function method_6075(param1:class_2412) : void
      {
         var _loc2_:int = 0;
         if(!this.var_2897)
         {
            return;
         }
         var _loc3_:int = int(param1.method_728.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_2897.method_728[_loc2_] = param1.method_728[_loc2_];
            _loc2_++;
         }
         param1.method_728.length = 0;
         this._stack.push(this.var_2897);
         this.method_674();
      }
      
      private function method_500(param1:LoaderEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc5_:Number = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         var _loc3_:* = this.var_2897 != this.var_3667;
         var _loc4_:class_2412 = class_2412(param1.target);
         this.removeEventListeners(_loc4_);
         param1 = new LoaderEvent(LoaderEvent.LOAD_ERROR,this.var_2196,_loc3_,param1.message);
         if(hasEventListener(LoaderEvent.LOAD_ERROR))
         {
            dispatchEvent(param1);
            _loc2_ = true;
         }
         else
         {
            _loc6_ = uint(this.var_3769.length);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = this.var_3769[_loc5_];
               _loc2_ = _loc2_ || Boolean(_loc7_(param1));
               _loc5_++;
            }
         }
         if(_loc2_)
         {
            if(_loc3_ && !param1.isDefaultPrevented())
            {
               this.var_2897.method_6056();
               this.method_674();
               return;
            }
            this.dispose();
            return;
         }
         throw new Error(param1.message);
      }
      
      private function method_1246(param1:class_2415) : void
      {
         var _loc2_:Boolean = false;
         var _loc5_:Number = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         var _loc3_:* = this.var_2897 != this.var_3667;
         var _loc4_:class_2412 = class_2412(param1.target);
         this.removeEventListeners(_loc4_);
         param1 = new class_2415(class_2415.PARSE_ERROR,param1.message);
         if(hasEventListener(class_2415.PARSE_ERROR))
         {
            dispatchEvent(param1);
            _loc2_ = true;
         }
         else
         {
            _loc6_ = uint(this.var_4000.length);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = this.var_4000[_loc5_];
               _loc2_ = _loc2_ || Boolean(_loc7_(param1));
               _loc5_++;
            }
         }
         if(_loc2_)
         {
            this.dispose();
            return;
         }
         throw new Error(param1.message);
      }
      
      private function method_3095(param1:class_2123) : void
      {
         if(param1.type == class_2123.const_269)
         {
            if(this.var_2897)
            {
               this.var_2897.assets.push(param1.asset);
            }
            param1.asset.method_4647(param1.asset.name,this.var_790);
         }
         if(!this.var_2897.method_6049)
         {
            dispatchEvent(param1.clone());
         }
      }
      
      private function method_1015(param1:class_2415) : void
      {
         var _loc2_:class_2412 = class_2412(param1.currentTarget);
         if(Boolean(this._context) && !this._context.method_3980)
         {
            _loc2_.parser.arcane::method_4486();
         }
         else
         {
            this.method_6075(_loc2_);
         }
      }
      
      private function method_3129(param1:LoaderEvent) : void
      {
         var _loc2_:class_2412 = class_2412(param1.target);
         this.var_2897.arcane::setData(_loc2_.data);
         this.var_2897.arcane::success = true;
         dispatchEvent(new LoaderEvent(LoaderEvent.const_1253,param1.url));
         this.removeEventListeners(_loc2_);
         if(Boolean(_loc2_.method_728.length) && (!this._context || Boolean(this._context.method_3980)))
         {
            this.method_6075(_loc2_);
         }
         else
         {
            this.method_674();
         }
      }
      
      private function method_531(param1:class_2123) : void
      {
         param1.asset.name = this.var_2897.method_4249(param1.asset);
         dispatchEvent(param1);
      }
      
      private function addEventListeners(param1:class_2412) : void
      {
         param1.addEventListener(LoaderEvent.const_1253,this.method_3129);
         param1.addEventListener(LoaderEvent.LOAD_ERROR,this.method_500);
         param1.addEventListener(class_2123.const_963,this.method_531);
         param1.addEventListener(class_2123.const_269,this.method_3095);
         param1.addEventListener(class_2123.const_363,this.method_3095);
         param1.addEventListener(class_2123.const_3299,this.method_3095);
         param1.addEventListener(class_2123.const_2373,this.method_3095);
         param1.addEventListener(class_2123.const_54,this.method_3095);
         param1.addEventListener(class_2123.const_255,this.method_3095);
         param1.addEventListener(class_2123.const_2364,this.method_3095);
         param1.addEventListener(class_2123.const_2111,this.method_3095);
         param1.addEventListener(class_2123.const_814,this.method_3095);
         param1.addEventListener(class_2123.const_1065,this.method_3095);
         param1.addEventListener(class_2123.const_2878,this.method_3095);
         param1.addEventListener(class_2123.const_102,this.method_3095);
         param1.addEventListener(class_2123.const_736,this.method_3095);
         param1.addEventListener(class_2415.const_2819,this.method_1015);
         param1.addEventListener(class_2415.PARSE_ERROR,this.method_1246);
      }
      
      private function removeEventListeners(param1:class_2412) : void
      {
         param1.removeEventListener(class_2415.const_2819,this.method_1015);
         param1.removeEventListener(LoaderEvent.const_1253,this.method_3129);
         param1.removeEventListener(LoaderEvent.LOAD_ERROR,this.method_500);
         param1.removeEventListener(class_2123.const_963,this.method_531);
         param1.removeEventListener(class_2123.const_269,this.method_3095);
         param1.removeEventListener(class_2123.const_363,this.method_3095);
         param1.removeEventListener(class_2123.const_3299,this.method_3095);
         param1.removeEventListener(class_2123.const_2373,this.method_3095);
         param1.removeEventListener(class_2123.const_54,this.method_3095);
         param1.removeEventListener(class_2123.const_255,this.method_3095);
         param1.removeEventListener(class_2123.const_2364,this.method_3095);
         param1.removeEventListener(class_2123.const_2111,this.method_3095);
         param1.removeEventListener(class_2123.const_814,this.method_3095);
         param1.removeEventListener(class_2123.const_1065,this.method_3095);
         param1.removeEventListener(class_2123.const_2878,this.method_3095);
         param1.removeEventListener(class_2123.const_102,this.method_3095);
         param1.removeEventListener(class_2123.const_736,this.method_3095);
         param1.removeEventListener(class_2415.PARSE_ERROR,this.method_1246);
      }
      
      public function stop() : void
      {
         this.dispose();
      }
      
      private function dispose() : void
      {
         this.var_3769 = null;
         this.var_4000 = null;
         this._context = null;
         this._token = null;
         this._stack = null;
         if(Boolean(this.var_2897) && Boolean(this.var_2897.arcane::loader))
         {
            this.removeEventListeners(this.var_2897.arcane::loader);
         }
         this.var_2897 = null;
      }
      
      arcane function method_4584(param1:Function) : void
      {
         if(this.var_4000.indexOf(param1) < 0)
         {
            this.var_4000.push(param1);
         }
      }
      
      arcane function method_1846(param1:Function) : void
      {
         if(this.var_3769.indexOf(param1) < 0)
         {
            this.var_3769.push(param1);
         }
      }
   }
}
