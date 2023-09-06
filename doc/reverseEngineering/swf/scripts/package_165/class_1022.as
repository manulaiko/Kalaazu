package package_165
{
   import flash.events.MouseEvent;
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
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;
   import package_150.class_988;
   import package_250.class_1539;
   import package_250.class_1540;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   import spark.components.VGroup;
   
   public class class_1022 extends class_1021 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _315970861groupDepth1:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1022()
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
         bindings = this.method_575();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_components_InstallationStatusViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1022[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5543);
         this.addEventListener("creationComplete",this.method_1307);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1022._watcherSetupUtil = param1;
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
      
      private function method_2763(param1:MouseEvent) : void
      {
         dispatchEvent(new class_988(class_988.SHOW_BUILD_TIME_SELECTION_POPUP));
      }
      
      private function method_5543() : Array
      {
         return [this.method_4994()];
      }
      
      private function method_4994() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_2549(),this.method_5077()];
         _loc1_.id = "groupDepth1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth1 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth1",this.groupDepth1);
         return _loc1_;
      }
      
      private function method_2549() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontFamily","EurostileTHea");
         _loc1_.setStyle("color",16763904);
         _loc1_.setStyle("paddingBottom",-4);
         _loc1_.id = "titleLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         titleLabel = _loc1_;
         BindingManager.executeBindings(this,"titleLabel",titleLabel);
         return _loc1_;
      }
      
      private function method_5077() : SkinnableContainer
      {
         var _loc1_:SkinnableContainer = new SkinnableContainer();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4208);
         _loc1_.setStyle("skinClass",DOViewContainerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_4208() : Array
      {
         return [this.method_1097()];
      }
      
      private function method_1097() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = -5;
         _loc1_.top = 3;
         _loc1_.mxmlContent = [this.method_5722(),this.method_4898(),this.method_2858(),this.method_2816(),this.method_4505()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5722() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingBottom = 6;
         _loc1_.verticalAlign = "bottom";
         _loc1_.mxmlContent = [this.method_3874(),this.method_4814()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3874() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 80;
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",15327423);
         _loc1_.id = "yourClanProgressLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         yourClanProgressLabel = _loc1_;
         BindingManager.executeBindings(this,"yourClanProgressLabel",yourClanProgressLabel);
         return _loc1_;
      }
      
      private function method_4814() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 20;
         _loc1_.setStyle("paddingRight",4);
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "yourClanProgressValue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         yourClanProgressValue = _loc1_;
         BindingManager.executeBindings(this,"yourClanProgressValue",yourClanProgressValue);
         return _loc1_;
      }
      
      private function method_4898() : ProgressBar
      {
         var _loc1_:ProgressBar = new ProgressBar();
         _loc1_.label = "";
         _loc1_.horizontalCenter = 0;
         _loc1_.mode = "manual";
         _loc1_.percentWidth = 100;
         _loc1_.height = 16;
         _loc1_.setStyle("barSkin",class_1540);
         _loc1_.setStyle("trackSkin",class_1539);
         _loc1_.id = "yourClanProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         yourClanProgress = _loc1_;
         BindingManager.executeBindings(this,"yourClanProgress",yourClanProgress);
         return _loc1_;
      }
      
      private function method_2858() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingBottom = 6;
         _loc1_.verticalAlign = "bottom";
         _loc1_.mxmlContent = [this.method_2601(),this.method_1985()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2601() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 80;
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",15327423);
         _loc1_.id = "leadingClanProgressLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         leadingClanProgressLabel = _loc1_;
         BindingManager.executeBindings(this,"leadingClanProgressLabel",leadingClanProgressLabel);
         return _loc1_;
      }
      
      private function method_1985() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 20;
         _loc1_.setStyle("paddingRight",4);
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "leadingClanProgressValue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         leadingClanProgressValue = _loc1_;
         BindingManager.executeBindings(this,"leadingClanProgressValue",leadingClanProgressValue);
         return _loc1_;
      }
      
      private function method_2816() : ProgressBar
      {
         var _loc1_:ProgressBar = new ProgressBar();
         _loc1_.label = "";
         _loc1_.horizontalCenter = 0;
         _loc1_.mode = "manual";
         _loc1_.percentWidth = 100;
         _loc1_.height = 16;
         _loc1_.setStyle("barSkin",class_1540);
         _loc1_.setStyle("trackSkin",class_1539);
         _loc1_.id = "leadingClanProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         leadingClanProgress = _loc1_;
         BindingManager.executeBindings(this,"leadingClanProgress",leadingClanProgress);
         return _loc1_;
      }
      
      private function method_4505() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this.method_5055(),this.method_4315(),this.method_1420()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5055() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.width = 215;
         _loc1_.top = 4;
         _loc1_.enabled = false;
         _loc1_.visible = true;
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = false;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.id = "buildButtonDisabled";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         buildButtonDisabled = _loc1_;
         BindingManager.executeBindings(this,"buildButtonDisabled",buildButtonDisabled);
         return _loc1_;
      }
      
      private function method_4315() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.width = 215;
         _loc1_.top = 4;
         _loc1_.enabled = true;
         _loc1_.visible = false;
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.method_4891);
         _loc1_.id = "buildButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         buildButton = _loc1_;
         BindingManager.executeBindings(this,"buildButton",buildButton);
         return _loc1_;
      }
      
      public function method_4891(param1:MouseEvent) : void
      {
         this.method_2763(param1);
      }
      
      private function method_1420() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.height = 25;
         _loc1_.top = 4;
         _loc1_.id = "tipButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         tipButton = _loc1_;
         BindingManager.executeBindings(this,"tipButton",tipButton);
         return _loc1_;
      }
      
      public function method_1307(param1:FlexEvent) : void
      {
         creationCompleteHandler(param1);
      }
      
      private function method_575() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = _yourClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"yourClanProgressLabel.toolTip");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:* = _yourClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"yourClanProgressValue.toolTip");
         var_5[2] = new Binding(this,function():String
         {
            var _loc1_:* = _yourClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"yourClanProgress.toolTip");
         var_5[3] = new Binding(this,function():String
         {
            var _loc1_:* = _leadingClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"leadingClanProgressLabel.toolTip");
         var_5[4] = new Binding(this,function():String
         {
            var _loc1_:* = _leadingClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"leadingClanProgressValue.toolTip");
         var_5[5] = new Binding(this,function():String
         {
            var _loc1_:* = _leadingClanModulesTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"leadingClanProgress.toolTip");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get groupDepth1() : VGroup
      {
         return this._315970861groupDepth1;
      }
      
      public function set groupDepth1(param1:VGroup) : void
      {
         var _loc2_:Object = this._315970861groupDepth1;
         if(_loc2_ !== param1)
         {
            this._315970861groupDepth1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupDepth1",_loc2_,param1));
            }
         }
      }
   }
}
