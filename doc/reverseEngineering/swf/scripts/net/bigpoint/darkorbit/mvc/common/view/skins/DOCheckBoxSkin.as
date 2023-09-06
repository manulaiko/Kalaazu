package net.bigpoint.darkorbit.mvc.common.view.skins
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
   import mx.states.State;
   import package_9.ResourceManager;
   import spark.components.CheckBox;
   import spark.components.Image;
   import spark.skins.SparkSkin;
   
   public class DOCheckBoxSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _820795665_DOCheckBoxSkin_SetProperty1:SetProperty;
      
      private var _820795664_DOCheckBoxSkin_SetProperty2:SetProperty;
      
      private var _820795663_DOCheckBoxSkin_SetProperty3:SetProperty;
      
      private var _820795662_DOCheckBoxSkin_SetProperty4:SetProperty;
      
      private var _820795661_DOCheckBoxSkin_SetProperty5:SetProperty;
      
      private var _820795660_DOCheckBoxSkin_SetProperty6:SetProperty;
      
      private var _820795659_DOCheckBoxSkin_SetProperty7:SetProperty;
      
      private var _820795658_DOCheckBoxSkin_SetProperty8:SetProperty;
      
      private var _1383154258boxGFX:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _742313895checked:BitmapData;
      
      private var _1840852242unchecked:BitmapData;
      
      private var _355183037checked_hovered:BitmapData;
      
      private var _1255923062unchecked_hovered:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:CheckBox;
      
      public function DOCheckBoxSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DOCheckBoxSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_DOCheckBoxSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DOCheckBoxSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DOCheckBoxSkin_Image1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___DOCheckBoxSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[this._DOCheckBoxSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty8 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[this._DOCheckBoxSkin_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"boxGFX",
               "name":"source",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty1",this._DOCheckBoxSkin_SetProperty1);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty4",this._DOCheckBoxSkin_SetProperty4);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty3",this._DOCheckBoxSkin_SetProperty3);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty2",this._DOCheckBoxSkin_SetProperty2);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty5",this._DOCheckBoxSkin_SetProperty5);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty8",this._DOCheckBoxSkin_SetProperty8);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty7",this._DOCheckBoxSkin_SetProperty7);
         BindingManager.executeBindings(this,"_DOCheckBoxSkin_SetProperty6",this._DOCheckBoxSkin_SetProperty6);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DOCheckBoxSkin._watcherSetupUtil = param1;
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
         var _loc2_:String = getStyle("checkedState");
         var _loc3_:String = getStyle("uncheckedState");
         var _loc4_:String = getStyle("checkedHoveredState");
         var _loc5_:String = getStyle("uncheckedHoveredState");
         var _loc6_:Boolean = getStyle("scalable");
         this.checked = ResourceManager.getBitmapData(_loc1_,_loc2_);
         this.unchecked = ResourceManager.getBitmapData(_loc1_,_loc3_);
         this.checked_hovered = ResourceManager.getBitmapData(_loc1_,_loc4_);
         this.unchecked_hovered = ResourceManager.getBitmapData(_loc1_,_loc5_);
      }
      
      private function _DOCheckBoxSkin_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "boxGFX";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boxGFX = _loc1_;
         BindingManager.executeBindings(this,"boxGFX",this.boxGFX);
         return _loc1_;
      }
      
      public function ___DOCheckBoxSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _DOCheckBoxSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return checked;
         },null,"boxGFX.source");
         result[1] = new Binding(this,function():*
         {
            return unchecked;
         },null,"_DOCheckBoxSkin_SetProperty1.value");
         result[2] = new Binding(this,function():*
         {
            return unchecked;
         },null,"_DOCheckBoxSkin_SetProperty2.value");
         result[3] = new Binding(this,function():*
         {
            return unchecked_hovered;
         },null,"_DOCheckBoxSkin_SetProperty3.value");
         result[4] = new Binding(this,function():*
         {
            return unchecked_hovered;
         },null,"_DOCheckBoxSkin_SetProperty4.value");
         result[5] = new Binding(this,function():*
         {
            return checked;
         },null,"_DOCheckBoxSkin_SetProperty5.value");
         result[6] = new Binding(this,function():*
         {
            return checked;
         },null,"_DOCheckBoxSkin_SetProperty6.value");
         result[7] = new Binding(this,function():*
         {
            return checked_hovered;
         },null,"_DOCheckBoxSkin_SetProperty7.value");
         result[8] = new Binding(this,function():*
         {
            return checked_hovered;
         },null,"_DOCheckBoxSkin_SetProperty8.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty1() : SetProperty
      {
         return this._820795665_DOCheckBoxSkin_SetProperty1;
      }
      
      public function set _DOCheckBoxSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795665_DOCheckBoxSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._820795665_DOCheckBoxSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty2() : SetProperty
      {
         return this._820795664_DOCheckBoxSkin_SetProperty2;
      }
      
      public function set _DOCheckBoxSkin_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795664_DOCheckBoxSkin_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._820795664_DOCheckBoxSkin_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty3() : SetProperty
      {
         return this._820795663_DOCheckBoxSkin_SetProperty3;
      }
      
      public function set _DOCheckBoxSkin_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795663_DOCheckBoxSkin_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._820795663_DOCheckBoxSkin_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty4() : SetProperty
      {
         return this._820795662_DOCheckBoxSkin_SetProperty4;
      }
      
      public function set _DOCheckBoxSkin_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795662_DOCheckBoxSkin_SetProperty4;
         if(_loc2_ !== param1)
         {
            this._820795662_DOCheckBoxSkin_SetProperty4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty5() : SetProperty
      {
         return this._820795661_DOCheckBoxSkin_SetProperty5;
      }
      
      public function set _DOCheckBoxSkin_SetProperty5(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795661_DOCheckBoxSkin_SetProperty5;
         if(_loc2_ !== param1)
         {
            this._820795661_DOCheckBoxSkin_SetProperty5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty6() : SetProperty
      {
         return this._820795660_DOCheckBoxSkin_SetProperty6;
      }
      
      public function set _DOCheckBoxSkin_SetProperty6(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795660_DOCheckBoxSkin_SetProperty6;
         if(_loc2_ !== param1)
         {
            this._820795660_DOCheckBoxSkin_SetProperty6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty7() : SetProperty
      {
         return this._820795659_DOCheckBoxSkin_SetProperty7;
      }
      
      public function set _DOCheckBoxSkin_SetProperty7(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795659_DOCheckBoxSkin_SetProperty7;
         if(_loc2_ !== param1)
         {
            this._820795659_DOCheckBoxSkin_SetProperty7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOCheckBoxSkin_SetProperty8() : SetProperty
      {
         return this._820795658_DOCheckBoxSkin_SetProperty8;
      }
      
      public function set _DOCheckBoxSkin_SetProperty8(param1:SetProperty) : void
      {
         var _loc2_:Object = this._820795658_DOCheckBoxSkin_SetProperty8;
         if(_loc2_ !== param1)
         {
            this._820795658_DOCheckBoxSkin_SetProperty8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOCheckBoxSkin_SetProperty8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boxGFX() : Image
      {
         return this._1383154258boxGFX;
      }
      
      public function set boxGFX(param1:Image) : void
      {
         var _loc2_:Object = this._1383154258boxGFX;
         if(_loc2_ !== param1)
         {
            this._1383154258boxGFX = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boxGFX",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get checked() : BitmapData
      {
         return this._742313895checked;
      }
      
      private function set checked(param1:BitmapData) : void
      {
         var _loc2_:Object = this._742313895checked;
         if(_loc2_ !== param1)
         {
            this._742313895checked = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checked",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get unchecked() : BitmapData
      {
         return this._1840852242unchecked;
      }
      
      private function set unchecked(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1840852242unchecked;
         if(_loc2_ !== param1)
         {
            this._1840852242unchecked = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unchecked",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get checked_hovered() : BitmapData
      {
         return this._355183037checked_hovered;
      }
      
      private function set checked_hovered(param1:BitmapData) : void
      {
         var _loc2_:Object = this._355183037checked_hovered;
         if(_loc2_ !== param1)
         {
            this._355183037checked_hovered = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checked_hovered",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get unchecked_hovered() : BitmapData
      {
         return this._1255923062unchecked_hovered;
      }
      
      private function set unchecked_hovered(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1255923062unchecked_hovered;
         if(_loc2_ !== param1)
         {
            this._1255923062unchecked_hovered = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unchecked_hovered",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : CheckBox
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:CheckBox) : void
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
