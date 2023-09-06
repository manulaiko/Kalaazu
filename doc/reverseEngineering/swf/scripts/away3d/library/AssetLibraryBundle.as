package away3d.library
{
   import away3d.arcane;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import package_199.LoaderEvent;
   import package_199.class_2123;
   import package_199.class_2415;
   import package_293.class_1749;
   import package_293.class_1751;
   import package_366.class_2105;
   import package_367.AssetLoader;
   import package_368.class_2110;
   import package_368.class_2409;
   import package_368.class_2412;
   import package_432.class_2410;
   import package_432.class_2584;
   import package_433.class_2411;
   import package_433.class_2582;
   import package_433.class_2583;
   
   public class AssetLibraryBundle extends EventDispatcher
   {
       
      
      private var var_1963:Vector.<AssetLoader>;
      
      private var var_1862:class_2411;
      
      private var var_2592:String;
      
      private var _assets:Vector.<class_1751>;
      
      private var var_4725:Object;
      
      private var var_2483:Boolean;
      
      public function AssetLibraryBundle(param1:AssetLibraryBundleSingletonEnforcer)
      {
         super();
         param1 = param1;
         this._assets = new Vector.<class_1751>();
         this.var_4725 = {};
         this.var_1963 = new Vector.<AssetLoader>();
         this.method_2201 = class_2583.IGNORE.create();
         this.method_4175 = class_2582.const_582;
      }
      
      public static function getInstance(param1:String = "default") : AssetLibraryBundle
      {
         if(!param1)
         {
            param1 = "default";
         }
         if(!AssetLibrary.arcane::_instances.hasOwnProperty(param1))
         {
            AssetLibrary.arcane::_instances[param1] = new AssetLibraryBundle(new AssetLibraryBundleSingletonEnforcer());
         }
         return AssetLibrary.arcane::_instances[param1];
      }
      
      public function method_605(param1:Class) : void
      {
         class_2412.method_605(param1);
      }
      
      public function method_2343(param1:Vector.<Class>) : void
      {
         class_2412.method_2343(param1);
      }
      
      public function get method_2201() : class_2411
      {
         return this.var_1862;
      }
      
      public function set method_2201(param1:class_2411) : void
      {
         if(!param1)
         {
            throw new Error("namingStrategy must not be null. To ignore naming, use AssetLibrary.IGNORE");
         }
         this.var_1862 = param1.create();
      }
      
      public function get method_4175() : String
      {
         return this.var_2592;
      }
      
      public function set method_4175(param1:String) : void
      {
         this.var_2592 = param1;
      }
      
      public function method_850(param1:String = null, param2:String = null, param3:Function = null) : class_2410
      {
         return new class_2410(this._assets,param1,param2,param3);
      }
      
      public function load(param1:URLRequest, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         return this.method_4068(param1,param2,param3,param4);
      }
      
      public function loadData(param1:*, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         return this.method_1494(param1,param2,param3,param4);
      }
      
      public function method_2945(param1:String, param2:String = null) : class_1751
      {
         if(this.var_2483)
         {
            this.method_2387();
         }
         param2 = param2 || true;
         if(!this.var_4725.hasOwnProperty(param2))
         {
            return null;
         }
         return this.var_4725[param2][param1];
      }
      
      public function method_4427(param1:class_1751) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._assets.indexOf(param1) >= 0)
         {
            return;
         }
         _loc3_ = this.method_2945(param1.name,param1.method_2094);
         _loc2_ = param1.method_2094 || true;
         if(_loc3_ != null)
         {
            this.var_1862.method_5147(param1,_loc3_,this.var_4725[_loc2_],this.var_2592);
         }
         param1.id = class_2584.createUID();
         this._assets.push(param1);
         if(!this.var_4725.hasOwnProperty(_loc2_))
         {
            this.var_4725[_loc2_] = {};
         }
         this.var_4725[_loc2_][param1.name] = param1;
         param1.addEventListener(class_2123.const_2616,this.method_4090);
         param1.addEventListener(class_2123.const_147,this.method_3835);
      }
      
      public function method_308(param1:class_1751, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         this.method_1444(param1);
         param1.removeEventListener(class_2123.const_2616,this.method_4090);
         param1.removeEventListener(class_2123.const_147,this.method_3835);
         _loc3_ = this._assets.indexOf(param1);
         if(_loc3_ >= 0)
         {
            this._assets.splice(_loc3_,1);
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      public function method_3521(param1:String, param2:String = null, param3:Boolean = true) : class_1751
      {
         var _loc4_:class_1751;
         if(_loc4_ = this.method_2945(param1,param2))
         {
            this.method_308(_loc4_,param3);
         }
         return _loc4_;
      }
      
      public function method_5663(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            for each(_loc2_ in this._assets)
            {
               _loc2_.dispose();
            }
         }
         this._assets.length = 0;
         this.method_2387();
      }
      
      public function method_5220(param1:String = null, param2:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Number = 0;
         _loc5_ = this._assets.concat();
         this._assets.length = 0;
         param1 = param1 || true;
         for each(_loc4_ in _loc5_)
         {
            if(_loc4_.method_2094 == param1)
            {
               if(param2)
               {
                  _loc4_.dispose();
               }
               this.method_1444(_loc4_,false);
            }
            else
            {
               var _loc8_:*;
               this._assets[_loc8_ = _loc3_++] = _loc4_;
            }
         }
         if(this.var_4725.hasOwnProperty(param1))
         {
            delete this.var_4725[param1];
         }
      }
      
      private function method_1444(param1:class_1751, param2:Boolean = true) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         if(this.var_2483)
         {
            this.method_2387();
         }
         if(this.var_4725.hasOwnProperty(param1.method_2094))
         {
            if(this.var_4725[param1.method_2094].hasOwnProperty(param1.name))
            {
               delete this.var_4725[param1.method_2094][param1.name];
            }
            if(param2)
            {
               _loc4_ = true;
               var _loc5_:int = 0;
               var _loc6_:* = this.var_4725[param1.method_2094];
               for(_loc3_ in _loc6_)
               {
                  _loc4_ = false;
               }
               if(_loc4_)
               {
                  delete this.var_4725[param1.method_2094];
               }
            }
         }
      }
      
      private function method_4068(param1:URLRequest, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         var _loc5_:AssetLoader = new AssetLoader();
         if(!this.var_1963)
         {
            this.var_1963 = new Vector.<AssetLoader>();
         }
         this.var_1963.push(_loc5_);
         _loc5_.addEventListener(LoaderEvent.const_2719,this.method_3499);
         _loc5_.addEventListener(LoaderEvent.const_1253,this.method_6079);
         _loc5_.addEventListener(class_2123.const_963,this.method_531);
         _loc5_.addEventListener(class_2123.const_269,this.method_3095);
         _loc5_.addEventListener(class_2123.const_363,this.method_3095);
         _loc5_.addEventListener(class_2123.const_3299,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2373,this.method_3095);
         _loc5_.addEventListener(class_2123.const_54,this.method_3095);
         _loc5_.addEventListener(class_2123.const_255,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2364,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2111,this.method_3095);
         _loc5_.addEventListener(class_2123.const_814,this.method_3095);
         _loc5_.addEventListener(class_2123.const_1065,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2878,this.method_3095);
         _loc5_.addEventListener(class_2123.const_102,this.method_3095);
         _loc5_.addEventListener(class_2123.const_736,this.method_3095);
         _loc5_.arcane::method_1846(this.method_2417);
         _loc5_.arcane::method_4584(this.method_2054);
         return _loc5_.load(param1,param2,param3,param4);
      }
      
      public function method_6365() : void
      {
         var _loc1_:int = 0;
         if(!this.var_1963)
         {
            this.var_1963 = new Vector.<AssetLoader>();
         }
         var _loc2_:int = int(this.var_1963.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.method_5786(this.var_1963[_loc1_]);
            _loc1_++;
         }
         this.var_1963 = null;
      }
      
      private function method_1494(param1:*, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         var _loc5_:AssetLoader = new AssetLoader();
         if(!this.var_1963)
         {
            this.var_1963 = new Vector.<AssetLoader>();
         }
         this.var_1963.push(_loc5_);
         _loc5_.addEventListener(LoaderEvent.const_2719,this.method_3499);
         _loc5_.addEventListener(LoaderEvent.const_1253,this.method_6079);
         _loc5_.addEventListener(class_2123.const_963,this.method_531);
         _loc5_.addEventListener(class_2123.const_269,this.method_3095);
         _loc5_.addEventListener(class_2123.const_363,this.method_3095);
         _loc5_.addEventListener(class_2123.const_3299,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2373,this.method_3095);
         _loc5_.addEventListener(class_2123.const_54,this.method_3095);
         _loc5_.addEventListener(class_2123.const_255,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2364,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2111,this.method_3095);
         _loc5_.addEventListener(class_2123.const_814,this.method_3095);
         _loc5_.addEventListener(class_2123.const_1065,this.method_3095);
         _loc5_.addEventListener(class_2123.const_2878,this.method_3095);
         _loc5_.addEventListener(class_2123.const_102,this.method_3095);
         _loc5_.addEventListener(class_2123.const_736,this.method_3095);
         _loc5_.arcane::method_1846(this.method_2417);
         _loc5_.arcane::method_4584(this.method_2054);
         return _loc5_.loadData(param1,"",param2,param3,param4);
      }
      
      private function method_2387() : void
      {
         var _loc1_:* = null;
         this.var_4725 = {};
         this._assets.fixed = true;
         for each(_loc1_ in this._assets)
         {
            if(!this.var_4725.hasOwnProperty(_loc1_.method_2094))
            {
               this.var_4725[_loc1_.method_2094] = {};
            }
            this.var_4725[_loc1_.method_2094][_loc1_.name] = _loc1_;
         }
         this._assets.fixed = false;
         this.var_2483 = false;
      }
      
      private function method_6079(param1:LoaderEvent) : void
      {
         if(hasEventListener(LoaderEvent.const_1253))
         {
            dispatchEvent(param1);
         }
      }
      
      private function method_2417(param1:LoaderEvent) : Boolean
      {
         if(hasEventListener(LoaderEvent.LOAD_ERROR))
         {
            dispatchEvent(param1);
            return true;
         }
         return false;
      }
      
      private function method_2054(param1:class_2415) : Boolean
      {
         if(hasEventListener(class_2415.PARSE_ERROR))
         {
            dispatchEvent(param1);
            return true;
         }
         return false;
      }
      
      private function method_3095(param1:class_2123) : void
      {
         if(param1.type == class_2123.const_269)
         {
            this.method_4427(param1.asset);
         }
         dispatchEvent(param1.clone());
      }
      
      private function method_531(param1:class_2123) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function method_3499(param1:LoaderEvent) : void
      {
         var _loc2_:AssetLoader = AssetLoader(param1.target);
         this.method_5786(_loc2_);
         var _loc3_:int = int(this.var_1963.indexOf(_loc2_));
         this.var_1963.splice(_loc3_,1);
         dispatchEvent(param1.clone());
      }
      
      private function method_5786(param1:AssetLoader) : void
      {
         param1.removeEventListener(LoaderEvent.LOAD_ERROR,this.method_2417);
         param1.removeEventListener(LoaderEvent.const_2719,this.method_3499);
         param1.removeEventListener(LoaderEvent.const_1253,this.method_6079);
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
         param1.stop();
      }
      
      private function method_4090(param1:class_2123) : void
      {
         var _loc4_:* = null;
         var _loc2_:class_1751 = class_1751(param1.currentTarget);
         var _loc3_:class_1751 = this.method_2945(_loc2_.method_2094,_loc2_.name);
         if(_loc3_ != null)
         {
            this.var_1862.method_5147(_loc2_,_loc3_,this.var_4725[_loc2_.method_2094],this.var_2592);
         }
         else
         {
            if((_loc4_ = this.var_4725[param1.asset.method_2094]) == null)
            {
               return;
            }
            _loc4_[param1.method_6012] = null;
            _loc4_[param1.asset.name] = param1.asset;
         }
      }
      
      private function method_3835(param1:class_2123) : void
      {
         dispatchEvent(param1.clone());
      }
   }
}

class AssetLibraryBundleSingletonEnforcer
{
    
   
   function AssetLibraryBundleSingletonEnforcer()
   {
      super();
   }
}
