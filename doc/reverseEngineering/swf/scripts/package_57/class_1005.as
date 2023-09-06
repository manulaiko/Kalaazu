package package_57
{
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.HSlider;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.events.SliderEvent;
   import package_27.class_1007;
   import package_27.class_82;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   
   public class class_1005 extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundListItemRenderer_Button1:Button;
      
      public var _SoundListItemRenderer_Label1:Label;
      
      public var _SoundListItemRenderer_Label2:Label;
      
      public var _SoundListItemRenderer_Label3:Label;
      
      private var var_2782:HSlider;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1005()
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
         bindings = this.method_4769();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_soundTool_view_SoundListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1005[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 0;
         this.percentWidth = 100;
         this.mxmlContent = [this.method_4428()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1005._watcherSetupUtil = param1;
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
      
      [Bindable(event="dataChange")]
      protected function get pattern() : class_1007
      {
         return data as class_1007;
      }
      
      protected function method_5827() : void
      {
         this.pattern.method_1533(this.hSlider.value);
      }
      
      protected function name_92() : void
      {
         if(this.pattern)
         {
            class_82.playSoundEffect(this.pattern.getPatternID());
         }
      }
      
      protected function getButtonText() : String
      {
         return "Play";
      }
      
      private function method_4428() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this.method_906(),this.method_5205(),this.method_377(),this.method_5962(),this.method_4787()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_906() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SoundListItemRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundListItemRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundListItemRenderer_Label1",this._SoundListItemRenderer_Label1);
         return _loc1_;
      }
      
      private function method_5205() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SoundListItemRenderer_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundListItemRenderer_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundListItemRenderer_Label2",this._SoundListItemRenderer_Label2);
         return _loc1_;
      }
      
      private function method_377() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SoundListItemRenderer_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundListItemRenderer_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_SoundListItemRenderer_Label3",this._SoundListItemRenderer_Label3);
         return _loc1_;
      }
      
      private function method_5962() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.addEventListener("click",this.method_6276);
         _loc1_.id = "_SoundListItemRenderer_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundListItemRenderer_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundListItemRenderer_Button1",this._SoundListItemRenderer_Button1);
         return _loc1_;
      }
      
      public function method_6276(param1:MouseEvent) : void
      {
         this.name_92();
      }
      
      private function method_4787() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.percentWidth = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 10;
         _loc1_.snapInterval = 0.1;
         _loc1_.tickInterval = 10;
         _loc1_.labels = [0,10];
         _loc1_.allowTrackClick = true;
         _loc1_.liveDragging = true;
         _loc1_.setStyle("dataTipPlacement","top");
         _loc1_.setStyle("tickColor",3289650);
         _loc1_.addEventListener("change",this.method_6203);
         _loc1_.id = "hSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hSlider = _loc1_;
         BindingManager.executeBindings(this,"hSlider",this.hSlider);
         return _loc1_;
      }
      
      public function method_6203(param1:SliderEvent) : void
      {
         this.method_5827();
      }
      
      private function method_4769() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:String = "SoundBank: undefined";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundListItemRenderer_Label1.text");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:String = "Key: undefined";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundListItemRenderer_Label2.text");
         var_5[2] = new Binding(this,function():String
         {
            var _loc1_:String = "Volume: undefined";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundListItemRenderer_Label3.text");
         var_5[3] = new Binding(this,function():String
         {
            var _loc1_:* = getButtonText();
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundListItemRenderer_Button1.label");
         var_5[4] = new Binding(this,function():Number
         {
            return pattern.method_1088();
         },null,"hSlider.value");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get hSlider() : HSlider
      {
         return this.var_2782;
      }
      
      public function set hSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this.var_2782;
         if(_loc2_ !== param1)
         {
            this.var_2782 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hSlider",_loc2_,param1));
            }
         }
      }
   }
}
