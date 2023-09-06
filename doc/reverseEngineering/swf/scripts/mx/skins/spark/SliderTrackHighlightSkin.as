package mx.skins.spark
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.graphics.SolidColor;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class SliderTrackHighlightSkin extends Skin implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SliderTrackHighlightSkin_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SliderTrackHighlightSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var var_1:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._SliderTrackHighlightSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_mx_skins_spark_SliderTrackHighlightSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SliderTrackHighlightSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 11;
         this.width = 200;
         this.mxmlContent = [this._SliderTrackHighlightSkin_Rect1_c()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SliderTrackHighlightSkin._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.disabledAlpha = 0.5;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _SliderTrackHighlightSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.height = 4;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._SliderTrackHighlightSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SliderTrackHighlightSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.35;
         this._SliderTrackHighlightSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_SliderTrackHighlightSkin_SolidColor1",this._SliderTrackHighlightSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _SliderTrackHighlightSkin_bindingsSetup() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():uint
         {
            return getStyle("accentColor");
         },null,"_SliderTrackHighlightSkin_SolidColor1.color");
         return var_5;
      }
   }
}
