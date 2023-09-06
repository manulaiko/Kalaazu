package package_53
{
   import flash.utils.getDefinitionByName;
   import flashx.textLayout.formats.TextAlign;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class class_146 extends class_145 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_1759:Label;
      
      private var var_3708:Label;
      
      private var var_4146:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_146()
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
         bindings = this.method_3223();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_wordPuzzle_view_WordPuzzleWindowViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_146[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.styleName = "wordPuzzleWindow";
         this.height = 200;
         this.minHeight = 200;
         this.maxHeight = 230;
         this.width = 280;
         this.minWidth = 280;
         this.maxWidth = 340;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2553);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_146._watcherSetupUtil = param1;
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
            this.backgroundAlpha = 0;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function method_2553() : Array
      {
         return [this.method_2720()];
      }
      
      private function method_2720() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.top = 15;
         _loc1_.paddingBottom = 20;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 10;
         _loc1_.mxmlContent = [this.method_2673(),this.method_5658(),this.method_2689()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2673() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",13421772);
         _loc1_.id = "labelPuzzleStatus";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelPuzzleStatus = _loc1_;
         BindingManager.executeBindings(this,"labelPuzzleStatus",this.labelPuzzleStatus);
         return _loc1_;
      }
      
      private function method_5658() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("paddingTop",6);
         _loc1_.setStyle("fontSize",26);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "labelSolutionWord";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelSolutionWord = _loc1_;
         BindingManager.executeBindings(this,"labelSolutionWord",this.labelSolutionWord);
         return _loc1_;
      }
      
      private function method_2689() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",12303291);
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",0);
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",12);
         _loc1_.id = "labelPuzzleDescription";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelPuzzleDescription = _loc1_;
         BindingManager.executeBindings(this,"labelPuzzleDescription",this.labelPuzzleDescription);
         return _loc1_;
      }
      
      private function method_3223() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            labelPuzzleStatus.setStyle("textAlign",param1);
         },"labelPuzzleStatus.textAlign");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            labelSolutionWord.setStyle("textAlign",param1);
         },"labelSolutionWord.textAlign");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get labelPuzzleDescription() : Label
      {
         return this.var_1759;
      }
      
      public function set labelPuzzleDescription(param1:Label) : void
      {
         var _loc2_:Object = this.var_1759;
         if(_loc2_ !== param1)
         {
            this.var_1759 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelPuzzleDescription",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelPuzzleStatus() : Label
      {
         return this.var_3708;
      }
      
      public function set labelPuzzleStatus(param1:Label) : void
      {
         var _loc2_:Object = this.var_3708;
         if(_loc2_ !== param1)
         {
            this.var_3708 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelPuzzleStatus",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelSolutionWord() : Label
      {
         return this.var_4146;
      }
      
      public function set labelSolutionWord(param1:Label) : void
      {
         var _loc2_:Object = this.var_4146;
         if(_loc2_ !== param1)
         {
            this.var_4146 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelSolutionWord",_loc2_,param1));
            }
         }
      }
   }
}
