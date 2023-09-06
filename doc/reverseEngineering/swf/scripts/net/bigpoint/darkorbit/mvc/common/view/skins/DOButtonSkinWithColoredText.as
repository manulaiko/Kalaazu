package net.bigpoint.darkorbit.mvc.common.view.skins
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.MyScale9GridImage;
   import package_9.ResourceManager;
   import spark.components.Group;
   import spark.components.Label;
   import spark.skins.SparkSkin;
   
   public class DOButtonSkinWithColoredText extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _740856233_DOButtonSkinWithColoredText_SetProperty1:SetProperty;
      
      private var _740856234_DOButtonSkinWithColoredText_SetProperty2:SetProperty;
      
      private var _740856235_DOButtonSkinWithColoredText_SetProperty3:SetProperty;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1404868679scale9Graphic:MyScale9GridImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1039745817normal:BitmapData;
      
      private var _3423444over:BitmapData;
      
      private var _3089570down:BitmapData;
      
      private var _270940796disabled:BitmapData;
      
      private var scale9Rect:Rectangle;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DOButtonBase;
      
      public function DOButtonSkinWithColoredText()
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
         bindings = this._DOButtonSkinWithColoredText_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_DOButtonSkinWithColoredTextWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DOButtonSkinWithColoredText[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DOButtonSkinWithColoredText_Group1_c(),this._DOButtonSkinWithColoredText_Label1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___DOButtonSkinWithColoredText_SparkSkin1_creationComplete);
         this.addEventListener("stateChangeComplete",this.___DOButtonSkinWithColoredText_SparkSkin1_stateChangeComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[this._DOButtonSkinWithColoredText_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"scale9Graphic",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"over",
            "overrides":[this._DOButtonSkinWithColoredText_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"scale9Graphic",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"disabled",
            "overrides":[this._DOButtonSkinWithColoredText_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"scale9Graphic",
               "name":"source",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_DOButtonSkinWithColoredText_SetProperty2",this._DOButtonSkinWithColoredText_SetProperty2);
         BindingManager.executeBindings(this,"_DOButtonSkinWithColoredText_SetProperty1",this._DOButtonSkinWithColoredText_SetProperty1);
         BindingManager.executeBindings(this,"_DOButtonSkinWithColoredText_SetProperty3",this._DOButtonSkinWithColoredText_SetProperty3);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DOButtonSkinWithColoredText._watcherSetupUtil = param1;
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
      
      protected function init() : void
      {
         var _loc7_:* = null;
         var _loc1_:String = getStyle("libID");
         var _loc2_:String = getStyle("normalState");
         var _loc3_:String = getStyle("overState");
         var _loc4_:String = getStyle("downState");
         var _loc5_:String = getStyle("disabledState");
         var _loc6_:Boolean = getStyle("scalable");
         this.normal = ResourceManager.getBitmapData(_loc1_,_loc2_);
         this.over = ResourceManager.getBitmapData(_loc1_,_loc3_);
         this.down = ResourceManager.getBitmapData(_loc1_,_loc4_);
         this.disabled = ResourceManager.getBitmapData(_loc1_,_loc5_);
         if(_loc6_)
         {
            _loc7_ = (getStyle("scale9rect") as String).split(",");
            this.scale9Rect = new Rectangle(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
            this.scale9Graphic.scale9Grid = this.scale9Rect;
         }
      }
      
      private function handleStateChangeComplete() : void
      {
         if(this.scale9Rect)
         {
            this.scale9Graphic.scale9Grid = this.scale9Rect;
         }
      }
      
      private function _DOButtonSkinWithColoredText_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._DOButtonSkinWithColoredText_MyScale9GridImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DOButtonSkinWithColoredText_MyScale9GridImage1_i() : MyScale9GridImage
      {
         var _loc1_:MyScale9GridImage = new MyScale9GridImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "scale9Graphic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scale9Graphic = _loc1_;
         BindingManager.executeBindings(this,"scale9Graphic",this.scale9Graphic);
         return _loc1_;
      }
      
      private function _DOButtonSkinWithColoredText_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      public function ___DOButtonSkinWithColoredText_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___DOButtonSkinWithColoredText_SparkSkin1_stateChangeComplete(param1:FlexEvent) : void
      {
         this.handleStateChangeComplete();
      }
      
      private function _DOButtonSkinWithColoredText_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return normal;
         },null,"scale9Graphic.source");
         result[1] = new Binding(this,function():*
         {
            return over;
         },null,"_DOButtonSkinWithColoredText_SetProperty1.value");
         result[2] = new Binding(this,function():*
         {
            return down;
         },null,"_DOButtonSkinWithColoredText_SetProperty2.value");
         result[3] = new Binding(this,function():*
         {
            return disabled;
         },null,"_DOButtonSkinWithColoredText_SetProperty3.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOButtonSkinWithColoredText_SetProperty1() : SetProperty
      {
         return this._740856233_DOButtonSkinWithColoredText_SetProperty1;
      }
      
      public function set _DOButtonSkinWithColoredText_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._740856233_DOButtonSkinWithColoredText_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._740856233_DOButtonSkinWithColoredText_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOButtonSkinWithColoredText_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOButtonSkinWithColoredText_SetProperty2() : SetProperty
      {
         return this._740856234_DOButtonSkinWithColoredText_SetProperty2;
      }
      
      public function set _DOButtonSkinWithColoredText_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._740856234_DOButtonSkinWithColoredText_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._740856234_DOButtonSkinWithColoredText_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOButtonSkinWithColoredText_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DOButtonSkinWithColoredText_SetProperty3() : SetProperty
      {
         return this._740856235_DOButtonSkinWithColoredText_SetProperty3;
      }
      
      public function set _DOButtonSkinWithColoredText_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._740856235_DOButtonSkinWithColoredText_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._740856235_DOButtonSkinWithColoredText_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DOButtonSkinWithColoredText_SetProperty3",_loc2_,param1));
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
      public function get scale9Graphic() : MyScale9GridImage
      {
         return this._1404868679scale9Graphic;
      }
      
      public function set scale9Graphic(param1:MyScale9GridImage) : void
      {
         var _loc2_:Object = this._1404868679scale9Graphic;
         if(_loc2_ !== param1)
         {
            this._1404868679scale9Graphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scale9Graphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get normal() : BitmapData
      {
         return this._1039745817normal;
      }
      
      private function set normal(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1039745817normal;
         if(_loc2_ !== param1)
         {
            this._1039745817normal = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normal",_loc2_,param1));
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
      public function get hostComponent() : DOButtonBase
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DOButtonBase) : void
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
