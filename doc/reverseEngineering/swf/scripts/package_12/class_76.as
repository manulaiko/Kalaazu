package package_12
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   
   public class class_76 extends SkinnableContainer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_1795:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_119:String;
      
      private var var_2098:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_76()
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
         bindings = this.method_183();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreTableSkinableHeaderContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_76[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3888);
         this.addEventListener("creationComplete",this.method_5990);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_76._watcherSetupUtil = param1;
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
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.headerLabel.setStyle("color",getStyle("fontColor"));
      }
      
      private function method_3888() : Array
      {
         return [this.method_4204()];
      }
      
      private function method_4204() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "headerLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerLabel = _loc1_;
         BindingManager.executeBindings(this,"headerLabel",this.headerLabel);
         return _loc1_;
      }
      
      public function method_5990(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function method_183() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,null,null,"headerLabel.text","headerText");
         var_5[1] = new Binding(this,function():String
         {
            return "left" == undefined ? null : String("left");
         },function(param1:String):void
         {
            headerLabel.setStyle("textAlign",param1);
         },"headerLabel.textAlign");
         var_5[2] = new Binding(this,function():Number
         {
            return Number(getStyle("paddingTop")) || false;
         },function(param1:Number):void
         {
            headerLabel.setStyle("paddingTop",param1);
         },"headerLabel.paddingTop");
         var_5[3] = new Binding(this,function():Number
         {
            return Number(getStyle("paddingRight")) || false;
         },function(param1:Number):void
         {
            headerLabel.setStyle("paddingRight",param1);
         },"headerLabel.paddingRight");
         var_5[4] = new Binding(this,function():Number
         {
            return Number(getStyle("paddingBottom")) || false;
         },function(param1:Number):void
         {
            headerLabel.setStyle("paddingBottom",param1);
         },"headerLabel.paddingBottom");
         var_5[5] = new Binding(this,function():Number
         {
            return Number(getStyle("paddingLeft")) || false;
         },function(param1:Number):void
         {
            headerLabel.setStyle("paddingLeft",param1);
         },"headerLabel.paddingLeft");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get headerLabel() : Label
      {
         return this.var_1795;
      }
      
      public function set headerLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_1795;
         if(_loc2_ !== param1)
         {
            this.var_1795 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerText() : String
      {
         return this.var_119;
      }
      
      public function set headerText(param1:String) : void
      {
         var _loc2_:Object = this.var_119;
         if(_loc2_ !== param1)
         {
            this.var_119 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnIndex() : int
      {
         return this.var_2098;
      }
      
      public function set columnIndex(param1:int) : void
      {
         var _loc2_:Object = this.var_2098;
         if(_loc2_ !== param1)
         {
            this.var_2098 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnIndex",_loc2_,param1));
            }
         }
      }
   }
}
