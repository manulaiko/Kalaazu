package package_162
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.ProgressBar;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import package_155.class_999;
   import package_339.class_1904;
   import package_339.class_1905;
   import package_339.class_1906;
   import package_339.class_1907;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   
   public class class_1535 extends class_1534 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_2428:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1535()
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
         bindings = this.method_4167();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInstallation_components_ModuleHolsterWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1535[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 38;
         this.height = 55;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3784);
         this.addEventListener("creationComplete",this.method_5007);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1535._watcherSetupUtil = param1;
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
      
      private function method_3784() : Array
      {
         return [this.method_77(),this.method_2617(),this.method_2334()];
      }
      
      private function method_77() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.top = 6;
         _loc1_.left = 3;
         _loc1_.mxmlContent = [this.method_1465()];
         _loc1_.id = "modules";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         modules = _loc1_;
         BindingManager.executeBindings(this,"modules",modules);
         return _loc1_;
      }
      
      private function method_1465() : class_999
      {
         var _loc1_:class_999 = new class_999();
         _loc1_.moduleType = 0;
         _loc1_.id = "moduleItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         moduleItem = _loc1_;
         BindingManager.executeBindings(this,"moduleItem",moduleItem);
         return _loc1_;
      }
      
      private function method_2617() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 5;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this.method_3587()];
         _loc1_.id = "installingModuleBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.installingModuleBar = _loc1_;
         BindingManager.executeBindings(this,"installingModuleBar",this.installingModuleBar);
         return _loc1_;
      }
      
      private function method_3587() : ProgressBar
      {
         var _loc1_:ProgressBar = new ProgressBar();
         _loc1_.height = 8;
         _loc1_.label = "";
         _loc1_.horizontalCenter = 0;
         _loc1_.mode = "manual";
         _loc1_.percentWidth = 80;
         _loc1_.visible = false;
         _loc1_.setStyle("trackHeight",9);
         _loc1_.setStyle("maskSkin",class_1905);
         _loc1_.setStyle("barSkin",class_1907);
         _loc1_.id = "progressBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         progressBar = _loc1_;
         BindingManager.executeBindings(this,"progressBar",progressBar);
         return _loc1_;
      }
      
      private function method_2334() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.visible = false;
         _loc1_.top = 39;
         _loc1_.percentWidth = 100;
         _loc1_.right = 4;
         _loc1_.left = 4;
         _loc1_.mxmlContent = [this.method_5380(),this.method_6026()];
         _loc1_.id = "installedModuleBars";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         installedModuleBars = _loc1_;
         BindingManager.executeBindings(this,"installedModuleBars",installedModuleBars);
         return _loc1_;
      }
      
      private function method_5380() : ProgressBar
      {
         var _loc1_:ProgressBar = new ProgressBar();
         _loc1_.height = 4;
         _loc1_.percentWidth = 100;
         _loc1_.label = "";
         _loc1_.mode = "manual";
         _loc1_.setStyle("barSkin",class_1906);
         _loc1_.setStyle("trackSkin",class_1904);
         _loc1_.id = "healthBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         healthBar = _loc1_;
         BindingManager.executeBindings(this,"healthBar",healthBar);
         return _loc1_;
      }
      
      private function method_6026() : ProgressBar
      {
         var _loc1_:ProgressBar = new ProgressBar();
         _loc1_.height = 4;
         _loc1_.percentWidth = 100;
         _loc1_.label = "";
         _loc1_.mode = "manual";
         _loc1_.setStyle("barSkin",class_1907);
         _loc1_.setStyle("trackSkin",class_1904);
         _loc1_.id = "sheildBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         sheildBar = _loc1_;
         BindingManager.executeBindings(this,"sheildBar",sheildBar);
         return _loc1_;
      }
      
      public function method_5007(param1:FlexEvent) : void
      {
         handleCreationComplete();
      }
      
      private function method_4167() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():int
         {
            return _slotId;
         },null,"moduleItem.slotId");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get installingModuleBar() : Group
      {
         return this.var_2428;
      }
      
      public function set installingModuleBar(param1:Group) : void
      {
         var _loc2_:Object = this.var_2428;
         if(_loc2_ !== param1)
         {
            this.var_2428 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installingModuleBar",_loc2_,param1));
            }
         }
      }
   }
}
