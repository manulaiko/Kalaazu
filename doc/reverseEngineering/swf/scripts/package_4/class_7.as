package package_4
{
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
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
   import spark.components.Group;
   import spark.components.Image;
   import spark.skins.SparkSkin;
   
   public class class_7 extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_4683:SetProperty;
      
      private var var_990:SetProperty;
      
      private var _100313435image:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_2608:BitmapData;
      
      private var var_3969:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_7()
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
         bindings = this.method_4255();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_TDMRewardIconSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_7[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this.method_578()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.method_3141);
         this.addEventListener("mouseOver",this.method_2331);
         this.addEventListener("mouseOut",this.method_1363);
         states = [new State({
            "name":"normal",
            "overrides":[this._TDMRewardIconSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"image",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"hover",
            "overrides":[this._TDMRewardIconSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"image",
               "name":"source",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_TDMRewardIconSkin_SetProperty1",this._TDMRewardIconSkin_SetProperty1);
         BindingManager.executeBindings(this,"_TDMRewardIconSkin_SetProperty2",this._TDMRewardIconSkin_SetProperty2);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_7._watcherSetupUtil = param1;
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
      
      private function handleCreationComplete() : void
      {
         var _loc1_:String = getStyle("libID");
         var _loc2_:String = getStyle("hoverKey");
         var _loc3_:String = getStyle("normalKey");
         this.stdImage = ResourceManager.getBitmapData(_loc1_,_loc3_);
         this.hoverImage = ResourceManager.getBitmapData(_loc1_,_loc2_);
      }
      
      private function method_578() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_5404()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5404() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      public function method_3141(param1:FlexEvent) : void
      {
         this.handleCreationComplete();
      }
      
      public function method_2331(param1:MouseEvent) : void
      {
         currentState = "hover";
      }
      
      public function method_1363(param1:MouseEvent) : void
      {
         currentState = "normal";
      }
      
      private function method_4255() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():*
         {
            return stdImage;
         },null,"_TDMRewardIconSkin_SetProperty1.value");
         var_5[1] = new Binding(this,function():*
         {
            return hoverImage;
         },null,"_TDMRewardIconSkin_SetProperty2.value");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMRewardIconSkin_SetProperty1() : SetProperty
      {
         return this.var_4683;
      }
      
      public function set _TDMRewardIconSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_4683;
         if(_loc2_ !== param1)
         {
            this.var_4683 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMRewardIconSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMRewardIconSkin_SetProperty2() : SetProperty
      {
         return this.var_990;
      }
      
      public function set _TDMRewardIconSkin_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_990;
         if(_loc2_ !== param1)
         {
            this.var_990 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMRewardIconSkin_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Image
      {
         return this._100313435image;
      }
      
      public function set image(param1:Image) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get stdImage() : BitmapData
      {
         return this.var_2608;
      }
      
      private function set stdImage(param1:BitmapData) : void
      {
         var _loc2_:Object = this.var_2608;
         if(_loc2_ !== param1)
         {
            this.var_2608 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stdImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get hoverImage() : BitmapData
      {
         return this.var_3969;
      }
      
      private function set hoverImage(param1:BitmapData) : void
      {
         var _loc2_:Object = this.var_3969;
         if(_loc2_ !== param1)
         {
            this.var_3969 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoverImage",_loc2_,param1));
            }
         }
      }
   }
}
