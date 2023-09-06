package spark.skins.spark
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.DataRenderer;
   import spark.components.Label;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Rect;
   
   public class VSliderSkinInnerClass0 extends DataRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1184053038labelDisplay:Label;
      
      private var _88844982outerDocument:VSliderSkin;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VSliderSkinInnerClass0()
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
         bindings = this._VSliderSkinInnerClass0_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_spark_skins_spark_VSliderSkinInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VSliderSkinInnerClass0[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minHeight = 24;
         this.minWidth = 40;
         this.x = 20;
         this.mxmlContent = [this._VSliderSkinInnerClass0_Rect1_c(),this._VSliderSkinInnerClass0_Label1_i()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         VSliderSkinInnerClass0._watcherSetupUtil = param1;
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
      
      private function _VSliderSkinInnerClass0_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VSliderSkinInnerClass0_SolidColor1_c();
         _loc1_.filters = [this._VSliderSkinInnerClass0_DropShadowFilter1_c()];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderSkinInnerClass0_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.9;
         return _loc1_;
      }
      
      private function _VSliderSkinInnerClass0_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.angle = 90;
         _loc1_.color = 10066329;
         _loc1_.distance = 3;
         return _loc1_;
      }
      
      private function _VSliderSkinInnerClass0_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _VSliderSkinInnerClass0_bindingsSetup() : Array
      {
         var _loc1_:* = [];
         _loc1_[0] = new Binding(this,null,null,"labelDisplay.text","data");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : VSliderSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:VSliderSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
