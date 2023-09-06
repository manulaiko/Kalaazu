package package_20
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.darkorbit.class_18;
   import package_169.class_1039;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridItemRenderer;
   
   public class class_1544 extends GridItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_1322:VGroup;
      
      private var var_1122:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1544()
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
         bindings = this.method_3675();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_renderer_JackpotItemBaseRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1544[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this.method_3197()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1544._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:String = param1 as String;
         this.rowLabel.htmlText = _loc2_;
         var _loc3_:uint = Number(rowIndex) % 2 == 0 ? 0 : uint(class_1039.const_1551);
         this.rowLabel.graphics.beginFill(_loc3_);
         this.rowLabel.graphics.drawRect(0,0,width,height);
         this.rowLabel.graphics.endFill();
      }
      
      public function method_5985(param1:String) : void
      {
         this.columnLabelContainer.toolTip = param1;
      }
      
      private function method_3197() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.height = 24;
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_5368()];
         _loc1_.id = "columnLabelContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnLabelContainer = _loc1_;
         BindingManager.executeBindings(this,"columnLabelContainer",this.columnLabelContainer);
         return _loc1_;
      }
      
      private function method_5368() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.percentWidth = 100;
         _loc1_.selectable = false;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",13);
         _loc1_.id = "rowLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rowLabel = _loc1_;
         BindingManager.executeBindings(this,"rowLabel",this.rowLabel);
         return _loc1_;
      }
      
      private function method_3675() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_740;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            rowLabel.setStyle("fontFamily",param1);
         },"rowLabel.fontFamily");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get columnLabelContainer() : VGroup
      {
         return this.var_1322;
      }
      
      public function set columnLabelContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1322;
         if(_loc2_ !== param1)
         {
            this.var_1322 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnLabelContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowLabel() : Text
      {
         return this.var_1122;
      }
      
      public function set rowLabel(param1:Text) : void
      {
         var _loc2_:Object = this.var_1122;
         if(_loc2_ !== param1)
         {
            this.var_1122 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowLabel",_loc2_,param1));
            }
         }
      }
   }
}
