package net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
   import package_9.ResourceManager;
   import spark.components.Button;
   import spark.skins.SparkSkin;
   
   public class DOVScrollBarThumbSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1736983259thumbImage:Scale9GridImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1085546909_scrollThumbBitmapData:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:Button;
      
      public function DOVScrollBarThumbSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DOVScrollBarThumbSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_scroller_vScroll_DOVScrollBarThumbSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DOVScrollBarThumbSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DOVScrollBarThumbSkin_Scale9GridImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DOVScrollBarThumbSkin._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
         this.thumbImage.scale9Grid = new Rectangle(10,4,1,1);
         this._scrollThumbBitmapData = ResourceManager.getBitmapData(getStyle("libID"),getStyle("thumb"));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(Math.floor(param1),Math.floor(param2));
         this.thumbImage.scale9Grid = new Rectangle(10,4,1,1);
      }
      
      private function _DOVScrollBarThumbSkin_Scale9GridImage1_i() : Scale9GridImage
      {
         var _loc1_:Scale9GridImage = new Scale9GridImage();
         _loc1_.top = 3;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.minWidth = 16;
         _loc1_.minHeight = 13;
         _loc1_.id = "thumbImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbImage = _loc1_;
         BindingManager.executeBindings(this,"thumbImage",this.thumbImage);
         return _loc1_;
      }
      
      private function _DOVScrollBarThumbSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return _scrollThumbBitmapData;
         },null,"thumbImage.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbImage() : Scale9GridImage
      {
         return this._1736983259thumbImage;
      }
      
      public function set thumbImage(param1:Scale9GridImage) : void
      {
         var _loc2_:Object = this._1736983259thumbImage;
         if(_loc2_ !== param1)
         {
            this._1736983259thumbImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _scrollThumbBitmapData() : BitmapData
      {
         return this._1085546909_scrollThumbBitmapData;
      }
      
      private function set _scrollThumbBitmapData(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1085546909_scrollThumbBitmapData;
         if(_loc2_ !== param1)
         {
            this._1085546909_scrollThumbBitmapData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_scrollThumbBitmapData",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
