package package_4
{
   import flash.display.BitmapData;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase;
   import package_9.ResourceManager;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Image;
   import spark.components.Label;
   import spark.layouts.HorizontalAlign;
   import spark.layouts.VerticalAlign;
   import spark.skins.SparkSkin;
   
   public class class_1901 extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _DOTDMTabButtonSkin_HGroup1:HGroup;
      
      private var var_2955:SetProperty;
      
      private var var_1392:SetProperty;
      
      private var var_836:SetProperty;
      
      private var var_1981:SetProperty;
      
      private var var_1878:SetProperty;
      
      private var var_3642:SetProperty;
      
      private var var_35:SetProperty;
      
      private var _1641208108factionGraphic:Image;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1037832801tabBtnGraphic:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3739up:BitmapData;
      
      private var _1523975159upAndSelected:BitmapData;
      
      private var _3423444over:BitmapData;
      
      private var _1805195234overAndSelected:BitmapData;
      
      private var _3089570down:BitmapData;
      
      private var _827896720downAndSelected:BitmapData;
      
      private var _270940796disabled:BitmapData;
      
      private var _1893290358disabledAndSelected:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DOTabButtonBase;
      
      public function class_1901()
      {
         var watchers:Array;
         var var_1:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this.method_5265();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_DOTDMTabButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1901[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseChildren = false;
         this.buttonMode = true;
         this.mxmlContent = [this.method_6333()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.method_1758);
         states = [new State({
            "name":"up",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":12632256
            })]
         }),new State({
            "name":"upAndSelected",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777028
            })]
         }),new State({
            "name":"down",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":12632256
            })]
         }),new State({
            "name":"downAndSelected",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777028
            })]
         }),new State({
            "name":"over",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"overAndSelected",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777028
            })]
         }),new State({
            "name":"disabled",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777028
            })]
         }),new State({
            "name":"disabledAndSelected",
            "overrides":[this._DOTDMTabButtonSkin_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"tabBtnGraphic",
               "name":"source",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777028
            })]
         })];
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty1",this._DOTDMTabButtonSkin_SetProperty1);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty4",this._DOTDMTabButtonSkin_SetProperty4);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty5",this._DOTDMTabButtonSkin_SetProperty5);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty2",this._DOTDMTabButtonSkin_SetProperty2);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty3",this._DOTDMTabButtonSkin_SetProperty3);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty6",this._DOTDMTabButtonSkin_SetProperty6);
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_SetProperty7",this._DOTDMTabButtonSkin_SetProperty7);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1901._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         var _loc1_:String = getStyle("libID");
         var _loc2_:String = getStyle("upState");
         var _loc3_:String = getStyle("upAndSelectedState");
         var _loc4_:String = getStyle("overState");
         var _loc5_:String = getStyle("overAndSelectedState");
         var _loc6_:String = getStyle("downState");
         var _loc7_:String = getStyle("downAndSelectedState");
         var _loc8_:String = getStyle("disabledState");
         var _loc9_:String = getStyle("disabledAndSelectedState");
         var _loc10_:Boolean = Boolean(getStyle("scalable"));
         this.up = ResourceManager.getBitmapData(_loc1_,_loc2_);
         this.upAndSelected = ResourceManager.getBitmapData(_loc1_,_loc3_);
         this.over = ResourceManager.getBitmapData(_loc1_,_loc4_);
         this.overAndSelected = ResourceManager.getBitmapData(_loc1_,_loc5_);
         this.down = ResourceManager.getBitmapData(_loc1_,_loc6_);
         this.downAndSelected = ResourceManager.getBitmapData(_loc1_,_loc7_);
         this.disabled = ResourceManager.getBitmapData(_loc1_,_loc8_);
         this.disabledAndSelected = ResourceManager.getBitmapData(_loc1_,_loc9_);
      }
      
      private function method_6333() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this.method_2818(),this.method_355()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2818() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "tabBtnGraphic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabBtnGraphic = _loc1_;
         BindingManager.executeBindings(this,"tabBtnGraphic",this.tabBtnGraphic);
         return _loc1_;
      }
      
      private function method_355() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_2512(),this.method_5525()];
         _loc1_.id = "_DOTDMTabButtonSkin_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DOTDMTabButtonSkin_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_DOTDMTabButtonSkin_HGroup1",this._DOTDMTabButtonSkin_HGroup1);
         return _loc1_;
      }
      
      private function method_2512() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function method_5525() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "factionGraphic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.factionGraphic = _loc1_;
         BindingManager.executeBindings(this,"factionGraphic",this.factionGraphic);
         return _loc1_;
      }
      
      public function method_1758(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function method_5265() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():Object
         {
            return up;
         },null,"tabBtnGraphic.source");
         var_5[1] = new Binding(this,function():*
         {
            return upAndSelected;
         },null,"_DOTDMTabButtonSkin_SetProperty1.value");
         var_5[2] = new Binding(this,function():*
         {
            return over;
         },null,"_DOTDMTabButtonSkin_SetProperty2.value");
         var_5[3] = new Binding(this,function():*
         {
            return overAndSelected;
         },null,"_DOTDMTabButtonSkin_SetProperty3.value");
         var_5[4] = new Binding(this,function():*
         {
            return down;
         },null,"_DOTDMTabButtonSkin_SetProperty4.value");
         var_5[5] = new Binding(this,function():*
         {
            return downAndSelected;
         },null,"_DOTDMTabButtonSkin_SetProperty5.value");
         var_5[6] = new Binding(this,function():*
         {
            return disabled;
         },null,"_DOTDMTabButtonSkin_SetProperty6.value");
         var_5[7] = new Binding(this,function():*
         {
            return disabledAndSelected;
         },null,"_DOTDMTabButtonSkin_SetProperty7.value");
         var_5[8] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_DOTDMTabButtonSkin_HGroup1.horizontalAlign");
         var_5[9] = new Binding(this,function():String
         {
            var _loc1_:* = VerticalAlign.MIDDLE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_DOTDMTabButtonSkin_HGroup1.verticalAlign");
         var_5[10] = new Binding(this,function():Object
         {
            return hostComponent.factionGraphic;
         },null,"factionGraphic.source");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty1() : SetProperty
      {
         return this.var_2955;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_2955;
         if(_loc2_ !== param1)
         {
            this.var_2955 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty2() : SetProperty
      {
         return this.var_1392;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_1392;
         if(_loc2_ !== param1)
         {
            this.var_1392 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty3() : SetProperty
      {
         return this.var_836;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_836;
         if(_loc2_ !== param1)
         {
            this.var_836 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty4() : SetProperty
      {
         return this.var_1981;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_1981;
         if(_loc2_ !== param1)
         {
            this.var_1981 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty5() : SetProperty
      {
         return this.var_1878;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty5(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_1878;
         if(_loc2_ !== param1)
         {
            this.var_1878 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty6() : SetProperty
      {
         return this.var_3642;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty6(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_3642;
         if(_loc2_ !== param1)
         {
            this.var_3642 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOTDMTabButtonSkin_SetProperty7() : SetProperty
      {
         return this.var_35;
      }
      
      public function set _DOTDMTabButtonSkin_SetProperty7(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_35;
         if(_loc2_ !== param1)
         {
            this.var_35 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOTDMTabButtonSkin_SetProperty7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get factionGraphic() : Image
      {
         return this._1641208108factionGraphic;
      }
      
      public function set factionGraphic(param1:Image) : void
      {
         var _loc2_:Object = this._1641208108factionGraphic;
         if(_loc2_ !== param1)
         {
            this._1641208108factionGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"factionGraphic",_loc2_,param1));
            }
         }
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
      public function get tabBtnGraphic() : Image
      {
         return this._1037832801tabBtnGraphic;
      }
      
      public function set tabBtnGraphic(param1:Image) : void
      {
         var _loc2_:Object = this._1037832801tabBtnGraphic;
         if(_loc2_ !== param1)
         {
            this._1037832801tabBtnGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBtnGraphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get up() : BitmapData
      {
         return this._3739up;
      }
      
      private function set up(param1:BitmapData) : void
      {
         var _loc2_:Object = this._3739up;
         if(_loc2_ !== param1)
         {
            this._3739up = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"up",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get upAndSelected() : BitmapData
      {
         return this._1523975159upAndSelected;
      }
      
      private function set upAndSelected(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1523975159upAndSelected;
         if(_loc2_ !== param1)
         {
            this._1523975159upAndSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upAndSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get over() : BitmapData
      {
         return this._3423444over;
      }
      
      private function set over(param1:BitmapData) : void
      {
         var _loc2_:Object = this._3423444over;
         if(_loc2_ !== param1)
         {
            this._3423444over = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"over",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get overAndSelected() : BitmapData
      {
         return this._1805195234overAndSelected;
      }
      
      private function set overAndSelected(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1805195234overAndSelected;
         if(_loc2_ !== param1)
         {
            this._1805195234overAndSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overAndSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get down() : BitmapData
      {
         return this._3089570down;
      }
      
      private function set down(param1:BitmapData) : void
      {
         var _loc2_:Object = this._3089570down;
         if(_loc2_ !== param1)
         {
            this._3089570down = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"down",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get downAndSelected() : BitmapData
      {
         return this._827896720downAndSelected;
      }
      
      private function set downAndSelected(param1:BitmapData) : void
      {
         var _loc2_:Object = this._827896720downAndSelected;
         if(_loc2_ !== param1)
         {
            this._827896720downAndSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downAndSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get disabled() : BitmapData
      {
         return this._270940796disabled;
      }
      
      private function set disabled(param1:BitmapData) : void
      {
         var _loc2_:Object = this._270940796disabled;
         if(_loc2_ !== param1)
         {
            this._270940796disabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get disabledAndSelected() : BitmapData
      {
         return this._1893290358disabledAndSelected;
      }
      
      private function set disabledAndSelected(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1893290358disabledAndSelected;
         if(_loc2_ !== param1)
         {
            this._1893290358disabledAndSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disabledAndSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DOTabButtonBase
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DOTabButtonBase) : void
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
