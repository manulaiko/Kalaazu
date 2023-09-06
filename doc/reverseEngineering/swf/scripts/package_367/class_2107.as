package package_367
{
   import away3d.*;
   import away3d.library.*;
   import flash.events.*;
   import flash.net.*;
   import package_199.*;
   import package_293.*;
   import package_295.*;
   import package_304.*;
   import package_305.*;
   import package_364.*;
   import package_366.*;
   import package_368.*;
   import package_436.*;
   
   public class class_2107 extends class_1752
   {
       
      
      private var var_1963:Vector.<AssetLoader>;
      
      private var var_3629:Boolean;
      
      private var var_4611:String;
      
      private var _assets:Vector.<class_1751>;
      
      public function class_2107(param1:Boolean = true, param2:String = null)
      {
         this._assets = new Vector.<class_1751>();
         super();
         this.var_1963 = new Vector.<AssetLoader>();
         this.var_3629 = param1;
         this.var_4611 = param2;
      }
      
      public static function method_605(param1:Class) : void
      {
         class_2412.method_605(param1);
      }
      
      public static function method_2343(param1:Vector.<Class>) : void
      {
         class_2412.method_2343(param1);
      }
      
      public function load(param1:URLRequest, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.var_3629)
         {
            _loc5_ = (_loc6_ = AssetLibraryBundle.getInstance(this.var_4611)).load(param1,param2,param3,param4);
         }
         else
         {
            _loc7_ = new AssetLoader();
            this.var_1963.push(_loc7_);
            _loc5_ = _loc7_.load(param1,param2,param3,param4);
         }
         _loc5_.addEventListener(LoaderEvent.const_2719,this.method_5069);
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
         _loc5_.arcane::_loader.arcane::method_1846(this.name_14);
         return _loc5_;
      }
      
      public function loadData(param1:*, param2:class_2110 = null, param3:String = null, param4:class_2105 = null) : class_2409
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.var_3629)
         {
            _loc5_ = (_loc6_ = AssetLibraryBundle.getInstance(this.var_4611)).loadData(param1,param2,param3,param4);
         }
         else
         {
            _loc7_ = new AssetLoader();
            this.var_1963.push(_loc7_);
            _loc5_ = _loc7_.loadData(param1,"",param2,param3,param4);
         }
         _loc5_.addEventListener(LoaderEvent.const_2719,this.method_5069);
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
         _loc5_.arcane::_loader.arcane::method_1846(this.name_14);
         return _loc5_;
      }
      
      public function method_2832() : void
      {
         var _loc1_:int = 0;
         var _loc3_:* = null;
         if(this.var_3629)
         {
            _loc3_ = AssetLibraryBundle.getInstance(this.var_4611);
            _loc3_.method_6365();
            this.var_1963 = null;
            return;
         }
         var _loc2_:int = int(this.var_1963.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.method_25(this.var_1963[_loc1_]);
            this.var_1963[_loc1_].stop();
            this.var_1963[_loc1_] = null;
            _loc1_++;
         }
         this.var_1963 = null;
      }
      
      private function method_25(param1:EventDispatcher) : void
      {
         param1.removeEventListener(LoaderEvent.const_2719,this.method_5069);
         param1.removeEventListener(LoaderEvent.LOAD_ERROR,this.name_14);
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
      }
      
      private function method_3095(param1:class_2123) : void
      {
         var _loc2_:* = null;
         if(param1.type == class_2123.const_269)
         {
            this._assets.push(param1.asset);
            switch(param1.asset.assetType)
            {
               case class_2131.const_1414:
                  _loc2_ = class_2102(param1.asset);
                  break;
               case class_2131.CONTAINER:
                  _loc2_ = class_1752(param1.asset);
                  break;
               case class_2131.const_3013:
                  _loc2_ = class_2114(param1.asset);
                  break;
               case class_2131.const_563:
                  _loc2_ = class_2417(param1.asset);
                  break;
               case class_2131.const_2510:
                  _loc2_ = class_2418(param1.asset);
                  break;
               case class_2131.CAMERA:
                  _loc2_ = class_1767(param1.asset);
                  break;
               case class_2131.const_2748:
                  _loc2_ = SegmentSet(param1.asset);
            }
            if(Boolean(_loc2_) && _loc2_.parent == null)
            {
               addChild(_loc2_);
            }
         }
         this.dispatchEvent(param1.clone());
      }
      
      private function method_4143(param1:class_2415) : Boolean
      {
         if(hasEventListener(class_2415.PARSE_ERROR))
         {
            dispatchEvent(param1);
            return true;
         }
         return false;
      }
      
      private function name_14(param1:LoaderEvent) : Boolean
      {
         if(hasEventListener(LoaderEvent.LOAD_ERROR))
         {
            dispatchEvent(param1);
            return true;
         }
         return false;
      }
      
      private function method_5069(param1:Event) : void
      {
         this.method_25(EventDispatcher(param1.currentTarget));
         this.dispatchEvent(param1.clone());
      }
      
      public function get assets() : Vector.<class_1751>
      {
         return this._assets;
      }
   }
}
