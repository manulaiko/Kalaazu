package package_52
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
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import spark.components.HGroup;
   import spark.components.Label;
   
   public class class_143 extends class_142 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_3578:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_143()
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
         bindings = this.method_4977();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_countdownStatus_view_CountdownStatusWindowViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_143[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.styleName = "countDownStatusWindow";
         this.height = 110;
         this.minHeight = 110;
         this.maxHeight = 110;
         this.width = 320;
         this.minWidth = 320;
         this.maxWidth = 320;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1873);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_143._watcherSetupUtil = param1;
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
            this.resizable = false;
            this.backgroundAlpha = 0;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function method_1873() : Array
      {
         return [this.method_3987()];
      }
      
      private function method_3987() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.top = 15;
         _loc1_.paddingBottom = 20;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 10;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_6502()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_6502() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontFamily","EurostileTHea");
         _loc1_.setStyle("color",15262143);
         _loc1_.id = "countDownLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countDownLabel = _loc1_;
         BindingManager.executeBindings(this,"countDownLabel",this.countDownLabel);
         return _loc1_;
      }
      
      private function method_4977() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            countDownLabel.setStyle("textAlign",param1);
         },"countDownLabel.textAlign");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("label_countdownHalloweenNpcs");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"countDownLabel.text");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get countDownLabel() : Label
      {
         return this.var_3578;
      }
      
      public function set countDownLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_3578;
         if(_loc2_ !== param1)
         {
            this.var_3578 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countDownLabel",_loc2_,param1));
            }
         }
      }
   }
}
